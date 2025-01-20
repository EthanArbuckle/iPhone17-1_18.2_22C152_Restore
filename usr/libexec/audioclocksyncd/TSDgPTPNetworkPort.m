@interface TSDgPTPNetworkPort
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)_enabled;
- (BOOL)_hasLocalFrequencyStabilityLower;
- (BOOL)_hasLocalFrequencyStabilityUpper;
- (BOOL)_hasLocalFrequencyToleranceLower;
- (BOOL)_hasLocalFrequencyToleranceUpper;
- (BOOL)_hasRemoteFrequencyStabilityLower;
- (BOOL)_hasRemoteFrequencyStabilityUpper;
- (BOOL)_hasRemoteFrequencyToleranceLower;
- (BOOL)_hasRemoteFrequencyToleranceUpper;
- (BOOL)_isASCapable;
- (BOOL)_overridenReceiveMatching;
- (BOOL)_remoteIsSameDevice;
- (BOOL)deregisterAsyncCallbackError:(id *)a3;
- (BOOL)disablePortError:(id *)a3;
- (BOOL)enablePortError:(id *)a3;
- (BOOL)enabled;
- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4;
- (BOOL)hasLocalFrequencyStabilityLower;
- (BOOL)hasLocalFrequencyStabilityUpper;
- (BOOL)hasLocalFrequencyToleranceLower;
- (BOOL)hasLocalFrequencyToleranceUpper;
- (BOOL)hasRemoteFrequencyStabilityLower;
- (BOOL)hasRemoteFrequencyStabilityUpper;
- (BOOL)hasRemoteFrequencyToleranceLower;
- (BOOL)hasRemoteFrequencyToleranceUpper;
- (BOOL)isASCapable;
- (BOOL)overrideReceiveMatchingWithRemoteClockIdentity:(unint64_t)a3 remotePortNumber:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)overridenReceiveMatching;
- (BOOL)registerAsyncCallbackError:(id *)a3;
- (BOOL)remoteIsSameDevice;
- (BOOL)requestRemoteMessageIntervalsWithPDelayMessageInterval:(char)a3 syncMessageInterval:(char)a4 announceMessageInterval:(char)a5 error:(id *)a6;
- (BOOL)restoreReceiveMatchingError:(id *)a3;
- (IODConnection)connection;
- (NSString)destinationAddressString;
- (NSString)interfaceName;
- (NSString)sourceAddressString;
- (TSDgPTPNetworkPort)initWithService:(id)a3 pid:(int)a4;
- (char)_localAnnounceLogMeanInterval;
- (char)_localSyncLogMeanInterval;
- (char)_remoteAnnounceLogMeanInterval;
- (char)_remoteSyncLogMeanInterval;
- (char)localAnnounceLogMeanInterval;
- (char)localSyncLogMeanInterval;
- (char)remoteAnnounceLogMeanInterval;
- (char)remoteSyncLogMeanInterval;
- (id)_destinationAddressString;
- (id)_interfaceName;
- (id)_sourceAddressString;
- (id)propertiesForXPC;
- (int)_localFrequencyStabilityLower;
- (int)_localFrequencyStabilityUpper;
- (int)_localFrequencyToleranceLower;
- (int)_localFrequencyToleranceUpper;
- (int)_remoteFrequencyStabilityLower;
- (int)_remoteFrequencyStabilityUpper;
- (int)_remoteFrequencyToleranceLower;
- (int)_remoteFrequencyToleranceUpper;
- (int)localFrequencyStabilityLower;
- (int)localFrequencyStabilityUpper;
- (int)localFrequencyToleranceLower;
- (int)localFrequencyToleranceUpper;
- (int)remoteFrequencyStabilityLower;
- (int)remoteFrequencyStabilityUpper;
- (int)remoteFrequencyToleranceLower;
- (int)remoteFrequencyToleranceUpper;
- (unint64_t)_overridenReceiveClockIdentity;
- (unint64_t)_remoteClockIdentity;
- (unint64_t)overridenReceiveClockIdentity;
- (unint64_t)remoteClockIdentity;
- (unsigned)_localLinkType;
- (unsigned)_localOscillatorType;
- (unsigned)_localTimestampingMode;
- (unsigned)_maximumPropagationDelay;
- (unsigned)_maximumRawDelay;
- (unsigned)_minimumPropagationDelay;
- (unsigned)_minimumRawDelay;
- (unsigned)_overridenReceivePortNumber;
- (unsigned)_propagationDelay;
- (unsigned)_propagationDelayLimit;
- (unsigned)_remoteLinkType;
- (unsigned)_remoteOscillatorType;
- (unsigned)_remotePortNumber;
- (unsigned)_remoteTimestampingMode;
- (unsigned)localLinkType;
- (unsigned)localOscillatorType;
- (unsigned)localTimestampingMode;
- (unsigned)maximumPropagationDelay;
- (unsigned)maximumRawDelay;
- (unsigned)minimumPropagationDelay;
- (unsigned)minimumRawDelay;
- (unsigned)overridenReceivePortNumber;
- (unsigned)propagationDelay;
- (unsigned)propagationDelayLimit;
- (unsigned)remoteLinkType;
- (unsigned)remoteOscillatorType;
- (unsigned)remotePortNumber;
- (unsigned)remoteTimestampingMode;
- (void)_handleNotification:(int)a3 withArg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7 arg5:(unint64_t)a8 arg6:(unint64_t)a9;
- (void)_handleRefreshConnection;
- (void)addClient:(id)a3;
- (void)removeClient:(id)a3;
- (void)serviceTerminated;
- (void)setAsCapable:(BOOL)a3;
- (void)setDestinationAddressString:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3;
- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3;
- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3;
- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3;
- (void)setHasRemoteFrequencyStabilityLower:(BOOL)a3;
- (void)setHasRemoteFrequencyStabilityUpper:(BOOL)a3;
- (void)setHasRemoteFrequencyToleranceLower:(BOOL)a3;
- (void)setHasRemoteFrequencyToleranceUpper:(BOOL)a3;
- (void)setLocalAnnounceLogMeanInterval:(char)a3;
- (void)setLocalFrequencyStabilityLower:(int)a3;
- (void)setLocalFrequencyStabilityUpper:(int)a3;
- (void)setLocalFrequencyToleranceLower:(int)a3;
- (void)setLocalFrequencyToleranceUpper:(int)a3;
- (void)setLocalLinkType:(unsigned __int8)a3;
- (void)setLocalOscillatorType:(unsigned __int8)a3;
- (void)setLocalSyncLogMeanInterval:(char)a3;
- (void)setLocalTimestampingMode:(unsigned __int8)a3;
- (void)setMaximumPropagationDelay:(unsigned int)a3;
- (void)setMaximumRawDelay:(unsigned int)a3;
- (void)setMinimumPropagationDelay:(unsigned int)a3;
- (void)setMinimumRawDelay:(unsigned int)a3;
- (void)setOverridenReceiveClockIdentity:(unint64_t)a3;
- (void)setOverridenReceiveMatching:(BOOL)a3;
- (void)setOverridenReceivePortNumber:(unsigned __int16)a3;
- (void)setPropagationDelay:(unsigned int)a3;
- (void)setPropagationDelayLimit:(unsigned int)a3;
- (void)setRemoteAnnounceLogMeanInterval:(char)a3;
- (void)setRemoteClockIdentity:(unint64_t)a3;
- (void)setRemoteFrequencyStabilityLower:(int)a3;
- (void)setRemoteFrequencyStabilityUpper:(int)a3;
- (void)setRemoteFrequencyToleranceLower:(int)a3;
- (void)setRemoteFrequencyToleranceUpper:(int)a3;
- (void)setRemoteIsSameDevice:(BOOL)a3;
- (void)setRemoteLinkType:(unsigned __int8)a3;
- (void)setRemoteOscillatorType:(unsigned __int8)a3;
- (void)setRemotePortNumber:(unsigned __int16)a3;
- (void)setRemoteSyncLogMeanInterval:(char)a3;
- (void)setRemoteTimestampingMode:(unsigned __int8)a3;
- (void)setSourceAddressString:(id)a3;
- (void)updateProperties;
@end

