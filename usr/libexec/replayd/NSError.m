@interface NSError
+ (id)_rpUserErrorForCode:(int64_t)a3 userInfo:(id)a4;
+ (id)_scUserErrorForCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation NSError

+ (id)_rpUserErrorForCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }
  v8 = v7;
  switch(a3)
  {
    case -5836:
      CFStringRef v9 = @"RECORDING_ERROR_CLIP_IN_PROGRESS";
      break;
    case -5835:
      CFStringRef v9 = @"RECORDING_ERROR_FILE_PERMISSIONS";
      break;
    case -5834:
      CFStringRef v9 = @"RECORDING_ERROR_INVALID_PARAMETER";
      break;
    case -5833:
      CFStringRef v9 = @"RECORDING_ERROR_FAILURE_IN_CAPTURE_STACK";
      break;
    case -5832:
      CFStringRef v9 = @"RECORDING_ERROR_INVALID_SESSION";
      break;
    case -5831:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED_TO_SAVE_TO_PHOTOS";
      break;
    case -5830:
      CFStringRef v9 = @"RECORDING_ERROR_STARTING_IN_RECORDING_STATE";
      break;
    case -5829:
      CFStringRef v9 = @"RECORDING_ERROR_STOPING_NON_RECORDING";
      break;
    case -5828:
      CFStringRef v9 = @"RECORDING_ERROR_ASSET_WRITER_EXPORT_CANCELED";
      break;
    case -5827:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED_TO_REOMOVE_FILE";
      break;
    case -5826:
      CFStringRef v9 = @"RECORDING_ERROR_ASSET_WRITER_EXPORT_FAILED";
      break;
    case -5825:
      CFStringRef v9 = @"RECORDING_ERROR_ASSET_WRITER_IN_WRONG_STATE";
      break;
    case -5824:
      CFStringRef v9 = @"RECORDING_ERROR_NO_ASSET_WRITER";
      break;
    case -5823:
      CFStringRef v9 = @"RECORDING_ERROR_ASSET_WRITER_FAILED_TO_SAVE";
      break;
    case -5822:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED_PROCESS_FIRST_SAMPLE";
      break;
    case -5821:
      CFStringRef v9 = @"RECORDING_ERROR_INCORRECT_TIME_STAMPS";
      break;
    case -5820:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED_TO_OBTAIN_URL";
      break;
    case -5819:
      CFStringRef v9 = @"RECORDING_ERROR_BROADCAST_SETUP_FAILED";
      break;
    case -5818:
      CFStringRef v9 = @"RECORDING_ERROR_MIXING_FAILURE";
      break;
    case -5817:
      CFStringRef v9 = @"RECORDING_ERROR_MEDIASERVICES_FAILED";
      break;
    case -5816:
      CFStringRef v9 = @"RECORDING_ERROR_NO_CONTEXTID_MATCH";
      break;
    case -5815:
      CFStringRef v9 = @"RECORDING_ERROR_CONNECTION_INTERRUPTED";
      break;
    case -5814:
      CFStringRef v9 = @"RECORDING_ERROR_CONNECTION_INVALID";
      break;
    case -5813:
      CFStringRef v9 = @"RECORDING_ERROR_CARPLAY";
      break;
    case -5812:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED_TO_SAVE";
      break;
    case -5811:
      CFStringRef v9 = @"RECORDING_ERROR_ACTIVE_PHONE_CALL";
      break;
    case -5810:
      CFStringRef v9 = @"RECORDING_ERROR_ENTITLEMENTS";
      break;
    case -5809:
      CFStringRef v9 = @"RECORDING_ERROR_SYSTEM_DORMANCY";
      break;
    case -5808:
      CFStringRef v9 = @"RECORDING_ERROR_INVALID_BROADCAST_SESSION";
      break;
    case -5807:
      CFStringRef v9 = @"RECORDING_ERROR_CONTENT_RESIZE";
      break;
    case -5806:
      CFStringRef v9 = @"RECORDING_ERROR_INTERRUPTED";
      break;
    case -5805:
      CFStringRef v9 = @"RECORDING_ERROR_INSUFFICIENT_STORAGE";
      break;
    case -5804:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED";
      break;
    case -5803:
      CFStringRef v9 = @"RECORDING_ERROR_FAILED_TO_START";
      break;
    case -5802:
      CFStringRef v9 = @"RECORDING_ERROR_DISABLED";
      break;
    case -5801:
      CFStringRef v9 = @"RECORDING_ERROR_USER_DECLINED";
      break;
    default:
      if (a3) {
        CFStringRef v9 = @"RECORDING_ERROR_UNKNOWN";
      }
      else {
        CFStringRef v9 = @"RECORDING_ERROR_SUCCESSFUL";
      }
      break;
  }
  v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  if (v10) {
    [v8 setValue:v10 forKey:NSLocalizedDescriptionKey];
  }
  v11 = +[NSError errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:a3 userInfo:v8];

  return v11;
}

+ (id)_scUserErrorForCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }
  v8 = v7;
  if ((unint64_t)(a3 + 3821) > 0x14) {
    CFStringRef v9 = @"SCSTREAM_ERROR_UNKNOWN";
  }
  else {
    CFStringRef v9 = off_1000850B8[a3 + 3821];
  }
  v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  if (v10) {
    [v8 setValue:v10 forKey:NSLocalizedDescriptionKey];
  }
  v11 = +[NSError errorWithDomain:@"com.apple.ScreenCaptureKit.SCStreamErrorDomain" code:a3 userInfo:v8];

  return v11;
}

@end