@interface CSDAVConferenceProvider
- (AVConference)conference;
- (BOOL)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4;
- (BOOL)isAudioPaused;
- (BOOL)isInputFrequencyMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputFrequencyMeteringEnabled;
- (BOOL)isSendingAudio;
- (BOOL)isVideoPaused;
- (BOOL)startConnectionAsCaller:(BOOL)a3 capabilities:(id)a4 socket:(int)a5 error:(id *)a6;
- (BOOL)startConnectionAsCaller:(BOOL)a3 remoteInviteDictionary:(id)a4 capabilities:(id)a5 destination:(id)a6 error:(id *)a7;
- (CSDAVConferenceProvider)initWithClientUUID:(id)a3 serialQueue:(id)a4;
- (CSDAVConferenceProviderDelegate)delegate;
- (TUVideoDeviceController)videoDeviceController;
- (int64_t)callID;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (void)cancel;
- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 closeConnectionForCallID:(int64_t)a4;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6;
- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4;
- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5;
- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 updateInputMeterLevel:(float)a4;
- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 updateOutputMeterLevel:(float)a4;
- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseVideo:(BOOL)a5 error:(id)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5;
- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5;
- (void)dealloc;
- (void)inviteDictionaryForCallID:(int64_t)a3 remoteInviteDictionary:(id)a4 nonCellularCandidateTimeout:(double)a5 block:(id)a6 queue:(id)a7;
- (void)sendData:(id)a3;
- (void)serverDiedForConference:(id)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setCallID:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setPeerReportingIdentifier:(id)a3 sessionIdentifier:(id)a4;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(unsigned int)a3;
- (void)setSendingAudio:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)stop;
- (void)updateCapabilities:(id)a3;
@end

@implementation CSDAVConferenceProvider

- (CSDAVConferenceProvider)initWithClientUUID:(id)a3 serialQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSDAVConferenceProvider;
  v8 = [(CSDAVConferenceProvider *)&v17 init];
  if (v8)
  {
    v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v6 UUIDString];
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initializing AVConference with client UUID %@", buf, 0xCu);
    }
    v11 = (AVConference *)[objc_alloc((Class)AVConference) initWithClientUUID:v6 transportType:1];
    conference = v8->_conference;
    v8->_conference = v11;

    v13 = v8->_conference;
    if (v13)
    {
      [(AVConference *)v13 setDelegate:v8];
      v14 = (TUVideoDeviceController *)[objc_alloc((Class)TUVideoDeviceController) initWithSerialQueue:v7];
      videoDeviceController = v8->_videoDeviceController;
      v8->_videoDeviceController = v14;

      [(TUVideoDeviceController *)v8->_videoDeviceController setIgnoreStartPreview:1];
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(CSDAVConferenceProvider *)self conference];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)CSDAVConferenceProvider;
  [(CSDAVConferenceProvider *)&v4 dealloc];
}

- (BOOL)isInputFrequencyMeteringEnabled
{
  v2 = [(CSDAVConferenceProvider *)self conference];
  unsigned __int8 v3 = [v2 isInputFrequencyMeteringEnabled];

  return v3;
}

- (void)setInputFrequencyMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSDAVConferenceProvider *)self conference];
  [v4 setInputFrequencyMeteringEnabled:v3];
}

- (BOOL)isOutputFrequencyMeteringEnabled
{
  v2 = [(CSDAVConferenceProvider *)self conference];
  unsigned __int8 v3 = [v2 isOutputFrequencyMeteringEnabled];

  return v3;
}

- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSDAVConferenceProvider *)self conference];
  [v4 setOutputFrequencyMeteringEnabled:v3];
}

- (int64_t)inputAudioPowerSpectrumToken
{
  v2 = [(CSDAVConferenceProvider *)self conference];
  id v3 = [v2 inputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  v2 = [(CSDAVConferenceProvider *)self conference];
  id v3 = [v2 outputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (BOOL)isMicrophoneMuted
{
  v2 = [(CSDAVConferenceProvider *)self conference];
  unsigned __int8 v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSDAVConferenceProvider *)self conference];
  [v4 setMicrophoneMuted:v3];
}

- (BOOL)isSendingAudio
{
  char v10 = 0;
  BOOL v3 = [(CSDAVConferenceProvider *)self conference];
  id v9 = 0;
  unsigned int v4 = objc_msgSend(v3, "getIsSendingAudio:callID:error:", &v10, -[CSDAVConferenceProvider callID](self, "callID"), &v9);
  id v5 = v9;

  if (v4)
  {
    BOOL v6 = v10 != 0;
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Error calling getIsSendingAudio: %@", buf, 0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)setSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = self;
  id v5 = [(CSDAVConferenceProvider *)self conference];
  id v8 = 0;
  LOBYTE(v4) = objc_msgSend(v5, "setSendingAudio:callID:error:", v3, -[CSDAVConferenceProvider callID](v4, "callID"), &v8);
  id v6 = v8;

  if ((v4 & 1) == 0)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Error calling setSendingAudio: %@", buf, 0xCu);
    }
  }
}

