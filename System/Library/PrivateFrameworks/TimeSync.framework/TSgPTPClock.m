@interface TSgPTPClock
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)keyPathsForValuesAffectingClockAccuracy;
+ (id)keyPathsForValuesAffectingClockClass;
+ (id)keyPathsForValuesAffectingClockIdentity;
+ (id)keyPathsForValuesAffectingClockPriority1;
+ (id)keyPathsForValuesAffectingClockPriority2;
+ (id)keyPathsForValuesAffectingGptpPath;
+ (id)keyPathsForValuesAffectingGrandmasterIdentity;
+ (id)keyPathsForValuesAffectingPorts;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5;
- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 error:(id *)a4;
- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4;
- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (NSArray)gptpPath;
- (NSArray)ports;
- (TSgPTPClock)initWithImplDC:(id)a3;
- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3;
- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)portWithPortNumber:(unsigned __int16)a3;
- (unint64_t)clockIdentity;
- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3;
- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3;
- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)grandmasterIdentity;
- (unint64_t)machAbsoluteFromgPTPTime:(id)a3;
- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3;
- (unsigned)clockAccuracy;
- (unsigned)clockClass;
- (unsigned)clockPriority1;
- (unsigned)clockPriority2;
- (void)dealloc;
@end

@implementation TSgPTPClock

- (TSgPTPClock)initWithImplDC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "[kernelClock isKindOfClass:[TSDCgPTPClock class]]";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      v16 = "";
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPClock.m";
      __int16 v19 = 1024;
      int v20 = 77;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    id v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSgPTPClock;
  id v5 = [(TSKernelClock *)&v8 initWithImplDC:v4];
  if (v5)
  {
    id v6 = v4;
    self = (TSgPTPClock *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;
LABEL_4:
  }
  return (TSgPTPClock *)v5;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  return [(TSDCgPTPClock *)self->_impl convertFrom32BitASToMachAbsoluteTime:*(void *)&a3];
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSDCgPTPClock *)self->_impl convertFrom32BitASTime:a3 toMachAbsoluteTime:a4 withCount:*(void *)&a5];
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  return [(TSDCgPTPClock *)self->_impl gPTPTimeFromMachAbsoluteTime:a3];
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  return [(TSDCgPTPClock *)self->_impl machAbsoluteFromgPTPTime:a3];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5 = [(TSDCgPTPClock *)self->_impl convertFromMachAbsoluteTo128BitgPTPTime:a3 grandmasterUsed:a4 portNumber:a5];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFrom128BitgPTPTimeToMachAbsoluteTime:grandmasterUsed:portNumber:](self->_impl, "convertFrom128BitgPTPTimeToMachAbsoluteTime:grandmasterUsed:portNumber:", a3.var0, a3.var1, a4, a5);
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4
{
  __int16 v5 = 0;
  return [(TSgPTPClock *)self convertFromMachAbsoluteToDomainTime:a3 grandmasterUsed:a4 portNumber:&v5];
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return [(TSDCgPTPClock *)self->_impl convertFromMachAbsoluteToDomainTime:a3 grandmasterUsed:a4 portNumber:a5];
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return [(TSDCgPTPClock *)self->_impl convertFromDomainToMachAbsoluteTime:a3 grandmasterUsed:a4 portNumber:a5];
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  return -[TSDCgPTPClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self->_impl, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a3, a4, a5, a6, a7, a8);
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  return [(TSDCgPTPClock *)self->_impl convertFrom32BitASToTimeSyncTime:*(void *)&a3];
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSDCgPTPClock *)self->_impl convertFrom32BitASTime:a3 toTimeSyncTime:a4 withCount:*(void *)&a5];
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  return [(TSDCgPTPClock *)self->_impl gPTPTimeFromTimeSyncTime:a3];
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  return [(TSDCgPTPClock *)self->_impl timeSyncTimeFromgPTPTime:a3];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5 = [(TSDCgPTPClock *)self->_impl convertFromTimeSyncTimeTo128BitgPTPTime:a3 grandmasterUsed:a4 portNumber:a5];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self->_impl, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3.var0, a3.var1, a4, a5);
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return [(TSDCgPTPClock *)self->_impl convertFromTimeSyncTimeToDomainTime:a3 grandmasterUsed:a4 portNumber:a5];
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return [(TSDCgPTPClock *)self->_impl convertFromDomainTimeToTimeSyncTime:a3 grandmasterUsed:a4 portNumber:a5];
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  return -[TSDCgPTPClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self->_impl, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a3, a4, a5, a6, a7, a8);
}

