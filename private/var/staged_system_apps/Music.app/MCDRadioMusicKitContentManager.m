@interface MCDRadioMusicKitContentManager
- (id)_modelRequest;
- (id)nextUpcomingShowStartTime;
- (void)_initiatePlaybackForItem:(id)a3;
@end

@implementation MCDRadioMusicKitContentManager

- (id)_modelRequest
{
  v3 = objc_opt_new();
  [v3 setFilteringPolicy:1];
  v4 = [(MCDFuseContentManager *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(MCDFuseContentManager *)self dataSource];
    v7 = [v6 parentSection];
    [v3 configureWithParentSection:v7];
  }
  v8 = [(MCDFuseContentManager *)self dataSource];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(MCDFuseContentManager *)self dataSource];
    [v3 setDomain:[v10 domain]];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v11 = (void *)qword_1010D7058;
  uint64_t v26 = qword_1010D7058;
  if (!qword_1010D7058)
  {
    v12 = (void *)sub_10002A270();
    v24[3] = (uint64_t)dlsym(v12, "MCDMusicCarPlayBundleIdentifier");
    qword_1010D7058 = v24[3];
    v11 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v11)
  {
    sub_100D691B8();
LABEL_25:
    sub_100D691B8();
    goto LABEL_26;
  }
  [v3 setClientIdentifier:*v11];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v13 = (void *)qword_1010D7068;
  uint64_t v26 = qword_1010D7068;
  if (!qword_1010D7068)
  {
    v14 = (void *)sub_10002A270();
    v24[3] = (uint64_t)dlsym(v14, "MCDMusicCarPlayVersion");
    qword_1010D7068 = v24[3];
    v13 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v13) {
    goto LABEL_25;
  }
  [v3 setClientVersion:*v13];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v15 = (void *)qword_1010D7070;
  uint64_t v26 = qword_1010D7070;
  if (!qword_1010D7070)
  {
    v16 = (void *)sub_10002A270();
    v24[3] = (uint64_t)dlsym(v16, "MCDMusicCarPlayPlatformIdentifier");
    qword_1010D7070 = v24[3];
    v15 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v15)
  {
LABEL_26:
    v22 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v22);
  }
  [v3 setClientPlatformIdentifier:*v15];
  [v3 setRequestEndpoint:1];
  [v3 setAuthenticationOptions:1];
  id v17 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobileipod"];
  v18 = +[MPCloudServiceStatusController sharedController];
  v19 = [v18 musicSubscriptionStatus];

  if ([v17 BOOLForKey:@"UserRequestedSubscriptionHidden"])
  {
    uint64_t v20 = 3;
  }
  else
  {
    if (!v19) {
      goto LABEL_21;
    }
    if ([v19 hasCapability:1]) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2;
    }
  }
  [v3 setSubscriptionStatus:v20];
LABEL_21:
  [v3 setAdditionalContent:1];
  [v3 setOptions:7];

  return v3;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v10 = v11;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
    id v4 = [(MCDFuseContentManager *)self playbackManager];
    char v5 = [(MCDFuseContentManager *)self viewController];
    v6 = [v5 combinedPlayActivityFeatureName];
    [v4 initiatePlaybackForRadioStation:v11 lastResponse:0 shuffled:0 playActivityFeatureName:v6];
    goto LABEL_6;
  }
  id v4 = v11;
  if ([v4 hasLoadedValueForKey:MPModelStoreBrowseSectionRelationshipRadioStation])
  {
    char v5 = [(MCDFuseContentManager *)self playbackManager];
    v6 = [v4 radioStation];
    v7 = [(MCDFuseContentManager *)self viewController];
    v8 = [v7 combinedPlayActivityFeatureName];
    [v5 initiatePlaybackForRadioStation:v6 lastResponse:0 shuffled:0 playActivityFeatureName:v8];

LABEL_6:
  }

  v10 = v11;
LABEL_8:
}

- (id)nextUpcomingShowStartTime
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000B2ABC;
  id v11 = sub_1000B2ACC;
  id v12 = 0;
  v2 = [(MCDFuseContentManager *)self lastReceivedResponse];
  v3 = [v2 results];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B2AD4;
  v6[3] = &unk_100FC4128;
  v6[4] = &v7;
  [v3 enumerateSectionsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end