- (BOOL)isAudioPaused
{
  char v10 = 0;
  BOOL v3 = [(CSDAVConferenceProvider *)self conference];
  id v9 = 0;
  unsigned int v4 = objc_msgSend(v3, "getIsAudioPaused:callID:error:", &v10, -[CSDAVConferenceProvider callID](self, "callID"), &v9);
  id v5 = v9;

  if (v4)
  {
    BOOL v6 = v10 != 0;
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Error calling getIsAudioPaused: %@", buf, 0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(CSDAVConferenceProvider *)self conference];
    *(_DWORD *)buf = 67109378;
    LODWORD(v13[0]) = v3;
    WORD2(v13[0]) = 2112;
    *(void *)((char *)v13 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting pause audio to %d for %@", buf, 0x12u);
  }
  id v7 = [(CSDAVConferenceProvider *)self conference];
  id v11 = 0;
  unsigned __int8 v8 = objc_msgSend(v7, "setPauseAudio:callID:error:", v3, -[CSDAVConferenceProvider callID](self, "callID"), &v11);
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    char v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Error calling setPauseAudio: %@", buf, 0xCu);
    }
  }
}

- (BOOL)isVideoPaused
{
  char v10 = 0;
  BOOL v3 = [(CSDAVConferenceProvider *)self conference];
  id v9 = 0;
  unsigned int v4 = objc_msgSend(v3, "getIsVideoPaused:callID:error:", &v10, -[CSDAVConferenceProvider callID](self, "callID"), &v9);
  id v5 = v9;

  if (v4)
  {
    BOOL v6 = v10 != 0;
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Error calling getIsVideoPaused: %@", buf, 0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(CSDAVConferenceProvider *)self conference];
    *(_DWORD *)buf = 67109378;
    LODWORD(v13[0]) = v3;
    WORD2(v13[0]) = 2112;
    *(void *)((char *)v13 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting pause video to %d for %@", buf, 0x12u);
  }
  id v7 = [(CSDAVConferenceProvider *)self conference];
  id v11 = 0;
  unsigned __int8 v8 = objc_msgSend(v7, "setPauseVideo:callID:error:", v3, -[CSDAVConferenceProvider callID](self, "callID"), &v11);
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    char v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Error calling setPauseVideo: %@", buf, 0xCu);
    }
  }
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14.double width = width;
    v14.double height = height;
    id v7 = NSStringFromSize(v14);
    unsigned __int8 v8 = [(CSDAVConferenceProvider *)self conference];
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting conference visual rectangle of size %@ for %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v9, "setConferenceVisualRectangle:forCallID:", -[CSDAVConferenceProvider callID](self, "callID"), 0.0, 0.0, width, height);
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = +[NSNumber numberWithUnsignedInt:v3];
    id v7 = [(CSDAVConferenceProvider *)self conference];
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting conference state %@ for %@", (uint8_t *)&v9, 0x16u);
  }
  unsigned __int8 v8 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v8, "setConferenceState:forCallID:", v3, -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20.double width = v7;
    v20.double height = v6;
    int v10 = NSStringFromSize(v20);
    v21.double width = width;
    v21.double height = height;
    __int16 v11 = NSStringFromSize(v21);
    __int16 v12 = [(CSDAVConferenceProvider *)self conference];
    int v14 = 138412802;
    v15 = v10;
    __int16 v16 = 2112;
    objc_super v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting local portrait aspect ratio %@ and local landscape aspect ratio %@ for %@", (uint8_t *)&v14, 0x20u);
  }
  v13 = [(CSDAVConferenceProvider *)self videoDeviceController];
  objc_msgSend(v13, "setLocalPortraitAspectRatio:localLandscapeAspectRatio:", v7, v6, width, height);
}