@implementation TSDgPTPNetworkPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncNetworkPort";
  CFStringRef v7 = @"ClockIdentifier";
  v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v8 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

- (TSDgPTPNetworkPort)initWithService:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  CFStringRef v7 = +[NSPointerArray weakObjectsPointerArray];
  clients = self->_clients;
  self->_clients = v7;

  self->_clientsLock._os_unfair_lock_opaque = 0;
  v19.receiver = self;
  v19.super_class = (Class)TSDgPTPNetworkPort;
  v9 = [(TSDgPTPPort *)&v19 initWithService:v6 pid:v4];
  if (v9)
  {
    v10 = [[IODConnection alloc] initWithService:v6 andType:42];
    connection = v9->_connection;
    v9->_connection = v10;

    if (v9->_connection)
    {
      uint64_t v12 = [(TSDgPTPNetworkPort *)v9 _interfaceName];
      interfaceName = v9->_interfaceName;
      v9->_interfaceName = (NSString *)v12;

      v9->_remoteClockIdentity = [(TSDgPTPNetworkPort *)v9 _remoteClockIdentity];
      v9->_remotePortNumber = [(TSDgPTPNetworkPort *)v9 _remotePortNumber];
      v9->_remoteIsSameDevice = [(TSDgPTPNetworkPort *)v9 _remoteIsSameDevice];
      v9->_asCapable = [(TSDgPTPNetworkPort *)v9 _isASCapable];
      v9->_propagationDelay = [(TSDgPTPNetworkPort *)v9 _propagationDelay];
      v9->_maximumPropagationDelay = [(TSDgPTPNetworkPort *)v9 _maximumPropagationDelay];
      v9->_minimumPropagationDelay = [(TSDgPTPNetworkPort *)v9 _minimumPropagationDelay];
      v9->_propagationDelayLimit = [(TSDgPTPNetworkPort *)v9 _propagationDelayLimit];
      v9->_maximumRawDelay = [(TSDgPTPNetworkPort *)v9 _maximumRawDelay];
      v9->_minimumRawDelay = [(TSDgPTPNetworkPort *)v9 _minimumRawDelay];
      v9->_localSyncLogMeanInterval = [(TSDgPTPNetworkPort *)v9 _localSyncLogMeanInterval];
      v9->_remoteSyncLogMeanInterval = [(TSDgPTPNetworkPort *)v9 _remoteSyncLogMeanInterval];
      v9->_localAnnounceLogMeanInterval = [(TSDgPTPNetworkPort *)v9 _localAnnounceLogMeanInterval];
      v9->_remoteAnnounceLogMeanInterval = [(TSDgPTPNetworkPort *)v9 _remoteAnnounceLogMeanInterval];
      v9->_localLinkType = [(TSDgPTPNetworkPort *)v9 _localLinkType];
      v9->_remoteLinkType = [(TSDgPTPNetworkPort *)v9 _remoteLinkType];
      v9->_localTimestampingMode = [(TSDgPTPNetworkPort *)v9 _localTimestampingMode];
      v9->_remoteTimestampingMode = [(TSDgPTPNetworkPort *)v9 _remoteTimestampingMode];
      v9->_localOscillatorType = [(TSDgPTPNetworkPort *)v9 _localOscillatorType];
      v9->_remoteOscillatorType = [(TSDgPTPNetworkPort *)v9 _remoteOscillatorType];
      v9->_hasLocalFrequencyToleranceLower = [(TSDgPTPNetworkPort *)v9 _hasLocalFrequencyToleranceLower];
      v9->_localFrequencyToleranceLower = [(TSDgPTPNetworkPort *)v9 _localFrequencyToleranceLower];
      v9->_hasLocalFrequencyToleranceUpper = [(TSDgPTPNetworkPort *)v9 _hasLocalFrequencyToleranceUpper];
      v9->_localFrequencyToleranceUpper = [(TSDgPTPNetworkPort *)v9 _localFrequencyToleranceUpper];
      v9->_hasRemoteFrequencyToleranceLower = [(TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyToleranceLower];
      v9->_remoteFrequencyToleranceLower = [(TSDgPTPNetworkPort *)v9 _remoteFrequencyToleranceLower];
      v9->_hasRemoteFrequencyToleranceUpper = [(TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyToleranceUpper];
      v9->_remoteFrequencyToleranceUpper = [(TSDgPTPNetworkPort *)v9 _remoteFrequencyToleranceUpper];
      v9->_hasLocalFrequencyStabilityLower = [(TSDgPTPNetworkPort *)v9 _hasLocalFrequencyStabilityLower];
      v9->_localFrequencyStabilityLower = [(TSDgPTPNetworkPort *)v9 _localFrequencyStabilityLower];
      v9->_hasLocalFrequencyStabilityUpper = [(TSDgPTPNetworkPort *)v9 _hasLocalFrequencyStabilityUpper];
      v9->_localFrequencyStabilityUpper = [(TSDgPTPNetworkPort *)v9 _localFrequencyStabilityUpper];
      v9->_hasRemoteFrequencyStabilityLower = [(TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyStabilityLower];
      v9->_remoteFrequencyStabilityLower = [(TSDgPTPNetworkPort *)v9 _remoteFrequencyStabilityLower];
      v9->_hasRemoteFrequencyStabilityUpper = [(TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyStabilityUpper];
      v9->_remoteFrequencyStabilityUpper = [(TSDgPTPNetworkPort *)v9 _remoteFrequencyStabilityUpper];
      uint64_t v14 = [(TSDgPTPNetworkPort *)v9 _sourceAddressString];
      sourceAddressString = v9->_sourceAddressString;
      v9->_sourceAddressString = (NSString *)v14;

      uint64_t v16 = [(TSDgPTPNetworkPort *)v9 _destinationAddressString];
      destinationAddressString = v9->_destinationAddressString;
      v9->_destinationAddressString = (NSString *)v16;

      v9->_overridenReceiveMatching = [(TSDgPTPNetworkPort *)v9 _overridenReceiveMatching];
      v9->_overridenReceiveClockIdentity = [(TSDgPTPNetworkPort *)v9 _overridenReceiveClockIdentity];
      v9->_overridenReceivePortNumber = [(TSDgPTPNetworkPort *)v9 _overridenReceivePortNumber];
      v9->_enabled = [(TSDgPTPNetworkPort *)v9 _enabled];
      v9->_asyncCallbackRefcon = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "_connection != nil";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        v27 = &unk_100030E47;
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        __int16 v30 = 1024;
        int v31 = 725;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (void)updateProperties
{
  v89.receiver = self;
  v89.super_class = (Class)TSDgPTPNetworkPort;
  [(TSDgPTPPort *)&v89 updateProperties];
  unint64_t v46 = [(TSDgPTPNetworkPort *)self _remoteClockIdentity];
  unsigned __int16 v45 = [(TSDgPTPNetworkPort *)self _remotePortNumber];
  unsigned __int8 v44 = [(TSDgPTPNetworkPort *)self _remoteIsSameDevice];
  unsigned __int8 v43 = [(TSDgPTPNetworkPort *)self _isASCapable];
  unsigned int v42 = [(TSDgPTPNetworkPort *)self _propagationDelay];
  unsigned int v41 = [(TSDgPTPNetworkPort *)self _maximumPropagationDelay];
  unsigned int v39 = [(TSDgPTPNetworkPort *)self _minimumPropagationDelay];
  unsigned int v38 = [(TSDgPTPNetworkPort *)self _maximumRawDelay];
  unsigned int v40 = [(TSDgPTPNetworkPort *)self _minimumRawDelay];
  unsigned __int8 v37 = [(TSDgPTPNetworkPort *)self _localSyncLogMeanInterval];
  unsigned __int8 v36 = [(TSDgPTPNetworkPort *)self _remoteSyncLogMeanInterval];
  unsigned __int8 v35 = [(TSDgPTPNetworkPort *)self _localAnnounceLogMeanInterval];
  unsigned __int8 v34 = [(TSDgPTPNetworkPort *)self _remoteAnnounceLogMeanInterval];
  unsigned __int8 v33 = [(TSDgPTPNetworkPort *)self _localLinkType];
  unsigned __int8 v32 = [(TSDgPTPNetworkPort *)self _remoteLinkType];
  unsigned __int8 v31 = [(TSDgPTPNetworkPort *)self _localTimestampingMode];
  unsigned __int8 v30 = [(TSDgPTPNetworkPort *)self _remoteTimestampingMode];
  unsigned __int8 v29 = [(TSDgPTPNetworkPort *)self _localOscillatorType];
  unsigned __int8 v28 = [(TSDgPTPNetworkPort *)self _remoteOscillatorType];
  unsigned __int8 v27 = [(TSDgPTPNetworkPort *)self _hasLocalFrequencyToleranceLower];
  unsigned int v26 = [(TSDgPTPNetworkPort *)self _localFrequencyToleranceLower];
  unsigned __int8 v25 = [(TSDgPTPNetworkPort *)self _hasLocalFrequencyToleranceUpper];
  unsigned int v24 = [(TSDgPTPNetworkPort *)self _localFrequencyToleranceUpper];
  unsigned __int8 v23 = [(TSDgPTPNetworkPort *)self _hasRemoteFrequencyToleranceLower];
  unsigned int v22 = [(TSDgPTPNetworkPort *)self _remoteFrequencyToleranceLower];
  unsigned __int8 v21 = [(TSDgPTPNetworkPort *)self _hasRemoteFrequencyToleranceUpper];
  unsigned int v20 = [(TSDgPTPNetworkPort *)self _remoteFrequencyToleranceUpper];
  unsigned __int8 v19 = [(TSDgPTPNetworkPort *)self _hasLocalFrequencyStabilityLower];
  unsigned int v18 = [(TSDgPTPNetworkPort *)self _localFrequencyStabilityLower];
  unsigned __int8 v17 = [(TSDgPTPNetworkPort *)self _hasLocalFrequencyStabilityUpper];
  unsigned int v16 = [(TSDgPTPNetworkPort *)self _localFrequencyStabilityUpper];
  unsigned __int8 v15 = [(TSDgPTPNetworkPort *)self _hasRemoteFrequencyStabilityLower];
  unsigned int v14 = [(TSDgPTPNetworkPort *)self _remoteFrequencyStabilityLower];
  unsigned __int8 v3 = [(TSDgPTPNetworkPort *)self _hasRemoteFrequencyStabilityUpper];
  unsigned int v4 = [(TSDgPTPNetworkPort *)self _remoteFrequencyStabilityUpper];
  v5 = [(TSDgPTPNetworkPort *)self _sourceAddressString];
  id v6 = [(TSDgPTPNetworkPort *)self _destinationAddressString];
  unsigned __int8 v7 = [(TSDgPTPNetworkPort *)self _overridenReceiveMatching];
  unint64_t v8 = [(TSDgPTPNetworkPort *)self _overridenReceiveClockIdentity];
  unsigned __int16 v9 = [(TSDgPTPNetworkPort *)self _overridenReceivePortNumber];
  unsigned __int8 v10 = [(TSDgPTPNetworkPort *)self _enabled];
  v11 = [(TSDgPTPPort *)self propertyUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E65C;
  block[3] = &unk_10003C6C8;
  unint64_t v50 = v46;
  unsigned __int16 v65 = v45;
  unsigned __int8 v67 = v44;
  unsigned __int8 v68 = v43;
  unsigned int v52 = v42;
  unsigned int v53 = v41;
  unsigned int v54 = v39;
  unsigned int v55 = v38;
  unsigned __int8 v69 = v37;
  unsigned __int8 v70 = v36;
  unsigned __int8 v71 = v35;
  unsigned __int8 v72 = v34;
  unsigned __int8 v73 = v33;
  unsigned __int8 v74 = v32;
  unsigned __int8 v75 = v31;
  unsigned __int8 v76 = v30;
  unsigned __int8 v77 = v29;
  unsigned __int8 v78 = v28;
  unsigned __int8 v79 = v27;
  unsigned int v56 = v40;
  unsigned int v57 = v26;
  unsigned __int8 v80 = v25;
  unsigned __int8 v81 = v23;
  unsigned int v58 = v24;
  unsigned int v59 = v22;
  unsigned __int8 v82 = v21;
  unsigned __int8 v83 = v19;
  unsigned int v60 = v20;
  unsigned int v61 = v18;
  unsigned __int8 v84 = v17;
  unsigned __int8 v85 = v15;
  unsigned int v62 = v16;
  unsigned int v63 = v14;
  unsigned __int8 v86 = v3;
  unsigned int v64 = v4;
  unsigned __int8 v87 = v7;
  unint64_t v51 = v8;
  unsigned __int16 v66 = v9;
  unsigned __int8 v88 = v10;
  block[4] = self;
  id v48 = v5;
  id v49 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v11, block);
}

- (IODConnection)connection
{
  return self->_connection;
}

- (unint64_t)_remoteClockIdentity
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteClockIdentity"];

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (unsigned)_remotePortNumber
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemotePortNumber"];

  if (v3) {
    unsigned __int16 v4 = (unsigned __int16)[v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (BOOL)_remoteIsSameDevice
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteIsSameDevice"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_isASCapable
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"ASCapable"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)_propagationDelay
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LinkPropagationDelay"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)_maximumPropagationDelay
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"MaximumPropagationDelay"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)_minimumPropagationDelay
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"MinimumPropagationDelay"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = -1;
  }

  return v4;
}

- (unsigned)_propagationDelayLimit
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"PropagationDelayLimit"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)_maximumRawDelay
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"MaximumRawDelay"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)_minimumRawDelay
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"MinimumRawDelay"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = -1;
  }

  return v4;
}

