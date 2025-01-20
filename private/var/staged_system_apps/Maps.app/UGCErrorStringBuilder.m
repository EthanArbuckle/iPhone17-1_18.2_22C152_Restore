@interface UGCErrorStringBuilder
+ (id)buildBestErrorStringForCurrentNetworkState;
+ (id)buildFailToSubmitErrorDescription;
+ (id)buildFailToSubmitErrorTitle;
@end

@implementation UGCErrorStringBuilder

+ (id)buildBestErrorStringForCurrentNetworkState
{
  switch(MKCurrentNetworkConnectionFailureDiagnosis())
  {
    case 0:
    case 4:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"UGC [General Error]";
      goto LABEL_19;
    case 1:
      int v5 = MGGetSInt32Answer();
      switch(v5)
      {
        case 3:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_iPad [UGC]";
          break;
        case 2:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_iPod [UGC]";
          break;
        case 1:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_iPhone [UGC]";
          break;
        default:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_AirplaneMode_Device [UGC]";
          break;
      }
      goto LABEL_19;
    case 2:
      v2 = +[NSBundle mainBundle];
      v3 = v2;
      CFStringRef v4 = @"Enable Cellular Data [UGC]";
      goto LABEL_19;
    case 3:
      int v6 = MGGetSInt32Answer();
      switch(v6)
      {
        case 3:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_iPad [UGC]";
          break;
        case 2:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_iPod [UGC]";
          break;
        case 1:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_iPhone [UGC]";
          break;
        default:
          v2 = +[NSBundle mainBundle];
          v3 = v2;
          CFStringRef v4 = @"Error_NoNetworkConnection_Device [UGC]";
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

+ (id)buildFailToSubmitErrorTitle
{
  unint64_t v2 = MKCurrentNetworkConnectionFailureDiagnosis() - 1;
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = v3;
  if (v2 >= 3) {
    CFStringRef v5 = @"Submission Generic Failure Title [UGC]";
  }
  else {
    CFStringRef v5 = @"Submission Internet Failure Title [UGC]";
  }
  int v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

+ (id)buildFailToSubmitErrorDescription
{
  unint64_t v2 = MKCurrentNetworkConnectionFailureDiagnosis() - 1;
  v3 = +[NSBundle mainBundle];
  CFStringRef v4 = v3;
  if (v2 >= 3) {
    CFStringRef v5 = @"Submission Generic Failure Description [UGC]";
  }
  else {
    CFStringRef v5 = @"Submission Internet Failure Description [UGC]";
  }
  int v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

@end