- (void)setPeerReportingIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CSDAVConferenceProvider *)self conference];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting peer reporting identifer %@ and session identifier %@ for %@", (uint8_t *)&v11, 0x20u);
  }
  int v10 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v10, "setPeerReportingIdentifier:sessionIdentifier:forCallID:", v6, v7, -[CSDAVConferenceProvider callID](self, "callID"));
}

- (BOOL)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(CSDAVConferenceProvider *)self conference];
  id v8 = [v7 initializeNewCallWithDeviceRole:v4 reportingHierarchyToken:v6];

  [(CSDAVConferenceProvider *)self setCallID:v8];
  uint64_t v9 = [(CSDAVConferenceProvider *)self callID];
  if (v9 <= 0)
  {
    int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003B1E54(self, v4, v10);
    }
  }
  return v9 > 0;
}

- (BOOL)startConnectionAsCaller:(BOOL)a3 remoteInviteDictionary:(id)a4 capabilities:(id)a5 destination:(id)a6 error:(id *)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67110146;
    v19[1] = v10;
    __int16 v20 = 2048;
    int64_t v21 = [(CSDAVConferenceProvider *)self callID];
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Starting AVConference connection with isCaller=%d callID=%ld remoteInviteDictionary=%@ capabilities=%@ destination=%@", (uint8_t *)v19, 0x30u);
  }

  __int16 v16 = [(CSDAVConferenceProvider *)self conference];
  unsigned __int8 v17 = objc_msgSend(v16, "startConnectionWithCallID:inviteData:isCaller:capabilities:destination:error:", -[CSDAVConferenceProvider callID](self, "callID"), v12, v10, v13, v14, a7);

  return v17;
}

- (BOOL)startConnectionAsCaller:(BOOL)a3 capabilities:(id)a4 socket:(int)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  int v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v17 = v8;
    __int16 v18 = 2048;
    int64_t v19 = [(CSDAVConferenceProvider *)self callID];
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 1024;
    int v23 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting AVConference connection with isCaller=%d callID=%ld capabilities=%@ socket=%d", buf, 0x22u);
  }

  id v12 = [(CSDAVConferenceProvider *)self conference];
  LODWORD(v15) = a5;
  unsigned __int8 v13 = objc_msgSend(v12, "startConnectionWithCallID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:error:", -[CSDAVConferenceProvider callID](self, "callID"), 0, v8, 0, 0, v10, v15, a6);

  return v13;
}

- (void)inviteDictionaryForCallID:(int64_t)a3 remoteInviteDictionary:(id)a4 nonCellularCandidateTimeout:(double)a5 block:(id)a6 queue:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = [(CSDAVConferenceProvider *)self conference];
  [v15 inviteDictionaryForCallID:a3 remoteInviteDictionary:v14 nonCellularCandidateTimeout:v13 block:v12 queue:a5];
}

- (void)stop
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int64_t v6 = [(CSDAVConferenceProvider *)self callID];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping AVConference with callID=%ld", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v4, "stopCallID:", -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)cancel
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int64_t v6 = [(CSDAVConferenceProvider *)self callID];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling AVConference with callID=%ld", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v4, "cancelCallID:", -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)updateCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v5, "updateCapabilities:forCallID:", v4, -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVConferenceProvider *)self conference];
  objc_msgSend(v5, "sendData:forCallID:encrypted:", v4, -[CSDAVConferenceProvider callID](self, "callID"), 0);
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  BOOL v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = self;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "conference=%@ didStartSession=%d userInfo=%@", (uint8_t *)&v11, 0x1Cu);
  }

  uint64_t v9 = [v7 objectForKeyedSubscript:GKSDidStartParameter_Error];
  id v10 = [(CSDAVConferenceProvider *)self delegate];
  [v10 conferenceProvider:self didStartSession:v5 error:v9];
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  BOOL v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    int64_t v11 = a4;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "callID=%ld error=%@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [(CSDAVConferenceProvider *)self delegate];
  [v9 conferenceProvider:self didStopWithError:v7 callMetadata:0];
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  int64_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    int64_t v14 = a4;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "callID=%ld error=%@ callMetadata=%@", (uint8_t *)&v13, 0x20u);
  }

  __int16 v12 = [(CSDAVConferenceProvider *)self delegate];
  [v12 conferenceProvider:self didStopWithError:v9 callMetadata:v10];
}

