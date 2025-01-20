@interface LookAroundErrorStringBuilder
+ (id)buildBestErrorStringForCurrentNetworkState;
@end

@implementation LookAroundErrorStringBuilder

+ (id)buildBestErrorStringForCurrentNetworkState
{
  switch(MKCurrentNetworkConnectionFailureDiagnosis())
  {
    case 0:
    case 4:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"LookAround PIP [General Error]";
      goto LABEL_19;
    case 1:
      int v5 = MGGetSInt32Answer();
      switch(v5)
      {
        case 3:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_iPad [LookAround]";
          break;
        case 2:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_iPod [LookAround]";
          break;
        case 1:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_iPhone [LookAround]";
          break;
        default:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_Device [LookAround]";
          break;
      }
      goto LABEL_19;
    case 2:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Enable Cellular Data [LookAround]";
      goto LABEL_19;
    case 3:
      int v6 = MGGetSInt32Answer();
      switch(v6)
      {
        case 3:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_iPad [LookAround]";
          break;
        case 2:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_iPod [LookAround]";
          break;
        case 1:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_iPhone [LookAround]";
          break;
        default:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_Device [LookAround]";
          break;
      }
LABEL_19:
      v7 = [v2 localizedStringForKey:v4 value:@"localized string not found" table:0];

      break;
    default:
      v7 = &stru_101324E70;
      break;
  }

  return v7;
}

@end