+ (id)keyPathsForValuesAffectingGptpPath
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.gptpPath", 0);
}

- (NSArray)gptpPath
{
  return [(TSDCgPTPClock *)self->_impl gptpPath];
}

+ (id)keyPathsForValuesAffectingGrandmasterIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.grandmasterIdentity", 0);
}

- (unint64_t)grandmasterIdentity
{
  return [(TSDCgPTPClock *)self->_impl grandmasterIdentity];
}

+ (id)keyPathsForValuesAffectingClockIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockIdentity", 0);
}

- (unint64_t)clockIdentity
{
  return [(TSDCgPTPClock *)self->_impl clockIdentity];
}

+ (id)keyPathsForValuesAffectingClockPriority1
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockPriority1", 0);
}

- (unsigned)clockPriority1
{
  return [(TSDCgPTPClock *)self->_impl clockPriority1];
}

+ (id)keyPathsForValuesAffectingClockPriority2
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockPriority2", 0);
}

- (unsigned)clockPriority2
{
  return [(TSDCgPTPClock *)self->_impl clockPriority2];
}

+ (id)keyPathsForValuesAffectingClockClass
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockClass", 0);
}

- (unsigned)clockClass
{
  return [(TSDCgPTPClock *)self->_impl clockClass];
}

+ (id)keyPathsForValuesAffectingClockAccuracy
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.clockAccuracy", 0);
}

- (unsigned)clockAccuracy
{
  return [(TSDCgPTPClock *)self->_impl clockAccuracy];
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 error:(id *)a4
{
  __int16 v5 = 0;
  return [(TSgPTPClock *)self addLinkLayerPortOnInterfaceNamed:a3 allocatedPortNumber:&v5 error:a4];
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl addLinkLayerPortOnInterfaceNamed:a3 allocatedPortNumber:a4 error:a5];
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  return [(TSDCgPTPClock *)self->_impl removeLinkLayerPortFromInterfaceNamed:a3 error:a4];
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  __int16 v6 = 0;
  return [(TSgPTPClock *)self addUnicastUDPv4PtPPortOnInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 allocatedPortNumber:&v6 error:a5];
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addUnicastUDPv4PtPPortOnInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeUnicastUDPv4PtPPortFromInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 error:a5];
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6 = 0;
  return [(TSgPTPClock *)self addUnicastUDPv6PtPPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:&v6 error:a5];
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addUnicastUDPv6PtPPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeUnicastUDPv6PtPPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6 = 0;
  return [(TSgPTPClock *)self addUnicastLinkLayerPtPPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:&v6 error:a5];
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addUnicastLinkLayerPtPPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeUnicastLinkLayerPtPPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  __int16 v6 = 0;
  return [(TSgPTPClock *)self addUnicastUDPv4EtEPortOnInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 allocatedPortNumber:&v6 error:a5];
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addUnicastUDPv4EtEPortOnInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeUnicastUDPv4EtEPortFromInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 error:a5];
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6 = 0;
  return [(TSgPTPClock *)self addUnicastUDPv6EtEPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:&v6 error:a5];
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addUnicastUDPv6EtEPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeUnicastUDPv6EtEPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6 = 0;
  return [(TSgPTPClock *)self addUnicastLinkLayerEtEPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:&v6 error:a5];
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addUnicastLinkLayerEtEPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeUnicastLinkLayerEtEPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  return [(TSDCgPTPClock *)self->_impl addReverseSyncOnInterfaceNamed:a3 withDomainNumner:a4 syncInterval:*(void *)&a5 error:a6];
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  return [(TSDCgPTPClock *)self->_impl removeReverseSyncFromInterfaceNamed:a3 withDomainNumner:a4 error:a5];
}

