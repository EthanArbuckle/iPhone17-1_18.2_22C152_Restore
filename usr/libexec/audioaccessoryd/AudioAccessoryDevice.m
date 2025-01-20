@interface AudioAccessoryDevice
- (BOOL)updateWithAADeviceRecord:(id)a3;
@end

@implementation AudioAccessoryDevice

- (BOOL)updateWithAADeviceRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allowNoiseManagementOff];
  if (_os_feature_enabled_impl()
    && v5 != [(AudioAccessoryDevice *)self listeningModeOffAllowed])
  {
    [(AudioAccessoryDevice *)self setListeningModeOffAllowed:v5];
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  if (_os_feature_enabled_impl())
  {
    v7 = [v4 audiogramCreationTimestamp];
    if (v7)
    {
      v8 = [(AudioAccessoryDevice *)self audiogramEnrolledTimestamp];
      unsigned __int8 v9 = [v7 isEqualToDate:v8];

      if ((v9 & 1) == 0)
      {
        [(AudioAccessoryDevice *)self setAudiogramEnrolledTimestamp:v7];
        int v6 = 1;
      }
    }
  }
  id v10 = [v4 headGestureMode];
  if (v10 != [(AudioAccessoryDevice *)self headGestureToggle])
  {
    [(AudioAccessoryDevice *)self setHeadGestureToggle:v10];
    int v6 = 1;
  }
  id v11 = [v4 acceptReplyPlayPauseConfig];
  if (v11 != [(AudioAccessoryDevice *)self acceptReplyPlayPauseConfig])
  {
    [(AudioAccessoryDevice *)self setAcceptReplyPlayPauseConfig:v11];
    int v6 = 1;
  }
  id v12 = [v4 declineDismissSkipConfig];
  if (v12 == [(AudioAccessoryDevice *)self declineDismissSkipConfig])
  {
    if (!v6)
    {
      BOOL v13 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    [(AudioAccessoryDevice *)self setDeclineDismissSkipConfig:v12];
  }
  if (dword_100260EA0 <= 30)
  {
    if (dword_100260EA0 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  BOOL v13 = 1;
LABEL_27:

  return v13;
}

@end