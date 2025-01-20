@interface RMAudioListenerPoseEngineSession
@end

@implementation RMAudioListenerPoseEngineSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceStateTimer, 0);
  objc_storeStrong((id *)&self->_lidAngleTimer, 0);
  objc_storeStrong((id *)&self->_cameraPauseControlTimer, 0);
  objc_storeStrong((id *)&self->_statusTimer, 0);

  objc_storeStrong((id *)&self->_mediaSession, 0);
}

@end