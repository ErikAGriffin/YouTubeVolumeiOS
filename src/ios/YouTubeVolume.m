#import "YouTubeVolume.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation YouTubeVolume

// this method is executed when the app loads because of the onload param in plugin.xml
- (void)pluginInitialize {
    NSLog(@"YouTubeVolume initialzed.");
}

- (void)setVolume:(CDVInvokedUrlCommand*)command
{
  CDVPluginResult* pluginResult = nil;
  CGFloat newVolume = [[command.arguments objectAtIndex:0] floatValue];

  // Normalize volume.
  if (newVolume > 1.0f) {
      newVolume = 1.0f;
  } else if (newVolume < 0.0f) {
      newVolume = 0.0f;
  }

  NSLog(@"Setting the music player volume to %f",newVolume);
  [[MPMusicPlayerController applicationMusicPlayer] setVolume: newVolume];

  // pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
} // end setVolume

@end