- (id)getMetrics
{
  v2 = [(TSDCgPTPClock *)self->_impl getMetrics];
  if (v2) {
    v3 = [[TSClockMetrics alloc] initWithDaemonMetrics:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)getMetricsWithDelta:(id)a3
{
  impl = self->_impl;
  id v4 = [a3 toDaemonMetrics];
  __int16 v5 = [(TSDCgPTPClock *)impl getMetricsWithDelta:v4];

  if (v5) {
    __int16 v6 = [[TSClockMetrics alloc] initWithDaemonMetrics:v5];
  }
  else {
    __int16 v6 = 0;
  }

  return v6;
}

+ (id)keyPathsForValuesAffectingPorts
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.ports", 0);
}

- (NSArray)ports
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(TSDCgPTPClock *)self->_impl ports];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = +[TSgPTPPort gPTPPortWithImplDC:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  v3 = [(TSDCgPTPClock *)self->_impl portWithPortNumber:a3];
  id v4 = +[TSgPTPPort gPTPPortWithImplDC:v3];

  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSgPTPClock;
  [(TSKernelClock *)&v2 dealloc];
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v49.receiver = a1;
  v49.super_class = (Class)&OBJC_METACLASS___TSgPTPClock;
  objc_super v8 = objc_msgSendSuper2(&v49, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  [v8 appendFormat:@"%@    Grandmaster Clock Identity: ", v7];
  v9 = [v6 objectForKeyedSubscript:@"GrandmasterID"];
  v38 = v9;
  if (v9) {
    objc_msgSend(v8, "appendFormat:", @"0x%016llx\n", objc_msgSend(v9, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    gPTP Path: ", v7];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"ASPath"];
  v37 = (void *)v10;
  if (v10)
  {
    long long v11 = (void *)v10;
    [v8 appendString:@"\n"];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          [v8 appendFormat:@"%@        0x%016llx\n", v7, objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "unsignedLongLongValue"), v37, v38];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v14);
    }
  }
  else
  {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Ports:\n", v7];
  v39 = v7;
  __int16 v17 = [v7 stringByAppendingString:@"        |"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v40 = v6;
  v18 = [v6 objectForKeyedSubscript:@"Ports"];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v24 = [v23 objectForKeyedSubscript:@"ClassName"];
        char v25 = [v24 isEqualToString:@"IOTimeSyncEthernetPort"];
        v26 = off_1E622A798;
        if ((v25 & 1) == 0)
        {
          char v27 = [v24 isEqualToString:@"IOTimeSyncUnicastLinkLayerPtPPort"];
          v26 = off_1E622A7D8;
          if ((v27 & 1) == 0)
          {
            char v28 = [v24 isEqualToString:@"IOTimeSyncUnicastLinkLayerEtEPort"];
            v26 = off_1E622A7D0;
            if ((v28 & 1) == 0)
            {
              char v29 = [v24 isEqualToString:@"IOTimeSyncUnicastUDPv4PtPPort"];
              v26 = off_1E622A7E8;
              if ((v29 & 1) == 0)
              {
                char v30 = [v24 isEqualToString:@"IOTimeSyncUnicastUDPv6PtPPort"];
                v26 = off_1E622A7F8;
                if ((v30 & 1) == 0)
                {
                  char v31 = [v24 isEqualToString:@"IOTimeSyncUnicastUDPv4EtEPort"];
                  v26 = off_1E622A7E0;
                  if ((v31 & 1) == 0)
                  {
                    char v32 = [v24 isEqualToString:@"IOTimeSyncUnicastUDPv6EtEPort"];
                    v26 = off_1E622A7F0;
                    if ((v32 & 1) == 0)
                    {
                      char v33 = [v24 isEqualToString:@"IOTimeSyncTimeSyncTimePort"];
                      v26 = off_1E622A7A0;
                      if ((v33 & 1) == 0)
                      {
                        int v34 = [v24 isEqualToString:@"IOTimeSyncTimeOfDayPort"];
                        v26 = off_1E622A7A0;
                        if (!v34) {
                          v26 = off_1E622A7B8;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        v35 = [(__objc2_class *)*v26 diagnosticDescriptionForInfo:v23 withIndent:v17];
        [v8 appendString:v35];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v20);
  }

  return v8;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return +[_TSF_TSDgPTPClock clockNameForClockIdentifier:a3];
}

- (void).cxx_destruct
{
}

@end