- (id)_sourceAddressString
{
  return @"Unknown";
}

- (id)_destinationAddressString
{
  return @"Unknown";
}

- (char)_localSyncLogMeanInterval
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalSyncLogMeanInterval"];

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (char)_remoteSyncLogMeanInterval
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteSyncLogMeanInterval"];

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (char)_localAnnounceLogMeanInterval
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalAnnounceLogMeanInterval"];

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (char)_remoteAnnounceLogMeanInterval
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteAnnounceLogMeanInterval"];

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unsigned)_localLinkType
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalLinkType"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)_remoteLinkType
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteLinkType"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)_localTimestampingMode
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalTimestampingMode"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)_remoteTimestampingMode
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteTimestampingMode"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)_localOscillatorType
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalOscillatorType"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)_remoteOscillatorType
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteOscillatorType"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"];

  return v3 != 0;
}

- (int)_localFrequencyToleranceLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"];

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasRemoteFrequencyToleranceLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceLower"];

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceLower"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasRemoteFrequencyToleranceUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceUpper"];

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceUpper"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"];

  return v3 != 0;
}

- (int)_localFrequencyStabilityLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"];

  return v3 != 0;
}

- (int)_localFrequencyStabilityUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasRemoteFrequencyStabilityLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityLower"];

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityLower
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityLower"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasRemoteFrequencyStabilityUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityUpper"];

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityUpper
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityUpper"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_overridenReceiveMatching
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"OverridenReceiveMatching"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unint64_t)_overridenReceiveClockIdentity
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"OverridenReceiveClockIdentity"];

  if (v3) {
    unint64_t v4 = (unint64_t)[v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unsigned)_overridenReceivePortNumber
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"OverridenReceivePortNumber"];

  if (v3) {
    unsigned __int16 v4 = (unsigned __int16)[v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = -1;
  }

  return v4;
}

