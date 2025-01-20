@interface SASamplePrintOptions
- (BOOL)aggregateFramesByOffsetIntoBinary;
- (BOOL)aggregateProcessesByExecutable;
- (BOOL)aggregateStacksByProcess;
- (BOOL)aggregateStacksByThread;
- (BOOL)binaryImagesBeforeStacks;
- (BOOL)displayAddressesInBlockedReasons;
- (BOOL)displayAllBinaries;
- (BOOL)displayAllHIDEvents;
- (BOOL)displayAllTaskSizeChanges;
- (BOOL)displayBinaryImageAddresses;
- (BOOL)displayBinaryImagesLackingNameOrPath;
- (BOOL)displayBlockedReasons;
- (BOOL)displayBlockedReasonsLackingProcessOwners;
- (BOOL)displayBlockedThreads;
- (BOOL)displayBody;
- (BOOL)displayCPUClusterInfoForRunningThreads;
- (BOOL)displayCPUNumForNonRunningThreads;
- (BOOL)displayCPUNumForRunningThreads;
- (BOOL)displayCallTreesWithZeroCount;
- (BOOL)displayCodesigningIDsMatchingBundleIDs;
- (BOOL)displayDefaultPowerModes;
- (BOOL)displayDetailedCpuTime;
- (BOOL)displayDetailedWallTime;
- (BOOL)displayDifferentTypesOfSuspension;
- (BOOL)displayEachIndividualIOInCallTrees;
- (BOOL)displayEmptyBootArgs;
- (BOOL)displayExclaveFrames;
- (BOOL)displayFooter;
- (BOOL)displayFrameAddresses;
- (BOOL)displayFullSourcePaths;
- (BOOL)displayHeader;
- (BOOL)displayIOInCallTrees;
- (BOOL)displayIdleWorkQueueThreads;
- (BOOL)displayKernelFrames;
- (BOOL)displayMultipleMatchingBlockedReasons;
- (BOOL)displayOffsetsFromUnnamedSymbols;
- (BOOL)displayOnBehalfOfInCallTrees;
- (BOOL)displayProcessFirstLastTimes;
- (BOOL)displayQoSTransitionsBetweenUnspecifiedAndUnavailable;
- (BOOL)displayRunnableThreads;
- (BOOL)displayRunningThreads;
- (BOOL)displayStacksWithZeroCount;
- (BOOL)displaySymbolInformation;
- (BOOL)displayTasksWithZeroCount;
- (BOOL)displayThreadRunningState;
- (BOOL)displayTimestampsInCallTrees;
- (BOOL)displayTrialInformation;
- (BOOL)displayUserFrames;
- (BOOL)forceOneBasedTimeIndexes;
- (BOOL)includeUserIdleAndBatteryStateInStacks;
- (BOOL)microstackshotsFormat;
- (BOOL)omitAbsoluteWallTimes;
- (BOOL)omitStacksOnAC;
- (BOOL)omitStacksOnBattery;
- (BOOL)omitStacksWithECore;
- (BOOL)omitStacksWithPCore;
- (BOOL)omitStacksWithUserActive;
- (BOOL)omitStacksWithUserIdle;
- (BOOL)orderTasksBySampleCount;
- (BOOL)patchTruncatedStacks;
- (BOOL)printHeavyStacks;
- (BOOL)printJson;
- (BOOL)printProblematicProcessesAndThreads;
- (BOOL)printSpinSignatureStack;
- (BOOL)printTargetHIDEvent;
- (BOOL)printTargetThreadOnly;
- (BOOL)showThreadStateAsLeafFrame;
- (BOOL)swiftAsyncDisplayCRootCallstacks;
- (BOOL)swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways;
- (BOOL)swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways;
- (BOOL)systemstatsFormat;
- (BOOL)tabDelineateBinaryImageSections;
- (BOOL)verbose;
- (NSMutableArray)callTreeSortAttributes;
- (NSMutableArray)processSortAttributes;
- (NSSet)pidsToPrint;
- (NSSet)processNamesToPrint;
- (NSSet)processUUIDsToPrint;
- (NSSet)tidsToPrint;
- (NSSet)uniquePidsToPrint;
- (SASamplePrintOptions)init;
- (char)omitFramesBelowPercentOfStackSamples;
- (char)omitStacksBelowPercentOfTaskSamples;
- (char)omitTasksBelowPercentOfTotalSamples;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int)omitStacksAboveBasePriority;
- (int)omitStacksBelowBasePriority;
- (int64_t)omitFramesAfterLineCount;
- (int64_t)omitFramesBelowSampleCount;
- (int64_t)omitStacksBelowSampleCount;
- (int64_t)omitTasksBelowSampleCount;
- (uint64_t)callTreeAggregationResolved;
- (unint64_t)callTreeAggregation;
- (unint64_t)callTreeTimestampsTimeDomain;
- (unint64_t)hidEventDisplayOptions;
- (unint64_t)swiftAsyncCallTreeAggregation;
- (unint64_t)taskAggregation;
- (void)setAggregateFramesByOffsetIntoBinary:(BOOL)a3;
- (void)setAggregateProcessesByExecutable:(BOOL)a3;
- (void)setAggregateStacksByProcess:(BOOL)a3;
- (void)setAggregateStacksByThread:(BOOL)a3;
- (void)setBinaryImagesBeforeStacks:(BOOL)a3;
- (void)setCallTreeAggregation:(unint64_t)a3;
- (void)setCallTreeTimestampsTimeDomain:(unint64_t)a3;
- (void)setDisplayAddressesInBlockedReasons:(BOOL)a3;
- (void)setDisplayAllBinaries:(BOOL)a3;
- (void)setDisplayAllHIDEvents:(BOOL)a3;
- (void)setDisplayAllTaskSizeChanges:(BOOL)a3;
- (void)setDisplayBinaryImageAddresses:(BOOL)a3;
- (void)setDisplayBinaryImagesLackingNameOrPath:(BOOL)a3;
- (void)setDisplayBlockedReasons:(BOOL)a3;
- (void)setDisplayBlockedReasonsLackingProcessOwners:(BOOL)a3;
- (void)setDisplayBlockedThreads:(BOOL)a3;
- (void)setDisplayBody:(BOOL)a3;
- (void)setDisplayCPUClusterInfoForRunningThreads:(BOOL)a3;
- (void)setDisplayCPUNumForNonRunningThreads:(BOOL)a3;
- (void)setDisplayCPUNumForRunningThreads:(BOOL)a3;
- (void)setDisplayCallTreesWithZeroCount:(BOOL)a3;
- (void)setDisplayCodesigningIDsMatchingBundleIDs:(BOOL)a3;
- (void)setDisplayDefaultPowerModes:(BOOL)a3;
- (void)setDisplayDetailedCpuTime:(BOOL)a3;
- (void)setDisplayDetailedWallTime:(BOOL)a3;
- (void)setDisplayDifferentTypesOfSuspension:(BOOL)a3;
- (void)setDisplayEachIndividualIOInCallTrees:(BOOL)a3;
- (void)setDisplayEmptyBootArgs:(BOOL)a3;
- (void)setDisplayExclaveFrames:(BOOL)a3;
- (void)setDisplayFooter:(BOOL)a3;
- (void)setDisplayFrameAddresses:(BOOL)a3;
- (void)setDisplayFullSourcePaths:(BOOL)a3;
- (void)setDisplayHeader:(BOOL)a3;
- (void)setDisplayIOInCallTrees:(BOOL)a3;
- (void)setDisplayIdleWorkQueueThreads:(BOOL)a3;
- (void)setDisplayKernelFrames:(BOOL)a3;
- (void)setDisplayMultipleMatchingBlockedReasons:(BOOL)a3;
- (void)setDisplayOffsetsFromUnnamedSymbols:(BOOL)a3;
- (void)setDisplayOnBehalfOfInCallTrees:(BOOL)a3;
- (void)setDisplayQoSTransitionsBetweenUnspecifiedAndUnavailable:(BOOL)a3;
- (void)setDisplayRunnableThreads:(BOOL)a3;
- (void)setDisplayRunningThreads:(BOOL)a3;
- (void)setDisplaySymbolInformation:(BOOL)a3;
- (void)setDisplayTasksWithZeroCount:(BOOL)a3;
- (void)setDisplayThreadRunningState:(BOOL)a3;
- (void)setDisplayTimestampsInCallTrees:(BOOL)a3;
- (void)setDisplayTrialInformation:(BOOL)a3;
- (void)setDisplayUserFrames:(BOOL)a3;
- (void)setForceOneBasedTimeIndexes:(BOOL)a3;
- (void)setHidEventDisplayOptions:(unint64_t)a3;
- (void)setIncludeUserIdleAndBatteryStateInStacks:(BOOL)a3;
- (void)setMicrostackshotsFormat:(BOOL)a3;
- (void)setOmitAbsoluteWallTimes:(BOOL)a3;
- (void)setOmitFramesAfterLineCount:(int64_t)a3;
- (void)setOmitFramesBelowPercentOfStackSamples:(char)a3;
- (void)setOmitFramesBelowSampleCount:(int64_t)a3;
- (void)setOmitStacksAboveBasePriority:(int)a3;
- (void)setOmitStacksBelowBasePriority:(int)a3;
- (void)setOmitStacksBelowPercentOfTaskSamples:(char)a3;
- (void)setOmitStacksBelowSampleCount:(int64_t)a3;
- (void)setOmitStacksOnAC:(BOOL)a3;
- (void)setOmitStacksOnBattery:(BOOL)a3;
- (void)setOmitStacksWithECore:(BOOL)a3;
- (void)setOmitStacksWithPCore:(BOOL)a3;
- (void)setOmitStacksWithUserActive:(BOOL)a3;
- (void)setOmitStacksWithUserIdle:(BOOL)a3;
- (void)setOmitTasksBelowPercentOfTotalSamples:(char)a3;
- (void)setOmitTasksBelowSampleCount:(int64_t)a3;
- (void)setOrderTasksBySampleCount:(BOOL)a3;
- (void)setPatchTruncatedStacks:(BOOL)a3;
- (void)setPidsToPrint:(id)a3;
- (void)setPrintHeavyStacks:(BOOL)a3;
- (void)setPrintJson:(BOOL)a3;
- (void)setPrintProblematicProcessesAndThreads:(BOOL)a3;
- (void)setPrintSpinSignatureStack:(BOOL)a3;
- (void)setPrintTargetHIDEvent:(BOOL)a3;
- (void)setPrintTargetThreadOnly:(BOOL)a3;
- (void)setProcessNamesToPrint:(id)a3;
- (void)setProcessUUIDsToPrint:(id)a3;
- (void)setShowThreadStateAsLeafFrame:(BOOL)a3;
- (void)setSwiftAsyncCallTreeAggregation:(unint64_t)a3;
- (void)setSwiftAsyncDisplayCRootCallstacks:(BOOL)a3;
- (void)setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:(BOOL)a3;
- (void)setSwiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways:(BOOL)a3;
- (void)setSystemstatsFormat:(BOOL)a3;
- (void)setTabDelineateBinaryImageSections:(BOOL)a3;
- (void)setTaskAggregation:(unint64_t)a3;
- (void)setTidsToPrint:(id)a3;
- (void)setUniquePidsToPrint:(id)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation SASamplePrintOptions

