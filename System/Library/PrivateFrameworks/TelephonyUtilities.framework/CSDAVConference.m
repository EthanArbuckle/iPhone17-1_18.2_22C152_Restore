@interface CSDAVConference
- (BOOL)_isMuted;
- (BOOL)_isSendingAudio;
- (BOOL)_isSendingAudioData;
- (BOOL)_isSendingVideo;
- (BOOL)capturingLocalVideo;
- (BOOL)hasReceivedFirstRemoteFrame;
- (BOOL)isCaller;
- (BOOL)isMuted;
- (BOOL)isRemoteVideoPaused;
- (BOOL)isSendingAudio;
- (BOOL)isSendingAudioData;
- (BOOL)isSendingVideo;
- (CGSize)remoteVideoPresentationSize;
- (CSDAVConference)init;
- (CSDAVConferenceConfiguration)configuration;
- (CSDAVConferenceDelegate)delegate;
- (CSDAVConferenceProvider)conferenceProvider;
- (NSDate)dateConnected;
- (NSDate)dateEnded;
- (NSDate)dateStartedConnecting;
- (NSDictionary)localInviteDictionary;
- (NSDictionary)remoteInviteDictionary;
- (NSError)endedError;
- (NSNumber)isSendingVideoExpected;
- (NSString)description;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (double)connectionTimeout;
- (id)_isSendingVideoExpected;
- (id)conferenceProviderCreationBlock;
- (int)deviceRole;
- (int)state;
- (int64_t)_endedReasonForDidStopError:(id)a3 error:(id *)a4;
- (int64_t)callID;
- (int64_t)endedReason;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (unsigned)remoteVideoPresentationState;
- (void)_performDelegateCallback:(id)a3;
- (void)_sendDelegateBytesOfDataUsageChanged:(int64_t)a3;
- (void)_sendDelegateConnectionClosed;
- (void)_sendDelegateEndedWithReason:(int64_t)a3 error:(id)a4;
- (void)_sendDelegateFinishedPreparing;
- (void)_sendDelegateInputFrequencyLevelChanged:(id)a3;
- (void)_sendDelegateInputLevelChanged:(float)a3;
- (void)_sendDelegateMutedChanged;
- (void)_sendDelegateOutputFrequencyLevelChanged:(id)a3;
- (void)_sendDelegateOutputLevelChanged:(float)a3;
- (void)_sendDelegateReceivedData:(id)a3 forCallID:(int64_t)a4;
- (void)_sendDelegateReceivedFirstRemoteFrame;
- (void)_sendDelegateRemoteMediaStalled:(BOOL)a3;
- (void)_sendDelegateRemoteVideoPaused;
- (void)_sendDelegateSendingAudioChanged;
- (void)_sendDelegateStarted;
- (void)_setEndedWithReason:(int64_t)a3 error:(id)a4;
- (void)_setUpDidStartTimeout;
- (void)_stop;
- (void)cancel;
- (void)conferenceProvider:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5;
- (void)conferenceProvider:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5;
- (void)conferenceProvider:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conferenceProvider:(id)a3 didStartSession:(BOOL)a4 error:(id)a5;
- (void)conferenceProvider:(id)a3 didStopWithError:(id)a4 callMetadata:(id)a5;
- (void)conferenceProvider:(id)a3 remoteMediaStalled:(BOOL)a4;
- (void)conferenceProvider:(id)a3 remoteVideoPaused:(BOOL)a4;
- (void)conferenceProvider:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)conferenceProvider:(id)a3 updateInputLevel:(float)a4;
- (void)conferenceProvider:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)conferenceProvider:(id)a3 updateOutputLevel:(float)a4;
- (void)conferenceProviderReceivedFirstRemoteFrame:(id)a3;
- (void)connectionClosedForConferenceProvider:(id)a3;
- (void)dealloc;
- (void)prepareWithConfiguration:(id)a3;
- (void)sendData:(id)a3;
- (void)serverDiedForConferenceProvider:(id)a3;
- (void)setCaller:(BOOL)a3;
- (void)setCapturingLocalVideo:(BOOL)a3;
- (void)setConferenceProvider:(id)a3;
- (void)setConferenceProviderCreationBlock:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setDateConnected:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateStartedConnecting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDeviceRole:(int)a3;
- (void)setEndedError:(id)a3;
- (void)setEndedReason:(int64_t)a3;
- (void)setHasReceivedFirstRemoteFrame:(BOOL)a3;
- (void)setLocalInviteDictionary:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteIDSDestinationURI:(id)a3 crossDeviceIdentifier:(id)a4;
- (void)setRemoteInviteDictionary:(id)a3;
- (void)setRemoteVideoPaused:(BOOL)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(unsigned int)a3;
- (void)setSendingAudio:(BOOL)a3;
- (void)setSendingAudioData:(BOOL)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setSendingVideoExpected:(id)a3;
- (void)setState:(int)a3;
- (void)startConnectionWithTransport:(id)a3;
- (void)startedCapturingLocalVideo:(id)a3;
- (void)stop;
- (void)stoppedCapturingLocalVideo:(id)a3;
- (void)updateCapabilities:(id)a3;
@end