- (BOOL)_enabled
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"PTPPortEnabled"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_interfaceName
{
  v2 = [(TSDgPTPPort *)self service];
  unsigned __int8 v3 = [v2 iodPropertyForKey:@"InterfaceName"];

  return v3;
}

- (BOOL)requestRemoteMessageIntervalsWithPDelayMessageInterval:(char)a3 syncMessageInterval:(char)a4 announceMessageInterval:(char)a5 error:(id *)a6
{
  int v8 = 0;
  v21[0] = a3;
  v21[1] = a4;
  v21[2] = a5;
  BOOL v6 = [(IODConnection *)self->_connection callMethodWithSelector:0 scalarInputs:v21 scalarInputCount:3 scalarOutputs:0 scalarOutputCount:&v8 error:0];
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    unsigned __int8 v10 = "result == YES";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    unsigned int v16 = &unk_100030E47;
    __int16 v17 = 2080;
    unsigned int v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v19 = 1024;
    int v20 = 1569;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v6;
}

- (BOOL)overrideReceiveMatchingWithRemoteClockIdentity:(unint64_t)a3 remotePortNumber:(unsigned __int16)a4 error:(id *)a5
{
  int v7 = 0;
  v20[0] = a3;
  v20[1] = a4;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:1 scalarInputs:v20 scalarInputCount:2 scalarOutputs:0 scalarOutputCount:&v7 error:0];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    unsigned __int16 v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_100030E47;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v18 = 1024;
    int v19 = 1585;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v5;
}