- (BOOL)displayBlockedReasons
{
  return self->_displayBlockedReasons;
}

- (BOOL)printHeavyStacks
{
  return self->_printHeavyStacks;
}

- (BOOL)displaySymbolInformation
{
  return self->_displaySymbolInformation;
}

- (BOOL)tabDelineateBinaryImageSections
{
  return self->_tabDelineateBinaryImageSections;
}

- (void)setMicrostackshotsFormat:(BOOL)a3
{
  self->_microstackshotsFormat = a3;
  if (a3)
  {
    self->_aggregateFramesByOffsetIntoBinary = 1;
    self->_displayThreadRunningState = 0;
    self->_showThreadStateAsLeafFrame = 1;
    self->_printHeavyStacks = 1;
    self->_displayTrialInformation = 0;
  }
}

- (BOOL)includeUserIdleAndBatteryStateInStacks
{
  return self->_includeUserIdleAndBatteryStateInStacks;
}

- (BOOL)printTargetThreadOnly
{
  return self->_printTargetThreadOnly;
}

- (char)omitTasksBelowPercentOfTotalSamples
{
  return self->_omitTasksBelowPercentOfTotalSamples;
}

- (BOOL)aggregateStacksByProcess
{
  if (self)
  {
    unint64_t callTreeAggregation = self->_callTreeAggregation;
    if (!callTreeAggregation)
    {
      unint64_t callTreeAggregation = 3;
      if (!self->_microstackshotsFormat) {
        unint64_t callTreeAggregation = 1;
      }
    }
  }
  else
  {
    unint64_t callTreeAggregation = 0;
  }
  return callTreeAggregation == 3;
}

- (uint64_t)callTreeAggregationResolved
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 152);
    if (!result)
    {
      if (*(unsigned char *)(v1 + 11)) {
        return 3;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)displayProcessFirstLastTimes
{
  return 1;
}

- (BOOL)orderTasksBySampleCount
{
  v2 = [(NSMutableArray *)self->_processSortAttributes firstObject];
  BOOL v3 = [v2 unsignedLongLongValue] == 11;

  return v3;
}

- (void)setOrderTasksBySampleCount:(BOOL)a3
{
  v5 = [(NSMutableArray *)self->_processSortAttributes firstObject];
  uint64_t v6 = [v5 unsignedLongLongValue];

  if (a3)
  {
    if (v6 != 11)
    {
      processSortAttributes = self->_processSortAttributes;
      [(NSMutableArray *)processSortAttributes insertObject:&unk_1F1A9AFE0 atIndex:0];
    }
  }
  else if (v6 == 11)
  {
    do
    {
      [(NSMutableArray *)self->_processSortAttributes removeObjectAtIndex:0];
      v8 = [(NSMutableArray *)self->_processSortAttributes firstObject];
      uint64_t v9 = [v8 unsignedLongLongValue];
    }
    while (v9 == 11);
  }
}

- (BOOL)printTargetHIDEvent
{
  return (LOBYTE(self->_hidEventDisplayOptions) >> 2) & 1;
}

- (void)setPrintTargetHIDEvent:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_hidEventDisplayOptions = self->_hidEventDisplayOptions & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)displayAllHIDEvents
{
  return (LOBYTE(self->_hidEventDisplayOptions) >> 4) & 1;
}

