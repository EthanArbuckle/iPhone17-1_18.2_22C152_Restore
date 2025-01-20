@interface TSgPTPNetworkPort
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)keyPathsForValuesAffectingAsCapable;
+ (id)keyPathsForValuesAffectingDestinationAddressString;
+ (id)keyPathsForValuesAffectingEnabled;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityLower;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityUpper;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceLower;
+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceUpper;
+ (id)keyPathsForValuesAffectingHasRemoteFrequencyStabilityLower;
+ (id)keyPathsForValuesAffectingHasRemoteFrequencyStabilityUpper;
+ (id)keyPathsForValuesAffectingHasRemoteFrequencyToleranceLower;
+ (id)keyPathsForValuesAffectingHasRemoteFrequencyToleranceUpper;
+ (id)keyPathsForValuesAffectingInterfaceName;
+ (id)keyPathsForValuesAffectingLocalAnnounceLogMeanInterval;
+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityLower;
+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityUpper;
+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceLower;
+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceUpper;
+ (id)keyPathsForValuesAffectingLocalLinkType;
+ (id)keyPathsForValuesAffectingLocalOscillatorType;
+ (id)keyPathsForValuesAffectingLocalSyncLogMeanInterval;
+ (id)keyPathsForValuesAffectingLocalTimestampingMode;
+ (id)keyPathsForValuesAffectingMaximumPropagationDelay;
+ (id)keyPathsForValuesAffectingMaximumRawDelay;
+ (id)keyPathsForValuesAffectingMinimumPropagationDelay;
+ (id)keyPathsForValuesAffectingMinimumRawDelay;
+ (id)keyPathsForValuesAffectingOverridenReceiveClockIdentity;
+ (id)keyPathsForValuesAffectingOverridenReceiveMatching;
+ (id)keyPathsForValuesAffectingOverridenReceivePortNumber;
+ (id)keyPathsForValuesAffectingPropagationDelay;
+ (id)keyPathsForValuesAffectingPropagationDelayLimit;
+ (id)keyPathsForValuesAffectingRemoteAnnounceLogMeanInterval;
+ (id)keyPathsForValuesAffectingRemoteClockIdentity;
+ (id)keyPathsForValuesAffectingRemoteFrequencyStabilityLower;
+ (id)keyPathsForValuesAffectingRemoteFrequencyStabilityUpper;
+ (id)keyPathsForValuesAffectingRemoteFrequencyToleranceLower;
+ (id)keyPathsForValuesAffectingRemoteFrequencyToleranceUpper;
+ (id)keyPathsForValuesAffectingRemoteIsSameDevice;
+ (id)keyPathsForValuesAffectingRemoteLinkType;
+ (id)keyPathsForValuesAffectingRemoteOscillatorType;
+ (id)keyPathsForValuesAffectingRemotePortNumber;
+ (id)keyPathsForValuesAffectingRemoteSyncLogMeanInterval;
+ (id)keyPathsForValuesAffectingRemoteTimestampingMode;
+ (id)keyPathsForValuesAffectingSourceAddressString;
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
- (TSgPTPNetworkPort)initWithImplDC:(id)a3;
- (char)localAnnounceLogMeanInterval;
- (char)localSyncLogMeanInterval;
- (char)remoteAnnounceLogMeanInterval;
- (char)remoteSyncLogMeanInterval;
- (int)localFrequencyStabilityLower;
- (int)localFrequencyStabilityUpper;
- (int)localFrequencyToleranceLower;
- (int)localFrequencyToleranceUpper;
- (int)remoteFrequencyStabilityLower;
- (int)remoteFrequencyStabilityUpper;
- (int)remoteFrequencyToleranceLower;
- (int)remoteFrequencyToleranceUpper;
- (unint64_t)overridenReceiveClockIdentity;
- (unint64_t)remoteClockIdentity;
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
- (void)addClient:(id)a3;
- (void)didAnnounceTimeoutForPort:(id)a3;
- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4;
- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4;
- (void)didSyncTimeoutForPort:(id)a3;
- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9;
- (void)didTerminateServiceForPort:(id)a3;
- (void)didTimeoutOnMACLookupForPort:(id)a3;
- (void)removeClient:(id)a3;
@end