- (BOOL)restoreReceiveMatchingError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:2 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:0];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v16 = 1024;
    int v17 = 1597;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)enablePortError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:3 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:0];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v16 = 1024;
    int v17 = 1609;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)disablePortError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:4 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:0];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v16 = 1024;
    int v17 = 1621;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4
{
  if (a3)
  {
    BOOL v6 = [(TSDgPTPPort *)self propertyUpdateQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_100010174;
    v9[3] = &unk_10003C6F0;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v6, v9);
  }
  else if (a4)
  {
    *a4 = +[NSError errorWithDomain:@"TSDErrorDomain" code:-536870206 userInfo:0];
  }
  return a3 != 0;
}

- (void)_handleRefreshConnection
{
  [(TSDgPTPNetworkPort *)self updateProperties];
  unsigned __int8 v3 = [(TSDgPTPNetworkPort *)self _isASCapable];
  os_unfair_lock_t lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned __int8 v4 = self->_clients;
  id v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      __int16 v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          __int16 v10 = [(TSDgPTPPort *)self propertyUpdateQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000103D0;
          block[3] = &unk_10003C718;
          unsigned __int8 v13 = v3;
          block[4] = v9;
          void block[5] = self;
          dispatch_async(v10, block);
        }
        __int16 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_handleNotification:(int)a3 withArg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7 arg5:(unint64_t)a8 arg6:(unint64_t)a9
{
  queue = [(TSDgPTPPort *)self propertyUpdateQueue];
  int v10 = a3 - 4000;
  switch(a3)
  {
    case 4000:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        id v37 = [v11 UTF8String];
        __int16 v12 = "%s: notification for MAC lookup timeout\n";
        goto LABEL_13;
      }
      break;
    case 4001:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        id v37 = [v11 UTF8String];
        __int16 v12 = "%s: notification for sync timeout\n";
        goto LABEL_13;
      }
      break;
    case 4002:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        id v37 = [v13 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: notification for AS capable change\n", buf, 0xCu);
      }
      [(TSDgPTPNetworkPort *)self updateProperties];
      break;
    case 4003:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        id v37 = [v11 UTF8String];
        __int16 v12 = "%s: notification for admin enable\n";
        goto LABEL_13;
      }
      break;
    case 4004:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        id v37 = [v11 UTF8String];
        __int16 v12 = "%s: notification for announce timeout\n";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
      break;
    default:
      break;
  }
  os_unfair_lock_t lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v14 = self->_clients;
  id v15 = [(NSPointerArray *)v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    unsigned __int8 v21 = v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        int v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        switch(v10)
        {
          case 0:
            if (objc_opt_respondsToSelector()) {
              [v19 didTimeoutOnMACLookupForPort:self];
            }
            break;
          case 1:
            if (objc_opt_respondsToSelector()) {
              [v19 didSyncTimeoutForPort:self];
            }
            if (objc_opt_respondsToSelector()) {
              [v19 didSyncTimeoutWithMean:a4 median:a5 standardDeviation:a6 minimum:a7 maximum:a8 numberOfSamples:a9 forPort:self];
            }
            break;
          case 2:
            if (objc_opt_respondsToSelector())
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              v30[0] = sub_10001093C;
              v30[1] = &unk_10003C740;
              v30[2] = v19;
              v30[3] = self;
              v30[4] = a4;
              dispatch_async(queue, block);
            }
            break;
          case 3:
            if (objc_opt_respondsToSelector()) {
              [v19 didChangeAdministrativeEnable:a4 != 0 forPort:self];
            }
            break;
          case 4:
            if (objc_opt_respondsToSelector()) {
              [v19 didAnnounceTimeoutForPort:self];
            }
            break;
          default:
            continue;
        }
      }
      id v16 = [(NSPointerArray *)v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)registerAsyncCallbackError:(id *)a3
{
  unsigned __int8 v4 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  self->_asyncCallbackRefcon = (unint64_t)[v4 allocateRefcon:self];

  id v5 = [(TSDgPTPNetworkPort *)self connection];
  unsigned __int8 v6 = [v5 registerAsyncNotificationsWithSelector:5 callBack:sub_1000069D0 refcon:self->_asyncCallbackRefcon callbackQueue:qword_100047C38];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }
  return v6;
}