@implementation CSDAVConference

- (CSDAVConference)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSDAVConference;
  v2 = [(CSDAVConference *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesdaemon.csdavconference", 0);
    v4 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v3;

    v5 = +[TUCallCenter sharedInstance];
    uint64_t v6 = [v5 queue];
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    *((void *)v2 + 5) = 0x403E000000000000;
    *(void *)(v2 + 12) = 1;
    *(NSSize *)(v2 + 136) = NSZeroSize;
    v8 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = &stru_100504F90;

    if (TUAllowLocalVideoRecording())
    {
      v9 = +[NSNotificationCenter defaultCenter];
      [v9 addObserver:v2 selector:"startedCapturingLocalVideo:" name:@"CSDMomentsControllerStartedLocalVideoCaptureNotification" object:0];

      v10 = +[NSNotificationCenter defaultCenter];
      [v10 addObserver:v2 selector:"stoppedCapturingLocalVideo:" name:@"CSDMomentsControllerStoppedLocalVideoCaptureNotification" object:0];
    }
  }
  return (CSDAVConference *)v2;
}

- (void)dealloc
{
  [(CSDAVConferenceProvider *)self->_conferenceProvider setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CSDAVConference;
  [(CSDAVConference *)&v3 dealloc];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t state = self->_state;
  v5 = [(CSDAVConference *)self conferenceProvider];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@ %p state=%d conference=%@>", v3, self, state, v5];

  return (NSString *)v6;
}

- (void)prepareWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011EE0;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)startConnectionWithTransport:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDAVConference *)self configuration];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "transport: %@ self.configuration: %@", buf, 0x16u);
  }
  v7 = [(CSDAVConference *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000125CC;
  v9[3] = &unk_100504F10;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)stop
{
  uint64_t v3 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000129DC;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_stop
{
  uint64_t v3 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v3);

  int state = self->_state;
  if (state > 3)
  {
    if (state <= 5)
    {
      [(CSDAVConference *)self setState:6];
      if (TUAllowLocalVideoRecording()
        && [(CSDAVConference *)self capturingLocalVideo])
      {
        v5 = sub_100008DCC();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delaying stop on conference...", buf, 2u);
        }

        dispatch_time_t v6 = dispatch_time(0, 1000000000);
        v7 = [(CSDAVConference *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100012C14;
        block[3] = &unk_100504EC0;
        block[4] = self;
        dispatch_after(v6, v7, block);
      }
      else
      {
        id v8 = sub_100008DCC();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [(CSDAVConference *)self conferenceProvider];
          *(_DWORD *)buf = 138412290;
          __int16 v13 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling stop on conference %@", buf, 0xCu);
        }
        id v10 = [(CSDAVConference *)self conferenceProvider];
        [v10 stop];
      }
    }
  }
  else
  {
    [(CSDAVConference *)self _setEndedWithReason:0 error:0];
  }
}

- (void)cancel
{
  uint64_t v3 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D80;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012F78;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setRemoteIDSDestinationURI:(id)a3 crossDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000130A4;
  block[3] = &unk_100504FE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_setEndedWithReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  [(CSDAVConference *)self setConferenceProvider:0];
  [(CSDAVConference *)self setState:7];
  [(CSDAVConference *)self setEndedReason:a3];
  [(CSDAVConference *)self setEndedError:v6];

  int64_t endedReason = self->_endedReason;
  endedError = self->_endedError;

  [(CSDAVConference *)self _sendDelegateEndedWithReason:endedReason error:endedError];
}

- (int64_t)inputAudioPowerSpectrumToken
{
  v2 = [(CSDAVConference *)self conferenceProvider];
  id v3 = [v2 inputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  v2 = [(CSDAVConference *)self conferenceProvider];
  id v3 = [v2 outputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (NSDictionary)localInviteDictionary
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100013304;
  v11 = sub_100013314;
  id v12 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001331C;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)remoteInviteDictionary
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100013304;
  v11 = sub_100013314;
  id v12 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001344C;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setRemoteInviteDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013568;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)callID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001373C;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isCaller
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013870;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setCaller:(BOOL)a3
{
  v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013964;
  v6[3] = &unk_100505030;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (NSDate)dateConnected
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100013304;
  v11 = sub_100013314;
  id v12 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013B74;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)setDateConnected:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  v5 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v5);

  dateConnected = self->_dateConnected;
  p_dateConnected = &self->_dateConnected;
  if (dateConnected != v8) {
    objc_storeStrong((id *)p_dateConnected, a3);
  }
}

