@interface _TSF_TSDgPTPNetworkPort
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
- (NSString)destinationAddressString;
- (NSString)interfaceName;
- (NSString)sourceAddressString;
- (_TSF_IODConnection)connection;
- (_TSF_TSDgPTPNetworkPort)initWithService:(id)a3 pid:(int)a4;
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

@implementation _TSF_TSDgPTPNetworkPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncNetworkPort";
  v7 = @"ClockIdentifier";
  v3 = [NSNumber numberWithUnsignedLongLong:a3];
  v8 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

- (_TSF_TSDgPTPNetworkPort)initWithService:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  clients = self->_clients;
  self->_clients = v7;

  self->_clientsLock._os_unfair_lock_opaque = 0;
  v19.receiver = self;
  v19.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  v9 = [(_TSF_TSDgPTPPort *)&v19 initWithService:v6 pid:v4];
  if (v9)
  {
    v10 = [[_TSF_IODConnection alloc] initWithService:v6 andType:42];
    connection = v9->_connection;
    v9->_connection = v10;

    if (v9->_connection)
    {
      uint64_t v12 = [(_TSF_TSDgPTPNetworkPort *)v9 _interfaceName];
      interfaceName = v9->_interfaceName;
      v9->_interfaceName = (NSString *)v12;

      v9->_remoteClockIdentity = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteClockIdentity];
      v9->_remotePortNumber = [(_TSF_TSDgPTPNetworkPort *)v9 _remotePortNumber];
      v9->_remoteIsSameDevice = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteIsSameDevice];
      v9->_asCapable = [(_TSF_TSDgPTPNetworkPort *)v9 _isASCapable];
      v9->_propagationDelay = [(_TSF_TSDgPTPNetworkPort *)v9 _propagationDelay];
      v9->_maximumPropagationDelay = [(_TSF_TSDgPTPNetworkPort *)v9 _maximumPropagationDelay];
      v9->_minimumPropagationDelay = [(_TSF_TSDgPTPNetworkPort *)v9 _minimumPropagationDelay];
      v9->_propagationDelayLimit = [(_TSF_TSDgPTPNetworkPort *)v9 _propagationDelayLimit];
      v9->_maximumRawDelay = [(_TSF_TSDgPTPNetworkPort *)v9 _maximumRawDelay];
      v9->_minimumRawDelay = [(_TSF_TSDgPTPNetworkPort *)v9 _minimumRawDelay];
      v9->_localSyncLogMeanInterval = [(_TSF_TSDgPTPNetworkPort *)v9 _localSyncLogMeanInterval];
      v9->_remoteSyncLogMeanInterval = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteSyncLogMeanInterval];
      v9->_localAnnounceLogMeanInterval = [(_TSF_TSDgPTPNetworkPort *)v9 _localAnnounceLogMeanInterval];
      v9->_remoteAnnounceLogMeanInterval = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteAnnounceLogMeanInterval];
      v9->_localLinkType = [(_TSF_TSDgPTPNetworkPort *)v9 _localLinkType];
      v9->_remoteLinkType = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteLinkType];
      v9->_localTimestampingMode = [(_TSF_TSDgPTPNetworkPort *)v9 _localTimestampingMode];
      v9->_remoteTimestampingMode = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteTimestampingMode];
      v9->_localOscillatorType = [(_TSF_TSDgPTPNetworkPort *)v9 _localOscillatorType];
      v9->_remoteOscillatorType = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteOscillatorType];
      v9->_hasLocalFrequencyToleranceLower = [(_TSF_TSDgPTPNetworkPort *)v9 _hasLocalFrequencyToleranceLower];
      v9->_localFrequencyToleranceLower = [(_TSF_TSDgPTPNetworkPort *)v9 _localFrequencyToleranceLower];
      v9->_hasLocalFrequencyToleranceUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _hasLocalFrequencyToleranceUpper];
      v9->_localFrequencyToleranceUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _localFrequencyToleranceUpper];
      v9->_hasRemoteFrequencyToleranceLower = [(_TSF_TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyToleranceLower];
      v9->_remoteFrequencyToleranceLower = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteFrequencyToleranceLower];
      v9->_hasRemoteFrequencyToleranceUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyToleranceUpper];
      v9->_remoteFrequencyToleranceUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteFrequencyToleranceUpper];
      v9->_hasLocalFrequencyStabilityLower = [(_TSF_TSDgPTPNetworkPort *)v9 _hasLocalFrequencyStabilityLower];
      v9->_localFrequencyStabilityLower = [(_TSF_TSDgPTPNetworkPort *)v9 _localFrequencyStabilityLower];
      v9->_hasLocalFrequencyStabilityUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _hasLocalFrequencyStabilityUpper];
      v9->_localFrequencyStabilityUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _localFrequencyStabilityUpper];
      v9->_hasRemoteFrequencyStabilityLower = [(_TSF_TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyStabilityLower];
      v9->_remoteFrequencyStabilityLower = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteFrequencyStabilityLower];
      v9->_hasRemoteFrequencyStabilityUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _hasRemoteFrequencyStabilityUpper];
      v9->_remoteFrequencyStabilityUpper = [(_TSF_TSDgPTPNetworkPort *)v9 _remoteFrequencyStabilityUpper];
      uint64_t v14 = [(_TSF_TSDgPTPNetworkPort *)v9 _sourceAddressString];
      sourceAddressString = v9->_sourceAddressString;
      v9->_sourceAddressString = (NSString *)v14;

      uint64_t v16 = [(_TSF_TSDgPTPNetworkPort *)v9 _destinationAddressString];
      destinationAddressString = v9->_destinationAddressString;
      v9->_destinationAddressString = (NSString *)v16;

      v9->_overridenReceiveMatching = [(_TSF_TSDgPTPNetworkPort *)v9 _overridenReceiveMatching];
      v9->_overridenReceiveClockIdentity = [(_TSF_TSDgPTPNetworkPort *)v9 _overridenReceiveClockIdentity];
      v9->_overridenReceivePortNumber = [(_TSF_TSDgPTPNetworkPort *)v9 _overridenReceivePortNumber];
      v9->_enabled = [(_TSF_TSDgPTPNetworkPort *)v9 _enabled];
      v9->_asyncCallbackRefcon = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "_connection != nil";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        v27 = "";
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
        __int16 v30 = 1024;
        int v31 = 725;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (void)updateProperties
{
  v89.receiver = self;
  v89.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  [(_TSF_TSDgPTPPort *)&v89 updateProperties];
  unint64_t v46 = [(_TSF_TSDgPTPNetworkPort *)self _remoteClockIdentity];
  unsigned __int16 v45 = [(_TSF_TSDgPTPNetworkPort *)self _remotePortNumber];
  BOOL v44 = [(_TSF_TSDgPTPNetworkPort *)self _remoteIsSameDevice];
  BOOL v43 = [(_TSF_TSDgPTPNetworkPort *)self _isASCapable];
  unsigned int v42 = [(_TSF_TSDgPTPNetworkPort *)self _propagationDelay];
  unsigned int v41 = [(_TSF_TSDgPTPNetworkPort *)self _maximumPropagationDelay];
  unsigned int v39 = [(_TSF_TSDgPTPNetworkPort *)self _minimumPropagationDelay];
  unsigned int v38 = [(_TSF_TSDgPTPNetworkPort *)self _maximumRawDelay];
  unsigned int v40 = [(_TSF_TSDgPTPNetworkPort *)self _minimumRawDelay];
  char v37 = [(_TSF_TSDgPTPNetworkPort *)self _localSyncLogMeanInterval];
  char v36 = [(_TSF_TSDgPTPNetworkPort *)self _remoteSyncLogMeanInterval];
  char v35 = [(_TSF_TSDgPTPNetworkPort *)self _localAnnounceLogMeanInterval];
  char v34 = [(_TSF_TSDgPTPNetworkPort *)self _remoteAnnounceLogMeanInterval];
  unsigned __int8 v33 = [(_TSF_TSDgPTPNetworkPort *)self _localLinkType];
  unsigned __int8 v32 = [(_TSF_TSDgPTPNetworkPort *)self _remoteLinkType];
  unsigned __int8 v31 = [(_TSF_TSDgPTPNetworkPort *)self _localTimestampingMode];
  unsigned __int8 v30 = [(_TSF_TSDgPTPNetworkPort *)self _remoteTimestampingMode];
  unsigned __int8 v29 = [(_TSF_TSDgPTPNetworkPort *)self _localOscillatorType];
  unsigned __int8 v28 = [(_TSF_TSDgPTPNetworkPort *)self _remoteOscillatorType];
  BOOL v27 = [(_TSF_TSDgPTPNetworkPort *)self _hasLocalFrequencyToleranceLower];
  int v26 = [(_TSF_TSDgPTPNetworkPort *)self _localFrequencyToleranceLower];
  BOOL v25 = [(_TSF_TSDgPTPNetworkPort *)self _hasLocalFrequencyToleranceUpper];
  int v24 = [(_TSF_TSDgPTPNetworkPort *)self _localFrequencyToleranceUpper];
  BOOL v23 = [(_TSF_TSDgPTPNetworkPort *)self _hasRemoteFrequencyToleranceLower];
  int v22 = [(_TSF_TSDgPTPNetworkPort *)self _remoteFrequencyToleranceLower];
  BOOL v21 = [(_TSF_TSDgPTPNetworkPort *)self _hasRemoteFrequencyToleranceUpper];
  int v20 = [(_TSF_TSDgPTPNetworkPort *)self _remoteFrequencyToleranceUpper];
  BOOL v19 = [(_TSF_TSDgPTPNetworkPort *)self _hasLocalFrequencyStabilityLower];
  int v18 = [(_TSF_TSDgPTPNetworkPort *)self _localFrequencyStabilityLower];
  BOOL v17 = [(_TSF_TSDgPTPNetworkPort *)self _hasLocalFrequencyStabilityUpper];
  int v16 = [(_TSF_TSDgPTPNetworkPort *)self _localFrequencyStabilityUpper];
  BOOL v15 = [(_TSF_TSDgPTPNetworkPort *)self _hasRemoteFrequencyStabilityLower];
  int v14 = [(_TSF_TSDgPTPNetworkPort *)self _remoteFrequencyStabilityLower];
  BOOL v3 = [(_TSF_TSDgPTPNetworkPort *)self _hasRemoteFrequencyStabilityUpper];
  int v4 = [(_TSF_TSDgPTPNetworkPort *)self _remoteFrequencyStabilityUpper];
  v5 = [(_TSF_TSDgPTPNetworkPort *)self _sourceAddressString];
  id v6 = [(_TSF_TSDgPTPNetworkPort *)self _destinationAddressString];
  BOOL v7 = [(_TSF_TSDgPTPNetworkPort *)self _overridenReceiveMatching];
  unint64_t v8 = [(_TSF_TSDgPTPNetworkPort *)self _overridenReceiveClockIdentity];
  unsigned __int16 v9 = [(_TSF_TSDgPTPNetworkPort *)self _overridenReceivePortNumber];
  BOOL v10 = [(_TSF_TSDgPTPNetworkPort *)self _enabled];
  v11 = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___TSF_TSDgPTPNetworkPort_updateProperties__block_invoke;
  block[3] = &unk_1E622ABE8;
  unint64_t v50 = v46;
  unsigned __int16 v65 = v45;
  BOOL v67 = v44;
  BOOL v68 = v43;
  unsigned int v52 = v42;
  unsigned int v53 = v41;
  unsigned int v54 = v39;
  unsigned int v55 = v38;
  char v69 = v37;
  char v70 = v36;
  char v71 = v35;
  char v72 = v34;
  unsigned __int8 v73 = v33;
  unsigned __int8 v74 = v32;
  unsigned __int8 v75 = v31;
  unsigned __int8 v76 = v30;
  unsigned __int8 v77 = v29;
  unsigned __int8 v78 = v28;
  BOOL v79 = v27;
  unsigned int v56 = v40;
  int v57 = v26;
  BOOL v80 = v25;
  BOOL v81 = v23;
  int v58 = v24;
  int v59 = v22;
  BOOL v82 = v21;
  BOOL v83 = v19;
  int v60 = v20;
  int v61 = v18;
  BOOL v84 = v17;
  BOOL v85 = v15;
  int v62 = v16;
  int v63 = v14;
  BOOL v86 = v3;
  int v64 = v4;
  BOOL v87 = v7;
  unint64_t v51 = v8;
  unsigned __int16 v66 = v9;
  BOOL v88 = v10;
  block[4] = self;
  id v48 = v5;
  id v49 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v11, block);
}

