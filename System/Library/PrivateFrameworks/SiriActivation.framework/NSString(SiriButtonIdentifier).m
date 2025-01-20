@interface NSString(SiriButtonIdentifier)
+ (__CFString)stringWithSiriButtonIdentifier:()SiriButtonIdentifier;
@end

@implementation NSString(SiriButtonIdentifier)

+ (__CFString)stringWithSiriButtonIdentifier:()SiriButtonIdentifier
{
  if (a3 <= 99)
  {
    v4 = @"SiriButtonIdentifierLongPressUndefined";
    switch(a3)
    {
      case 0:
        goto LABEL_48;
      case 1:
        v4 = @"SiriButtonIdentifierLongPressHomeButton";
        break;
      case 2:
        v4 = @"SiriButtonIdentifierLongPressLockButton";
        break;
      case 3:
        v4 = @"SiriButtonIdentifierLongPressBTHeadset";
        break;
      case 4:
        v4 = @"SiriButtonIdentifierLongPressWiredMic";
        break;
      case 5:
        v4 = @"SiriButtonIdentifierLongPressCarPlayAppDockButton";
        break;
      case 6:
        v4 = @"SiriButtonIdentifierLongPressCarPlaySteeringWheelButton";
        break;
      case 7:
        v4 = @"SiriButtonIdentifierLongPressCarPlaySiriButton";
        break;
      case 8:
        v4 = @"SiriButtonIdentifierLongPressHearstButton";
        break;
      case 9:
        v4 = @"SiriButtonIdentifierLongPressVoiceCommandButton";
        break;
      default:
        goto LABEL_47;
    }
    return v4;
  }
  if (a3 > 199)
  {
    if (a3 == 200)
    {
      v4 = @"SiriButtonIdentifierTestingShellButton";
    }
    else
    {
      if (a3 != 201) {
        goto LABEL_47;
      }
      v4 = @"SiriButtonIdentifierTVRemoteMicrophoneButton";
    }
  }
  else
  {
    if (a3 != 100)
    {
      if (a3 == 101)
      {
        v4 = @"SiriButtonIdentifierMockSteeringWheelButton";
        return v4;
      }
LABEL_47:
      objc_msgSend(NSString, "stringWithFormat:", @"<unknown siri button identifier : %li>", a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_48:
      return v4;
    }
    v4 = @"SiriButtonIdentifierMockShellButton";
  }
  return v4;
}

@end