- (NSDate)dateEnded
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100013304;
  v11 = sub_100013314;
  id v12 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013D28;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)setDateEnded:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  v5 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v5);

  dateEnded = self->_dateEnded;
  p_dateEnded = &self->_dateEnded;
  if (dateEnded != v8) {
    objc_storeStrong((id *)p_dateEnded, a3);
  }
}

- (NSDate)dateStartedConnecting
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100013304;
  v11 = sub_100013314;
  id v12 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013EDC;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)setDateStartedConnecting:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  v5 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v5);

  dateStartedConnecting = self->_dateStartedConnecting;
  p_dateStartedConnecting = &self->_dateStartedConnecting;
  if (dateStartedConnecting != v8) {
    objc_storeStrong((id *)p_dateStartedConnecting, a3);
  }
}

- (int)state
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1;
  id v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014050;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (void)setState:(int)a3
{
  v5 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v5);

  p_int state = &self->_state;
  if (self->_state >= a3)
  {
    uint64_t v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1003A6890(p_state, a3, v7);
    }
  }
  else
  {
    *p_int state = a3;
    switch(a3)
    {
      case 7:
        id v8 = +[NSDate date];
        [(CSDAVConference *)self setDateEnded:v8];
        break;
      case 5:
        id v8 = +[NSDate date];
        [(CSDAVConference *)self setDateConnected:v8];
        break;
      case 4:
        id v8 = +[NSDate date];
        [(CSDAVConference *)self setDateStartedConnecting:v8];
        break;
      default:
        return;
    }
  }
}

- (int64_t)endedReason
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014270;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isMuted
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001435C;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isMuted
{
  v2 = [(CSDAVConference *)self conferenceProvider];
  unsigned __int8 v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014460;
  v6[3] = &unk_100505030;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)isSendingAudio
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014644;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSendingAudio
{
  unsigned __int8 v3 = [(CSDAVConference *)self conferenceProvider];

  if (v3)
  {
    int64_t v4 = [(CSDAVConference *)self conferenceProvider];
    unsigned int v5 = [v4 isAudioPaused] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setSendingAudio:(BOOL)a3
{
  unsigned int v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001476C;
  v6[3] = &unk_100505030;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)isSendingAudioData
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001494C;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSendingAudioData
{
  unsigned __int8 v3 = [(CSDAVConference *)self conferenceProvider];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [(CSDAVConference *)self conferenceProvider];
  unsigned __int8 v5 = [v4 isSendingAudio];

  return v5;
}

- (void)setSendingAudioData:(BOOL)a3
{
  unsigned __int8 v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014A74;
  v6[3] = &unk_100505030;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)hasReceivedFirstRemoteFrame
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014C4C;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isSendingVideo
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014D38;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSendingVideo
{
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = [(CSDAVConference *)self conferenceProvider];

  if (v4)
  {
    unsigned __int8 v5 = [(CSDAVConference *)self _isSendingVideoExpected];
    uint64_t v6 = v5;
    if (v5)
    {
      LOBYTE(v7) = [v5 BOOLValue];
    }
    else
    {
      uint64_t v8 = [(CSDAVConference *)self conferenceProvider];
      unsigned int v7 = [v8 isVideoPaused] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)setSendingVideo:(BOOL)a3
{
  unsigned __int8 v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014EA8;
  v6[3] = &unk_100505030;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (NSNumber)isSendingVideoExpected
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100013304;
  v11 = sub_100013314;
  id v12 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015290;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (id)_isSendingVideoExpected
{
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v3);

  sendingVideoExpected = self->_sendingVideoExpected;

  return sendingVideoExpected;
}

- (void)setSendingVideoExpected:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v5);

  p_sendingVideoExpected = &self->_sendingVideoExpected;
  if ((TUObjectsAreEqualOrNil() & 1) == 0) {
    objc_storeStrong((id *)p_sendingVideoExpected, a3);
  }
}

- (void)updateCapabilities:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001545C;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)isRemoteVideoPaused
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015664;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (CGSize)remoteVideoPresentationSize
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  id v12 = "";
  NSSize v13 = NSZeroSize;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015774;
  v8[3] = &unk_100505008;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015824;
  block[3] = &unk_100505058;
  block[4] = self;
  *(CGFloat *)&void block[5] = width;
  *(CGFloat *)&block[6] = height;
  dispatch_async(v6, block);
}

