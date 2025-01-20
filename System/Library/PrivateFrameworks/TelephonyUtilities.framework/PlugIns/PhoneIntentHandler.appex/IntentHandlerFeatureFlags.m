@interface IntentHandlerFeatureFlags
- (BOOL)crrFullRecommendation;
- (BOOL)crrHandleRecommendation;
- (BOOL)emergencyServicesOverrideEnabled;
- (BOOL)faceTimeInvitationEnabled;
- (BOOL)faceTimeNoFanOutEnabled;
- (BOOL)vmdEnabled;
@end

@implementation IntentHandlerFeatureFlags

- (BOOL)faceTimeNoFanOutEnabled
{
  int v2 = _os_feature_enabled_impl();
  v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138543362;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SiriPhone/FaceTimeNoFanOut: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)crrFullRecommendation
{
  int v2 = _os_feature_enabled_impl();
  v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138543362;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SiriPhone/CRRFullRecommendation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)crrHandleRecommendation
{
  int v2 = _os_feature_enabled_impl();
  v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138543362;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SiriPhone/crrHandleRecommendation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)faceTimeInvitationEnabled
{
  int v2 = _os_feature_enabled_impl();
  v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138543362;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SiriPhone/FaceTimeInvitation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)emergencyServicesOverrideEnabled
{
  int v2 = _os_feature_enabled_impl();
  int v3 = v2 & _TUIsInternalInstall();
  CFStringRef v4 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SiriPhone/emergencyServicesOverrideEnabled AND isInternalBuild: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (BOOL)vmdEnabled
{
  int v2 = _os_feature_enabled_impl();
  int v3 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138543362;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SiriPhone/VisualVoicemail: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

@end