- (void)setDisplayAllHIDEvents:(BOOL)a3
{
  unint64_t hidEventDisplayOptions = self->_hidEventDisplayOptions;
  unint64_t v4 = hidEventDisplayOptions & 0xFFFFFFFFFFFFFFE7 | 8;
  unint64_t v5 = hidEventDisplayOptions | 0x10;
  if (!a3) {
    unint64_t v5 = v4;
  }
  self->_unint64_t hidEventDisplayOptions = v5;
}

- (BOOL)displayTimestampsInCallTrees
{
  return self->_callTreeTimestampsTimeDomain != 0;
}

- (void)setDisplayTimestampsInCallTrees:(BOOL)a3
{
  if (!a3)
  {
    unint64_t v3 = 0;
LABEL_6:
    self->_callTreeTimestampsTimeDomain = v3;
    return;
  }
  if (!self->_callTreeTimestampsTimeDomain)
  {
    unint64_t v3 = 1;
    goto LABEL_6;
  }
}

- (BOOL)displayStacksWithZeroCount
{
  return self->_displayCallTreesWithZeroCount;
}

- (BOOL)aggregateStacksByThread
{
  if (self)
  {
    unint64_t callTreeAggregation = self->_callTreeAggregation;
    if (!callTreeAggregation)
    {
      unint64_t callTreeAggregation = 3;
      if (!self->_microstackshotsFormat) {
        unint64_t callTreeAggregation = 1;
      }
    }
  }
  else
  {
    unint64_t callTreeAggregation = 0;
  }
  return callTreeAggregation == 2;
}

- (void)setAggregateStacksByThread:(BOOL)a3
{
  if (a3)
  {
    unint64_t v3 = 2;
  }
  else
  {
    if (self->_callTreeAggregation != 2) {
      return;
    }
    unint64_t v3 = 0;
  }
  self->_unint64_t callTreeAggregation = v3;
}

- (void)setAggregateStacksByProcess:(BOOL)a3
{
  if (a3)
  {
    unint64_t v3 = 3;
  }
  else
  {
    if (self->_callTreeAggregation != 3) {
      return;
    }
    unint64_t v3 = 0;
  }
  self->_unint64_t callTreeAggregation = v3;
}

- (BOOL)aggregateProcessesByExecutable
{
  if (self)
  {
    unint64_t taskAggregation = self->_taskAggregation;
    if (!taskAggregation)
    {
      unint64_t taskAggregation = 1;
      if (self->_microstackshotsFormat) {
        unint64_t taskAggregation = 2;
      }
    }
  }
  else
  {
    unint64_t taskAggregation = 0;
  }
  return taskAggregation == 2;
}

- (void)setAggregateProcessesByExecutable:(BOOL)a3
{
  unint64_t v3 = 1;
  if (a3) {
    unint64_t v3 = 2;
  }
  self->_unint64_t taskAggregation = v3;
}

- (SASamplePrintOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)SASamplePrintOptions;
  v2 = [(SASamplePrintOptions *)&v9 init];
  unint64_t v3 = v2;
  if (v2)
  {
    *(_WORD *)(v2 + 35) = 257;
    v2[37] = 1;
    *(_DWORD *)(v2 + 14) = 0;
    v2[18] = 0;
    *(_DWORD *)(v2 + 19) = 1;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v5 = (void *)*((void *)v3 + 17);
    *((void *)v3 + 17) = v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = (void *)*((void *)v3 + 18);
    *((void *)v3 + 18) = v6;

    *((void *)v3 + 23) = 0;
    *((void *)v3 + 24) = 0;
    *(_DWORD *)(v3 + 38) = 16843009;
    *(_DWORD *)(v3 + 42) = 0x1000000;
    v3[46] = 0;
    *(_DWORD *)(v3 + 47) = 16843009;
    v3[51] = 1;
    *((_DWORD *)v3 + 13) = 16777472;
    *((_WORD *)v3 + 28) = 0;
    v3[58] = 1;
    *(_DWORD *)(v3 + 59) = 0;
    v3[63] = 1;
    *((_DWORD *)v3 + 16) = 0;
    v3[68] = 0;
    *(_DWORD *)(v3 + 69) = 65537;
    v3[73] = 1;
    *((void *)v3 + 26) = 13;
    *((void *)v3 + 16) = 0;
    *((void *)v3 + 21) = 0;
    *((void *)v3 + 22) = 0;
    *((void *)v3 + 19) = 0;
    *((void *)v3 + 20) = 0;
    *(_DWORD *)(v3 + 23) = 0x1000000;
    *((_DWORD *)v3 + 2) = 0;
    *((_WORD *)v3 + 6) = 256;
    *((_DWORD *)v3 + 19) = 0;
    *((_DWORD *)v3 + 20) = 0;
    *(void *)(v3 + 27) = 0;
  }
  return (SASamplePrintOptions *)v3;
}