- (BOOL)deregisterAsyncCallbackError:(id *)a3
{
  unsigned __int8 v4 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  [v4 releaseRefcon:self->_asyncCallbackRefcon];

  id v5 = [(TSDgPTPNetworkPort *)self connection];
  unsigned __int8 v6 = [v5 deregisterAsyncNotificationsWithSelector:6];

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    id v15 = &unk_100030E47;
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v18 = 1024;
    int v19 = 1809;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
  }
  return v6;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  [(NSPointerArray *)self->_clients compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_clients;
  id v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) == v4)
        {

          goto LABEL_11;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (void)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_clientsLock);
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  [(NSPointerArray *)self->_clients compact];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_clients;
  id v6 = (char *)[(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      long long v10 = 0;
      long long v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", &v10[(void)v8], (void)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      id v7 = (char *)[(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientsLock);
}

- (void)serviceTerminated
{
  v13.receiver = self;
  v13.super_class = (Class)TSDgPTPNetworkPort;
  [(TSDgPTPPort *)&v13 serviceTerminated];
  os_unfair_lock_lock(&self->_clientsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v3 = self->_clients;
  id v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 didTerminateServiceForPort:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_clientsLock);
}

- (id)propertiesForXPC
{
  v12.receiver = self;
  v12.super_class = (Class)TSDgPTPNetworkPort;
  v2 = [(TSDgPTPPort *)&v12 propertiesForXPC];
  unsigned __int8 v3 = [v2 objectForKeyedSubscript:@"OverridenReceiveClockIdentity"];

  if (!v3)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:-1];
    [v2 setObject:v4 forKeyedSubscript:@"OverridenReceiveClockIdentity"];
  }
  id v5 = [v2 objectForKeyedSubscript:@"OverridenReceivePortNumber"];

  if (!v5)
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedShort:0xFFFFLL];
    [v2 setObject:v6 forKeyedSubscript:@"OverridenReceivePortNumber"];
  }
  id v7 = [v2 objectForKeyedSubscript:@"MinimumPropagationDelay"];

  if (!v7)
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:0xFFFFFFFFLL];
    [v2 setObject:v8 forKeyedSubscript:@"MinimumPropagationDelay"];
  }
  long long v9 = [v2 objectForKeyedSubscript:@"MinimumRawDelay"];

  if (!v9)
  {
    long long v10 = +[NSNumber numberWithUnsignedInt:0xFFFFFFFFLL];
    [v2 setObject:v10 forKeyedSubscript:@"MinimumRawDelay"];
  }

  return v2;
}