@implementation TSgPTPNetworkPort

- (TSgPTPNetworkPort)initWithImplDC:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "[portImpl isKindOfClass:[TSDgPTPNetworkPort class]]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      v18 = "";
      __int16 v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      __int16 v21 = 1024;
      int v22 = 919;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v7 = 0;
    goto LABEL_4;
  }
  v10.receiver = self;
  v10.super_class = (Class)TSgPTPNetworkPort;
  v6 = [(TSgPTPPort *)&v10 initWithImplDC:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    v7->_clientLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    self = (TSgPTPNetworkPort *)v7->_clients;
    v7->_clients = (NSPointerArray *)v8;
LABEL_4:
  }
  return v7;
}

+ (id)keyPathsForValuesAffectingRemoteClockIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteClockIdentity", 0);
}

- (unint64_t)remoteClockIdentity
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteClockIdentity];
}

+ (id)keyPathsForValuesAffectingRemotePortNumber
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remotePortNumber", 0);
}

- (unsigned)remotePortNumber
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remotePortNumber];
}

+ (id)keyPathsForValuesAffectingRemoteIsSameDevice
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteIsSameDevice", 0);
}

- (BOOL)remoteIsSameDevice
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteIsSameDevice];
}

+ (id)keyPathsForValuesAffectingAsCapable
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.asCapable", 0);
}

- (BOOL)isASCapable
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl isASCapable];
}

+ (id)keyPathsForValuesAffectingPropagationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.propagationDelay", 0);
}

- (unsigned)propagationDelay
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl propagationDelay];
}

+ (id)keyPathsForValuesAffectingMaximumPropagationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.maximumPropagationDelay", 0);
}

- (unsigned)maximumPropagationDelay
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl maximumPropagationDelay];
}

+ (id)keyPathsForValuesAffectingMinimumPropagationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.minimumPropagationDelay", 0);
}

- (unsigned)minimumPropagationDelay
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl minimumPropagationDelay];
}

+ (id)keyPathsForValuesAffectingPropagationDelayLimit
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.propagationDelayLimit", 0);
}

- (unsigned)propagationDelayLimit
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl propagationDelayLimit];
}

+ (id)keyPathsForValuesAffectingMaximumRawDelay
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.maximumRawDelay", 0);
}

- (unsigned)maximumRawDelay
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl maximumRawDelay];
}

+ (id)keyPathsForValuesAffectingMinimumRawDelay
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.minimumRawDelay", 0);
}

- (unsigned)minimumRawDelay
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl minimumRawDelay];
}

+ (id)keyPathsForValuesAffectingSourceAddressString
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.sourceAddressString", 0);
}

- (NSString)sourceAddressString
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl sourceAddressString];
}

+ (id)keyPathsForValuesAffectingDestinationAddressString
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.destinationAddressString", 0);
}

- (NSString)destinationAddressString
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl destinationAddressString];
}

+ (id)keyPathsForValuesAffectingLocalSyncLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localSyncLogMeanInterval", 0);
}

- (char)localSyncLogMeanInterval
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localSyncLogMeanInterval];
}

+ (id)keyPathsForValuesAffectingRemoteSyncLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteSyncLogMeanInterval", 0);
}

- (char)remoteSyncLogMeanInterval
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteSyncLogMeanInterval];
}

+ (id)keyPathsForValuesAffectingLocalAnnounceLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localAnnounceLogMeanInterval", 0);
}

- (char)localAnnounceLogMeanInterval
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localAnnounceLogMeanInterval];
}

+ (id)keyPathsForValuesAffectingRemoteAnnounceLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteAnnounceLogMeanInterval", 0);
}