- (BOOL)verbose
{
  if (self->_displayKernelFrames
    && self->_displayExclaveFrames
    && self->_displayUserFrames
    && self->_displayFrameAddresses
    && self->_displayDetailedCpuTime
    && self->_displayDetailedWallTime
    && self->_displayOffsetsFromUnnamedSymbols
    && self->_displayFullSourcePaths
    && self->_displaySymbolInformation
    && self->_displayBinaryImageAddresses
    && self->_displayBinaryImagesLackingNameOrPath
    && self->_displayRunningThreads
    && self->_displayRunnableThreads
    && self->_displayBlockedThreads
    && self->_displayCPUNumForRunningThreads
    && self->_displayCPUClusterInfoForRunningThreads
    && self->_displayCPUNumForNonRunningThreads
    && self->_displayThreadRunningState
    && self->_displayIdleWorkQueueThreads
    && self->_displayAllBinaries
    && self->_displayBlockedReasons
    && self->_displayBlockedReasonsLackingProcessOwners
    && self->_displayAddressesInBlockedReasons
    && self->_displayMultipleMatchingBlockedReasons
    && self->_displayEmptyBootArgs
    && self->_displayTasksWithZeroCount
    && self->_displayCallTreesWithZeroCount
    && self->_displayDifferentTypesOfSuspension
    && self->_displayAllTaskSizeChanges
    && self->_displayCodesigningIDsMatchingBundleIDs
    && self->_displayDefaultPowerModes
    && self->_displayIOInCallTrees
    && self->_displayEachIndividualIOInCallTrees
    && self->_displayOnBehalfOfInCallTrees
    && self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable
    && self->_displayTrialInformation
    && self->_swiftAsyncDisplayCRootCallstacks
    && self->_callTreeTimestampsTimeDomain == -1
    && (~LODWORD(self->_hidEventDisplayOptions) & 0x12) == 0)
  {
    return (self->_hidEventDisplayOptions >> 2) & 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)setVerbose:(BOOL)a3
{
  int8x16_t v3 = vdupq_n_s8(a3);
  self->_swiftAsyncDisplayCRootCallstacks = a3;
  *(int8x16_t *)&self->_displayKernelFrames = v3;
  *(int8x16_t *)&self->_displayCPUNumForNonRunningThreads = v3;
  *(_DWORD *)&self->_displayEachIndividualIOInCallTrees = 16843009 * a3;
  unint64_t v4 = 22;
  if (!a3) {
    unint64_t v4 = 0;
  }
  self->_callTreeTimestampsTimeDomain = a3 << 63 >> 63;
  self->_unint64_t hidEventDisplayOptions = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setDisplayHeader:self->_displayHeader];
  [v4 setDisplayBody:self->_displayBody];
  [v4 setDisplayFooter:self->_displayFooter];
  [v4 setTabDelineateBinaryImageSections:self->_tabDelineateBinaryImageSections];
  [v4 setBinaryImagesBeforeStacks:self->_binaryImagesBeforeStacks];
  [v4 setPrintSpinSignatureStack:self->_printSpinSignatureStack];
  [v4 setPrintTargetThreadOnly:self->_printTargetThreadOnly];
  [v4 setPrintHeavyStacks:self->_printHeavyStacks];
  [v4 setPrintJson:self->_printJson];
  [v4 setForceOneBasedTimeIndexes:self->_forceOneBasedTimeIndexes];
  [v4 setShowThreadStateAsLeafFrame:self->_showThreadStateAsLeafFrame];
  [v4 setPatchTruncatedStacks:self->_patchTruncatedStacks];
  unint64_t v5 = [v4 processSortAttributes];
  [v5 addObjectsFromArray:self->_processSortAttributes];

  id v6 = [v4 callTreeSortAttributes];
  [v6 addObjectsFromArray:self->_callTreeSortAttributes];

  [v4 setOmitTasksBelowPercentOfTotalSamples:self->_omitTasksBelowPercentOfTotalSamples];
  [v4 setOmitStacksBelowPercentOfTaskSamples:self->_omitStacksBelowPercentOfTaskSamples];
  [v4 setOmitFramesBelowPercentOfStackSamples:self->_omitFramesBelowPercentOfStackSamples];
  [v4 setOmitTasksBelowSampleCount:self->_omitTasksBelowSampleCount];
  [v4 setOmitStacksBelowSampleCount:self->_omitStacksBelowSampleCount];
  [v4 setOmitFramesBelowSampleCount:self->_omitFramesBelowSampleCount];
  [v4 setDisplayKernelFrames:self->_displayKernelFrames];
  [v4 setDisplayExclaveFrames:self->_displayExclaveFrames];
  [v4 setDisplayUserFrames:self->_displayUserFrames];
  [v4 setDisplayFrameAddresses:self->_displayFrameAddresses];
  [v4 setDisplayDetailedCpuTime:self->_displayDetailedCpuTime];
  [v4 setDisplayDetailedWallTime:self->_displayDetailedWallTime];
  [v4 setDisplayOffsetsFromUnnamedSymbols:self->_displayOffsetsFromUnnamedSymbols];
  [v4 setDisplayFullSourcePaths:self->_displayFullSourcePaths];
  [v4 setDisplaySymbolInformation:self->_displaySymbolInformation];
  [v4 setDisplayBinaryImageAddresses:self->_displayBinaryImageAddresses];
  [v4 setDisplayBinaryImagesLackingNameOrPath:self->_displayBinaryImagesLackingNameOrPath];
  [v4 setDisplayRunningThreads:self->_displayRunningThreads];
  [v4 setDisplayRunnableThreads:self->_displayRunnableThreads];
  [v4 setDisplayBlockedThreads:self->_displayBlockedThreads];
  [v4 setDisplayCPUNumForRunningThreads:self->_displayCPUNumForRunningThreads];
  [v4 setDisplayCPUClusterInfoForRunningThreads:self->_displayCPUClusterInfoForRunningThreads];
  [v4 setDisplayCPUNumForNonRunningThreads:self->_displayCPUNumForNonRunningThreads];
  [v4 setDisplayThreadRunningState:self->_displayThreadRunningState];
  [v4 setDisplayIdleWorkQueueThreads:self->_displayIdleWorkQueueThreads];
  [v4 setDisplayAllBinaries:self->_displayAllBinaries];
  [v4 setDisplayBlockedReasons:self->_displayBlockedReasons];
  [v4 setDisplayBlockedReasonsLackingProcessOwners:self->_displayBlockedReasonsLackingProcessOwners];
  [v4 setDisplayAddressesInBlockedReasons:self->_displayAddressesInBlockedReasons];
  [v4 setDisplayMultipleMatchingBlockedReasons:self->_displayMultipleMatchingBlockedReasons];
  [v4 setDisplayEmptyBootArgs:self->_displayEmptyBootArgs];
  [v4 setDisplayTasksWithZeroCount:self->_displayTasksWithZeroCount];
  [v4 setDisplayCallTreesWithZeroCount:self->_displayCallTreesWithZeroCount];
  [v4 setDisplayDifferentTypesOfSuspension:self->_displayDifferentTypesOfSuspension];
  [v4 setDisplayAllTaskSizeChanges:self->_displayAllTaskSizeChanges];
  [v4 setDisplayCodesigningIDsMatchingBundleIDs:self->_displayCodesigningIDsMatchingBundleIDs];
  [v4 setDisplayDefaultPowerModes:self->_displayDefaultPowerModes];
  [v4 setDisplayIOInCallTrees:self->_displayIOInCallTrees];
  [v4 setDisplayEachIndividualIOInCallTrees:self->_displayEachIndividualIOInCallTrees];
  [v4 setDisplayOnBehalfOfInCallTrees:self->_displayOnBehalfOfInCallTrees];
  [v4 setDisplayQoSTransitionsBetweenUnspecifiedAndUnavailable:self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable];
  [v4 setDisplayTrialInformation:self->_displayTrialInformation];
  [v4 setCallTreeTimestampsTimeDomain:self->_callTreeTimestampsTimeDomain];
  [v4 setHidEventDisplayOptions:self->_hidEventDisplayOptions];
  [v4 setCallTreeAggregation:self->_callTreeAggregation];
  [v4 setSwiftAsyncCallTreeAggregation:self->_swiftAsyncCallTreeAggregation];
  [v4 setTaskAggregation:self->_taskAggregation];
  [v4 setAggregateFramesByOffsetIntoBinary:self->_aggregateFramesByOffsetIntoBinary];
  [v4 setSwiftAsyncDisplayCRootCallstacks:self->_swiftAsyncDisplayCRootCallstacks];
  [v4 setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways];
  [v4 setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:self->_swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
  [v4 setMicrostackshotsFormat:self->_microstackshotsFormat];
  [v4 setSystemstatsFormat:self->_systemstatsFormat];
  [v4 setIncludeUserIdleAndBatteryStateInStacks:self->_includeUserIdleAndBatteryStateInStacks];
  [v4 setOmitStacksOnBattery:self->_omitStacksOnBattery];
  [v4 setOmitStacksOnAC:self->_omitStacksOnAC];
  [v4 setOmitStacksWithUserIdle:self->_omitStacksWithUserIdle];
  [v4 setOmitStacksWithUserActive:self->_omitStacksWithUserActive];
  [v4 setOmitStacksWithECore:self->_omitStacksWithECore];
  [v4 setOmitStacksWithPCore:self->_omitStacksWithPCore];
  [v4 setOmitStacksBelowBasePriority:self->_omitStacksBelowBasePriority];
  [v4 setOmitStacksAboveBasePriority:self->_omitStacksAboveBasePriority];
  [v4 setOmitAbsoluteWallTimes:self->_omitAbsoluteWallTimes];
  [v4 setPrintProblematicProcessesAndThreads:self->_printProblematicProcessesAndThreads];
  v7 = (void *)[(NSSet *)self->_tidsToPrint copy];
  [v4 setTidsToPrint:v7];

  v8 = (void *)[(NSSet *)self->_pidsToPrint copy];
  [v4 setPidsToPrint:v8];

  objc_super v9 = (void *)[(NSSet *)self->_uniquePidsToPrint copy];
  [v4 setUniquePidsToPrint:v9];

  v10 = (void *)[(NSSet *)self->_processUUIDsToPrint copy];
  [v4 setProcessUUIDsToPrint:v10];

  return v4;
}

- (void)setOmitTasksBelowPercentOfTotalSamples:(char)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x65)
  {
    int v4 = *__error();
    unint64_t v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v3;
      _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "omitTasksBelowPercentOfTotalSamples %d", buf, 8u);
    }

    *__error() = v4;
    _SASetCrashLogMessage(14091, "omitTasksBelowPercentOfTotalSamples %d", v6, v7, v8, v9, v10, v11, v3);
    _os_crash();
    __break(1u);
  }
  self->_omitTasksBelowPercentOfTotalSamples = a3;
}

