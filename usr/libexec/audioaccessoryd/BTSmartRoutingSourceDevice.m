@interface BTSmartRoutingSourceDevice
- (BOOL)TUIncomingCallAnswered;
- (BOOL)audioRouteDeviceRegistered;
- (BOOL)builtInMicRegistered;
- (BOOL)builtInSpeakerRegistered;
- (BOOL)hijackedByPhoneCall;
- (BOOL)incomingCallRingtone;
- (BOOL)magnetConnected;
- (BOOL)routeChangeToSpeakerInProgress;
- (BOOL)shouldStayOnVirtual;
- (NSMutableDictionary)TUCallMap;
- (NSMutableDictionary)audioSessionkMap;
- (NSMutableDictionary)evalWxMap;
- (NSMutableDictionary)isFirstConnectionAfterSREnable;
- (NSMutableSet)hijackBlockingClientSet;
- (NSSet)conferencingCallSets;
- (NSString)activePlayingApp;
- (NSString)audioDestination;
- (NSString)evalPreemptiveBannerResult;
- (NSString)evalResult;
- (NSString)routeToSpeakerReason;
- (NSString)routingRequestWx;
- (int)audioRoute;
- (int)callIncomingConnected;
- (int)callIncomingUnconnected;
- (int64_t)bluetoothState;
- (unint64_t)callStartTicks;
- (unint64_t)evalTicks;
- (unint64_t)hfpSetupFailTicks;
- (unint64_t)manualRouteSpeakerTicks;
- (unint64_t)predictiveRouteTicks;
- (unsigned)audioRouteDevice;
- (unsigned)builtInMicAudioDeviceID;
- (unsigned)builtInSpeakerAudioDeviceID;
- (void)_setBuiltInMicAudioDeviceID:(unsigned int)a3;
- (void)_setBuiltInSpeakerAudioDeviceID:(unsigned int)a3;
- (void)_setHijackedByPhoneCall:(BOOL)a3;
- (void)_setIncomingCallRingtoneState:(BOOL)a3;
- (void)_setShouldStayOnVirtual:(BOOL)a3;
- (void)_setSpeakerRouteChangeInProgress:(BOOL)a3;
- (void)_setTUIncomingCallState:(BOOL)a3;
- (void)_updateHijackBlockingClientWithBundleID:(id)a3 mode:(BOOL)a4;
- (void)setActivePlayingApp:(id)a3;
- (void)setAudioDestination:(id)a3;
- (void)setAudioRoute:(int)a3;
- (void)setAudioRouteDevice:(unsigned int)a3;
- (void)setAudioRouteDeviceRegistered:(BOOL)a3;
- (void)setAudioSessionkMap:(id)a3;
- (void)setBluetoothState:(int64_t)a3;
- (void)setBuiltInMicAudioDeviceID:(unsigned int)a3;
- (void)setBuiltInMicRegistered:(BOOL)a3;
- (void)setBuiltInSpeakerAudioDeviceID:(unsigned int)a3;
- (void)setBuiltInSpeakerRegistered:(BOOL)a3;
- (void)setCallIncomingConnected:(int)a3;
- (void)setCallIncomingUnconnected:(int)a3;
- (void)setCallStartTicks:(unint64_t)a3;
- (void)setConferencingCallSets:(id)a3;
- (void)setEvalPreemptiveBannerResult:(id)a3;
- (void)setEvalResult:(id)a3;
- (void)setEvalTicks:(unint64_t)a3;
- (void)setEvalWxMap:(id)a3;
- (void)setHfpSetupFailTicks:(unint64_t)a3;
- (void)setHijackBlockingClientSet:(id)a3;
- (void)setIsFirstConnectionAfterSREnable:(id)a3;
- (void)setMagnetConnected:(BOOL)a3;
- (void)setManualRouteSpeakerTicks:(unint64_t)a3;
- (void)setPredictiveRouteTicks:(unint64_t)a3;
- (void)setRouteChangeToSpeakerInProgress:(BOOL)a3;
- (void)setRouteToSpeakerReason:(id)a3;
- (void)setRoutingRequestWx:(id)a3;
- (void)setTUCallMap:(id)a3;
@end

@implementation BTSmartRoutingSourceDevice

