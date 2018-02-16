#import "YouTubeVolume.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation YouTubeVolume

// this method is executed when the app loads because of the onload param in plugin.xml
- (void)pluginInitialize {
    // This hides the volume change popup.
    // Later I will use this to control the volume as well.
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame: CGRectZero];
    volumeView.showsRouteButton = NO;
    [self.viewController.view addSubview: volumeView];
    NSLog(@"YouTubeVolume initialzed.");
    // Also, it may be prudent to attach to the rootView instead:
    // UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
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