- (unsigned)remoteVideoPresentationState
{
  v2 = self;
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  unsigned __int8 v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015A48;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3
{
  double v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015AF4;
  v6[3] = &unk_100505080;
  v6[4] = self;
  unsigned int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_setUpDidStartTimeout
{
  [(CSDAVConference *)self connectionTimeout];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  double v5 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015CC4;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

- (int)deviceRole
{
  v2 = self;
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  double v3 = [(CSDAVConference *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015E1C;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (void)setDeviceRole:(int)a3
{
  double v5 = [(CSDAVConference *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015F20;
  v6[3] = &unk_100505080;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)startedCapturingLocalVideo:(id)a3
{
  if (TUAllowLocalVideoRecording())
  {
    dispatch_time_t v4 = [(CSDAVConference *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001614C;
    block[3] = &unk_100504EC0;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)stoppedCapturingLocalVideo:(id)a3
{
  if (TUAllowLocalVideoRecording())
  {
    dispatch_time_t v4 = [(CSDAVConference *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000161EC;
    block[3] = &unk_100504EC0;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  dispatch_time_t v4 = [(CSDAVConference *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(CSDAVConference *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    int v7 = [(CSDAVConference *)self delegateQueue];

    if (v7)
    {
      uint64_t v8 = [(CSDAVConference *)self delegateQueue];
      dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v8, v9);
    }
  }
}

- (void)_sendDelegateFinishedPreparing
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001632C;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateStarted
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016400;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateEndedWithReason:(int64_t)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016504;
  v7[3] = &unk_1005050A8;
  id v8 = a4;
  int64_t v9 = a3;
  v7[4] = self;
  id v6 = v8;
  [(CSDAVConference *)self _performDelegateCallback:v7];
}

- (void)_sendDelegateConnectionClosed
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000165DC;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateMutedChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000166B0;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateSendingAudioChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016784;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateReceivedFirstRemoteFrame
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016858;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateRemoteVideoPaused
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001692C;
  v2[3] = &unk_100504EC0;
  v2[4] = self;
  [(CSDAVConference *)self _performDelegateCallback:v2];
}

- (void)_sendDelegateRemoteMediaStalled:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016A04;
  v3[3] = &unk_100505030;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSDAVConference *)self _performDelegateCallback:v3];
}

- (void)_sendDelegateInputFrequencyLevelChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016B04;
  v4[3] = &unk_100504F10;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CSDAVConference *)v5 _performDelegateCallback:v4];
}

- (void)_sendDelegateOutputFrequencyLevelChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016C00;
  v4[3] = &unk_100504F10;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CSDAVConference *)v5 _performDelegateCallback:v4];
}

- (void)_sendDelegateInputLevelChanged:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016CD8;
  v3[3] = &unk_100505080;
  v3[4] = self;
  float v4 = a3;
  [(CSDAVConference *)self _performDelegateCallback:v3];
}

- (void)_sendDelegateOutputLevelChanged:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016DB4;
  v3[3] = &unk_100505080;
  v3[4] = self;
  float v4 = a3;
  [(CSDAVConference *)self _performDelegateCallback:v3];
}

- (void)_sendDelegateBytesOfDataUsageChanged:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016E8C;
  v3[3] = &unk_100504EE8;
  v3[4] = self;
  void v3[5] = a3;
  [(CSDAVConference *)self _performDelegateCallback:v3];
}

- (void)_sendDelegateReceivedData:(id)a3 forCallID:(int64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016F90;
  v6[3] = &unk_1005050A8;
  int v7 = self;
  id v8 = a3;
  int64_t v9 = a4;
  id v5 = v8;
  [(CSDAVConference *)v7 _performDelegateCallback:v6];
}

- (int64_t)_endedReasonForDidStopError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    int64_t v9 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v7 = [v5 code];
  uint64_t v8 = 1;
  if (v7 == (id)32005) {
    uint64_t v8 = 7;
  }
  if (v7 == (id)32003) {
    int64_t v9 = 2;
  }
  else {
    int64_t v9 = v8;
  }
  if (v7 == (id)32003) {
    id v5 = 0;
  }
  else {
    id v5 = v6;
  }
  if (a4) {
LABEL_11:
  }
    *a4 = v5;
LABEL_12:

  return v9;
}