- (char)remoteAnnounceLogMeanInterval
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteAnnounceLogMeanInterval];
}

+ (id)keyPathsForValuesAffectingLocalLinkType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localLinkType", 0);
}

- (unsigned)localLinkType
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localLinkType];
}

+ (id)keyPathsForValuesAffectingRemoteLinkType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteLinkType", 0);
}

- (unsigned)remoteLinkType
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteLinkType];
}

+ (id)keyPathsForValuesAffectingLocalTimestampingMode
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localTimestampingMode", 0);
}

- (unsigned)localTimestampingMode
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localTimestampingMode];
}

+ (id)keyPathsForValuesAffectingRemoteTimestampingMode
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteTimestampingMode", 0);
}

- (unsigned)remoteTimestampingMode
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteTimestampingMode];
}

+ (id)keyPathsForValuesAffectingLocalOscillatorType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localOscillatorType", 0);
}

- (unsigned)localOscillatorType
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localOscillatorType];
}

+ (id)keyPathsForValuesAffectingRemoteOscillatorType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteOscillatorType", 0);
}

- (unsigned)remoteOscillatorType
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteOscillatorType];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyToleranceUpper", 0);
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasLocalFrequencyToleranceLower];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyToleranceLower", 0);
}

- (int)localFrequencyToleranceLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localFrequencyToleranceLower];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyToleranceUpper", 0);
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasLocalFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyToleranceUpper", 0);
}

- (int)localFrequencyToleranceUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasRemoteFrequencyToleranceLower", 0);
}

- (BOOL)hasRemoteFrequencyToleranceLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasRemoteFrequencyToleranceLower];
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteFrequencyToleranceLower", 0);
}

- (int)remoteFrequencyToleranceLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteFrequencyToleranceLower];
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasRemoteFrequencyToleranceUpper", 0);
}

- (BOOL)hasRemoteFrequencyToleranceUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasRemoteFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteFrequencyToleranceUpper", 0);
}

- (int)remoteFrequencyToleranceUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteFrequencyToleranceUpper];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyStabilityLower", 0);
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasLocalFrequencyStabilityLower];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyStabilityLower", 0);
}

- (int)localFrequencyStabilityLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localFrequencyStabilityLower];
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasLocalFrequencyStabilityUpper", 0);
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasLocalFrequencyStabilityUpper];
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.localFrequencyStabilityUpper", 0);
}

- (int)localFrequencyStabilityUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl localFrequencyStabilityUpper];
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasRemoteFrequencyStabilityLower", 0);
}

- (BOOL)hasRemoteFrequencyStabilityLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasRemoteFrequencyStabilityLower];
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteFrequencyStabilityLower", 0);
}

- (int)remoteFrequencyStabilityLower
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteFrequencyStabilityLower];
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hasRemoteFrequencyStabilityUpper", 0);
}

- (BOOL)hasRemoteFrequencyStabilityUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl hasRemoteFrequencyStabilityUpper];
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.remoteFrequencyStabilityUpper", 0);
}

- (int)remoteFrequencyStabilityUpper
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl remoteFrequencyStabilityUpper];
}

+ (id)keyPathsForValuesAffectingOverridenReceiveMatching
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.overridenReceiveMatching", 0);
}

- (BOOL)overridenReceiveMatching
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl overridenReceiveMatching];
}

+ (id)keyPathsForValuesAffectingOverridenReceiveClockIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.overridenReceiveClockIdentity", 0);
}

- (unint64_t)overridenReceiveClockIdentity
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl overridenReceiveClockIdentity];
}

+ (id)keyPathsForValuesAffectingOverridenReceivePortNumber
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.overridenReceivePortNumber", 0);
}

- (unsigned)overridenReceivePortNumber
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl overridenReceivePortNumber];
}

+ (id)keyPathsForValuesAffectingInterfaceName
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.interfaceName", 0);
}

- (NSString)interfaceName
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl interfaceName];
}

+ (id)keyPathsForValuesAffectingEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.enabled", 0);
}