- (_TSF_IODConnection)connection
{
  return self->_connection;
}

- (unint64_t)_remoteClockIdentity
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteClockIdentity"];

  if (v3) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)_remotePortNumber
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemotePortNumber"];

  if (v3) {
    unsigned __int16 v4 = [v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (BOOL)_remoteIsSameDevice
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteIsSameDevice"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isASCapable
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"ASCapable"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unsigned)_propagationDelay
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LinkPropagationDelay"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"MaximumPropagationDelay"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"MinimumPropagationDelay"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"PropagationDelayLimit"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"MaximumRawDelay"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"MinimumRawDelay"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalSyncLogMeanInterval"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteSyncLogMeanInterval"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalAnnounceLogMeanInterval"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteAnnounceLogMeanInterval"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalLinkType"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteLinkType"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalTimestampingMode"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteTimestampingMode"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalOscillatorType"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteOscillatorType"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"];

  return v3 != 0;
}

- (int)_localFrequencyToleranceLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"];

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceLower"];

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceLower"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceUpper"];

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyToleranceUpper"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"];

  return v3 != 0;
}

- (int)_localFrequencyStabilityLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"];

  return v3 != 0;
}

- (int)_localFrequencyStabilityUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityLower"];

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityLower"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityUpper"];

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"RemoteFrequencyStabilityUpper"];

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
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"OverridenReceiveMatching"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)_overridenReceiveClockIdentity
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"OverridenReceiveClockIdentity"];

  if (v3) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unsigned)_overridenReceivePortNumber
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"OverridenReceivePortNumber"];

  if (v3) {
    unsigned __int16 v4 = [v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = -1;
  }

  return v4;
}

