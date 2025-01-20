@interface PlayVoicemailIntentHandler
- (BOOL)isRestrictedMessage:(id)a3;
- (PlayVoicemailIntentHandler)init;
- (PlayVoicemailIntentHandler)initWithAudioPlaybackService:(id)a3 voicemailManager:(id)a4 callCenter:(id)a5;
- (SiriAudioPlaybackService)audioPlaybackService;
- (TUCallCenter)callCenter;
- (_TtP18PhoneIntentHandler32IntentHandlerVoicemailDataSource_)voicemailManager;
- (void)_playVoicemail:(id)a3 completion:(id)a4;
- (void)endPlayback;
- (void)handlePlayVoicemail:(id)a3 completion:(id)a4;
- (void)setAudioPlaybackService:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setVoicemailManager:(id)a3;
@end

@implementation PlayVoicemailIntentHandler

- (PlayVoicemailIntentHandler)init
{
  id v3 = objc_alloc_init((Class)AFSettingsConnection);
  v4 = +[IntentHandlerMessageStore sharedInstance];
  v5 = +[TUCallCenter sharedInstance];
  v6 = [(PlayVoicemailIntentHandler *)self initWithAudioPlaybackService:v3 voicemailManager:v4 callCenter:v5];

  return v6;
}

- (PlayVoicemailIntentHandler)initWithAudioPlaybackService:(id)a3 voicemailManager:(id)a4 callCenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PlayVoicemailIntentHandler;
  v12 = [(PlayVoicemailIntentHandler *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioPlaybackService, a3);
    objc_storeStrong((id *)&v13->_voicemailManager, a4);
    objc_storeStrong((id *)&v13->_callCenter, a5);
  }

  return v13;
}

- (void)endPlayback
{
  v2 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[PlayVoicemailIntentHandler endPlayback]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Observed playback ended, e.g. user dismissed siri", (uint8_t *)&v3, 0xCu);
  }
}

- (void)handlePlayVoicemail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v15 = "-[PlayVoicemailIntentHandler handlePlayVoicemail:completion:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s handlePlayVoicemail: %@", buf, 0x16u);
  }

  voicemailManager = self->_voicemailManager;
  id v10 = [v6 callRecordIdentifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C298;
  v12[3] = &unk_10004CDD0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(IntentHandlerVoicemailDataSource *)voicemailManager fetchVoicemailWithIdentifier:v10 completion:v12];
}

- (BOOL)isRestrictedMessage:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v5 = [v4 senderDestinationID];
  if ([v5 length])
  {
    id v6 = [v4 senderDestinationID];
  }
  else
  {
    id v6 = TUCallFilterUnknownCallerAddress;
  }
  id v7 = v6;

  objc_initWeak(&location, self);
  v8 = [(TUCallCenter *)self->_callCenter queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C780;
  v11[3] = &unk_10004CDF8;
  id v12 = v7;
  id v13 = &v16;
  id v9 = v7;
  objc_copyWeak(&v14, &location);
  dispatch_sync(v8, v11);

  LOBYTE(v8) = *((unsigned char *)v17 + 24);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

- (void)_playVoicemail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[PlayVoicemailIntentHandler _playVoicemail:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Attempting to play voicemail: %@", buf, 0x16u);
  }

  audioPlaybackService = self->_audioPlaybackService;
  id v10 = [v6 dataURL];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C9A8;
  v13[3] = &unk_10004CE20;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v11 = v6;
  id v12 = v7;
  [(SiriAudioPlaybackService *)audioPlaybackService startAudioPlaybackOfURL:v10 completion:v13];
}

- (SiriAudioPlaybackService)audioPlaybackService
{
  return self->_audioPlaybackService;
}

- (void)setAudioPlaybackService:(id)a3
{
}

- (_TtP18PhoneIntentHandler32IntentHandlerVoicemailDataSource_)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);

  objc_storeStrong((id *)&self->_audioPlaybackService, 0);
}

@end