- (BOOL)enabled
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl enabled];
}

- (BOOL)requestRemoteMessageIntervalsWithPDelayMessageInterval:(char)a3 syncMessageInterval:(char)a4 announceMessageInterval:(char)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl requestRemoteMessageIntervalsWithPDelayMessageInterval:a3 syncMessageInterval:a4 announceMessageInterval:a5 error:a6];
}

- (BOOL)overrideReceiveMatchingWithRemoteClockIdentity:(unint64_t)a3 remotePortNumber:(unsigned __int16)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl overrideReceiveMatchingWithRemoteClockIdentity:a3 remotePortNumber:a4 error:a5];
}

- (BOOL)restoreReceiveMatchingError:(id *)a3
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl restoreReceiveMatchingError:a3];
}

- (BOOL)enablePortError:(id *)a3
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl enablePortError:a3];
}

- (BOOL)disablePortError:(id *)a3
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl disablePortError:a3];
}

- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl getCurrentPortInfo:a3 error:a4];
}

- (BOOL)registerAsyncCallbackError:(id *)a3
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl registerAsyncCallbackError:a3];
}

- (BOOL)deregisterAsyncCallbackError:(id *)a3
{
  return [(_TSF_TSDgPTPNetworkPort *)self->_impl deregisterAsyncCallbackError:a3];
}

- (void)addClient:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    uint64_t v6 = [v5 UTF8String];
    id v7 = [(TSgPTPNetworkPort *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = v6;
    __int16 v20 = 2080;
    uint64_t v21 = [v7 UTF8String];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding Client %s to port %s\n", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_clients;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v13 + 1) + 8 * v12) == v4)
        {

          goto LABEL_14;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (void)v13);
  if ([(NSPointerArray *)self->_clients count] == 1) {
    [(_TSF_TSDgPTPNetworkPort *)self->_impl addClient:self];
  }
LABEL_14:
  os_unfair_lock_unlock(&self->_clientLock);
}

- (void)removeClient:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v4 description];
    uint64_t v6 = [v5 UTF8String];
    id v7 = [(TSgPTPNetworkPort *)self description];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = v6;
    __int16 v22 = 2080;
    uint64_t v23 = [v7 UTF8String];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Removing Client %s from port %s\n", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_clients;
  uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11 + v10;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v15 + 1) + 8 * v13) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v11 + v13, (void)v15);
          goto LABEL_13;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_13:
  if (![(NSPointerArray *)self->_clients count]) {
    [(_TSF_TSDgPTPNetworkPort *)self->_impl removeClient:self];
  }
  os_unfair_lock_unlock(&self->_clientLock);
}

- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    unint64_t v9 = [(TSgPTPPort *)self clockIdentifier];
    int v10 = [(TSgPTPPort *)self portNumber];
    uint64_t v11 = @"NO";
    *(_DWORD *)buf = 138413058;
    __int16 v25 = 2048;
    uint64_t v24 = v8;
    if (v4) {
      uint64_t v11 = @"YES";
    }
    unint64_t v26 = v9;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): changedASCapable:%@", buf, 0x26u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = self->_clients;
  uint64_t v13 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v17, "didChangeASCapable:forPort:", v4, self, (void)v18);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    unint64_t v9 = [(TSgPTPPort *)self clockIdentifier];
    int v10 = [(TSgPTPPort *)self portNumber];
    uint64_t v11 = @"NO";
    *(_DWORD *)buf = 138413058;
    __int16 v25 = 2048;
    uint64_t v24 = v8;
    if (v4) {
      uint64_t v11 = @"YES";
    }
    unint64_t v26 = v9;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): changedAdministrativeEnable:%@", buf, 0x26u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = self->_clients;
  uint64_t v13 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v17, "didChangeAdministrativeEnable:forPort:", v4, self, (void)v18);
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSPointerArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412802;
    long long v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = [(TSgPTPPort *)self clockIdentifier];
    __int16 v22 = 1024;
    int v23 = [(TSgPTPPort *)self portNumber];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): timedoutMACLookup", buf, 0x1Cu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didTimeoutOnMACLookupForPort:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didAnnounceTimeoutForPort:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412802;
    long long v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = [(TSgPTPPort *)self clockIdentifier];
    __int16 v22 = 1024;
    int v23 = [(TSgPTPPort *)self portNumber];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): announceTimeout", buf, 0x1Cu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didAnnounceTimeoutForPort:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didSyncTimeoutForPort:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412802;
    long long v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = [(TSgPTPPort *)self clockIdentifier];
    __int16 v22 = 1024;
    int v23 = [(TSgPTPPort *)self portNumber];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): syncTimeout", buf, 0x1Cu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didSyncTimeoutForPort:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138414338;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    unint64_t v33 = [(TSgPTPPort *)self clockIdentifier];
    __int16 v34 = 1024;
    int v35 = [(TSgPTPPort *)self portNumber];
    __int16 v36 = 2048;
    int64_t v37 = a3;
    __int16 v38 = 2048;
    int64_t v39 = a4;
    __int16 v40 = 2048;
    unint64_t v41 = a5;
    __int16 v42 = 2048;
    int64_t v43 = a6;
    __int16 v44 = 2048;
    int64_t v45 = a7;
    __int16 v46 = 1024;
    unsigned int v47 = a8;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): syncTimeoutWithMean:%lld median:%lld standardDeviation:%llu minimum:%lld maximum:%lld numberOfSamples:%u", buf, 0x54u);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v15 = self->_clients;
  uint64_t v16 = [(NSPointerArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector()) {
          [v20 didSyncTimeoutWithMean:a3 median:a4 standardDeviation:a5 minimum:a6 maximum:a7 numberOfSamples:a8 forPort:self];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSPointerArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  os_unfair_lock_unlock(lock);
}

- (void)didTerminateServiceForPort:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  [(NSPointerArray *)self->_clients compact];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = [(TSgPTPPort *)self clockIdentifier];
    __int16 v22 = 1024;
    int v23 = [(TSgPTPPort *)self portNumber];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): terminatedService", buf, 0x1Cu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_clients;
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didTerminateServiceForPort:", self, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
  [(TSgPTPPort *)self serviceTerminated];
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v59.receiver = a1;
  v59.super_class = (Class)&OBJC_METACLASS___TSgPTPNetworkPort;
  uint64_t v8 = objc_msgSendSuper2(&v59, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  uint64_t v9 = [v6 objectForKeyedSubscript:@"InterfaceName"];
  [v8 appendFormat:@"%@    Interface: ", v7];
  if (v9) {
    [v8 appendFormat:@"%@\n", v9];
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Source Address: ", v7];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"SourceAddress"];
  uint64_t v11 = (void *)v10;
  if (v10) {
    [v8 appendFormat:@"%@\n", v10];
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Destination Address: ", v7];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"DestinationAddress"];

  if (v12) {
    [v8 appendFormat:@"%@\n", v12];
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Priority 1: ", v7];
  long long v13 = [v6 objectForKeyedSubscript:@"ClockPriority1"];
  long long v14 = v13;
  if (v13) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v13, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Class: ", v7];
  long long v15 = [v6 objectForKeyedSubscript:@"ClockClass"];

  if (v15) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v15, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Accuracy: ", v7];
  long long v16 = [v6 objectForKeyedSubscript:@"ClockAccuracy"];

  if (v16) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v16, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Offset Scaled Log Variance: ", v7];
  uint64_t v17 = [v6 objectForKeyedSubscript:@"OffsetScaledLogVariance"];

  if (v17) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v17, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Clock Priority 2: ", v7];
  uint64_t v18 = [v6 objectForKeyedSubscript:@"ClockPriority2"];

  if (v18) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v18, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Grandmaster Identity: ", v7];
  uint64_t v19 = [v6 objectForKeyedSubscript:@"GrandmasterID"];

  if (v19) {
    objc_msgSend(v8, "appendFormat:", @"%016llx\n", objc_msgSend(v19, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Steps Removed: ", v7];
  __int16 v20 = [v6 objectForKeyedSubscript:@"StepsRemoved"];

  if (v20) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v20, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Announce Time Source: ", v7];
  unint64_t v21 = [v6 objectForKeyedSubscript:@"TimeSource"];

  if (v21) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v21, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Priority 1: ", v7];
  __int16 v22 = [v6 objectForKeyedSubscript:@"ReceivedClockPriority1"];

  if (v22) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v22, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Class: ", v7];
  int v23 = [v6 objectForKeyedSubscript:@"ReceivedClockClass"];

  if (v23) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v23, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Accuracy: ", v7];
  uint64_t v24 = [v6 objectForKeyedSubscript:@"ReceivedClockAccuracy"];

  if (v24) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v24, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Offset Scaled Log Variance: ", v7];
  long long v25 = [v6 objectForKeyedSubscript:@"ReceivedOffsetScaledLogVariance"];

  if (v25) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v25, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Clock Priority 2: ", v7];
  long long v26 = [v6 objectForKeyedSubscript:@"ReceivedClockPriority2"];

  if (v26) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v26, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Grandmaster Identity: ", v7];
  long long v27 = [v6 objectForKeyedSubscript:@"ReceivedGrandmasterID"];

  if (v27) {
    objc_msgSend(v8, "appendFormat:", @"%016llx\n", objc_msgSend(v27, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Steps Removed: ", v7];
  long long v28 = [v6 objectForKeyedSubscript:@"ReceivedStepsRemoved"];

  if (v28) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v28, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Received Time Source: ", v7];
  __int16 v29 = [v6 objectForKeyedSubscript:@"ReceivedTimeSource"];

  if (v29) {
    objc_msgSend(v8, "appendFormat:", @"%hhu\n", objc_msgSend(v29, "unsignedCharValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Link Type: ", v7];
  v30 = [v6 objectForKeyedSubscript:@"LocalLinkType"];

  if (v30)
  {
    switch([v30 unsignedCharValue])
    {
      case 0u:
        uint64_t v31 = @"Unknown\n";
        goto LABEL_62;
      case 1u:
        uint64_t v31 = @"AVB Ethernet\n";
        goto LABEL_62;
      case 2u:
        uint64_t v31 = @"Ethernet\n";
        goto LABEL_62;
      case 3u:
        uint64_t v31 = @"Infrastructure WiFi\n";
        goto LABEL_62;
      case 4u:
        uint64_t v31 = @"Peer to Peer WiFi\n";
        goto LABEL_62;
      case 5u:
        uint64_t v31 = @"Timing Measurement\n";
        goto LABEL_62;
      case 6u:
        uint64_t v31 = @"Fine Timing Measurement\n";
        goto LABEL_62;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined link type %hhu\n", objc_msgSend(v30, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    uint64_t v31 = @"Could not read property\n";
LABEL_62:
    [v8 appendString:v31];
  }
  [v8 appendFormat:@"%@    Remote Link Type: ", v7];
  __int16 v32 = [v6 objectForKeyedSubscript:@"RemoteLinkType"];

  if (v32)
  {
    switch([v32 unsignedCharValue])
    {
      case 0u:
        unint64_t v33 = @"Unknown\n";
        goto LABEL_67;
      case 1u:
        unint64_t v33 = @"AVB Ethernet\n";
        goto LABEL_67;
      case 2u:
        unint64_t v33 = @"Ethernet\n";
        goto LABEL_67;
      case 3u:
        unint64_t v33 = @"Infrastructure WiFi\n";
        goto LABEL_67;
      case 4u:
        unint64_t v33 = @"Peer to Peer WiFi\n";
        goto LABEL_67;
      case 5u:
        unint64_t v33 = @"Timing Measurement\n";
        goto LABEL_67;
      case 6u:
        unint64_t v33 = @"Fine Timing Measurement\n";
        goto LABEL_67;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined link type %hhu\n", objc_msgSend(v32, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    unint64_t v33 = @"Could not read property\n";
LABEL_67:
    [v8 appendString:v33];
  }
  [v8 appendFormat:@"%@    Local Timestamping Mode: ", v7];
  __int16 v34 = [v6 objectForKeyedSubscript:@"LocalTimestampingMode"];

  if (v34)
  {
    switch([v34 unsignedCharValue])
    {
      case 0u:
        int v35 = @"Unknown\n";
        goto LABEL_76;
      case 1u:
        int v35 = @"Hardware\n";
        goto LABEL_76;
      case 2u:
        int v35 = @"Interrupt\n";
        goto LABEL_76;
      case 3u:
        int v35 = @"Software\n";
        goto LABEL_76;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined link type %hhu\n", objc_msgSend(v34, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    int v35 = @"Could not read property\n";
LABEL_76:
    [v8 appendString:v35];
  }
  [v8 appendFormat:@"%@    Remote Timestamping Mode: ", v7];
  __int16 v36 = [v6 objectForKeyedSubscript:@"RemoteTimestampingMode"];

  if (v36)
  {
    switch([v36 unsignedCharValue])
    {
      case 0u:
        int64_t v37 = @"Unknown\n";
        goto LABEL_85;
      case 1u:
        int64_t v37 = @"Hardware\n";
        goto LABEL_85;
      case 2u:
        int64_t v37 = @"Interrupt\n";
        goto LABEL_85;
      case 3u:
        int64_t v37 = @"Software\n";
        goto LABEL_85;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined link type %hhu\n", objc_msgSend(v36, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    int64_t v37 = @"Could not read property\n";
LABEL_85:
    [v8 appendString:v37];
  }
  [v8 appendFormat:@"%@    Local Oscillator Type: ", v7];
  __int16 v38 = [v6 objectForKeyedSubscript:@"LocalOscillatorType"];

  if (v38)
  {
    switch([v38 unsignedCharValue])
    {
      case 0u:
        int64_t v39 = @"Unknown\n";
        goto LABEL_90;
      case 1u:
        int64_t v39 = @"Crystal\n";
        goto LABEL_90;
      case 2u:
        int64_t v39 = @"MEMS\n";
        goto LABEL_90;
      case 3u:
        int64_t v39 = @"TCXO\n";
        goto LABEL_90;
      case 4u:
        int64_t v39 = @"VCO\n";
        goto LABEL_90;
      case 5u:
        int64_t v39 = @"VCYCXO\n";
        goto LABEL_90;
      case 6u:
        int64_t v39 = @"OCXO\n";
        goto LABEL_90;
      case 7u:
        int64_t v39 = @"DOCXO\n";
        goto LABEL_90;
      case 8u:
        int64_t v39 = @"VCOCXO\n";
        goto LABEL_90;
      case 9u:
        int64_t v39 = @"VCDOCXO\n";
        goto LABEL_90;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined oscillator type %hhu\n", objc_msgSend(v38, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    int64_t v39 = @"Could not read property\n";
LABEL_90:
    [v8 appendString:v39];
  }
  [v8 appendFormat:@"%@    Remote Oscillator Type: ", v7];
  __int16 v40 = [v6 objectForKeyedSubscript:@"RemoteOscillatorType"];

  if (v40)
  {
    switch([v40 unsignedCharValue])
    {
      case 0u:
        unint64_t v41 = @"Unknown\n";
        goto LABEL_95;
      case 1u:
        unint64_t v41 = @"Crystal\n";
        goto LABEL_95;
      case 2u:
        unint64_t v41 = @"MEMS\n";
        goto LABEL_95;
      case 3u:
        unint64_t v41 = @"TCXO\n";
        goto LABEL_95;
      case 4u:
        unint64_t v41 = @"VCO\n";
        goto LABEL_95;
      case 5u:
        unint64_t v41 = @"VCYCXO\n";
        goto LABEL_95;
      case 6u:
        unint64_t v41 = @"OCXO\n";
        goto LABEL_95;
      case 7u:
        unint64_t v41 = @"DOCXO\n";
        goto LABEL_95;
      case 8u:
        unint64_t v41 = @"VCOCXO\n";
        goto LABEL_95;
      case 9u:
        unint64_t v41 = @"VCDOCXO\n";
        goto LABEL_95;
      default:
        objc_msgSend(v8, "appendFormat:", @"Undefined oscillator type %hhu\n", objc_msgSend(v40, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    unint64_t v41 = @"Could not read property\n";
LABEL_95:
    [v8 appendString:v41];
  }
  [v8 appendFormat:@"%@    Local Frequency Tolerance Lower: ", v7];
  __int16 v42 = [v6 objectForKeyedSubscript:@"LocalFrequencyToleranceLower"];

  if (v42) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v42, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Frequency Tolerance Upper: ", v7];
  int64_t v43 = [v6 objectForKeyedSubscript:@"LocalFrequencyToleranceUpper"];

  if (v43) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v43, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Remote Frequency Tolerance Lower: ", v7];
  __int16 v44 = [v6 objectForKeyedSubscript:@"RemoteFrequencyToleranceLower"];

  if (v44) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v44, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Remote Frequency Tolerance Upper: ", v7];
  int64_t v45 = [v6 objectForKeyedSubscript:@"RemoteFrequencyToleranceUpper"];

  if (v45) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v45, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Frequency Stability Lower: ", v7];
  __int16 v46 = [v6 objectForKeyedSubscript:@"LocalFrequencyStabilityLower"];

  if (v46) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v46, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Local Frequency Stability Upper: ", v7];
  unsigned int v47 = [v6 objectForKeyedSubscript:@"LocalFrequencyStabilityUpper"];

  if (v47) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v47, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Remote Frequency Stability Lower: ", v7];
  uint64_t v48 = [v6 objectForKeyedSubscript:@"RemoteFrequencyStabilityLower"];

  if (v48) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v48, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Remote Frequency Stability Upper: ", v7];
  v49 = [v6 objectForKeyedSubscript:@"RemoteFrequencyStabilityUpper"];

  if (v49) {
    objc_msgSend(v8, "appendFormat:", @"%d ppb\n", objc_msgSend(v49, "intValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  v50 = [v6 objectForKeyedSubscript:@"OverridenReceiveMatching"];

  if (v50)
  {
    if ([v50 BOOLValue]) {
      v51 = @"YES";
    }
    else {
      v51 = @"NO";
    }
    [v8 appendFormat:@"%@    Overriden Receive Matching: %@\n", v7, v51];
    [v8 appendFormat:@"%@    Overriden Receive Clock Identity: ", v7];
    v52 = [v6 objectForKeyedSubscript:@"OverridenReceiveClockIdentity"];

    if (v52) {
      objc_msgSend(v8, "appendFormat:", @"0x%016llx\n", objc_msgSend(v52, "unsignedLongLongValue"));
    }
    else {
      [v8 appendString:@"Could not read property\n"];
    }
    [v8 appendFormat:@"%@    Overriden Receive Port Number: ", v7];
    v53 = [v6 objectForKeyedSubscript:@"OverridenReceivePortNumber"];

    if (v53)
    {
      objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v53, "unsignedShortValue"));
    }
    else
    {
      [v8 appendString:@"Could not read property\n"];
    }
  }
  v54 = [v6 objectForKeyedSubscript:@"PTPPortEnabled"];
  v55 = v54;
  if (v54)
  {
    if ([v54 BOOLValue]) {
      v56 = @"YES";
    }
    else {
      v56 = @"NO";
    }
    [v8 appendFormat:@"%@    PTP Port Enabled: %@\n", v7, v56];
  }
  id v57 = v8;

  return v57;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end