- (BOOL)_enabled
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"PTPPortEnabled"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_interfaceName
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  BOOL v3 = [v2 iodPropertyForKey:@"InterfaceName"];

  return v3;
}

- (BOOL)requestRemoteMessageIntervalsWithPDelayMessageInterval:(char)a3 syncMessageInterval:(char)a4 announceMessageInterval:(char)a5 error:(id *)a6
{
  v21[3] = *MEMORY[0x1E4F143B8];
  int v8 = 0;
  v21[0] = a3;
  v21[1] = a4;
  v21[2] = a5;
  BOOL v6 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:0 scalarInputs:v21 scalarInputCount:3 scalarOutputs:0 scalarOutputCount:&v8 error:0];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    BOOL v10 = "result == YES";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    int v16 = "";
    __int16 v17 = 2080;
    int v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v19 = 1024;
    int v20 = 1569;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v6;
}

- (BOOL)overrideReceiveMatchingWithRemoteClockIdentity:(unint64_t)a3 remotePortNumber:(unsigned __int16)a4 error:(id *)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  v20[0] = a3;
  v20[1] = a4;
  BOOL v5 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:1 scalarInputs:v20 scalarInputCount:2 scalarOutputs:0 scalarOutputCount:&v7 error:0];
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    unsigned __int16 v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = "";
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v18 = 1024;
    int v19 = 1585;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v5;
}