- (void)setOmitStacksBelowPercentOfTaskSamples:(char)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x65)
  {
    int v4 = *__error();
    unint64_t v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v3;
      _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "omitStacksBelowPercentOfTaskSamples %d", buf, 8u);
    }

    *__error() = v4;
    _SASetCrashLogMessage(14100, "omitStacksBelowPercentOfTaskSamples %d", v6, v7, v8, v9, v10, v11, v3);
    _os_crash();
    __break(1u);
  }
  self->_omitStacksBelowPercentOfTaskSamples = a3;
}

- (char)omitStacksBelowPercentOfTaskSamples
{
  return self->_omitStacksBelowPercentOfTaskSamples;
}

- (void)setOmitFramesBelowPercentOfStackSamples:(char)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x65)
  {
    int v4 = *__error();
    unint64_t v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v3;
      _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "omitFramesBelowPercentOfStackSamples %d", buf, 8u);
    }

    *__error() = v4;
    _SASetCrashLogMessage(14109, "omitFramesBelowPercentOfStackSamples %d", v6, v7, v8, v9, v10, v11, v3);
    _os_crash();
    __break(1u);
  }
  self->_omitFramesBelowPercentOfStackSamples = a3;
}

- (char)omitFramesBelowPercentOfStackSamples
{
  return self->_omitFramesBelowPercentOfStackSamples;
}

- (BOOL)microstackshotsFormat
{
  return self->_microstackshotsFormat;
}

- (BOOL)systemstatsFormat
{
  return self->_systemstatsFormat;
}

- (void)setSystemstatsFormat:(BOOL)a3
{
  if (a3)
  {
    [(SASamplePrintOptions *)self setMicrostackshotsFormat:1];
    self->_displayIOInCallTrees = 0;
    self->_displayOnBehalfOfInCallTrees = 0;
  }
  self->_systemstatsFormat = a3;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  BOOL swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways = self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways;
  unint64_t swiftAsyncCallTreeAggregation = self->_swiftAsyncCallTreeAggregation;
  BOOL swiftAsyncDisplayCRootCallstacks = self->_swiftAsyncDisplayCRootCallstacks;
  unint64_t callTreeTimestampsTimeDomain = self->_callTreeTimestampsTimeDomain;
  unint64_t callTreeAggregation = self->_callTreeAggregation;
  BOOL displayQoSTransitionsBetweenUnspecifiedAndUnavailable = self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable;
  BOOL displayTrialInformation = self->_displayTrialInformation;
  BOOL displayEachIndividualIOInCallTrees = self->_displayEachIndividualIOInCallTrees;
  BOOL displayOnBehalfOfInCallTrees = self->_displayOnBehalfOfInCallTrees;
  BOOL displayDefaultPowerModes = self->_displayDefaultPowerModes;
  BOOL displayIOInCallTrees = self->_displayIOInCallTrees;
  BOOL displayAllTaskSizeChanges = self->_displayAllTaskSizeChanges;
  BOOL displayCodesigningIDsMatchingBundleIDs = self->_displayCodesigningIDsMatchingBundleIDs;
  BOOL displayTasksWithZeroCount = self->_displayTasksWithZeroCount;
  BOOL displayMultipleMatchingBlockedReasons = self->_displayMultipleMatchingBlockedReasons;
  BOOL displayEmptyBootArgs = self->_displayEmptyBootArgs;
  int v4 = objc_msgSend(v3, "initWithFormat:", @"displayHeader: %d\ndisplayBody: %d\ndisplayFooter: %d\ntabDelineateBinaryImageSections: %d\nbinaryImagesBeforeStacks: %d\nprintSpinSignatureStack: %d\nprintTargetThreadOnly: %d\nprintHeavyStacks: %d\nprintJson: %d\nforceOneBasedTimeIndexes: %d\nshowThreadStateAsLeafFrame: %d\npatchTruncatedStacks: %d\nomitTasksBelowPercentOfTotalSamples: %d\nomitStacksBelowPercentOfTaskSamples: %d\nomitFramesBelowPercentOfStackSamples: %d\nomitTasksBelowSampleCount: %lld\nomitStacksBelowSampleCount: %lld\nomitFramesBelowSampleCount: %lld\nprocessSortAttributes: %@\ncallTreeSortAttributes: %@\ndisplayKernelFrames: %d\ndisplayExclaveFrames: %d\ndisplayUserFrames: %d\ndisplayFrameAddresses: %d\ndisplayDetailedCpuTime: %d\ndisplayDetailedWallTime: %d\ndisplayOffsetsFromUnnamedSymbols: %d\ndisplayFullSourcePaths: %d\ndisplaySymbolInformation: %d\ndisplayBinaryImageAddresses: %d\ndisplayBinaryImagesLackingNameOrPath: %d\ndisplayRunningThreads: %d\ndisplayRunnableThreads: %d\ndisplayBlockedThreads: %d\ndisplayCPUNumForRunningThreads: %d\ndisplayCPUClusterInfoForRunningThreads: %d\ndisplayCPUNumForNonRunningThreads: %d\ndisplayThreadRunningState: %d\ndisplayIdleWorkQueueThreads: %d\ndisplayAllBinaries: %d\ndisplayBlockedReasons: %d\ndisplayBlockedReasonsLackingProcessOwners: %d\ndisplayAddressesInBlockedReasons: %d\ndisplayMultipleMatchingBlockedReasons: %d\ndisplayEmptyBootArgs: %d\nhidEventDisplayOptions: 0x%llx\ndisplayTasksWithZeroCount: %d\ndisplayAllTaskSizeChanges: %d\ndisplayCodesigningIDsMatchingBundleIDs: %d\ndisplayDefaultPowerModes: %d\ndisplayIOInCallTrees: %d\ndisplayEachIndividualIOInCallTrees: %d\ndisplayOnBehalfOfInCallTrees: %d\ndisplayQoSTransitionsBetweenUnspecifiedAndUnavailable: %d\ndisplayTrialInformation: %d\ncallTreeTimestampsTimeDomain: 0x%llx\ncallTreeAggregation: %llu\nswiftAsyncCallTreeAggregation: %llu\nswiftAsyncDisplayCRootCallstacks: %d\nswiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways: %d\nswiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways: %d\ntaskAggregation: %llu\naggregateFramesByOffsetIntoBinary: %d\nmicrostackshotsFormat: %d\nsystemstatsFormat: %d\nincludeUserIdleAndBatteryStateInStacks: %d\nomitStacksOnBattery: %d\nomitStacksOnAC: %d\nomitStacksWithUserIdle: %d\nomitStacksWithUserActive: %d\nomitStacksWithECore: %d\nomitStacksWithPCore: %d\nomitStacksBelowBasePriority: %d\nomitStacksAboveBasePriority: %d\nomitAbsoluteWallTimes: %d\nprintProblematicProcessesAndThreads: %d\ntidsToPrint: %@\npidsToPrint: %@\nuniquePidsToPrint: %@\nprocessUUIDsToPrint: %@\n", self->_displayHeader, self->_displayBody, self->_displayFooter, self->_tabDelineateBinaryImageSections, self->_binaryImagesBeforeStacks, self->_printSpinSignatureStack, self->_printTargetThreadOnly, self->_printHeavyStacks, self->_printJson, self->_forceOneBasedTimeIndexes, self->_showThreadStateAsLeafFrame, self->_patchTruncatedStacks, self->_omitTasksBelowPercentOfTotalSamples, self->_omitStacksBelowPercentOfTaskSamples, self->_omitFramesBelowPercentOfStackSamples, self->_omitTasksBelowSampleCount,
                 self->_omitStacksBelowSampleCount,
                 self->_omitFramesBelowSampleCount,
                 self->_processSortAttributes,
                 self->_callTreeSortAttributes,
                 self->_displayKernelFrames,
                 self->_displayExclaveFrames,
                 self->_displayUserFrames,
                 self->_displayFrameAddresses,
                 self->_displayDetailedCpuTime,
                 self->_displayDetailedWallTime,
                 self->_displayOffsetsFromUnnamedSymbols,
                 self->_displayFullSourcePaths,
                 self->_displaySymbolInformation,
                 self->_displayBinaryImageAddresses,
                 self->_displayBinaryImagesLackingNameOrPath,
                 self->_displayRunningThreads,
                 self->_displayRunnableThreads,
                 self->_displayBlockedThreads,
                 self->_displayCPUNumForRunningThreads,
                 self->_displayCPUClusterInfoForRunningThreads,
                 self->_displayCPUNumForNonRunningThreads,
                 self->_displayThreadRunningState,
                 self->_displayIdleWorkQueueThreads,
                 self->_displayAllBinaries,
                 self->_displayBlockedReasons,
                 self->_displayBlockedReasonsLackingProcessOwners,
                 self->_displayAddressesInBlockedReasons,
                 displayMultipleMatchingBlockedReasons,
                 displayEmptyBootArgs,
                 self->_hidEventDisplayOptions,
                 displayTasksWithZeroCount,
                 displayAllTaskSizeChanges,
                 displayCodesigningIDsMatchingBundleIDs,
                 displayDefaultPowerModes,
                 displayIOInCallTrees,
                 displayEachIndividualIOInCallTrees,
                 displayOnBehalfOfInCallTrees,
                 displayQoSTransitionsBetweenUnspecifiedAndUnavailable,
                 displayTrialInformation,
                 callTreeTimestampsTimeDomain,
                 callTreeAggregation,
                 swiftAsyncCallTreeAggregation,
                 swiftAsyncDisplayCRootCallstacks,
                 swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways);
  return v4;
}

