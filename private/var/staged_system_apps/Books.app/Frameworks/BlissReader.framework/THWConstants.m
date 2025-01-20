@interface THWConstants
+ (id)modeStringForMode:(int)a3;
@end

@implementation THWConstants

+ (id)modeStringForMode:(int)a3
{
  switch(a3)
  {
    case 0:
      id result = kTHWidgetModeUninitializedString;
      break;
    case 1:
      id result = kTHWidgetModeFixedString;
      break;
    case 2:
      id result = kTHWidgetModeGutterString;
      break;
    case 3:
      id result = kTHWidgetModeFullScreenString;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

@end