+ (id)diagnosticInfoForService:(id)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TSDgPTPNetworkPort;
  id v3 = a3;
  id v4 = [[super diagnosticInfoForService:v3];
  id v5 = [v3 parentIteratorInServicePlaneWithError:0];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001122C;
  v8[3] = &unk_10003C768;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateWithBlock:v8];

  return v6;
}

- (unint64_t)remoteClockIdentity
{
  return self->_remoteClockIdentity;
}

- (void)setRemoteClockIdentity:(unint64_t)a3
{
  self->_remoteClockIdentity = a3;
}

- (unsigned)remotePortNumber
{
  return self->_remotePortNumber;
}

- (void)setRemotePortNumber:(unsigned __int16)a3
{
  self->_remotePortNumber = a3;
}

- (BOOL)remoteIsSameDevice
{
  return self->_remoteIsSameDevice;
}

- (void)setRemoteIsSameDevice:(BOOL)a3
{
  self->_remoteIsSameDevice = a3;
}

- (BOOL)isASCapable
{
  return self->_asCapable;
}

- (void)setAsCapable:(BOOL)a3
{
  self->_asCapable = a3;
}

- (unsigned)propagationDelay
{
  return self->_propagationDelay;
}

- (void)setPropagationDelay:(unsigned int)a3
{
  self->_propagationDelay = a3;
}

- (unsigned)maximumPropagationDelay
{
  return self->_maximumPropagationDelay;
}

- (void)setMaximumPropagationDelay:(unsigned int)a3
{
  self->_maximumPropagationDelay = a3;
}

- (unsigned)minimumPropagationDelay
{
  return self->_minimumPropagationDelay;
}

- (void)setMinimumPropagationDelay:(unsigned int)a3
{
  self->_minimumPropagationDelay = a3;
}

- (unsigned)propagationDelayLimit
{
  return self->_propagationDelayLimit;
}

- (void)setPropagationDelayLimit:(unsigned int)a3
{
  self->_propagationDelayLimit = a3;
}

- (unsigned)maximumRawDelay
{
  return self->_maximumRawDelay;
}

- (void)setMaximumRawDelay:(unsigned int)a3
{
  self->_maximumRawDelay = a3;
}

- (unsigned)minimumRawDelay
{
  return self->_minimumRawDelay;
}

- (void)setMinimumRawDelay:(unsigned int)a3
{
  self->_minimumRawDelay = a3;
}

- (char)localSyncLogMeanInterval
{
  return self->_localSyncLogMeanInterval;
}

- (void)setLocalSyncLogMeanInterval:(char)a3
{
  self->_localSyncLogMeanInterval = a3;
}

- (char)remoteSyncLogMeanInterval
{
  return self->_remoteSyncLogMeanInterval;
}

- (void)setRemoteSyncLogMeanInterval:(char)a3
{
  self->_remoteSyncLogMeanInterval = a3;
}

- (char)localAnnounceLogMeanInterval
{
  return self->_localAnnounceLogMeanInterval;
}

- (void)setLocalAnnounceLogMeanInterval:(char)a3
{
  self->_localAnnounceLogMeanInterval = a3;
}

- (char)remoteAnnounceLogMeanInterval
{
  return self->_remoteAnnounceLogMeanInterval;
}

- (void)setRemoteAnnounceLogMeanInterval:(char)a3
{
  self->_remoteAnnounceLogMeanInterval = a3;
}

- (unsigned)localLinkType
{
  return self->_localLinkType;
}

- (void)setLocalLinkType:(unsigned __int8)a3
{
  self->_localLinkType = a3;
}

- (unsigned)remoteLinkType
{
  return self->_remoteLinkType;
}

- (void)setRemoteLinkType:(unsigned __int8)a3
{
  self->_remoteLinkType = a3;
}

- (unsigned)localTimestampingMode
{
  return self->_localTimestampingMode;
}