- (NSSet)pidsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPidsToPrint:(id)a3
{
}

- (NSSet)uniquePidsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUniquePidsToPrint:(id)a3
{
}

- (NSSet)processNamesToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProcessNamesToPrint:(id)a3
{
}

- (NSSet)processUUIDsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProcessUUIDsToPrint:(id)a3
{
}

- (NSSet)tidsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTidsToPrint:(id)a3
{
}

- (BOOL)printProblematicProcessesAndThreads
{
  return self->_printProblematicProcessesAndThreads;
}

- (void)setPrintProblematicProcessesAndThreads:(BOOL)a3
{
  self->_printProblematicProcessesAndThreads = a3;
}

- (unint64_t)callTreeTimestampsTimeDomain
{
  return self->_callTreeTimestampsTimeDomain;
}

- (void)setCallTreeTimestampsTimeDomain:(unint64_t)a3
{
  self->_unint64_t callTreeTimestampsTimeDomain = a3;
}

- (void)setPrintHeavyStacks:(BOOL)a3
{
  self->_printHeavyStacks = a3;
}

- (BOOL)printJson
{
  return self->_printJson;
}

- (void)setPrintJson:(BOOL)a3
{
  self->_printJson = a3;
}

- (BOOL)printSpinSignatureStack
{
  return self->_printSpinSignatureStack;
}

- (void)setPrintSpinSignatureStack:(BOOL)a3
{
  self->_printSpinSignatureStack = a3;
}

- (void)setPrintTargetThreadOnly:(BOOL)a3
{
  self->_printTargetThreadOnly = a3;
}

- (BOOL)forceOneBasedTimeIndexes
{
  return self->_forceOneBasedTimeIndexes;
}

- (void)setForceOneBasedTimeIndexes:(BOOL)a3
{
  self->_forceOneBasedTimeIndexes = a3;
}

- (BOOL)patchTruncatedStacks
{
  return self->_patchTruncatedStacks;
}

- (void)setPatchTruncatedStacks:(BOOL)a3
{
  self->_patchTruncatedStacks = a3;
}

- (void)setTabDelineateBinaryImageSections:(BOOL)a3
{
  self->_tabDelineateBinaryImageSections = a3;
}

- (BOOL)binaryImagesBeforeStacks
{
  return self->_binaryImagesBeforeStacks;
}

- (void)setBinaryImagesBeforeStacks:(BOOL)a3
{
  self->_binaryImagesBeforeStacks = a3;
}

- (BOOL)showThreadStateAsLeafFrame
{
  return self->_showThreadStateAsLeafFrame;
}

- (void)setShowThreadStateAsLeafFrame:(BOOL)a3
{
  self->_showThreadStateAsLeafFrame = a3;
}

- (NSMutableArray)processSortAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSMutableArray)callTreeSortAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (unint64_t)callTreeAggregation
{
  return self->_callTreeAggregation;
}

- (void)setCallTreeAggregation:(unint64_t)a3
{
  self->_unint64_t callTreeAggregation = a3;
}

- (unint64_t)swiftAsyncCallTreeAggregation
{
  return self->_swiftAsyncCallTreeAggregation;
}

- (void)setSwiftAsyncCallTreeAggregation:(unint64_t)a3
{
  self->_unint64_t swiftAsyncCallTreeAggregation = a3;
}