- (BOOL)restoreReceiveMatchingError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:2 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:0];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v16 = 1024;
    int v17 = 1597;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)enablePortError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:3 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:0];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v16 = 1024;
    int v17 = 1609;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)disablePortError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = 0;
  BOOL v3 = [(_TSF_IODConnection *)self->_connection callMethodWithSelector:4 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:0];
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v16 = 1024;
    int v17 = 1621;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4
{
  if (a3)
  {
    BOOL v6 = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __52___TSF_TSDgPTPNetworkPort_getCurrentPortInfo_error___block_invoke;
    v9[3] = &unk_1E622AB70;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v6, v9);
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TSDErrorDomain" code:-536870206 userInfo:0];
  }
  return a3 != 0;
}

- (void)_handleRefreshConnection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(_TSF_TSDgPTPNetworkPort *)self updateProperties];
  BOOL v3 = [(_TSF_TSDgPTPNetworkPort *)self _isASCapable];
  os_unfair_lock_t lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = self->_clients;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector())
        {
          __int16 v10 = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51___TSF_TSDgPTPNetworkPort__handleRefreshConnection__block_invoke;
          block[3] = &unk_1E622AC10;
          BOOL v13 = v3;
          block[4] = v9;
          void block[5] = self;
          dispatch_async(v10, block);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_handleNotification:(int)a3 withArg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7 arg5:(unint64_t)a8 arg6:(unint64_t)a9
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  queue = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
  int v10 = a3 - 4000;
  switch(a3)
  {
    case 4000:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(_TSF_TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = [v11 UTF8String];
        __int16 v12 = MEMORY[0x1E4F14500];
        BOOL v13 = "%s: notification for MAC lookup timeout\n";
        goto LABEL_13;
      }
      break;
    case 4001:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(_TSF_TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = [v11 UTF8String];
        __int16 v12 = MEMORY[0x1E4F14500];
        BOOL v13 = "%s: notification for sync timeout\n";
        goto LABEL_13;
      }
      break;
    case 4002:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(_TSF_TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = [v14 UTF8String];
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: notification for AS capable change\n", buf, 0xCu);
      }
      [(_TSF_TSDgPTPNetworkPort *)self updateProperties];
      break;
    case 4003:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(_TSF_TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = [v11 UTF8String];
        __int16 v12 = MEMORY[0x1E4F14500];
        BOOL v13 = "%s: notification for admin enable\n";
        goto LABEL_13;
      }
      break;
    case 4004:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(_TSF_TSDgPTPNetworkPort *)self description];
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = [v11 UTF8String];
        __int16 v12 = MEMORY[0x1E4F14500];
        BOOL v13 = "%s: notification for announce timeout\n";
LABEL_13:
        _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
      break;
    default:
      break;
  }
  os_unfair_lock_t lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v15 = self->_clients;
  uint64_t v16 = [(NSPointerArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    int v22 = v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        switch(v10)
        {
          case 0:
            if (objc_opt_respondsToSelector()) {
              [v20 didTimeoutOnMACLookupForPort:self];
            }
            break;
          case 1:
            if (objc_opt_respondsToSelector()) {
              [v20 didSyncTimeoutForPort:self];
            }
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v20, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:", a4, a5, a6, a7, a8, a9, self, lock, v22);
            }
            break;
          case 2:
            if (objc_opt_respondsToSelector())
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              v31[0] = __81___TSF_TSDgPTPNetworkPort__handleNotification_withArg1_arg2_arg3_arg4_arg5_arg6___block_invoke;
              v31[1] = &unk_1E622AC38;
              v31[2] = v20;
              v31[3] = self;
              v31[4] = a4;
              dispatch_async(queue, block);
            }
            break;
          case 3:
            if (objc_opt_respondsToSelector()) {
              [v20 didChangeAdministrativeEnable:a4 != 0 forPort:self];
            }
            break;
          case 4:
            if (objc_opt_respondsToSelector()) {
              [v20 didAnnounceTimeoutForPort:self];
            }
            break;
          default:
            continue;
        }
      }
      uint64_t v17 = [(NSPointerArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)registerAsyncCallbackError:(id *)a3
{
  char v4 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  self->_asyncCallbackRefcon = [v4 allocateRefcon:self];

  uint64_t v5 = [(_TSF_TSDgPTPNetworkPort *)self connection];
  char v6 = [v5 registerAsyncNotificationsWithSelector:5 callBack:asyncNotificationsCallback refcon:self->_asyncCallbackRefcon callbackQueue:_sharedNotificationsQueue];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
    [v7 releaseRefcon:self->_asyncCallbackRefcon];
  }
  return v6;
}