- (void)conference:(id)a3 closeConnectionForCallID:(int64_t)a4
{
  int64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callID=%ld", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDAVConferenceProvider *)self delegate];
  [v7 connectionClosedForConferenceProvider:self];
}

- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAVConferenceProvider *)self delegate];
  [v6 conferenceProvider:self updateInputFrequencyLevel:v5];
}

- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAVConferenceProvider *)self delegate];
  [v6 conferenceProvider:self updateOutputFrequencyLevel:v5];
}

- (void)conference:(id)a3 updateInputMeterLevel:(float)a4
{
  id v7 = [(CSDAVConferenceProvider *)self delegate];
  *(float *)&double v6 = a4;
  [v7 conferenceProvider:self updateInputLevel:v6];
}

- (void)conference:(id)a3 updateOutputMeterLevel:(float)a4
{
  id v7 = [(CSDAVConferenceProvider *)self delegate];
  *(float *)&double v6 = a4;
  [v7 conferenceProvider:self updateOutputLevel:v6];
}

- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4
{
  double v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "callID=%ld", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDAVConferenceProvider *)self delegate];
  [v7 conferenceProviderReceivedFirstRemoteFrame:self];
}

- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    int64_t v11 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "screenAttributes=%@ callID=%ld", (uint8_t *)&v8, 0x16u);
  }
}

- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    int64_t v11 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "videoAttributes=%@ callID=%ld", (uint8_t *)&v8, 0x16u);
  }
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  __int16 v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    int64_t v13 = a4;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "callID=%ld didPauseAudio=%d error=%@", (uint8_t *)&v12, 0x1Cu);
  }

  int64_t v11 = [(CSDAVConferenceProvider *)self delegate];
  [v11 conferenceProvider:self didPauseAudio:v6 error:v9];
}

- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 2048;
    int64_t v10 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didPause=%d callID=%ld", (uint8_t *)v8, 0x12u);
  }
}

- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v6 = a4;
  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 2048;
    int64_t v12 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didPause=%d callID=%ld", (uint8_t *)v10, 0x12u);
  }

  __int16 v9 = [(CSDAVConferenceProvider *)self delegate];
  [v9 conferenceProvider:self remoteVideoPaused:v6];
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseVideo:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  int64_t v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    int64_t v13 = a4;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "callID=%ld didPauseVideo=%d error=%@", (uint8_t *)&v12, 0x1Cu);
  }

  __int16 v11 = [(CSDAVConferenceProvider *)self delegate];
  [v11 conferenceProvider:self didPauseVideo:v6 error:v9];
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = [(CSDAVConferenceProvider *)self delegate];
  [v8 conferenceProvider:self remoteMediaStalled:v5];

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    int64_t v11 = a4;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] callID=%ld isStalled=%d", (uint8_t *)&v10, 0x12u);
  }
}

- (void)serverDiedForConference:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1003B1EF0(v4);
  }

  BOOL v5 = [(CSDAVConferenceProvider *)self delegate];
  [v5 serverDiedForConferenceProvider:self];
}

- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v6 = a5;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    int64_t v9 = a4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "callID=%ld parameters=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5
{
  id v6 = a5;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    int64_t v9 = a4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "callID=%ld parameters=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v6 = a5;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    int64_t v9 = a4;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "callID=%ld parameters=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  int64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    int64_t v11 = a4;
    __int16 v12 = 1024;
    BOOL v13 = v7;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "callID=%ld isDegraded=%d isRemoteVideo=%d", (uint8_t *)&v10, 0x18u);
  }
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    int64_t v9 = a4;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] callID=%ld isNetworkBad=%d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = a4;
  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"non-nil";
    if (!v7) {
      CFStringRef v9 = @"nil";
    }
    int v11 = 134218242;
    int64_t v12 = a5;
    __int16 v13 = 2112;
    CFStringRef v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "callID=%ld didReceiveData=%@", (uint8_t *)&v11, 0x16u);
  }

  __int16 v10 = [(CSDAVConferenceProvider *)self delegate];
  [v10 conferenceProvider:self didReceiveData:v7 forCallID:a5];
}

- (CSDAVConferenceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (CSDAVConferenceProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVConference)conference
{
  return self->_conference;
}

- (int64_t)callID
{
  return self->_callID;
}

- (void)setCallID:(int64_t)a3
{
  self->_callID = a3;
}

- (TUVideoDeviceController)videoDeviceController
{
  return self->_videoDeviceController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDeviceController, 0);
  objc_storeStrong((id *)&self->_conference, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end