- (BOOL)swiftAsyncDisplayCRootCallstacks
{
  return self->_swiftAsyncDisplayCRootCallstacks;
}

- (void)setSwiftAsyncDisplayCRootCallstacks:(BOOL)a3
{
  self->_BOOL swiftAsyncDisplayCRootCallstacks = a3;
}

- (BOOL)swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways
{
  return self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways;
}

- (void)setSwiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways:(BOOL)a3
{
  self->_BOOL swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways = a3;
}

- (BOOL)swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways
{
  return self->_swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways;
}

- (void)setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:(BOOL)a3
{
  self->_swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways = a3;
}

- (unint64_t)taskAggregation
{
  return self->_taskAggregation;
}

- (void)setTaskAggregation:(unint64_t)a3
{
  self->_unint64_t taskAggregation = a3;
}

- (BOOL)aggregateFramesByOffsetIntoBinary
{
  return self->_aggregateFramesByOffsetIntoBinary;
}

- (void)setAggregateFramesByOffsetIntoBinary:(BOOL)a3
{
  self->_aggregateFramesByOffsetIntoBinary = a3;
}

- (void)setIncludeUserIdleAndBatteryStateInStacks:(BOOL)a3
{
  self->_includeUserIdleAndBatteryStateInStacks = a3;
}

- (BOOL)omitStacksOnBattery
{
  return self->_omitStacksOnBattery;
}

- (void)setOmitStacksOnBattery:(BOOL)a3
{
  self->_omitStacksOnBattery = a3;
}

- (BOOL)omitStacksOnAC
{
  return self->_omitStacksOnAC;
}

- (void)setOmitStacksOnAC:(BOOL)a3
{
  self->_omitStacksOnAC = a3;
}

- (BOOL)omitStacksWithUserIdle
{
  return self->_omitStacksWithUserIdle;
}

- (void)setOmitStacksWithUserIdle:(BOOL)a3
{
  self->_omitStacksWithUserIdle = a3;
}

- (BOOL)omitStacksWithUserActive
{
  return self->_omitStacksWithUserActive;
}

- (void)setOmitStacksWithUserActive:(BOOL)a3
{
  self->_omitStacksWithUserActive = a3;
}

- (BOOL)omitStacksWithPCore
{
  return self->_omitStacksWithPCore;
}

- (void)setOmitStacksWithPCore:(BOOL)a3
{
  self->_omitStacksWithPCore = a3;
}

- (BOOL)omitStacksWithECore
{
  return self->_omitStacksWithECore;
}

- (void)setOmitStacksWithECore:(BOOL)a3
{
  self->_omitStacksWithECore = a3;
}

- (int)omitStacksBelowBasePriority
{
  return self->_omitStacksBelowBasePriority;
}

- (void)setOmitStacksBelowBasePriority:(int)a3
{
  self->_omitStacksBelowBasePriority = a3;
}

- (int)omitStacksAboveBasePriority
{
  return self->_omitStacksAboveBasePriority;
}

- (void)setOmitStacksAboveBasePriority:(int)a3
{
  self->_omitStacksAboveBasePriority = a3;
}

- (BOOL)omitAbsoluteWallTimes
{
  return self->_omitAbsoluteWallTimes;
}

- (void)setOmitAbsoluteWallTimes:(BOOL)a3
{
  self->_omitAbsoluteWallTimes = a3;
}

- (BOOL)displayHeader
{
  return self->_displayHeader;
}

- (void)setDisplayHeader:(BOOL)a3
{
  self->_displayHeader = a3;
}

- (BOOL)displayBody
{
  return self->_displayBody;
}

- (void)setDisplayBody:(BOOL)a3
{
  self->_displayBody = a3;
}

- (BOOL)displayFooter
{
  return self->_displayFooter;
}

- (void)setDisplayFooter:(BOOL)a3
{
  self->_displayFooter = a3;
}

- (int64_t)omitTasksBelowSampleCount
{
  return self->_omitTasksBelowSampleCount;
}

- (void)setOmitTasksBelowSampleCount:(int64_t)a3
{
  self->_omitTasksBelowSampleCount = a3;
}

- (int64_t)omitStacksBelowSampleCount
{
  return self->_omitStacksBelowSampleCount;
}

- (void)setOmitStacksBelowSampleCount:(int64_t)a3
{
  self->_omitStacksBelowSampleCount = a3;
}

- (int64_t)omitFramesBelowSampleCount
{
  return self->_omitFramesBelowSampleCount;
}

- (void)setOmitFramesBelowSampleCount:(int64_t)a3
{
  self->_omitFramesBelowSampleCount = a3;
}

- (int64_t)omitFramesAfterLineCount
{
  return self->_omitFramesAfterLineCount;
}

- (void)setOmitFramesAfterLineCount:(int64_t)a3
{
  self->_omitFramesAfterLineCount = a3;
}

- (BOOL)displayKernelFrames
{
  return self->_displayKernelFrames;
}

- (void)setDisplayKernelFrames:(BOOL)a3
{
  self->_displayKernelFrames = a3;
}

- (BOOL)displayExclaveFrames
{
  return self->_displayExclaveFrames;
}

- (void)setDisplayExclaveFrames:(BOOL)a3
{
  self->_displayExclaveFrames = a3;
}

- (BOOL)displayUserFrames
{
  return self->_displayUserFrames;
}

- (void)setDisplayUserFrames:(BOOL)a3
{
  self->_displayUserFrames = a3;
}

- (BOOL)displayFrameAddresses
{
  return self->_displayFrameAddresses;
}

- (void)setDisplayFrameAddresses:(BOOL)a3
{
  self->_displayFrameAddresses = a3;
}

- (BOOL)displayDetailedCpuTime
{
  return self->_displayDetailedCpuTime;
}

- (void)setDisplayDetailedCpuTime:(BOOL)a3
{
  self->_displayDetailedCpuTime = a3;
}

- (BOOL)displayDetailedWallTime
{
  return self->_displayDetailedWallTime;
}

- (void)setDisplayDetailedWallTime:(BOOL)a3
{
  self->_displayDetailedWallTime = a3;
}

- (BOOL)displayOffsetsFromUnnamedSymbols
{
  return self->_displayOffsetsFromUnnamedSymbols;
}

- (void)setDisplayOffsetsFromUnnamedSymbols:(BOOL)a3
{
  self->_displayOffsetsFromUnnamedSymbols = a3;
}

- (void)setDisplaySymbolInformation:(BOOL)a3
{
  self->_displaySymbolInformation = a3;
}

- (BOOL)displayFullSourcePaths
{
  return self->_displayFullSourcePaths;
}

- (void)setDisplayFullSourcePaths:(BOOL)a3
{
  self->_displayFullSourcePaths = a3;
}

- (BOOL)displayBinaryImageAddresses
{
  return self->_displayBinaryImageAddresses;
}

- (void)setDisplayBinaryImageAddresses:(BOOL)a3
{
  self->_displayBinaryImageAddresses = a3;
}

- (BOOL)displayBinaryImagesLackingNameOrPath
{
  return self->_displayBinaryImagesLackingNameOrPath;
}