- (BOOL)deregisterAsyncCallbackError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v4 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  [v4 releaseRefcon:self->_asyncCallbackRefcon];

  uint64_t v5 = [(_TSF_TSDgPTPNetworkPort *)self connection];
  char v6 = [v5 deregisterAsyncNotificationsWithSelector:6];

  if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    long long v15 = "";
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v18 = 1024;
    int v19 = 1809;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
  }
  return v6;
}

- (void)addClient:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  [(NSPointerArray *)self->_clients compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * v9) == v4)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  [(NSPointerArray *)self->_clients compact];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_clients;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v8 + v10, (void)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  [(_TSF_TSDgPTPPort *)&v13 serviceTerminated];
  os_unfair_lock_lock(&self->_clientsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = self->_clients;
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "didTerminateServiceForPort:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_clientsLock);
}

- (id)propertiesForXPC
{
  v12.receiver = self;
  v12.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  v2 = [(_TSF_TSDgPTPPort *)&v12 propertiesForXPC];
  BOOL v3 = [v2 objectForKeyedSubscript:@"OverridenReceiveClockIdentity"];

  if (!v3)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedLongLong:-1];
    [v2 setObject:v4 forKeyedSubscript:@"OverridenReceiveClockIdentity"];
  }
  uint64_t v5 = [v2 objectForKeyedSubscript:@"OverridenReceivePortNumber"];

  if (!v5)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedShort:0xFFFFLL];
    [v2 setObject:v6 forKeyedSubscript:@"OverridenReceivePortNumber"];
  }
  uint64_t v7 = [v2 objectForKeyedSubscript:@"MinimumPropagationDelay"];

  if (!v7)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:0xFFFFFFFFLL];
    [v2 setObject:v8 forKeyedSubscript:@"MinimumPropagationDelay"];
  }
  long long v9 = [v2 objectForKeyedSubscript:@"MinimumRawDelay"];

  if (!v9)
  {
    long long v10 = [NSNumber numberWithUnsignedInt:0xFFFFFFFFLL];
    [v2 setObject:v10 forKeyedSubscript:@"MinimumRawDelay"];
  }
  return v2;
}

+ (id)diagnosticInfoForService:(id)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPNetworkPort;
  id v3 = a3;
  uint64_t v4 = objc_msgSendSuper2(&v10, sel_diagnosticInfoForService_, v3);
  uint64_t v5 = [v3 parentIteratorInServicePlaneWithError:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___TSF_TSDgPTPNetworkPort_diagnosticInfoForService___block_invoke;
  v8[3] = &unk_1E622AB20;
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