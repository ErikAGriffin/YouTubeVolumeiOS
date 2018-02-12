var exec = require('cordova/exec');

exports.setVolume = function (floatVol, error) {
    if (error === nil) {
        error = function(msg) {
            console.error("YouTubeVolume: Failed to set volume!");
            console.error(msg);
        };
    }
    exec(function() {}, error, 'YouTubeVolume', 'setVolume', [floatVol]);
};