- (void)conferenceProvider:(id)a3 didStartSession:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001713C;
  block[3] = &unk_1005050D0;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)conferenceProvider:(id)a3 didStopWithError:(id)a4 callMetadata:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017460;
  block[3] = &unk_100504FE0;
  id v13 = v7;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)connectionClosedForConferenceProvider:(id)a3
{
  float v4 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000176DC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)conferenceProvider:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  id v6 = [(CSDAVConference *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017808;
  v8[3] = &unk_100504F10;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)conferenceProvider:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  id v6 = [(CSDAVConference *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000178CC;
  v8[3] = &unk_100504F10;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)conferenceProvider:(id)a3 updateInputLevel:(float)a4
{
  id v6 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017970;
  v7[3] = &unk_100505080;
  v7[4] = self;
  float v8 = a4;
  dispatch_async(v6, v7);
}

- (void)conferenceProvider:(id)a3 updateOutputLevel:(float)a4
{
  id v6 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017A18;
  v7[3] = &unk_100505080;
  v7[4] = self;
  float v8 = a4;
  dispatch_async(v6, v7);
}

- (void)conferenceProvider:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  float v8 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017AE4;
  block[3] = &unk_1005050D0;
  BOOL v13 = a4;
  id v11 = v7;
  BOOL v12 = self;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)conferenceProvider:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  float v8 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017C60;
  block[3] = &unk_1005050D0;
  BOOL v13 = a4;
  id v11 = v7;
  BOOL v12 = self;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)conferenceProviderReceivedFirstRemoteFrame:(id)a3
{
  float v4 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017ED8;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)conferenceProvider:(id)a3 remoteVideoPaused:(BOOL)a4
{
  id v6 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017FF0;
  v7[3] = &unk_100505030;
  BOOL v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)conferenceProvider:(id)a3 remoteMediaStalled:(BOOL)a4
{
  id v6 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018144;
  v7[3] = &unk_100505030;
  BOOL v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)serverDiedForConferenceProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAVConference *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000182AC;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)conferenceProvider:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = objc_msgSend(a4, "copy", a3);
  id v8 = [(CSDAVConference *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000183C8;
  block[3] = &unk_1005050A8;
  void block[4] = self;
  id v11 = v7;
  int64_t v12 = a5;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (CSDAVConferenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDAVConferenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setLocalInviteDictionary:(id)a3
{
}

- (void)setEndedReason:(int64_t)a3
{
  self->_int64_t endedReason = a3;
}

- (NSError)endedError
{
  return self->_endedError;
}

- (void)setEndedError:(id)a3
{
}

- (void)setHasReceivedFirstRemoteFrame:(BOOL)a3
{
  self->_hasReceivedFirstRemoteFrame = a3;
}

- (void)setRemoteVideoPaused:(BOOL)a3
{
  self->_remoteVideoPaused = a3;
}

- (BOOL)capturingLocalVideo
{
  return self->_capturingLocalVideo;
}

- (void)setCapturingLocalVideo:(BOOL)a3
{
  self->_capturingLocalVideo = a3;
}

- (CSDAVConferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CSDAVConferenceProvider)conferenceProvider
{
  return self->_conferenceProvider;
}

- (void)setConferenceProvider:(id)a3
{
}

- (id)conferenceProviderCreationBlock
{
  return self->_conferenceProviderCreationBlock;
}

- (void)setConferenceProviderCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_conferenceProviderCreationBlock, 0);
  objc_storeStrong((id *)&self->_conferenceProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_endedError, 0);
  objc_storeStrong((id *)&self->_localInviteDictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sendingVideoExpected, 0);
  objc_storeStrong((id *)&self->_dateStartedConnecting, 0);
  objc_storeStrong((id *)&self->_dateEnded, 0);
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end