- (void)_setBuiltInMicAudioDeviceID:(unsigned int)a3
{
  if (self->builtInMicAudioDeviceID != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->builtInMicAudioDeviceID = a3;
  }
}

- (void)_setBuiltInSpeakerAudioDeviceID:(unsigned int)a3
{
  if (self->builtInSpeakerAudioDeviceID != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->builtInSpeakerAudioDeviceID = a3;
  }
}

- (void)_updateHijackBlockingClientWithBundleID:(id)a3 mode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  hijackBlockingClientSet = self->hijackBlockingClientSet;
  id v11 = v6;
  if (v4)
  {
    if (!hijackBlockingClientSet)
    {
      v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v9 = self->hijackBlockingClientSet;
      self->hijackBlockingClientSet = v8;

      id v6 = v11;
      hijackBlockingClientSet = self->hijackBlockingClientSet;
    }
    [(NSMutableSet *)hijackBlockingClientSet addObject:v6];
  }
  else
  {
    [(NSMutableSet *)hijackBlockingClientSet removeObject:v6];
    if (![(NSMutableSet *)self->hijackBlockingClientSet count])
    {
      v10 = self->hijackBlockingClientSet;
      self->hijackBlockingClientSet = 0;
    }
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_setHijackedByPhoneCall:(BOOL)a3
{
  if (self->hijackedByPhoneCall != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->hijackedByPhoneCall = a3;
  }
}

- (void)_setIncomingCallRingtoneState:(BOOL)a3
{
  if (self->incomingCallRingtone != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->incomingCallRingtone = a3;
  }
}

- (void)_setSpeakerRouteChangeInProgress:(BOOL)a3
{
  if (self->routeChangeToSpeakerInProgress != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->routeChangeToSpeakerInProgress = a3;
  }
}

- (void)_setTUIncomingCallState:(BOOL)a3
{
  if (self->TUIncomingCallAnswered != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->TUIncomingCallAnswered = a3;
  }
}

- (void)_setShouldStayOnVirtual:(BOOL)a3
{
  if (self->shouldStayOnVirtual != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->shouldStayOnVirtual = a3;
  }
}

- (unsigned)builtInMicAudioDeviceID
{
  return self->builtInMicAudioDeviceID;
}

- (void)setBuiltInMicAudioDeviceID:(unsigned int)a3
{
  self->builtInMicAudioDeviceID = a3;
}

- (unsigned)builtInSpeakerAudioDeviceID
{
  return self->builtInSpeakerAudioDeviceID;
}

- (void)setBuiltInSpeakerAudioDeviceID:(unsigned int)a3
{
  self->builtInSpeakerAudioDeviceID = a3;
}

- (NSMutableSet)hijackBlockingClientSet
{
  return self->hijackBlockingClientSet;
}

- (void)setHijackBlockingClientSet:(id)a3
{
}

- (BOOL)hijackedByPhoneCall
{
  return self->hijackedByPhoneCall;
}

- (BOOL)incomingCallRingtone
{
  return self->incomingCallRingtone;
}

- (BOOL)routeChangeToSpeakerInProgress
{
  return self->routeChangeToSpeakerInProgress;
}

- (void)setRouteChangeToSpeakerInProgress:(BOOL)a3
{
  self->routeChangeToSpeakerInProgress = a3;
}

- (BOOL)TUIncomingCallAnswered
{
  return self->TUIncomingCallAnswered;
}

- (BOOL)shouldStayOnVirtual
{
  return self->shouldStayOnVirtual;
}

- (NSString)activePlayingApp
{
  return self->_activePlayingApp;
}

- (void)setActivePlayingApp:(id)a3
{
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (void)setAudioDestination:(id)a3
{
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (void)setAudioRoute:(int)a3
{
  self->_audioRoute = a3;
}

- (unsigned)audioRouteDevice
{
  return self->_audioRouteDevice;
}

- (void)setAudioRouteDevice:(unsigned int)a3
{
  self->_audioRouteDevice = a3;
}

- (BOOL)audioRouteDeviceRegistered
{
  return self->_audioRouteDeviceRegistered;
}

- (void)setAudioRouteDeviceRegistered:(BOOL)a3
{
  self->_audioRouteDeviceRegistered = a3;
}

- (NSMutableDictionary)audioSessionkMap
{
  return self->_audioSessionkMap;
}

- (void)setAudioSessionkMap:(id)a3
{
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (BOOL)builtInMicRegistered
{
  return self->_builtInMicRegistered;
}

- (void)setBuiltInMicRegistered:(BOOL)a3
{
  self->_builtInMicRegistered = a3;
}

- (BOOL)builtInSpeakerRegistered
{
  return self->_builtInSpeakerRegistered;
}

- (void)setBuiltInSpeakerRegistered:(BOOL)a3
{
  self->_builtInSpeakerRegistered = a3;
}

- (int)callIncomingConnected
{
  return self->_callIncomingConnected;
}

- (void)setCallIncomingConnected:(int)a3
{
  self->_callIncomingConnected = a3;
}

- (int)callIncomingUnconnected
{
  return self->_callIncomingUnconnected;
}

- (void)setCallIncomingUnconnected:(int)a3
{
  self->_callIncomingUnconnected = a3;
}

- (unint64_t)callStartTicks
{
  return self->_callStartTicks;
}

- (void)setCallStartTicks:(unint64_t)a3
{
  self->_callStartTicks = a3;
}

- (NSSet)conferencingCallSets
{
  return self->_conferencingCallSets;
}

- (void)setConferencingCallSets:(id)a3
{
}

- (NSString)evalPreemptiveBannerResult
{
  return self->_evalPreemptiveBannerResult;
}

- (void)setEvalPreemptiveBannerResult:(id)a3
{
}

- (NSMutableDictionary)evalWxMap
{
  return self->_evalWxMap;
}

- (void)setEvalWxMap:(id)a3
{
}

- (NSString)evalResult
{
  return self->_evalResult;
}

- (void)setEvalResult:(id)a3
{
}

- (unint64_t)evalTicks
{
  return self->_evalTicks;
}

- (void)setEvalTicks:(unint64_t)a3
{
  self->_evalTicks = a3;
}

- (unint64_t)hfpSetupFailTicks
{
  return self->_hfpSetupFailTicks;
}

- (void)setHfpSetupFailTicks:(unint64_t)a3
{
  self->_hfpSetupFailTicks = a3;
}

- (BOOL)magnetConnected
{
  return self->_magnetConnected;
}

- (void)setMagnetConnected:(BOOL)a3
{
  self->_magnetConnected = a3;
}

- (unint64_t)manualRouteSpeakerTicks
{
  return self->_manualRouteSpeakerTicks;
}

- (void)setManualRouteSpeakerTicks:(unint64_t)a3
{
  self->_manualRouteSpeakerTicks = a3;
}

- (NSMutableDictionary)isFirstConnectionAfterSREnable
{
  return self->_isFirstConnectionAfterSREnable;
}

- (void)setIsFirstConnectionAfterSREnable:(id)a3
{
}

- (unint64_t)predictiveRouteTicks
{
  return self->_predictiveRouteTicks;
}

- (void)setPredictiveRouteTicks:(unint64_t)a3
{
  self->_predictiveRouteTicks = a3;
}

- (NSString)routeToSpeakerReason
{
  return self->_routeToSpeakerReason;
}

- (void)setRouteToSpeakerReason:(id)a3
{
}

- (NSString)routingRequestWx
{
  return self->_routingRequestWx;
}

- (void)setRoutingRequestWx:(id)a3
{
}

- (NSMutableDictionary)TUCallMap
{
  return self->_TUCallMap;
}

- (void)setTUCallMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_TUCallMap, 0);
  objc_storeStrong((id *)&self->_routingRequestWx, 0);
  objc_storeStrong((id *)&self->_routeToSpeakerReason, 0);
  objc_storeStrong((id *)&self->_isFirstConnectionAfterSREnable, 0);
  objc_storeStrong((id *)&self->_evalResult, 0);
  objc_storeStrong((id *)&self->_evalWxMap, 0);
  objc_storeStrong((id *)&self->_evalPreemptiveBannerResult, 0);
  objc_storeStrong((id *)&self->_conferencingCallSets, 0);
  objc_storeStrong((id *)&self->_audioSessionkMap, 0);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_activePlayingApp, 0);

  objc_storeStrong((id *)&self->hijackBlockingClientSet, 0);
}

@end