@interface AFSettingsConnection
- (void)startAudioPlaybackOfURL:(id)a3 completion:(id)a4;
@end

@implementation AFSettingsConnection

- (void)startAudioPlaybackOfURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100030E4C();
  }

  v9 = [v6 pathExtension];
  v10 = +[UTType typeWithFilenameExtension:v9];
  unsigned int v11 = [v10 conformsToType:UTTypeQuickTimeMovie];

  if (v11) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = objc_alloc((Class)AFAudioPlaybackRequest);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000BEC0;
  v16[3] = &unk_10004CD80;
  id v17 = v6;
  id v14 = v6;
  id v15 = [v13 initWithBuilder:v16];
  [(AFSettingsConnection *)self startAudioPlaybackRequest:v15 options:v12 completion:v7];
}

@end