- (void)setLocalTimestampingMode:(unsigned __int8)a3
{
  self->_localTimestampingMode = a3;
}

- (unsigned)remoteTimestampingMode
{
  return self->_remoteTimestampingMode;
}

- (void)setRemoteTimestampingMode:(unsigned __int8)a3
{
  self->_remoteTimestampingMode = a3;
}

- (unsigned)localOscillatorType
{
  return self->_localOscillatorType;
}

- (void)setLocalOscillatorType:(unsigned __int8)a3
{
  self->_localOscillatorType = a3;
}

- (unsigned)remoteOscillatorType
{
  return self->_remoteOscillatorType;
}

- (void)setRemoteOscillatorType:(unsigned __int8)a3
{
  self->_remoteOscillatorType = a3;
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return self->_hasLocalFrequencyToleranceLower;
}

- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceLower = a3;
}

- (int)localFrequencyToleranceLower
{
  return self->_localFrequencyToleranceLower;
}

- (void)setLocalFrequencyToleranceLower:(int)a3
{
  self->_localFrequencyToleranceLower = a3;
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return self->_hasLocalFrequencyToleranceUpper;
}

- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceUpper = a3;
}

- (int)localFrequencyToleranceUpper
{
  return self->_localFrequencyToleranceUpper;
}

- (void)setLocalFrequencyToleranceUpper:(int)a3
{
  self->_localFrequencyToleranceUpper = a3;
}

- (BOOL)hasRemoteFrequencyToleranceLower
{
  return self->_hasRemoteFrequencyToleranceLower;
}

- (void)setHasRemoteFrequencyToleranceLower:(BOOL)a3
{
  self->_hasRemoteFrequencyToleranceLower = a3;
}

- (int)remoteFrequencyToleranceLower
{
  return self->_remoteFrequencyToleranceLower;
}

- (void)setRemoteFrequencyToleranceLower:(int)a3
{
  self->_remoteFrequencyToleranceLower = a3;
}

- (BOOL)hasRemoteFrequencyToleranceUpper
{
  return self->_hasRemoteFrequencyToleranceUpper;
}

- (void)setHasRemoteFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasRemoteFrequencyToleranceUpper = a3;
}

- (int)remoteFrequencyToleranceUpper
{
  return self->_remoteFrequencyToleranceUpper;
}

- (void)setRemoteFrequencyToleranceUpper:(int)a3
{
  self->_remoteFrequencyToleranceUpper = a3;
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return self->_hasLocalFrequencyStabilityLower;
}

- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityLower = a3;
}

- (int)localFrequencyStabilityLower
{
  return self->_localFrequencyStabilityLower;
}

- (void)setLocalFrequencyStabilityLower:(int)a3
{
  self->_localFrequencyStabilityLower = a3;
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return self->_hasLocalFrequencyStabilityUpper;
}

- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityUpper = a3;
}

- (int)localFrequencyStabilityUpper
{
  return self->_localFrequencyStabilityUpper;
}

- (void)setLocalFrequencyStabilityUpper:(int)a3
{
  self->_localFrequencyStabilityUpper = a3;
}

- (BOOL)hasRemoteFrequencyStabilityLower
{
  return self->_hasRemoteFrequencyStabilityLower;
}

- (void)setHasRemoteFrequencyStabilityLower:(BOOL)a3
{
  self->_hasRemoteFrequencyStabilityLower = a3;
}

- (int)remoteFrequencyStabilityLower
{
  return self->_remoteFrequencyStabilityLower;
}

- (void)setRemoteFrequencyStabilityLower:(int)a3
{
  self->_remoteFrequencyStabilityLower = a3;
}

- (BOOL)hasRemoteFrequencyStabilityUpper
{
  return self->_hasRemoteFrequencyStabilityUpper;
}

- (void)setHasRemoteFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasRemoteFrequencyStabilityUpper = a3;
}

- (int)remoteFrequencyStabilityUpper
{
  return self->_remoteFrequencyStabilityUpper;
}

- (void)setRemoteFrequencyStabilityUpper:(int)a3
{
  self->_remoteFrequencyStabilityUpper = a3;
}

- (NSString)sourceAddressString
{
  return self->_sourceAddressString;
}

- (void)setSourceAddressString:(id)a3
{
}

- (NSString)destinationAddressString
{
  return self->_destinationAddressString;
}

- (void)setDestinationAddressString:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)overridenReceiveMatching
{
  return self->_overridenReceiveMatching;
}

- (void)setOverridenReceiveMatching:(BOOL)a3
{
  self->_overridenReceiveMatching = a3;
}

- (unint64_t)overridenReceiveClockIdentity
{
  return self->_overridenReceiveClockIdentity;
}

- (void)setOverridenReceiveClockIdentity:(unint64_t)a3
{
  self->_overridenReceiveClockIdentity = a3;
}

- (unsigned)overridenReceivePortNumber
{
  return self->_overridenReceivePortNumber;
}

- (void)setOverridenReceivePortNumber:(unsigned __int16)a3
{
  self->_overridenReceivePortNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_destinationAddressString, 0);
  objc_storeStrong((id *)&self->_sourceAddressString, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end