- (void)setDisplayBinaryImagesLackingNameOrPath:(BOOL)a3
{
  self->_displayBinaryImagesLackingNameOrPath = a3;
}

- (BOOL)displayRunningThreads
{
  return self->_displayRunningThreads;
}

- (void)setDisplayRunningThreads:(BOOL)a3
{
  self->_displayRunningThreads = a3;
}

- (BOOL)displayRunnableThreads
{
  return self->_displayRunnableThreads;
}

- (void)setDisplayRunnableThreads:(BOOL)a3
{
  self->_displayRunnableThreads = a3;
}

- (BOOL)displayBlockedThreads
{
  return self->_displayBlockedThreads;
}

- (void)setDisplayBlockedThreads:(BOOL)a3
{
  self->_displayBlockedThreads = a3;
}

- (BOOL)displayCPUNumForRunningThreads
{
  return self->_displayCPUNumForRunningThreads;
}

- (void)setDisplayCPUNumForRunningThreads:(BOOL)a3
{
  self->_displayCPUNumForRunningThreads = a3;
}

- (BOOL)displayCPUClusterInfoForRunningThreads
{
  return self->_displayCPUClusterInfoForRunningThreads;
}

- (void)setDisplayCPUClusterInfoForRunningThreads:(BOOL)a3
{
  self->_displayCPUClusterInfoForRunningThreads = a3;
}

- (BOOL)displayCPUNumForNonRunningThreads
{
  return self->_displayCPUNumForNonRunningThreads;
}

- (void)setDisplayCPUNumForNonRunningThreads:(BOOL)a3
{
  self->_displayCPUNumForNonRunningThreads = a3;
}

- (BOOL)displayThreadRunningState
{
  return self->_displayThreadRunningState;
}

- (void)setDisplayThreadRunningState:(BOOL)a3
{
  self->_displayThreadRunningState = a3;
}

- (BOOL)displayIdleWorkQueueThreads
{
  return self->_displayIdleWorkQueueThreads;
}

- (void)setDisplayIdleWorkQueueThreads:(BOOL)a3
{
  self->_displayIdleWorkQueueThreads = a3;
}

- (BOOL)displayAllBinaries
{
  return self->_displayAllBinaries;
}

- (void)setDisplayAllBinaries:(BOOL)a3
{
  self->_displayAllBinaries = a3;
}

- (void)setDisplayBlockedReasons:(BOOL)a3
{
  self->_displayBlockedReasons = a3;
}

- (BOOL)displayBlockedReasonsLackingProcessOwners
{
  return self->_displayBlockedReasonsLackingProcessOwners;
}

- (void)setDisplayBlockedReasonsLackingProcessOwners:(BOOL)a3
{
  self->_displayBlockedReasonsLackingProcessOwners = a3;
}

- (BOOL)displayAddressesInBlockedReasons
{
  return self->_displayAddressesInBlockedReasons;
}

- (void)setDisplayAddressesInBlockedReasons:(BOOL)a3
{
  self->_displayAddressesInBlockedReasons = a3;
}

- (BOOL)displayMultipleMatchingBlockedReasons
{
  return self->_displayMultipleMatchingBlockedReasons;
}

- (void)setDisplayMultipleMatchingBlockedReasons:(BOOL)a3
{
  self->_BOOL displayMultipleMatchingBlockedReasons = a3;
}

- (BOOL)displayEmptyBootArgs
{
  return self->_displayEmptyBootArgs;
}

- (void)setDisplayEmptyBootArgs:(BOOL)a3
{
  self->_BOOL displayEmptyBootArgs = a3;
}

- (unint64_t)hidEventDisplayOptions
{
  return self->_hidEventDisplayOptions;
}

- (void)setHidEventDisplayOptions:(unint64_t)a3
{
  self->_unint64_t hidEventDisplayOptions = a3;
}

- (BOOL)displayTasksWithZeroCount
{
  return self->_displayTasksWithZeroCount;
}

- (void)setDisplayTasksWithZeroCount:(BOOL)a3
{
  self->_BOOL displayTasksWithZeroCount = a3;
}

- (BOOL)displayCallTreesWithZeroCount
{
  return self->_displayCallTreesWithZeroCount;
}

- (void)setDisplayCallTreesWithZeroCount:(BOOL)a3
{
  self->_displayCallTreesWithZeroCount = a3;
}

- (BOOL)displayDifferentTypesOfSuspension
{
  return self->_displayDifferentTypesOfSuspension;
}

- (void)setDisplayDifferentTypesOfSuspension:(BOOL)a3
{
  self->_displayDifferentTypesOfSuspension = a3;
}

- (BOOL)displayAllTaskSizeChanges
{
  return self->_displayAllTaskSizeChanges;
}

- (void)setDisplayAllTaskSizeChanges:(BOOL)a3
{
  self->_BOOL displayAllTaskSizeChanges = a3;
}

- (BOOL)displayCodesigningIDsMatchingBundleIDs
{
  return self->_displayCodesigningIDsMatchingBundleIDs;
}

- (void)setDisplayCodesigningIDsMatchingBundleIDs:(BOOL)a3
{
  self->_BOOL displayCodesigningIDsMatchingBundleIDs = a3;
}

- (BOOL)displayDefaultPowerModes
{
  return self->_displayDefaultPowerModes;
}

- (void)setDisplayDefaultPowerModes:(BOOL)a3
{
  self->_BOOL displayDefaultPowerModes = a3;
}

- (BOOL)displayIOInCallTrees
{
  return self->_displayIOInCallTrees;
}

- (void)setDisplayIOInCallTrees:(BOOL)a3
{
  self->_BOOL displayIOInCallTrees = a3;
}

- (BOOL)displayEachIndividualIOInCallTrees
{
  return self->_displayEachIndividualIOInCallTrees;
}

- (void)setDisplayEachIndividualIOInCallTrees:(BOOL)a3
{
  self->_BOOL displayEachIndividualIOInCallTrees = a3;
}

- (BOOL)displayOnBehalfOfInCallTrees
{
  return self->_displayOnBehalfOfInCallTrees;
}

- (void)setDisplayOnBehalfOfInCallTrees:(BOOL)a3
{
  self->_BOOL displayOnBehalfOfInCallTrees = a3;
}

- (BOOL)displayQoSTransitionsBetweenUnspecifiedAndUnavailable
{
  return self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable;
}

- (void)setDisplayQoSTransitionsBetweenUnspecifiedAndUnavailable:(BOOL)a3
{
  self->_BOOL displayQoSTransitionsBetweenUnspecifiedAndUnavailable = a3;
}

- (BOOL)displayTrialInformation
{
  return self->_displayTrialInformation;
}

- (void)setDisplayTrialInformation:(BOOL)a3
{
  self->_BOOL displayTrialInformation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callTreeSortAttributes, 0);
  objc_storeStrong((id *)&self->_processSortAttributes, 0);
  objc_storeStrong((id *)&self->_tidsToPrint, 0);
  objc_storeStrong((id *)&self->_processUUIDsToPrint, 0);
  objc_storeStrong((id *)&self->_processNamesToPrint, 0);
  objc_storeStrong((id *)&self->_uniquePidsToPrint, 0);
  objc_storeStrong((id *)&self->_pidsToPrint, 0);
}

@end