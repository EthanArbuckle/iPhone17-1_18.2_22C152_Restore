@interface SASamplePrinter
- (BOOL)frame:(void *)a3 matchesFrame:;
- (BOOL)hasTimeIndexes;
- (BOOL)shareWithAppDevs;
- (BOOL)taskHasSwallowedAnExceptionNotedByHIException:(BOOL)a1;
- (NSString)headerNote;
- (NSUUID)incidentUUID;
- (SABinaryLoadInfoToDisplay)displayedBinaryLoadInfoForBinary:(void *)a1 segment:(void *)a2 desiredLoadAddress:(uint64_t)a3 offsetIntoLoadInfo:(unint64_t)a4 isInKernelAddressSpace:(BOOL)a5 exclave:(void *)a6 binariesToDisplay:(void *)a7 extraBinariesToDisplay:(void *)a8;
- (SASamplePrintOptions)options;
- (SASamplePrinter)initWithSampleStore:(id)a3;
- (SASampleStore)sampleStore;
- (SAStack)stackForThread:(void *)a3 threadStateIndexes:(void *)a4 task:(uint64_t)a5 taskSampleCount:(BOOL)a6 isTarget:;
- (__CFString)displayNameForDispatchQueue:(void *)a1;
- (__CFString)displayNameForPid:(id *)a1 aroundTimestamp:(uint64_t)a2 includePid:(void *)a3;
- (__CFString)displayStringForResourceCoalition:(void *)a1;
- (__CFString)timeIndexDescriptionForStartSampleIndex:(unint64_t)a3 endSampleIndex:(unsigned int)a4 formattedToLength:;
- (__CFString)timeIndexDescriptionForTimestamp:(uint64_t)a1;
- (double)timeSpentAsleepBetweenStartTimestamp:(void *)a3 endTimestamp:;
- (id)_findIOBefore:(void *)a3 during:(void *)a4 after:(void *)a5 thread:(unint64_t)a6 stateIndex:(void *)a7 inIO:(void *)a8 nextIO:;
- (id)architectureStringForTask:(uint64_t)a1;
- (id)binaryImagesHitByTask:(uint64_t)a1;
- (id)callTreeForDispatchQueue:(id)a3 andThread:(id)a4 inTask:(id)a5;
- (id)callTreeForDispatchQueue:(id)a3 swiftTask:(id)a4 thread:(id)a5 inTask:(id)a6;
- (id)callTreeForExecutable:(id)a3;
- (id)callTreeForSwiftTask:(id)a3 thread:(id)a4 inTask:(id)a5;
- (id)callTreeForTask:(id)a3;
- (id)callTreeForThread:(id)a3 inTask:(id)a4;
- (id)callTreesForThreadsInTask:(id)a3;
- (id)copyDescriptionForTimeRanges:(uint64_t)a1;
- (id)displayNameForPid:(uint64_t)a3 threadId:(void *)a4 timestamp:;
- (id)displayNameForTask:(int)a3 includePid:;
- (id)displayNameForTask:(uint64_t)a3 threadId:;
- (id)displayNameForTask:(void *)a1;
- (id)displayNameForTask:(void *)a3 thread:(void *)a4 threadState:;
- (id)displayStringForOnBehalfOfForTasks:(uint64_t)a1 includePid:(void *)a2;
- (id)displayedBinaryLoadInfoForLoadInfo:(uint64_t)a1 offsetIntoLoadInfo:(void *)a2 binariesToDisplay:(unint64_t)a3 extraBinariesToDisplay:(void *)a4;
- (id)eventEndTimeWithWallTime;
- (id)eventStartTimeWithWallTime;
- (id)indexForBinary:(uint64_t)a1;
- (id)sortedLoadInfosForBinaryImages:(uint64_t)a1;
- (id)stacksForTask:(unsigned char *)a3 taskSampleCount:;
- (id)stateChangeStringForThreadState:(void *)a3 serialDispatchQueue:(void *)a4 swiftTaskStates:(void *)a5 thread:(void *)a6 threadStateIndexes:(void *)a7 taskState:(void *)a8 task:(uint64_t)a9 iteratorIndex:(char)a10 missingStateIsInAnotherStack:(uint64_t)a11 numSamplesOmittedSincePreviousDisplayedSample:(void *)a12 sampleTimestamp:(void *)a13 previousSampleTimestamp:(void *)a14 previousDisplayedTimestamp:(void *)a15 previousTaskState:(void *)a16 previousThread:(void *)a17 previousThreadState:(char)a18 dispatchQueueChanges:(char)a19 swiftTaskChanges:(char)a20 priorityChanges:(char)a21 nameChanges:(char)a22 threadChanges:(char)a23 isTimeJump:(void *)a24 ioEventsSincePreviousThreadState:;
- (uint64_t)aggregateByDispatchQueue:(uint64_t)a1;
- (uint64_t)checkForBadOptions;
- (uint64_t)complainAboutSamplingGapBetweenStartTimestamp:(void *)a3 endTimestamp:;
- (uint64_t)copyDescriptionForIOEvent:(void *)a1;
- (uint64_t)copyDescriptionForIOEvents:(id *)a1;
- (uint64_t)copyDescriptionForTruncatedLeafFrame:(void *)a3 otherCallTreeDescription:(void *)a4 binariesToDisplay:(void *)a5 extraBinariesToDisplay:;
- (uint64_t)displayTimeIndexForSampleIndex:(uint64_t)result;
- (uint64_t)highestPriorityInTask:(char)a3 useBasePriority:;
- (uint64_t)numIOsForTask:(void *)a3 ioSize:;
- (uint64_t)printTaskHeaderForTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:;
- (uint64_t)shouldPrintTask:(void *)a3 thread:(void *)a4 dispatchQueue:;
- (uint64_t)shouldPrintTimeOutsideSamplingRange:(uint64_t)a1;
- (void)addHeaderForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 toStack:(void *)a7 task:(uint64_t)a8 taskSampleCount:;
- (void)addStack:(void *)a3 toStream:(unint64_t)a4 sampleCount:(void *)a5 binariesToDisplay:(uint64_t)a6 primaryState:(int)a7 primaryMicrostackshotState:(char)a8 onlyHeaviestStack:;
- (void)addStackForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 task:(void *)a7 toRootObjects:(char)a8 nameChanges:(char)a9 dispatchQueueChanges:(char)a10 swiftTaskChanges:(char)a11 threadChanges:(char)a12 priorityChanges:(void *)a13 microstackshotSummary:(unsigned __int8)a14 onlyHeaviestStack:(unsigned __int8)a15 includeState:;
- (void)addStackForSwiftTask:(void *)a3 andThread:(void *)a4 task:(void *)a5 toRootObjects:;
- (void)addTaskHeaderToStream:(void *)a3 displayName:(uint64_t)a4 pid:(void *)a5 mainBinary:(void *)a6 mainBinaryPath:(void *)a7 sharedCaches:(uint64_t)a8 uid:(double)a9 bundleIdentifier:(void *)a10 bundleVersion:(void *)a11 bundleShortVersion:(void *)a12 bundleBuildVersion:(void *)a13 bundleProjectName:(void *)a14 bundleSourceVersion:(void *)a15 bundleProductBuildVersion:(void *)a16 adamID:(uint64_t)a17 installerVersionID:(void *)a18 developerType:(char)a19 appType:(void *)a20 isBeta:(unsigned __int8)a21 cohortID:(void *)a22 vendorID:(void *)a23 distributorID:(void *)a24 codesigningID:(void *)a25 teamID:(void *)a26 resourceCoalitionSampleCounts:(void *)a27 onBehalfOfProcesses:(void *)a28 architectureString:(void *)a29 kernelVersion:(void *)a30 parentName:(void *)a31 responsibleName:(void *)a32 taskExecedFromName:(void *)a33 taskExecedToName:(void *)a34 pidStartTimestamp:(void *)a35 startTimestamp:(void *)a36 endTimestamp:(void *)a37 startSampleIndex:(unint64_t)a38 endSampleIndex:(unint64_t)a39 numSamples:(unint64_t)a40 totalNumSamples:(unint64_t)a41 numSamplesSuspended:(uint64_t)a42 numSamplesTerminated:(uint64_t)a43 startingTaskSize:(unint64_t)a44 endingTaskSize:(unint64_t)a45 maxTaskSize:(unint64_t)a46 startSampleIndexOfMaxTaskSize:(unint64_t)a47 endSampleIndexOfMaxTaskSize:(unint64_t)a48 numPageins:(unsigned int)a49 cpuTimeNs:(unint64_t)a50 cpuInstructions:(unint64_t)a51 cpuCycles:(unint64_t)a52 nonThreadCpuTimeNs:(unint64_t)a53 nonThreadCpuInstructions:(unint64_t)a54 nonThreadCpuCycles:(unint64_t)a55 usesSuddenTermination:(char)a56 allowsIdleExit:(char)a57 isTranslocated:(char)a58 isUnresponsive:(char)a59 timeOfLastResponse:(uint64_t)a60 numThreads:(uint64_t)a61 numIdleWorkQueueThreads:(uint64_t)a62 numOtherHiddenThreads:(char)a63 hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:;
- (void)avoidOverlapInBinaryLoadInfos:(int)a3 onlyExclaves:(void *)a4 inTask:;
- (void)copyDescriptionsForFrame:(void *)a3 binariesToDisplay:(void *)a4 extraBinariesToDisplay:;
- (void)filterToDisplayTimeIndexStart:(unint64_t)a3 end:(unint64_t)a4;
- (void)filterToMachAbsTimeRangeStart:(unint64_t)a3 end:(unint64_t)a4;
- (void)filterToTimestampRangeStart:(id)a3 end:(id)a4;
- (void)filterToWallTimeRangeStart:(double)a3 end:(double)a4;
- (void)iterateDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 threadStateIndexes:(unint64_t)a6 startingAtIndex:(void *)a7 endingAfterTimestamp:(void *)a8 task:(char)a9 stopAtTimeJumps:(void *)a10 callback:;
- (void)largestFootprintInTask:(void *)a1;
- (void)printBinaryImagesForTask:(uint64_t)a1;
- (void)printHIDEvent:(uint64_t)a1;
- (void)printHeader;
- (void)printLoadInfos:(id *)a1;
- (void)printReport;
- (void)printSingleStackForTasks:(void *)a3 limitToDispatchQueueIds:(void *)a4 limitToThreadIds:(char)a5 intersection:(unint64_t)a6 sampleCount:;
- (void)printStack:(void *)a3 stream:;
- (void)printTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:;
- (void)printToMutableData:(id)a3;
- (void)printToStream:(__sFILE *)a3;
- (void)setHeaderNote:(id)a3;
- (void)setIncidentUUID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setShareWithAppDevs:(BOOL)a3;
- (void)updateIndexes;
@end

@implementation SASamplePrinter

- (void)printReport
{
  uint64_t v612 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  context = (void *)MEMORY[0x1C18A6A20]();
  if (!*(void *)(a1 + 8))
  {
    int v431 = *__error();
    v432 = _sa_logt();
    if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v602 = 0;
      _os_log_error_impl(&dword_1BF22B000, v432, OS_LOG_TYPE_ERROR, "nil stream", v602, 2u);
    }

    *__error() = v431;
    _SASetCrashLogMessage(1968, "nil stream", v433, v434, v435, v436, v437, v438, v465);
    _os_crash();
    __break(1u);
LABEL_476:
    uint64_t v407 = *__error();
    v439 = _sa_logt();
    if (os_log_type_enabled(v439, OS_LOG_TYPE_ERROR))
    {
      id v440 = [v497 debugDescription];
      uint64_t v441 = [v440 UTF8String];
      *(_DWORD *)v578 = 136315138;
      *(void *)((char *)v1 + 196) = v441;
      _os_log_error_impl(&dword_1BF22B000, v439, OS_LOG_TYPE_ERROR, "%s: No main binary printing multiple tasks", v578, 0xCu);
    }
    *__error() = v407;
    id v406 = [v497 debugDescription];
    char v442 = [v406 UTF8String];
    _SASetCrashLogMessage(5865, "%s: No main binary printing multiple tasks", v443, v444, v445, v446, v447, v448, v442);

    _os_crash();
    __break(1u);
    goto LABEL_479;
  }
  if ([*(id *)(a1 + 160) isEmpty])
  {
    v3 = *(void **)(a1 + 8);
    v4 = @"No samples\n";
LABEL_11:
    [v3 appendString:v4];
    goto LABEL_12;
  }
  if (-[SASamplePrinter checkForBadOptions](a1)) {
    goto LABEL_12;
  }
  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    unint64_t v5 = *(void *)(a1 + 48);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    unint64_t v6 = *(void *)(a1 + 56);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL || v5 > v6) {
      goto LABEL_10;
    }
  }
  else if (!*(void *)(a1 + 64))
  {
LABEL_10:
    v3 = *(void **)(a1 + 8);
    v4 = @"No samples for specified time interval\n";
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 32))
  {
    int v449 = *__error();
    v450 = _sa_logt();
    if (os_log_type_enabled(v450, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v602 = 0;
      _os_log_error_impl(&dword_1BF22B000, v450, OS_LOG_TYPE_ERROR, "nil reportStartTime", v602, 2u);
    }

    *__error() = v449;
    _SASetCrashLogMessage(1990, "nil reportStartTime", v451, v452, v453, v454, v455, v456, v465);
    _os_crash();
    __break(1u);
LABEL_483:
    int v457 = *__error();
    v458 = _sa_logt();
    if (os_log_type_enabled(v458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v602 = 0;
      _os_log_error_impl(&dword_1BF22B000, v458, OS_LOG_TYPE_ERROR, "nil reportEndTime", v602, 2u);
    }

    *__error() = v457;
    _SASetCrashLogMessage(1991, "nil reportEndTime", v459, v460, v461, v462, v463, v464, v465);
    _os_crash();
    __break(1u);
  }
  if (!*(void *)(a1 + 40)) {
    goto LABEL_483;
  }
  [*(id *)(a1 + 160) symbolicate];
  v7 = *(void **)(a1 + 160);
  uint64_t v539 = MEMORY[0x1E4F143A8];
  uint64_t v540 = 3221225472;
  v541 = __29__SASamplePrinter_preprocess__block_invoke;
  v542 = &unk_1E63F7A08;
  uint64_t v538 = a1;
  uint64_t v543 = a1;
  [v7 enumerateTasks:&v539];
  v8 = [*(id *)(a1 + 160) exclaves];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    v10 = -[SASampleStore lastTaskWithPid:](*(void **)(a1 + 160), 0);
    if (v10)
    {
      v11 = -[SASamplePrinter binaryImagesHitByTask:](a1, v10);
      *(void *)v560 = MEMORY[0x1E4F143A8];
      uint64_t v561 = 3221225472;
      uint64_t v562 = (uint64_t)__29__SASamplePrinter_preprocess__block_invoke_2;
      v563 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E63F9358;
      v564 = (void (*)(uint64_t))a1;
      id v12 = v11;
      id v565 = v12;
      -[SATask enumerateFrames:]((uint64_t)v10, v560);
      long long v576 = 0u;
      long long v577 = 0u;
      long long v574 = 0u;
      long long v575 = 0u;
      v13 = [*(id *)(a1 + 160) exclaves];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v574 objects:&v598 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v575;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v575 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v574 + 1) + 8 * i);
            uint64_t v554 = MEMORY[0x1E4F143A8];
            uint64_t v555 = 3221225472;
            uint64_t v556 = (uint64_t)__29__SASamplePrinter_preprocess__block_invoke_3;
            v557 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E63F9358;
            v558 = (void (*)(uint64_t))a1;
            id v559 = v12;
            -[SAExclave enumerateFrames:](v17, &v554);
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v574 objects:&v598 count:16];
        }
        while (v14);
      }

      v18 = -[SASamplePrinter sortedLoadInfosForBinaryImages:](a1, v12);
      -[SASamplePrinter avoidOverlapInBinaryLoadInfos:onlyExclaves:inTask:](a1, v18, 1, v10);
    }
    else
    {
      int v19 = *__error();
      v20 = _sa_logt();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v602 = 0;
        _os_log_fault_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_FAULT, "no kernel task, though there are exclaves", v602, 2u);
      }

      *__error() = v19;
    }
  }
  v21 = [*(id *)(v538 + 160) cpuSignalHandlerStackLeafKernelFrame];
  BOOL v22 = v21 == 0;

  if (v22) {
    [*(id *)(v538 + 160) findCpuSignalHandlerStackLeafKernelFrame];
  }
  [*(id *)(v538 + 160) attemptedSamplingInterval];
  if (v23 != 0.0
    && -[SASamplePrinter hasTimeIndexes](v538)
    && ([*(id *)(v538 + 160) sampleTimestamps],
        v24 = objc_claimAutoreleasedReturnValue(),
        BOOL v25 = (unint64_t)[v24 count] > 1,
        v24,
        v25))
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v27 = *(void **)(v538 + 96);
    *(void *)(v538 + 96) = v26;

    *(void *)(v538 + 88) = 0;
    long long v591 = 0u;
    long long v592 = 0u;
    long long v593 = 0u;
    long long v594 = 0u;
    v28 = [*(id *)(v538 + 160) sampleTimestamps];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v591 objects:v602 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v592;
      double v31 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v592 != v30) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v591 + 1) + 8 * j);
          [v33 machAbsTimeSeconds];
          if (v31 > 0.0)
          {
            double v35 = v34 - v31;
            double v36 = *(double *)(v538 + 88);
            if (v36 > v35 || v36 == 0.0) {
              *(double *)(v538 + 88) = v35;
            }
          }
          [v33 machAbsTimeSeconds];
          double v31 = v37;
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v591 objects:v602 count:16];
      }
      while (v29);
    }

    double v38 = *(double *)(v538 + 88);
    [*(id *)(v538 + 160) attemptedSamplingInterval];
    uint64_t v39 = v538;
    if (v38 < v40)
    {
      [*(id *)(v538 + 160) attemptedSamplingInterval];
      uint64_t v39 = v538;
      *(void *)(v538 + 88) = v41;
    }
    *(void *)&long long v584 = 0;
    *((void *)&v584 + 1) = &v584;
    *(void *)&long long v585 = 0x3032000000;
    *((void *)&v585 + 1) = __Block_byref_object_copy__4;
    *(void *)&long long v586 = __Block_byref_object_dispose__4;
    *((void *)&v586 + 1) = 0;
    v42 = [*(id *)(v39 + 160) sampleTimestamps];
    *(void *)&long long v570 = MEMORY[0x1E4F143A8];
    *((void *)&v570 + 1) = 3221225472;
    *(void *)&long long v571 = __37__SASamplePrinter_calculateTimeJumps__block_invoke;
    *((void *)&v571 + 1) = &unk_1E63F9108;
    *((void *)&v572 + 1) = &v584;
    *(void *)&long long v572 = v39;
    [v42 enumerateObjectsUsingBlock:&v570];

    _Block_object_dispose(&v584, 8);
  }
  else
  {
    v43 = *(void **)(v538 + 96);
    *(void *)(v538 + 96) = 0;
  }
  v44 = *(void **)(v538 + 128);
  location = (id *)(v538 + 128);
  *(void *)(v538 + 128) = 0;

  v45 = *(void **)(v538 + 136);
  *(void *)(v538 + 136) = 0;

  if ([*(id *)(v538 + 160) targetHIDEventMachAbs])
  {
    long long v572 = 0u;
    long long v573 = 0u;
    long long v570 = 0u;
    long long v571 = 0u;
    obuint64_t j = [*(id *)(v538 + 160) hidEvents];
    uint64_t v46 = [obj countByEnumeratingWithState:&v570 objects:v602 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v571;
      while (2)
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v571 != v47) {
            objc_enumerationMutation(obj);
          }
          v49 = *(void **)(*((void *)&v570 + 1) + 8 * k);
          v50 = [v49 hidEventTimestamp];
          uint64_t v51 = [v50 machAbsTime];
          if (v51 == [*(id *)(v538 + 160) targetHIDEventMachAbs])
          {
            if (!*location && ([*(id *)(v538 + 160) targetProcessId] & 0x80000000) != 0)
            {

LABEL_67:
              objc_storeStrong((id *)(v538 + 112), v49);
              uint64_t v56 = *(void *)(v538 + 160);
              if (v56 && (*(unsigned char *)(v56 + 326) & 1) != 0)
              {
                id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v58 = *(void **)(v538 + 120);
                *(void *)(v538 + 120) = v57;

                id v502 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v59 = [v49 hidEventTimestamp];
                unint64_t v60 = [*(id *)(v538 + 160) indexOfLastSampleOnOrBeforeTimestamp:v59];
                long long v596 = 0u;
                long long v597 = 0u;
                memset(v595, 0, sizeof(v595));
                id v507 = [*(id *)(v538 + 112) steps];
                id v513 = (id)[v507 countByEnumeratingWithState:v595 objects:&v591 count:16];
                if (v513)
                {
                  unint64_t v500 = 0;
                  uint64_t v510 = **(void **)&v595[16];
                  do
                  {
                    uint64_t v61 = 0;
                    id v531 = v59;
                    do
                    {
                      if (**(void **)&v595[16] != v510)
                      {
                        uint64_t v62 = v61;
                        objc_enumerationMutation(v507);
                        uint64_t v61 = v62;
                      }
                      uint64_t v519 = v61;
                      v63 = *(void **)(v538 + 160);
                      inited = *(char **)(*(void *)&v595[8] + 8 * v61);
                      v64 = [inited timestamp];
                      unint64_t v522 = [v63 indexOfLastSampleOnOrBeforeTimestamp:v64];

                      if (v522 != 0x7FFFFFFFFFFFFFFFLL && (v60 == 0x7FFFFFFFFFFFFFFFLL || v60 < v522))
                      {
                        v65 = *(void **)(v538 + 160);
                        uint64_t v66 = [inited pid];
                        uint64_t v67 = [inited tid];
                        v68 = [inited timestamp];
                        -[SASampleStore taskWithPid:orTid:atTimestamp:](v65, v66, v67, v68);
                        id v516 = (id)objc_claimAutoreleasedReturnValue();

                        if (v516)
                        {
                          if (v60 == 0x7FFFFFFFFFFFFFFFLL) {
                            unint64_t v69 = 0;
                          }
                          else {
                            unint64_t v69 = v60 + 1;
                          }
                          unint64_t v504 = v69;
                          if ([inited tid])
                          {
                            v70 = [v516 threads];
                            v71 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(inited, "tid"));
                            id v525 = [v70 objectForKeyedSubscript:v71];

                            if (!v525)
                            {
                              int v72 = *__error();
                              v73 = _sa_logt();
                              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                              {
                                uint64_t v106 = [inited tid];
                                v107 = [v516 debugDescription];
                                *(_DWORD *)buf = 134218242;
                                *(void *)&buf[4] = v106;
                                *(_WORD *)&buf[12] = 2112;
                                *(void *)&buf[14] = v107;
                                _os_log_error_impl(&dword_1BF22B000, v73, OS_LOG_TYPE_ERROR, "No thread %llu in %@ for hid event", buf, 0x16u);
                              }
                              id v525 = 0;
                              *__error() = v72;
                            }
                          }
                          else
                          {
                            id v525 = [v516 mainThread];
                            if (!v525)
                            {
                              long long v568 = 0u;
                              long long v569 = 0u;
                              long long v566 = 0u;
                              long long v567 = 0u;
                              v78 = [v516 threads];
                              uint64_t v79 = [v78 countByEnumeratingWithState:&v566 objects:&v584 count:16];
                              if (v79)
                              {
                                id v525 = 0;
                                unint64_t v80 = 0;
                                uint64_t v81 = *(void *)v567;
                                do
                                {
                                  for (uint64_t m = 0; m != v79; ++m)
                                  {
                                    if (*(void *)v567 != v81) {
                                      objc_enumerationMutation(v78);
                                    }
                                    v83 = *(void **)(*((void *)&v566 + 1) + 8 * m);
                                    v84 = [v83 firstThreadStateOnOrAfterTime:v531 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
                                    v85 = [inited timestamp];
                                    v86 = [v83 lastThreadStateOnOrBeforeTime:v85 sampleIndex:0x7FFFFFFFFFFFFFFFLL];

                                    if (v86) {
                                      BOOL v87 = v84 == 0;
                                    }
                                    else {
                                      BOOL v87 = 1;
                                    }
                                    if (!v87)
                                    {
                                      unint64_t v88 = [v86 cpuTimeNs];
                                      if (v88 > [v84 cpuTimeNs])
                                      {
                                        uint64_t v89 = [v86 cpuTimeNs];
                                        if (v80 < v89 - [v84 cpuTimeNs])
                                        {
                                          uint64_t v90 = [v86 cpuTimeNs];
                                          uint64_t v91 = [v84 cpuTimeNs];
                                          id v92 = v83;

                                          unint64_t v80 = v90 - v91;
                                          id v525 = v92;
                                        }
                                      }
                                    }
                                  }
                                  uint64_t v79 = [v78 countByEnumeratingWithState:&v566 objects:&v584 count:16];
                                }
                                while (v79);
                              }
                              else
                              {
                                id v525 = 0;
                              }
                            }
                          }
                          v93 = [SAHIDStepSample alloc];
                          uint64_t v94 = [inited tid];
                          v95 = [inited timestamp];
                          id v96 = v516;
                          id v97 = v531;
                          id v98 = v95;
                          if (v93)
                          {
                            *(void *)buf = v93;
                            *(void *)&buf[8] = SAHIDStepSample;
                            v99 = (SAHIDStepSample *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                            v93 = v99;
                            if (v99)
                            {
                              objc_storeStrong((id *)&v99->_task, v516);
                              v93->_threadId = v94;
                              objc_storeStrong((id *)&v93->_startTimestamp, v531);
                              objc_storeStrong((id *)&v93->_endTimestamp, v95);
                              v93->_startSampleIndex = v504;
                              v93->_endSampleIndex = v522;
                            }
                          }

                          [*(id *)(v538 + 120) addObject:v93];
                          v100 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(inited, "tid"));
                          v101 = [v502 objectForKeyedSubscript:v100];
                          uint64_t v102 = [v101 unsignedLongValue];

                          unint64_t v103 = v522 - v504 + v102 + 1;
                          v104 = [NSNumber numberWithUnsignedInteger:v103];
                          v105 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(inited, "tid"));
                          [v502 setObject:v104 forKeyedSubscript:v105];

                          if (v103 > v500)
                          {
                            objc_storeStrong(location, v516);
                            objc_storeStrong((id *)(v538 + 136), v525);
                            unint64_t v500 = v103;
                          }
                        }
                        else
                        {
                          int v74 = *__error();
                          v75 = _sa_logt();
                          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                          {
                            int v76 = [inited pid];
                            uint64_t v77 = [inited tid];
                            *(_DWORD *)buf = 67109376;
                            *(_DWORD *)&buf[4] = v76;
                            *(_WORD *)&buf[8] = 2048;
                            *(void *)&buf[10] = v77;
                            _os_log_impl(&dword_1BF22B000, v75, OS_LOG_TYPE_INFO, "No process [%d] with thread %llu for hid event", buf, 0x12u);
                          }

                          *__error() = v74;
                        }

                        unint64_t v60 = v522;
                      }
                      v59 = [inited timestamp];

                      uint64_t v61 = v519 + 1;
                      id v531 = v59;
                    }
                    while ((id)(v519 + 1) != v513);
                    id v513 = (id)[v507 countByEnumeratingWithState:v595 objects:&v591 count:16];
                  }
                  while (v513);
                }
              }
              goto LABEL_117;
            }
            v52 = [v49 steps];
            v53 = [v52 lastObject];
            int v54 = [v53 pid];
            BOOL v55 = v54 == [*(id *)(v538 + 160) targetProcessId];

            if (v55) {
              goto LABEL_67;
            }
          }
          else
          {
          }
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v570 objects:v602 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }
LABEL_117:
  }
  v108 = [*(id *)(v538 + 160) timestampOfLastStackshot];
  if (v108
    || -[SASamplePrinter hasTimeIndexes](v538)
    && ([*(id *)(v538 + 160) sampleTimestamps],
        v111 = objc_claimAutoreleasedReturnValue(),
        [v111 lastObject],
        v108 = objc_claimAutoreleasedReturnValue(),
        v111,
        v108))
  {
    uint64_t v109 = +[SADependencyGraphNode dependencyGraphForThreadsInSampleStore:*(void *)(v538 + 160) atTimestamp:v108];
    v110 = *(void **)(v538 + 144);
    *(void *)(v538 + 144) = v109;
  }
  v112 = (id *)v538;
  if ([*(id *)(v538 + 16) printJson]) {
    [*(id *)(v538 + 8) appendString:@"{"];
  }
  if ([*(id *)(v538 + 16) displayHeader]) {
    -[SASamplePrinter printHeader]();
  }
  if (![*(id *)(v538 + 16) displayBody]) {
    goto LABEL_336;
  }
  if (![*(id *)(v538 + 16) systemstatsFormat]) {
    goto LABEL_180;
  }
  [*(id *)(v538 + 8) appendString:@"\nBinary Images:\n"];
  v113 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:512];
  *(void *)&long long v570 = MEMORY[0x1E4F143A8];
  *((void *)&v570 + 1) = 3221225472;
  *(void *)&long long v571 = __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke;
  *((void *)&v571 + 1) = &unk_1E63F9738;
  id v520 = v113;
  *(void *)&long long v572 = v520;
  v114 = (void *)MEMORY[0x1C18A6C80](&v570);
  v115 = *(void **)(v538 + 160);
  *(void *)&long long v574 = MEMORY[0x1E4F143A8];
  *((void *)&v574 + 1) = 3221225472;
  *(void *)&long long v575 = __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_2;
  *((void *)&v575 + 1) = &unk_1E63F9788;
  id v505 = v114;
  *((void *)&v576 + 1) = v505;
  *(void *)&long long v576 = v538;
  [v115 enumerateTasks:&v574];
  v116 = [v520 allKeys];
  v117 = [v116 sortedArrayUsingComparator:&__block_literal_global_1717];

  long long v593 = 0u;
  long long v594 = 0u;
  long long v591 = 0u;
  long long v592 = 0u;
  id v508 = v117;
  v514 = (char *)[v508 countByEnumeratingWithState:&v591 objects:v602 count:16];
  if (!v514) {
    goto LABEL_179;
  }
  v526 = 0;
  uint64_t v511 = *(void *)v592;
  do
  {
    v118 = 0;
    do
    {
      if (*(void *)v592 != v511)
      {
        v119 = v118;
        objc_enumerationMutation(v508);
        v118 = v119;
      }
      v517 = v118;
      v120 = *(void **)(*((void *)&v591 + 1) + 8 * (void)v118);
      v121 = [v520 objectForKeyedSubscript:v120];
      [v121 sortUsingComparator:&__block_literal_global_1720];
      long long v586 = 0u;
      long long v587 = 0u;
      long long v584 = 0u;
      long long v585 = 0u;
      inited = v121;
      id v532 = (id)[inited countByEnumeratingWithState:&v584 objects:&v598 count:16];
      if (v532)
      {
        uint64_t v523 = *(void *)v585;
        do
        {
          for (n = 0; n != v532; n = (char *)n + 1)
          {
            if (*(void *)v585 != v523) {
              objc_enumerationMutation(inited);
            }
            v123 = *(void **)(*((void *)&v584 + 1) + 8 * (void)n);
            v124 = [v123 binary];
            BOOL v125 = v124 == v120;

            if (!v125)
            {
              int v167 = *__error();
              v168 = _sa_logt();
              if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
              {
                id v169 = [v123 debugDescription];
                v112 = (id *)[v169 UTF8String];
                id v170 = [v120 debugDescription];
                uint64_t v171 = [v170 UTF8String];
                *(_DWORD *)v595 = 136315394;
                *(void *)&v595[4] = v112;
                *(_WORD *)&v595[12] = 2080;
                *(void *)&v595[14] = v171;
                _os_log_error_impl(&dword_1BF22B000, v168, OS_LOG_TYPE_ERROR, "load info %s not using binary %s", v595, 0x16u);
              }
              *__error() = v167;
              id v172 = [v123 debugDescription];
              char v173 = [v172 UTF8String];
              id v174 = [v120 debugDescription];
              [v174 UTF8String];
              _SASetCrashLogMessage(7927, "load info %s not using binary %s", v175, v176, v177, v178, v179, v180, v173);

              _os_crash();
              __break(1u);
LABEL_193:
              id v165 = [v112[20] targetProcess];
              v112 = (id *)v538;
              goto LABEL_194;
            }
            v126 = [v123 segment];
            int v127 = [v123 isInKernelAddressSpace];
            v128 = [v126 name];
            id v129 = v120;
            id v130 = v128;
            v131 = *(void **)(v538 + 80);
            if (!v131)
            {
              uint64_t v132 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:512];
              v133 = *(void **)(v538 + 80);
              *(void *)(v538 + 80) = v132;

              v131 = *(void **)(v538 + 80);
            }
            v134 = [v131 objectForKeyedSubscript:v129];
            if (!v134)
            {
              v134 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
              [*(id *)(v538 + 80) setObject:v134 forKeyedSubscript:v129];
            }
            v135 = [NSNumber numberWithLong:(char *)n + (void)v526];
            if (v130)
            {
              [v134 setObject:v135 forKeyedSubscript:v130];
            }
            else
            {
              v136 = [MEMORY[0x1E4F1CA98] null];
              [v134 setObject:v135 forKeyedSubscript:v136];
            }
            objc_msgSend(*(id *)(v538 + 8), "printWithFormat:", @"%lu", (char *)n + (void)v526);
            v137 = *(void **)(v538 + 8);
            if (v127) {
              v138 = "*";
            }
            else {
              v138 = "";
            }
            v139 = [v129 bundleIdentifier];
            if (v139)
            {
              v140 = [v129 bundleIdentifier];
              v141 = SACopySanitizedString(v140, 1, 0);
              [v137 printWithFormat:@"\t%s%@", v138, v141];
            }
            else
            {
              [v137 printWithFormat:@"\t%s%@", v138, &stru_1F1A80538];
            }

            [*(id *)(v538 + 8) appendString:@"\t"];
            v112 = [v129 bundleVersion];
            v142 = [v129 bundleShortVersion];
            uint64_t v143 = [v129 binaryVersion];
            v144 = (void *)v143;
            if (v142 || v112 || v143)
            {
              if (v142)
              {
                v145 = *(void **)(v538 + 8);
                v146 = SACopySanitizedString(v142, 1, 0);
                [v145 appendString:v146];
              }
              if (v112)
              {
                v147 = *(void **)(v538 + 8);
                v148 = SACopySanitizedString(v112, 1, 0);
                [v147 printWithFormat:@" (%@)", v148];
              }
              else
              {
                if (!v144) {
                  goto LABEL_162;
                }
                v149 = *(void **)(v538 + 8);
                v148 = SACopySanitizedString(v144, 1, 0);
                [v149 printWithFormat:@" (%@)", v148];
              }
            }
LABEL_162:
            v150 = *(void **)(v538 + 8);
            v151 = [v129 uuid];
            uint64_t v152 = [v151 UUIDString];
            v153 = (void *)v152;
            v154 = &stru_1F1A80538;
            if (v152) {
              v154 = (__CFString *)v152;
            }
            [v150 printWithFormat:@"\t<%@>", v154];

            if (v126
              && [inited count] == 1
              && [v126 hasOffsetIntoBinary]
              && ![v126 offsetIntoBinary])
            {

              v126 = 0;
            }
            v155 = *(void **)(v538 + 8);
            uint64_t v156 = [v126 name];
            v157 = (void *)v156;
            v158 = &stru_1F1A80538;
            if (v156) {
              v158 = (__CFString *)v156;
            }
            [v155 printWithFormat:@"\t%@", v158];

            [*(id *)(v538 + 8) appendString:@"\t"];
            v159 = [v129 path];
            if (v159)
            {
              if ([*(id *)(v538 + 160) sanitizePaths])
              {
                id v160 = v159;
              }
              v161 = *(void **)(v538 + 8);
              v162 = SACopySanitizedString(v159, 1, 0);
              [v161 appendString:v162];
            }
            [*(id *)(v538 + 8) appendString:@"\n"];
          }
          id v532 = (id)[inited countByEnumeratingWithState:&v584 objects:&v598 count:16];
          v526 = (char *)n + (void)v526;
        }
        while (v532);
      }

      v118 = v517 + 1;
    }
    while (v517 + 1 != v514);
    v514 = (char *)[v508 countByEnumeratingWithState:&v591 objects:v602 count:16];
  }
  while (v514);
LABEL_179:

  v112 = (id *)v538;
LABEL_180:
  if ([v112[2] printJson]) {
    [v112[1] appendString:@",\"tasks\":["];
  }
  v163 = v112[2];
  if (v163)
  {
    uint64_t v164 = v163[21];
    if (v164 != 1 && (v164 || *((unsigned char *)v163 + 11)))
    {
      if (!*location) {
        goto LABEL_193;
      }
      id v165 = *location;
LABEL_194:
      BOOL v181 = [v112[2] taskAggregation] == 3;
      id v182 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v183 = [v112[20] tasksByUniquePid];
      v184 = objc_msgSend(v182, "initWithCapacity:", objc_msgSend(v183, "count"));

      id v185 = v112[20];
      *(void *)&long long v566 = MEMORY[0x1E4F143A8];
      *((void *)&v566 + 1) = 3221225472;
      *(void *)&long long v567 = __44__SASamplePrinter_printTasksWithAggregation__block_invoke;
      *((void *)&v567 + 1) = &unk_1E63F9510;
      id v468 = v165;
      *(void *)&long long v568 = v468;
      *((void *)&v568 + 1) = v538;
      BYTE8(v569) = v181;
      id v467 = v184;
      *(void *)&long long v569 = v467;
      [v185 enumerateTasks:&v566];
      v186 = [v112[2] processSortAttributes];
      v187 = [v467 allValues];
      uint64_t v539 = MEMORY[0x1E4F143A8];
      uint64_t v540 = 3221225472;
      v541 = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_1320;
      v542 = &unk_1E63F9538;
      uint64_t v543 = v538;
      id v466 = v186;
      id v544 = v466;
      id v188 = [v187 sortedArrayUsingComparator:&v539];

      if (v468)
      {
        int v189 = [*(id *)(v538 + 16) printJson];
        if (v189) {
          [*(id *)(v538 + 8) appendString:@"\n\n\n{"];
        }
        unint64_t v190 = [*(id *)(v538 + 160) targetDispatchQueueId];
        uint64_t v191 = [*(id *)(v538 + 160) targetThreadId];
        int v192 = [*(id *)(v538 + 16) printTargetThreadOnly];
        if (v190) {
          int v193 = 0;
        }
        else {
          int v193 = v192;
        }
        if (v193 != 1 || v191)
        {
          if (v190 | v191) {
            goto LABEL_219;
          }
          -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]((id *)v538, v468, 0, 0, 0, 0);
LABEL_225:
          uint64_t v220 = v538;
        }
        else
        {
          v194 = [v468 mainThread];
          uint64_t v191 = [v194 threadId];

          if (!v191)
          {
            int v195 = *__error();
            v196 = _sa_logt();
            if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
            {
              id v197 = [v468 debugDescription];
              uint64_t v198 = [v197 UTF8String];
              *(_DWORD *)v602 = 136315138;
              uint64_t v603 = v198;
              _os_log_error_impl(&dword_1BF22B000, v196, OS_LOG_TYPE_ERROR, "no target dispatch queue nor thread id, target task %s, but no main thread", v602, 0xCu);
            }
            *__error() = v195;
            id v188 = [v468 debugDescription];
            char v199 = [v188 UTF8String];
            _SASetCrashLogMessage(5617, "no target dispatch queue nor thread id, target task %s, but no main thread", v200, v201, v202, v203, v204, v205, v199);

            _os_crash();
            __break(1u);
            goto LABEL_206;
          }
LABEL_219:
          -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]((id *)v538, v468, v190, v191, 0, 1);
          int v219 = [*(id *)(v538 + 16) printTargetThreadOnly];
          uint64_t v220 = v538;
          if (!v219
            || (uint64_t v221 = *(void *)(v538 + 160)) != 0 && (*(unsigned char *)(v221 + 326) & 1) != 0 && *(void *)(v538 + 112))
          {
            -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]((id *)v538, v468, v190, v191, (char *)1, 0);
            goto LABEL_225;
          }
        }
        char v476 = v189 ^ 1;
        if ([*(id *)(v220 + 16) printJson]) {
          [*(id *)(v538 + 8) appendString:@"}"];
        }
      }
      else
      {
LABEL_206:
        char v476 = 1;
      }
      long long v596 = 0u;
      long long v597 = 0u;
      memset(v595, 0, sizeof(v595));
      id v470 = v188;
      uint64_t v477 = [v470 countByEnumeratingWithState:v595 objects:&v591 count:16];
      if (!v477) {
        goto LABEL_333;
      }
      uint64_t v475 = **(void **)&v595[16];
      while (2)
      {
        uint64_t v222 = 0;
        uint64_t v223 = v538;
LABEL_231:
        if (**(void **)&v595[16] != v475)
        {
          uint64_t v224 = v222;
          objc_enumerationMutation(v470);
          uint64_t v223 = v538;
          uint64_t v222 = v224;
        }
        uint64_t v493 = v222;
        v225 = *(void **)(*(void *)&v595[8] + 8 * v222);
        if ([*(id *)(v223 + 16) printJson])
        {
          uint64_t v226 = v538;
          if ((v476 & 1) == 0)
          {
            [*(id *)(v538 + 8) appendString:@","];
            uint64_t v226 = v538;
          }
          [*(id *)(v226 + 8) appendString:@"\n\n\n{"];
          char v476 = 0;
        }
        id v227 = v225;
        v494 = (void *)MEMORY[0x1C18A6A20]();
        id v228 = v227;
        LODWORD(inited) = -[SASamplePrinter hasTimeIndexes](v538);
        *(void *)v560 = 0;
        uint64_t v561 = (uint64_t)v560;
        uint64_t v562 = 0x3032000000;
        v563 = __Block_byref_object_copy__4;
        v564 = __Block_byref_object_dispose__4;
        id v565 = 0;
        uint64_t v554 = 0;
        uint64_t v555 = (uint64_t)&v554;
        uint64_t v556 = 0x3032000000;
        v557 = __Block_byref_object_copy__4;
        v558 = __Block_byref_object_dispose__4;
        id v559 = 0;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v583 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v550 = 0;
        v551 = &v550;
        uint64_t v552 = 0x2020000000;
        uint64_t v553 = 0x7FFFFFFFFFFFFFFFLL;
        v521 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        id v533 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v228, "count"));
        v497 = [v228 firstObject];
        long long v576 = 0u;
        long long v577 = 0u;
        long long v574 = 0u;
        long long v575 = 0u;
        v1 = &v566;
        id v515 = v228;
        uint64_t v229 = [v515 countByEnumeratingWithState:&v574 objects:v602 count:16];
        if (!v229)
        {
          unint64_t v512 = 0;
          v509 = 0;
          unint64_t v506 = 0;
          unint64_t v503 = 0;
          unint64_t v501 = 0;
          SEL v499 = 0;
          unint64_t v518 = 0;
          goto LABEL_284;
        }
        unint64_t v512 = 0;
        v509 = 0;
        unint64_t v506 = 0;
        unint64_t v503 = 0;
        unint64_t v501 = 0;
        SEL v499 = 0;
        v527 = 0;
        uint64_t v524 = 0;
        unint64_t v518 = 0;
        uint64_t v230 = *(void *)v575;
LABEL_239:
        uint64_t v231 = 0;
LABEL_240:
        if (*(void *)v575 != v230) {
          objc_enumerationMutation(v515);
        }
        v232 = *(void **)(*((void *)&v574 + 1) + 8 * v231);
        if ([v232 pid])
        {
          v233 = [v232 sharedCache];
          v234 = v233;
          if (v233)
          {
            id v235 = v233;
          }
          else
          {
            id v235 = [MEMORY[0x1E4F1CA98] null];
          }
          v236 = v235;

          long long v572 = 0u;
          long long v573 = 0u;
          long long v570 = 0u;
          long long v571 = 0u;
          v1 = &v566;
          id v237 = v521;
          uint64_t v238 = [v237 countByEnumeratingWithState:&v570 objects:&v598 count:16];
          if (v238)
          {
            uint64_t v239 = *(void *)v571;
            while (2)
            {
              for (iuint64_t i = 0; ii != v238; ++ii)
              {
                if (*(void *)v571 != v239) {
                  objc_enumerationMutation(v237);
                }
                if (*(void **)(*((void *)&v570 + 1) + 8 * ii) == v236)
                {

                  goto LABEL_256;
                }
              }
              uint64_t v238 = [v237 countByEnumeratingWithState:&v570 objects:&v598 count:16];
              if (v238) {
                continue;
              }
              break;
            }
          }

          [v237 addObject:v236];
LABEL_256:
        }
        if (([*(id *)(v538 + 160) dataSource] != 8
           || [*(id *)(v538 + 160) haveKPerfSched])
          && [*(id *)(v538 + 160) dataStyle] != 1
          && [*(id *)(v538 + 160) dataStyle])
        {
          *(void *)v578 = 0;
          uint64_t v549 = 0;
          uint64_t v548 = 0;
          uint64_t v547 = 0;
          uint64_t v546 = 0;
          uint64_t v545 = 0;
          -[SATask cpuTimeNs:cpuInstructions:cpuCycles:nonThreadCpuTimeNs:nonThreadCpuInstructions:nonThreadCpuCycles:betweenStartTime:endTime:](v232, v578, &v549, &v548, &v547, &v546, &v545, *(void **)(v538 + 32), *(void **)(v538 + 40));
          v499 += *(void *)v578;
          v501 += v549;
          v503 += v548;
          v506 += v547;
          v509 += v546;
          v512 += v545;
        }
        *(void *)v578 = 0;
        v579 = v578;
        uint64_t v580 = 0x2020000000;
        uint64_t v581 = 0;
        v241 = [v232 taskStates];
        BOOL v242 = [v241 count] == 0;

        if (!v242)
        {
          unint64_t v243 = [v232 indexOfFirstTaskStateOnOrAfterTime:*(void *)(v538 + 32) sampleIndex:*(void *)(v538 + 48)];
          if (v243 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v244 = [v232 indexOfLastTaskStateOnOrBeforeTime:*(void *)(v538 + 40) sampleIndex:*(void *)(v538 + 56)];
            unint64_t v245 = v244;
            if (v244 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v246 = v244 - v243;
              if (v244 >= v243)
              {
                v247 = [v232 taskStates];
                v248 = [v247 objectAtIndexedSubscript:v243];

                if (!*(void *)(v561 + 40)
                  || ([v248 startTimestamp],
                      v249 = objc_claimAutoreleasedReturnValue(),
                      int v250 = [v249 lt:*(void *)(v561 + 40)],
                      v249,
                      v250))
                {
                  uint64_t v251 = [v248 startTimestamp];
                  v252 = *(void **)(v561 + 40);
                  *(void *)(v561 + 40) = v251;

                  if (inited)
                  {
                    uint64_t v253 = [v248 startSampleIndex];
                    *(void *)(*(void *)&buf[8] + 24) = v253;
                    if (v253 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v254 = [v248 endSampleIndex] + 1;
                      *(void *)(*(void *)&buf[8] + 24) = v254;
                    }
                  }
                }
                v255 = [v232 taskStates];
                v256 = [v255 objectAtIndexedSubscript:v245];

                if (!*(void *)(v555 + 40)
                  || ([v256 endTimestamp],
                      v257 = objc_claimAutoreleasedReturnValue(),
                      int v258 = [v257 gt:*(void *)(v555 + 40)],
                      v257,
                      v258))
                {
                  uint64_t v259 = [v256 endTimestamp];
                  v260 = *(void **)(v555 + 40);
                  *(void *)(v555 + 40) = v259;

                  if (inited)
                  {
                    uint64_t v261 = [v256 endSampleIndex];
                    v551[3] = v261;
                  }
                }
                *((void *)v579 + 3) += v246 + 1;

LABEL_277:
                if ((inited & 1) == 0) {
                  v518 += *((void *)v579 + 3);
                }
                v263 = -[SASamplePrinter displayStringForResourceCoalition:](v232);
                v264 = [v533 objectForKeyedSubscript:v263];
                v265 = NSNumber;
                uint64_t v266 = [v264 unsignedLongLongValue];
                v267 = [v265 numberWithUnsignedLongLong:*((void *)v579 + 3) + v266];
                [v533 setObject:v267 forKeyedSubscript:v263];

                uint64_t v268 = -[SASamplePrinter numIOsForTask:ioSize:](v538, v232, &v549);
                v527 += v268;
                v524 += v268;
              }
            }
          }
          _Block_object_dispose(v578, 8);
          if (++v231 == v229)
          {
            uint64_t v229 = [v515 countByEnumeratingWithState:&v574 objects:v602 count:16];
            if (!v229)
            {
LABEL_284:

              if (inited)
              {
                unint64_t v269 = *(void *)(*(void *)&buf[8] + 24);
                uint64_t v270 = v538;
                if (v269 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  unint64_t v271 = v551[3];
                  if (v271 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (v271 >= *(void *)(v538 + 56)) {
                      unint64_t v271 = *(void *)(v538 + 56);
                    }
                    if (v269 <= *(void *)(v538 + 48)) {
                      unint64_t v269 = *(void *)(v538 + 48);
                    }
                    unint64_t v518 = v271 - v269 + 1;
                  }
                }
              }
              else
              {
                uint64_t v270 = v538;
              }
              if (!v518 && ![*(id *)(v270 + 16) displayTasksWithZeroCount]) {
                goto LABEL_303;
              }
              if ([*(id *)(v270 + 16) omitTasksBelowSampleCount] < 1) {
                unint64_t v272 = 0;
              }
              else {
                unint64_t v272 = [*(id *)(v270 + 16) omitTasksBelowSampleCount];
              }
              if ((int)[*(id *)(v270 + 16) omitTasksBelowPercentOfTotalSamples] >= 1)
              {
                uint64_t v273 = *(void *)(v270 + 64);
                int v274 = [*(id *)(v270 + 16) omitTasksBelowPercentOfTotalSamples];
                if (v272 <= v273 * v274 / 0x64uLL) {
                  unint64_t v272 = v273 * v274 / 0x64uLL;
                }
              }
              if (v272 && v518 <= v272)
              {
LABEL_303:
                unint64_t v518 = -1;
                goto LABEL_320;
              }
              uint64_t v275 = [v497 mainBinary];
              if (!v275) {
                goto LABEL_476;
              }
              id v276 = *location;
              v277 = *location;
              if (!*location)
              {
                v277 = [*(id *)(v270 + 160) targetProcess];
              }
              v278 = [v277 mainBinary];

              if (!v276) {
              if (v278 == (void *)v275)
              }
              {
                id v280 = [NSString alloc];
                v281 = -[SASamplePrinter displayNameForTask:includePid:]((void *)v538, v497, 0);
                v492 = (void *)[v280 initWithFormat:@"%@ (other tasks)", v281];

                uint64_t v279 = v538;
              }
              else
              {
                uint64_t v279 = v538;
                v492 = -[SASamplePrinter displayNameForTask:includePid:]((void *)v538, v497, 0);
              }
              inited = (char *)v275;
              v491 = -[SASamplePrinter architectureStringForTask:](v279, v497);
              if (([*(id *)(v279 + 16) printJson] & 1) == 0) {
                [*(id *)(v279 + 8) appendString:@"\n\n"];
              }
              v487 = -[SASamplePrinter displayStringForOnBehalfOfForTasks:includePid:](v279, v515);
              v473 = *(void **)(v538 + 8);
              v490 = [v497 mainBinaryPath];
              v484 = [v497 bundleIdentifier];
              v489 = [v497 bundleVersion];
              v486 = [v497 bundleShortVersion];
              v483 = [v497 bundleBuildVersion];
              v488 = [v497 bundleProjectName];
              v485 = [v497 bundleSourceVersion];
              v482 = [v497 bundleProductBuildVersion];
              uint64_t v472 = [v497 adamID];
              v481 = [v497 installerVersionID];
              char v471 = [v497 developerType];
              v480 = [v497 appType];
              unsigned __int8 v282 = [v497 isBeta];
              v478 = [v497 cohortID];
              v479 = [v497 vendorID];
              v283 = [v497 distributorID];
              v284 = [v497 codesigningID];
              v285 = [v497 teamID];
              int v286 = [v497 pid];
              if (v286)
              {
                v474 = 0;
              }
              else
              {
                v469 = [*(id *)(v538 + 160) kernelVersion];
                v474 = SACopySanitizedString(v469, 1, 0);
              }
              -[SASamplePrinter addTaskHeaderToStream:displayName:pid:mainBinary:mainBinaryPath:sharedCaches:uid:bundleIdentifier:bundleVersion:bundleShortVersion:bundleBuildVersion:bundleProjectName:bundleSourceVersion:bundleProductBuildVersion:adamID:installerVersionID:developerType:appType:isBeta:cohortID:vendorID:distributorID:codesigningID:teamID:resourceCoalitionSampleCounts:onBehalfOfProcesses:architectureString:kernelVersion:parentName:responsibleName:taskExecedFromName:taskExecedToName:pidStartTimestamp:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:numSamples:totalNumSamples:numSamplesSuspended:numSamplesTerminated:startingTaskSize:endingTaskSize:maxTaskSize:startSampleIndexOfMaxTaskSize:endSampleIndexOfMaxTaskSize:numPageins:cpuTimeNs:cpuInstructions:cpuCycles:nonThreadCpuTimeNs:nonThreadCpuInstructions:nonThreadCpuCycles:usesSuddenTermination:allowsIdleExit:isTranslocated:isUnresponsive:timeOfLastResponse:numThreads:numIdleWorkQueueThreads:numOtherHiddenThreads:hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:](v538, v473, v492, 0xFFFFFFFFLL, inited, v490, v521, 4294966982, 0.0, v484, v489, v486, v483, v488, v485, v482, v472, v481, v471,
                v480,
                v282,
                v478,
                v479,
                v283,
                v284,
                v285,
                v533,
                v487,
                v491,
                v474,
                0,
                0,
                0,
                0,
                0,
                *(void **)(v561 + 40),
                *(void **)(v555 + 40),
                *(void *)(*(void *)&buf[8] + 24),
                v551[3],
                v518,
                *(void *)(v538 + 64),
                0,
                0,
                0,
                0,
                0,
                0x7FFFFFFFFFFFFFFFuLL,
                0x7FFFFFFFFFFFFFFFuLL,
                0,
                (unint64_t)v499,
                v501,
                v503,
                v506,
                (unint64_t)v509,
                v512,
                0,
                0,
                [v497 isTranslocated],
                0,
                0,
                0,
                0,
                0);
              if (!v286)
              {
              }
LABEL_320:

              _Block_object_dispose(&v550, 8);
              _Block_object_dispose(buf, 8);
              _Block_object_dispose(&v554, 8);

              _Block_object_dispose(v560, 8);
              if ((v518 & 0x8000000000000000) == 0)
              {
                uint64_t v287 = *(void *)(v538 + 16);
                if (v287)
                {
                  uint64_t v288 = *(void *)(v287 + 152);
                  if (v288 == 3 || !v288 && *(unsigned char *)(v287 + 11))
                  {
                    if (v518)
                    {
                      -[SASamplePrinter printSingleStackForTasks:limitToDispatchQueueIds:limitToThreadIds:intersection:sampleCount:](v538, v515, 0, 0, 0, v518);
                      uint64_t v287 = *(void *)(v538 + 16);
                    }
                    if (([(id)v287 systemstatsFormat] & 1) == 0)
                    {
                      v289 = [v515 firstObject];
                      -[SASamplePrinter printBinaryImagesForTask:](v538, v289);
                    }
                  }
                }
              }

              if ([*(id *)(v538 + 16) printJson]) {
                [*(id *)(v538 + 8) appendString:@"}"];
              }
              uint64_t v222 = v493 + 1;
              uint64_t v223 = v538;
              if (v493 + 1 == v477)
              {
                uint64_t v477 = [v470 countByEnumeratingWithState:v595 objects:&v591 count:16];
                if (!v477)
                {
LABEL_333:

                  goto LABEL_334;
                }
                continue;
              }
              goto LABEL_231;
            }
            goto LABEL_239;
          }
          goto LABEL_240;
        }
        break;
      }
      v262 = [v232 threads];
      *(void *)&long long v584 = MEMORY[0x1E4F143A8];
      *((void *)&v584 + 1) = 3221225472;
      *(void *)&long long v585 = __51__SASamplePrinter_printTaskHeaderForMultipleTasks___block_invoke;
      *((void *)&v585 + 1) = &unk_1E63F9560;
      *(void *)&long long v586 = v538;
      *((void *)&v586 + 1) = v560;
      char v590 = (char)inited;
      *(void *)&long long v587 = buf;
      *((void *)&v587 + 1) = &v554;
      v588 = &v550;
      v589 = v578;
      [v262 enumerateKeysAndObjectsUsingBlock:&v584];

      goto LABEL_277;
    }
  }
  if (*location)
  {
    id v166 = *location;
  }
  else
  {
    id v166 = [v112[20] targetProcess];
    v112 = (id *)v538;
  }
  v206 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v207 = v112[20];
  *(void *)&long long v591 = MEMORY[0x1E4F143A8];
  *((void *)&v591 + 1) = 3221225472;
  *(void *)&long long v592 = __41__SASamplePrinter_printTasksIndividually__block_invoke;
  *((void *)&v592 + 1) = &unk_1E63F9220;
  id v208 = v166;
  *(void *)&long long v593 = v208;
  *((void *)&v593 + 1) = v112;
  id v209 = v206;
  *(void *)&long long v594 = v209;
  [v207 enumerateTasks:&v591];
  v210 = [*(id *)(v538 + 16) processSortAttributes];
  *(void *)&long long v574 = MEMORY[0x1E4F143A8];
  *((void *)&v574 + 1) = 3221225472;
  *(void *)&long long v575 = __41__SASamplePrinter_printTasksIndividually__block_invoke_2;
  *((void *)&v575 + 1) = &unk_1E63F94C0;
  *(void *)&long long v576 = v538;
  id v211 = v210;
  *((void *)&v576 + 1) = v211;
  [v209 sortUsingComparator:&v574];
  *(void *)&long long v570 = 0;
  *((void *)&v570 + 1) = &v570;
  *(void *)&long long v571 = 0x2020000000;
  BYTE8(v571) = 1;
  *(void *)&long long v584 = MEMORY[0x1E4F143A8];
  *((void *)&v584 + 1) = 3221225472;
  *(void *)&long long v585 = __41__SASamplePrinter_printTasksIndividually__block_invoke_1313;
  *((void *)&v585 + 1) = &unk_1E63F94E8;
  *(void *)&long long v586 = v538;
  *(void *)&long long v587 = &v570;
  id v212 = v208;
  *((void *)&v586 + 1) = v212;
  uint64_t v213 = MEMORY[0x1C18A6C80](&v584);
  v214 = (void (**)(void, void))v213;
  if (v212) {
    (*(void (**)(uint64_t, id))(v213 + 16))(v213, v212);
  }
  long long v600 = 0u;
  long long v601 = 0u;
  long long v598 = 0u;
  long long v599 = 0u;
  id v215 = v209;
  uint64_t v216 = [v215 countByEnumeratingWithState:&v598 objects:v602 count:16];
  if (v216)
  {
    uint64_t v217 = *(void *)v599;
    do
    {
      for (juint64_t j = 0; jj != v216; ++jj)
      {
        if (*(void *)v599 != v217) {
          objc_enumerationMutation(v215);
        }
        v214[2](v214, *(void *)(*((void *)&v598 + 1) + 8 * jj));
      }
      uint64_t v216 = [v215 countByEnumeratingWithState:&v598 objects:v602 count:16];
    }
    while (v216);
  }

  _Block_object_dispose(&v570, 8);
LABEL_334:
  v112 = (id *)v538;
  if ([*(id *)(v538 + 16) printJson]) {
    [*(id *)(v538 + 8) appendString:@"]"];
  }
LABEL_336:
  if (![v112[2] displayFooter]) {
    goto LABEL_457;
  }
  if ([v112[2] printJson])
  {
    [v112[1] appendString:@",\n\n\"sharedcaches\":["];
    long long v598 = 0u;
    long long v599 = 0u;
    long long v600 = 0u;
    long long v601 = 0u;
    v290 = [v112[20] sharedCaches];
    uint64_t v291 = [v290 countByEnumeratingWithState:&v598 objects:v602 count:16];
    if (v291)
    {
      char v292 = 1;
      uint64_t v293 = *(void *)v599;
      do
      {
        for (kuint64_t k = 0; kk != v291; ++kk)
        {
          if (*(void *)v599 != v293) {
            objc_enumerationMutation(v290);
          }
          v295 = *(void **)(*((void *)&v598 + 1) + 8 * kk);
          v296 = [MEMORY[0x1E4F1CA98] null];
          if (v295 == v296)
          {
          }
          else
          {
            v297 = [v295 binaryLoadInfos];
            BOOL v298 = [v297 count] == 0;

            if (!v298)
            {
              if ((v292 & 1) == 0) {
                [*(id *)(v538 + 8) appendString:@",\n\n"];
              }
              [*(id *)(v538 + 8) appendString:@"{"];
              v299 = *(void **)(v538 + 8);
              v300 = [v295 uuid];
              v301 = [v300 UUIDString];
              SAJSONWriteDictionaryFirstEntry(v299, @"uuid", v301);

              v302 = *(void **)(v538 + 8);
              v303 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v295, "slide"));
              SAJSONWriteDictionaryEntry(v302, @"slide", v303);

              v304 = *(void **)(v538 + 8);
              v305 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v295, "slidBaseAddress"));
              SAJSONWriteDictionaryEntry(v304, @"slidBaseAddress", v305);

              v306 = *(void **)(v538 + 8);
              v307 = [v295 binaryLoadInfos];
              SAJSONWriteDictionaryEntry(v306, @"binaryLoadInfos", v307);

              [*(id *)(v538 + 8) appendString:@"}"];
              char v292 = 0;
            }
          }
        }
        uint64_t v291 = [v290 countByEnumeratingWithState:&v598 objects:v602 count:16];
      }
      while (v291);
    }

    [*(id *)(v538 + 8) appendString:@"]\n\n"];
LABEL_456:
    v112 = (id *)v538;
    goto LABEL_457;
  }
  v308 = [v112[20] kextStat];

  if (v308)
  {
    v309 = *(void **)(v538 + 8);
    v310 = [*(id *)(v538 + 160) kextStat];
    [v309 printWithFormat:@"\n\nKextstat:\n%@", v310];
  }
  uint64_t v311 = v538;
  if ([*(id *)(v538 + 16) displayAllBinaries])
  {
    long long v572 = 0u;
    long long v573 = 0u;
    long long v570 = 0u;
    long long v571 = 0u;
    v312 = [*(id *)(v538 + 160) sharedCaches];
    uint64_t v313 = [v312 countByEnumeratingWithState:&v570 objects:&v598 count:16];
    if (!v313) {
      goto LABEL_366;
    }
    uint64_t v314 = *(void *)v571;
    while (1)
    {
      for (muint64_t m = 0; mm != v313; ++mm)
      {
        if (*(void *)v571 != v314) {
          objc_enumerationMutation(v312);
        }
        v316 = *(void **)(*((void *)&v570 + 1) + 8 * mm);
        v317 = [MEMORY[0x1E4F1CA98] null];
        if (v316 != v317)
        {
          v318 = [v316 binaryLoadInfos];
          BOOL v319 = [v318 count] == 0;

          if (v319) {
            continue;
          }
          v320 = *(void **)(v538 + 8);
          v321 = _shared_cache_display_string(v316);
          [v320 printWithFormat:@"\n\nShared Cache %@:\n", v321];

          v316 = [v316 binaryLoadInfos];
          -[SASamplePrinter printLoadInfos:]((id *)v538, v316);
        }
      }
      uint64_t v313 = [v312 countByEnumeratingWithState:&v570 objects:&v598 count:16];
      if (!v313)
      {
LABEL_366:

        uint64_t v311 = v538;
        break;
      }
    }
  }
  if ([*(id *)(v311 + 16) displayTrialInformation])
  {
    v322 = [*(id *)(v538 + 160) activeTrials];
    BOOL v323 = v322 == 0;

    if (!v323)
    {
      int v324 = [*(id *)(v538 + 16) printJson];
      v325 = *(void **)(v538 + 8);
      if (v324)
      {
        id v528 = [*(id *)(v538 + 160) activeTrials];
        SAJSONWriteDictionaryEntry(v325, @"activeTrials", v528);
      }
      else
      {
        [*(id *)(v538 + 8) appendString:@"\n\n"];
        long long v596 = 0u;
        long long v597 = 0u;
        memset(v595, 0, sizeof(v595));
        v326 = [*(id *)(v538 + 160) activeTrials];
        id v529 = [v326 objectForKeyedSubscript:0x1F1A82E58];

        uint64_t v327 = [v529 countByEnumeratingWithState:v595 objects:&v591 count:16];
        if (v327)
        {
          id v535 = **(id **)&v595[16];
          do
          {
            for (uint64_t nn = 0; nn != v327; ++nn)
            {
              if (**(id **)&v595[16] != v535) {
                objc_enumerationMutation(v529);
              }
              v329 = *(void **)(*(void *)&v595[8] + 8 * nn);
              uint64_t v330 = objc_opt_class();
              uint64_t v331 = objc_opt_class();
              v332 = DictGetDictOfClasses(v329, @"namespace_ids", v330, v331);
              v333 = [v332 allKeys];
              v334 = [v333 sortedArrayUsingSelector:sel_compare_];
              v335 = [v334 componentsJoinedByString:@","];

              v336 = DictGetString(v329, @"experiment_id");
              v337 = DictGetString(v329, @"treatment_id");
              v338 = @"unknown";
              if (v335) {
                v338 = v335;
              }
              [*(id *)(v538 + 8) printWithFormat:@"%-*s%@ (treatment:%@ namespaces:%@)\n", 18, "Trial Experiment: ", v336, v337, v338];
            }
            uint64_t v327 = [v529 countByEnumeratingWithState:v595 objects:&v591 count:16];
          }
          while (v327);
        }

        long long v568 = 0u;
        long long v569 = 0u;
        long long v566 = 0u;
        long long v567 = 0u;
        v339 = [*(id *)(v538 + 160) activeTrials];
        id v530 = [v339 objectForKeyedSubscript:0x1F1A82E78];

        uint64_t v340 = [v530 countByEnumeratingWithState:&v566 objects:&v584 count:16];
        if (v340)
        {
          id v536 = *(id *)v567;
          do
          {
            for (uint64_t i1 = 0; i1 != v340; ++i1)
            {
              if (*(id *)v567 != v536) {
                objc_enumerationMutation(v530);
              }
              v342 = *(void **)(*((void *)&v566 + 1) + 8 * i1);
              uint64_t v343 = objc_opt_class();
              uint64_t v344 = objc_opt_class();
              v345 = DictGetDictOfClasses(v342, @"factor_pack_ids", v343, v344);
              v346 = [v345 allKeys];
              v347 = [v346 sortedArrayUsingSelector:sel_compare_];
              v348 = [v347 componentsJoinedByString:@","];

              v349 = DictGetString(v342, @"rollout_id");
              DictGetString(v342, @"ramp_id");
              v350 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v351 = @"none";
              if (v350) {
                v351 = v350;
              }
              [*(id *)(v538 + 8) printWithFormat:@"%-*s%@ (ramp:%@ namespaces:%@)\n", 18, "Trial Rollout: ", v349, v351, v348];
            }
            uint64_t v340 = [v530 countByEnumeratingWithState:&v566 objects:&v584 count:16];
          }
          while (v340);
        }
      }
    }
  }
  v352 = *(unsigned char **)(v538 + 160);
  if (v352)
  {
    if (v352[326])
    {
      char v353 = [*(id *)(v538 + 16) hidEventDisplayOptions];
      v352 = *(unsigned char **)(v538 + 160);
      if ((v353 & 0x18) != 0)
      {
        long long v576 = 0u;
        long long v577 = 0u;
        long long v574 = 0u;
        long long v575 = 0u;
        v354 = [v352 hidEvents];
        uint64_t v355 = [v354 countByEnumeratingWithState:&v574 objects:v602 count:16];
        if (v355)
        {
          uint64_t v356 = *(void *)v575;
          char v357 = 1;
          do
          {
            for (uint64_t i2 = 0; i2 != v355; ++i2)
            {
              if (*(void *)v575 != v356) {
                objc_enumerationMutation(v354);
              }
              v359 = *(void **)(*((void *)&v574 + 1) + 8 * i2);
              if (([*(id *)(v538 + 16) hidEventDisplayOptions] & 0x10) != 0) {
                goto LABEL_488;
              }
              if (([*(id *)(v538 + 16) hidEventDisplayOptions] & 4) != 0)
              {
                if ([*(id *)(v538 + 160) targetHIDEventMachAbs])
                {
                  v360 = [v359 hidEventTimestamp];
                  uint64_t v361 = [v360 machAbsTime];
                  LOBYTE(v361) = v361 == [*(id *)(v538 + 160) targetHIDEventMachAbs];

                  if (v361) {
                    continue;
                  }
                }
              }
              v363 = [v359 steps];
              v364 = [v363 lastObject];
              v365 = [v364 timestamp];
              [v365 machAbsTimeSeconds];
              double v367 = v366;
              v368 = [v359 hidEventTimestamp];
              [v368 machAbsTimeSeconds];
              double v370 = v369;

              double v362 = v367 - v370;
              if (v367 - v370 >= 0.2)
              {
LABEL_488:
                v371 = [v359 steps];
                v372 = [v371 lastObject];
                v373 = [v372 timestamp];
                char v374 = [v373 lt:*(void *)(v538 + 32)];

                if ((v374 & 1) == 0)
                {
                  v375 = [v359 steps];
                  v376 = [v375 firstObject];
                  v377 = [v376 timestamp];
                  char v378 = [v377 gt:*(void *)(v538 + 40)];

                  if ((v378 & 1) == 0)
                  {
                    v379 = @"\n";
                    if (v357)
                    {
                      char v380 = objc_msgSend(*(id *)(v538 + 16), "hidEventDisplayOptions", @"\n");
                      v379 = @"\n\nAll HID events:\n";
                      if ((v380 & 0x10) == 0)
                      {
                        if ((objc_msgSend(*(id *)(v538 + 16), "hidEventDisplayOptions", @"\n\nAll HID events:\n") & 4) == 0
                          || (uint64_t v381 = [*(id *)(v538 + 160) targetHIDEventMachAbs],
                              v379 = @"\n\nOther slow HID events:\n",
                              !v381))
                        {
                          v379 = @"\n\nSlow HID events:\n";
                        }
                      }
                    }
                    [*(id *)(v538 + 8) appendString:v379];
                    -[SASamplePrinter printHIDEvent:](v538, v359);
                    char v357 = 0;
                  }
                }
              }
            }
            uint64_t v355 = objc_msgSend(v354, "countByEnumeratingWithState:objects:count:", &v574, v602, 16, v362);
          }
          while (v355);
        }

        v352 = *(unsigned char **)(v538 + 160);
      }
    }
  }
  v382 = [v352 ioEvents];
  BOOL v383 = [v382 count] == 0;

  if (v383) {
    goto LABEL_449;
  }
  inited = init_io_histograms();
  long long v574 = 0u;
  long long v575 = 0u;
  long long v576 = 0u;
  long long v577 = 0u;
  v384 = [*(id *)(v538 + 160) ioEvents];
  uint64_t v385 = [v384 countByEnumeratingWithState:&v574 objects:v602 count:16];
  if (!v385)
  {

    goto LABEL_448;
  }
  char v386 = 0;
  uint64_t v387 = *(void *)v575;
  while (2)
  {
    for (uint64_t i3 = 0; i3 != v385; ++i3)
    {
      if (*(void *)v575 != v387) {
        objc_enumerationMutation(v384);
      }
      v389 = *(void **)(*((void *)&v574 + 1) + 8 * i3);
      v390 = [v389 endTimestamp];
      if (([*(id *)(v538 + 32) gt:v390] & 1) == 0)
      {
        if ([*(id *)(v538 + 40) lt:v390])
        {

          goto LABEL_438;
        }
        v391 = [v389 startTimestamp];
        [v390 machContTimeSeconds];
        if (v392 == 0.0 || ([v391 machContTimeSeconds], v393 == 0.0))
        {
          [v390 machAbsTimeSeconds];
          if (v397 == 0.0 || ([v391 machAbsTimeSeconds], v398 == 0.0))
          {
            [v390 wallTime];
            if (v400 == 0.0 || ([v391 wallTime], v401 == 0.0))
            {
              unint64_t v403 = 0;
              goto LABEL_433;
            }
            [v390 wallTime];
            double v395 = v402;
            [v391 wallTime];
          }
          else
          {
            [v390 machAbsTimeSeconds];
            double v395 = v399;
            [v391 machAbsTimeSeconds];
          }
        }
        else
        {
          [v390 machContTimeSeconds];
          double v395 = v394;
          [v391 machContTimeSeconds];
        }
        unint64_t v403 = (unint64_t)((v395 - v396) * 1000000.0);
LABEL_433:
        update_histograms_stats((unsigned int *)inited, [v389 tier], objc_msgSend(v389, "size"), v403, objc_msgSend(v389, "isRead"));

        char v386 = 1;
      }
    }
    uint64_t v385 = [v384 countByEnumeratingWithState:&v574 objects:v602 count:16];
    if (v385) {
      continue;
    }
    break;
  }

LABEL_438:
  if (v386)
  {
    v404 = malloc_type_calloc(1uLL, 0x2000uLL, 0x97E514A2uLL);
    if (print_io_histograms((unsigned int *)inited, (char *)v404, (const char *)0x2000))
    {
      LODWORD(v405) = 0x2000;
      while (1)
      {
        free(v404);
        size_t v405 = (2 * v405);
        if (v405 > 0x20000) {
          break;
        }
        v404 = malloc_type_calloc(1uLL, v405, 0x18AE080AuLL);
        if (!print_io_histograms((unsigned int *)inited, (char *)v404, (const char *)v405)) {
          goto LABEL_443;
        }
      }
      LODWORD(v406) = *__error();
      uint64_t v407 = _sa_logt();
      if (!os_log_type_enabled((os_log_t)v407, OS_LOG_TYPE_FAULT))
      {
LABEL_447:

        *__error() = (int)v406;
        goto LABEL_448;
      }
LABEL_479:
      *(_WORD *)v560 = 0;
      _os_log_fault_impl(&dword_1BF22B000, (os_log_t)v407, OS_LOG_TYPE_FAULT, "io histograms don't fit in 128KB", v560, 2u);
      goto LABEL_447;
    }
LABEL_443:
    if (v404)
    {
      objc_msgSend(*(id *)(v538 + 8), "printWithFormat:", @"\n\n%s\n", v404);
      free(v404);
    }
  }
LABEL_448:
  free(inited);
LABEL_449:
  v112 = (id *)v538;
  if (-[SASamplePrinter hasTimeIndexes](v538))
  {
    v408 = *(uint64_t **)(v538 + 160);
    unint64_t v409 = *(void *)(v538 + 48);
    uint64_t v410 = *(void *)(v538 + 56);
    if (-[SASamplePrinter hasTimeIndexes](v538))
    {
      int v411 = [*(id *)(v538 + 16) forceOneBasedTimeIndexes];
      uint64_t v412 = v409 + 1;
      v112 = (id *)v538;
      if (v411) {
        v412 -= *(void *)(v538 + 48);
      }
    }
    else
    {
      uint64_t v412 = 0x7FFFFFFFFFFFFFFFLL;
      v112 = (id *)v538;
    }
    if (v408)
    {
      -[SAWSUpdateDataStore printFrameRateReportWithStartSampleIndex:endSampleIndex:startDisplayIndex:sampleDataStore:toStream:](v408[16], v409, v410, v412, v408, v112[1]);
      goto LABEL_456;
    }
  }
LABEL_457:
  v413 = [v112[20] customOutput];

  uint64_t v414 = v538;
  if (v413)
  {
    int v415 = [*(id *)(v538 + 16) printJson];
    v416 = *(void **)(v538 + 8);
    if (v415)
    {
      v417 = [*(id *)(v538 + 160) customOutput];
      SAJSONWriteDictionaryEntry(v416, @"customOutput", v417);
    }
    else
    {
      [*(id *)(v538 + 8) printWithFormat:@"\n\nCustom Output:\n"];
      v418 = *(void **)(v538 + 8);
      v417 = [*(id *)(v538 + 160) customOutput];
      [v418 appendString:v417];
    }

    uint64_t v414 = v538;
  }
  if ([*(id *)(v414 + 16) printJson]) {
    [*(id *)(v414 + 8) appendString:@"}"];
  }
  if (*(unsigned char *)(v414 + 104) && !*(unsigned char *)(v414 + 105))
  {
    int v419 = *__error();
    v420 = _sa_logt();
    if (os_log_type_enabled(v420, OS_LOG_TYPE_FAULT))
    {
      id v537 = [*(id *)(v538 + 16) debugDescription];
      int v423 = [*(id *)(v538 + 160) targetProcessId];
      v424 = [*(id *)(v538 + 160) targetProcess];
      v425 = [v424 debugDescription];
      uint64_t v426 = [*(id *)(v538 + 160) targetThreadId];
      v427 = [*(id *)(v538 + 160) targetProcess];
      v428 = [v427 threads];
      v429 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v538 + 160), "targetThreadId"));
      v430 = [v428 objectForKeyedSubscript:v429];
      *(_DWORD *)v602 = 138544386;
      uint64_t v603 = (uint64_t)v537;
      __int16 v604 = 1024;
      int v605 = v423;
      __int16 v606 = 2114;
      v607 = v425;
      __int16 v608 = 2048;
      uint64_t v609 = v426;
      __int16 v610 = 2114;
      v611 = v430;
      _os_log_fault_impl(&dword_1BF22B000, v420, OS_LOG_TYPE_FAULT, "Hit 65324447!\noptions: %{public}@\ntargetTask %d: %{public}@\ntargetThread 0x%llx: %{public}@", v602, 0x30u);
    }
    *__error() = v419;
  }
  v421 = +[SABinaryLocator sharedBinaryLocator];
  v422 = v421;
  if (v421)
  {
    if (v421[25]) {
      -[SABinaryLocator _saveMappings](v421);
    }
  }
  [v422 done];

LABEL_12:
}

- (void)printHeader
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v1379 = *MEMORY[0x1E4F143B8];
  uint64_t v1254 = v0;
  int v1192 = [*(id *)(v0 + 16) printJson];
  if (v1192)
  {
    v1 = *(void **)(v0 + 8);
    v2 = [NSNumber numberWithUnsignedInt:55];
    SAJSONWriteDictionaryFirstEntry(v1, @"reportVersion", v2);

    uint64_t v0 = v1254;
  }
  v1189 = -[SASamplePrinter eventStartTimeWithWallTime](v0);
  if (v1189 && ([*(id *)(v1254 + 16) omitAbsoluteWallTimes] & 1) == 0)
  {
    v20 = *(void **)(v1254 + 8);
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(*(void **)(v1254 + 8), @"startTime", v1189);
    }
    else
    {
      [v1189 wallTime];
      long double v22 = v21;
      if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
        int v23 = 9;
      }
      else {
        int v23 = 3;
      }
      v24 = _CopyStringForTime(v23, v22);
      [v20 printWithFormat:@"%-*s%@\n", 18, "Date/Time: ", v24];
    }
  }
  else
  {
    objc_msgSend(*(id *)(v1254 + 8), "printWithFormat:", @"%-*sUNKNOWN\n", 18, "Date/Time: ");
  }
  v1180 = -[SASamplePrinter eventEndTimeWithWallTime](v1254);
  BOOL v3 = v1189 == 0;
  if (!v1180) {
    BOOL v3 = 1;
  }
  if (v3
    || ([v1180 wallTime], double v5 = v4, objc_msgSend(v1189, "wallTime"), v5 <= v6)
    || ([*(id *)(v1254 + 16) omitAbsoluteWallTimes] & 1) != 0)
  {
    if (v1192) {
      goto LABEL_12;
    }
LABEL_32:
    uint64_t v30 = (id *)(v1254 + 160);
    uint64_t v31 = [*(id *)(v1254 + 160) osProductName];
    v32 = (void *)v31;
    v33 = @"???";
    if (v31) {
      v33 = (__CFString *)v31;
    }
    int v19 = v33;

    uint64_t v34 = [*v30 osProductVersion];
    double v35 = (void *)v34;
    double v36 = @"???";
    if (v34) {
      double v36 = (__CFString *)v34;
    }
    double v37 = v36;

    uint64_t v38 = [*v30 osBuildVersion];
    uint64_t v39 = (void *)v38;
    double v40 = @"???";
    if (v38) {
      double v40 = (__CFString *)v38;
    }
    uint64_t v41 = v40;

    uint64_t v17 = v1254;
    [*(id *)(v1254 + 8) printWithFormat:@"%-*s%@ %@", 18, "OS Version: ", v19, v37];
    [*(id *)(v1254 + 8) printWithFormat:@" (Build %@)\n", v41];

    goto LABEL_39;
  }
  BOOL v25 = *(void **)(v1254 + 8);
  if (!v1192)
  {
    [v1180 wallTime];
    long double v27 = v26;
    if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
      int v28 = 9;
    }
    else {
      int v28 = 3;
    }
    uint64_t v29 = _CopyStringForTime(v28, v27);
    [v25 printWithFormat:@"%-*s%@\n", 18, "End time: ", v29];

    goto LABEL_32;
  }
  SAJSONWriteDictionaryEntry(*(void **)(v1254 + 8), @"endTime", v1180);
LABEL_12:
  v7 = [*(id *)(v1254 + 160) osProductName];

  if (v7)
  {
    v8 = *(void **)(v1254 + 8);
    BOOL v9 = [*(id *)(v1254 + 160) osProductName];
    SAJSONWriteDictionaryEntry(v8, @"osProductName", v9);
  }
  v10 = [*(id *)(v1254 + 160) osProductVersion];

  if (v10)
  {
    v11 = *(void **)(v1254 + 8);
    id v12 = [*(id *)(v1254 + 160) osProductVersion];
    SAJSONWriteDictionaryEntry(v11, @"osProductVersion", v12);
  }
  v13 = [*(id *)(v1254 + 160) osProductVersionExtra];

  if (v13)
  {
    uint64_t v14 = *(void **)(v1254 + 8);
    uint64_t v15 = [*(id *)(v1254 + 160) osProductVersionExtra];
    SAJSONWriteDictionaryEntry(v14, @"osProductVersionExtra", v15);
  }
  v16 = [*(id *)(v1254 + 160) osBuildVersion];

  uint64_t v17 = v1254;
  if (v16)
  {
    v18 = *(void **)(v1254 + 8);
    int v19 = [*(id *)(v1254 + 160) osBuildVersion];
    SAJSONWriteDictionaryEntry(v18, @"osBuildVersion", v19);
    uint64_t v17 = v1254;
LABEL_39:
  }
  v1200 = (id *)(v17 + 160);
  v42 = [*(id *)(v17 + 160) machineArchitecture];
  v1175 = v42;
  if (v42 && [v42 length])
  {
    uint64_t v43 = v1254;
    v44 = *(void **)(v1254 + 8);
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v44, @"arch", v1175);
      goto LABEL_49;
    }
    [v44 printWithFormat:@"%-*s%@\n", 18, "Architecture: ", v1175];
  }
  else
  {
    uint64_t v43 = v1254;
    if (v1192) {
      goto LABEL_49;
    }
  }
  objc_msgSend(*(id *)(v43 + 8), "printWithFormat:", @"%-*s%d\n", 18, "Report Version: ", 55);
  if ([*(id *)(v43 + 16) systemstatsFormat]) {
    objc_msgSend(*(id *)(v43 + 8), "printWithFormat:", @"%-*scondensed\n", 18, "Report Variant: ");
  }
LABEL_49:
  v45 = *(void **)(v43 + 176);
  if (v45)
  {
    uint64_t v46 = *(void **)(v43 + 8);
    uint64_t v47 = [v45 UUIDString];
    v48 = v47;
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v46, @"incidentIdentifier", v47);

      uint64_t v43 = v1254;
      v49 = (id *)(v17 + 160);
      if (!*(unsigned char *)(v1254 + 152)) {
        goto LABEL_59;
      }
LABEL_55:
      SAJSONWriteDictionaryEntry(*(void **)(v43 + 8), @"shareWithAppDevs", MEMORY[0x1E4F1CC38]);
      goto LABEL_59;
    }
    [v46 printWithFormat:@"%-*s%@\n", 18, "Incident Identifier: ", v47];

    uint64_t v43 = v1254;
    v49 = (id *)(v17 + 160);
    if (!*(unsigned char *)(v1254 + 152))
    {
LABEL_58:
      [*(id *)(v43 + 8) appendString:@"\n"];
      goto LABEL_59;
    }
LABEL_57:
    objc_msgSend(*(id *)(v43 + 8), "printWithFormat:", @"%-*sYes\n", 18, "Share With Devs: ");
    goto LABEL_58;
  }
  if (*(unsigned char *)(v43 + 152))
  {
    v49 = (id *)(v17 + 160);
    if (v1192) {
      goto LABEL_55;
    }
    goto LABEL_57;
  }
  v49 = (id *)(v17 + 160);
  if ((v1192 & 1) == 0) {
    goto LABEL_58;
  }
LABEL_59:
  if ([*v49 dataSource])
  {
    char v50 = [*v49 dataSource];
    char v51 = v50 & 1;
    v52 = v1364;
    if (v50)
    {
      strcpy(v1364, "Stackshots");
      v52 = &v1364[10];
    }
    if (([*v49 dataSource] & 2) != 0)
    {
      if (v50) {
        v52 += snprintf(v52, (char *)&buf - v52, ", ");
      }
      v52 += snprintf(v52, (char *)&buf - v52, "KPerf Lightweight PET");
      char v51 = 1;
    }
    if (([*v49 dataSource] & 4) != 0)
    {
      v53 = v1200;
      if (v51) {
        v52 += snprintf(v52, (char *)&buf - v52, ", ");
      }
      v52 += snprintf(v52, (char *)&buf - v52, "Microstackshots");
      char v51 = 1;
    }
    else
    {
      v53 = v1200;
    }
    if (([*v53 dataSource] & 8) != 0)
    {
      int v54 = v1200;
      if (v51) {
        v52 += snprintf(v52, (char *)&buf - v52, ", ");
      }
      v52 += snprintf(v52, (char *)&buf - v52, "KPerf non-PET");
      char v51 = 1;
    }
    else
    {
      int v54 = v1200;
    }
    char v55 = [*v54 dataSource];
    uint64_t v43 = v1254;
    if ((v55 & 0x10) != 0)
    {
      if (v51) {
        v52 += snprintf(v52, (char *)&buf - v52, ", ");
      }
      snprintf(v52, (char *)&buf - v52, "Custom callstacks");
    }
  }
  else
  {
    strcpy(v1364, "Unknown");
  }
  uint64_t v56 = *(void **)(v43 + 8);
  v1211 = (id *)(v43 + 8);
  if (v1192)
  {
    id v57 = SANSStringForCString(v1364);
    SAJSONWriteDictionaryEntry(v56, @"dataSource", v57);
  }
  else
  {
    objc_msgSend(v56, "printWithFormat:", @"%-*s%s\n", 18, "Data Source: ", v1364);
    long long v1332 = 0u;
    long long v1331 = 0u;
    long long v1330 = 0u;
    long long v1329 = 0u;
    obuint64_t j = [*v1200 kernelCaches];
    uint64_t v58 = [obj countByEnumeratingWithState:&v1329 objects:v1363 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v1330;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v1330 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v61 = *(void **)(*((void *)&v1329 + 1) + 8 * i);
          id v62 = *v1211;
          uint64_t v63 = [v61 loadAddress];
          v64 = [v61 uuid];
          v65 = [v64 UUIDString];
          [v62 printWithFormat:@"%-*s0x%llx %@\n", 18, "Kernel Cache: ", v63, v65];
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v1329 objects:v1363 count:16];
      }
      while (v58);
    }

    long long v1328 = 0u;
    long long v1327 = 0u;
    long long v1326 = 0u;
    long long v1325 = 0u;
    id v57 = [*v1200 sharedCaches];
    uint64_t v66 = [v57 countByEnumeratingWithState:&v1325 objects:v1362 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v1326;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v1326 != v67) {
            objc_enumerationMutation(v57);
          }
          id v69 = *v1211;
          v70 = _shared_cache_display_string(*(void **)(*((void *)&v1325 + 1) + 8 * j));
          [v69 printWithFormat:@"%-*s%@\n", 18, "Shared Cache: ", v70];
        }
        uint64_t v66 = [v57 countByEnumeratingWithState:&v1325 objects:v1362 count:16];
      }
      while (v66);
    }
  }

  v71 = [*v1200 reason];

  if (v71)
  {
    id v72 = *v1211;
    v73 = [*v1200 reason];
    int v74 = v73;
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v72, @"reason", v73);

      goto LABEL_104;
    }
    v75 = SACopySanitizedString(v73, 1, 0xFFuLL);
    [v72 printWithFormat:@"%-*s%@\n", 18, "Reason: ", v75];

    goto LABEL_103;
  }
  if ((v1192 & 1) == 0) {
LABEL_103:
  }
    [*v1211 appendString:@"\n"];
LABEL_104:
  if ([*v1200 targetHIDEventMachAbs])
  {
    int v76 = *(void **)(v1254 + 112);
    if (v76)
    {
      v1170 = [v76 hidEventTimestamp];
      uint64_t v77 = [*(id *)(v1254 + 112) steps];
      v78 = [v77 lastObject];
      uint64_t v79 = [v78 timestamp];
    }
    else
    {
      v1170 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:](SATimestamp, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:", [*v1200 targetHIDEventMachAbs], 0, objc_msgSend(*v1200, "machTimebase"), 0.0);
      if ([*v1200 targetHIDEventEndMachAbs])
      {
        uint64_t v90 = +[SATimestamp timestampWithMachAbsTime:machContTime:wallTime:machTimebase:](SATimestamp, "timestampWithMachAbsTime:machContTime:wallTime:machTimebase:", [*v1200 targetHIDEventEndMachAbs], 0, objc_msgSend(*v1200, "machTimebase"), 0.0);
        uint64_t v80 = v1254;
        uint64_t v81 = v1200;
        uint64_t v79 = v90;
        goto LABEL_109;
      }
      uint64_t v79 = 0;
    }
  }
  else
  {
    uint64_t v79 = 0;
    v1170 = 0;
  }
  uint64_t v80 = v1254;
  uint64_t v81 = v1200;
LABEL_109:
  v1167 = v79;
  v82 = *(void **)(v80 + 128);
  if (v82) {
    goto LABEL_110;
  }
  double v85 = 0.0;
  if (([*v81 targetProcessId] & 0x80000000) != 0)
  {
    id v1176 = 0;
    goto LABEL_189;
  }
  v82 = *(void **)(v1254 + 128);
  if (v82)
  {
LABEL_110:
    id v83 = v82;
  }
  else
  {
    id v87 = [*v1200 targetProcess];

    id v83 = v87;
    if (!v87)
    {
      int v88 = *__error();
      uint64_t v89 = _sa_logt();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        int v1141 = [*v1200 targetProcessId];
        *(_DWORD *)v1377 = 67109120;
        *(_DWORD *)&v1377[4] = v1141;
        _os_log_error_impl(&dword_1BF22B000, v89, OS_LOG_TYPE_ERROR, "No task for target pid %d", v1377, 8u);
      }

      id v1176 = 0;
      *__error() = v88;
      goto LABEL_189;
    }
  }
  self = v83;
  if (v1192)
  {
    id v84 = *v1211;
    uint64_t v79 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v83, "pid"));
    SAJSONWriteDictionaryEntry(v84, @"targetTaskPid", v79);

    id v1176 = 0;
    double v85 = 0.0;
    goto LABEL_189;
  }
  v1181 = [v83 startTimestamp];
  uint64_t v86 = [self ppid];
  if (v86 == -1 || v86 == [self pid])
  {
    id v1229 = 0;
  }
  else
  {
    uint64_t v91 = -[SASampleStore lastTaskWithPid:onOrBeforeTimestamp:](*v1200, v86, v1181);
    if (v91)
    {
      id v92 = v91;
    }
    else
    {
      -[SASampleStore firstTaskWithPid:](*v1200, v86);
      id v92 = (id)objc_claimAutoreleasedReturnValue();

      if (!v92)
      {
        -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)v1254, v86, 0, v1181);
        id v1229 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_132;
      }
    }
    -[SASamplePrinter displayNameForTask:]((void *)v1254, v92);
    id v1229 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_132:
  uint64_t v93 = [self rpid];
  if ((int)v93 < 1 || v93 == [self pid])
  {
    v1224 = 0;
    goto LABEL_139;
  }
  uint64_t v94 = -[SASampleStore lastTaskWithPid:onOrBeforeTimestamp:](*v1200, v93, v1181);
  if (v94)
  {
    id v95 = v94;

LABEL_138:
    v1224 = -[SASamplePrinter displayNameForTask:]((void *)v1254, v95);

    goto LABEL_139;
  }
  -[SASampleStore firstTaskWithPid:](*v1200, v93);
  id v95 = (id)objc_claimAutoreleasedReturnValue();

  if (v95) {
    goto LABEL_138;
  }
  v1224 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)v1254, v93, 0, v1181);
LABEL_139:
  if ([self resourceCoalitionID])
  {
    id v96 = -[SASamplePrinter displayStringForResourceCoalition:](self);
    v1360 = v96;
    v1361 = &unk_1F1A9AF80;
    v1220 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1361 forKeys:&v1360 count:1];
  }
  else
  {
    v1220 = 0;
  }
  id v1359 = self;
  id v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v1359 count:1];
  v1216 = -[SASamplePrinter displayStringForOnBehalfOfForTasks:includePid:](v1254, v97);

  long long v1324 = 0u;
  long long v1323 = 0u;
  long long v1322 = 0u;
  long long v1321 = 0u;
  id v98 = [self threads];
  uint64_t v99 = [v98 countByEnumeratingWithState:&v1321 objects:v1358 count:16];
  if (v99)
  {
    id v1238 = 0;
    id obja = 0;
    uint64_t v100 = *(void *)v1322;
    while (1)
    {
      uint64_t v101 = 0;
      do
      {
        if (*(void *)v1322 != v100) {
          objc_enumerationMutation(v98);
        }
        uint64_t v102 = [*(id *)(v1254 + 144) objectForKeyedSubscript:*(void *)(*((void *)&v1321 + 1) + 8 * v101)];
        unint64_t v103 = v102;
        if (v102)
        {
          v104 = [v102 threadState];
          v105 = [v104 startTimestamp];
          if ([v105 gt:*(void *)(v1254 + 40)])
          {

            goto LABEL_150;
          }
          uint64_t v106 = [v103 threadState];
          v107 = [v106 endTimestamp];
          char v108 = [v107 lt:*(void *)(v1254 + 32)];

          if ((v108 & 1) == 0)
          {
            if ([v103 isPartOfADeadlock])
            {
              uint64_t v109 = [v103 thread];
              v110 = [v103 threadState];
              v104 = -[SASamplePrinter displayNameForTask:thread:threadState:]((void *)v1254, 0, v109, v110);

              v111 = obja;
              if (obja) {
                goto LABEL_156;
              }
              id obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v104, 0);
              goto LABEL_150;
            }
            if ([v103 isBlockedByADeadlock])
            {
              v112 = [v103 thread];
              v113 = [v103 threadState];
              v104 = -[SASamplePrinter displayNameForTask:thread:threadState:]((void *)v1254, 0, v112, v113);

              v111 = v1238;
              if (v1238) {
LABEL_156:
              }
                [v111 addObject:v104];
              else {
                id v1238 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v104, 0);
              }
LABEL_150:
            }
          }
        }

        ++v101;
      }
      while (v99 != v101);
      uint64_t v114 = [v98 countByEnumeratingWithState:&v1321 objects:v1358 count:16];
      uint64_t v99 = v114;
      if (!v114) {
        goto LABEL_165;
      }
    }
  }
  id v1238 = 0;
  id obja = 0;
LABEL_165:

  [obja sortUsingSelector:sel_compare_];
  [v1238 sortUsingSelector:sel_compare_];
  id v1177 = *v1211;
  v115 = [self name];
  if (v115)
  {
    v1162 = [self name];
    SACopySanitizedString(v1162, 1, 0);
    v1178 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1178 = @"UNKNOWN PROCESS";
  }
  unsigned int v1173 = [self pid];
  uint64_t v116 = [self mainBinaryPath];
  v117 = (void *)v116;
  v118 = @"UNKNOWN PATH";
  if (v116) {
    v118 = (__CFString *)v116;
  }
  v1171 = v118;
  v1207 = [self bundleIdentifier];
  id v1204 = [self bundleVersion];
  v1201 = [self bundleShortVersion];
  v1196 = [self bundleBuildVersion];
  id v1212 = [self bundleProjectName];
  id v1193 = [self bundleSourceVersion];
  v1190 = [self bundleProductBuildVersion];
  uint64_t v1168 = [self adamID];
  v1187 = [self installerVersionID];
  char v1164 = [self developerType];
  v1185 = [self appType];
  unsigned __int8 v1163 = [self isBeta];
  v1183 = [self cohortID];
  v119 = [self vendorID];
  v120 = [self distributorID];
  v121 = [self codesigningID];
  v122 = [self teamID];
  v123 = -[SASamplePrinter architectureStringForTask:](v1254, self);
  int v125 = [self pid];
  if (v125)
  {
    uint64_t v79 = 0;
  }
  else
  {
    uint64_t v79 = [*v1200 kernelVersion];
  }
  id Property = self;
  if (self) {
    id Property = objc_getProperty(self, v124, 272, 1);
  }
  BOOL v127 = v125 == 0;
  id v128 = Property;
  -[SASamplePrinter addTaskHeaderToStream:displayName:pid:mainBinary:mainBinaryPath:sharedCaches:uid:bundleIdentifier:bundleVersion:bundleShortVersion:bundleBuildVersion:bundleProjectName:bundleSourceVersion:bundleProductBuildVersion:adamID:installerVersionID:developerType:appType:isBeta:cohortID:vendorID:distributorID:codesigningID:teamID:resourceCoalitionSampleCounts:onBehalfOfProcesses:architectureString:kernelVersion:parentName:responsibleName:taskExecedFromName:taskExecedToName:pidStartTimestamp:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:numSamples:totalNumSamples:numSamplesSuspended:numSamplesTerminated:startingTaskSize:endingTaskSize:maxTaskSize:startSampleIndexOfMaxTaskSize:endSampleIndexOfMaxTaskSize:numPageins:cpuTimeNs:cpuInstructions:cpuCycles:nonThreadCpuTimeNs:nonThreadCpuInstructions:nonThreadCpuCycles:usesSuddenTermination:allowsIdleExit:isTranslocated:isUnresponsive:timeOfLastResponse:numThreads:numIdleWorkQueueThreads:numOtherHiddenThreads:hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:](v1254, v1177, v1178, v1173, 0, v1171, 0, 4294966982, 0.0, v1207, v1204, v1201, v1196, v1212, v1193, v1190, v1168, v1187, v1164,
    v1185,
    v1163,
    v1183,
    v119,
    v120,
    v121,
    v122,
    v1220,
    v1216,
    v123,
    v79,
    v1229,
    v1224,
    0,
    0,
    v128,
    0,
    0,
    0x7FFFFFFFFFFFFFFFuLL,
    0x7FFFFFFFFFFFFFFFuLL,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0x7FFFFFFFFFFFFFFFuLL,
    0x7FFFFFFFFFFFFFFFuLL,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    [self isTranslocated],
    0,
    0,
    0,
    0,
    0);

  if (v127) {
  if (v115)
  }
  {
  }
  [*v1211 appendString:@"\n"];
  if (v1170 && *v1200 && (*((unsigned char *)*v1200 + 326) & 1) != 0)
  {
    double v85 = 0.0;
    if ([v1170 lt:*(void *)(v1254 + 32)]
      && ([*(id *)(v1254 + 32) machAbsTimeSeconds],
          double v140 = v139,
          [v1170 machAbsTimeSeconds],
          double v142 = v140 - v141,
          -[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, v142)))
    {
      id v143 = [NSString alloc];
      if (v142 >= 0.1) {
        uint64_t v144 = objc_msgSend(v143, "initWithFormat:", @"HID event started %.1f seconds before sampling", *(void *)&v142);
      }
      else {
        uint64_t v144 = [v143 initWithFormat:@"HID event started <0.1 seconds before sampling"];
      }
      uint64_t v198 = (void *)v144;
      double v85 = v142 + 0.0;
    }
    else
    {
      uint64_t v198 = 0;
    }
    id v1176 = v198;
    if (v1167)
    {
      if ([v1167 gt:*(void *)(v1254 + 40)])
      {
        [v1167 machAbsTimeSeconds];
        double v770 = v769;
        [*(id *)(v1254 + 40) machAbsTimeSeconds];
        double v772 = v770 - v771;
        if (-[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, v772))
        {
          id v773 = [NSString alloc];
          if (v772 >= 0.1) {
            v774 = objc_msgSend(v773, "initWithFormat:", @"HID event ended %.1f seconds after sampling", *(void *)&v772);
          }
          else {
            v774 = (void *)[v773 initWithFormat:@"HID event ended <0.1 seconds after sampling"];
          }
          v979 = v774;
          if (v1176)
          {
            uint64_t v980 = [[NSString alloc] initWithFormat:@"%@, %@", v1176, v774];

            id v1176 = (id)v980;
          }
          else
          {
            id v1176 = v774;
          }

          double v85 = v85 + v772;
        }
      }
    }
  }
  else
  {
    double v85 = 0.0;
    if ([self isUnresponsive]
      && ([self timeOfLastResponse], double v130 = v129, v129 > 0.0)
      && ([*(id *)(v1254 + 32) wallTime], v130 < v131)
      && (double v132 = v131 - v130, -[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, v132)))
    {
      id v1176 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"process was unresponsive for %.0f seconds before sampling", *(void *)&v132);
      double v85 = v132 + 0.0;
    }
    else
    {
      id v1176 = 0;
    }
  }

LABEL_189:
  v133 = [*v1200 targetProcess];
  if (v133)
  {
    v134 = *(void **)(v1254 + 128);
    if (v134)
    {
      v135 = [*v1200 targetProcess];
      BOOL v136 = v134 == v135;

      if (v136) {
        goto LABEL_201;
      }
      uint64_t v79 = *(NSObject **)(v1254 + 8);
      v133 = [*(id *)(v1254 + 160) targetProcess];
      v137 = -[SASamplePrinter displayNameForTask:]((void *)v1254, v133);
      v138 = v137;
      if (v1192) {
        SAJSONWriteDictionaryEntry(v79, @"affectedProcess", v137);
      }
      else {
        [v79 printWithFormat:@"%-*s%@\n", 18, "Affected Process: ", v137];
      }
    }
  }

LABEL_201:
  v1184 = [*v1200 event];
  uint64_t v145 = [*v1200 eventNote];
  v1182 = (void *)v145;
  if (__PAIR128__((unint64_t)v1184, v145) != 0)
  {
    if (v145)
    {
      id v146 = [NSString alloc];
      v147 = v1184;
      if (!v1184) {
        v147 = @"???";
      }
      v148 = (__CFString *)[v146 initWithFormat:@"%@ (%@)", v147, v1182];
    }
    else
    {
      v148 = v1184;
    }
    v149 = v148;
    id v150 = *v1211;
    if (v1192) {
      SAJSONWriteDictionaryEntry(v150, @"event", v149);
    }
    else {
      [v150 printWithFormat:@"%-*s%@\n", 18, "Event: ", v149];
    }
  }
  v151 = [*v1200 signature];

  if (v151)
  {
    id v152 = *v1211;
    v153 = [*v1200 signature];
    v154 = v153;
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v152, @"signature", v153);
    }
    else
    {
      uint64_t v79 = SACopySanitizedString(v153, 1, 0xFFuLL);
      [v152 printWithFormat:@"%-*s%@\n", 18, "Signature: ", v79];
    }
  }
  if ([*v1200 targetDispatchQueueId])
  {
    v155 = [*v1200 targetProcess];
    uint64_t v79 = [v155 dispatchQueues];
    uint64_t v156 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "targetDispatchQueueId"));
    v157 = [v79 objectForKeyedSubscript:v156];

    if (v157)
    {
      id v158 = *v1211;
      if (!v1192)
      {
        uint64_t v79 = -[SASamplePrinter displayNameForDispatchQueue:](v157);
        [v158 printWithFormat:@"%-*s%@\n", 18, "Dispatch Queue: ", v79];
        goto LABEL_222;
      }
      uint64_t v79 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "targetDispatchQueueId"));
      SAJSONWriteDictionaryEntry(v158, @"targetDispatchQueueId", v79);

      v159 = [v157 dispatchQueueLabel];

      if (v159)
      {
        id v160 = *v1211;
        uint64_t v79 = [v157 dispatchQueueLabel];
        SAJSONWriteDictionaryEntry(v160, @"targetDispatchQueueLabel", v79);
LABEL_222:
      }
    }
  }
  if ([*v1200 targetThreadId])
  {
    id v161 = *v1211;
    if (v1192)
    {
      v162 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "targetThreadId"));
      SAJSONWriteDictionaryEntry(v161, @"targetThreadId", v162);
    }
    else
    {
      objc_msgSend(v161, "printWithFormat:", @"%-*s0x%llx\n", 18, "Thread: ", objc_msgSend(*v1200, "targetThreadId"));
    }
  }
  v163 = [*v1200 actionTaken];

  if (v163)
  {
    id v164 = *v1211;
    id v165 = [*v1200 actionTaken];
    id v166 = v165;
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v164, @"actionTaken", v165);
    }
    else
    {
      uint64_t v79 = SACopySanitizedString(v165, 1, 0);
      [v164 printWithFormat:@"%-*s%@\n", 18, "Action taken: ", v79];
    }
  }
  [*v1200 cpuUsed];
  if (v167 > 0.0)
  {
    [*v1200 cpuDuration];
    if (v168 > 0.0)
    {
      if (v1192)
      {
        id v169 = *v1211;
        id v170 = NSNumber;
        [*v1200 cpuUsed];
        uint64_t v171 = objc_msgSend(v170, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v169, @"cpuUsed", v171);

        id v172 = *v1211;
        char v173 = NSNumber;
        [*v1200 cpuDuration];
        id v174 = objc_msgSend(v173, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v172, @"cpuDuration", v174);

        id v175 = *v1211;
        uint64_t v176 = NSNumber;
        [*v1200 cpuLimit];
        uint64_t v177 = objc_msgSend(v176, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v175, @"cpuLimit", v177);

        id v178 = *v1211;
        uint64_t v179 = NSNumber;
        [*v1200 cpuLimitDuration];
        uint64_t v180 = objc_msgSend(v179, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v178, @"cpuLimitDuration", v180);
      }
      else
      {
        BOOL v181 = *(void **)(v1254 + 160);
        *(unsigned char *)(v1254 + 104) = 1;
        [v181 cpuUsed];
        double v183 = v182;
        [*(id *)(v1254 + 160) cpuDuration];
        double v185 = v184;
        v186 = *(void **)(v1254 + 8);
        [*(id *)(v1254 + 160) cpuUsed];
        uint64_t v188 = v187;
        [*(id *)(v1254 + 160) cpuDuration];
        objc_msgSend(v186, "printWithFormat:", @"%-*s%.0f seconds cpu time over %.0f seconds (%.0f%% cpu average)", 18, "CPU: ", v188, v189, v183 * 100.0 / v185);
        [*(id *)(v1254 + 160) cpuLimit];
        if (v190 <= 0.0 || ([*v1200 cpuLimitDuration], v191 <= 0.0))
        {
          [*v1211 appendString:@"\n"];
        }
        else
        {
          [*v1200 cpuLimit];
          double v193 = v192;
          [*v1200 cpuLimitDuration];
          double v195 = v194;
          id v196 = *v1211;
          [*v1200 cpuLimitDuration];
          [v196 printWithFormat:@", exceeding limit of %.0f%% cpu over %.0f seconds\n", v193 * 100.0 / v195, v197];
        }
        id v199 = *v1211;
        [*v1200 cpuLimit];
        objc_msgSend(v199, "printWithFormat:", @"%-*s%.0fs\n", 18, "CPU limit: ", v200);
        id v201 = *v1211;
        [*v1200 cpuLimitDuration];
        objc_msgSend(v201, "printWithFormat:", @"%-*s%.0fs\n", 18, "Limit duration: ", v202);
        id v203 = *v1211;
        [*v1200 cpuUsed];
        objc_msgSend(v203, "printWithFormat:", @"%-*s%.0fs\n", 18, "CPU used: ", v204);
        id v205 = *v1211;
        [*v1200 cpuDuration];
        objc_msgSend(v205, "printWithFormat:", @"%-*s%.0fs\n", 18, "CPU duration: ", v206);
      }
    }
  }
  if ([*v1200 numWakeups])
  {
    [*v1200 wakeupsDuration];
    if (v207 > 0.0)
    {
      if (v1192)
      {
        id v208 = *v1211;
        id v209 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "numWakeups"));
        SAJSONWriteDictionaryEntry(v208, @"numWakeups", v209);

        id v210 = *v1211;
        id v211 = NSNumber;
        [*v1200 wakeupsDuration];
        id v212 = objc_msgSend(v211, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v210, @"wakeupsDuration", v212);

        id v213 = *v1211;
        v214 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "numWakeupsLimit"));
        SAJSONWriteDictionaryEntry(v213, @"numWakeupsLimit", v214);

        id v215 = *v1211;
        uint64_t v216 = NSNumber;
        [*v1200 wakeupsLimitDuration];
        uint64_t v217 = objc_msgSend(v216, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v215, @"wakeupsLimitDuration", v217);
      }
      else
      {
        v218 = *(void **)(v1254 + 160);
        *(unsigned char *)(v1254 + 104) = 1;
        unint64_t v219 = [v218 numWakeups];
        [*(id *)(v1254 + 160) wakeupsDuration];
        double v221 = v220;
        uint64_t v222 = *(void **)(v1254 + 8);
        uint64_t v79 = [*(id *)(v1254 + 160) numWakeups];
        [*(id *)(v1254 + 160) wakeupsDuration];
        objc_msgSend(v222, "printWithFormat:", @"%-*s%llu wakeups over the last %.0f seconds (%.0f wakeups per second average)", 18, "Wakeups: ", v79, v223, (double)v219 / v221);
        if ([*(id *)(v1254 + 160) numWakeupsLimit]
          && ([*v1200 wakeupsLimitDuration], v224 > 0.0))
        {
          unint64_t v225 = [*v1200 numWakeupsLimit];
          [*v1200 wakeupsLimitDuration];
          double v227 = v226;
          id v228 = *v1211;
          [*v1200 wakeupsLimitDuration];
          [v228 printWithFormat:@", exceeding limit of %.0f wakeups per second over %.0f seconds\n", (double)v225 / v227, v229];
        }
        else
        {
          [*v1211 appendString:@"\n"];
        }
        objc_msgSend(*v1211, "printWithFormat:", @"%-*s%llu\n", 18, "Wakeups limit: ", objc_msgSend(*v1200, "numWakeupsLimit"));
        id v230 = *v1211;
        [*v1200 wakeupsLimitDuration];
        objc_msgSend(v230, "printWithFormat:", @"%-*s%.0fs\n", 18, "Limit duration: ", v231);
        objc_msgSend(*v1211, "printWithFormat:", @"%-*s%llu\n", 18, "Wakeups caused: ", objc_msgSend(*v1200, "numWakeups"));
        id v232 = *v1211;
        [*v1200 wakeupsDuration];
        objc_msgSend(v232, "printWithFormat:", @"%-*s%.0fs\n", 18, "Wakeups duration: ", v233);
      }
    }
  }
  if ([*v1200 bytesWritten])
  {
    [*v1200 writeDuration];
    if (v234 > 0.0)
    {
      if (v1192)
      {
        id v235 = *v1211;
        v236 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "bytesWritten"));
        SAJSONWriteDictionaryEntry(v235, @"bytesWritten", v236);

        id v237 = *v1211;
        uint64_t v238 = NSNumber;
        [*v1200 writeDuration];
        uint64_t v239 = objc_msgSend(v238, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v237, @"writeDuration", v239);

        id v240 = *v1211;
        v241 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "bytesWrittenLimit"));
        SAJSONWriteDictionaryEntry(v240, @"bytesWrittenLimit", v241);

        id v242 = *v1211;
        unint64_t v243 = NSNumber;
        [*v1200 writeLimitDuration];
        unint64_t v244 = objc_msgSend(v243, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v242, @"writeLimitDuration", v244);
      }
      else
      {
        unint64_t v245 = *(void **)(v1254 + 160);
        *(unsigned char *)(v1254 + 104) = 1;
        unint64_t v246 = [v245 bytesWritten];
        [*(id *)(v1254 + 160) writeDuration];
        double v248 = v247;
        v249 = *(void **)(v1254 + 8);
        int v250 = SAFormattedBytesEx([*(id *)(v1254 + 160) bytesWritten], 0, 0, 1, 0);
        [*(id *)(v1254 + 160) writeDuration];
        uint64_t v252 = v251;
        uint64_t v79 = SAFormattedBytesDouble(0, 0, (double)v246 / v248);
        [v249 printWithFormat:@"%-*s%@ of file backed memory dirtied over %.0f seconds (%@ per second average)", 18, "Writes: ", v250, v252, v79];

        if ([*(id *)(v1254 + 160) bytesWrittenLimit]
          && ([*v1200 writeLimitDuration], v253 > 0.0))
        {
          unint64_t v254 = [*v1200 bytesWrittenLimit];
          [*v1200 writeLimitDuration];
          id v256 = *v1211;
          v257 = SAFormattedBytesDouble(0, 0, (double)v254 / v255);
          [*v1200 writeLimitDuration];
          [v256 printWithFormat:@", exceeding limit of %@ per second over %.0f seconds\n", v257, v258];
        }
        else
        {
          [*v1211 appendString:@"\n"];
        }
        id v259 = *v1211;
        v260 = SAFormattedBytesEx([*v1200 bytesWrittenLimit], 0, 0, 1, 0);
        [v259 printWithFormat:@"%-*s%@\n", 18, "Writes limit: ", v260];

        id v261 = *v1211;
        [*v1200 writeLimitDuration];
        objc_msgSend(v261, "printWithFormat:", @"%-*s%.0fs\n", 18, "Limit duration: ", v262);
        id v263 = *v1211;
        v264 = SAFormattedBytesEx([*v1200 bytesWritten], 0, 0, 1, 0);
        [v263 printWithFormat:@"%-*s%@\n", 18, "Writes caused: ", v264];

        id v265 = *v1211;
        [*v1200 writeDuration];
        objc_msgSend(v265, "printWithFormat:", @"%-*s%.0fs\n", 18, "Writes duration: ", v266);
      }
    }
  }
  [*v1200 attemptedSamplingInterval];
  double v268 = v267;
  unint64_t v269 = [*v1200 eventTimeRange];

  double v270 = 0.0;
  if (v269)
  {
    unint64_t v271 = [*v1200 eventTimeRange];
    [v271 deltaMachAbsTimeSeconds];
    BOOL v273 = v272 != 0.0;

    int v274 = [*v1200 eventTimeRange];
    uint64_t v275 = v274;
    if (v273)
    {
      [v274 deltaMachAbsTimeSeconds];
LABEL_268:
      double v270 = v276;

      goto LABEL_269;
    }
    [v274 deltaMachContTimeSeconds];
    BOOL v278 = v277 != 0.0;

    uint64_t v279 = [*v1200 eventTimeRange];
    uint64_t v275 = v279;
    if (v278)
    {
      [v279 deltaMachContTimeSeconds];
      goto LABEL_268;
    }
    [v279 deltaWallTime];
    BOOL v281 = v280 != 0.0;

    if (v281)
    {
      uint64_t v275 = [*v1200 eventTimeRange];
      [v275 deltaWallTime];
      goto LABEL_268;
    }
  }
LABEL_269:
  [*(id *)(v1254 + 40) machAbsTimeSeconds];
  if (v282 != 0.0)
  {
    [*(id *)(v1254 + 32) machAbsTimeSeconds];
    if (v283 != 0.0)
    {
      [*(id *)(v1254 + 40) machAbsTimeSeconds];
      double v285 = v284;
      [*(id *)(v1254 + 32) machAbsTimeSeconds];
LABEL_278:
      double v290 = v285 - v286;
      goto LABEL_279;
    }
  }
  [*(id *)(v1254 + 40) machContTimeSeconds];
  if (v287 != 0.0)
  {
    [*(id *)(v1254 + 32) machContTimeSeconds];
    if (v288 != 0.0)
    {
      [*(id *)(v1254 + 40) machContTimeSeconds];
      double v285 = v289;
      [*(id *)(v1254 + 32) machContTimeSeconds];
      goto LABEL_278;
    }
  }
  [*(id *)(v1254 + 40) wallTime];
  double v290 = 0.0;
  if (v291 != 0.0)
  {
    [*(id *)(v1254 + 32) wallTime];
    if (v292 != 0.0)
    {
      [*(id *)(v1254 + 40) wallTime];
      double v285 = v293;
      [*(id *)(v1254 + 32) wallTime];
      goto LABEL_278;
    }
  }
LABEL_279:
  double v294 = v268 + v290;
  if (v270 <= 0.0)
  {
    [*v1200 extraDuration];
    double v270 = v85 + v294 + v295;
  }
  v296 = [*v1200 durationNote];

  if (v296)
  {
    if (v1176)
    {
      id v297 = [NSString alloc];
      BOOL v298 = [*v1200 durationNote];
      id v1179 = (id)[v297 initWithFormat:@"%@, %@", v298, v1176];
    }
    else
    {
      id v1179 = [*v1200 durationNote];
    }
    goto LABEL_287;
  }
  if (v1176)
  {
    id v1179 = v1176;
    goto LABEL_287;
  }
  v316 = [*v1200 eventTimeRange];

  if (!v316)
  {
    id v1179 = 0;
    goto LABEL_287;
  }
  uint64_t v79 = (v1254 + 160);
  v317 = [*(id *)(v1254 + 160) eventTimeRange];
  v318 = [v317 startTime];
  [v318 deltaSecondsTo:*(void *)(v1254 + 32) timeDomainPriorityList:&unk_1F1A9B070 timeDomainUsed:0];
  double v320 = v319;

  v321 = [*(id *)(v1254 + 160) eventTimeRange];
  v322 = [v321 startTime];
  [v322 deltaSecondsTo:*(void *)(v1254 + 40) timeDomainPriorityList:&unk_1F1A9B088 timeDomainUsed:0];
  double v324 = v323;

  v325 = [*(id *)(v1254 + 160) eventTimeRange];
  v326 = [v325 endTime];
  [v326 deltaSecondsTo:*(void *)(v1254 + 32) timeDomainPriorityList:&unk_1F1A9B0A0 timeDomainUsed:0];
  double v328 = v327;

  v329 = [*(id *)(v1254 + 160) eventTimeRange];
  uint64_t v330 = [v329 endTime];
  [v330 deltaSecondsTo:*(void *)(v1254 + 40) timeDomainPriorityList:&unk_1F1A9B0B8 timeDomainUsed:0];
  double v332 = v331;

  if (v328 > 0.0)
  {
    id v333 = [NSString alloc];
    v334 = seconds_string_for_nanoseconds((unint64_t)(v328 * 1000000000.0));
    id v1179 = (id)[v333 initWithFormat:@"no overlap, event ends %@ before samples start", v334];

    goto LABEL_287;
  }
  if (v324 < 0.0)
  {
    id v409 = [NSString alloc];
    uint64_t v410 = seconds_string_for_nanoseconds((unint64_t)(v324 * -1000000000.0));
    id v1179 = (id)[v409 initWithFormat:@"no overlap, event starts %@ after samples end", v410];

    goto LABEL_287;
  }
  double v764 = v268 + v332;
  if (!-[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, fabs(v320))) {
    double v320 = 0.0;
  }
  if (!-[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, fabs(v764))) {
    double v764 = 0.0;
  }
  if (v320 <= 0.0)
  {
    if (v320 >= 0.0)
    {
      v1117 = 0;
      goto LABEL_1258;
    }
    id v978 = [NSString alloc];
    v766 = seconds_string_for_nanoseconds((unint64_t)(v320 * -1000000000.0));
    uint64_t v767 = [v978 initWithFormat:@"event starts %@ after samples start", v766];
  }
  else
  {
    id v765 = [NSString alloc];
    v766 = seconds_string_for_nanoseconds((unint64_t)(v320 * 1000000000.0));
    uint64_t v767 = [v765 initWithFormat:@"event starts %@ before samples", v766];
  }
  v1117 = (void *)v767;

LABEL_1258:
  if (v764 > 0.0)
  {
    id v1118 = [NSString alloc];
    v1119 = seconds_string_for_nanoseconds((unint64_t)(v764 * 1000000000.0));
    uint64_t v1120 = [v1118 initWithFormat:@"event ends %@ before samples end", v1119];
LABEL_1262:
    id v1122 = (id)v1120;

    if (v1117)
    {
      uint64_t v79 = v1254;
      if (v1122)
      {
        id v1179 = (id)[[NSString alloc] initWithFormat:@"%@, %@", v1117, v1122];
        uint64_t v79 = v1254;
        goto LABEL_1275;
      }
      goto LABEL_1268;
    }
    uint64_t v79 = v1254;
    if (v1122)
    {
      id v1122 = v1122;
      id v1179 = v1122;
      goto LABEL_1275;
    }
    goto LABEL_1274;
  }
  if (v764 < 0.0)
  {
    id v1121 = [NSString alloc];
    v1119 = seconds_string_for_nanoseconds((unint64_t)(v764 * -1000000000.0));
    uint64_t v1120 = [v1121 initWithFormat:@"event ends %@ after samples", v1119];
    goto LABEL_1262;
  }
  uint64_t v79 = v1254;
  if (v1117)
  {
LABEL_1268:
    id v1179 = v1117;
    id v1122 = 0;
    goto LABEL_1275;
  }
  id v1122 = 0;
LABEL_1274:
  id v1179 = 0;
LABEL_1275:
  if (v320 > 0.0 || v764 < 0.0)
  {
    v1124 = [(objc_class *)v79[20].isa eventTimeRange];
    v1125 = [v1124 startTime];
    if ([v1125 isComparable:*(void *)(v1254 + 32)])
    {
      v1126 = [*(id *)(v1254 + 160) eventTimeRange];
      v1127 = [v1126 startTime];
      if ([v1127 ge:*(void *)(v1254 + 32)])
      {
        v1128 = [*v1200 eventTimeRange];
        id v1129 = [v1128 startTime];
      }
      else
      {
        id v1129 = *(id *)(v1254 + 32);
      }
    }
    else
    {
      id v1129 = 0;
    }

    uint64_t v79 = [*(id *)(v1254 + 160) eventTimeRange];
    v1130 = [v79 endTime];
    if ([v1130 isComparable:*(void *)(v1254 + 40)])
    {
      v1131 = [*(id *)(v1254 + 160) eventTimeRange];
      v1132 = [v1131 endTime];
      if ([v1132 le:*(void *)(v1254 + 40)])
      {
        v1133 = [*v1200 eventTimeRange];
        id v1134 = [v1133 endTime];
      }
      else
      {
        id v1134 = *(id *)(v1254 + 40);
      }
    }
    else
    {
      id v1134 = 0;
    }

    if (v1129 && v1134)
    {
      [v1129 deltaSecondsTo:v1134 timeDomainPriorityList:&unk_1F1A9B0D0 timeDomainUsed:0];
      double v1136 = v1135;
      if (v1135 <= 0.0)
      {
        int v1140 = *__error();
        uint64_t v79 = _sa_logt();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
        {
          v1158 = [*(id *)(v1254 + 160) eventTimeRange];
          v1159 = [v1158 debugDescription];
          v1160 = [*(id *)(v1254 + 32) debugDescription];
          v1161 = [*(id *)(v1254 + 40) debugDescription];
          *(_DWORD *)v1377 = 134219266;
          *(double *)&v1377[4] = v1136;
          *(_WORD *)&v1377[12] = 2048;
          *(double *)&v1377[14] = v328;
          *(_WORD *)&v1377[22] = 2048;
          *(double *)&v1377[24] = v324;
          *(_WORD *)v1378 = 2112;
          *(void *)&v1378[2] = v1159;
          *(_WORD *)&v1378[10] = 2112;
          *(void *)&v1378[12] = v1160;
          *(_WORD *)&v1378[20] = 2112;
          *(void *)&v1378[22] = v1161;
          _os_log_fault_impl(&dword_1BF22B000, v79, OS_LOG_TYPE_FAULT, "Overlap:%f eventEndToDataStart:%f eventStartToDataEnd:%f %@ vs %@-%@", v1377, 0x3Eu);
        }
        *__error() = v1140;
      }
      else
      {
        double v1137 = v268 + v1135;
        if (-[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, vabdd_f64(fmin(v294, v270), v268 + v1135)))
        {
          id v1138 = [NSString alloc];
          uint64_t v79 = seconds_string_for_nanoseconds((unint64_t)(v1137 * 1000000000.0));
          uint64_t v1139 = [v1138 initWithFormat:@"%@ overlap, %@", v79, v1179];

          id v1179 = (id)v1139;
        }
      }
    }
  }
LABEL_287:
  id v299 = *v1211;
  if (!v1192)
  {
    objc_msgSend(v299, "printWithFormat:", @"%-*s", 18, "Duration: ");
    if (v270 >= 0.01) {
      uint64_t v312 = 2;
    }
    else {
      uint64_t v312 = 3;
    }
    saos_printf_seconds(*v1211, (unint64_t)(v270 * 1000000000.0), v312);
    if (v270 != v294
      && -[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](v1254, vabdd_f64(v270, v294)))
    {
      [*v1211 appendString:@"\n"];
      objc_msgSend(*v1211, "printWithFormat:", @"%-*s%.02fs", 18, "Duration Sampled: ", *(void *)&v294);
    }
    if (v1179)
    {
      id v313 = *v1211;
      uint64_t v314 = SACopySanitizedString(v1179, 1, 0);
      [v313 printWithFormat:@" (%@)", v314];
    }
    [*(id *)(v1254 + 8) appendString:@"\n"];
    objc_msgSend(*(id *)(v1254 + 8), "printWithFormat:", @"%-*s%lu", 18, "Steps: ", *(void *)(v1254 + 64));
    if (![*(id *)(v1254 + 16) displayBody])
    {
      int objb = 0;
      goto LABEL_318;
    }
    v315 = [*v1200 timeWhenTransitionedToSamplingAllProcesses];
    if (v315
      && ([*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllProcesses],
          uint64_t v79 = objc_claimAutoreleasedReturnValue(),
          ([v79 lt:*(void *)(v1254 + 40)] & 1) != 0))
    {
      int objb = 1;
    }
    else
    {
      v335 = [*v1200 timeWhenTransitionedToSamplingAllThreads];
      if (v335)
      {
        v336 = [*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllThreads];
        int objb = [v336 lt:*(void *)(v1254 + 40)];

        if (!v315) {
          goto LABEL_317;
        }
      }
      else
      {
        int objb = 0;
        if (!v315)
        {
LABEL_317:

LABEL_318:
          if (v268 <= 0.0)
          {
            v337 = [*v1200 stepsNote];
            int v338 = objb;
            if (v337) {
              int v338 = 1;
            }
            if (v338 == 1)
            {
            }
            else
            {
              v339 = [*v1200 kperfTriggers];
              BOOL v340 = [v339 count] == 0;

              if (v340)
              {
LABEL_365:
                [*v1211 appendString:@"\n"];
                goto LABEL_366;
              }
            }
          }
          objc_msgSend(*v1211, "appendString:", @" (");
          v341 = [*v1200 kperfTriggers];
          BOOL v342 = [v341 count] == 0;

          if (v342)
          {
            if (v268 > 0.0)
            {
              saos_printf_time_scaled(*v1211, (unint64_t)(v268 * 1000000000.0));
              [*v1211 appendString:@" sampling interval"];
              BOOL v1239 = 1;
            }
            else
            {
              BOOL v1239 = 0;
            }
          }
          else
          {
            long long v1320 = 0u;
            long long v1319 = 0u;
            long long v1318 = 0u;
            long long v1317 = 0u;
            uint64_t v343 = [*v1200 kperfTriggers];
            uint64_t v344 = [v343 countByEnumeratingWithState:&v1317 objects:v1357 count:16];
            BOOL v1239 = v344 != 0;
            if (v344)
            {
              char v345 = 0;
              uint64_t v346 = *(void *)v1318;
              do
              {
                for (uint64_t k = 0; k != v344; ++k)
                {
                  if (*(void *)v1318 != v346) {
                    objc_enumerationMutation(v343);
                  }
                  v348 = *(void **)(*((void *)&v1317 + 1) + 8 * k);
                  if (v345) {
                    [*v1211 appendString:@", "];
                  }
                  uint64_t v349 = [v348 type];
                  if (v349 == 2)
                  {
                    saos_printf_time_scaled(*v1211, [v348 timerPeriodNs]);
                    [*v1211 appendString:@" sampling interval (on-cpu only)"];
                  }
                  else if (v349 == 1)
                  {
                    saos_printf_time_scaled(*v1211, [v348 timerPeriodNs]);
                    [*v1211 appendString:@" sampling interval"];
                  }
                  else
                  {
                    objc_msgSend(*v1211, "printWithFormat:", @"unknown trigger %llu", objc_msgSend(v348, "type"));
                  }
                  char v345 = 1;
                }
                uint64_t v344 = [v343 countByEnumeratingWithState:&v1317 objects:v1357 count:16];
              }
              while (v344);
            }
          }
          v350 = [*v1200 stepsNote];

          if (v350)
          {
            if (v1239) {
              [*v1211 appendString:@", "];
            }
            id v351 = *v1211;
            v352 = [*v1200 stepsNote];
            char v353 = SACopySanitizedString(v352, 1, 0);
            [v351 appendString:v353];

            if ((objb & 1) == 0) {
              goto LABEL_364;
            }
          }
          else
          {
            if ((objb & 1) == 0)
            {
LABEL_364:
              [*v1211 appendString:@""]);
              goto LABEL_365;
            }
            if (!v1239)
            {
LABEL_351:
              v354 = [*v1200 timeWhenTransitionedToSamplingAllProcesses];
              if (v354
                && ([*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllProcesses],
                    uint64_t v355 = objc_claimAutoreleasedReturnValue(),
                    int v356 = [v355 lt:*(void *)(v1254 + 40)],
                    v355,
                    v354,
                    v356))
              {
                char v357 = [*v1200 timeWhenTransitionedToSamplingAllThreads];
                if (v357
                  && ([*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllThreads],
                      v358 = objc_claimAutoreleasedReturnValue(),
                      int v359 = [v358 lt:*(void *)(v1254 + 40)],
                      v358,
                      v357,
                      v359))
                {
                  v360 = [*v1200 timeWhenTransitionedToSamplingAllProcesses];
                  uint64_t v361 = [*v1200 timeWhenTransitionedToSamplingAllThreads];
                  int v362 = [v360 ne:v361];

                  if (v362)
                  {
                    int v363 = *__error();
                    v364 = _sa_logt();
                    if (os_log_type_enabled(v364, OS_LOG_TYPE_DEBUG))
                    {
                      int v1148 = [*(id *)(v1254 + 160) targetProcessId];
                      v1149 = [*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllThreads];
                      [v1149 machAbsTimeSeconds];
                      double v1151 = v1150;
                      [*(id *)(v1254 + 32) machAbsTimeSeconds];
                      double v1153 = v1152;
                      v1154 = [*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllProcesses];
                      [v1154 machAbsTimeSeconds];
                      double v1156 = v1155;
                      [*(id *)(v1254 + 32) machAbsTimeSeconds];
                      *(_DWORD *)v1377 = 67109632;
                      *(_DWORD *)&v1377[4] = v1148;
                      *(_WORD *)&v1377[8] = 2048;
                      *(double *)&v1377[10] = v1151 - v1153;
                      *(_WORD *)&v1377[18] = 2048;
                      *(double *)&v1377[20] = v1156 - v1157;
                      _os_log_debug_impl(&dword_1BF22B000, v364, OS_LOG_TYPE_DEBUG, "[%d] Don't know how to report transitioning to non-main thread at a separate time than transitioning to all processes: threads %.3f processes %.3f", v1377, 0x1Cu);
                    }
                    *__error() = v363;
                  }
                  v365 = *(void **)(v1254 + 8);
                  double v366 = [*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllThreads];
                  [v366 machAbsTimeSeconds];
                  double v368 = v367;
                  [*(id *)(v1254 + 32) machAbsTimeSeconds];
                  [v365 printWithFormat:@"sampled only the main thread of the target process for %.2f seconds", v368 - v369];
                }
                else
                {
                  char v374 = *(void **)(v1254 + 8);
                  double v366 = [*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllProcesses];
                  [v366 machAbsTimeSeconds];
                  double v376 = v375;
                  [*(id *)(v1254 + 32) machAbsTimeSeconds];
                  [v374 printWithFormat:@"sampled only the target process for %.2f seconds", v376 - v377];
                }
              }
              else
              {
                double v370 = *(void **)(v1254 + 8);
                double v366 = [*(id *)(v1254 + 160) timeWhenTransitionedToSamplingAllThreads];
                [v366 machAbsTimeSeconds];
                double v372 = v371;
                [*(id *)(v1254 + 32) machAbsTimeSeconds];
                [v370 printWithFormat:@"sampled only main threads for %.2f seconds", v372 - v373];
              }

              goto LABEL_364;
            }
          }
          [*v1211 appendString:@", "];
          goto LABEL_351;
        }
      }
    }

    goto LABEL_317;
  }
  v300 = [NSNumber numberWithDouble:v270];
  SAJSONWriteDictionaryEntry(v299, @"duration", v300);

  if (v270 > v294)
  {
    id v301 = *v1211;
    v302 = [NSNumber numberWithDouble:v294];
    SAJSONWriteDictionaryEntry(v301, @"sampledDuration", v302);
  }
  if (v1179) {
    SAJSONWriteDictionaryEntry(*v1211, @"durationNote", v1179);
  }
  v303 = *(void **)(v1254 + 8);
  v304 = [NSNumber numberWithUnsignedInteger:*(void *)(v1254 + 64)];
  SAJSONWriteDictionaryEntry(v303, @"numSamples", v304);

  [*(id *)(v1254 + 160) attemptedSamplingInterval];
  if (v305 > 0.0)
  {
    id v306 = *v1211;
    v307 = NSNumber;
    [*v1200 attemptedSamplingInterval];
    v308 = objc_msgSend(v307, "numberWithDouble:");
    SAJSONWriteDictionaryEntry(v306, @"attemptedSamplingInterval", v308);
  }
  v309 = [*v1200 kperfTriggers];

  if (v309)
  {
    id v310 = *v1211;
    uint64_t v311 = [*v1200 kperfTriggers];
    SAJSONWriteDictionaryEntry(v310, @"kperfTriggers", v311);
  }
LABEL_366:
  [*v1200 reportTimeThreshold];
  if (v378 > 0.0)
  {
    id v379 = *v1211;
    if (v1192)
    {
      char v380 = NSNumber;
      [*v1200 reportTimeThreshold];
      uint64_t v381 = objc_msgSend(v380, "numberWithDouble:");
      SAJSONWriteDictionaryEntry(v379, @"reportTimeThreshold", v381);

      goto LABEL_373;
    }
    [*v1200 reportTimeThreshold];
    objc_msgSend(v379, "printWithFormat:", @"%-*s%.3gs\n", 18, "Report threshold: ", v382);
    goto LABEL_372;
  }
  if ((v1192 & 1) == 0) {
LABEL_372:
  }
    [*v1211 appendString:@"\n"];
LABEL_373:
  BOOL v383 = [*v1200 wrWorkflowName];

  if (v383)
  {
    id v384 = *v1211;
    uint64_t v385 = [*v1200 wrWorkflowName];
    char v386 = v385;
    if (v1192) {
      SAJSONWriteDictionaryEntry(v384, @"wrWorkflowName", v385);
    }
    else {
      [v384 printWithFormat:@"%-*s%@\n", 18, "Workflow Name: ", v385];
    }

    uint64_t v387 = [*v1200 wrError];
    v388 = v387;
    if (v387)
    {
      v389 = [v387 userInfo];
      v390 = [v389 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];
      v391 = v390;
      if (v390)
      {
        id v392 = v390;
      }
      else
      {
        id v392 = [v388 description];
      }
      id v393 = *v1211;
      if (v1192) {
        SAJSONWriteDictionaryEntry(v393, @"wrError", v392);
      }
      else {
        [v393 printWithFormat:@"%-*s%@\n", 18, "Workflow Error: ", v392];
      }
    }
    double v394 = [*v1200 wrDiagnosticName];

    if (v394)
    {
      id v395 = *v1211;
      double v396 = [*v1200 wrDiagnosticName];
      double v397 = v396;
      if (v1192) {
        SAJSONWriteDictionaryEntry(v395, @"wrDiagnosticName", v396);
      }
      else {
        [v395 printWithFormat:@"%-*s%@\n", 18, "Triggering Diagnostic: ", v396];
      }
    }
    [*v1200 wrWorkflowDuration];
    if (v398 > 0.0)
    {
      [*v1200 wrWorkflowDurationThreshold];
      if (v399 > 0.0)
      {
        [*v1200 wrWorkflowDuration];
        double v401 = v400;
        [*v1200 wrWorkflowDurationThreshold];
        if (v401 >= v402)
        {
          id v403 = *v1211;
          if (v1192)
          {
            v404 = NSNumber;
            [*v1200 wrWorkflowDuration];
            size_t v405 = objc_msgSend(v404, "numberWithDouble:");
            SAJSONWriteDictionaryEntry(v403, @"wrWorkflowDuration", v405);

            id v406 = *v1211;
            uint64_t v407 = NSNumber;
            [*v1200 wrWorkflowDurationThreshold];
            v408 = objc_msgSend(v407, "numberWithDouble:");
            SAJSONWriteDictionaryEntry(v406, @"wrWorkflowDurationThreshold", v408);
          }
          else
          {
            objc_msgSend(v403, "printWithFormat:", @"%-*sWorkflow event duration ", 18, "Trigger: ");
            int v411 = *(void **)(v1254 + 8);
            [*(id *)(v1254 + 160) wrWorkflowDuration];
            double v413 = v412;
            if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
              uint64_t v414 = 9;
            }
            else {
              uint64_t v414 = 3;
            }
            saos_printf_seconds(v411, (unint64_t)(v413 * 1000000000.0), v414);
            [*(id *)(v1254 + 8) appendString:@", above threshold "];
            int v415 = *(void **)(v1254 + 8);
            [*(id *)(v1254 + 160) wrWorkflowDurationThreshold];
            double v417 = v416;
            if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
              uint64_t v418 = 9;
            }
            else {
              uint64_t v418 = 3;
            }
            saos_printf_seconds(v415, (unint64_t)(v417 * 1000000000.0), v418);
            [*(id *)(v1254 + 8) appendString:@"\n"];
          }
        }
      }
    }
    [*v1200 wrWorkflowDurationOmittingNetworkBoundIntervals];
    if (v419 <= 0.0
      || ([*v1200 wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold], v420 <= 0.0)
      || ([*v1200 wrWorkflowDurationOmittingNetworkBoundIntervals],
          double v422 = v421,
          [*v1200 wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold],
          v422 < v423))
    {
      [*v1200 wrWorkflowTimeoutDuration];
      if (v424 <= 0.0) {
        goto LABEL_424;
      }
      if (v1192) {
        goto LABEL_409;
      }
      goto LABEL_420;
    }
    id v428 = *v1211;
    if (v1192)
    {
      v429 = NSNumber;
      [*v1200 wrWorkflowDurationOmittingNetworkBoundIntervals];
      v430 = objc_msgSend(v429, "numberWithDouble:");
      SAJSONWriteDictionaryEntry(v428, @"wrWorkflowDurationOmittingNetworkBoundIntervals", v430);

      id v431 = *v1211;
      v432 = NSNumber;
      [*v1200 wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold];
      uint64_t v433 = objc_msgSend(v432, "numberWithDouble:");
      SAJSONWriteDictionaryEntry(v431, @"wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold", v433);

      [*v1200 wrWorkflowTimeoutDuration];
      if (v434 > 0.0)
      {
LABEL_409:
        id v425 = *v1211;
        uint64_t v426 = NSNumber;
        [*v1200 wrWorkflowTimeoutDuration];
        v427 = objc_msgSend(v426, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v425, @"wrWorkflowTimeoutDuration", v427);
      }
    }
    else
    {
      objc_msgSend(v428, "printWithFormat:", @"%-*sWorkflow event duration (omitting network bound intervals) ", 18, "Trigger: ");
      uint64_t v435 = *(void **)(v1254 + 8);
      [*(id *)(v1254 + 160) wrWorkflowDurationOmittingNetworkBoundIntervals];
      double v437 = v436;
      if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
        uint64_t v438 = 9;
      }
      else {
        uint64_t v438 = 3;
      }
      saos_printf_seconds(v435, (unint64_t)(v437 * 1000000000.0), v438);
      [*(id *)(v1254 + 8) appendString:@", above threshold "];
      v439 = *(void **)(v1254 + 8);
      [*(id *)(v1254 + 160) wrWorkflowDurationOmittingNetworkBoundIntervalsThreshold];
      double v441 = v440;
      if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
        uint64_t v442 = 9;
      }
      else {
        uint64_t v442 = 3;
      }
      saos_printf_seconds(v439, (unint64_t)(v441 * 1000000000.0), v442);
      [*(id *)(v1254 + 8) appendString:@"\n"];
      [*(id *)(v1254 + 160) wrWorkflowTimeoutDuration];
      if (v443 > 0.0)
      {
LABEL_420:
        objc_msgSend(*(id *)(v1254 + 8), "printWithFormat:", @"%-*sWorkflow event timed out after", 18, "Trigger: ");
        uint64_t v444 = *(void **)(v1254 + 8);
        [*(id *)(v1254 + 160) wrWorkflowTimeoutDuration];
        double v446 = v445;
        if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
          uint64_t v447 = 9;
        }
        else {
          uint64_t v447 = 3;
        }
        saos_printf_seconds(v444, (unint64_t)(v446 * 1000000000.0), v447);
        [*(id *)(v1254 + 8) appendString:@"\n"];
      }
    }
LABEL_424:
    uint64_t v448 = [*v1200 wrSignpostName];

    if (!v448) {
      goto LABEL_435;
    }
    if (v1192)
    {
      id v449 = *v1211;
      v450 = [*v1200 wrSignpostName];
      SAJSONWriteDictionaryEntry(v449, @"wrSignpostName", v450);

      uint64_t v451 = [*v1200 wrSignpostSubsystem];

      if (v451)
      {
        id v452 = *v1211;
        uint64_t v453 = [*v1200 wrSignpostSubsystem];
        SAJSONWriteDictionaryEntry(v452, @"wrSignpostSubsystem", v453);
      }
      uint64_t v454 = [*v1200 wrSignpostCategory];

      if (!v454)
      {
LABEL_435:
        uint64_t v463 = [*v1200 wrTriggeringSignpostName];
        if (v463)
        {
          uint64_t v464 = [*v1200 wrSignpostName];
          if (v464)
          {
            char v465 = [*v1200 wrTriggeringSignpostName];
            id v466 = [*v1200 wrSignpostName];
            char v467 = [v465 isEqualToString:v466];

            if (v467) {
              goto LABEL_450;
            }
          }
          else
          {
          }
          if (!v1192)
          {
            uint64_t v475 = [*v1200 wrTriggeringSignpostName];
            char v476 = [*v1200 wrTriggeringSignpostSubsystem];
            if (v476)
            {
              uint64_t v477 = [*v1200 wrTriggeringSignpostCategory];
              BOOL v478 = v477 == 0;

              if (!v478)
              {
                v479 = [*v1200 wrTriggeringSignpostSubsystem];
                v480 = [*v1200 wrTriggeringSignpostCategory];
                uint64_t v481 = [v475 stringByAppendingFormat:@" [%@:%@]", v479, v480];

                uint64_t v475 = (void *)v481;
              }
            }
            [*v1211 printWithFormat:@"%-*s%@\n", 18, "Triggering Signpost: ", v475];
            goto LABEL_449;
          }
          id v468 = *v1211;
          v469 = [*v1200 wrTriggeringSignpostName];
          SAJSONWriteDictionaryEntry(v468, @"wrTriggeringSignpostName", v469);

          id v470 = [*v1200 wrTriggeringSignpostSubsystem];

          if (v470)
          {
            id v471 = *v1211;
            uint64_t v472 = [*v1200 wrTriggeringSignpostSubsystem];
            SAJSONWriteDictionaryEntry(v471, @"wrTriggeringSignpostSubsystem", v472);
          }
          v473 = [*v1200 wrTriggeringSignpostCategory];

          if (v473)
          {
            id v474 = *v1211;
            uint64_t v475 = [*v1200 wrTriggeringSignpostCategory];
            SAJSONWriteDictionaryEntry(v474, @"wrTriggeringSignpostCategory", v475);
LABEL_449:
          }
        }
LABEL_450:
        if ([*v1200 wrSignpostCount])
        {
          if ([*v1200 wrSignpostCountThreshold])
          {
            unint64_t v482 = [*v1200 wrSignpostCount];
            if (v482 >= [*v1200 wrSignpostCountThreshold])
            {
              id v483 = *v1211;
              if (v1192)
              {
                v484 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "wrSignpostCount"));
                SAJSONWriteDictionaryEntry(v483, @"wrSignpostCount", v484);

                id v485 = *v1211;
                v486 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "wrSignpostCountThreshold"));
                SAJSONWriteDictionaryEntry(v485, @"wrSignpostCountThreshold", v486);
              }
              else
              {
                [v483 printWithFormat:@"%-*sSignpost count %llu, above threshold %llu\n", 18, "Trigger: ", objc_msgSend(*v1200, "wrSignpostCount"), objc_msgSend(*v1200, "wrSignpostCountThreshold")];
              }
            }
          }
        }
        [*v1200 wrSignpostDurationUnion];
        if (v487 > 0.0)
        {
          [*v1200 wrSignpostDurationUnionThreshold];
          if (v488 > 0.0)
          {
            [*v1200 wrSignpostDurationUnion];
            double v490 = v489;
            [*v1200 wrSignpostDurationUnionThreshold];
            if (v490 >= v491)
            {
              id v492 = *v1211;
              if (v1192)
              {
                uint64_t v493 = NSNumber;
                [*v1200 wrSignpostDurationUnion];
                v494 = objc_msgSend(v493, "numberWithDouble:");
                SAJSONWriteDictionaryEntry(v492, @"wrSignpostDurationUnion", v494);

                id v495 = *v1211;
                v496 = NSNumber;
                [*v1200 wrSignpostDurationUnionThreshold];
                v497 = objc_msgSend(v496, "numberWithDouble:");
                SAJSONWriteDictionaryEntry(v495, @"wrSignpostDurationUnionThreshold", v497);
              }
              else
              {
                objc_msgSend(v492, "printWithFormat:", @"%-*sSignpost interval duration (union) ", 18, "Trigger: ");
                v498 = *(void **)(v1254 + 8);
                [*(id *)(v1254 + 160) wrSignpostDurationUnion];
                double v500 = v499;
                if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
                  uint64_t v501 = 9;
                }
                else {
                  uint64_t v501 = 3;
                }
                saos_printf_seconds(v498, (unint64_t)(v500 * 1000000000.0), v501);
                [*(id *)(v1254 + 8) appendString:@", above threshold "];
                id v502 = *(void **)(v1254 + 8);
                [*(id *)(v1254 + 160) wrSignpostDurationUnionThreshold];
                double v504 = v503;
                if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
                  uint64_t v505 = 9;
                }
                else {
                  uint64_t v505 = 3;
                }
                saos_printf_seconds(v502, (unint64_t)(v504 * 1000000000.0), v505);
                [*(id *)(v1254 + 8) appendString:@"\n"];
              }
            }
          }
        }
        [*v1200 wrSignpostDurationSum];
        if (v506 > 0.0)
        {
          [*v1200 wrSignpostDurationSumThreshold];
          if (v507 > 0.0)
          {
            [*v1200 wrSignpostDurationSum];
            double v509 = v508;
            [*v1200 wrSignpostDurationSumThreshold];
            if (v509 >= v510)
            {
              id v511 = *v1211;
              if (v1192)
              {
                unint64_t v512 = NSNumber;
                [*v1200 wrSignpostDurationSum];
                id v513 = objc_msgSend(v512, "numberWithDouble:");
                SAJSONWriteDictionaryEntry(v511, @"wrSignpostDurationSum", v513);

                id v514 = *v1211;
                id v515 = NSNumber;
                [*v1200 wrSignpostDurationSumThreshold];
                id v516 = objc_msgSend(v515, "numberWithDouble:");
                SAJSONWriteDictionaryEntry(v514, @"wrSignpostDurationSumThreshold", v516);
              }
              else
              {
                objc_msgSend(v511, "printWithFormat:", @"%-*sSignpost interval duration (sum) ", 18, "Trigger: ");
                v517 = *(void **)(v1254 + 8);
                [*(id *)(v1254 + 160) wrSignpostDurationSum];
                double v519 = v518;
                if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
                  uint64_t v520 = 9;
                }
                else {
                  uint64_t v520 = 3;
                }
                saos_printf_seconds(v517, (unint64_t)(v519 * 1000000000.0), v520);
                [*(id *)(v1254 + 8) appendString:@", above threshold "];
                v521 = *(void **)(v1254 + 8);
                [*(id *)(v1254 + 160) wrSignpostDurationSumThreshold];
                double v523 = v522;
                if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
                  uint64_t v524 = 9;
                }
                else {
                  uint64_t v524 = 3;
                }
                saos_printf_seconds(v521, (unint64_t)(v523 * 1000000000.0), v524);
                [*(id *)(v1254 + 8) appendString:@"\n"];
              }
            }
          }
        }
        [*v1200 wrSignpostDurationSingle];
        if (v525 > 0.0
          && ([*v1200 wrSignpostDurationSingleThreshold], v526 > 0.0)
          && ([*v1200 wrSignpostDurationSingle],
              double v528 = v527,
              [*v1200 wrSignpostDurationSingleThreshold],
              v528 >= v529))
        {
          id v586 = *v1211;
          if (v1192)
          {
            long long v587 = NSNumber;
            [*v1200 wrSignpostDurationSingle];
            v588 = objc_msgSend(v587, "numberWithDouble:");
            SAJSONWriteDictionaryEntry(v586, @"wrSignpostDurationSingle", v588);

            id v589 = *v1211;
            char v590 = NSNumber;
            [*v1200 wrSignpostDurationSingleThreshold];
            long long v591 = objc_msgSend(v590, "numberWithDouble:");
            SAJSONWriteDictionaryEntry(v589, @"wrSignpostDurationSingleThreshold", v591);

            goto LABEL_485;
          }
          objc_msgSend(v586, "printWithFormat:", @"%-*sSignpost interval duration (single) ", 18, "Trigger: ");
          v752 = *(void **)(v1254 + 8);
          [*(id *)(v1254 + 160) wrSignpostDurationSingle];
          double v754 = v753;
          if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
            uint64_t v755 = 9;
          }
          else {
            uint64_t v755 = 3;
          }
          saos_printf_seconds(v752, (unint64_t)(v754 * 1000000000.0), v755);
          [*(id *)(v1254 + 8) appendString:@", above threshold "];
          v756 = *(void **)(v1254 + 8);
          [*(id *)(v1254 + 160) wrSignpostDurationSingleThreshold];
          double v758 = v757;
          if ([*(id *)(v1254 + 16) displayDetailedWallTime]) {
            uint64_t v759 = 9;
          }
          else {
            uint64_t v759 = 3;
          }
          saos_printf_seconds(v756, (unint64_t)(v758 * 1000000000.0), v759);
          [*(id *)(v1254 + 8) appendString:@"\n"];
        }
        else if (v1192)
        {
LABEL_485:

          goto LABEL_486;
        }
        [*v1211 appendString:@"\n"];
        goto LABEL_485;
      }
      id v455 = *v1211;
      uint64_t v456 = [*v1200 wrSignpostCategory];
      SAJSONWriteDictionaryEntry(v455, @"wrSignpostCategory", v456);
    }
    else
    {
      uint64_t v456 = [*v1200 wrSignpostName];
      int v457 = [*v1200 wrSignpostSubsystem];
      if (v457)
      {
        v458 = [*v1200 wrSignpostCategory];
        BOOL v459 = v458 == 0;

        if (!v459)
        {
          uint64_t v460 = [*v1200 wrSignpostSubsystem];
          uint64_t v461 = [*v1200 wrSignpostCategory];
          uint64_t v462 = [v456 stringByAppendingFormat:@" [%@:%@]", v460, v461];

          uint64_t v456 = (void *)v462;
        }
      }
      [*v1211 printWithFormat:@"%-*s%@\n", 18, "Signpost: ", v456];
    }

    goto LABEL_435;
  }
LABEL_486:
  id v530 = [*v1200 hardwareModel];
  if (v530
    || [*v1200 numActiveCPUs]
    || [*v1200 hwPageSize]
    || [*v1200 vmPageSize])
  {
    goto LABEL_490;
  }
  id v530 = [*v1200 bootArgs];
  if (v530)
  {
    v768 = [*v1200 bootArgs];
    if ([v768 length])
    {

LABEL_490:
      goto LABEL_491;
    }
    char v1123 = [*(id *)(v1254 + 16) displayEmptyBootArgs];

    if ((v1123 & 1) == 0) {
      goto LABEL_523;
    }
  }
  else if (([*(id *)(v1254 + 16) displayEmptyBootArgs] & 1) == 0)
  {
    goto LABEL_523;
  }
LABEL_491:
  id v531 = [*v1200 hardwareModel];

  if (!v531)
  {
    if (![*v1200 numActiveCPUs]) {
      goto LABEL_500;
    }
    if (v1192) {
      goto LABEL_497;
    }
LABEL_499:
    objc_msgSend(*v1211, "printWithFormat:", @"%-*s%d\n", 18, "Active cpus: ", objc_msgSend(*v1200, "numActiveCPUs"));
    goto LABEL_500;
  }
  id v532 = *v1211;
  id v533 = [*v1200 hardwareModel];
  v534 = v533;
  if ((v1192 & 1) == 0)
  {
    id v537 = SACopySanitizedString(v533, 1, 0);
    [v532 printWithFormat:@"%-*s%@\n", 18, "Hardware model: ", v537];

    if (![*v1200 numActiveCPUs]) {
      goto LABEL_500;
    }
    goto LABEL_499;
  }
  SAJSONWriteDictionaryEntry(v532, @"hardwareModel", v533);

  if ([*v1200 numActiveCPUs])
  {
LABEL_497:
    id v535 = *v1211;
    id v536 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v1200, "numActiveCPUs"));
    SAJSONWriteDictionaryEntry(v535, @"numActiveCPUs", v536);
  }
LABEL_500:
  if (![*v1200 hwPageSize])
  {
    if (![*v1200 vmPageSize]) {
      goto LABEL_509;
    }
    if (v1192) {
      goto LABEL_506;
    }
LABEL_508:
    objc_msgSend(*v1211, "printWithFormat:", @"%-*s%d\n", 18, "VM page size: ", objc_msgSend(*v1200, "vmPageSize"));
    goto LABEL_509;
  }
  id v538 = *v1211;
  if ((v1192 & 1) == 0)
  {
    objc_msgSend(v538, "printWithFormat:", @"%-*s%d\n", 18, "HW page size: ", objc_msgSend(*v1200, "hwPageSize"));
    if (![*v1200 vmPageSize]) {
      goto LABEL_509;
    }
    goto LABEL_508;
  }
  uint64_t v539 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v1200, "hwPageSize"));
  SAJSONWriteDictionaryEntry(v538, @"hwPageSize", v539);

  if ([*v1200 vmPageSize])
  {
LABEL_506:
    id v540 = *v1211;
    v541 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*v1200, "vmPageSize"));
    SAJSONWriteDictionaryEntry(v540, @"vmPageSize", v541);
  }
LABEL_509:
  v542 = [*v1200 bootArgs];
  if (v542)
  {
    uint64_t v543 = [*v1200 bootArgs];
    if ([v543 length])
    {

LABEL_515:
      uint64_t v545 = [*v1200 bootArgs];
      uint64_t v546 = (void *)v545;
      uint64_t v547 = @"???";
      if (v545) {
        uint64_t v547 = (__CFString *)v545;
      }
      uint64_t v548 = v547;

      id v549 = *v1211;
      if (v1192)
      {
        SAJSONWriteDictionaryEntry(*v1211, @"bootArgs", v548);
      }
      else
      {
        uint64_t v550 = SACopySanitizedString(v548, 1, 0);
        [v549 printWithFormat:@"%-*s%@\n", 18, "Boot args: ", v550];
      }
      goto LABEL_521;
    }
    char v544 = [*(id *)(v1254 + 16) displayEmptyBootArgs];

    if (v544) {
      goto LABEL_515;
    }
  }
  else if ([*(id *)(v1254 + 16) displayEmptyBootArgs])
  {
    goto LABEL_515;
  }
LABEL_521:
  if ((v1192 & 1) == 0) {
    [*v1211 appendString:@"\n"];
  }
LABEL_523:
  [*v1200 lastWakeTime];
  double v552 = v551;
  uint64_t v553 = [*v1200 eventTimeRange];
  uint64_t v554 = [v553 startTime];

  if (!v554
    || ([v554 machAbsTimeSeconds], v555 == 0.0)
    && ([v554 machContTimeSeconds], v556 == 0.0)
    || (([v554 machAbsTimeSeconds], v557 == 0.0)
     || ([v554 machContTimeSeconds], v558 == 0.0))
    && ([*(id *)(v1254 + 32) machAbsTimeSeconds], v559 != 0.0)
    && ([*(id *)(v1254 + 32) machContTimeSeconds], v560 != 0.0))
  {
    id v561 = *(id *)(v1254 + 32);

    uint64_t v554 = v561;
  }
  id v1191 = v554;
  [v1191 wallTime];
  uint64_t v562 = v1191;
  id v1174 = v1191;
  if (v563 == 0.0)
  {
    id v1174 = *(id *)(v1254 + 32);

    uint64_t v562 = v1191;
  }
  [v562 machAbsTimeSeconds];
  if (v564 != 0.0
    || ([v1191 machContTimeSeconds], v565 != 0.0)
    || v552 != 0.0 && (v552 < 0.0 || ([v1174 wallTime], v585 > v552)))
  {
    [v1191 machContTimeSeconds];
    if (v566 == 0.0)
    {
      [v1191 machAbsTimeSeconds];
      if (v571 == 0.0) {
        goto LABEL_544;
      }
      if (v1192) {
        goto LABEL_541;
      }
    }
    else
    {
      id v567 = *v1211;
      if (v1192)
      {
        long long v568 = NSNumber;
        [v1191 machContTimeSeconds];
        long long v569 = objc_msgSend(v568, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v567, @"timeSinceBoot", v569);

        [v1191 machAbsTimeSeconds];
        if (v570 == 0.0)
        {
LABEL_544:
          if (v552 >= 0.0)
          {
            if (v552 == 0.0 || ([v1174 wallTime], v580 - v552 <= 0.0))
            {
              if (v1192) {
                goto LABEL_562;
              }
            }
            else
            {
              id v581 = *v1211;
              if (v1192)
              {
                v582 = NSNumber;
                [v1174 wallTime];
                long long v584 = [v582 numberWithDouble:v583 - v552];
                SAJSONWriteDictionaryEntry(v581, @"timeSinceWake", v584);

                goto LABEL_562;
              }
              [v1174 wallTime];
              objc_msgSend(v581, "printWithFormat:", @"%-*s%.0fs\n", 18, "Time Since Wake: ", v592 - v552);
            }
          }
          else
          {
            id v579 = *v1211;
            if (v1192)
            {
              SAJSONWriteDictionaryEntry(v579, @"timeSinceWake", @"n/a");
              goto LABEL_562;
            }
            objc_msgSend(v579, "printWithFormat:", @"%-*sn/a (machine hasn't slept)\n", 18, "Time Since Wake: ");
          }
          [*v1211 appendString:@"\n"];
          goto LABEL_562;
        }
LABEL_541:
        id v572 = *v1211;
        long long v573 = NSNumber;
        [v1191 machAbsTimeSeconds];
        long long v574 = objc_msgSend(v573, "numberWithDouble:");
        SAJSONWriteDictionaryEntry(v572, @"timeAwakeSinceBoot", v574);

        goto LABEL_544;
      }
      [v1191 machContTimeSeconds];
      objc_msgSend(v567, "printWithFormat:", @"%-*s%.0fs\n", 18, "Time Since Boot: ", v575);
      [v1191 machAbsTimeSeconds];
      if (v576 == 0.0) {
        goto LABEL_544;
      }
    }
    id v577 = *v1211;
    [v1191 machAbsTimeSeconds];
    objc_msgSend(v577, "printWithFormat:", @"%-*s%.0fs\n", 18, "Time Awake Since Boot: ", v578);
    goto LABEL_544;
  }
LABEL_562:
  v1186 = [*(id *)(v1254 + 160) fanSpeedClosestToTimestamp:*(void *)(v1254 + 32)];
  v1188 = [*(id *)(v1254 + 160) fanSpeedClosestToTimestamp:*(void *)(v1254 + 40)];
  if (v1188 && ([v1188 fanSpeedIsValid] & 1) != 0
    || v1186 && [v1186 fanSpeedIsValid])
  {
    int v593 = [v1186 fanSpeedIsValid];
    if (v1192)
    {
      if (v593)
      {
        id v594 = *v1211;
        v595 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1186, "fanSpeed"));
        SAJSONWriteDictionaryEntry(v594, @"startFanSpeed", v595);
      }
      if ([v1188 fanSpeedIsValid])
      {
        id v596 = *v1211;
        long long v597 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1188, "fanSpeed"));
        SAJSONWriteDictionaryEntry(v596, @"endFanSpeed", v597);
      }
    }
    else
    {
      if (v593) {
        long long v598 = v1186;
      }
      else {
        long long v598 = v1188;
      }
      uint64_t v599 = [v598 fanSpeed];
      objc_msgSend(*v1211, "printWithFormat:", @"%-*s%d rpm", 18, "Fan speed: ", v599);
      if ([v1188 fanSpeedIsValid])
      {
        uint64_t v600 = [v1188 fanSpeed];
        unsigned int v601 = (int)v600 - (int)v599 >= 0 ? v600 - v599 : (int)v599 - (int)v600;
        if (v601 >= 0x64) {
          objc_msgSend(*v1211, "printWithFormat:", @" -> %d (%+d)", v600, (v600 - v599));
        }
      }
      [*v1211 appendString:@"\n"];
    }
  }
  v1172 = +[SATimeRange timeRangeStart:*(void *)(v1254 + 32) end:*(void *)(v1254 + 40)];
  unint64_t v602 = (unint64_t)&OBJC_INSTANCE_METHODS_SATimeRangeOfSamples;
  if (![v1172 deltaMachAbsTime])
  {
    int v1225 = 0;
    goto LABEL_597;
  }
  *(void *)v1377 = 0;
  *(void *)&v1377[8] = v1377;
  *(void *)&v1377[16] = 0x2020000000;
  *(void *)&v1377[24] = 0;
  *(void *)&long long v1373 = 0;
  *((void *)&v1373 + 1) = &v1373;
  long long v1374 = 0x2020000000uLL;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v1366 = 0x2020000000;
  v1367 = 0;
  id v603 = *(id *)(v1254 + 32);
  id v604 = *(id *)(v1254 + 40);
  int v605 = *(void **)(v1254 + 160);
  v1311[0] = MEMORY[0x1E4F143A8];
  v1311[1] = 3221225472;
  v1311[2] = __30__SASamplePrinter_printHeader__block_invoke;
  v1311[3] = &unk_1E63F9248;
  id v606 = v603;
  id v1312 = v606;
  id v607 = v604;
  id v1313 = v607;
  v1314 = v1377;
  v1315 = &v1373;
  p_long long buf = &buf;
  [v605 enumerateTasks:v1311];
  if (*(void *)(*(void *)&v1377[8] + 24))
  {
    id v608 = *v1211;
    if (!v1192)
    {
      objc_msgSend(v608, "printWithFormat:", @"%-*s", 18, "Total CPU Time: ");
      unint64_t v614 = *(void *)(*(void *)&v1377[8] + 24);
      v615 = *(void **)(v1254 + 8);
      if ([*(id *)(v1254 + 16) displayDetailedCpuTime]) {
        uint64_t v616 = 9;
      }
      else {
        uint64_t v616 = 3;
      }
      saos_printf_seconds(v615, v614, v616);
      unint64_t v617 = *(void *)(*((void *)&buf + 1) + 24);
      if (v617) {
        saos_printf_cycles_instructions(*(void **)(v1254 + 8), v617, *(void *)(*((void *)&v1373 + 1) + 24), [*(id *)(v1254 + 16) displayDetailedCpuTime]);
      }
      [*v1211 appendString:@"\n"];
      int v1225 = 1;
      goto LABEL_596;
    }
    uint64_t v609 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryEntry(v608, @"totalCpuNanoseconds", v609);

    if (*(void *)(*((void *)&v1373 + 1) + 24))
    {
      id v610 = *v1211;
      v611 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      SAJSONWriteDictionaryEntry(v610, @"totalCpuInstructions", v611);
    }
    if (*(void *)(*((void *)&buf + 1) + 24))
    {
      id v612 = *v1211;
      v613 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      SAJSONWriteDictionaryEntry(v612, @"totalCpuCycles", v613);
    }
  }
  int v1225 = 0;
LABEL_596:

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v1373, 8);
  _Block_object_dispose(v1377, 8);
LABEL_597:
  v618 = [*v1200 memoryPressureEvents];
  BOOL v619 = [v618 count] == 0;

  if (!v619)
  {
    long long v1310 = 0u;
    long long v1309 = 0u;
    long long v1308 = 0u;
    long long v1307 = 0u;
    id v1240 = [*v1200 memoryPressureEvents];
    uint64_t v620 = [v1240 countByEnumeratingWithState:&v1307 objects:v1356 count:16];
    if (v620)
    {
      unint64_t v602 = 0;
      unint64_t v621 = 0;
      unint64_t v622 = 0;
      uint64_t v623 = *(void *)v1308;
      unsigned __int8 v624 = 100;
      unint64_t objc = -1;
      do
      {
        for (uint64_t m = 0; m != v620; ++m)
        {
          if (*(void *)v1308 != v623) {
            objc_enumerationMutation(v1240);
          }
          v626 = *(void **)(*((void *)&v1307 + 1) + 8 * m);
          v627 = *(void **)(v1254 + 32);
          v628 = [v626 timestamp];
          LOBYTE(v627) = [v627 gt:v628];

          if ((v627 & 1) == 0)
          {
            v629 = *(void **)(v1254 + 40);
            v630 = [v626 timestamp];
            LOBYTE(v629) = [v629 lt:v630];

            if (v629) {
              goto LABEL_612;
            }
            if ([v626 availableBytes] < objc) {
              unint64_t objc = [v626 availableBytes];
            }
            if ([v626 memoryStatusLevel] < v624) {
              unsigned __int8 v624 = [v626 memoryStatusLevel];
            }
            v622 += [v626 memoryStatusLevel];
            v602 += [v626 availableBytes];
            ++v621;
          }
        }
        uint64_t v620 = [v1240 countByEnumeratingWithState:&v1307 objects:v1356 count:16];
      }
      while (v620);
LABEL_612:

      if (!v621) {
        goto LABEL_617;
      }
      unint64_t v631 = v622 / v621;
      id v632 = *v1211;
      if (v1192)
      {
        v633 = [NSNumber numberWithUnsignedLongLong:100 - v631];
        SAJSONWriteDictionaryEntry(v632, @"averageMemoryPressure", v633);

        id v634 = *v1211;
        v635 = [NSNumber numberWithUnsignedLongLong:v602 / v621];
        SAJSONWriteDictionaryEntry(v634, @"averageAvailableBytes", v635);

        id v636 = *v1211;
        v637 = [NSNumber numberWithInt:100 - v624];
        SAJSONWriteDictionaryEntry(v636, @"highestMemoryPressure", v637);

        id v638 = *v1211;
        id v1241 = [NSNumber numberWithUnsignedLongLong:objc];
        SAJSONWriteDictionaryEntry(v638, @"minimumAvailableBytes", v1241);

        goto LABEL_617;
      }
      [v632 printWithFormat:@"%-*saverage %u%%, highest %u%%\n", 18, "Memory pressure: ", 100 - v631, 100 - v624];
      id v639 = *v1211;
      SAFormattedBytesEx(v602 / v621, 1, 0, 1, 0);
      id v1240 = (id)objc_claimAutoreleasedReturnValue();
      v640 = SAFormattedBytesEx(objc, 1, 0, 1, 0);
      [v639 printWithFormat:@"%-*saverage %@, lowest %@\n", 18, "Available memory: ", v1240, v640];

      int v1225 = 1;
    }
  }
LABEL_617:
  v641 = [*v1200 ioEvents];
  BOOL v642 = [v641 count] == 0;

  if (!v642)
  {
    id objd = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    id v1242 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    long long v1306 = 0u;
    long long v1305 = 0u;
    long long v1304 = 0u;
    long long v1303 = 0u;
    id v1230 = [*v1200 ioEvents];
    uint64_t v643 = [v1230 countByEnumeratingWithState:&v1303 objects:v1355 count:16];
    if (v643)
    {
      selfa = 0;
      unint64_t v644 = 0;
      uint64_t v645 = *(void *)v1304;
      do
      {
        uint64_t v646 = 0;
        uint64_t v647 = v1254;
        do
        {
          if (*(void *)v1304 != v645)
          {
            objc_enumerationMutation(v1230);
            uint64_t v647 = v1254;
          }
          v648 = *(void **)(*((void *)&v1303 + 1) + 8 * v646);
          v649 = *(void **)(v647 + 32);
          v650 = [v648 endTimestamp];
          LOBYTE(v649) = [v649 gt:v650];

          if ((v649 & 1) == 0)
          {
            v651 = *(void **)(v1254 + 40);
            v652 = [v648 endTimestamp];
            LOBYTE(v651) = [v651 lt:v652];

            if (v651) {
              goto LABEL_630;
            }
            uint64_t v653 = [v648 tier];
            v654 = NSNumber;
            v655 = [NSNumber numberWithUnsignedLongLong:v653];
            v656 = [objd objectForKeyedSubscript:v655];
            v657 = objc_msgSend(v654, "numberWithUnsignedLongLong:", objc_msgSend(v656, "unsignedLongLongValue") + 1);
            v658 = [NSNumber numberWithUnsignedLongLong:v653];
            [objd setObject:v657 forKeyedSubscript:v658];

            v659 = NSNumber;
            v660 = [NSNumber numberWithUnsignedLongLong:v653];
            v661 = [v1242 objectForKeyedSubscript:v660];
            v662 = objc_msgSend(v659, "numberWithUnsignedLongLong:", objc_msgSend(v648, "size") + objc_msgSend(v661, "unsignedLongLongValue"));
            unint64_t v602 = [NSNumber numberWithUnsignedLongLong:v653];
            [v1242 setObject:v662 forKeyedSubscript:v602];

            ++selfa;
            v644 += [v648 size];
          }
          uint64_t v647 = v1254;
          ++v646;
        }
        while (v643 != v646);
        uint64_t v643 = [v1230 countByEnumeratingWithState:&v1303 objects:v1355 count:16];
      }
      while (v643);
    }
    else
    {
      selfa = 0;
      unint64_t v644 = 0;
    }
LABEL_630:

    if ([objd count])
    {
      [*(id *)(v1254 + 40) machAbsTimeSeconds];
      double v664 = v663;
      [*(id *)(v1254 + 32) machAbsTimeSeconds];
      v666 = *(void **)(v1254 + 8);
      if (v1192)
      {
        v667 = [NSNumber numberWithUnsignedLongLong:selfa];
        SAJSONWriteDictionaryEntry(v666, @"ioCountTotal", v667);

        id v668 = *v1211;
        v669 = [NSNumber numberWithUnsignedLongLong:v644];
        SAJSONWriteDictionaryEntry(v668, @"ioBytesTotal", v669);

        long long v1302 = 0u;
        long long v1301 = 0u;
        long long v1300 = 0u;
        long long v1299 = 0u;
        v670 = [objd allKeys];
        id v1231 = [v670 sortedArrayUsingSelector:sel_compare_];

        uint64_t v671 = [v1231 countByEnumeratingWithState:&v1299 objects:v1354 count:16];
        if (v671)
        {
          uint64_t v672 = *(void *)v1300;
          do
          {
            for (uint64_t n = 0; n != v671; ++n)
            {
              if (*(void *)v1300 != v672) {
                objc_enumerationMutation(v1231);
              }
              v674 = *(void **)(*((void *)&v1299 + 1) + 8 * n);
              id v675 = *v1211;
              v676 = objc_msgSend([NSString alloc], "initWithFormat:", @"ioCountTier%d", objc_msgSend(v674, "intValue"));
              v677 = [objd objectForKeyedSubscript:v674];
              SAJSONWriteDictionaryEntry(v675, v676, v677);

              id v678 = *v1211;
              v679 = objc_msgSend([NSString alloc], "initWithFormat:", @"ioBytesTier%d", objc_msgSend(v674, "intValue"));
              v680 = [v1242 objectForKeyedSubscript:v674];
              SAJSONWriteDictionaryEntry(v678, v679, v680);
            }
            uint64_t v671 = [v1231 countByEnumeratingWithState:&v1299 objects:v1354 count:16];
          }
          while (v671);
        }
      }
      else
      {
        double v681 = v665;
        [v666 printWithFormat:@"I/O statistics:\n"];
        double v682 = v664 - v681;
        id v683 = *v1211;
        v684 = SAFormattedBytesEx(v644, 1, 0, 1, 0);
        if (v682 <= 0.0)
        {
          double v685 = 0.0;
          double v686 = 0.0;
        }
        else
        {
          double v685 = (double)(unint64_t)selfa / v682;
          double v686 = (double)v644 / v682;
        }
        v687 = SAFormattedBytesDouble(1, 0, v686);
        [v683 printWithFormat:@"%-*s%llu IOs (%.0f IOs/s), %@ (%@/s)\n", 18, "  Overall: ", selfa, *(void *)&v685, v684, v687];

        long long v1298 = 0u;
        long long v1297 = 0u;
        long long v1296 = 0u;
        long long v1295 = 0u;
        v688 = [objd allKeys];
        id v1231 = [v688 sortedArrayUsingSelector:sel_compare_];

        uint64_t v1226 = [v1231 countByEnumeratingWithState:&v1295 objects:v1353 count:16];
        if (v1226)
        {
          uint64_t v1221 = *(void *)v1296;
          do
          {
            for (iuint64_t i = 0; ii != v1226; ++ii)
            {
              if (*(void *)v1296 != v1221) {
                objc_enumerationMutation(v1231);
              }
              v690 = *(void **)(*((void *)&v1295 + 1) + 8 * ii);
              id v691 = *v1211;
              id v692 = objc_msgSend([NSString alloc], "initWithFormat:", @"%-*sTier%d: ", 2, ", objc_msgSend(v690, "intValue""));
              uint64_t v693 = [v692 UTF8String];
              v694 = [objd objectForKeyedSubscript:v690];
              double v695 = 0.0;
              if (v682 > 0.0)
              {
                selfa = [objd objectForKeyedSubscript:v690];
                [selfa doubleValue];
                double v695 = v696 / v682;
              }
              v697 = [v1242 objectForKeyedSubscript:v690];
              [v697 doubleValue];
              v699 = SAFormattedBytesDouble(1, 0, v698);
              double v700 = 0.0;
              if (v682 > 0.0)
              {
                unint64_t v602 = objc_msgSend(v1242, "objectForKeyedSubscript:", v690, 0.0);
                [(id)v602 doubleValue];
                double v700 = v701 / v682;
              }
              v702 = SAFormattedBytesDouble(1, 0, v700);
              [v691 printWithFormat:@"%-*s%@ IOs (%.0f IOs/s), %@ (%@/s)\n", 18, v693, v694, *(void *)&v695, v699, v702];

              if (v682 > 0.0)
              {

                v699 = v697;
                v697 = selfa;
              }
            }
            uint64_t v1226 = [v1231 countByEnumeratingWithState:&v1295 objects:v1353 count:16];
          }
          while (v1226);
        }
        int v1225 = 1;
      }
    }
  }
  v703 = [*v1200 systemAdvisoryLevels];

  if (v703)
  {
    if (v1192)
    {
      v704 = [*(id *)(v1254 + 160) systemAdvisoryLevels];
      v1294[0] = MEMORY[0x1E4F143A8];
      v1294[1] = 3221225472;
      v1294[2] = __30__SASamplePrinter_printHeader__block_invoke_2;
      v1294[3] = &unk_1E63F9270;
      v1294[4] = v1254;
      [v704 enumerateKeysAndObjectsUsingBlock:v1294];
    }
    else
    {
      id v705 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      v706 = [*v1200 systemAdvisoryLevels];
      v1292[0] = MEMORY[0x1E4F143A8];
      v1292[1] = 3221225472;
      v1292[2] = __30__SASamplePrinter_printHeader__block_invoke_3;
      v1292[3] = &unk_1E63F9270;
      id v707 = v705;
      id v1293 = v707;
      [v706 enumerateKeysAndObjectsUsingBlock:v1292];

      if ([v707 hasSuffix:@", "])
      {
        uint64_t v708 = objc_msgSend(@", ", "length");
        objc_msgSend(v707, "replaceCharactersInRange:withString:", objc_msgSend(v707, "length") - v708, v708, &stru_1F1A80538);
      }
      id v709 = *v1211;
      id v710 = v707;
      objc_msgSend(v709, "printWithFormat:", @"%-*s%s\n", 18, "Advisory levels: ", objc_msgSend(v710, "UTF8String"));

      int v1225 = 1;
    }
  }
  v711 = [*v1200 homeVolumeSpace];

  if (v711)
  {
    v712 = [*v1200 homeVolumeSpace];
    v713 = [v712 objectForKeyedSubscript:0x1F1A80998];

    v714 = [*v1200 homeVolumeSpace];
    v715 = [v714 objectForKeyedSubscript:0x1F1A809B8];

    v716 = [*v1200 homeVolumeSpace];
    v717 = [v716 objectForKeyedSubscript:0x1F1A809D8];

    if (v713)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & (v715 != 0)) == 1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v717)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v717 = 0;
            }
          }
          id v718 = *v1211;
          if (v1192)
          {
            SAJSONWriteDictionaryEntry(*v1211, @"homeVolumeTotalSpace", v713);
            SAJSONWriteDictionaryEntry(*v1211, @"homeVolumeAvailableSpace", v715);
            if (v717) {
              SAJSONWriteDictionaryEntry(*v1211, @"homeVolumeLowSpaceThreshold", v717);
            }
          }
          else
          {
            v719 = SAFormattedBytesEx([v715 unsignedLongLongValue], 1, 0, 1, 0);
            v720 = SAFormattedBytesEx([v713 unsignedLongLongValue], 1, 0, 1, 0);
            [v718 printWithFormat:@"%-*s%@/%@", 18, "Free disk space: ", v719, v720];

            if (v717)
            {
              id v721 = *v1211;
              v722 = SAFormattedBytesEx([v717 unsignedLongLongValue], 1, 0, 1, 0);
              [v721 printWithFormat:@", low space threshold %@", v722];
            }
            [*v1211 printWithFormat:@"\n"];
            int v1225 = 1;
          }
        }
      }
    }
  }
  v723 = [*v1200 powerModeTransitions];
  BOOL v724 = [v723 count] == 0;

  if (v724) {
    goto LABEL_755;
  }
  if (v1192)
  {
    id v725 = *v1211;
    v726 = [*v1200 powerModeTransitions];
    SAJSONWriteDictionaryEntry(v725, @"powerModeTransitions", v726);

    v727 = *v1200;
    if (*v1200 && v727[126]) {
      goto LABEL_758;
    }
LABEL_766:
    v787 = [v727 models];

    if (v787)
    {
      id v788 = *v1211;
      v789 = [*v1200 models];
      SAJSONWriteDictionaryEntry(v788, @"models", v789);
    }
    goto LABEL_883;
  }
  *(void *)v1377 = 0;
  long long v1288 = 0u;
  long long v1289 = 0u;
  long long v1290 = 0u;
  long long v1291 = 0u;
  v728 = [*v1200 powerModeTransitions];
  uint64_t v729 = [v728 countByEnumeratingWithState:&v1288 objects:v1352 count:16];
  if (!v729)
  {

    v734 = 0;
    goto LABEL_754;
  }
  char v730 = 0;
  uint64_t v731 = 0;
  char v732 = 0;
  char v733 = 0;
  v734 = 0;
  uint64_t v735 = *(void *)v1289;
  double v736 = 0.0;
  while (2)
  {
    for (juint64_t j = 0; jj != v729; ++jj)
    {
      if (*(void *)v1289 != v735) {
        objc_enumerationMutation(v728);
      }
      v738 = *(void **)(*((void *)&v1288 + 1) + 8 * jj);
      if ([v738 lowPowerModeChanged])
      {
        v739 = [v738 timestamp];
        v740 = v739;
        if (v739)
        {
          if ([v739 isComparable:*(void *)(v1254 + 40)]
            && [v740 gt:*(void *)(v1254 + 40)])
          {
            if (v733)
            {

LABEL_711:
              if (v731)
              {
                if (v732)
                {
                  [*(id *)(v1254 + 40) wallTime];
                  double v749 = v748;
                  [v734 wallTime];
                  double v736 = v736 + v749 - v750;
                  if (v731 == 1)
                  {
                    asprintf((char **)v1377, "(for last %.1fs of samples)", v736);
                    goto LABEL_732;
                  }
LABEL_731:
                  [*(id *)(v1254 + 40) wallTime];
                  double v762 = v761;
                  [*(id *)(v1254 + 32) wallTime];
                  asprintf((char **)v1377, "(for %.1fs out of %.1fs of samples)", v736, v762 - v763);
                }
                else
                {
                  if (v731 != 1) {
                    goto LABEL_731;
                  }
                  asprintf((char **)v1377, "(for first %.1fs of samples)", v736);
                }
LABEL_732:
                objc_msgSend(*v1211, "printWithFormat:", @"%-*sEnabled", 18, "Low Power Mode: ");
                id v760 = *v1211;
                if (!*(void *)v1377)
                {
LABEL_752:
                  [v760 appendString:@"\n"];
                  goto LABEL_753;
                }
LABEL_728:
                objc_msgSend(v760, "printWithFormat:", @" %s\n", *(void *)v1377);
LABEL_753:
                int v1225 = 1;
                goto LABEL_754;
              }
              *(void *)v1377 = 0;
              if (v732) {
                goto LABEL_732;
              }
            }
            else
            {
              char v751 = [v738 lowPowerMode];

              if ((v751 & 1) == 0) {
                goto LABEL_732;
              }
            }
LABEL_726:
            if ([*(id *)(v1254 + 16) displayDefaultPowerModes])
            {
              objc_msgSend(*v1211, "printWithFormat:", @"%-*sDisabled", 18, "Low Power Mode: ");
              id v760 = *v1211;
              if (!*(void *)v1377) {
                goto LABEL_752;
              }
              goto LABEL_728;
            }
            goto LABEL_753;
          }
          if ([v740 isComparable:*(void *)(v1254 + 32)]
            && ([v740 lt:*(void *)(v1254 + 32)] & 1) == 0)
          {
            if ((v733 & 1) != 0 && (v732 & 1) == [v738 lowPowerMode]) {
              goto LABEL_703;
            }
            if (([v738 lowPowerMode] & 1) == 0)
            {
              v741 = [v738 timestamp];
              [v741 wallTime];
              double v743 = v742;
              v744 = v734;
              if (!v734) {
                v744 = *(void **)(v1254 + 32);
              }
              [v744 wallTime];
              double v746 = v745;

              double v736 = v736 + v743 - v746;
            }
            id v747 = v740;

            ++v731;
            v734 = v747;
          }
        }
        char v732 = [v738 lowPowerMode];
LABEL_703:

        char v730 = 1;
        char v733 = 1;
        continue;
      }
    }
    uint64_t v729 = [v728 countByEnumeratingWithState:&v1288 objects:v1352 count:16];
    if (v729) {
      continue;
    }
    break;
  }

  if (v730)
  {
    if (v733) {
      goto LABEL_711;
    }
    goto LABEL_726;
  }
LABEL_754:

LABEL_755:
  v727 = *v1200;
  if (!*v1200 || (unint64_t v775 = v727[126]) == 0)
  {
    if (!v1192) {
      goto LABEL_774;
    }
    goto LABEL_766;
  }
  if (v1192)
  {
LABEL_758:
    id v776 = *v1211;
    v777 = [NSNumber numberWithUnsignedLongLong:v727[123]];
    SAJSONWriteDictionaryEntry(v776, @"numVnodesAllocated", v777);

    id v778 = *v1211;
    if (*v1200) {
      uint64_t v779 = *((void *)*v1200 + 124);
    }
    else {
      uint64_t v779 = 0;
    }
    v780 = [NSNumber numberWithUnsignedLongLong:v779];
    SAJSONWriteDictionaryEntry(v778, @"numVnodesFree", v780);

    id v781 = *v1211;
    if (*v1200) {
      uint64_t v782 = *((void *)*v1200 + 125);
    }
    else {
      uint64_t v782 = 0;
    }
    v783 = [NSNumber numberWithUnsignedLongLong:v782];
    SAJSONWriteDictionaryEntry(v781, @"numVnodesSoftLimit", v783);

    id v784 = *v1211;
    if (*v1200) {
      uint64_t v785 = *((void *)*v1200 + 126);
    }
    else {
      uint64_t v785 = 0;
    }
    v786 = [NSNumber numberWithUnsignedLongLong:v785];
    SAJSONWriteDictionaryEntry(v784, @"numVnodesHardLimit", v786);

    v727 = *v1200;
    goto LABEL_766;
  }
  unint64_t v790 = v727[124] - v727[123] + v775;
  objc_msgSend(*v1211, "printWithFormat:", @"%-*s%.2f%% (%llu/%llu"), 18, "Vnodes Available: ", (double)v790 * 100.0 / (double)v775, v790, v775;
  v791 = *v1200;
  if (*v1200)
  {
    uint64_t v792 = v791[123];
    if (v792 == v791[126]
      || ([*v1211 printWithFormat:@", %llu allocated", v792], (v791 = *v1200) != 0))
    {
      uint64_t v793 = v791[125];
      if (v793 != v791[126]) {
        [*v1211 printWithFormat:@", %llu soft limit", v793];
      }
    }
  }
  [*v1211 printWithFormat:@"\n"]);
  v727 = *v1200;
  int v1225 = 1;
LABEL_774:
  v794 = [v727 eventTimeRange];
  v795 = [v794 startTime];
  v796 = v795;
  if (!v795) {
    v796 = *(void **)(v1254 + 32);
  }
  id obje = v796;

  v797 = [*v1200 eventTimeRange];
  v798 = [v797 endTime];
  v799 = v798;
  if (!v798) {
    v799 = *(void **)(v1254 + 40);
  }
  id v1243 = v799;

  if (obje && v1243)
  {
    v800 = [*v1200 models];
    v1197 = v800;
    if (!v800)
    {
      v859 = @"%-*sUNKNOWN\n";
      goto LABEL_879;
    }
    if (![v800 count]) {
      goto LABEL_878;
    }
    long long v1287 = 0u;
    long long v1286 = 0u;
    long long v1285 = 0u;
    long long v1284 = 0u;
    id v1205 = v1197;
    id v1213 = (id)[v1205 countByEnumeratingWithState:&v1284 objects:v1351 count:16];
    if (!v1213)
    {

      goto LABEL_878;
    }
    char v1222 = 0;
    uint64_t v1208 = *(void *)v1285;
LABEL_784:
    uint64_t v801 = 0;
LABEL_785:
    if (*(void *)v1285 != v1208)
    {
      uint64_t v802 = v801;
      objc_enumerationMutation(v1205);
      uint64_t v801 = v802;
    }
    uint64_t v1217 = v801;
    selfb = *(id *)(*((void *)&v1284 + 1) + 8 * v801);
    id v1232 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v803 = [selfb loadedChanges];
    BOOL v804 = [v803 count] == 0;

    if (v804)
    {
      v1227 = 0;
      char v808 = 0;
      goto LABEL_835;
    }
    unint64_t v805 = 0;
    v806 = 0;
    char v807 = 0;
    char v808 = 0;
    while (1)
    {
      v809 = [selfb loadedChanges];
      v810 = [v809 objectAtIndexedSubscript:v805];

      int v811 = [v810 loaded];
      if (v811)
      {
        if ((v807 & 1) == 0)
        {
          v1227 = [v810 timestamp];

          if (v1227)
          {
            if ([v1227 isComparable:v1243]
              && ([v1227 gt:v1243] & 1) != 0)
            {

              goto LABEL_835;
            }
            v806 = v1227;
          }
          else
          {
            v806 = 0;
          }
        }
        v820 = [v810 loadedRequesters];
        if (v820)
        {
          v821 = [v810 loadedRequesters];
          [v1232 addObjectsFromArray:v821];
        }
        goto LABEL_820;
      }
      if (v807) {
        break;
      }
LABEL_819:
      [v1232 removeAllObjects];
      v820 = v806;
      v806 = 0;
LABEL_820:

      v826 = [selfb loadedChanges];
      unint64_t v827 = [v826 count];

      ++v805;
      char v807 = v811;
      if (v805 >= v827)
      {
        if (v811)
        {
          if ((v808 & 1) == 0)
          {
            id v828 = *v1211;
            v829 = [selfb identifier];
            [v828 printWithFormat:@"%-*s%@\n", 18, "Model: ", v829];
          }
          objc_msgSend(*v1211, "printWithFormat:", @"%-*s", 18, "  Loaded: ");
          if (v806)
          {
            *(void *)v1377 = 0;
            [obje deltaSecondsTo:v806 timeDomainPriorityList:&unk_1F1A9B118 timeDomainUsed:v1377];
            if (!*(void *)v1377) {
              double v830 = NAN;
            }
            saos_printf_seconds_sigfig(*v1211, v830);
          }
          else
          {
            [*v1211 printWithFormat:@"???"];
          }
          [*v1211 printWithFormat:@" - N/A"];
          if ([v1232 count])
          {
            v831 = [v1232 allObjects];
            v832 = (void *)[v831 mutableCopy];

            [v832 sortUsingSelector:sel_compare_];
            id v833 = *v1211;
            v834 = [v832 componentsJoinedByString:@", "];
            [v833 printWithFormat:@", requested by %@", v834];
          }
          else
          {
            [*v1211 printWithFormat:@", requested by UNKNOWN"];
          }
          [*v1211 printWithFormat:@"\n"];
          char v808 = 1;
        }
        v1227 = v806;
LABEL_835:
        long long v1283 = 0u;
        long long v1282 = 0u;
        long long v1281 = 0u;
        long long v1280 = 0u;
        v835 = [selfb executions];
        uint64_t v836 = [v835 countByEnumeratingWithState:&v1280 objects:v1350 count:16];
        if (!v836) {
          goto LABEL_870;
        }
        uint64_t v837 = *(void *)v1281;
        while (2)
        {
          uint64_t v838 = 0;
LABEL_838:
          if (*(void *)v1281 != v837) {
            objc_enumerationMutation(v835);
          }
          v839 = *(void **)(*((void *)&v1280 + 1) + 8 * v838);
          v840 = [v839 startTime];
          uint64_t v841 = [v839 endTime];
          v842 = (void *)v841;
          if (v840)
          {
            if [v840 isComparable:v1243] && (objc_msgSend(v840, "gt:", v1243))
            {

              goto LABEL_870;
            }
            *(void *)v1377 = 0;
            [obje deltaSecondsTo:v840 timeDomainPriorityList:&unk_1F1A9B130 timeDomainUsed:v1377];
            if (*(void *)v1377) {
              double v844 = v843;
            }
            else {
              double v844 = NAN;
            }
            if (v842)
            {
LABEL_847:
              *(void *)v1377 = 0;
              [obje deltaSecondsTo:v842 timeDomainPriorityList:&unk_1F1A9B148 timeDomainUsed:v1377];
              if (*(void *)v1377) {
                double v846 = v845;
              }
              else {
                double v846 = NAN;
              }
              int v847 = 1;
              if (v846 < -10.0) {
                goto LABEL_866;
              }
              goto LABEL_854;
            }
          }
          else
          {
            double v844 = NAN;
            if (v841) {
              goto LABEL_847;
            }
          }
          int v847 = 0;
          double v846 = NAN;
LABEL_854:
          if (v844 >= -10.0)
          {
            if ((v808 & 1) == 0)
            {
              id v848 = *v1211;
              v849 = [selfb identifier];
              [v848 printWithFormat:@"%-*s%@\n", 18, "Model: ", v849];
            }
            objc_msgSend(*v1211, "printWithFormat:", @"%-*s", 18, "  Executing: ");
            saos_printf_seconds_sigfig(*v1211, v844);
            [*v1211 printWithFormat:@" - "];
            id v850 = *v1211;
            if (v847) {
              saos_printf_seconds_sigfig(v850, v846);
            }
            else {
              [v850 printWithFormat:@"N/A"];
            }
            id v851 = *v1211;
            uint64_t v852 = [v839 requester];
            v853 = (void *)v852;
            if (v852) {
              v854 = (__CFString *)v852;
            }
            else {
              v854 = @"UNKNOWN";
            }
            uint64_t v855 = [v839 useCaseID];
            v856 = (void *)v855;
            v857 = @"UNKNOWN";
            if (v855) {
              v857 = (__CFString *)v855;
            }
            [v851 printWithFormat:@", requested by %@ use case %@", v854, v857];

            [*v1211 printWithFormat:@"\n"];
            char v808 = 1;
          }
LABEL_866:

          if (v836 == ++v838)
          {
            uint64_t v836 = [v835 countByEnumeratingWithState:&v1280 objects:v1350 count:16];
            if (v836) {
              continue;
            }
LABEL_870:

            v1222 |= v808;
            uint64_t v801 = v1217 + 1;
            if ((id)(v1217 + 1) == v1213)
            {
              uint64_t v858 = [v1205 countByEnumeratingWithState:&v1284 objects:v1351 count:16];
              id v1213 = (id)v858;
              if (!v858)
              {

                if (v1222)
                {
LABEL_880:

                  int v1225 = 1;
                  goto LABEL_881;
                }
LABEL_878:
                v859 = @"%-*snone\n";
LABEL_879:
                objc_msgSend(*v1211, "printWithFormat:", v859, 18, "Models: ");
                goto LABEL_880;
              }
              goto LABEL_784;
            }
            goto LABEL_785;
          }
          goto LABEL_838;
        }
      }
    }
    v812 = [v810 timestamp];
    if (v812)
    {
      *(void *)v1377 = 0;
      [obje deltaSecondsTo:v812 timeDomainPriorityList:&unk_1F1A9B0E8 timeDomainUsed:v1377];
      if (*(void *)v1377) {
        double v814 = v813;
      }
      else {
        double v814 = NAN;
      }
      if (v814 >= -10.0)
      {
        if (v808)
        {
LABEL_806:
          objc_msgSend(*v1211, "printWithFormat:", @"%-*s", 18, "  Loaded: ");
          if (v806)
          {
            *(void *)v1377 = 0;
            [obje deltaSecondsTo:v806 timeDomainPriorityList:&unk_1F1A9B100 timeDomainUsed:v1377];
            if (!*(void *)v1377) {
              double v819 = NAN;
            }
            saos_printf_seconds_sigfig(*v1211, v819);
          }
          else
          {
            [*v1211 printWithFormat:@"???"];
          }
          [*v1211 printWithFormat:@" - "];
          saos_printf_seconds_sigfig(*v1211, v814);
          if ([v1232 count])
          {
            v822 = [v1232 allObjects];
            v823 = (void *)[v822 mutableCopy];

            [v823 sortUsingSelector:sel_compare_];
            id v824 = *v1211;
            v825 = [v823 componentsJoinedByString:@", "];
            [v824 printWithFormat:@", requested by %@", v825];
          }
          else
          {
            [*v1211 printWithFormat:@", requested by UNKNOWN"];
          }
          [*v1211 printWithFormat:@"\n"];
          char v808 = 1;
          goto LABEL_818;
        }
LABEL_805:
        id v817 = *v1211;
        v818 = [selfb identifier];
        [v817 printWithFormat:@"%-*s%@\n", 18, "Model: ", v818];

        goto LABEL_806;
      }
    }
    else
    {
      v815 = [selfb loadedChanges];
      BOOL v816 = v805 < [v815 count] - 1;

      if (!v816)
      {
        double v814 = NAN;
        if (v808) {
          goto LABEL_806;
        }
        goto LABEL_805;
      }
    }
LABEL_818:

    goto LABEL_819;
  }
LABEL_881:

  if (((v1192 | v1225 ^ 1) & 1) == 0) {
    [*v1211 printWithFormat:@"\n"];
  }
LABEL_883:
  uint64_t v1276 = 0;
  v1277 = &v1276;
  uint64_t v1278 = 0x2020000000;
  char v1279 = 0;
  id v860 = *v1211;
  [*v1200 targetProcess];
  v862 = uint64_t v861 = v1254;
  if (v862)
  {
    id v863 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (-[SASamplePrinter taskHasSwallowedAnExceptionNotedByHIException:](v1254, v862))
    {
      v864 = -[SASamplePrinter displayNameForTask:]((void *)v1254, v862);
      [v863 addObject:v864];

      uint64_t v861 = v1254;
    }
    int v865 = [v862 pid];
    if (v865 >= 2)
    {
      v866 = *(void **)(v861 + 160);
      *(void *)v1377 = MEMORY[0x1E4F143A8];
      *(void *)&v1377[8] = 3221225472;
      *(void *)&v1377[16] = __60__SASamplePrinter_printProcessesWithHIESwallowedExceptions___block_invoke;
      *(void *)&v1377[24] = &unk_1E63F91A8;
      id v867 = v862;
      *(_DWORD *)&v1378[24] = v865;
      *(void *)v1378 = v867;
      *(void *)&v1378[8] = v861;
      *(void *)&v1378[16] = v863;
      [v866 enumerateTasks:v1377];
    }
    if ([v863 count])
    {
      v868 = [v863 componentsJoinedByString:@", "];
      [v860 printWithFormat:@"%-*s%@\n", 18, "Target/responsible processes that have swallowed at least one exception: ", v868];

      *((unsigned char *)v1277 + 24) = 1;
    }
    else
    {
    }
  }
  else
  {
  }
  id v1169 = *(id *)(v1254 + 8);
  BOOL v1244 = -[SASamplePrinter hasTimeIndexes](v1254);
  BOOL v1165 = [*v1200 dataStyle] != 1 && objc_msgSend(*v1200, "dataStyle") != 0;
  id objf = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v1348 = 0u;
  long long v1347 = 0u;
  long long v1346 = 0u;
  long long v1345 = 0u;
  v869 = [*v1200 tasksByPid];
  id v1194 = [v869 objectForKeyedSubscript:&unk_1F1A9AF20];

  uint64_t v1202 = [v1194 countByEnumeratingWithState:&v1345 objects:v1377 count:16];
  if (v1202)
  {
    uint64_t v1198 = *(void *)v1346;
    do
    {
      for (kuint64_t k = 0; kk != v1202; ++kk)
      {
        if (*(void *)v1346 != v1198) {
          objc_enumerationMutation(v1194);
        }
        v870 = *(void **)(*((void *)&v1345 + 1) + 8 * kk);
        long long v1341 = 0u;
        long long v1342 = 0u;
        long long v1343 = 0u;
        long long v1344 = 0u;
        v871 = [v870 threads];
        v872 = [v871 allKeys];
        id v1214 = [v872 sortedArrayUsingSelector:sel_compare_];

        uint64_t v873 = [v1214 countByEnumeratingWithState:&v1341 objects:&v1373 count:16];
        if (v873)
        {
          uint64_t v874 = *(void *)v1342;
          do
          {
            for (muint64_t m = 0; mm != v873; ++mm)
            {
              if (*(void *)v1342 != v874) {
                objc_enumerationMutation(v1214);
              }
              uint64_t v876 = *(void *)(*((void *)&v1341 + 1) + 8 * mm);
              v877 = [v870 threads];
              v878 = [v877 objectForKeyedSubscript:v876];

              v1339[0] = 0;
              v1339[1] = v1339;
              v1339[2] = 0x3032000000;
              v1339[3] = __Block_byref_object_copy__4;
              v1339[4] = __Block_byref_object_dispose__4;
              id v1340 = 0;
              v1337[0] = 0;
              v1337[1] = v1337;
              v1337[2] = 0x3032000000;
              v1337[3] = __Block_byref_object_copy__4;
              v1337[4] = __Block_byref_object_dispose__4;
              id v1338 = 0;
              uint64_t v879 = *(void *)(v1254 + 32);
              uint64_t v880 = *(void *)(v1254 + 40);
              uint64_t v881 = *(void *)(v1254 + 48);
              uint64_t v882 = *(void *)(v1254 + 56);
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              uint64_t v1366 = (uint64_t)__58__SASamplePrinter_printLaunchdThrottledProcessesToStream___block_invoke;
              v1367 = &unk_1E63F91D0;
              BOOL v1372 = v1244;
              uint64_t v1368 = v1254;
              v1370 = v1339;
              v1371 = v1337;
              id v1369 = objf;
              [v878 enumerateThreadStatesBetweenStartTime:v879 startSampleIndex:v881 endTime:v880 endSampleIndex:v882 reverseOrder:0 block:&buf];

              _Block_object_dispose(v1337, 8);
              _Block_object_dispose(v1339, 8);
            }
            uint64_t v873 = [v1214 countByEnumeratingWithState:&v1341 objects:&v1373 count:16];
          }
          while (v873);
        }
      }
      uint64_t v1202 = [v1194 countByEnumeratingWithState:&v1345 objects:v1377 count:16];
    }
    while (v1202);
  }

  if ([objf count])
  {
    [v1169 printWithFormat:@"Launchd throttled processes:\n"];
    v1333[0] = MEMORY[0x1E4F143A8];
    v1333[1] = 3221225472;
    v1333[2] = __58__SASamplePrinter_printLaunchdThrottledProcessesToStream___block_invoke_2;
    v1333[3] = &unk_1E63F91F8;
    BOOL v1335 = v1165;
    BOOL v1336 = v1244;
    v1333[4] = v1254;
    id v883 = v1169;
    id v1334 = v883;
    [objf enumerateKeysAndObjectsUsingBlock:v1333];

    *((unsigned char *)v1277 + 24) = 1;
  }
  else
  {
  }
  id v884 = *v1211;
  id v885 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v886 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v887 = *(void **)(v1254 + 160);
  *(void *)v1377 = MEMORY[0x1E4F143A8];
  *(void *)&v1377[8] = 3221225472;
  *(void *)&v1377[16] = __63__SASamplePrinter_printProcessesHittingWQThreadLimitsToStream___block_invoke;
  *(void *)&v1377[24] = &unk_1E63F9220;
  *(void *)v1378 = v1254;
  id v888 = v885;
  *(void *)&v1378[8] = v888;
  id v889 = v886;
  *(void *)&v1378[16] = v889;
  [v887 enumerateTasks:v1377];
  if ([v888 count])
  {
    uint64_t v890 = [*v1200 workQueueHardThreadLimit];
    v891 = [v888 componentsJoinedByString:@", "];
    [v884 printWithFormat:@"Processes reached dispatch thread hard limit (%u): %@\n", v890, v891];
  }
  if ([v889 count])
  {
    uint64_t v892 = [*v1200 workQueueSoftThreadLimit];
    v893 = [v889 componentsJoinedByString:@", "];
    [v884 printWithFormat:@"Processes reached dispatch thread soft limit (%u): %@\n", v892, v893];
  }
  uint64_t v894 = [v888 count];
  uint64_t v895 = [v889 count];

  if (v894 + v895) {
    *((unsigned char *)v1277 + 24) = 1;
  }
  id v896 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v897 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v898 = *(void **)(v1254 + 144);
  v1272[0] = MEMORY[0x1E4F143A8];
  v1272[1] = 3221225472;
  v1272[2] = __30__SASamplePrinter_printHeader__block_invoke_4;
  v1272[3] = &unk_1E63F9298;
  v1272[4] = v1254;
  id v1228 = v897;
  id v1273 = v1228;
  id v1215 = v896;
  id v1274 = v1215;
  v1275 = &v1276;
  [v898 enumerateKeysAndObjectsUsingBlock:v1272];
  if ([v1228 count])
  {
    id v899 = *v1211;
    uint64_t v900 = [v1228 count];
    if ([v1228 count] == 1) {
      v901 = "";
    }
    else {
      v901 = "s";
    }
    v902 = [v1228 allObjects];
    v903 = [v902 sortedArrayUsingSelector:sel_compare_];
    v904 = [v903 componentsJoinedByString:@", "];
    [v899 printWithFormat:@"%-*s%lu task%s - %@\n", 18, "Blocked by Deadlock: ", v900, v901, v904];
  }
  if ((v1192 & 1) == 0 && *((unsigned char *)v1277 + 24)) {
    [*v1211 printWithFormat:@"\n"];
  }
  if ([*v1200 appleInternalIsKnown])
  {
    if (v1192)
    {
      id v905 = *v1211;
      if ([*v1200 isAppleInternal]) {
        v906 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        v906 = (void *)MEMORY[0x1E4F1CC28];
      }
      SAJSONWriteDictionaryEntry(v905, @"isAppleInternal", v906);
    }
    else if ([*v1200 isAppleInternal])
    {
      id v907 = *v1211;
      if ([*v1200 isAppleInternal]) {
        v908 = "Yes";
      }
      else {
        v908 = "No";
      }
      objc_msgSend(v907, "printWithFormat:", @"%-*s%s\n", 18, "Apple Internal: ", v908);
    }
    if ([*v1200 isAppleInternal]
      && [*v1200 hasInternalCarryDeviceDistinction])
    {
      id v909 = *v1211;
      id v910 = *v1200;
      if (v1192)
      {
        if ([v910 isInternalCarryDevice]) {
          v911 = (void *)MEMORY[0x1E4F1CC38];
        }
        else {
          v911 = (void *)MEMORY[0x1E4F1CC28];
        }
        SAJSONWriteDictionaryEntry(v909, @"isInternalCarryDevice", v911);
      }
      else
      {
        if ([v910 isInternalCarryDevice]) {
          v912 = "Yes";
        }
        else {
          v912 = "No";
        }
        objc_msgSend(v909, "printWithFormat:", @"%-*s%s\n", 18, "Internal Carry Device: ", v912);
      }
    }
  }
  v913 = [*v1200 automatedDeviceGroup];

  if (v913)
  {
    id v914 = *v1211;
    v915 = [*v1200 automatedDeviceGroup];
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v914, @"automatedDeviceGroup", v915);
    }
    else
    {
      v916 = SACopySanitizedString(v915, 1, 0xFFuLL);
      [v914 printWithFormat:@"%-*s%@\n", 18, "Automated Device Group: ", v916];
    }
  }
  v917 = [*v1200 nonDefaultFeatureFlags];

  if (v917)
  {
    if (v1192)
    {
      v918 = [*v1200 nonDefaultFeatureFlags];
      v1271[0] = MEMORY[0x1E4F143A8];
      v1271[1] = 3221225472;
      v1271[2] = __30__SASamplePrinter_printHeader__block_invoke_5;
      v1271[3] = &unk_1E63F9270;
      v1271[4] = v1254;
      [v918 enumerateKeysAndObjectsUsingBlock:v1271];
    }
    else
    {
      id v919 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      id v920 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      v921 = [*v1200 nonDefaultFeatureFlags];
      v1268[0] = MEMORY[0x1E4F143A8];
      v1268[1] = 3221225472;
      v1268[2] = __30__SASamplePrinter_printHeader__block_invoke_6;
      v1268[3] = &unk_1E63F92C0;
      id v922 = v919;
      id v1269 = v922;
      id v923 = v920;
      id v1270 = v923;
      [v921 enumerateKeysAndObjectsUsingBlock:v1268];

      if ([v922 length])
      {
        if ([v922 hasSuffix:@", "])
        {
          uint64_t v924 = objc_msgSend(@", ", "length");
          objc_msgSend(v922, "replaceCharactersInRange:withString:", objc_msgSend(v922, "length") - v924, v924, &stru_1F1A80538);
        }
        [*v1211 printWithFormat:@"%-*s%@\n", 18, "Enabled Features: ", v922];
      }
      if ([v923 length])
      {
        if ([v923 hasSuffix:@", "])
        {
          uint64_t v925 = objc_msgSend(@", ", "length");
          objc_msgSend(v923, "replaceCharactersInRange:withString:", objc_msgSend(v923, "length") - v925, v925, &stru_1F1A80538);
        }
        [*v1211 printWithFormat:@"%-*s%@\n", 18, "Disabled Features: ", v923];
      }
    }
  }
  v926 = [*v1200 preferredLanguages];

  if (v926)
  {
    if (v1192)
    {
      id v927 = *v1211;
      v928 = [*v1200 preferredLanguages];
      SAJSONWriteDictionaryEntry(v927, @"preferredLanguages", v928);
    }
    else
    {
      v929 = [*v1200 preferredLanguages];
      v928 = v929;
      if (v929)
      {
        v930 = [v929 componentsJoinedByString:@", "];
        v931 = SACopySanitizedString(v930, 1, 0);

        [*v1211 printWithFormat:@"%-*s%@\n", 18, "Preferred User Language: ", v931];
      }
      else
      {
        int v932 = *__error();
        v933 = _sa_logt();
        if (os_log_type_enabled(v933, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v1377 = 0;
          _os_log_debug_impl(&dword_1BF22B000, v933, OS_LOG_TYPE_DEBUG, "preferredLang nil!", v1377, 2u);
        }

        v928 = 0;
        *__error() = v932;
      }
    }
  }
  v934 = [*v1200 countryCode];

  if (v934)
  {
    if (v1192)
    {
      id v935 = *v1211;
      v936 = [*v1200 countryCode];
      SAJSONWriteDictionaryEntry(v935, @"countryCode", v936);
    }
    else
    {
      v937 = [*v1200 countryCode];
      v938 = v937;
      if (v937)
      {
        v939 = [v937 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1A80538];

        v940 = [v939 stringByReplacingOccurrencesOfString:@"\t" withString:&stru_1F1A80538];

        v936 = SACopySanitizedString(v940, 1, 0);

        [*v1211 printWithFormat:@"%-*s%@\n", 18, "Country Code: ", v936];
      }
      else
      {
        int v941 = *__error();
        v942 = _sa_logt();
        if (os_log_type_enabled(v942, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v1377 = 0;
          _os_log_debug_impl(&dword_1BF22B000, v942, OS_LOG_TYPE_DEBUG, "countryCode nil!", v1377, 2u);
        }

        v936 = 0;
        *__error() = v941;
      }
    }
  }
  v943 = [*v1200 keyboardLanguages];
  BOOL v944 = [v943 count] == 0;

  if (!v944)
  {
    if (v1192)
    {
      id v945 = *v1211;
      v946 = [*v1200 keyboardLanguages];
      SAJSONWriteDictionaryEntry(v945, @"keyboardLanguages", v946);
    }
    else
    {
      v947 = [*v1200 keyboardLanguages];
      v948 = [v947 componentsJoinedByString:@", "];

      if (v948)
      {
        v946 = SACopySanitizedString(v948, 1, 0);

        [*v1211 printWithFormat:@"%-*s%@\n", 18, "Keyboards: ", v946];
      }
      else
      {
        int v949 = *__error();
        v950 = _sa_logt();
        if (os_log_type_enabled(v950, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v1377 = 0;
          _os_log_debug_impl(&dword_1BF22B000, v950, OS_LOG_TYPE_DEBUG, "keyboardLang nil!", v1377, 2u);
        }

        v946 = 0;
        *__error() = v949;
      }
    }
  }
  uint64_t v951 = v1254;
  if ([*v1200 hasHardwareKeyboardInfo])
  {
    if (v1192)
    {
      id v952 = *v1211;
      if ([*v1200 hardwareKeyboard]) {
        v953 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        v953 = (void *)MEMORY[0x1E4F1CC28];
      }
      SAJSONWriteDictionaryEntry(v952, @"hardwareKeyboard", v953);
    }
    else if ([*v1200 hardwareKeyboard])
    {
      id v954 = *v1211;
      if ([*v1200 hardwareKeyboard]) {
        v955 = "Yes";
      }
      else {
        v955 = "No";
      }
      objc_msgSend(v954, "printWithFormat:", @"%-*s%s\n", 18, "HW Keyboard: ", v955);
    }
  }
  if ([*v1200 isRootInstalled])
  {
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(*v1211, @"isRootInstalled", MEMORY[0x1E4F1CC38]);
      v956 = [*v1200 installedRootNames];
      BOOL v957 = [v956 count] == 0;

      uint64_t v951 = v1254;
      if (v957) {
        goto LABEL_1015;
      }
      id v958 = *v1211;
      v959 = [*v1200 installedRootNames];
      SAJSONWriteDictionaryEntry(v958, @"installedRootNames", v959);
    }
    else
    {
      v960 = [*v1200 installedRootNames];
      BOOL v961 = [v960 count] == 0;

      if (v961
        || ([*v1200 installedRootNames],
            v962 = objc_claimAutoreleasedReturnValue(),
            [v962 componentsJoinedByString:@", "],
            v963 = objc_claimAutoreleasedReturnValue(),
            v962,
            !v963))
      {
        v959 = 0;
      }
      else
      {
        v959 = SACopySanitizedString(v963, 1, 0);
      }
      uint64_t v964 = [v959 length];
      id v965 = *v1211;
      if (v964) {
        [v965 printWithFormat:@"%-*s%@\n", 18, "Installed Roots: ", v959];
      }
      else {
        objc_msgSend(v965, "printWithFormat:", @"%-*sYes\n", 18, "Installed Roots: ");
      }
    }

    uint64_t v951 = v1254;
  }
LABEL_1015:
  if ([*v1200 numOSCryptexFileExtents])
  {
    id v966 = *v1211;
    if (v1192)
    {
      v967 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*v1200, "numOSCryptexFileExtents"));
      SAJSONWriteDictionaryEntry(v966, @"numOSCryptexFileExtents", v967);

      uint64_t v951 = v1254;
    }
    else
    {
      objc_msgSend(v966, "printWithFormat:", @"%-*s%d\n", 18, "OS Cryptex File Extents: ", objc_msgSend(*v1200, "numOSCryptexFileExtents"));
    }
  }
  if ([*v1200 gpuRestartCount])
  {
    id v968 = *v1211;
    if (v1192)
    {
      v969 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "gpuRestartCount"));
      SAJSONWriteDictionaryEntry(v968, @"gpuRestartCount", v969);

      uint64_t v951 = v1254;
    }
    else
    {
      objc_msgSend(v968, "printWithFormat:", @"%-*s%llu\n", 18, "GPU Restart Count: ", objc_msgSend(*v1200, "gpuRestartCount"));
    }
    if ([*v1200 gpuRestartLastMachAbs])
    {
      if (v1192)
      {
        id v970 = *v1211;
        v971 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "gpuRestartLastMachAbs"));
        SAJSONWriteDictionaryEntry(v970, @"gpuRestartLastMachAbs", v971);

        uint64_t v951 = v1254;
      }
      else if ([*v1200 machTimebase] {
             && (unint64_t)[*v1200 machTimebase] >> 32
      }
             && [*(id *)(v951 + 32) machAbsTime])
      {
        unint64_t v972 = [*v1200 gpuRestartLastMachAbs];
        if (v972 >= [*(id *)(v951 + 32) machAbsTime])
        {
          uint64_t v981 = [*v1200 gpuRestartLastMachAbs];
          uint64_t v982 = [*(id *)(v951 + 32) machAbsTime];
          uint64_t v983 = [*v1200 machTimebase];
          uint64_t v984 = 0;
          if (v983)
          {
            if (HIDWORD(v983))
            {
              uint64_t v984 = v981 - v982;
              if (v983 != HIDWORD(v983)) {
                uint64_t v984 = __udivti3();
              }
            }
          }
          double v977 = (double)(unint64_t)v984 / -1000000000.0 + 0.0;
        }
        else
        {
          uint64_t v973 = [*(id *)(v951 + 32) machAbsTime];
          uint64_t v974 = [*v1200 gpuRestartLastMachAbs];
          uint64_t v975 = [*v1200 machTimebase];
          uint64_t v976 = 0;
          if (v975)
          {
            if (HIDWORD(v975))
            {
              uint64_t v976 = v973 - v974;
              if (v975 != HIDWORD(v975)) {
                uint64_t v976 = __udivti3();
              }
            }
          }
          double v977 = (double)(unint64_t)v976 / 1000000000.0;
        }
        objc_msgSend(*v1211, "printWithFormat:", @"%-*s%.0fs\n", 18, "Time Since GPU Restart: ", *(void *)&v977);
      }
    }
  }
  if ([*v1200 hasEnterprisePersona])
  {
    id v985 = *v1211;
    if (v1192)
    {
      SAJSONWriteDictionaryEntry(v985, @"hasEnterprisePersona", MEMORY[0x1E4F1CC38]);
      goto LABEL_1063;
    }
    objc_msgSend(v985, "printWithFormat:", @"%-*sYes\n", 18, "Has Enterprise Persona: ");
  }
  else if (v1192)
  {
    goto LABEL_1063;
  }
  if ([*v1200 sanitizePaths]) {
    char v986 = os_variant_has_internal_diagnostics() ^ 1;
  }
  else {
    char v986 = 0;
  }
  *(void *)v1377 = 0;
  *(void *)&v1377[8] = v1377;
  *(void *)&v1377[16] = 0x2020000000;
  v1377[24] = 0;
  v987 = [*v1200 mountStatusTracker];
  v988 = *(void **)(v951 + 32);
  v989 = *(void **)(v951 + 40);
  v1266[0] = MEMORY[0x1E4F143A8];
  v1266[1] = 3221225472;
  v1266[2] = __30__SASamplePrinter_printHeader__block_invoke_1194;
  v1266[3] = &unk_1E63F9308;
  char v1267 = v986;
  v1266[4] = v951;
  v1266[5] = v1377;
  -[SAMountStatusTracker enumerateUnresponsiveMountsBetweenStartTime:endTime:block:]((uint64_t)v987, v988, v989, v1266);

  uint64_t v951 = v1254;
  if (*(unsigned char *)(*(void *)&v1377[8] + 24)) {
    [*v1211 appendString:@"\n"];
  }
  _Block_object_dispose(v1377, 8);
  char v990 = v1192;
  if (!*(void *)(v1254 + 168)) {
    char v990 = 1;
  }
  if ((v990 & 1) == 0) {
    [*v1211 printWithFormat:@"\n%@\n\n", *(void *)(v1254 + 168)];
  }
LABEL_1063:
  if ([*(id *)(v951 + 16) printSpinSignatureStack])
  {
    v991 = *(void **)(v951 + 128);
    if (v991) {
      goto LABEL_1065;
    }
    if (([*v1200 targetProcessId] & 0x80000000) == 0)
    {
      v991 = *(void **)(v951 + 128);
      if (!v991)
      {
        id v992 = [*v1200 targetProcess];

        uint64_t v951 = v1254;
        if (!v992) {
          goto LABEL_1130;
        }
LABEL_1066:
        if (*(void *)(v951 + 128))
        {
          id v993 = *(id *)(v951 + 136);
          v994 = v993;
          if (!v993)
          {
            v996 = 0;
LABEL_1129:

            uint64_t v951 = v1254;
            goto LABEL_1130;
          }
          int v995 = [v993 isMainThread];
          goto LABEL_1069;
        }
        if ([*v1200 targetThreadId])
        {
          v998 = [v992 threads];
          v999 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "targetThreadId"));
          v994 = [v998 objectForKeyedSubscript:v999];

          if (v994)
          {
            uint64_t v951 = v1254;
            int v995 = [v994 isMainThread];
            int v997 = 1;
          }
          else
          {
            int v1000 = *__error();
            v1001 = _sa_logt();
            if (os_log_type_enabled(v1001, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v1002 = [*v1200 targetThreadId];
              *(_DWORD *)v1377 = 134217984;
              *(void *)&v1377[4] = v1002;
              _os_log_impl(&dword_1BF22B000, v1001, OS_LOG_TYPE_DEFAULT, "WARNING: Target thread 0x%llx not found", v1377, 0xCu);
            }

            int v997 = 0;
            int v995 = 0;
            v994 = 0;
            *__error() = v1000;
            uint64_t v951 = v1254;
          }
        }
        else
        {
          int v997 = 0;
          int v995 = 0;
          v994 = 0;
        }
        if ([*v1200 targetDispatchQueueId])
        {
          v1003 = [v992 dispatchQueues];
          v1004 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*v1200, "targetDispatchQueueId"));
          v996 = [v1003 objectForKeyedSubscript:v1004];

          if (v996)
          {
            int v997 = 1;
            uint64_t v951 = v1254;
            goto LABEL_1090;
          }
          int v1005 = *__error();
          v1006 = _sa_logt();
          if (os_log_type_enabled(v1006, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v1007 = [*v1200 targetDispatchQueueId];
            *(_DWORD *)v1377 = 134217984;
            *(void *)&v1377[4] = v1007;
            _os_log_impl(&dword_1BF22B000, v1006, OS_LOG_TYPE_DEFAULT, "WARNING: Target dispatch queue %llu not found", v1377, 0xCu);
          }

          uint64_t v951 = v1254;
          *__error() = v1005;
        }
        if (!v994)
        {
          uint64_t v1019 = *(void *)(v951 + 16);
          if (v1019)
          {
            uint64_t v1020 = *(void *)(v1019 + 152);
            if (v1020 == 3 || !v1020 && *(unsigned char *)(v1019 + 11))
            {
              v994 = 0;
LABEL_1069:
              v996 = 0;
              int v997 = 1;
              goto LABEL_1090;
            }
          }
          if (![*v1200 targetThreadId])
          {
            v994 = [v992 mainThread];
            if (v994)
            {
              v996 = 0;
              int v997 = 1;
              int v995 = 1;
            }
            else
            {
              int v1145 = *__error();
              v1146 = _sa_logt();
              if (os_log_type_enabled(v1146, OS_LOG_TYPE_DEFAULT))
              {
                -[SASamplePrinter displayNameForTask:]((void *)v1254, v992);
                id v1147 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v1377 = 138412290;
                *(void *)&v1377[4] = v1147;
                _os_log_impl(&dword_1BF22B000, v1146, OS_LOG_TYPE_DEFAULT, "WARNING: Signature stack requested, but target process %@ doesn't have a main thread", v1377, 0xCu);
              }
              uint64_t v951 = v1254;
              v994 = 0;
              v996 = 0;
              *__error() = v1145;
            }
LABEL_1090:
            if (((v1192 | v997 ^ 1) & 1) == 0)
            {
              [*v1211 appendString:@"\n"];
              id v1008 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              id v1009 = *v1211;
              if (v996)
              {
                if (v994)
                {
                  v1010 = -[SASamplePrinter displayNameForDispatchQueue:](v996);
                  [v1009 printWithFormat:@"Heaviest stack for dispatch queue %@ thread 0x%llx:\n", v1010, objc_msgSend(v994, "threadId")];

                  id v1011 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  *(void *)v1377 = 0;
                  *(void *)&v1377[8] = v1377;
                  *(void *)&v1377[16] = 0x2020000000;
                  v1377[24] = 1;
                  uint64_t v1012 = *(void *)(v1254 + 32);
                  uint64_t v1013 = *(void *)(v1254 + 40);
                  uint64_t v1014 = *(void *)(v1254 + 48);
                  uint64_t v1015 = *(void *)(v1254 + 56);
                  v1262[0] = MEMORY[0x1E4F143A8];
                  v1262[1] = 3221225472;
                  v1262[2] = __30__SASamplePrinter_printHeader__block_invoke_1225;
                  v1262[3] = &unk_1E63F9330;
                  id v1263 = v996;
                  id v1016 = v1011;
                  id v1264 = v1016;
                  v1265 = v1377;
                  [v994 enumerateThreadStatesBetweenStartTime:v1012 startSampleIndex:v1014 endTime:v1013 endSampleIndex:v1015 reverseOrder:0 block:v1262];
                  if ([v1016 count])
                  {
                    if (*(unsigned char *)(*(void *)&v1377[8] + 24)) {
                      v1017 = 0;
                    }
                    else {
                      v1017 = v1016;
                    }
                    -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v1254, 0, 0, v994, v1017, v992, v1008, 0, 0, 0, 0, 0, 0, 1u, 0);
                  }

                  _Block_object_dispose(v1377, 8);
                }
                else
                {
                  v1018 = -[SASamplePrinter displayNameForDispatchQueue:](v996);
                  [v1009 printWithFormat:@"Heaviest stack for dispatch queue %@:\n", v1018];

                  -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v1254, v996, 0, 0, 0, v992, v1008, 0, 0, 0, 0, 0, 0, 1u, 0);
                }
              }
              else if (v994)
              {
                if (v995) {
                  [*v1211 appendString:@"Heaviest stack for the main thread of the target process:\n"];
                }
                else {
                  objc_msgSend(v1009, "printWithFormat:", @"Heaviest stack for thread 0x%llx:\n", objc_msgSend(v994, "threadId"));
                }
                -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v951, 0, 0, v994, 0, v992, v1008, 0, 0, 0, 0, 0, 0, 1u, 0);
              }
              else
              {
                [*v1211 appendString:@"Heaviest stack for the target process:\n"];
                v1021 = [v992 threads];
                v1259[0] = MEMORY[0x1E4F143A8];
                v1259[1] = 3221225472;
                v1259[2] = __30__SASamplePrinter_printHeader__block_invoke_2_1238;
                v1259[3] = &unk_1E63F9D28;
                v1259[4] = v951;
                id v1260 = v992;
                id v1261 = v1008;
                [v1021 enumerateKeysAndObjectsUsingBlock:v1259];
              }
              if ([v1008 count])
              {
                long long v1257 = 0u;
                long long v1258 = 0u;
                long long v1255 = 0u;
                long long v1256 = 0u;
                id v1022 = v1008;
                id v1023 = (id)[v1022 countByEnumeratingWithState:&v1255 objects:v1349 count:16];
                if (v1023)
                {
                  uint64_t v1024 = *(void *)v1256;
                  while (2)
                  {
                    for (uint64_t nn = 0; nn != v1023; uint64_t nn = (char *)nn + 1)
                    {
                      if (*(void *)v1256 != v1024) {
                        objc_enumerationMutation(v1022);
                      }
                      v1026 = *(void **)(*((void *)&v1255 + 1) + 8 * (void)nn);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v1023 = v1026;
                        goto LABEL_1122;
                      }
                    }
                    id v1023 = (id)[v1022 countByEnumeratingWithState:&v1255 objects:v1349 count:16];
                    if (v1023) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_1122:

                id v1027 = *v1211;
                unint64_t v1028 = [v1023 sampleCount];
                v1029 = -[SASamplePrinter binaryImagesHitByTask:](v1254, v992);
                -[SASamplePrinter addStack:toStream:sampleCount:binariesToDisplay:primaryState:primaryMicrostackshotState:onlyHeaviestStack:](v1254, v1022, v1027, v1028, v1029, 0, 0, 1);

                uint64_t v1030 = v1254;
              }
              else
              {
                int v1031 = *__error();
                v1032 = _sa_logt();
                if (os_log_type_enabled(v1032, OS_LOG_TYPE_ERROR))
                {
                  -[SASamplePrinter displayNameForTask:]((void *)v1254, v992);
                  id v1142 = (id)objc_claimAutoreleasedReturnValue();
                  -[SASamplePrinter displayNameForDispatchQueue:](v996);
                  id v1143 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v1144 = [v994 threadId];
                  *(_DWORD *)v1377 = 138412802;
                  *(void *)&v1377[4] = v1142;
                  *(_WORD *)&v1377[12] = 2112;
                  *(void *)&v1377[14] = v1143;
                  *(_WORD *)&v1377[22] = 2048;
                  *(void *)&v1377[24] = v1144;
                  _os_log_error_impl(&dword_1BF22B000, v1032, OS_LOG_TYPE_ERROR, "No heaviest callstack for %@, dispatch queue %@, thread 0x%llx", v1377, 0x20u);
                }
                uint64_t v1030 = v1254;
                *__error() = v1031;
              }
              if (([*(id *)(v1030 + 16) displayBody] & 1) == 0)
              {
                -[SASamplePrinter printBinaryImagesForTask:](v1030, v992);
                *(unsigned char *)(v1030 + 105) = 1;
              }
            }
            goto LABEL_1129;
          }
          v994 = 0;
        }
        v996 = 0;
        goto LABEL_1090;
      }
LABEL_1065:
      id v992 = v991;
      goto LABEL_1066;
    }
  }
LABEL_1130:
  v1033 = v1200;
  if (([*(id *)(v951 + 16) hidEventDisplayOptions] & 3) == 0) {
    goto LABEL_1134;
  }
  if (([*(id *)(v951 + 16) hidEventDisplayOptions] & 2) != 0)
  {
    int v1036 = -1;
    goto LABEL_1136;
  }
  v1034 = [*v1200 targetProcess];
  v1035 = v1034;
  if (!v1034)
  {
LABEL_1134:
    v1037 = 0;
    goto LABEL_1242;
  }
  int v1036 = [v1034 pid];

  v1033 = v1200;
LABEL_1136:
  v1038 = [*v1033 hidEvents];
  id objg = (id)[v1038 mutableCopy];
  int v1223 = v1036;

  id v1040 = *v1200;
  if (*v1200) {
    id v1040 = objc_getProperty(v1040, v1039, 64, 1);
  }
  id v1041 = v1040;
  [objg addObjectsFromArray:v1041];

  [objg sortUsingComparator:&__block_literal_global_2463];
  if (![objg count])
  {
    id v1233 = 0;
    goto LABEL_1241;
  }
  char v1218 = 0;
  id v1233 = 0;
  for (unint64_t i1 = 0; i1 < [objg count]; ++i1)
  {
    v1043 = [objg objectAtIndexedSubscript:i1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v1045 = v1043;
    v1047 = v1045;
    if ((isKindOfClass & 1) == 0)
    {
      if (v1045)
      {
        id v1054 = objc_getProperty(v1045, v1046, 32, 1);
        char v1055 = 0;
        v1053 = v1047;
      }
      else
      {
LABEL_1237:
        v1053 = 0;
        id v1054 = 0;
        char v1055 = 1;
      }
      id v1056 = v1054;
      v1050 = [v1056 startTime];

      if (v1055) {
        id v1058 = 0;
      }
      else {
        id v1058 = objc_getProperty(v1053, v1057, 32, 1);
      }
      id v1059 = v1058;
      v1051 = [v1059 endTime];

      id v1245 = 0;
      if (v1055) {
        int v1052 = 0;
      }
      else {
        int v1052 = v1053[4];
      }
      goto LABEL_1150;
    }
    if (!v1045) {
      goto LABEL_1237;
    }
    v1048 = [v1045 steps];
    v1049 = [v1048 lastObject];

    if (!v1049)
    {
      v1053 = v1047;
      id v1245 = v1047;
      goto LABEL_1168;
    }
    v1050 = [v1047 hidEventTimestamp];
    v1051 = [v1049 timestamp];
    int v1052 = [v1049 pid];

    v1053 = 0;
    id v1245 = v1047;
LABEL_1150:
    v1060 = [*v1200 eventTimeRange];
    v1061 = [v1060 startTime];
    v1062 = v1061;
    if (!v1061) {
      v1062 = *(void **)(v1254 + 32);
    }
    id v1063 = v1062;

    [v1063 machAbsTimeSeconds];
    if (v1064 != 0.0)
    {
      [v1051 machAbsTimeSeconds];
      if (v1065 != 0.0)
      {
        [v1063 machAbsTimeSeconds];
        double v1067 = v1066;
        [v1051 machAbsTimeSeconds];
        if (v1067 > v1068 + 0.25) {
          goto LABEL_1158;
        }
        goto LABEL_1159;
      }
    }
    if (![v1063 isComparable:v1051] || (objc_msgSend(v1063, "gt:", v1051) & 1) != 0)
    {
LABEL_1158:

LABEL_1168:
      continue;
    }
LABEL_1159:
    v1069 = [*v1200 eventTimeRange];
    v1070 = [v1069 endTime];
    v1071 = v1070;
    if (!v1070) {
      v1071 = *(void **)(v1254 + 40);
    }
    selfc = v1071;

    if [selfc isComparable:v1050] && (objc_msgSend(selfc, "lt:", v1050))
    {
      int v1073 = 2;
      goto LABEL_1231;
    }
    if (v1223 != -1 && v1052 != v1223)
    {
      int v1073 = 4;
      goto LABEL_1231;
    }
    if (!v1233) {
      id v1233 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    }
    if (v1218) {
      [v1233 appendString:@", "];
    }
    if (v1053)
    {
      if (*(void *)(v1254 + 112))
      {
        long long v1376 = 0u;
        long long v1375 = 0u;
        long long v1374 = 0u;
        long long v1373 = 0u;
        id v1074 = objc_getProperty(v1053, v1072, 8, 1);
        uint64_t v1075 = [v1074 countByEnumeratingWithState:&v1373 objects:v1377 count:16];
        if (v1075)
        {
          uint64_t v1076 = *(void *)v1374;
          while (2)
          {
            for (uint64_t i2 = 0; i2 != v1075; ++i2)
            {
              if (*(void *)v1374 != v1076) {
                objc_enumerationMutation(v1074);
              }
              if (*(void *)(v1254 + 112) == *(void *)(*((void *)&v1373 + 1) + 8 * i2))
              {
                int v1078 = 1;
                goto LABEL_1208;
              }
            }
            uint64_t v1075 = [v1074 countByEnumeratingWithState:&v1373 objects:v1377 count:16];
            if (v1075) {
              continue;
            }
            break;
          }
        }
        int v1078 = 0;
LABEL_1208:
      }
      else
      {
        int v1078 = 0;
      }
      id v1095 = objc_getProperty(v1053, v1072, 24, 1);
      [v1233 appendString:v1095];

      id v1097 = objc_getProperty(v1053, v1096, 8, 1);
      BOOL v1098 = [v1097 count] == 0;

      if (!v1098)
      {
        id v1100 = objc_getProperty(v1053, v1099, 8, 1);
        objc_msgSend(v1233, "appendFormat:", @" (%lu HID events)", objc_msgSend(v1100, "count"));
      }
      if (v1223 == -1)
      {
        uint64_t v1101 = v1053[4];
        if (v1101 != -1)
        {
          id v1102 = objc_getProperty(v1053, v1099, 32, 1);
          v1103 = [v1102 startTime];
          v1104 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)v1254, v1101, 0, v1103);
          [v1233 appendFormat:@" to %@", v1104];
        }
      }
      if (v1078) {
        [v1233 appendString:@"*"];
      }
      goto LABEL_1230;
    }
    v1079 = [v1245 steps];
    id v1206 = [v1079 lastObject];

    int v1199 = v1245 == *(id *)(v1254 + 112);
    [v1245 thresholdToGroupSameEventType];
    double v1081 = v1080;
    uint64_t v1203 = 0;
    if (v1080 <= 0.0 || !v1206) {
      goto LABEL_1220;
    }
    if ([v1206 pid] == -1 || (objc_msgSend(v1051, "machAbsTimeSeconds"), v1082 == 0.0))
    {
      uint64_t v1203 = 0;
      goto LABEL_1220;
    }
    id v1195 = v1051;
    unint64_t v1083 = i1 + 1;
    if (i1 + 1 >= [objg count])
    {
      uint64_t v1203 = 0;
      goto LABEL_1219;
    }
    uint64_t v1203 = 0;
    unint64_t v1219 = i1;
    while (1)
    {
      v1084 = [objg objectAtIndexedSubscript:v1083];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      unint64_t v1219 = v1083;
LABEL_1205:

      unint64_t v1083 = v1219 + 1;
      if (v1219 + 1 >= [objg count]) {
        goto LABEL_1219;
      }
    }
    v1210 = [v1084 hidEventTimestamp];
    [v1210 machAbsTimeSeconds];
    if (v1085 == 0.0)
    {
      unint64_t v1219 = v1083;
LABEL_1204:

      goto LABEL_1205;
    }
    [v1195 machAbsTimeSeconds];
    double v1087 = v1086;
    [v1210 machAbsTimeSeconds];
    if (v1081 + v1087 >= v1088)
    {
      v1089 = [v1084 steps];
      v1090 = [v1089 lastObject];

      v1091 = v1090;
      if (v1090)
      {
        int v1092 = [v1090 pid];
        if (v1092 == [v1206 pid])
        {
          v1093 = *(void **)(v1254 + 112);
          uint64_t v1166 = [v1090 timestamp];
          int v1094 = v1199;
          if (v1084 == v1093) {
            int v1094 = 1;
          }
          int v1199 = v1094;

          [objg removeObjectAtIndex:v1083];
          ++v1203;
          id v1195 = (id)v1166;
        }
        else
        {
          unint64_t v1219 = v1083;
        }
        v1091 = v1090;
      }
      else
      {
        unint64_t v1219 = v1083;
      }

      goto LABEL_1204;
    }
    int v1109 = *__error();
    v1110 = _sa_logt();
    if (os_log_type_enabled(v1110, OS_LOG_TYPE_DEBUG))
    {
      [v1210 machAbsTimeSeconds];
      double v1112 = v1111;
      [v1195 machAbsTimeSeconds];
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v1112 - v1113;
      _os_log_debug_impl(&dword_1BF22B000, v1110, OS_LOG_TYPE_DEBUG, "breaking grouping due to gap of %.3fs", (uint8_t *)&buf, 0xCu);
    }

    *__error() = v1109;
LABEL_1219:

    v1199 &= 1u;
LABEL_1220:
    v1105 = [v1245 hidEventTypeString];
    [v1233 appendString:v1105];

    if (v1199) {
      [v1233 appendString:@"*"];
    }
    if (v1203) {
      objc_msgSend(v1233, "appendFormat:", @" x%llu", v1203 + 1);
    }
    if (v1223 == -1)
    {
      if (v1206) {
        uint64_t v1106 = [v1206 pid];
      }
      else {
        uint64_t v1106 = 0xFFFFFFFFLL;
      }
      v1107 = [v1206 timestamp];
      v1108 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)v1254, v1106, 0, v1107);
      [v1233 appendFormat:@" to %@", v1108];
    }
LABEL_1230:
    int v1073 = 0;
    char v1218 = 1;
LABEL_1231:

    if ((v1073 | 4) != 4) {
      break;
    }
  }
LABEL_1241:

  uint64_t v951 = v1254;
  v1033 = v1200;
  v1037 = v1233;
LABEL_1242:
  v1114 = v1037;
  if ([v1037 length])
  {
    [*v1211 printWithFormat:@"\n"];
    [*v1211 printWithFormat:@"%-*s%@\n", 18, "HID Events: ", v1114];
  }
  if (*(void *)(v951 + 112) && *v1033 && (*((unsigned char *)*v1033 + 326) & 1) != 0)
  {
    char v1115 = [*(id *)(v951 + 16) hidEventDisplayOptions];
    char v1116 = v1192;
    if ((v1115 & 4) == 0) {
      char v1116 = 1;
    }
    if ((v1116 & 1) == 0)
    {
      [*v1211 appendString:@"\nSlow HID event:\n"];
      -[SASamplePrinter printHIDEvent:](v951, *(void **)(v951 + 112));
    }
  }

  _Block_object_dispose(&v1276, 8);
}

- (BOOL)frame:(void *)a3 matchesFrame:
{
  double v5 = a2;
  double v6 = a3;
  v7 = v6;
  if (!a1)
  {
LABEL_12:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (v5 != v6)
  {
    if (v5 && *((unsigned __int8 *)v5 + 8) == *((unsigned __int8 *)v6 + 8))
    {
      if ([*(id *)(a1 + 16) aggregateFramesByOffsetIntoBinary])
      {
        unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained(v5 + 3);
        unint64_t v9 = (unint64_t)objc_loadWeakRetained(v7 + 3);
        v10 = (void *)v9;
        if (WeakRetained && v9)
        {
          v11 = [(id)WeakRetained binary];
          id v12 = [v10 binary];

          if (v11 == v12)
          {
            v13 = [(id)WeakRetained segment];
            uint64_t v14 = [v10 segment];

            if (v13 == v14)
            {
              uint64_t v15 = [v5 address];
              uint64_t v16 = v15 - [(id)WeakRetained loadAddress];
              uint64_t v17 = [v7 address];
              BOOL v18 = v16 == v17 - [v10 loadAddress];
LABEL_15:

              goto LABEL_17;
            }
          }
LABEL_14:
          BOOL v18 = 0;
          goto LABEL_15;
        }
        if (WeakRetained | v9) {
          goto LABEL_14;
        }
      }
      uint64_t v19 = [v5 address];
      BOOL v18 = v19 == [v7 address];
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)copyDescriptionsForFrame:(void *)a3 binariesToDisplay:(void *)a4 extraBinariesToDisplay:
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
    uint64_t v17 = 0;
    goto LABEL_55;
  }
  if (v7)
  {
    if (![v7 isTruncatedBacktraceFrame])
    {
      uint64_t v18 = [v7 address];
      uint64_t v19 = v7 + 3;
      id WeakRetained = objc_loadWeakRetained(v7 + 3);
      uint64_t v91 = WeakRetained;
      if (WeakRetained)
      {
        double v21 = WeakRetained;
        double v85 = v7 + 3;
        uint64_t v87 = a1;
        [WeakRetained binary];
        v23 = long double v22 = v7;
        v24 = [v21 segment];
        uint64_t v25 = [v21 loadAddress];
        double v26 = v9;
        id v27 = v8;
        uint64_t v28 = [v22 address];
        unint64_t v29 = v28 - [v21 loadAddress];
        char v30 = [v22 isKernel];
        v82 = v22;
        uint64_t v31 = [v22 exclave];
        unint64_t v32 = v29;
        id v8 = v27;
        id v9 = v26;
        v33 = -[SASamplePrinter displayedBinaryLoadInfoForBinary:segment:desiredLoadAddress:offsetIntoLoadInfo:isInKernelAddressSpace:exclave:binariesToDisplay:extraBinariesToDisplay:](v23, v24, v25, v32, v30, v31, v8, v26);
        uint64_t v34 = [v33 loadAddress];

        if (v34 != [v21 loadAddress]) {
          uint64_t v18 = v34 + v18 - [v91 loadAddress];
        }

        uint64_t v19 = v85;
        a1 = v87;
        v7 = v82;
      }
      double v35 = v7;
      id v90 = v8;
      if ([v35 isExclave])
      {
        double v36 = [v35 exclave];
        double v37 = v36;
        if (v36)
        {
          uint64_t v38 = [v36 name];

          id v39 = [NSString alloc];
          if (v38)
          {
            double v40 = [v37 name];
            uint64_t v41 = (__CFString *)[v39 initWithFormat:@"exclave %@", v40];
          }
          else
          {
            uint64_t v41 = (__CFString *)objc_msgSend(v39, "initWithFormat:", @"exclave %#18llx", objc_msgSend(v37, "identifier"));
          }
        }
        else
        {
          uint64_t v41 = @"exclave UNKNOWN";
        }
      }
      else
      {
        uint64_t v41 = 0;
      }
      v42 = [v35 instruction];
      id v43 = objc_loadWeakRetained(v19);
      if (v43)
      {
        if (v41) {
          v44 = (__CFString *)[[NSString alloc] initWithFormat:@" %@", v41];
        }
        else {
          v44 = &stru_1F1A80538;
        }
        uint64_t v86 = v42;
        uint64_t v47 = [v35 address];
        uint64_t v48 = v47 - [v43 loadAddress];
        id v84 = v43;
        v49 = [v43 binary];
        int v88 = v35;
        id v83 = v44;
        if ([*(id *)(a1 + 16) displaySymbolInformation])
        {
          uint64_t v80 = v48;
          char v50 = [v49 name];

          uint64_t v81 = v49;
          if (v50)
          {
            char v51 = [v49 name];
            v52 = SACopySanitizedString(v51, 1, 0);
          }
          else
          {
            id v62 = v44;
            id v63 = [NSString alloc];
            char v51 = [v49 uuid];
            [v51 UUIDString];
            v64 = v41;
            uint64_t v66 = v65 = a1;
            uint64_t v67 = v63;
            v44 = v62;
            uint64_t v68 = [v67 initWithFormat:@"<%@>", v66];

            a1 = v65;
            uint64_t v41 = v64;
            v52 = (void *)v68;
          }

          id v46 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          v42 = v86;
          if (v86 && v86[1])
          {
            v99[0] = MEMORY[0x1E4F143A8];
            v99[1] = 3221225472;
            v99[2] = __45__SASamplePrinter_copySymbolStringsForFrame___block_invoke;
            v99[3] = &unk_1E63F9C10;
            v99[4] = a1;
            uint64_t v100 = v86;
            uint64_t v101 = v88;
            id v54 = v52;
            id v102 = v54;
            uint64_t v105 = v80;
            unint64_t v103 = v44;
            id v46 = v46;
            id v104 = v46;
            [v100 enumerateSymbols:v99];
          }
          else
          {
            id v69 = (void *)[[NSString alloc] initWithFormat:@"??? (%@ + %llu%@)", v52, v80, v44];
            id v54 = v52;
            v70 = v41;
            uint64_t v71 = a1;
            id v72 = (void *)[v69 copy];
            [v46 addObject:v72];

            a1 = v71;
            uint64_t v41 = v70;
            v42 = v86;
          }
          v49 = v81;
        }
        else
        {
          id v53 = [NSString alloc];
          id v54 = [v49 uuid];
          uint64_t v55 = [v54 UUIDString];
          uint64_t v56 = v44;
          id v57 = (void *)v55;
          uint64_t v58 = [v53 initWithFormat:@"%@ + %llu%@", v55, v48, v56];
          uint64_t v59 = v41;
          uint64_t v60 = a1;
          uint64_t v61 = (void *)v58;
          v99[0] = v58;
          id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];

          a1 = v60;
          uint64_t v41 = v59;

          v42 = v86;
        }

        double v35 = v88;
        id v43 = v84;
      }
      else if (v41)
      {
        v45 = (void *)[[NSString alloc] initWithFormat:@"??? (%@)", v41];
        v99[0] = v45;
        id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
      }
      else
      {
        v99[0] = @"???";
        id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
      }

      if ([*(id *)(a1 + 16) displayFrameAddresses])
      {
        id v89 = v9;
        v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v46, "count"));
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v14 = v46;
        uint64_t v74 = [v14 countByEnumeratingWithState:&v92 objects:v96 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = *(void *)v93;
          do
          {
            for (uint64_t i = 0; i != v75; ++i)
            {
              if (*(void *)v93 != v76) {
                objc_enumerationMutation(v14);
              }
              v78 = (void *)[[NSString alloc] initWithFormat:@"%@ [0x%llx]", *(void *)(*((void *)&v92 + 1) + 8 * i), v18];
              [v73 addObject:v78];
            }
            uint64_t v75 = [v14 countByEnumeratingWithState:&v92 objects:v96 count:16];
          }
          while (v75);
        }

        uint64_t v17 = (void *)[v73 copy];
        id v9 = v89;
        id v8 = v90;
      }
      else
      {
        id v14 = v46;
        uint64_t v17 = v14;
        id v8 = v90;
      }
      v11 = v91;
      goto LABEL_53;
    }
    if ([v7 isKernel])
    {
      if ([v7 isExclave])
      {
        v10 = [v7 exclave];
        v11 = v10;
        if (!v10)
        {
          uint64_t v17 = &unk_1F1A9B190;
          goto LABEL_54;
        }
        id v12 = [v10 name];

        id v13 = [NSString alloc];
        if (v12)
        {
          id v14 = [v11 name];
          id v15 = v9;
          uint64_t v16 = (void *)[v13 initWithFormat:@"<exclave %@>", v14];
          id v98 = v16;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];

          id v9 = v15;
        }
        else
        {
          id v14 = (id)objc_msgSend(v13, "initWithFormat:", @"<exclave 0x%llx>", objc_msgSend(v11, "identifier"));
          id v97 = v14;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
        }
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      uint64_t v17 = &unk_1F1A9B1A8;
    }
    else
    {
      uint64_t v17 = &unk_1F1A9B1C0;
    }
  }
  else
  {
    uint64_t v17 = &unk_1F1A9B178;
  }
LABEL_55:

  return v17;
}

- (BOOL)hasTimeIndexes
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 160) sampleTimestamps];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (uint64_t)shouldPrintTimeOutsideSamplingRange:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2 < 0.0)
  {
    int v6 = *__error();
    v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      double v15 = a2;
      _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "negative timeOutsideSamplingRange %f", buf, 0xCu);
    }

    *__error() = v6;
    _SASetCrashLogMessage(12583, "negative timeOutsideSamplingRange %f", v8, v9, v10, v11, v12, v13, SLOBYTE(a2));
    _os_crash();
    __break(1u);
  }
  [*(id *)(a1 + 160) attemptedSamplingInterval];
  BOOL v4 = v3 != 0.0;
  if (v3 >= a2) {
    BOOL v4 = 0;
  }
  return a2 > 0.2 || v4;
}

- (void)setIncidentUUID:(id)a3
{
}

- (SASampleStore)sampleStore
{
  return (SASampleStore *)objc_getProperty(self, a2, 160, 1);
}

- (id)indexForBinary:(uint64_t)a1
{
  if (a1)
  {
    BOOL v2 = [*(id *)(a1 + 80) objectForKeyedSubscript:a2];
    if (v2)
    {
      double v3 = [MEMORY[0x1E4F1CA98] null];
      BOOL v4 = [v2 objectForKeyedSubscript:v3];

      if (!v4)
      {
        double v5 = [v2 allValues];
        BOOL v4 = [v5 firstObject];
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (void)setOptions:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    double v5 = (SASamplePrintOptions *)v4;
  }
  else {
    double v5 = objc_alloc_init(SASamplePrintOptions);
  }
  options = self->_options;
  self->_options = v5;
}

- (SASamplePrintOptions)options
{
  return self->_options;
}

- (SASamplePrinter)initWithSampleStore:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SASamplePrinter;
  int v6 = [(SASamplePrinter *)&v19 init];
  if (v6)
  {
    id v7 = objc_alloc_init(SASamplePrintOptions);
    options = v6->_options;
    v6->_options = v7;

    objc_storeStrong((id *)&v6->_sampleStore, a3);
    id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = [v5 tasksByPid];
    uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
    binaryImagesHit = v6->_binaryImagesHit;
    v6->_binaryImagesHit = (NSMutableDictionary *)v11;

    uint64_t v13 = [(SASampleStore *)v6->_sampleStore startTime];
    reportStartTime = v6->_reportStartTime;
    v6->_reportStartTime = (SATimestamp *)v13;

    uint64_t v15 = [(SASampleStore *)v6->_sampleStore endTime];
    reportEndTime = v6->_reportEndTime;
    v6->_reportEndTime = (SATimestamp *)v15;

    if (-[SASamplePrinter hasTimeIndexes]((uint64_t)v6))
    {
      v6->_reportStartSampleIndex = 0;
      uint64_t v17 = [(SASampleStore *)v6->_sampleStore sampleTimestamps];
      v6->_reportEndSampleIndex = [v17 count] - 1;
    }
    else
    {
      *(int64x2_t *)&v6->_reportStartSampleIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
    v6->_numSamples = [(SASampleStore *)v6->_sampleStore numSamples];
  }

  return v6;
}

- (double)timeSpentAsleepBetweenStartTimestamp:(void *)a3 endTimestamp:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  double v8 = 0.0;
  if (a1)
  {
    [v6 machContTimeSeconds];
    if (v9 > 0.0)
    {
      [v5 machContTimeSeconds];
      if (v10 > 0.0)
      {
        [v7 machContTimeSeconds];
        double v12 = v11;
        [v5 machContTimeSeconds];
        goto LABEL_8;
      }
    }
    [v7 wallTime];
    if (v14 > 0.0)
    {
      [v5 wallTime];
      if (v15 > 0.0)
      {
        [v7 wallTime];
        double v12 = v16;
        [v5 wallTime];
LABEL_8:
        double v17 = v12 - v13;
        [v7 machAbsTimeSeconds];
        double v19 = v18;
        [v5 machAbsTimeSeconds];
        double v21 = v17 - (v19 - v20);
        if (v21 >= 1.0) {
          double v8 = v21;
        }
        else {
          double v8 = 0.0;
        }
      }
    }
  }

  return v8;
}

- (uint64_t)complainAboutSamplingGapBetweenStartTimestamp:(void *)a3 endTimestamp:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1) {
    a1 = *(double *)(a1 + 88) > 0.0
  }
      && ([v6 machAbsTimeSeconds],
          double v9 = v8,
          [v5 machAbsTimeSeconds],
          v9 - v10 >= *(double *)(a1 + 88) * 10.0);

  return a1;
}

void __37__SASamplePrinter_calculateTimeJumps__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6
    && (-[SASamplePrinter timeSpentAsleepBetweenStartTimestamp:endTimestamp:](*(void *)(a1 + 32), v6, v5) > 0.0
     || -[SASamplePrinter complainAboutSamplingGapBetweenStartTimestamp:endTimestamp:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5)))
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 96);
    double v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v7 addObject:v8];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (void)updateIndexes
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  double v3 = (id *)(a1 + 32);
  BOOL v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40) && (objc_msgSend(v2, "le:") & 1) == 0)
  {
    int v27 = *__error();
    uint64_t v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [*(id *)(a1 + 32) debugDescription];
      uint64_t v30 = [v29 UTF8String];
      id v31 = [*(id *)(a1 + 40) debugDescription];
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = [v31 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "reportStartTime %s > reportEndTime %s", buf, 0x16u);
    }
    *__error() = v27;
    id v32 = [*(id *)(a1 + 32) debugDescription];
    char v33 = [v32 UTF8String];
    id v34 = [*(id *)(a1 + 40) debugDescription];
    [v34 UTF8String];
    _SASetCrashLogMessage(1530, "reportStartTime %s > reportEndTime %s", v35, v36, v37, v38, v39, v40, v33);

    _os_crash();
    __break(1u);
  }
  if (!-[SASamplePrinter hasTimeIndexes](a1))
  {
    *(int64x2_t *)(a1 + 48) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy__4;
    char v50 = __Block_byref_object_dispose__4;
    id v51 = 0;
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__4;
    id v46 = __Block_byref_object_dispose__4;
    id v47 = 0;
    *(void *)(a1 + 64) = 0;
    double v10 = *(void **)(a1 + 160);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __32__SASamplePrinter_updateIndexes__block_invoke;
    v41[3] = &unk_1E63F9158;
    v41[4] = a1;
    v41[5] = buf;
    v41[6] = &v42;
    [v10 enumerateTasks:v41];
    double v11 = *(void **)(*(void *)&buf[8] + 40);
    if (v11) {
      objc_storeStrong(v3, v11);
    }
    double v12 = (void *)v43[5];
    if (v12) {
      objc_storeStrong((id *)(a1 + 40), v12);
    }
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  id v4 = [*(id *)(a1 + 160) startTime];
  id v5 = [*(id *)(a1 + 160) endTime];
  id v6 = *(void **)(a1 + 32);
  if (!v6 || !v4 || ![v6 gt:v4])
  {
    *(void *)(a1 + 48) = 0;
    double v8 = [*(id *)(a1 + 160) sampleTimestamps];
    uint64_t v9 = [v8 firstObject];
    goto LABEL_17;
  }
  uint64_t v7 = [*(id *)(a1 + 160) indexOfFirstSampleOnOrAfterTimestamp:*(void *)(a1 + 32)];
  *(void *)(a1 + 48) = v7;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = [*(id *)(a1 + 160) sampleTimestamps];
    uint64_t v9 = [v8 objectAtIndexedSubscript:*(void *)(a1 + 48)];
LABEL_17:
    id v13 = *v3;
    id *v3 = (id)v9;
  }
  double v14 = *(void **)(a1 + 40);
  if (!v14 || !v5 || ![v14 lt:v5])
  {
    double v18 = [*(id *)(a1 + 160) sampleTimestamps];
    *(void *)(a1 + 56) = [v18 count] - 1;

    double v16 = [*(id *)(a1 + 160) sampleTimestamps];
    uint64_t v17 = [v16 lastObject];
    goto LABEL_24;
  }
  uint64_t v15 = [*(id *)(a1 + 160) indexOfLastSampleOnOrBeforeTimestamp:*(void *)(a1 + 40)];
  *(void *)(a1 + 56) = v15;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v16 = [*(id *)(a1 + 160) sampleTimestamps];
    uint64_t v17 = [v16 objectAtIndexedSubscript:*(void *)(a1 + 56)];
LABEL_24:
    double v19 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v17;
  }
  unint64_t v20 = *(void *)(a1 + 48);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v21 = 0;
  }
  else
  {
    unint64_t v21 = 0;
    unint64_t v22 = *(void *)(a1 + 56);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v23 = v22 >= v20;
      unint64_t v24 = v22 - v20;
      if (v23) {
        unint64_t v21 = v24 + 1;
      }
    }
  }
  *(void *)(a1 + 64) = v21;

LABEL_32:
  if (*v3 && *(void *)(a1 + 40))
  {
    if (objc_msgSend(*v3, "le:"))
    {
      uint64_t v25 = *(void *)(a1 + 160);
      double v26 = +[SATimeRange timeRangeStart:*(void *)(a1 + 32) end:*(void *)(a1 + 40)];
      -[SASampleStore findTargetProcessInTimeRange:](v25, v26);
    }
  }
}

void __32__SASamplePrinter_updateIndexes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 taskStates];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v13 = [v3 threads];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__SASamplePrinter_updateIndexes__block_invoke_2;
    v21[3] = &unk_1E63F9130;
    long long v22 = *(_OWORD *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 48);
    [v13 enumerateKeysAndObjectsUsingBlock:v21];
    goto LABEL_18;
  }
  uint64_t v6 = [v3 indexOfFirstTaskStateOnOrAfterTime:*(void *)(*(void *)(a1 + 32) + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    unint64_t v8 = [v3 indexOfLastTaskStateOnOrBeforeTime:*(void *)(*(void *)(a1 + 32) + 40) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 >= v7)
    {
      unint64_t v10 = v8;
      *(void *)(*(void *)(a1 + 32) + 64) += v8 - v7 + 1;
      double v11 = [v3 taskStates];
      double v12 = [v11 objectAtIndexedSubscript:v7];
      id v13 = [v12 startTimestamp];

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      if (v15)
      {
        if (![v15 gt:v13]) {
          goto LABEL_12;
        }
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      objc_storeStrong((id *)(v14 + 40), v13);
LABEL_12:
      double v16 = [v3 taskStates];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v10];
      double v18 = [v17 endTimestamp];

      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v20 = *(void **)(v19 + 40);
      if (v20)
      {
        if (![v20 lt:v18])
        {
LABEL_16:

LABEL_18:
          goto LABEL_19;
        }
        uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      }
      objc_storeStrong((id *)(v19 + 40), v18);
      goto LABEL_16;
    }
  }
LABEL_19:
}

void __32__SASamplePrinter_updateIndexes__block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  uint64_t v4 = [v19 indexOfFirstThreadStateOnOrAfterTime:*(void *)(a1[4] + 32) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_16;
  }
  unint64_t v5 = v4;
  unint64_t v6 = [v19 indexOfLastThreadStateOnOrBeforeTime:*(void *)(a1[4] + 40) sampleIndex:0x7FFFFFFFFFFFFFFFLL];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 < v5) {
    goto LABEL_16;
  }
  unint64_t v8 = v6;
  *(void *)(a1[4] + 64) += v6 - v5 + 1;
  uint64_t v9 = [v19 threadStates];
  unint64_t v10 = [v9 objectAtIndexedSubscript:v5];
  double v11 = [v10 startTimestamp];

  uint64_t v12 = *(void *)(a1[5] + 8);
  id v13 = *(void **)(v12 + 40);
  if (v13)
  {
    if (![v13 gt:v11]) {
      goto LABEL_11;
    }
    uint64_t v12 = *(void *)(a1[5] + 8);
  }
  objc_storeStrong((id *)(v12 + 40), v11);
LABEL_11:
  uint64_t v14 = [v19 threadStates];
  uint64_t v15 = [v14 objectAtIndexedSubscript:v8];
  double v16 = [v15 endTimestamp];

  uint64_t v17 = *(void *)(a1[6] + 8);
  double v18 = *(void **)(v17 + 40);
  if (!v18)
  {
LABEL_14:
    objc_storeStrong((id *)(v17 + 40), v16);
    goto LABEL_15;
  }
  if ([v18 lt:v16])
  {
    uint64_t v17 = *(void *)(a1[6] + 8);
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
}

- (void)filterToTimestampRangeStart:(id)a3 end:(id)a4
{
  unint64_t v6 = (SATimestamp *)a3;
  unint64_t v7 = (SATimestamp *)a4;
  self->_hasFilterApplied = 1;
  reportStartTime = self->_reportStartTime;
  self->_reportStartTime = v6;
  uint64_t v9 = v6;

  reportEndTime = self->_reportEndTime;
  self->_reportEndTime = v7;

  -[SASamplePrinter updateIndexes]((uint64_t)self);
}

- (void)filterToMachAbsTimeRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  self->_hasFilterApplied = 1;
  if (a3)
  {
    unint64_t v6 = +[SATimestamp timestampWithMachAbsTime:a3 machContTime:0 wallTime:[(SASampleStore *)self->_sampleStore machTimebase] machTimebase:0.0];
    reportStartTime = self->_reportStartTime;
    self->_reportStartTime = v6;
  }
  if (a4)
  {
    unint64_t v8 = +[SATimestamp timestampWithMachAbsTime:a4 machContTime:0 wallTime:[(SASampleStore *)self->_sampleStore machTimebase] machTimebase:0.0];
    reportEndTime = self->_reportEndTime;
    self->_reportEndTime = v8;
  }
  -[SASamplePrinter updateIndexes]((uint64_t)self);
}

- (void)filterToWallTimeRangeStart:(double)a3 end:(double)a4
{
  self->_hasFilterApplied = 1;
  if (a3 != 0.0)
  {
    unint64_t v6 = +[SATimestamp timestampWithMachAbsTime:0 machContTime:0 wallTime:[(SASampleStore *)self->_sampleStore machTimebase] machTimebase:a3];
    reportStartTime = self->_reportStartTime;
    self->_reportStartTime = v6;
  }
  if (a4 != 0.0)
  {
    unint64_t v8 = +[SATimestamp timestampWithMachAbsTime:0 machContTime:0 wallTime:[(SASampleStore *)self->_sampleStore machTimebase] machTimebase:a4];
    reportEndTime = self->_reportEndTime;
    self->_reportEndTime = v8;
  }
  -[SASamplePrinter updateIndexes]((uint64_t)self);
}

- (void)filterToDisplayTimeIndexStart:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a4 && a4 < a3)
  {
    int v7 = *__error();
    unint64_t v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v28 = a3;
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "Passed invalid sample index range %lu-%lu", buf, 0x16u);
    }

    *__error() = v7;
    return;
  }
  if (-[SASamplePrinter hasTimeIndexes]((uint64_t)self))
  {
    self->_hasFilterApplied = 1;
    if (a3)
    {
      if (-[SASamplePrinter hasTimeIndexes]((uint64_t)self)) {
        unint64_t v9 = a3 - 1;
      }
      else {
        unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (a4) {
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v9 = 0;
      if (a4)
      {
LABEL_12:
        if (-[SASamplePrinter hasTimeIndexes]((uint64_t)self)) {
          unint64_t v10 = a4 - 1;
        }
        else {
          unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_20:
        uint64_t v14 = [(SASampleStore *)self->_sampleStore sampleTimestamps];
        unint64_t v15 = [v14 count];

        if (v10 >= v15)
        {
          int v23 = *__error();
          unint64_t v24 = _sa_logt();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = [(SASampleStore *)self->_sampleStore sampleTimestamps];
            *(_DWORD *)long long buf = 134218496;
            unint64_t v28 = a3;
            __int16 v29 = 2048;
            unint64_t v30 = a4;
            __int16 v31 = 2048;
            uint64_t v32 = [v25 count];
            _os_log_error_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_ERROR, "Requested sample index range %lu-%lu outside valid range 1-%lu", buf, 0x20u);
          }
          *__error() = v23;
        }
        else
        {
          self->_reportStartSampleIndex = v9;
          double v16 = [(SASampleStore *)self->_sampleStore sampleTimestamps];
          uint64_t v17 = [v16 objectAtIndexedSubscript:v9];
          reportStartTime = self->_reportStartTime;
          self->_reportStartTime = v17;

          self->_reportEndSampleIndex = v10;
          id v19 = [(SASampleStore *)self->_sampleStore sampleTimestamps];
          unint64_t v20 = [v19 objectAtIndexedSubscript:v10];
          reportEndTime = self->_reportEndTime;
          self->_reportEndTime = v20;

          self->_numSamples = self->_reportEndSampleIndex - self->_reportStartSampleIndex + 1;
          if (self->_reportStartTime && self->_reportEndTime)
          {
            sampleStore = self->_sampleStore;
            +[SATimeRange timeRangeStart:end:](SATimeRange, "timeRangeStart:end:");
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            -[SASampleStore findTargetProcessInTimeRange:]((uint64_t)sampleStore, v26);
          }
        }
        return;
      }
    }
    id v13 = [(SASampleStore *)self->_sampleStore sampleTimestamps];
    unint64_t v10 = [v13 count] - 1;

    goto LABEL_20;
  }
  int v11 = *__error();
  uint64_t v12 = _sa_logt();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "Requested sample index range on sample store without sample indexes", buf, 2u);
  }

  *__error() = v11;
}

- (id)eventStartTimeWithWallTime
{
  BOOL v2 = [*(id *)(a1 + 160) eventTimeRange];
  id v3 = [v2 startTime];

  if (v3)
  {
    [v3 wallTime];
    if (v4 != 0.0) {
      goto LABEL_6;
    }
  }
  id v5 = *(id *)(a1 + 32);

  if (v5)
  {
    [v5 wallTime];
    if (v6 != 0.0)
    {
      id v3 = v5;
LABEL_6:
      id v7 = v3;
      id v5 = v7;
      goto LABEL_8;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)eventEndTimeWithWallTime
{
  BOOL v2 = [*(id *)(a1 + 160) eventTimeRange];
  id v3 = [v2 endTime];

  if (v3)
  {
    [v3 wallTime];
    if (v4 != 0.0) {
      goto LABEL_6;
    }
  }
  id v5 = *(id *)(a1 + 40);

  if (v5)
  {
    [v5 wallTime];
    if (v6 != 0.0)
    {
      id v3 = v5;
LABEL_6:
      id v7 = v3;
      id v5 = v7;
      goto LABEL_8;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (void)printToStream:(__sFILE *)a3
{
  double v4 = (SAOutputStream *)-[SAFileOutputStream initWithFileStream:]([SAFileOutputStream alloc], (uint64_t)a3);
  streauint64_t m = self->_stream;
  self->_streauint64_t m = v4;

  -[SASamplePrinter printReport]((uint64_t)self);
  double v6 = self->_stream;
  self->_streauint64_t m = 0;
}

- (void)printToMutableData:(id)a3
{
  id v4 = a3;
  id v5 = (SAOutputStream *)-[SAMutableDataOutputStream initWithMutableData:]((id *)[SAMutableDataOutputStream alloc], v4);

  streauint64_t m = self->_stream;
  self->_streauint64_t m = v5;

  -[SASamplePrinter printReport]((uint64_t)self);
  id v7 = self->_stream;
  self->_streauint64_t m = 0;
}

- (uint64_t)checkForBadOptions
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ((unint64_t)[*(id *)(a1 + 16) callTreeAggregation] >= 4)
  {
    uint64_t v12 = *(void **)(a1 + 8);
    if (!v12)
    {
      int v15 = *__error();
      double v16 = _sa_logt();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = [*(id *)(a1 + 16) callTreeAggregation];
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v43;
        _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "unknown callTreeAggregation %llu", buf, 0xCu);
      }
      goto LABEL_27;
    }
    uint64_t v93 = [*(id *)(a1 + 16) callTreeAggregation];
    id v13 = @"unknown callTreeAggregation %llu";
  }
  else
  {
    if ((unint64_t)[*(id *)(a1 + 16) swiftAsyncCallTreeAggregation] < 6)
    {
      uint64_t v2 = *(void *)(a1 + 16);
      if (!v2
        || (uint64_t v3 = *(void *)(v2 + 168), v3 == 1)
        || !v3 && !*(unsigned char *)(v2 + 11)
        || (uint64_t v4 = *(void *)(v2 + 152), v4 == 3)
        || !v4 && *(unsigned char *)(v2 + 11))
      {
        id v5 = [*(id *)(a1 + 160) targetProcess];
        if ([*(id *)(a1 + 160) targetDispatchQueueId])
        {
          if (!v5)
          {
            __int16 v29 = *(void **)(a1 + 8);
            if (v29)
            {
              [v29 printWithFormat:@"targeting dispatch queue %llu, but no target task", objc_msgSend(*(id *)(a1 + 160), "targetDispatchQueueId")];
            }
            else
            {
              int v40 = *__error();
              uint64_t v41 = _sa_logt();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                uint64_t v70 = [*(id *)(a1 + 160) targetDispatchQueueId];
                *(_DWORD *)long long buf = 134217984;
                *(void *)&uint8_t buf[4] = v70;
                _os_log_error_impl(&dword_1BF22B000, v41, OS_LOG_TYPE_ERROR, "targeting dispatch queue %llu, but no target task", buf, 0xCu);
              }

              *__error() = v40;
            }
            goto LABEL_76;
          }
          double v6 = [v5 dispatchQueues];
          id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 160), "targetDispatchQueueId"));
          unint64_t v8 = [v6 objectForKeyedSubscript:v7];

          if (!v8)
          {
            unint64_t v9 = *(void **)(a1 + 8);
            if (v9)
            {
              uint64_t v10 = [*(id *)(a1 + 160) targetDispatchQueueId];
              int v11 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
              [v9 printWithFormat:@"targeting dispatch queue %llu in %@ but no such dispatch queue found", v10, v11];
            }
            else
            {
              int v44 = *__error();
              v45 = _sa_logt();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                uint64_t v73 = [*(id *)(a1 + 160) targetDispatchQueueId];
                uint64_t v74 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
                *(_DWORD *)long long buf = 134218242;
                *(void *)&uint8_t buf[4] = v73;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v74;
                _os_log_error_impl(&dword_1BF22B000, v45, OS_LOG_TYPE_ERROR, "targeting dispatch queue %llu in %@ but no such dispatch queue found", buf, 0x16u);
              }
              *__error() = v44;
            }
LABEL_76:
            uint64_t v17 = 1;
LABEL_163:

            return v17;
          }
        }
        else
        {
          unint64_t v8 = 0;
        }
        uint64_t v19 = [*(id *)(a1 + 160) targetThreadId];
        if (v19)
        {
          if (!v5)
          {
            uint64_t v36 = *(void **)(a1 + 8);
            if (v36)
            {
              [v36 printWithFormat:@"targeting thread 0x%llx, but no target task", objc_msgSend(*(id *)(a1 + 160), "targetThreadId")];
LABEL_161:
              uint64_t v17 = 1;
              goto LABEL_162;
            }
            int v46 = *__error();
            id v47 = _sa_logt();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              uint64_t v75 = [*(id *)(a1 + 160) targetThreadId];
              *(_DWORD *)long long buf = 134217984;
              *(void *)&uint8_t buf[4] = v75;
              _os_log_error_impl(&dword_1BF22B000, v47, OS_LOG_TYPE_ERROR, "targeting thread 0x%llx, but no target task", buf, 0xCu);
            }

            uint64_t v48 = __error();
LABEL_80:
            int *v48 = v46;
            goto LABEL_161;
          }
          unint64_t v20 = [v5 threads];
          unint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 160), "targetThreadId"));
          long long v22 = [v20 objectForKeyedSubscript:v21];

          if (!v22)
          {
            uint64_t v37 = *(void **)(a1 + 8);
            if (v37)
            {
              uint64_t v38 = [*(id *)(a1 + 160) targetThreadId];
              uint64_t v39 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
              [v37 printWithFormat:@"targeting thread 0x%llx in %@ but no such thread found", v38, v39];
            }
            else
            {
              int v51 = *__error();
              uint64_t v52 = _sa_logt();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                uint64_t v76 = [*(id *)(a1 + 160) targetThreadId];
                uint64_t v77 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
                *(_DWORD *)long long buf = 134218242;
                *(void *)&uint8_t buf[4] = v76;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v77;
                _os_log_error_impl(&dword_1BF22B000, v52, OS_LOG_TYPE_ERROR, "targeting thread 0x%llx in %@ but no such thread found", buf, 0x16u);
              }
              *__error() = v51;
            }
            goto LABEL_161;
          }
          if (v8)
          {
            *(void *)long long buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            LOBYTE(v105) = 0;
            uint64_t v23 = *(void *)(a1 + 32);
            uint64_t v24 = *(void *)(a1 + 40);
            uint64_t v25 = *(void *)(a1 + 48);
            uint64_t v26 = *(void *)(a1 + 56);
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __37__SASamplePrinter_checkForBadOptions__block_invoke;
            v95[3] = &unk_1E63F7B20;
            id v27 = v8;
            id v96 = v27;
            id v97 = buf;
            [v22 enumerateThreadStatesBetweenStartTime:v23 startSampleIndex:v25 endTime:v24 endSampleIndex:v26 reverseOrder:0 block:v95];
            if (!*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              char v50 = *(void **)(a1 + 8);
              if (v50)
              {
                objc_msgSend(v50, "printWithFormat:", @"Target dispatch queue %llu never runs on target thread 0x%llx", objc_msgSend(v27, "identifier"), objc_msgSend(v22, "threadId"));
              }
              else
              {
                int v61 = *__error();
                id v62 = _sa_logt();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v86 = [v27 identifier];
                  uint64_t v87 = [v22 threadId];
                  *(_DWORD *)id v102 = 134218240;
                  *(void *)&v102[4] = v86;
                  *(_WORD *)&v102[12] = 2048;
                  *(void *)&v102[14] = v87;
                  _os_log_error_impl(&dword_1BF22B000, v62, OS_LOG_TYPE_ERROR, "Target dispatch queue %llu never runs on target thread 0x%llx", v102, 0x16u);
                }

                *__error() = v61;
              }

              _Block_object_dispose(buf, 8);
              goto LABEL_161;
            }

            _Block_object_dispose(buf, 8);
            BOOL v28 = 1;
          }
          else
          {
            BOOL v28 = 0;
          }
        }
        else
        {
          long long v22 = 0;
          BOOL v28 = v8 != 0;
        }
        if ([*(id *)(a1 + 16) printHeavyStacks])
        {
LABEL_43:
          if ((v19 != 0) | (v28 | [*(id *)(a1 + 16) printTargetThreadOnly] ^ 1) & 1) {
            goto LABEL_172;
          }
          if (!v5)
          {
            id v53 = *(void **)(a1 + 8);
            if (v53)
            {
              [v53 printWithFormat:@"printTargetThreadOnly, but no target task provided"];
            }
            else
            {
              int v63 = *__error();
              v64 = _sa_logt();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)long long buf = 0;
                _os_log_error_impl(&dword_1BF22B000, v64, OS_LOG_TYPE_ERROR, "printTargetThreadOnly, but no target task provided", buf, 2u);
              }

              *__error() = v63;
            }
            goto LABEL_161;
          }
          unint64_t v30 = [v5 mainThread];
          BOOL v31 = v30 == 0;

          if (!v31)
          {
LABEL_172:
            if ([*(id *)(a1 + 16) systemstatsFormat])
            {
              if ([*(id *)(a1 + 16) displayIOInCallTrees])
              {
                uint64_t v32 = *(void **)(a1 + 8);
                if (v32)
                {
                  [v32 printWithFormat:@"displayIOInCallTrees not supported with systemstatsFormat"];
LABEL_141:

                  goto LABEL_161;
                }
                int v65 = *__error();
                uint64_t v66 = _sa_logt();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_error_impl(&dword_1BF22B000, v66, OS_LOG_TYPE_ERROR, "displayIOInCallTrees not supported with systemstatsFormat", buf, 2u);
                }
                goto LABEL_140;
              }
              if ([*(id *)(a1 + 16) callTreeTimestampsTimeDomain]
                && [*(id *)(a1 + 16) callTreeTimestampsTimeDomain] != 1)
              {
                uint64_t v68 = *(void **)(a1 + 8);
                if (v68)
                {
                  [v68 printWithFormat:@"callTreeTimestampsTimeDomain time domains other than kSATimeDomainWallTime not supported with systemstatsFormat"];
                  goto LABEL_141;
                }
                int v65 = *__error();
                uint64_t v66 = _sa_logt();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_error_impl(&dword_1BF22B000, v66, OS_LOG_TYPE_ERROR, "callTreeTimestampsTimeDomain time domains other than kSATimeDomainWallTime not supported with systemstatsFormat", buf, 2u);
                }
                goto LABEL_140;
              }
            }
            if (![*(id *)(a1 + 16) swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways]|| !objc_msgSend(*(id *)(a1 + 16), "swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways"))
            {

              uint64_t v17 = 0;
LABEL_162:

              goto LABEL_163;
            }
            uint64_t v56 = *(void **)(a1 + 8);
            if (v56)
            {
              [v56 printWithFormat:@"swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways and swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways both set"];
              goto LABEL_141;
            }
            int v65 = *__error();
            uint64_t v66 = _sa_logt();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_error_impl(&dword_1BF22B000, v66, OS_LOG_TYPE_ERROR, "swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways and swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways both set", buf, 2u);
            }
LABEL_140:

            *__error() = v65;
            goto LABEL_141;
          }
          uint64_t v59 = *(void **)(a1 + 8);
          if (v59)
          {
            uint64_t v60 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
            [v59 printWithFormat:@"printTargetThreadOnly, but target task %@ has no main thread", v60];

            goto LABEL_161;
          }
          int v46 = *__error();
          id v69 = _sa_logt();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            int v88 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v88;
            _os_log_error_impl(&dword_1BF22B000, v69, OS_LOG_TYPE_ERROR, "printTargetThreadOnly, but target task %@ has no main thread", buf, 0xCu);
          }
          uint64_t v48 = __error();
          goto LABEL_80;
        }
        if (!-[SASamplePrinter hasTimeIndexes](a1))
        {
          uint64_t v42 = *(void **)(a1 + 8);
          if (v42)
          {
            [v42 printWithFormat:@"cannot display timeline format without time indexes"];
            goto LABEL_160;
          }
          int v54 = *__error();
          uint64_t v55 = _sa_logt();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "cannot display timeline format without time indexes", buf, 2u);
          }
LABEL_159:

          *__error() = v54;
          goto LABEL_160;
        }
        if (([*(id *)(a1 + 16) displayBlockedThreads] & 1) == 0)
        {
          v49 = *(void **)(a1 + 8);
          if (v49)
          {
            [v49 printWithFormat:@"cannot display timeline format without displaying blocked threads"];
            goto LABEL_160;
          }
          int v54 = *__error();
          uint64_t v55 = _sa_logt();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "cannot display timeline format without displaying blocked threads", buf, 2u);
          }
          goto LABEL_159;
        }
        if (([*(id *)(a1 + 16) displayRunnableThreads] & 1) == 0)
        {
          uint64_t v58 = *(void **)(a1 + 8);
          if (v58)
          {
            [v58 printWithFormat:@"cannot display timeline format without displaying runnable threads"];
            goto LABEL_160;
          }
          int v54 = *__error();
          uint64_t v55 = _sa_logt();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "cannot display timeline format without displaying runnable threads", buf, 2u);
          }
          goto LABEL_159;
        }
        if (([*(id *)(a1 + 16) displayRunningThreads] & 1) == 0)
        {
          uint64_t v67 = *(void **)(a1 + 8);
          if (v67)
          {
            [v67 printWithFormat:@"cannot display timeline format without displaying running threads"];
            goto LABEL_160;
          }
          int v54 = *__error();
          uint64_t v55 = _sa_logt();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "cannot display timeline format without displaying running threads", buf, 2u);
          }
          goto LABEL_159;
        }
        uint64_t v33 = *(void *)(a1 + 16);
        if (v33)
        {
          uint64_t v34 = *(void *)(v33 + 152);
          if (v34 == 3 || !v34 && *(unsigned char *)(v33 + 11))
          {
            uint64_t v35 = *(void **)(a1 + 8);
            if (v35)
            {
              [v35 printWithFormat:@"conflicting display options: kSAAggregateCallTreesByProcess and !printHeavyStacks"];
LABEL_160:

              goto LABEL_161;
            }
            int v54 = *__error();
            uint64_t v55 = _sa_logt();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "conflicting display options: kSAAggregateCallTreesByProcess and !printHeavyStacks", buf, 2u);
            }
            goto LABEL_159;
          }
          uint64_t v71 = *(void *)(v33 + 160);
          if (v71)
          {
            if (v71 != 2)
            {
              if (v71 == 4)
              {
                id v72 = *(void **)(a1 + 8);
                if (v72)
                {
                  [v72 printWithFormat:@"conflicting display options: kSAAggregateSwiftAsyncCallTreesByProcess and !printHeavyStacks"];
                  goto LABEL_160;
                }
                int v54 = *__error();
                uint64_t v55 = _sa_logt();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "conflicting display options: kSAAggregateSwiftAsyncCallTreesByProcess and !printHeavyStacks", buf, 2u);
                }
                goto LABEL_159;
              }
              goto LABEL_148;
            }
          }
          else if (!*(unsigned char *)(v33 + 14))
          {
            goto LABEL_148;
          }
          v78 = *(void **)(a1 + 8);
          if (v78)
          {
            [v78 printWithFormat:@"conflicting display options: kSAAggregateSwiftAsyncCallTreesByBaseFunction and !printHeavyStacks"];
            goto LABEL_160;
          }
          int v54 = *__error();
          uint64_t v55 = _sa_logt();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "conflicting display options: kSAAggregateSwiftAsyncCallTreesByBaseFunction and !printHeavyStacks", buf, 2u);
          }
          goto LABEL_159;
        }
LABEL_148:
        if (v8 && !v19 && [v8 hasConcurrentExecution])
        {
          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          uint64_t v105 = __Block_byref_object_copy__4;
          uint64_t v106 = __Block_byref_object_dispose__4;
          id v107 = 0;
          *(void *)id v102 = 0;
          *(void *)&v102[8] = v102;
          *(void *)&v102[16] = 0x2020000000;
          char v103 = 0;
          uint64_t v79 = *(void **)(a1 + 32);
          uint64_t v80 = *(void **)(a1 + 40);
          unint64_t v81 = *(void *)(a1 + 48);
          unint64_t v82 = *(void *)(a1 + 56);
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __37__SASamplePrinter_checkForBadOptions__block_invoke_352;
          v94[3] = &unk_1E63F9180;
          v94[4] = buf;
          v94[5] = v102;
          -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]((uint64_t)v8, v79, v81, v80, v82, 0, v94);
          if (*(unsigned char *)(*(void *)&v102[8] + 24))
          {
            id v83 = *(void **)(a1 + 8);
            if (v83)
            {
              id v84 = -[SASamplePrinter displayNameForDispatchQueue:](v8);
              double v85 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
              [v83 printWithFormat:@"cannot display timeline format with concurrent target dispatch queue %@ in %@", v84, v85];
            }
            else
            {
              int v89 = *__error();
              id v90 = _sa_logt();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
              {
                -[SASamplePrinter displayNameForDispatchQueue:](v8);
                id v91 = (id)objc_claimAutoreleasedReturnValue();
                long long v92 = -[SASamplePrinter displayNameForTask:]((void *)a1, v5);
                *(_DWORD *)id v98 = 138412546;
                id v99 = v91;
                __int16 v100 = 2112;
                uint64_t v101 = v92;
                _os_log_error_impl(&dword_1BF22B000, v90, OS_LOG_TYPE_ERROR, "cannot display timeline format with concurrent target dispatch queue %@ in %@", v98, 0x16u);
              }
              *__error() = v89;
            }
            _Block_object_dispose(v102, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_161;
          }
          _Block_object_dispose(v102, 8);
          _Block_object_dispose(buf, 8);
        }
        goto LABEL_43;
      }
      uint64_t v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v13 = @"conflicting display options: aggregation of multiple task instances requires kSAAggregateCallTreesByProcess";
        goto LABEL_21;
      }
      int v15 = *__error();
      double v16 = _sa_logt();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "conflicting display options: aggregation of multiple task instances requires kSAAggregateCallTreesByProcess", buf, 2u);
      }
LABEL_27:

      *__error() = v15;
      return 1;
    }
    uint64_t v12 = *(void **)(a1 + 8);
    if (!v12)
    {
      int v15 = *__error();
      double v16 = _sa_logt();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v57 = [*(id *)(a1 + 16) callTreeAggregation];
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v57;
        _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "unknown swiftAsyncCallTreeAggregation %llu", buf, 0xCu);
      }
      goto LABEL_27;
    }
    uint64_t v93 = [*(id *)(a1 + 16) callTreeAggregation];
    id v13 = @"unknown swiftAsyncCallTreeAggregation %llu";
  }
  uint64_t v14 = v12;
LABEL_21:
  objc_msgSend(v14, "printWithFormat:", v13, v93);
  return 1;
}

- (id)displayNameForTask:(void *)a1
{
  if (a1)
  {
    a1 = -[SASamplePrinter displayNameForTask:includePid:](a1, a2, 1);
    uint64_t v2 = vars8;
  }
  return a1;
}

void __37__SASamplePrinter_checkForBadOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v6 = [a2 dispatchQueue];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __37__SASamplePrinter_checkForBadOptions__block_invoke_352(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  double v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v14 = v5;
  if (v6)
  {
    id v7 = [v5 threadState];
    unint64_t v8 = [v7 startTimestamp];
    int v9 = [v6 gt:v8];

    id v5 = v14;
    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  uint64_t v10 = [v5 threadState];
  uint64_t v11 = [v10 endTimestamp];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (__CFString)displayNameForDispatchQueue:(void *)a1
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 dispatchQueueLabel];

    id v4 = [NSString alloc];
    if (v3)
    {
      id v5 = [v2 dispatchQueueLabel];
      double v6 = SACopySanitizedString(v5, 1, 0);
      id v7 = (__CFString *)[v4 initWithFormat:@"\"%@\"(%llu)", v6, objc_msgSend(v2, "identifier")];
    }
    else
    {
      id v7 = (__CFString *)objc_msgSend(v4, "initWithFormat:", @"%llu", objc_msgSend(v2, "identifier"));
    }
  }
  else
  {
    id v7 = @"none";
  }

  return v7;
}

- (BOOL)taskHasSwallowedAnExceptionNotedByHIException:(BOOL)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v8 = 0;
    int v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    id v5 = [v3 threads];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__SASamplePrinter_taskHasSwallowedAnExceptionNotedByHIException___block_invoke;
    v7[3] = &unk_1E63F79B8;
    v7[4] = a1;
    v7[5] = &v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];

    a1 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return a1;
}

void __65__SASamplePrinter_taskHasSwallowedAnExceptionNotedByHIException___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  double v6 = [a3 lastThreadStateOnOrBeforeTime:*(void *)(*(void *)(a1 + 32) + 40) sampleIndex:*(void *)(*(void *)(a1 + 32) + 56)];
  if (v6)
  {
    id v9 = v6;
    id v7 = [v6 name];
    int v8 = [v7 hasPrefix:@"HIE: "];

    double v6 = v9;
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __60__SASamplePrinter_printProcessesWithHIESwallowedExceptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    id v9 = v3;
    if ([v3 rpid] == *(_DWORD *)(a1 + 56)
      || (int v5 = [v9 ppid], v4 = v9, v5 == *(_DWORD *)(a1 + 56)))
    {
      BOOL v6 = -[SASamplePrinter taskHasSwallowedAnExceptionNotedByHIException:](*(void *)(a1 + 40), v9);
      id v4 = v9;
      if (v6)
      {
        id v7 = *(void **)(a1 + 48);
        int v8 = -[SASamplePrinter displayNameForTask:](*(void **)(a1 + 40), v9);
        [v7 addObject:v8];

        id v4 = v9;
      }
    }
  }
}

void __58__SASamplePrinter_printLaunchdThrottledProcessesToStream___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  uint64_t v3 = [v25 name];
  id v4 = (void *)v3;
  if (*(unsigned char *)(a1 + 64))
  {
    unint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
    unint64_t v6 = [v25 startSampleIndex];
    if (v5 <= v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
    unint64_t v9 = [v25 endSampleIndex];
    if (v8 >= v9) {
      unint64_t v8 = v9;
    }
    if (!v4) {
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v3) {
      goto LABEL_14;
    }
  }
  if ([v4 containsString:@"throttled"])
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v10 && [v10 isEqual:v4])
    {
      char v11 = [v25 endTimestamp];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndTime:v11];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndSampleIndex:v8];
    }
    else
    {
      double v16 = [SATimeRangeOfSamples alloc];
      uint64_t v17 = [v25 startTimestamp];
      double v18 = [v25 endTimestamp];
      uint64_t v19 = [(SATimeRangeOfSamples *)v16 initWithStartTime:v17 endTime:v18 startSampleIndex:v7 endSampleIndex:v8];
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      unint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
      long long v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
      uint64_t v23 = v22;
      if (v22)
      {
        [v22 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      }
      else
      {
        uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
        [*(id *)(a1 + 40) setObject:v24 forKeyedSubscript:v4];
      }
    }
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  int v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

LABEL_19:
}

void __58__SASamplePrinter_printLaunchdThrottledProcessesToStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v7 appendFormat:@"%@", v5];
  if (*(unsigned char *)(a1 + 48))
  {
    id v44 = v5;
    [v7 appendFormat:@":"];
    uint64_t v8 = *(void *)(a1 + 32);
    id v45 = v6;
    uint64_t v46 = a1;
    if (*(unsigned char *)(a1 + 49))
    {
      unint64_t v9 = *(void *)(v8 + 48);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        int v13 = 0;
        uint64_t v14 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v54 != v14) {
              objc_enumerationMutation(v10);
            }
            double v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if ([v16 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
              && [v16 endSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
            {
              obuint64_t j = v13;
              if (v13 >= 1) {
                [v7 appendFormat:@","];
              }
              if (v9 < [v16 startSampleIndex])
              {
                uint64_t v17 = [v16 startSampleIndex] - 1;
                uint64_t v18 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v46 + 32), v9);
                if (v9 == v17) {
                  objc_msgSend(v7, "appendFormat:", @" not throttled sample %lu,", v18, v43);
                }
                else {
                  objc_msgSend(v7, "appendFormat:", @" not throttled samples %lu-%lu,", v18, -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v46 + 32), objc_msgSend(v16, "startSampleIndex") - 1));
                }
              }
              unint64_t v19 = [v16 startSampleIndex];
              unint64_t v20 = [v16 endSampleIndex];
              uint64_t v21 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v46 + 32), [v16 startSampleIndex]);
              uint64_t v22 = v21;
              if (v19 >= v20)
              {
                objc_msgSend(v7, "appendFormat:", @" throttled sample %lu", v21);
              }
              else
              {
                uint64_t v43 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v46 + 32), [v16 endSampleIndex]);
                objc_msgSend(v7, "appendFormat:", @" throttled samples %lu-%lu", v22);
              }
              unint64_t v9 = [v16 endSampleIndex] + 1;
              int v13 = obj + 1;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v12);
      }

      id v6 = v45;
      a1 = v46;
      uint64_t v23 = *(void *)(v46 + 32);
      unint64_t v24 = *(void *)(v23 + 56);
      id v5 = v44;
      if (v9 <= v24)
      {
        if (-[SASamplePrinter hasTimeIndexes](*(void *)(v46 + 32)))
        {
          uint64_t v25 = v9 + 1;
          if ([*(id *)(v23 + 16) forceOneBasedTimeIndexes]) {
            v25 -= *(void *)(v23 + 48);
          }
        }
        else
        {
          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v9 == v24) {
          [v7 appendFormat:@", not throttled sample %lu", v25, v43];
        }
        else {
          [v7 appendFormat:@", not throttled samples %lu-%lu", v25, -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v46 + 32), *(void *)(*(void *)(v46 + 32) + 56))];
        }
        id v6 = v45;
      }
    }
    else
    {
      id v26 = *(id *)(v8 + 32);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obja = v6;
      uint64_t v27 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        int v29 = 0;
        uint64_t v30 = *(void *)v50;
        do
        {
          uint64_t v31 = 0;
          int v32 = v29;
          uint64_t v33 = v26;
          do
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(obja);
            }
            uint64_t v34 = *(void **)(*((void *)&v49 + 1) + 8 * v31);
            if (v32 + (int)v31 >= 1) {
              [v7 appendFormat:@","];
            }
            uint64_t v35 = [v34 startTime];
            [v33 deltaSecondsTo:v35 timeDomainPriorityList:&unk_1F1A9B028 timeDomainUsed:0];
            double v37 = v36;

            if (v37 > 0.0) {
              [v7 appendFormat:@" not throttled %.2fs,", *(void *)&v37];
            }
            uint64_t v38 = [v34 startTime];
            uint64_t v39 = [v34 endTime];
            [v38 deltaSecondsTo:v39 timeDomainPriorityList:&unk_1F1A9B040 timeDomainUsed:0];
            double v41 = v40;

            if (v41 > 0.0) {
              [v7 appendFormat:@" throttled %.2fs", *(void *)&v41];
            }
            id v26 = [v34 endTime];

            ++v31;
            uint64_t v33 = v26;
          }
          while (v28 != v31);
          int v29 = v32 + v28;
          uint64_t v28 = [obja countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v28);
      }

      [v26 deltaSecondsTo:*(void *)(*(void *)(v46 + 32) + 40) timeDomainPriorityList:&unk_1F1A9B058 timeDomainUsed:0];
      if (v42 > 0.0) {
        [v7 appendFormat:@", not throttled %.2fs", *(void *)&v42];
      }

      id v5 = v44;
      id v6 = v45;
      a1 = v46;
    }
  }
  [*(id *)(a1 + 40) printWithFormat:@"  %@\n", v7];
}

- (uint64_t)displayTimeIndexForSampleIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (-[SASamplePrinter hasTimeIndexes](result))
    {
      int v4 = [*(id *)(v3 + 16) forceOneBasedTimeIndexes];
      result = a2 + 1;
      if (v4) {
        result -= *(void *)(v3 + 48);
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

void __63__SASamplePrinter_printProcessesHittingWQThreadLimitsToStream___block_invoke(void **a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 lastTaskStateOnOrBeforeTime:*((void *)a1[4] + 5) sampleIndex:*((void *)a1[4] + 7)];
  int v4 = v3;
  if (v3
    && (([v3 wqExceededTotalThreadLimit] & 1) != 0
     || [v4 wqExceededConstrainedThreadLimit]))
  {
    id v5 = -[SASamplePrinter displayNameForTask:](a1[4], v6);
    if ([v4 wqExceededTotalThreadLimit]) {
      [a1[5] addObject:v5];
    }
    if ([v4 wqExceededConstrainedThreadLimit]) {
      [a1[6] addObject:v5];
    }
  }
}

- (id)displayNameForPid:(uint64_t)a3 threadId:(void *)a4 timestamp:
{
  id v7 = a4;
  if (a1)
  {
    if (a2 == -1 && !a3) {
      goto LABEL_4;
    }
    id v10 = (void *)a1[20];
    if (v7) {
      -[SASampleStore taskWithPid:orTid:atTimestamp:](v10, a2, a3, v7);
    }
    else {
    uint64_t v11 = -[SASampleStore lastTaskWithPid:orTid:](v10, a2, a3);
    }
    if (!v11)
    {
      if (a3)
      {
        id v13 = [NSString alloc];
        if (a2 == -1)
        {
          uint64_t v8 = objc_msgSend(v13, "initWithFormat:", @"UNKNOWN TASK thread 0x%llx", a3, v18, v19);
        }
        else
        {
          uint64_t v14 = @"UNKNOWN";
          if (!a2) {
            uint64_t v14 = @"kernel_task";
          }
          uint64_t v8 = [v13 initWithFormat:@"%@ [%d] thread 0x%llx", v14, a2, a3];
        }
        goto LABEL_5;
      }
      if (a2 != -1)
      {
        id v15 = [NSString alloc];
        double v16 = @"UNKNOWN";
        if (!a2) {
          double v16 = @"kernel_task";
        }
        uint64_t v8 = [v15 initWithFormat:@"%@ [%d]", v16, a2, v19];
        goto LABEL_5;
      }
LABEL_4:
      uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"UNKNOWN TASK", v17, v18, v19);
LABEL_5:
      unint64_t v9 = (void *)v8;
      goto LABEL_11;
    }
    unint64_t v9 = -[SASamplePrinter displayNameForTask:threadId:](a1, v11, a3);
  }
  else
  {
    unint64_t v9 = 0;
  }
LABEL_11:

  return v9;
}

- (__CFString)displayStringForResourceCoalition:(void *)a1
{
  id v1 = a1;
  if ([v1 resourceCoalitionID])
  {
    uint64_t v2 = [v1 resourceCoalitionName];

    id v3 = [NSString alloc];
    if (v2)
    {
      int v4 = [v1 resourceCoalitionName];
      id v5 = (__CFString *)[v3 initWithFormat:@"\"%@\"(%llu)", v4, objc_msgSend(v1, "resourceCoalitionID")];
    }
    else
    {
      id v5 = (__CFString *)objc_msgSend(v3, "initWithFormat:", @"%llu", objc_msgSend(v1, "resourceCoalitionID"));
    }
  }
  else
  {
    id v5 = @"none";
  }

  return v5;
}

- (id)displayStringForOnBehalfOfForTasks:(uint64_t)a1 includePid:(void *)a2
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v36 = objc_alloc_init(SAOnBehalfOfMultiple);
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x3032000000;
  long long v51 = __Block_byref_object_copy__4;
  long long v52 = __Block_byref_object_dispose__4;
  id v53 = 0;
  uint64_t v35 = [*(id *)(a1 + 160) sampleTimestamps];
  char v4 = [v35 count];
  id v5 = *(void **)(a1 + 160);
  if ((v4 & 7) != 0)
  {
    id v6 = [v5 sampleTimestamps];
    unint64_t v7 = ((unint64_t)[v6 count] >> 3) + 1;
  }
  else
  {
    id v6 = [v5 sampleTimestamps];
    unint64_t v7 = (unint64_t)[v6 count] >> 3;
  }
  uint64_t v8 = *(void **)(a1 + 160);
  if ((v7 & 7) != 0)
  {
    unint64_t v9 = [v8 sampleTimestamps];
    char v10 = [v9 count];
    uint64_t v11 = *(void **)(a1 + 160);
    if ((v10 & 7) != 0)
    {
      uint64_t v12 = [v11 sampleTimestamps];
      unint64_t v13 = ((unint64_t)[v12 count] >> 3) + 1;
    }
    else
    {
      uint64_t v12 = [v11 sampleTimestamps];
      unint64_t v13 = (unint64_t)[v12 count] >> 3;
    }
    uint64_t v17 = [*(id *)(a1 + 160) sampleTimestamps];
    char v18 = [v17 count];
    uint64_t v19 = *(void **)(a1 + 160);
    if ((v18 & 7) != 0)
    {
      unint64_t v20 = [v19 sampleTimestamps];
      unsigned int v21 = [v20 count];

      uint64_t v22 = ((v21 >> 3) + 1) & 7;
    }
    else
    {
      uint64_t v23 = [v19 sampleTimestamps];
      unint64_t v24 = [v23 count];

      uint64_t v22 = (v24 >> 3) & 7;
    }
    unint64_t v16 = v13 - v22 + 8;
  }
  else
  {
    unint64_t v9 = [v8 sampleTimestamps];
    char v14 = [v9 count];
    id v15 = *(void **)(a1 + 160);
    if ((v14 & 7) != 0)
    {
      uint64_t v12 = [v15 sampleTimestamps];
      unint64_t v16 = ((unint64_t)[v12 count] >> 3) + 1;
    }
    else
    {
      uint64_t v12 = [v15 sampleTimestamps];
      unint64_t v16 = (unint64_t)[v12 count] >> 3;
    }
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = v3;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v25);
        }
        int v29 = [*(id *)(*((void *)&v44 + 1) + 8 * i) threads];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke;
        v40[3] = &unk_1E63F9C60;
        v40[4] = a1;
        double v41 = v36;
        double v42 = &v48;
        unint64_t v43 = v16;
        [v29 enumerateKeysAndObjectsUsingBlock:v40];
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v26);
  }

  if ([(id)v49[5] count])
  {
    uint64_t v30 = (void *)v49[5];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_3;
    v37[3] = &unk_1E63F9C88;
    unint64_t v39 = v16;
    uint64_t v38 = v36;
    [v30 enumerateKeysAndObjectsUsingBlock:v37];
  }
  if (v36 && v36->_count)
  {
    uint64_t v31 = v36;
    int v32 = v31;
    if (v36->_count)
    {
      uint64_t v33 = -[SAOnBehalfOfMultiple displayString](v31);
    }
    else
    {
      uint64_t v33 = 0;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }
  _Block_object_dispose(&v48, 8);

  return v33;
}

- (id)displayNameForTask:(void *)a3 thread:(void *)a4 threadState:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (v7)
    {
      uint64_t v10 = -[SASamplePrinter displayNameForTask:threadId:](a1, v7, [v8 threadId]);
    }
    else
    {
      uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Thread 0x%llx", objc_msgSend(v8, "threadId"));
    }
    a1 = (void *)v10;
    uint64_t v11 = [v9 name];
    uint64_t v12 = (void *)v11;
    if (v11)
    {
      uint64_t v13 = [a1 stringByAppendingFormat:@" \"%@\"", v11];

      a1 = (void *)v13;
    }
    char v14 = [v9 dispatchQueue];
    id v15 = v14;
    if (v14)
    {
      unint64_t v16 = -[SASamplePrinter displayNameForDispatchQueue:](v14);
      uint64_t v17 = [a1 stringByAppendingFormat:@" %@ %@", @"DispatchQueue", v16];

      a1 = (void *)v17;
    }
    char v18 = [v9 swiftTask];
    uint64_t v19 = v18;
    if (v18)
    {
      if ([v18 identifier] == -1) {
        [a1 stringByAppendingFormat:@" %@ %@", @"Swift Task", @"UNKNOWN"];
      }
      else {
      uint64_t v20 = [a1 stringByAppendingFormat:@" %@ %llu", @"Swift Task", objc_msgSend(v19, "identifier")];
      }

      a1 = (void *)v20;
    }
  }
  return a1;
}

- (id)architectureStringForTask:(uint64_t)a1
{
  id v3 = a2;
  char v4 = [v3 architectureString];
  uint64_t v5 = *(void *)(a1 + 160);
  if (!v5)
  {
    uint64_t v6 = 0;
    if (v3) {
      goto LABEL_3;
    }
LABEL_12:
    id v9 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(v5 + 192);
  if (!v3) {
    goto LABEL_12;
  }
LABEL_3:
  objc_copyStruct(&dest, v3 + 288, 8, 1, 0);
  uint64_t v7 = dest;

  if (v6)
  {
    if (v7)
    {
      CSArchitectureGetFamily();
      CSArchitectureGetFamily();
      if ((CSArchitectureMatchesArchitecture() & 1) == 0)
      {
        uint64_t v8 = [v4 stringByAppendingString:@" (translated)"];
        id v9 = v4;
        char v4 = (void *)v8;
LABEL_7:
      }
    }
  }
  return v4;
}

- (void)addTaskHeaderToStream:(void *)a3 displayName:(uint64_t)a4 pid:(void *)a5 mainBinary:(void *)a6 mainBinaryPath:(void *)a7 sharedCaches:(uint64_t)a8 uid:(double)a9 bundleIdentifier:(void *)a10 bundleVersion:(void *)a11 bundleShortVersion:(void *)a12 bundleBuildVersion:(void *)a13 bundleProjectName:(void *)a14 bundleSourceVersion:(void *)a15 bundleProductBuildVersion:(void *)a16 adamID:(uint64_t)a17 installerVersionID:(void *)a18 developerType:(char)a19 appType:(void *)a20 isBeta:(unsigned __int8)a21 cohortID:(void *)a22 vendorID:(void *)a23 distributorID:(void *)a24 codesigningID:(void *)a25 teamID:(void *)a26 resourceCoalitionSampleCounts:(void *)a27 onBehalfOfProcesses:(void *)a28 architectureString:(void *)a29 kernelVersion:(void *)a30 parentName:(void *)a31 responsibleName:(void *)a32 taskExecedFromName:(void *)a33 taskExecedToName:(void *)a34 pidStartTimestamp:(void *)a35 startTimestamp:(void *)a36 endTimestamp:(void *)a37 startSampleIndex:(unint64_t)a38 endSampleIndex:(unint64_t)a39 numSamples:(unint64_t)a40 totalNumSamples:(unint64_t)a41 numSamplesSuspended:(uint64_t)a42 numSamplesTerminated:(uint64_t)a43 startingTaskSize:(unint64_t)a44 endingTaskSize:(unint64_t)a45 maxTaskSize:(unint64_t)a46 startSampleIndexOfMaxTaskSize:(unint64_t)a47 endSampleIndexOfMaxTaskSize:(unint64_t)a48 numPageins:(unsigned int)a49 cpuTimeNs:(unint64_t)a50 cpuInstructions:(unint64_t)a51 cpuCycles:(unint64_t)a52 nonThreadCpuTimeNs:(unint64_t)a53 nonThreadCpuInstructions:(unint64_t)a54 nonThreadCpuCycles:(unint64_t)a55 usesSuddenTermination:(char)a56 allowsIdleExit:(char)a57 isTranslocated:(char)a58 isUnresponsive:(char)a59 timeOfLastResponse:(uint64_t)a60 numThreads:(uint64_t)a61 numIdleWorkQueueThreads:(uint64_t)a62 numOtherHiddenThreads:(char)a63 hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:
{
  uint64_t v390 = *MEMORY[0x1E4F143B8];
  id v371 = a2;
  id v362 = a3;
  id v340 = a5;
  id v75 = a6;
  id v356 = a7;
  id v366 = a10;
  *((void *)&v344 + 1) = a11;
  *(void *)&long long v344 = a12;
  id v76 = a13;
  id v77 = a14;
  id v78 = a15;
  id v79 = a16;
  id v80 = a18;
  id v81 = a20;
  id v351 = a22;
  id v361 = a23;
  id v82 = a24;
  id v367 = a25;
  id v360 = a26;
  id v83 = a27;
  id v352 = a28;
  id v350 = a29;
  id v359 = a30;
  id v349 = a31;
  id v348 = a32;
  id v347 = a33;
  id v346 = a34;
  id v341 = a35;
  id v353 = a36;
  id v84 = a37;
  id v357 = a66;
  id v354 = a67;
  if (a70)
  {
    if ([*(id *)(a1 + 16) printJson])
    {
      int v291 = *__error();
      double v292 = _sa_logt();
      if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v292, OS_LOG_TYPE_ERROR, "printing report target task header with json", buf, 2u);
      }

      *__error() = v291;
      _SASetCrashLogMessage(6696, "printing report target task header with json", v293, v294, v295, v296, v297, v298, v331);
      _os_crash();
      __break(1u);
    }
    else if (![*(id *)(a1 + 16) systemstatsFormat])
    {
      goto LABEL_4;
    }
    int v299 = *__error();
    v300 = _sa_logt();
    if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v300, OS_LOG_TYPE_ERROR, "printing report target task header with systemstats format", buf, 2u);
    }

    *__error() = v299;
    _SASetCrashLogMessage(6697, "printing report target task header with systemstats format", v301, v302, v303, v304, v305, v306, v331);
    _os_crash();
    __break(1u);
    goto LABEL_441;
  }
LABEL_4:
  v364 = v78;
  v365 = v84;
  double v368 = v83;
  int v363 = v79;
  unint64_t v342 = a40;
  char v345 = v76;
  uint64_t v355 = v77;
  v358 = v80;
  int v338 = v82;
  v339 = v81;
  if (!a19)
  {
    id v84 = v340;
    double v85 = v371;
    uint64_t v86 = v366;
    uint64_t v87 = v352;
    if (!v81)
    {
      int v88 = 0;
      int v89 = 0;
      goto LABEL_14;
    }
    if (([v81 isEqualToString:@"System"] & 1) == 0
      && ([v81 isEqualToString:@"Internal"] & 1) == 0)
    {
      int v88 = [v81 isEqualToString:@"Hidden"];
      goto LABEL_13;
    }
LABEL_12:
    int v88 = 1;
LABEL_13:
    int v89 = 1;
    goto LABEL_14;
  }
  id v84 = v340;
  double v85 = v371;
  uint64_t v86 = v366;
  uint64_t v87 = v352;
  if (a19 == 1) {
    goto LABEL_12;
  }
  int v88 = 0;
  int v89 = 1;
  if (v366 && a19 == -1) {
    int v88 = [v366 hasPrefix:@"com.apple."];
  }
LABEL_14:
  int v90 = a21;
  uint64_t v91 = a17;
  uint64_t v343 = v75;
  if ([*(id *)(a1 + 16) printJson])
  {
    SAJSONWriteDictionaryFirstEntry(v85, @"name", v362);
    if (v84)
    {
      long long v92 = [v84 uuid];
      uint64_t v93 = [v92 UUIDString];
      SAJSONWriteDictionaryEntry(v85, @"uuid", v93);

      id v75 = v343;
    }
    if (v75) {
      SAJSONWriteDictionaryEntry(v85, @"path", v75);
    }
    if (v356) {
      SAJSONWriteDictionaryEntry(v85, @"sharedcaches", v356);
    }
    if (a8 != -314)
    {
      long long v94 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      SAJSONWriteDictionaryEntry(v85, @"uid", v94);
    }
    if (a17)
    {
      long long v95 = [*(id *)(a1 + 160) osProductName];

      if (v95)
      {
        id v96 = [*(id *)(a1 + 160) osProductName];
        int v97 = SAIsEmbeddedPlatform(v96);

        id v98 = [NSNumber numberWithUnsignedLongLong:a17];
        if (v97) {
          id v99 = @"adamID";
        }
        else {
          id v99 = @"appItemID";
        }
        SAJSONWriteDictionaryEntry(v85, v99, v98);
        uint64_t v86 = v366;
      }
      else
      {
        id v98 = [NSNumber numberWithUnsignedLongLong:a17];
        SAJSONWriteDictionaryEntry(v85, @"adamID", v98);
      }
    }
    if (v358)
    {
      v111 = SACopySanitizedString(v358, 1, 0);
      SAJSONWriteDictionaryEntry(v85, @"appExternalID", v111);
    }
    v112 = v345;
    if (v89)
    {
      if (v88) {
        v113 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        v113 = (void *)MEMORY[0x1E4F1CC28];
      }
      SAJSONWriteDictionaryEntry(v85, @"isFirstParty", v113);
    }
    if (a21)
    {
      SAJSONWriteDictionaryEntry(v85, @"isBeta", MEMORY[0x1E4F1CC38]);
      if (v351) {
        SAJSONWriteDictionaryEntry(v85, @"cohort", v351);
      }
    }
    uint64_t v114 = v356;
    if (v361) {
      SAJSONWriteDictionaryEntry(v85, @"betaIdentifier", v361);
    }
    v115 = v355;
    if (v86)
    {
      uint64_t v116 = SACopySanitizedString(v86, 1, 0);
      SAJSONWriteDictionaryEntry(v85, @"bundleIdentifier", v116);
    }
    if (v359)
    {
      SAJSONWriteDictionaryEntry(v85, @"version", v359);
    }
    else
    {
      v118 = v363;
      v117 = v364;
      if (v344 == 0)
      {
LABEL_89:
        if (v345)
        {
          v122 = SACopySanitizedString(v345, 1, 0);
          SAJSONWriteDictionaryEntry(v85, @"buildVersion", v122);
        }
        if (v118)
        {
          v123 = SACopySanitizedString(v118, 1, 0);
          SAJSONWriteDictionaryEntry(v85, @"productBuildVersion", v123);
        }
        if (v355)
        {
          v124 = SACopySanitizedString(v355, 1, 0);
          SAJSONWriteDictionaryEntry(v85, @"projectName", v124);
        }
        if (v117)
        {
          int v125 = SACopySanitizedString(v117, 1, 0);
          SAJSONWriteDictionaryEntry(v85, @"sourceVersion", v125);
        }
        if (v367) {
          SAJSONWriteDictionaryEntry(v85, @"codesigningID", v367);
        }
        if (v360) {
          SAJSONWriteDictionaryEntry(v85, @"teamID", v360);
        }
        if ((unint64_t)[v368 count] > 1
          || [v368 count] == 1
          && ([v368 allKeys],
              v126 = objc_claimAutoreleasedReturnValue(),
              [v126 firstObject],
              BOOL v127 = objc_claimAutoreleasedReturnValue(),
              char v128 = [v127 isEqualToString:@"none"],
              v127,
              v126,
              (v128 & 1) == 0))
        {
          SAJSONWriteDictionaryEntry(v85, @"resourceCoalitionSampleCounts", v368);
        }
        uint64_t v87 = v352;
        if (v352) {
          SAJSONWriteDictionaryEntry(v85, @"onBehalfOf", v352);
        }
        if (v349) {
          SAJSONWriteDictionaryEntry(v85, @"parent", v349);
        }
        if (v348) {
          SAJSONWriteDictionaryEntry(v85, @"responsible", v348);
        }
        uint64_t v86 = v366;
        if (v347) {
          SAJSONWriteDictionaryEntry(v85, @"taskExecedFrom", v347);
        }
        if (v346) {
          SAJSONWriteDictionaryEntry(v85, @"taskExecedTo", v346);
        }
        if (v350) {
          SAJSONWriteDictionaryEntry(v85, @"arch", v350);
        }
        if (v353) {
          SAJSONWriteDictionaryEntry(v85, @"startTime", v353);
        }
        if (v365) {
          SAJSONWriteDictionaryEntry(v85, @"endTime", v365);
        }
        if (a38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v129 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"startSampleIndex", v129);
        }
        if (a39 != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v130 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"endSampleIndex", v130);
        }
        double v131 = [NSNumber numberWithUnsignedInteger:a40];
        SAJSONWriteDictionaryEntry(v85, @"numSamples", v131);

        if (a42)
        {
          double v132 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"numSamplesSuspended", v132);
        }
        if (a43)
        {
          v133 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"numSamplesTerminated", v133);
        }
        if (a44)
        {
          v134 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          SAJSONWriteDictionaryEntry(v85, @"startingTaskSize", v134);
        }
        if (a45)
        {
          v135 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          SAJSONWriteDictionaryEntry(v85, @"endingTaskSize", v135);
        }
        if (a46)
        {
          BOOL v136 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          SAJSONWriteDictionaryEntry(v85, @"maxTaskSize", v136);
        }
        if (a47 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v137 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"startSampleIndexOfMaxTaskSize", v137);
        }
        if (a48 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v138 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"endSampleIndexOfMaxTaskSize", v138);
        }
        double v139 = v357;
        if (a49)
        {
          double v140 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
          SAJSONWriteDictionaryEntry(v85, @"numPageins", v140);
        }
        if (a50)
        {
          double v141 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          SAJSONWriteDictionaryEntry(v85, @"cpuNanoseconds", v141);
        }
        if (a51)
        {
          double v142 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          SAJSONWriteDictionaryEntry(v85, @"cpuInstructions", v142);
        }
        if (a52)
        {
          id v143 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          SAJSONWriteDictionaryEntry(v85, @"cpuCycles", v143);
        }
        if (a56) {
          SAJSONWriteDictionaryEntry(v85, @"usesSuddenTermination", MEMORY[0x1E4F1CC38]);
        }
        if (a57) {
          SAJSONWriteDictionaryEntry(v85, @"allowsIdleExit", MEMORY[0x1E4F1CC38]);
        }
        if (a58) {
          SAJSONWriteDictionaryEntry(v85, @"isTranslocated", MEMORY[0x1E4F1CC38]);
        }
        if (a59)
        {
          SAJSONWriteDictionaryEntry(v85, @"isUnresponsive", MEMORY[0x1E4F1CC38]);
          if (a9 > 0.0)
          {
            uint64_t v144 = [NSNumber numberWithDouble:a9];
            SAJSONWriteDictionaryEntry(v85, @"timeOfLastResponseCF", v144);
          }
        }
        if (a60)
        {
          uint64_t v145 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"numThreads", v145);
        }
        if (a61)
        {
          id v146 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"numIdleWorkQueueThreads", v146);
        }
        if (a62)
        {
          v147 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"numOtherHiddenThreads", v147);
        }
        if (a63) {
          SAJSONWriteDictionaryEntry(v85, @"hieSwallowedException", MEMORY[0x1E4F1CC38]);
        }
        if (a64) {
          SAJSONWriteDictionaryEntry(v85, @"wqExceededConstrainedThreadLimit", MEMORY[0x1E4F1CC38]);
        }
        if (a65) {
          SAJSONWriteDictionaryEntry(v85, @"wqExceededTotalThreadLimit", MEMORY[0x1E4F1CC38]);
        }
        if ([v357 count]) {
          SAJSONWriteDictionaryEntry(v85, @"threadsDeadlocked", v357);
        }
        if ([v354 count]) {
          SAJSONWriteDictionaryEntry(v85, @"threadsBlockedByADeadlock", v354);
        }
        if (a69)
        {
          v148 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          SAJSONWriteDictionaryEntry(v85, @"numIOs", v148);

          v149 = [NSNumber numberWithUnsignedLongLong:a68];
          SAJSONWriteDictionaryEntry(v85, @"ioSize", v149);
        }
        goto LABEL_434;
      }
      if ((void)v344)
      {
        SACopySanitizedString((void *)v344, 1, 0);
        v119 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v119 = @"???";
      }
      if (*((void *)&v344 + 1))
      {
        SACopySanitizedString(*((void **)&v344 + 1), 1, 0);
        v120 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v120 = @"???";
      }
      v121 = (void *)[[NSString alloc] initWithFormat:@"%@ (%@)", v119, v120];
      SAJSONWriteDictionaryEntry(v85, @"version", v121);
    }
    v118 = v363;
    v117 = v364;
    goto LABEL_89;
  }
  if (a70)
  {
    [v85 printWithFormat:@"%-*s%@\n", 18, "Command: ", v362];
    if (!v84) {
      goto LABEL_46;
    }
    goto LABEL_41;
  }
  __int16 v100 = "Powerstats for: ";
  if (([*(id *)(a1 + 16) microstackshotsFormat] & 1) == 0
    && ![*(id *)(a1 + 16) systemstatsFormat])
  {
    __int16 v100 = "Process: ";
  }
  [v85 printWithFormat:@"%-*s%@", 18, v100, v362];
  *(unsigned char *)(a1 + 105) = 1;
  int v90 = a21;
  uint64_t v91 = a17;
  if (([*(id *)(a1 + 16) systemstatsFormat] & 1) == 0)
  {
    unint64_t v101 = a40;
    if (a40 && a42 == a40)
    {
      [v85 appendString:@" (suspended)"];
      unint64_t v101 = a40;
    }
    if (v101 && a43 == a40) {
      [v85 appendString:@" (zombie)"];
    }
  }
  [v85 appendString:@"\n"];
  if (v84)
  {
LABEL_41:
    if (![*(id *)(a1 + 16) systemstatsFormat])
    {
      char v103 = [v84 uuid];
      id v104 = [v103 UUIDString];
      [v85 printWithFormat:@"%-*s%@\n", 18, "UUID: ", v104];

      id v75 = v343;
      goto LABEL_45;
    }
    id v102 = -[SASamplePrinter indexForBinary:](a1, (uint64_t)v84);
    if (v102)
    {
      char v103 = v102;
      objc_msgSend(v85, "printWithFormat:", @"%-*s%lu\n", 18, "UUID: ", objc_msgSend(v102, "unsignedLongValue"));
LABEL_45:

      goto LABEL_46;
    }
LABEL_441:
    int v307 = *__error();
    v308 = _sa_logt();
    if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
    {
      uint64_t v309 = [v362 UTF8String];
      id v310 = [v84 uuid];
      id v311 = [v310 UUIDString];
      uint64_t v312 = [v311 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v383 = v309;
      __int16 v384 = 2080;
      uint64_t v385 = v312;
      _os_log_error_impl(&dword_1BF22B000, v308, OS_LOG_TYPE_ERROR, "%s: no index for main binary %s, required by systemstats format", buf, 0x16u);
    }
    *__error() = v307;
    char v313 = [v362 UTF8String];
    unint64_t v269 = [v84 uuid];
    id v314 = [v269 UUIDString];
    [v314 UTF8String];
    _SASetCrashLogMessage(6948, "%s: no index for main binary %s, required by systemstats format", v315, v316, v317, v318, v319, v320, v313);

    _os_crash();
    __break(1u);
    goto LABEL_444;
  }
LABEL_46:
  char v105 = [*(id *)(a1 + 16) systemstatsFormat];
  if (v75 && (v105 & 1) == 0)
  {
    if ([*(id *)(a1 + 160) sanitizePaths])
    {
      id v106 = v75;
    }
    id v107 = SACopySanitizedString(v75, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "Path: ", v107];
  }
  if (v86)
  {
    uint64_t v108 = SACopySanitizedString(v86, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "Identifier: ", v108];
  }
  uint64_t v109 = a1;
  if (v359)
  {
    [v85 printWithFormat:@"%-*s%@\n", 18, "Version: ", v359];
  }
  else if (v344 != 0)
  {
    if ((void)v344)
    {
      SACopySanitizedString((void *)v344, 1, 0);
      v110 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v110 = @"???";
    }
    if (*((void *)&v344 + 1))
    {
      SACopySanitizedString(*((void **)&v344 + 1), 1, 0);
      id v150 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v150 = @"???";
    }
    [v85 printWithFormat:@"%-*s%@ (%@)\n", 18, "Version: ", v110, v150];

    uint64_t v109 = a1;
  }
  if (v345)
  {
    v151 = SACopySanitizedString(v345, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "Build Version: ", v151];
  }
  if (v363)
  {
    id v152 = SACopySanitizedString(v363, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "Product Build Version: ", v152];
  }
  if (v355)
  {
    v153 = SACopySanitizedString(v355, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "Project Name: ", v153];
  }
  if (v364)
  {
    v154 = SACopySanitizedString(v364, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "Source Version: ", v154];
  }
  if (v367
    && (!v86
     || ![v367 isEqualToString:v86]
     || [*(id *)(v109 + 16) displayCodesigningIDsMatchingBundleIDs]))
  {
    [v85 printWithFormat:@"%-*s%@\n", 18, "Codesigning ID: ", v367];
  }
  if (v360) {
    [v85 printWithFormat:@"%-*s%@\n", 18, "Team ID: ", v360];
  }
  if (v91)
  {
    v155 = [*(id *)(v109 + 160) osProductName];

    uint64_t v156 = "Adam ID: ";
    if (v155)
    {
      v157 = [*(id *)(v109 + 160) osProductName];
      int v158 = SAIsEmbeddedPlatform(v157);

      BOOL v159 = v158 == 0;
      uint64_t v109 = a1;
      if (v159) {
        uint64_t v156 = "App Item ID: ";
      }
    }
    double v332 = v156;
    double v85 = v371;
    objc_msgSend(v371, "printWithFormat:", @"%-*s%llu\n", 18, v332, v91);
  }
  if (v358)
  {
    id v160 = SACopySanitizedString(v358, 1, 0);
    [v85 printWithFormat:@"%-*s%@\n", 18, "App External ID: ", v160];
  }
  if (v89)
  {
    id v161 = "No";
    if (v88) {
      id v161 = "Yes";
    }
    objc_msgSend(v85, "printWithFormat:", @"%-*s%s\n", 18, "Is First Party: ", v161);
  }
  if (v90)
  {
    objc_msgSend(v85, "printWithFormat:", @"%-*sYes\n", 18, "Is Beta: ");
    if (v351) {
      [v85 printWithFormat:@"%-*s%@\n", 18, "Cohort: ", v351];
    }
  }
  uint64_t v114 = v356;
  if (v361) {
    [v85 printWithFormat:@"%-*s%@\n", 18, "Beta Identifier: ", v361];
  }
  v115 = v355;
  if ([v356 count])
  {
    v162 = [*(id *)(v109 + 160) sharedCaches];
    if ((unint64_t)[v162 count] > 1)
    {

LABEL_215:
      long long v380 = 0u;
      long long v381 = 0u;
      long long v378 = 0u;
      long long v379 = 0u;
      id v164 = v356;
      uint64_t v165 = [v164 countByEnumeratingWithState:&v378 objects:v389 count:16];
      if (v165)
      {
        uint64_t v166 = v165;
        uint64_t v167 = *(void *)v379;
        do
        {
          for (uint64_t i = 0; i != v166; ++i)
          {
            if (*(void *)v379 != v167) {
              objc_enumerationMutation(v164);
            }
            id v169 = _shared_cache_display_string(*(void **)(*((void *)&v378 + 1) + 8 * i));
            [v371 printWithFormat:@"%-*s%@\n", 18, "Shared Cache: ", v169];
          }
          uint64_t v166 = [v164 countByEnumeratingWithState:&v378 objects:v389 count:16];
        }
        while (v166);
      }

      double v85 = v371;
      v115 = v355;
      uint64_t v114 = v356;
      uint64_t v86 = v366;
      uint64_t v109 = a1;
      goto LABEL_223;
    }
    unint64_t v163 = [v356 count];

    if (v163 > 1) {
      goto LABEL_215;
    }
    uint64_t v198 = [*(id *)(v109 + 160) sharedCaches];
    if ([v198 count])
    {
      id v199 = [v356 firstObject];
      uint64_t v200 = [MEMORY[0x1E4F1CA98] null];

      if (v199 == v200)
      {
        [v85 printWithFormat:@"%-*s%@\n", 18, "Shared Cache: ", @"None"];
        goto LABEL_223;
      }
    }
    else
    {
    }
    if ([*(id *)(v109 + 16) displayAllBinaries])
    {
      id v232 = [v356 firstObject];
      uint64_t v233 = _shared_cache_display_string(v232);
      [v85 printWithFormat:@"%-*s%@\n", 18, "Shared Cache: ", v233];
    }
  }
LABEL_223:
  if ((unint64_t)[v368 count] > 1
    || [v368 count] == 1
    && ([v368 allKeys],
        id v170 = objc_claimAutoreleasedReturnValue(),
        [v170 firstObject],
        uint64_t v171 = objc_claimAutoreleasedReturnValue(),
        char v172 = [v171 isEqualToString:@"none"],
        v171,
        v170,
        (v172 & 1) == 0))
  {
    char v173 = [v368 allKeys];
    v376[0] = MEMORY[0x1E4F143A8];
    v376[1] = 3221225472;
    v376[2] = __1143__SASamplePrinter_addTaskHeaderToStream_displayName_pid_mainBinary_mainBinaryPath_sharedCaches_uid_bundleIdentifier_bundleVersion_bundleShortVersion_bundleBuildVersion_bundleProjectName_bundleSourceVersion_bundleProductBuildVersion_adamID_installerVersionID_developerType_appType_isBeta_cohortID_vendorID_distributorID_codesigningID_teamID_resourceCoalitionSampleCounts_onBehalfOfProcesses_architectureString_kernelVersion_parentName_responsibleName_taskExecedFromName_taskExecedToName_pidStartTimestamp_startTimestamp_endTimestamp_startSampleIndex_endSampleIndex_numSamples_totalNumSamples_numSamplesSuspended_numSamplesTerminated_startingTaskSize_endingTaskSize_maxTaskSize_startSampleIndexOfMaxTaskSize_endSampleIndexOfMaxTaskSize_numPageins_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_usesSuddenTermination_allowsIdleExit_isTranslocated_isUnresponsive_timeOfLastResponse_numThreads_numIdleWorkQueueThreads_numOtherHiddenThreads_hieSwallowedException_wqExceededConstrainedThreadLimit_wqExceededTotalThreadLimit_threadsDeadlocked_threadsBlockedByADeadlock_ioSize_numIOs_isReportHeader___block_invoke;
    v376[3] = &unk_1E63F96C8;
    id v174 = v368;
    id v377 = v174;
    id v175 = [v173 sortedArrayUsingComparator:v376];

    if (a40)
    {
      uint64_t v176 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v175, "count"));
      long long v372 = 0u;
      long long v373 = 0u;
      long long v374 = 0u;
      long long v375 = 0u;
      v335 = v175;
      obuint64_t j = v175;
      uint64_t v177 = [obj countByEnumeratingWithState:&v372 objects:v388 count:16];
      if (v177)
      {
        uint64_t v178 = v177;
        uint64_t v179 = *(void *)v373;
        do
        {
          for (uint64_t j = 0; j != v178; ++j)
          {
            if (*(void *)v373 != v179) {
              objc_enumerationMutation(obj);
            }
            uint64_t v181 = *(void *)(*((void *)&v372 + 1) + 8 * j);
            double v182 = [v174 objectForKeyedSubscript:v181];
            uint64_t v183 = [v182 unsignedLongLongValue];

            id v184 = [NSString alloc];
            double v185 = "s";
            if (v183 == 1) {
              double v185 = "";
            }
            v186 = (void *)[v184 initWithFormat:@"%llu sample%s %@", v183, v185, v181];
            [v176 addObject:v186];
          }
          uint64_t v178 = [obj countByEnumeratingWithState:&v372 objects:v388 count:16];
        }
        while (v178);
      }

      id v187 = v176;
      id v84 = v340;
      double v85 = v371;
      v115 = v355;
      uint64_t v114 = v356;
      uint64_t v87 = v352;
      uint64_t v109 = a1;
      id v175 = v335;
    }
    else
    {
      id v187 = v175;
    }
    uint64_t v188 = [v187 componentsJoinedByString:@", "];
    [v85 printWithFormat:@"%-*s%@\n", 18, "Resource Coalition: ", v188];

    uint64_t v86 = v366;
  }
  if (v87) {
    [v85 printWithFormat:@"%-*s%@\n", 18, "On Behalf Of: ", v87];
  }
  v112 = v345;
  double v139 = v357;
  if (([*(id *)(v109 + 16) systemstatsFormat] & 1) == 0)
  {
    if (v350) {
      [v85 printWithFormat:@"%-*s%@\n", 18, "Architecture: ", v350];
    }
    if (v347) {
      [v85 printWithFormat:@"%-*s%@\n", 18, "Execed from: ", v347];
    }
    if (v346) {
      [v85 printWithFormat:@"%-*s%@\n", 18, "Execed to: ", v346];
    }
    if (v349) {
      [v85 printWithFormat:@"%-*s%@\n", 18, "Parent: ", v349];
    }
    if (v348) {
      [v85 printWithFormat:@"%-*s%@\n", 18, "Responsible: ", v348];
    }
    if (a4 != -1) {
      objc_msgSend(v85, "printWithFormat:", @"%-*s%i\n", 18, "PID: ", a4);
    }
    if (a8 != -314) {
      objc_msgSend(v85, "printWithFormat:", @"%-*s%d\n", 18, "UID: ", a8);
    }
    if (a56)
    {
      objc_msgSend(v85, "printWithFormat:", @"%-*sTracked", 18, "Sudden Term: ");
      if (a57) {
        [v85 appendString:@" (allows idle exit)"];
      }
      [v85 appendString:@"\n"];
    }
    if (!a44)
    {
LABEL_283:
      if (a49) {
        objc_msgSend(v85, "printWithFormat:", @"%-*s%u pages\n", 18, "Pageins: ", a49);
      }
      if (a69)
      {
        if (a69 == 1) {
          id v213 = "";
        }
        else {
          id v213 = "s";
        }
        v214 = SAFormattedBytesEx(a68, 1, 0, 1, 0);
        [v85 printWithFormat:@"%-*s%lu I/O%s (%@)\n", 18, "I/O: ", a69, v213, v214];
      }
      [v341 wallTime];
      if (v215 != 0.0)
      {
        [*(id *)(v109 + 32) wallTime];
        if (v216 != 0.0)
        {
          [*(id *)(v109 + 32) wallTime];
          double v218 = v217;
          [v341 wallTime];
          double v220 = v218 - v219;
          if (v220 < 0.0) {
            double v220 = 0.0;
          }
          objc_msgSend(v85, "printWithFormat:", @"%-*s%.0fs\n", 18, "Time Since Fork: ", *(void *)&v220);
        }
      }
      v112 = v345;
      double v139 = v357;
      if (!v353
        || ([v353 gt:*(void *)(v109 + 32)] & 1) == 0
        && ![*(id *)(v109 + 16) microstackshotsFormat])
      {
        goto LABEL_324;
      }
      if ([v353 gt:*(void *)(v109 + 32)]) {
        double v221 = v353;
      }
      else {
        double v221 = *(void **)(v109 + 32);
      }
      [v221 wallTime];
      double v223 = v222;
      if (v222 == 0.0)
      {
        [*(id *)(v109 + 32) wallTime];
        if (v224 != 0.0)
        {
          [*(id *)(v109 + 32) machContTimeSeconds];
          if (v225 != 0.0)
          {
            [v353 machContTimeSeconds];
            if (v226 != 0.0)
            {
              [*(id *)(v109 + 32) wallTime];
              double v228 = v227;
              [v353 machContTimeSeconds];
              double v230 = v229;
              [*(id *)(v109 + 32) machContTimeSeconds];
LABEL_312:
              double v223 = v228 + v230 - v231;
              goto LABEL_313;
            }
          }
          [*(id *)(v109 + 32) machAbsTimeSeconds];
          if (v234 != 0.0)
          {
            [v353 machAbsTimeSeconds];
            if (v235 != 0.0)
            {
              [*(id *)(v109 + 32) wallTime];
              double v228 = v236;
              [v353 machAbsTimeSeconds];
              double v230 = v237;
              [*(id *)(v109 + 32) machAbsTimeSeconds];
              goto LABEL_312;
            }
          }
        }
      }
LABEL_313:
      if (v223 != 0.0)
      {
        if ([*(id *)(v109 + 16) omitAbsoluteWallTimes])
        {
          [*(id *)(v109 + 32) wallTime];
          if (v238 != 0.0)
          {
            int v239 = [*(id *)(v109 + 16) displayDetailedWallTime];
            [*(id *)(v109 + 32) wallTime];
            if (v239) {
              uint64_t v241 = 9;
            }
            else {
              uint64_t v241 = 3;
            }
            objc_msgSend(v85, "printWithFormat:", @"%-*s%.*fs\n", 18, "Start time: ", v241, v223 - v240);
          }
        }
        else
        {
          if ([*(id *)(v109 + 16) displayDetailedWallTime]) {
            int v242 = 9;
          }
          else {
            int v242 = 3;
          }
          unint64_t v243 = _CopyStringForTime(v242, v223);
          [v85 printWithFormat:@"%-*s%@\n", 18, "Start time: ", v243];
        }
      }
LABEL_324:
      if (v365
        && (([v365 lt:*(void *)(v109 + 40)] & 1) != 0
         || [*(id *)(v109 + 16) microstackshotsFormat]))
      {
        if ([v365 lt:*(void *)(v109 + 40)]) {
          unint64_t v244 = v365;
        }
        else {
          unint64_t v244 = *(void **)(v109 + 40);
        }
        [v244 wallTime];
        double v246 = v245;
        if (v245 == 0.0)
        {
          [*(id *)(v109 + 40) wallTime];
          if (v247 != 0.0)
          {
            [*(id *)(v109 + 40) machContTimeSeconds];
            if (v248 == 0.0 || ([v365 machContTimeSeconds], v249 == 0.0))
            {
              [*(id *)(v109 + 40) machAbsTimeSeconds];
              if (v255 != 0.0)
              {
                [v365 machAbsTimeSeconds];
                if (v256 != 0.0)
                {
                  [*(id *)(v109 + 40) wallTime];
                  double v258 = v257;
                  [*(id *)(v109 + 40) machAbsTimeSeconds];
                  double v260 = v259;
                  [v365 machAbsTimeSeconds];
                  double v246 = v258 + v260 - v261;
                }
              }
            }
            else
            {
              [*(id *)(v109 + 40) wallTime];
              double v251 = v250;
              [*(id *)(v109 + 40) machContTimeSeconds];
              double v253 = v252;
              [v365 machContTimeSeconds];
              double v246 = v251 - (v253 - v254);
            }
          }
        }
        if (v246 != 0.0)
        {
          if ([*(id *)(v109 + 16) omitAbsoluteWallTimes])
          {
            [*(id *)(v109 + 32) wallTime];
            if (v262 != 0.0)
            {
              int v263 = [*(id *)(v109 + 16) displayDetailedWallTime];
              [*(id *)(v109 + 32) wallTime];
              if (v263) {
                uint64_t v265 = 9;
              }
              else {
                uint64_t v265 = 3;
              }
              objc_msgSend(v85, "printWithFormat:", @"%-*s%.*fs\n", 18, "End time: ", v265, v246 - v264);
            }
          }
          else
          {
            if ([*(id *)(v109 + 16) displayDetailedWallTime]) {
              int v266 = 9;
            }
            else {
              int v266 = 3;
            }
            double v267 = _CopyStringForTime(v266, v246);
            [v85 printWithFormat:@"%-*s%@\n", 18, "End time: ", v267];
          }
        }
      }
      goto LABEL_349;
    }
    uint64_t v189 = SAFormattedBytesEx(a44, 1, 0, 1, 0);
    [v85 printWithFormat:@"%-*s%@", 18, "Footprint: ", v189];

    unint64_t v190 = a45;
    if (!a45 || (int v191 = 1, (double)a44 * 1.05 > (double)a45) && (double)a45 * 1.05 > (double)a44)
    {
      int v192 = [*(id *)(v109 + 16) displayAllTaskSizeChanges];
      unint64_t v190 = a45;
      int v191 = v192;
    }
    double v193 = v114;
    double v194 = v115;
    unint64_t v195 = v190 - a44;
    if (v190 >= a44 && v191)
    {
      id v196 = v84;
      double v197 = (double)v190;
    }
    else
    {
      id v196 = v84;
      double v197 = (double)a44;
    }
    if (v197 * 1.05 <= (double)a46)
    {
      uint64_t v206 = SAFormattedBytesEx(v190, 1, 0, 1, 0);
      double v207 = SAFormattedSignedBytes(v195, 1, 0);
      double v85 = v371;
      [v371 printWithFormat:@" -> %@ (%@)", v206, v207];
    }
    else
    {
      unint64_t v201 = v190;
      int v202 = [*(id *)(v109 + 16) displayAllTaskSizeChanges];
      double v85 = v371;
      if ((v191 | v202) != 1) {
        goto LABEL_282;
      }
      char v203 = v202;
      uint64_t v204 = SAFormattedBytesEx(v201, 1, 0, 1, 0);
      id v205 = SAFormattedSignedBytes(v195, 1, 0);
      [v371 printWithFormat:@" -> %@ (%@)", v204, v205];

      if ((v203 & 1) == 0)
      {
LABEL_282:
        [v85 appendString:@"\n"];
        uint64_t v86 = v366;
        id v84 = v196;
        v115 = v194;
        uint64_t v114 = v193;
        uint64_t v87 = v352;
        goto LABEL_283;
      }
    }
    -[SASamplePrinter timeIndexDescriptionForStartSampleIndex:endSampleIndex:formattedToLength:](v109, a47, a48, 0);
    id v208 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v209 = SAFormattedBytesEx(a46, 1, 0, 1, 0);
    id v210 = (void *)v209;
    id v211 = " ";
    if (!v208) {
      id v211 = "";
    }
    id v212 = &stru_1F1A80538;
    if (v208) {
      id v212 = v208;
    }
    [v85 printWithFormat:@" (max %@%s%@)", v209, v211, v212];

    goto LABEL_282;
  }
LABEL_349:
  if (a70) {
    goto LABEL_374;
  }
  objc_msgSend(v85, "printWithFormat:", @"%-*s%lu", 18, "Num samples: ", a40);
  if (!-[SASamplePrinter hasTimeIndexes](v109))
  {
    unint64_t v269 = (void *)a41;
    if (!a41 || ([*(id *)(v109 + 16) systemstatsFormat] & 1) != 0)
    {
      [v85 appendString:@"\n"];
LABEL_365:
      double v139 = v357;
      goto LABEL_374;
    }
    if (a41 >= a40)
    {
      objc_msgSend(v85, "printWithFormat:", @" (%.0f%%)\n", (double)a40 * 100.0 / (double)a41);
      goto LABEL_365;
    }
LABEL_444:
    int v321 = *__error();
    v322 = _sa_logt();
    if (os_log_type_enabled(v322, OS_LOG_TYPE_ERROR))
    {
      uint64_t v323 = [v362 UTF8String];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v383 = v323;
      __int16 v384 = 2048;
      uint64_t v385 = (uint64_t)v269;
      __int16 v386 = 2048;
      unint64_t v387 = v342;
      _os_log_error_impl(&dword_1BF22B000, v322, OS_LOG_TYPE_ERROR, "%s: totalNumSamples %lu < numSamples %lu", buf, 0x20u);
    }

    *__error() = v321;
    char v324 = [v362 UTF8String];
    _SASetCrashLogMessage(7244, "%s: totalNumSamples %lu < numSamples %lu", v325, v326, v327, v328, v329, v330, v324);
    _os_crash();
    __break(1u);
  }
  if (a38 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[SASamplePrinter hasTimeIndexes](v109))
    {
      int v270 = [*(id *)(v109 + 16) forceOneBasedTimeIndexes];
      uint64_t v271 = a38 + 1;
      if (v270) {
        v271 -= *(void *)(v109 + 48);
      }
    }
    else
    {
      uint64_t v271 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v85, "printWithFormat:", @" (%lu"), v271;
    if (a38 < a39)
    {
      if (-[SASamplePrinter hasTimeIndexes](v109))
      {
        int v273 = [*(id *)(v109 + 16) forceOneBasedTimeIndexes];
        uint64_t v274 = a39 + 1;
        if (v273) {
          v274 -= *(void *)(v109 + 48);
        }
      }
      else
      {
        uint64_t v274 = 0x7FFFFFFFFFFFFFFFLL;
      }
      objc_msgSend(v85, "printWithFormat:", @"-%lu", v274);
    }
    [v85 appendString:@"\n"]);
    goto LABEL_374;
  }
  if (v353 && [v353 gt:*(void *)(v109 + 40)])
  {
    id v268 = v353;
  }
  else
  {
    id v268 = v365;
    if (!v268) {
      goto LABEL_374;
    }
  }
  double v272 = -[SASamplePrinter timeIndexDescriptionForTimestamp:](v109, v268);
  [v85 printWithFormat:@" (task existed only %@)\n", v272];

  double v139 = v357;
LABEL_374:
  if (([*(id *)(v109 + 16) systemstatsFormat] & 1) == 0)
  {
    if (a50)
    {
      objc_msgSend(v85, "printWithFormat:", @"%-*s", 18, "CPU Time: ");
      if ([*(id *)(a1 + 16) displayDetailedCpuTime]) {
        uint64_t v275 = 9;
      }
      else {
        uint64_t v275 = 3;
      }
      saos_printf_seconds(v85, a50, v275);
      if (a52) {
        saos_printf_cycles_instructions(v85, a52, a51, [*(id *)(a1 + 16) displayDetailedCpuTime]);
      }
      [v85 appendString:@"\n"];
      int v276 = [*(id *)(a1 + 16) displayDetailedCpuTime];
      if (a53) {
        int v277 = v276;
      }
      else {
        int v277 = 0;
      }
      double v139 = v357;
      if (a53 > 0x98967F || v277)
      {
        objc_msgSend(v85, "printWithFormat:", @"%-*s", 18, "CPU Time (exited threads): ");
        if ([*(id *)(a1 + 16) displayDetailedCpuTime]) {
          uint64_t v278 = 9;
        }
        else {
          uint64_t v278 = 3;
        }
        saos_printf_seconds(v85, a53, v278);
        if (a55) {
          saos_printf_cycles_instructions(v85, a55, a54, [*(id *)(a1 + 16) displayDetailedCpuTime]);
        }
        [v85 appendString:@"\n"];
        double v139 = v357;
      }
    }
    if (a58) {
      objc_msgSend(v85, "printWithFormat:", @"%-*sTranslocated\n", 18, "Note: ");
    }
    if (a42)
    {
      uint64_t v279 = "s";
      if (a42 == 1) {
        uint64_t v279 = "";
      }
      objc_msgSend(v85, "printWithFormat:", @"%-*sSuspended for %lu sample%s\n", 18, "Note: ", a42, v279);
    }
    if (a43)
    {
      double v280 = "s";
      if (a43 == 1) {
        double v280 = "";
      }
      objc_msgSend(v85, "printWithFormat:", @"%-*sTerminated (zombie) for %lu sample%s\n", 18, "Note: ", a43, v280);
    }
    if (a59)
    {
      objc_msgSend(v85, "printWithFormat:", @"%-*sUnresponsive", 18, "Note: ");
      if (a9 > 0.0)
      {
        [*(id *)(a1 + 32) wallTime];
        if (v281 + -2.0 >= a9) {
          objc_msgSend(v85, "printWithFormat:", @" for %.0f seconds before sampling", v281 - a9);
        }
      }
      [v85 appendString:@"\n"];
    }
    if (a60) {
      objc_msgSend(v85, "printWithFormat:", @"%-*s%lu\n", 18, "Num threads: ", a60);
    }
    char v282 = [*(id *)(a1 + 16) displayIdleWorkQueueThreads];
    if (a61 && (v282 & 1) == 0)
    {
      double v283 = "s";
      if (a61 == 1) {
        double v283 = "";
      }
      objc_msgSend(v85, "printWithFormat:", @"%-*s%lu idle work queue thread%s omitted\n", 18, "Note: ", a61, v283);
    }
    if (a62)
    {
      double v284 = "s";
      if (a62 == 1) {
        double v284 = "";
      }
      objc_msgSend(v85, "printWithFormat:", @"%-*s%lu other thread%s omitted\n", 18, "Note: ", a62, v284);
    }
    if (a63) {
      objc_msgSend(v85, "printWithFormat:", @"%-*sProcess has swallowed at least one exception\n", 18, "Note: ");
    }
    if (a64) {
      objc_msgSend(v85, "printWithFormat:", @"%-*s%4d  (too many dispatch threads blocked in synchronous operations)\n", 18, "Dispatch Thread Soft Limit Reached: ", objc_msgSend(*(id *)(a1 + 160), "workQueueSoftThreadLimit"));
    }
    if (a65) {
      objc_msgSend(v85, "printWithFormat:", @"%-*s%4d  (too many dispatch threads blocked in synchronous operations)\n", 18, "Dispatch Thread Hard Limit Reached: ", objc_msgSend(*(id *)(a1 + 160), "workQueueHardThreadLimit"));
    }
    if ([v139 count])
    {
      uint64_t v285 = [v139 count];
      if ([v139 count] == 1) {
        double v286 = "";
      }
      else {
        double v286 = "s";
      }
      double v287 = [v139 componentsJoinedByString:@", "];
      id v333 = v286;
      double v85 = v371;
      [v371 printWithFormat:@"%-*s%lu thread%s - %@\n", 18, "Deadlocked: ", v285, v333, v287];

      double v139 = v357;
    }
    if ([v354 count])
    {
      uint64_t v288 = [v354 count];
      if ([v354 count] == 1) {
        double v289 = "";
      }
      else {
        double v289 = "s";
      }
      double v290 = [v354 componentsJoinedByString:@", "];
      v334 = v289;
      double v85 = v371;
      [v371 printWithFormat:@"%-*s%lu thread%s - %@\n", 18, "Blocked by Deadlock: ", v288, v334, v290];

      double v139 = v357;
    }
  }
LABEL_434:
}

uint64_t __30__SASamplePrinter_printHeader__block_invoke(void *a1, void *a2, unsigned char *a3)
{
  *a3 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  uint64_t result = [a2 cpuTimeNs:&v7 cpuInstructions:&v6 cpuCycles:&v5 betweenStartTime:a1[4] endTime:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) += v7;
  *(void *)(*(void *)(a1[7] + 8) + 24) += v6;
  *(void *)(*(void *)(a1[8] + 8) + 24) += v5;
  return result;
}

void __30__SASamplePrinter_printHeader__block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = (objc_class *)NSString;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = (void *)[[v7 alloc] initWithFormat:@"systemAdvisoryLevel%@", v9];

  SAJSONWriteDictionaryEntry(v6, v10, v8);
  *a4 = 0;
}

uint64_t __30__SASamplePrinter_printHeader__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) appendFormat:@"%@ -> %@, ", a2, a3];
  *a4 = 0;
  return result;
}

void __30__SASamplePrinter_printHeader__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  if (([v5 isPartOfADeadlock] & 1) != 0 || objc_msgSend(v5, "isBlockedByADeadlock"))
  {
    uint64_t v6 = [v5 threadState];
    uint64_t v7 = [v6 startTimestamp];
    if ([v7 gt:*(void *)(*(void *)(a1 + 32) + 40)])
    {

LABEL_5:
      goto LABEL_11;
    }
    id v8 = [v5 threadState];
    id v9 = [v8 endTimestamp];
    char v10 = [v9 lt:*(void *)(*(void *)(a1 + 32) + 32)];

    if ((v10 & 1) == 0)
    {
      if ([v5 isBlockedByADeadlock])
      {
        uint64_t v12 = *(void **)(a1 + 32);
        uint64_t v11 = *(void **)(a1 + 40);
        uint64_t v13 = [v5 task];
        char v14 = -[SASamplePrinter displayNameForTask:](v12, v13);
        [v11 addObject:v14];
      }
      if ([v5 isPartOfADeadlock]
        && ([*(id *)(a1 + 48) containsObject:v32] & 1) == 0)
      {
        [*(id *)(a1 + 48) addObject:v32];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        id v15 = *(void **)(a1 + 32);
        unint64_t v16 = [v5 task];
        uint64_t v17 = [v5 thread];
        char v18 = [v5 threadState];
        uint64_t v6 = -[SASamplePrinter displayNameForTask:thread:threadState:](v15, v16, v17, v18);

        [*(id *)(*(void *)(a1 + 32) + 8) printWithFormat:@"%-*s%@", 18, "Deadlock: ", v6];
        uint64_t v19 = [v5 dependency];
        id v20 = (id)v19;
        while (v20 && v20 != v5)
        {
          unsigned int v21 = v20;
          uint64_t v22 = *(void **)(a1 + 48);
          uint64_t v23 = NSNumber;
          unint64_t v24 = [v21 thread];
          id v25 = objc_msgSend(v23, "numberWithUnsignedLongLong:", objc_msgSend(v24, "threadId"));
          [v22 addObject:v25];

          uint64_t v26 = *(void **)(a1 + 32);
          uint64_t v27 = (void *)v26[1];
          uint64_t v28 = [v21 task];
          int v29 = [v21 thread];
          uint64_t v30 = [v21 threadState];
          uint64_t v31 = -[SASamplePrinter displayNameForTask:thread:threadState:](v26, v28, v29, v30);
          [v27 printWithFormat:@" -> %@", v31];

          id v20 = [v21 dependency];
        }
        [*(id *)(*(void *)(a1 + 32) + 8) printWithFormat:@" -> %@\n", v6];
        goto LABEL_5;
      }
    }
  }
LABEL_11:
}

void __30__SASamplePrinter_printHeader__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
}

void __30__SASamplePrinter_printHeader__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [a3 BOOLValue];
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) appendFormat:@"%@, ", v7];
}

void __30__SASamplePrinter_printHeader__block_invoke_1194(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    id v28 = v8;
    char v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_1198];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:32];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = [*(id *)(*((void *)&v29 + 1) + 8 * i) unsignedLongLongValue];
          if (-v15 == i) {
            uint64_t v19 = @"0x%llx";
          }
          else {
            uint64_t v19 = @", 0x%llx";
          }
          objc_msgSend(v11, "appendFormat:", v19, v18);
        }
        v15 += v14;
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    id v8 = v28;
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "printWithFormat:", @"%-*s", 18, "Network mount: ");
  if (!*(unsigned char *)(a1 + 48))
  {
    id v20 = *(void **)(*(void *)(a1 + 32) + 8);
    unsigned int v21 = SACopySanitizedString(v7, 1, 0);
    [v20 printWithFormat:@"%@ ", v21];
  }
  uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v23 = SACopySanitizedString(v8, 1, 0);
  [v22 printWithFormat:@"(%@)", v23];

  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 8);
  if (v11)
  {
    uint64_t v26 = [v9 count];
    uint64_t v27 = "s";
    if (v26 == 1) {
      uint64_t v27 = "";
    }
    [v25 printWithFormat:@" blocking thread%s %@", v27, v11];
  }
  else
  {
    [*(id *)(v24 + 8) appendString:@" unresponsive"];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) appendString:@"\n"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __30__SASamplePrinter_printHeader__block_invoke_2_1195(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __30__SASamplePrinter_printHeader__block_invoke_1225(void *a1, void *a2, uint64_t a3)
{
  int v5 = [a2 dispatchQueue];
  uint64_t v6 = (void *)a1[4];

  if (v5 == v6)
  {
    id v7 = (void *)a1[5];
    id v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v7 addObject:v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)addStackForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 task:(void *)a7 toRootObjects:(char)a8 nameChanges:(char)a9 dispatchQueueChanges:(char)a10 swiftTaskChanges:(char)a11 threadChanges:(char)a12 priorityChanges:(void *)a13 microstackshotSummary:(unsigned __int8)a14 onlyHeaviestStack:(unsigned __int8)a15 includeState:
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v108 = a2;
  id v107 = a3;
  id v23 = a4;
  id v24 = a5;
  id v106 = a6;
  id v104 = a7;
  id v105 = a13;
  if (a1)
  {
    int v25 = a14;
    uint64_t v26 = (const char *)MEMORY[0x1C18A6A20]();
    if (a14) {
      LODWORD(v27) = 1;
    }
    else {
      LODWORD(v27) = [*(id *)(a1 + 16) printHeavyStacks];
    }
    if ((v107 || v108 || !v23) && (v107 || !v108 || v23) && (!v107 || v108 || v23)) {
      goto LABEL_62;
    }
    int v15 = [*(id *)(a1 + 16) displayBlockedReasons];
    if (v15)
    {
      uint64_t v28 = [*(id *)(a1 + 16) displayBlockedReasonsLackingProcessOwners];
      if ([*(id *)(a1 + 16) displayAddressesInBlockedReasons]) {
        v28 |= 2uLL;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    char v98 = [*(id *)(a1 + 16) patchTruncatedStacks];
    char v94 = [*(id *)(a1 + 16) displayBlockedThreads];
    char v92 = [*(id *)(a1 + 16) displayRunnableThreads];
    char v89 = [*(id *)(a1 + 16) displayRunningThreads];
    char v97 = [*(id *)(a1 + 16) displayKernelFrames];
    char v96 = [*(id *)(a1 + 16) displayExclaveFrames];
    char v93 = [*(id *)(a1 + 16) displayUserFrames];
    char v88 = [*(id *)(a1 + 16) displayIOInCallTrees];
    BOOL v95 = [*(id *)(a1 + 16) callTreeTimestampsTimeDomain] != 0;
    char v91 = [*(id *)(a1 + 16) displayOnBehalfOfInCallTrees];
    char v103 = [*(id *)(a1 + 16) showThreadStateAsLeafFrame];
    char v90 = [*(id *)(a1 + 16) includeUserIdleAndBatteryStateInStacks];
    char v87 = [*(id *)(a1 + 16) omitStacksOnAC];
    char v86 = [*(id *)(a1 + 16) omitStacksOnBattery];
    char v85 = [*(id *)(a1 + 16) omitStacksWithUserIdle];
    char v84 = [*(id *)(a1 + 16) omitStacksWithUserActive];
    char v83 = [*(id *)(a1 + 16) omitStacksWithPCore];
    char v82 = [*(id *)(a1 + 16) omitStacksWithECore];
    int v81 = [*(id *)(a1 + 16) omitStacksBelowBasePriority];
    int v80 = [*(id *)(a1 + 16) omitStacksAboveBasePriority];
    if ([*(id *)(a1 + 16) swiftAsyncDisplayCRootCallstacks]) {
      char v79 = 1;
    }
    else {
      char v79 = [*(id *)(a1 + 16) swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
    }
    uint64_t v29 = *(void *)(a1 + 16);
    if (!v29) {
      goto LABEL_74;
    }
    uint64_t v30 = *(void *)(v29 + 152);
    if (!v30)
    {
      uint64_t v30 = 3;
      if (!*(unsigned char *)(v29 + 11)) {
        uint64_t v30 = 1;
      }
    }
    uint64_t v78 = v30;
    uint64_t v31 = *(void *)(v29 + 160);
    if (!v31)
    {
      uint64_t v31 = 2;
      if (!*(unsigned char *)(v29 + 14)) {
        uint64_t v31 = 3;
      }
    }
    for (uint64_t i = v31; ; uint64_t i = 0)
    {
      context = (char *)v26;
      uint64_t v99 = v28;
      BOOL v76 = (([(id)v29 printTargetThreadOnly] & 1) != 0 || v25)
         && (uint64_t v32 = *(void *)(a1 + 160)) != 0
         && (*(unsigned char *)(v32 + 326) & 1) != 0
         && *(void *)(a1 + 112) != 0;
      uint64_t v33 = [(id)a1 options];
      id v102 = [v33 tidsToPrint];

      id v34 = v106;
      if (!(v27 ^ 1 | (a15 & v103))) {
        id v34 = 0;
      }
      id v35 = v25 ? 0 : v34;
      if (v108) {
        break;
      }
      int v36 = a15;
      if (v107)
      {
        unint64_t v37 = 0;
        goto LABEL_46;
      }
      uint64_t v50 = [v23 indexOfFirstThreadStateOnOrAfterTime:*(void *)(a1 + 32) sampleIndex:*(void *)(a1 + 48)];
      if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_54;
      }
      unint64_t v37 = v50;
      if (!v24) {
        goto LABEL_46;
      }
      long long v51 = [NSNumber numberWithUnsignedInteger:v50];
      unint64_t v37 = objc_msgSend(v24, "indexOfObject:inSortedRange:options:usingComparator:", v51, 0, objc_msgSend(v24, "count"), 1280, &__block_literal_global_2111);

      if (v37 < [v24 count]) {
        goto LABEL_46;
      }
      a1 = v37;
      int v52 = *__error();
      id v53 = _sa_logt();
      LOBYTE(v15) = (_BYTE)v24;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        id v54 = [v23 debugDescription];
        uint64_t v55 = [v54 UTF8String];
        uint64_t v56 = [v24 count];
        *(_DWORD *)long long buf = 136315650;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a1;
        *(_WORD *)&buf[22] = 2048;
        double v194 = (uint64_t (*)(uint64_t, uint64_t))v56;
        _os_log_error_impl(&dword_1BF22B000, v53, OS_LOG_TYPE_ERROR, "%s: startingIndex %lu < threadStateIndexes.count %lu", buf, 0x20u);
      }
      *__error() = v52;
      id v57 = [v23 debugDescription];
      char v58 = [v57 UTF8String];
      [v24 count];
      _SASetCrashLogMessage(10457, "%s: startingIndex %lu < threadStateIndexes.count %lu", v59, v60, v61, v62, v63, v64, v58);

      _os_crash();
      __break(1u);
LABEL_62:
      int v25 = *__error();
      uint64_t v28 = _sa_logt();
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
        if (v23) {
          uint64_t v26 = "y";
        }
        else {
          uint64_t v26 = "n";
        }
        if (v108) {
          uint64_t v27 = "y";
        }
        else {
          uint64_t v27 = "n";
        }
        *(_DWORD *)long long buf = 136315650;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v27;
        if (v107) {
          int v65 = "y";
        }
        else {
          int v65 = "n";
        }
        *(_WORD *)&buf[22] = 2080;
        double v194 = (uint64_t (*)(uint64_t, uint64_t))v65;
        _os_log_error_impl(&dword_1BF22B000, (os_log_t)v28, OS_LOG_TYPE_ERROR, "aThread %s, dispatchQueue %s, swiftTaskStates %s", buf, 0x20u);
      }
      else
      {
        if (v23) {
          uint64_t v26 = "y";
        }
        else {
          uint64_t v26 = "n";
        }
        if (v108) {
          uint64_t v27 = "y";
        }
        else {
          uint64_t v27 = "n";
        }
      }

      *__error() = v25;
      _SASetCrashLogMessage(10391, "aThread %s, dispatchQueue %s, swiftTaskStates %s", v66, v67, v68, v69, v70, v71, (char)v26);
      uint64_t v29 = _os_crash();
      __break(1u);
LABEL_74:
      uint64_t v78 = 0;
    }
    int v36 = a15;
    unint64_t v37 = -[SARecipe indexOfFirstStateOnOrAfterTime:sampleIndex:]((uint64_t)v108, *(void **)(a1 + 32), *(void *)(a1 + 48));
    if (v37 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_54;
    }
LABEL_46:
    uint64_t v74 = v35;
    char v100 = (char)v27;
    char v75 = a8;
    v192[0] = 0;
    v192[1] = v192;
    v192[2] = 0x2020000000;
    v192[3] = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    double v194 = __Block_byref_object_copy__4;
    unint64_t v195 = __Block_byref_object_dispose__4;
    id v196 = 0;
    v190[0] = 0;
    v190[1] = v190;
    v190[2] = 0x3032000000;
    v190[3] = __Block_byref_object_copy__4;
    v190[4] = __Block_byref_object_dispose__4;
    id v191 = 0;
    v188[0] = 0;
    v188[1] = v188;
    v188[2] = 0x3032000000;
    v188[3] = __Block_byref_object_copy__4;
    v188[4] = __Block_byref_object_dispose__4;
    id v189 = 0;
    v186[0] = 0;
    v186[1] = v186;
    v186[2] = 0x3032000000;
    v186[3] = __Block_byref_object_copy__4;
    v186[4] = __Block_byref_object_dispose__4;
    id v187 = 0;
    v184[0] = 0;
    v184[1] = v184;
    v184[2] = 0x3032000000;
    v184[3] = __Block_byref_object_copy__4;
    v184[4] = __Block_byref_object_dispose__4;
    id v185 = 0;
    v182[0] = 0;
    v182[1] = v182;
    v182[2] = 0x3032000000;
    v182[3] = __Block_byref_object_copy__4;
    v182[4] = __Block_byref_object_dispose__4;
    id v183 = 0;
    v181[0] = 0;
    v181[1] = v181;
    v181[2] = 0x2020000000;
    v181[3] = 0x7FFFFFFFFFFFFFFFLL;
    v179[0] = 0;
    v179[1] = v179;
    v179[2] = 0x3032000000;
    v179[3] = __Block_byref_object_copy__4;
    v179[4] = __Block_byref_object_dispose__4;
    id v180 = 0;
    uint64_t v173 = 0;
    id v174 = &v173;
    uint64_t v175 = 0x3032000000;
    uint64_t v176 = __Block_byref_object_copy__4;
    uint64_t v177 = __Block_byref_object_dispose__4;
    id v178 = 0;
    uint64_t v169 = 0;
    id v170 = &v169;
    uint64_t v171 = 0x2020000000;
    uint64_t v172 = 0;
    v168[0] = 0;
    v168[1] = v168;
    v168[2] = 0x2020000000;
    v168[3] = 0x7FFFFFFFFFFFFFFFLL;
    v166[0] = 0;
    v166[1] = v166;
    v166[2] = 0x2020000000;
    char v167 = 0;
    uint64_t v73 = *(void **)(a1 + 40);
    int v38 = v36;
    unsigned int v72 = -[SASamplePrinter hasTimeIndexes](a1) & (v27 ^ 1);
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke_2114;
    v109[3] = &unk_1E63F9A68;
    v109[4] = a1;
    char v137 = 0;
    id v110 = v106;
    unint64_t v131 = v37;
    id v111 = v23;
    id v39 = v24;
    unint64_t v40 = v37;
    id v41 = v24;
    id v42 = v23;
    id v43 = v39;
    id v112 = v39;
    id v44 = v108;
    id v113 = v44;
    id v45 = v107;
    id v114 = v45;
    id v115 = v102;
    v118 = v168;
    BOOL v138 = v76;
    v119 = v181;
    v120 = &v169;
    char v139 = v89;
    char v140 = v92;
    char v141 = v94;
    int v135 = v80;
    int v136 = v81;
    char v142 = v84;
    char v143 = v85;
    char v144 = v86;
    char v145 = v87;
    char v146 = v83;
    char v147 = v82;
    char v148 = v79;
    uint64_t v133 = v78;
    char v149 = v88;
    v121 = v166;
    v122 = v192;
    v123 = buf;
    v124 = v190;
    int v125 = &v173;
    char v150 = v38;
    char v151 = (char)v27;
    v126 = v179;
    BOOL v127 = v182;
    char v128 = v186;
    uint64_t v132 = i;
    double v129 = v184;
    char v152 = a9;
    char v153 = a10;
    char v154 = a12;
    char v155 = v75;
    char v156 = a11;
    char v157 = v93;
    char v158 = v97;
    char v159 = v96;
    id v46 = v104;
    id v116 = v46;
    double v130 = v188;
    char v160 = v98;
    char v161 = v15;
    char v162 = v91;
    char v163 = v103;
    char v164 = v90;
    id v117 = v105;
    uint64_t v134 = v99;
    BOOL v165 = v95;
    long long v47 = v43;
    id v23 = v42;
    id v24 = v41;
    -[SASamplePrinter iterateDispatchQueue:orSwiftTaskStates:orThread:threadStateIndexes:startingAtIndex:endingAfterTimestamp:task:stopAtTimeJumps:callback:](a1, v44, v45, v111, v47, v40, v73, v74, v72, v109);
    if (v38)
    {
      if ((v100 & 1) == 0)
      {
        uint64_t v48 = v170[3];
        if (v174[5] || v48)
        {
          -[SASamplePrinter stateChangeStringForThreadState:serialDispatchQueue:swiftTaskStates:thread:threadStateIndexes:taskState:task:iteratorIndex:missingStateIsInAnotherStack:numSamplesOmittedSincePreviousDisplayedSample:sampleTimestamp:previousSampleTimestamp:previousDisplayedTimestamp:previousTaskState:previousThread:previousThreadState:dispatchQueueChanges:swiftTaskChanges:priorityChanges:nameChanges:threadChanges:isTimeJump:ioEventsSincePreviousThreadState:](a1, 0, v44, v45, 0, 0, 0, 0, 0, 0, v48, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
          long long v49 = (void *)v174[5]);
          if (v49) {
            [v46 addObject:v49];
          }
        }
      }
    }

    _Block_object_dispose(v166, 8);
    _Block_object_dispose(v168, 8);
    _Block_object_dispose(&v169, 8);
    _Block_object_dispose(&v173, 8);

    _Block_object_dispose(v179, 8);
    _Block_object_dispose(v181, 8);
    _Block_object_dispose(v182, 8);

    _Block_object_dispose(v184, 8);
    _Block_object_dispose(v186, 8);

    _Block_object_dispose(v188, 8);
    _Block_object_dispose(v190, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v192, 8);
LABEL_54:
  }
}

void __30__SASamplePrinter_printHeader__block_invoke_2_1238(uint64_t a1, uint64_t a2, void *a3)
{
}

- (id)binaryImagesHitByTask:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = *(void **)(a1 + 128);
    id v5 = v4;
    if (!v4)
    {
      id v5 = [*(id *)(a1 + 160) targetProcess];
    }
    id v6 = v3;
    id v7 = v6;
    if (v5 != v3
      && (uint64_t v8 = *(void *)(a1 + 16)) != 0
      && (uint64_t v9 = *(void *)(v8 + 168), v9 != 1)
      && (v9 || *(unsigned char *)(v8 + 11))
      && ([v6 mainBinary], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v11 = (void *)v10;
      if ([*(id *)(a1 + 16) taskAggregation] == 3)
      {
        id v12 = (void *)[v7 resourceCoalitionID];
        if (v12)
        {
          uint64_t v13 = [v7 sharedCache];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
        id v12 = 0;
      }
      uint64_t v14 = -[SATaskAggregationIdentifier initWithBinary:sharedCache:rcid:]((id *)[SATaskAggregationIdentifier alloc], v11, v13, v12);
    }
    else
    {
      uint64_t v14 = [NSNumber numberWithUnsignedLong:v7];
    }

    if (!v4) {
    int v15 = [*(id *)(a1 + 72) objectForKeyedSubscript:v14];
    }
    if (!v15)
    {
      int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
      [*(id *)(a1 + 72) setObject:v15 forKeyedSubscript:v14];
    }
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

- (void)addStack:(void *)a3 toStream:(unint64_t)a4 sampleCount:(void *)a5 binariesToDisplay:(uint64_t)a6 primaryState:(int)a7 primaryMicrostackshotState:(char)a8 onlyHeaviestStack:
{
  id v15 = a2;
  id v41 = a3;
  id v40 = a5;
  uint64_t v16 = (void *)MEMORY[0x1C18A6A20]();
  BOOL v17 = 1;
  char v39 = a8;
  if (([*(id *)(a1 + 16) printHeavyStacks] & 1) == 0 && (a8 & 1) == 0) {
    BOOL v17 = !-[SASamplePrinter hasTimeIndexes](a1);
  }
  int v18 = [*(id *)(a1 + 16) printJson];
  if ([*(id *)(a1 + 16) displayBlockedReasons])
  {
    uint64_t v19 = [*(id *)(a1 + 16) displayBlockedReasonsLackingProcessOwners];
    if ([*(id *)(a1 + 16) displayAddressesInBlockedReasons]) {
      v19 |= 2uLL;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  char v38 = [*(id *)(a1 + 16) showThreadStateAsLeafFrame];
  BOOL v37 = [*(id *)(a1 + 16) callTreeTimestampsTimeDomain] != 0;
  char v36 = [*(id *)(a1 + 16) displayOnBehalfOfInCallTrees];
  if (v17)
  {
    id v20 = &__block_literal_global_2147;
    [v15 sortUsingComparator:&__block_literal_global_2147];
    id v35 = &__block_literal_global_2156;
  }
  else
  {
    id v20 = 0;
    id v35 = 0;
  }
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x2020000000;
  char v107 = 1;
  if (v18) {
    [v41 appendString:@",\n\n\"stack\":["];
  }
  uint64_t v34 = v19;
  double v21 = log10((double)a4 + 1.0);
  uint64_t v33 = -[SASampleStore lastTaskWithPid:](*(void **)(a1 + 160), 0);
  if ([*(id *)(a1 + 16) omitFramesBelowSampleCount] < 1) {
    unint64_t v22 = 0;
  }
  else {
    unint64_t v22 = [*(id *)(a1 + 16) omitFramesBelowSampleCount];
  }
  if ((int)[*(id *)(a1 + 16) omitFramesBelowPercentOfStackSamples] >= 1)
  {
    int v23 = [*(id *)(a1 + 16) omitFramesBelowPercentOfStackSamples];
    if (v22 <= v23 * a4 / 0x64) {
      unint64_t v22 = v23 * a4 / 0x64;
    }
  }
  int v43 = v18;
  uint64_t v32 = a6;
  if ([*(id *)(a1 + 16) omitFramesAfterLineCount] < 1) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = [*(id *)(a1 + 16) omitFramesAfterLineCount];
  }
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  v105[3] = 0;
  v103[0] = 0;
  v103[1] = v103;
  v103[2] = 0x2020000000;
  int v104 = -1;
  uint64_t v99 = 0;
  char v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x2020000000;
  int v98 = 0;
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x2020000000;
  char v96 = 0;
  uint64_t v91 = 0;
  char v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  uint64_t v87 = 0;
  char v88 = &v87;
  uint64_t v89 = 0x2020000000;
  int v90 = 0;
  uint64_t v81 = 0;
  char v82 = &v81;
  uint64_t v83 = 0x3032000000;
  char v84 = __Block_byref_object_copy__4;
  char v85 = __Block_byref_object_dispose__4;
  id v86 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v73 = 0;
  uint64_t v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2162;
  v44[3] = &unk_1E63F9B00;
  char v67 = v39;
  uint64_t v50 = v105;
  long long v51 = v103;
  int v52 = v97;
  id v53 = &v99;
  uint64_t v61 = v24;
  unint64_t v62 = v22;
  v44[4] = a1;
  id v48 = v20;
  char v68 = v18;
  id v54 = v95;
  uint64_t v55 = v106;
  id v25 = v41;
  BOOL v69 = v17;
  id v45 = v25;
  uint64_t v56 = &v73;
  id v57 = &v87;
  unsigned int v42 = vcvtpd_u64_f64(v21);
  unsigned int v65 = v42;
  char v58 = &v77;
  uint64_t v59 = &v91;
  uint64_t v60 = &v81;
  id v26 = v33;
  id v46 = v26;
  id v27 = v40;
  char v70 = v38;
  id v47 = v27;
  id v49 = v35;
  char v71 = v36;
  int v66 = a7;
  uint64_t v63 = v32;
  uint64_t v64 = v34;
  BOOL v72 = v37;
  +[SACallTreeFrame enumerateTree:block:]((uint64_t)SACallTreeFrame, v15, v44);
  uint64_t v28 = (void *)v100[3];
  if (v28)
  {
    free(v28);
    v100[3] = 0;
  }
  uint64_t v29 = v74[3];
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v17)
    {
      saos_printf_frame(v25, *((unsigned int *)v88 + 6), v42, v29 - v78[3] + 1, *((unsigned __int8 *)v92 + 24), (void *)v82[5]);
    }
    else
    {
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v30 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        unint64_t v31 = v29 + 1;
        if (v30) {
          v31 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
      }
      saos_printf_timeline_frame(v25, *((unsigned int *)v88 + 6), v42, v74[3] - v78[3] + 1, *((unsigned __int8 *)v92 + 24), (void *)v82[5], v31);
    }
  }
  if (v43) {
    [v25 appendString:@"]\n"];
  }

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(v95, 8);
  _Block_object_dispose(v97, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(v103, 8);
  _Block_object_dispose(v105, 8);

  _Block_object_dispose(v106, 8);
}

- (void)printBinaryImagesForTask:(uint64_t)a1
{
  id v3 = a2;
  -[SASamplePrinter binaryImagesHitByTask:](a1, v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 mainBinaryLoadInfo];

  if (v4)
  {
    if ([v4 loadAddress])
    {
      id v5 = [v4 binary];
      id v6 = [v14 objectForKeyedSubscript:v5];
      uint64_t v7 = [v6 count];

      if (!v7) {
        id v8 = -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:](a1, v4, 0, v14);
      }
    }
  }
  if ([v14 count])
  {
    uint64_t v9 = -[SASamplePrinter sortedLoadInfosForBinaryImages:](a1, v14);
    if ([v9 count])
    {
      uint64_t v10 = *(void **)(a1 + 16);
      id v11 = v9;
      int v12 = [v10 printJson];
      uint64_t v13 = *(void **)(a1 + 8);
      if (v12) {
        [v13 appendString:@",\"binaryImages\":"];
      }
      else {
        objc_msgSend(v13, "printWithFormat:", @"\n%*sBinary Images:\n", 2, "");
      }
      -[SASamplePrinter printLoadInfos:]((id *)a1, v11);
    }
  }
}

- (void)printHIDEvent:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 hidEventTimestamp];
  id v5 = *(void **)(a1 + 8);
  id v6 = [v3 hidEventTypeString];
  [v5 printWithFormat:@"HID event %@", v6];

  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    uint64_t v7 = *(void **)(a1 + 8);
    id v8 = -[SASamplePrinter timeIndexDescriptionForTimestamp:](a1, v4);
    [v7 printWithFormat:@" started %@\n", v8];

    goto LABEL_18;
  }
  [v4 machAbsTimeSeconds];
  double v9 = 0.0;
  if (v10 == 0.0 || ([*(id *)(a1 + 32) machAbsTimeSeconds], v11 == 0.0))
  {
    int v15 = 0;
  }
  else
  {
    [v4 machAbsTimeSeconds];
    double v13 = v12;
    [*(id *)(a1 + 32) machAbsTimeSeconds];
    double v9 = v13 - v14;
    int v15 = 1;
  }
  [v4 machContTimeSeconds];
  if (v16 != 0.0)
  {
    [*(id *)(a1 + 32) machContTimeSeconds];
    if (v17 != 0.0)
    {
      [v4 machContTimeSeconds];
      double v19 = v18;
      [*(id *)(a1 + 32) machContTimeSeconds];
      double v9 = v19 - v20;
      int v15 = 1;
    }
  }
  [v4 wallTime];
  if (v21 == 0.0 || ([*(id *)(a1 + 32) wallTime], v22 == 0.0))
  {
    if (!v15)
    {
      objc_msgSend(*(id *)(a1 + 8), "printWithFormat:", @"\n", v60);
      goto LABEL_18;
    }
  }
  else
  {
    [v4 wallTime];
    double v24 = v23;
    [*(id *)(a1 + 32) wallTime];
    double v9 = v24 - v25;
  }
  id v26 = *(void **)(a1 + 8);
  if (v9 >= 0.0) {
    objc_msgSend(v26, "printWithFormat:", @" started %.1f seconds after start of sampling\n", *(void *)&v9);
  }
  else {
    objc_msgSend(v26, "printWithFormat:", @" started %.1f seconds before sampling\n", -v9);
  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 8), "printWithFormat:", @"%-48s %-11s %11s  %s\n", "Event", "Time Index", "Delay", "Process/Thread");
  id v27 = *(void **)(a1 + 8);
  -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)a1, 0, 0, *(void **)(a1 + 32));
  id v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "printWithFormat:", @"%-48s %-11s %11s  %s\n", "handleReport", "No samples", "N/A", objc_msgSend(v28, "UTF8String"));

  id v29 = v4;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = [v3 steps];
  uint64_t v61 = v29;
  uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v66 != v63) {
          objc_enumerationMutation(obj);
        }
        unint64_t v31 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v32 = [v31 timestamp];
        uint64_t v33 = [v31 debugidString];
        [v32 machAbsTimeSeconds];
        double v35 = v34;
        [v29 machAbsTimeSeconds];
        double v37 = ReduceToSignificantDigits(2, 0, (v35 - v36) * 1000.0);
        id v38 = v29;
        id v29 = v32;
        char v39 = &stru_1F1A80538;
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          unint64_t v40 = [*(id *)(a1 + 160) indexOfFirstSampleOnOrAfterTimestamp:v38];
          unint64_t v41 = [*(id *)(a1 + 160) indexOfLastSampleOnOrBeforeTimestamp:v29];
          unint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v44 = *(void *)(a1 + 48);
            unint64_t v43 = *(void *)(a1 + 56);
            BOOL v45 = v44 <= v40 || v44 == 0x7FFFFFFFFFFFFFFFLL;
            unint64_t v42 = v45 ? v40 : *(void *)(a1 + 48);
            if (v43 != 0x7FFFFFFFFFFFFFFFLL && v43 < v42) {
              unint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          char v39 = @"No samples";
          if (v41 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v47 = *(void *)(a1 + 48);
            unint64_t v46 = *(void *)(a1 + 56);
            if (v46 >= v41 || v46 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v46 = v41;
            }
            if (v47 <= v46) {
              uint64_t v49 = v46;
            }
            else {
              uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v47 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v50 = v46;
            }
            else {
              unint64_t v50 = v49;
            }
            if (v42 != 0x7FFFFFFFFFFFFFFFLL && v50 != 0x7FFFFFFFFFFFFFFFLL && v42 <= v50)
            {
              -[SASamplePrinter timeIndexDescriptionForStartSampleIndex:endSampleIndex:formattedToLength:](a1, v42, v50, 0xBu);
              char v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
        }

        uint64_t v52 = [v31 pid];
        uint64_t v53 = [v31 tid];
        id v54 = [v31 timestamp];
        uint64_t v55 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)a1, v52, v53, v54);

        uint64_t v56 = *(void **)(a1 + 8);
        id v57 = v33;
        uint64_t v58 = [v57 UTF8String];
        uint64_t v59 = v39;
        [v56 printWithFormat:@"%-48s %-11s %9.3fms  %@\n", v58, -[__CFString UTF8String](v59, "UTF8String"), *(void *)&v37, v55];
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v64);
  }
}

- (void)printLoadInfos:(id *)a1
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![a1[2] printJson])
  {
    id v101 = v3;
    if ([a1[2] tabDelineateBinaryImageSections])
    {
      uint64_t v106 = 0;
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      goto LABEL_58;
    }
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    obuint64_t j = v3;
    uint64_t v111 = [obj countByEnumeratingWithState:&v121 objects:v133 count:16];
    if (!v111)
    {
      uint64_t v106 = 0;
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      goto LABEL_57;
    }
    uint64_t v106 = 0;
    uint64_t v107 = 0;
    uint64_t v108 = 0;
    uint64_t v109 = *(void *)v122;
    int v4 = 1;
    while (1)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v122 != v109) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v121 + 1) + 8 * v5);
        uint64_t v7 = [v6 binary];
        id v8 = [v7 bundleIdentifier];
        double v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [v7 name];
        }
        if (([a1[2] displayBinaryImagesLackingNameOrPath] & 1) == 0 && !v10)
        {
          if (((v4 | [a1[2] displayBinaryImageAddresses]) & 1) == 0) {
            goto LABEL_50;
          }
LABEL_19:
          id v113 = v10;
          int v12 = [@"???" length];
          goto LABEL_20;
        }
        if (!v10) {
          goto LABEL_19;
        }
        id v113 = v10;
        double v11 = SACopySanitizedString(v10, 1, 0);
        int v12 = [v11 length];

LABEL_20:
        uint64_t v13 = [v7 bundleVersion];
        double v14 = [v7 bundleShortVersion];
        uint64_t v15 = [v7 binaryVersion];
        id v115 = (void *)v15;
        if (v14 || v13 || v15)
        {
          ++v12;
          if (v14)
          {
            uint64_t v16 = v13 | v15;
            double v17 = SACopySanitizedString(v14, 1, 0);
            int v18 = [v17 length];

            if (v16) {
              int v19 = v12 + 1;
            }
            else {
              int v19 = v12;
            }
            int v12 = v19 + v18;
            if (!v16) {
              goto LABEL_32;
            }
LABEL_28:
            if (v13) {
              double v20 = (void *)v13;
            }
            else {
              double v20 = v115;
            }
            double v21 = SACopySanitizedString(v20, 1, 0);
            v12 += [v21 length] + 2;

            goto LABEL_32;
          }
          if (v13 | v15) {
            goto LABEL_28;
          }
        }
LABEL_32:
        if ((int)v108 <= v12) {
          uint64_t v22 = v12;
        }
        else {
          uint64_t v22 = v108;
        }
        uint64_t v108 = v22;
        double v23 = [v6 exclave];
        double v24 = v23;
        if (v23)
        {
          double v25 = [v23 name];

          if (v25)
          {
            id v26 = [v24 name];
            int v27 = [v26 length] + 9;
          }
          else
          {
            int v27 = 27;
          }
          if ((int)v107 <= v27) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = v107;
          }
          uint64_t v107 = v28;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v6 isZerothAndOnlySegment] & 1) == 0)
        {
          id v29 = [v6 segment];
          int v30 = [v29 name];
          int v31 = [v30 length];

          if ((int)v106 <= v31) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = v106;
          }
          uint64_t v106 = v32;
        }

        id v10 = v113;
LABEL_50:

        int v4 = 0;
        ++v5;
      }
      while (v111 != v5);
      uint64_t v33 = [obj countByEnumeratingWithState:&v121 objects:v133 count:16];
      int v4 = 0;
      uint64_t v111 = v33;
      if (!v33)
      {
LABEL_57:

        id v3 = v101;
LABEL_58:
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v102 = v3;
        id obja = (id)[v102 countByEnumeratingWithState:&v117 objects:v132 count:16];
        if (!obja) {
          goto LABEL_168;
        }
        int v34 = 1;
        uint64_t v103 = *(void *)v118;
        while (2)
        {
          uint64_t v35 = 0;
LABEL_61:
          if (*(void *)v118 != v103) {
            objc_enumerationMutation(v102);
          }
          double v36 = *(void **)(*((void *)&v117 + 1) + 8 * v35);
          double v37 = [v36 binary];
          id v38 = [v36 segment];
          id v112 = [v36 exclave];
          char v39 = [v37 bundleIdentifier];
          unint64_t v40 = v39;
          if (v39)
          {
            id v41 = v39;
          }
          else
          {
            id v41 = [v37 name];
          }
          if (([a1[2] displayBinaryImagesLackingNameOrPath] & 1) == 0
            && !v41
            && ((v34 | [a1[2] displayBinaryImageAddresses]) & 1) == 0)
          {
            goto LABEL_162;
          }
          memset(v131, 0, sizeof(v131));
          if ([v36 isInKernelAddressSpace])
          {
            LOWORD(v131[0]) = 42;
            uint64_t v42 = 1;
          }
          else
          {
            uint64_t v42 = 0;
          }
          id v114 = v41;
          if ([a1[2] displayBinaryImageAddresses])
          {
            if ([v36 loadAddress])
            {
              uint64_t v43 = v42
                  + snprintf((char *)((unint64_t)v131 | v42), 64 - v42, "0x%llx", [v36 loadAddress]);
              if (v43 >= 64)
              {
                int v83 = *__error();
                char v84 = _sa_logt();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218242;
                  uint64_t v126 = v43;
                  __int16 v127 = 2080;
                  char v128 = v131;
                  _os_log_error_impl(&dword_1BF22B000, v84, OS_LOG_TYPE_ERROR, "ran off end of adornment  (%ld): '%s'", buf, 0x16u);
                }

                *__error() = v83;
                _SASetCrashLogMessage(7710, "ran off end of adornment  (%ld): '%s'", v86, v87, v88, v89, v90, v91, v43);
                _os_crash();
                __break(1u);
LABEL_173:
                int v92 = *__error();
                uint64_t v93 = _sa_logt();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218242;
                  uint64_t v126 = v43;
                  __int16 v127 = 2080;
                  char v128 = v131;
                  _os_log_error_impl(&dword_1BF22B000, v93, OS_LOG_TYPE_ERROR, "ran off end of adornment  (%ld): '%s'", buf, 0x16u);
                }

                *__error() = v92;
                _SASetCrashLogMessage(7713, "ran off end of adornment  (%ld): '%s'", v94, v95, v96, v97, v98, v99, v43);
                _os_crash();
                __break(1u);
              }
            }
            else
            {
              uint64_t v43 = v42 + snprintf((char *)((unint64_t)v131 | v42), 64 - v42, "%s", "???");
              if (v43 >= 64) {
                goto LABEL_173;
              }
            }
            objc_msgSend(a1[1], "printWithFormat:", @"%*s", 22, v131);
            if (v38)
            {
              unint64_t v46 = [v38 length];
              if (!v46)
              {
LABEL_83:
                unint64_t v46 = [v37 length];
                if (!v46) {
                  goto LABEL_99;
                }
              }
LABEL_93:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || [v36 highestOffset] < v46)
              {
                objc_msgSend(a1[1], "printWithFormat:", @" - %#18llx", v46 + objc_msgSend(v36, "loadAddress") - 1);
                goto LABEL_100;
              }
              int v50 = *__error();
              long long v51 = _sa_logt();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                id v79 = [v36 debugDescription];
                uint64_t v80 = [v79 UTF8String];
                uint64_t v81 = [v36 highestOffset];
                *(_DWORD *)long long buf = 136315650;
                uint64_t v126 = v80;
                __int16 v127 = 2048;
                char v128 = (_OWORD *)v46;
                __int16 v129 = 2048;
                uint64_t v130 = v81;
                _os_log_error_impl(&dword_1BF22B000, v51, OS_LOG_TYPE_ERROR, "load info %s length 0x%llx has a hit at 0x%llx", buf, 0x20u);
              }
              *__error() = v50;
              id v41 = v114;
            }
            else
            {
              if ([v37 length]) {
                goto LABEL_83;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                unint64_t v47 = [v36 highestOffset];
              }
              else {
                unint64_t v47 = 0;
              }
              id v48 = -[SABinary segmentAtOffsetIntoBinary:](v37, 0);
              uint64_t v49 = v48;
              if (v48
                && [v48 hasOffsetIntoBinary]
                && ![v49 offsetIntoBinary]
                && [v49 length]
                && v47 < [v49 length])
              {
                unint64_t v46 = [v49 length];
              }
              else
              {
                unint64_t v46 = 0;
              }

              if (v46) {
                goto LABEL_93;
              }
            }
LABEL_99:
            objc_msgSend(a1[1], "printWithFormat:", @" - %18s", "???");
LABEL_100:
            if ([a1[2] tabDelineateBinaryImageSections]) {
              uint64_t v52 = @"\t";
            }
            else {
              uint64_t v52 = @"  ";
            }
            [a1[1] appendString:v52];
            if (!v41)
            {
LABEL_104:
              BOOL v45 = (void *)[@"???" mutableCopy];
LABEL_105:
              id v110 = v38;
              if ([a1[2] tabDelineateBinaryImageSections]) {
                [v45 appendString:@"\t"];
              }
              uint64_t v53 = [v37 bundleVersion];
              id v54 = [v37 bundleShortVersion];
              uint64_t v116 = [v37 binaryVersion];
              if (v54 || v53 || v116)
              {
                if (([a1[2] tabDelineateBinaryImageSections] & 1) == 0) {
                  [v45 appendString:@" "];
                }
                if (v54)
                {
                  uint64_t v55 = SACopySanitizedString(v54, 1, 0);
                  [v45 appendFormat:@"%@", v55];

                  if (v53 | v116)
                  {
                    [v45 appendString:@" "];
                    goto LABEL_116;
                  }
                }
                else if (v53 | v116)
                {
LABEL_116:
                  if (v53) {
                    uint64_t v56 = (void *)v53;
                  }
                  else {
                    uint64_t v56 = (void *)v116;
                  }
                  id v57 = SACopySanitizedString(v56, 1, 0);
                  [v45 appendFormat:@"(%@)", v57];
                }
              }
              id v58 = a1[1];
              id v59 = v45;
              objc_msgSend(v58, "printWithFormat:", @"%-*s", v108, objc_msgSend(v59, "UTF8String"));
              if ([a1[2] tabDelineateBinaryImageSections]) {
                [a1[1] appendString:@"\t"];
              }
              if (([a1[2] tabDelineateBinaryImageSections] & 1) == 0 && (int)v107 >= 1)
              {
                id v60 = a1[1];
                if (v112)
                {
                  uint64_t v61 = [v112 name];
                  if (v61)
                  {
                    unint64_t v62 = [v112 name];
                  }
                  else
                  {
                    unint64_t v62 = objc_msgSend([NSString alloc], "initWithFormat:", @"%#18llx", objc_msgSend(v112, "identifier"));
                  }
                  id v63 = v62;
                  objc_msgSend(v60, "printWithFormat:", @" exclave %-*s", (v107 - 9), objc_msgSend(v63, "UTF8String"));
                }
                else
                {
                  objc_msgSend(v60, "printWithFormat:", @"%-*s", v107, "");
                }
              }
              uint64_t v64 = [v37 uuid];

              id v41 = v114;
              if (v64)
              {
                if (([a1[2] tabDelineateBinaryImageSections] & 1) == 0) {
                  [a1[1] appendString:@" "];
                }
                id v65 = a1[1];
                long long v66 = [v37 uuid];
                long long v67 = [v66 UUIDString];
                [v65 printWithFormat:@"<%@>", v67];

                id v41 = v114;
              }
              if ([a1[2] tabDelineateBinaryImageSections]) {
                [a1[1] appendString:@"\t"];
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                char v68 = [v36 isZerothAndOnlySegment];
              }
              else {
                char v68 = 0;
              }
              if ([a1[2] tabDelineateBinaryImageSections])
              {
                if (v110) {
                  char v69 = v68;
                }
                else {
                  char v69 = 1;
                }
                if ((v69 & 1) == 0)
                {
                  id v70 = a1[1];
                  id v71 = [v110 name];
                  objc_msgSend(v70, "printWithFormat:", @"%s", objc_msgSend(v71, "UTF8String"), v100);
                  goto LABEL_152;
                }
              }
              else if ((int)v106 >= 1)
              {
                if (v110) {
                  char v72 = v68;
                }
                else {
                  char v72 = 1;
                }
                id v73 = a1[1];
                if (v72)
                {
                  objc_msgSend(v73, "printWithFormat:", @"%-*s", v106, "");
                }
                else
                {
                  id v71 = [v110 name];
                  objc_msgSend(v73, "printWithFormat:", @"%-*s", v106, objc_msgSend(v71, "UTF8String"));
LABEL_152:
                }
              }
              if ([a1[2] tabDelineateBinaryImageSections]) {
                [a1[1] appendString:@"\t"];
              }
              uint64_t v74 = [v37 path];
              if (v74)
              {
                uint64_t v75 = (void *)v74;
                if (([a1[2] tabDelineateBinaryImageSections] & 1) == 0) {
                  [a1[1] appendString:@"  "];
                }
                if ([a1[20] sanitizePaths])
                {
                  id v76 = v75;
                }
                id v77 = a1[1];
                uint64_t v78 = SACopySanitizedString(v75, 1, 0);
                [v77 printWithFormat:@"%@", v78];

                id v41 = v114;
              }
              [a1[1] appendString:@"\n"];

              id v38 = v110;
LABEL_162:

              int v34 = 0;
              if (obja == (id)++v35)
              {
                uint64_t v82 = [v102 countByEnumeratingWithState:&v117 objects:v132 count:16];
                int v34 = 0;
                id obja = (id)v82;
                if (!v82)
                {
LABEL_168:

                  id v3 = v101;
                  goto LABEL_169;
                }
                continue;
              }
              goto LABEL_61;
            }
          }
          else
          {
            objc_msgSend(a1[1], "printWithFormat:", @"%*s", 4, v131);
            if (!v41) {
              goto LABEL_104;
            }
          }
          break;
        }
        unint64_t v44 = SACopySanitizedString(v41, 1, 0);
        BOOL v45 = (void *)[v44 mutableCopy];

        goto LABEL_105;
      }
    }
  }
  SAJSONWriteArray(a1[1], v3);
LABEL_169:
}

- (void)avoidOverlapInBinaryLoadInfos:(int)a3 onlyExclaves:(void *)a4 inTask:
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v46 = a4;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v89 count:16];
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_47;
  }
  uint64_t v9 = v7;
  id v10 = 0;
  unint64_t v11 = 0;
  int v12 = (unint64_t *)MEMORY[0x1E4F14B00];
  uint64_t v66 = *(void *)v68;
  *(void *)&long long v8 = 138414338;
  long long v45 = v8;
  do
  {
    uint64_t v13 = 0;
    uint64_t v63 = v9;
    do
    {
      if (*(void *)v68 != v66) {
        objc_enumerationMutation(obj);
      }
      double v14 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
      uint64_t v15 = objc_msgSend(v14, "segment", v45);
      uint64_t v16 = [v15 length];
      if (v16)
      {
        unint64_t v17 = v16;
      }
      else
      {
        [v14 binary];
        int v19 = v18 = v10;
        unint64_t v17 = [v19 length];

        id v10 = v18;
        if (!v17)
        {
          if ([v14 highestOffset])
          {
            unint64_t v20 = [v14 highestOffset];
            if (v20 >= 0x10000000) {
              unint64_t v17 = 0x10000000;
            }
            else {
              unint64_t v17 = v20;
            }
          }
          else
          {
            unsigned int v21 = [*(id *)(a1 + 160) vmPageSize];
            if (v21) {
              unint64_t v17 = v21;
            }
            else {
              unint64_t v17 = *v12;
            }
          }
        }
      }
      unsigned int v22 = [*(id *)(a1 + 160) vmPageSize];
      unint64_t v23 = v22;
      if (!v22) {
        unint64_t v23 = *v12;
      }
      if (v17 % v23)
      {
        unsigned int v24 = [*(id *)(a1 + 160) vmPageSize];
        if (v24) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = *v12;
        }
        unsigned int v26 = [*(id *)(a1 + 160) vmPageSize];
        unint64_t v27 = v26;
        if (!v26) {
          unint64_t v27 = *v12;
        }
        unint64_t v17 = v25 + v17 / v27 * v27;
      }
      unint64_t v28 = [v14 loadAddress] + v17;
      if ([v14 loadAddress] < v11)
      {
        if (!a3
          || ([v14 exclave], id v29 = objc_claimAutoreleasedReturnValue(), v29, v29))
        {
          int v30 = *__error();
          int v31 = _sa_logt();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v61 = [v46 debugDescription];
            uint64_t v55 = [v14 binary];
            id v59 = [v55 name];
            uint64_t v53 = [v14 binary];
            id v57 = [v53 uuid];
            uint64_t v47 = [v14 loadAddress];
            long long v51 = [v10 binary];
            double v37 = [v51 name];
            uint64_t v49 = [v10 binary];
            id v38 = [v49 uuid];
            uint64_t v39 = [v10 loadAddress];
            *(_DWORD *)long long buf = v45;
            char v72 = v61;
            __int16 v73 = 2112;
            uint64_t v74 = v59;
            __int16 v75 = 2112;
            id v76 = v57;
            __int16 v77 = 2048;
            uint64_t v78 = v47;
            __int16 v79 = 2048;
            unint64_t v80 = v11;
            __int16 v81 = 2112;
            uint64_t v82 = v37;
            __int16 v83 = 2112;
            char v84 = v38;
            __int16 v85 = 2048;
            uint64_t v86 = v39;
            __int16 v87 = 2048;
            unint64_t v88 = v11;
            _os_log_debug_impl(&dword_1BF22B000, v31, OS_LOG_TYPE_DEBUG, "%@: adjusted load address of %@ <%@> from 0x%llx to 0x%llx to avoid overlapping with %@ <%@> 0x%llx - 0x%llx", buf, 0x5Cu);
          }
          *__error() = v30;
          if (v14) {
            v14[3] = v11;
          }
          unint64_t v28 = v17 + v11;
LABEL_33:
          uint64_t v9 = v63;
          goto LABEL_34;
        }
        uint64_t v33 = [v10 exclave];

        if (v33)
        {
          int v34 = *__error();
          uint64_t v35 = _sa_logt();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v62 = [v46 debugDescription];
            uint64_t v56 = [v10 binary];
            id v60 = [v56 name];
            id v54 = [v10 binary];
            unint64_t v40 = [v54 uuid];
            uint64_t v48 = [v10 loadAddress];
            uint64_t v52 = [v14 binary];
            [v52 name];
            id v41 = v58 = v10;
            int v50 = [v14 binary];
            uint64_t v42 = [v50 uuid];
            uint64_t v43 = [v14 loadAddress];
            *(_DWORD *)long long buf = v45;
            char v72 = v62;
            __int16 v73 = 2112;
            uint64_t v74 = v60;
            __int16 v75 = 2112;
            id v76 = v40;
            __int16 v77 = 2048;
            uint64_t v78 = v48;
            __int16 v79 = 2048;
            unint64_t v80 = v28;
            __int16 v81 = 2112;
            uint64_t v82 = v41;
            __int16 v83 = 2112;
            char v84 = v42;
            __int16 v85 = 2048;
            uint64_t v86 = v43;
            __int16 v87 = 2048;
            unint64_t v88 = v28;
            _os_log_debug_impl(&dword_1BF22B000, v35, OS_LOG_TYPE_DEBUG, "%@: adjusted load address of %@ <%@> from 0x%llx to 0x%llx to avoid overlapping with %@ <%@> 0x%llx - 0x%llx", buf, 0x5Cu);

            id v10 = v58;
          }

          *__error() = v34;
          uint64_t v36 = [v10 loadAddress];
          if (v10) {
            v10[3] = v28;
          }
          unint64_t v11 = v28 + v11 - v36;
          goto LABEL_33;
        }
      }
LABEL_34:
      if (v11 < v28)
      {
        uint64_t v32 = v14;

        id v10 = v32;
        unint64_t v11 = v28;
      }
      int v12 = (unint64_t *)MEMORY[0x1E4F14B00];
      ++v13;
    }
    while (v9 != v13);
    uint64_t v44 = [obj countByEnumeratingWithState:&v67 objects:v89 count:16];
    uint64_t v9 = v44;
  }
  while (v44);
LABEL_47:
}

void __29__SASamplePrinter_preprocess__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    int v4 = -[SASamplePrinter binaryImagesHitByTask:](v2, v3);
    if ([*(id *)(v2 + 16) displayAllBinaries])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v5 = [v3 binaryLoadInfos];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v10 loadAddress]) {
              id v11 = -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:](v2, v10, 0, v4);
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v7);
      }
    }
    uint64_t v12 = *(void *)(v2 + 16);
    if (v12)
    {
      uint64_t v13 = *(void *)(v12 + 168);
      if (v13 != 1 && (v13 || *(unsigned char *)(v12 + 11)))
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __34__SASamplePrinter_preprocessTask___block_invoke;
        v17[3] = &unk_1E63F9380;
        id v14 = v3;
        id v18 = v14;
        uint64_t v19 = v2;
        id v15 = v4;
        id v20 = v15;
        -[SATask enumerateFrames:]((uint64_t)v14, v17);
        uint64_t v16 = -[SASamplePrinter sortedLoadInfosForBinaryImages:](v2, v15);
        -[SASamplePrinter avoidOverlapInBinaryLoadInfos:onlyExclaves:inTask:](v2, v16, 0, v14);
      }
    }
  }
}

void __29__SASamplePrinter_preprocess__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained) {
      id v5 = -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:](*(void *)(a1 + 32), WeakRetained, [v6 address] - objc_msgSend(WeakRetained, "loadAddress"), *(void **)(a1 + 40));
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (id)displayedBinaryLoadInfoForLoadInfo:(uint64_t)a1 offsetIntoLoadInfo:(void *)a2 binariesToDisplay:(unint64_t)a3 extraBinariesToDisplay:(void *)a4
{
  if (a1)
  {
    id v6 = a4;
    id v7 = a2;
    uint64_t v8 = [v7 binary];
    uint64_t v9 = [v7 segment];
    uint64_t v10 = [v7 loadAddress];
    char v11 = [v7 isInKernelAddressSpace];
    uint64_t v12 = [v7 exclave];

    uint64_t v13 = -[SASamplePrinter displayedBinaryLoadInfoForBinary:segment:desiredLoadAddress:offsetIntoLoadInfo:isInKernelAddressSpace:exclave:binariesToDisplay:extraBinariesToDisplay:](v8, v9, v10, a3, v11, v12, v6, 0);
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

void __29__SASamplePrinter_preprocess__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained) {
      id v5 = -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:](*(void *)(a1 + 32), WeakRetained, [v6 address] - objc_msgSend(WeakRetained, "loadAddress"), *(void **)(a1 + 40));
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (id)sortedLoadInfosForBinaryImages:(uint64_t)a1
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __50__SASamplePrinter_sortedLoadInfosForBinaryImages___block_invoke;
  uint64_t v13 = &unk_1E63F96F0;
  uint64_t v14 = a1;
  id v6 = v5;
  id v15 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_1674, v10, v11, v12, v13, v14);
  id v7 = v15;
  id v8 = v6;

  return v8;
}

void __34__SASamplePrinter_preprocessTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = v3;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 3);
    if (WeakRetained)
    {
      id v5 = [*(id *)(a1 + 32) binaryLoadInfos];
      uint64_t v6 = [v5 indexOfObjectIdenticalTo:WeakRetained];

      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v7 = -[SASamplePrinter displayedBinaryLoadInfoForLoadInfo:offsetIntoLoadInfo:binariesToDisplay:extraBinariesToDisplay:](*(void *)(a1 + 40), WeakRetained, [v14 address] - objc_msgSend(WeakRetained, "loadAddress"), *(void **)(a1 + 48));
        id v8 = [*(id *)(a1 + 32) mainBinaryLoadInfo];
        if (v8 == WeakRetained)
        {
          int v9 = [*(id *)(a1 + 32) pid];

          if (!v9) {
            goto LABEL_6;
          }
          unint64_t v10 = [v7 loadAddress];
          uint64_t v11 = [*(id *)(a1 + 32) mainBinaryLoadInfo];
          unint64_t v12 = [v11 loadAddress];

          if (v10 <= v12) {
            goto LABEL_6;
          }
          id v8 = [*(id *)(a1 + 32) mainBinaryLoadInfo];
          uint64_t v13 = [v8 loadAddress];
          if (v7) {
            v7[3] = v13;
          }
        }

LABEL_6:
      }
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (uint64_t)shouldPrintTask:(void *)a3 thread:(void *)a4 dispatchQueue:
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  unint64_t v8 = a3;
  unint64_t v9 = a4;
  if (!a1) {
    goto LABEL_97;
  }
  unint64_t v10 = [(id)a1 options];
  uint64_t v11 = [v10 pidsToPrint];

  unint64_t v12 = [(id)a1 options];
  uint64_t v13 = [v12 uniquePidsToPrint];

  uint64_t v14 = [(id)a1 options];
  id v15 = [v14 processNamesToPrint];

  uint64_t v16 = [(id)a1 options];
  __int16 v73 = [v16 processUUIDsToPrint];

  unint64_t v17 = [(id)a1 options];
  id v18 = [v17 tidsToPrint];

  if (!v11 && !v13 && !v18 && !v15 && !v73)
  {
    uint64_t v19 = [(id)a1 options];
    int v20 = [v19 printTargetThreadOnly];

    if (!v20)
    {
LABEL_95:
      a1 = 1;
      goto LABEL_96;
    }
  }
  id v21 = [*(id *)(a1 + 160) targetProcess];

  if (v21 == v7)
  {
    if (!(v8 | v9)) {
      goto LABEL_95;
    }
    int v34 = [(id)a1 options];
    int v35 = [v34 printTargetThreadOnly];

    if (!v35) {
      goto LABEL_95;
    }
    if ([*(id *)(a1 + 160) targetThreadId] && objc_msgSend(*(id *)(a1 + 160), "targetDispatchQueueId"))
    {
      if (!v8) {
        goto LABEL_9;
      }
      if (!v9) {
        goto LABEL_9;
      }
      uint64_t v36 = [(id)v8 threadId];
      if (v36 != [*(id *)(a1 + 160) targetThreadId]) {
        goto LABEL_9;
      }
    }
    else
    {
      if ([*(id *)(a1 + 160) targetThreadId])
      {
        if (!v8) {
          goto LABEL_9;
        }
        uint64_t v37 = [(id)v8 threadId];
        uint64_t v38 = [*(id *)(a1 + 160) targetThreadId];
        goto LABEL_42;
      }
      if (![*(id *)(a1 + 160) targetDispatchQueueId])
      {
        if ([(id)v8 isMainThread]) {
          goto LABEL_95;
        }
        goto LABEL_9;
      }
      if (!v9) {
        goto LABEL_9;
      }
    }
    uint64_t v37 = [(id)v9 identifier];
    uint64_t v38 = [*(id *)(a1 + 160) targetDispatchQueueId];
LABEL_42:
    if (v37 == v38) {
      goto LABEL_95;
    }
  }
LABEL_9:
  if (v11)
  {
    long long v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "pid"));
    char v23 = [v11 containsObject:v22];

    if (v23) {
      goto LABEL_95;
    }
  }
  if (v13)
  {
    long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "uniquePid"));
    char v25 = [v13 containsObject:v24];

    if (v25) {
      goto LABEL_95;
    }
  }
  if (v15)
  {
    uint64_t v26 = [v7 name];
    if (v26 && [v15 containsObject:v26]) {
      goto LABEL_94;
    }
  }
  if (!v73) {
    goto LABEL_21;
  }
  unint64_t v27 = [v7 mainBinary];
  uint64_t v26 = [v27 uuid];

  if (v26 && [v73 containsObject:v26])
  {
LABEL_94:

    goto LABEL_95;
  }

LABEL_21:
  unint64_t v28 = [(id)a1 options];
  int v29 = [v28 printProblematicProcessesAndThreads];

  if (!v29) {
    goto LABEL_54;
  }
  int v30 = [v7 lastTaskStateOnOrBeforeTime:*(void *)(a1 + 40) sampleIndex:*(void *)(a1 + 56)];
  uint64_t v26 = v30;
  if (v30
    && (([v30 wqExceededTotalThreadLimit] & 1) != 0
     || ([v26 wqExceededConstrainedThreadLimit] & 1) != 0))
  {
    goto LABEL_94;
  }
  long long v67 = v26;
  if (v8)
  {
    int v31 = *(void **)(a1 + 144);
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)v8, "threadId"));
    uint64_t v33 = [v31 objectForKeyedSubscript:v32];
    char objb = [v33 isPartOfADeadlock];

    uint64_t v26 = v67;
    if ((objb & 1) == 0) {
      goto LABEL_53;
    }
    goto LABEL_94;
  }
  long long v68 = v15;
  unint64_t v65 = v9;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = [v7 threads];
  uint64_t v39 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (!v39) {
    goto LABEL_52;
  }
  uint64_t v40 = v39;
  uint64_t v41 = *(void *)v83;
  do
  {
    for (uint64_t i = 0; i != v40; ++i)
    {
      if (*(void *)v83 != v41) {
        objc_enumerationMutation(obj);
      }
      uint64_t v43 = [*(id *)(a1 + 144) objectForKeyedSubscript:*(void *)(*((void *)&v82 + 1) + 8 * i)];
      int v44 = [v43 isPartOfADeadlock];

      if (v44)
      {

        unint64_t v8 = 0;
        unint64_t v9 = v65;
        uint64_t v26 = v67;
        id v15 = v68;
        goto LABEL_94;
      }
    }
    uint64_t v40 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
  }
  while (v40);
LABEL_52:

  unint64_t v8 = 0;
  unint64_t v9 = v65;
  uint64_t v26 = v67;
  id v15 = v68;
LABEL_53:

LABEL_54:
  long long v69 = v15;
  if (v18)
  {
    if (v8)
    {
      long long v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)v8, "threadId"));
      char v46 = [v18 containsObject:v45];

      id v15 = v69;
      if (v46) {
        goto LABEL_95;
      }
    }
    else
    {
      unint64_t v66 = v9;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v47 = [v7 threads];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v78 objects:v87 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v79 != v50) {
              objc_enumerationMutation(v47);
            }
            if ([v18 containsObject:*(void *)(*((void *)&v78 + 1) + 8 * j)])
            {

              a1 = 1;
              unint64_t v9 = v66;
              goto LABEL_92;
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v78 objects:v87 count:16];
        }
        while (v49);
      }

      unint64_t v9 = v66;
      id v15 = v69;
    }
  }
  uint64_t v52 = [(id)a1 options];
  if (![v52 printTargetThreadOnly])
  {

    a1 = 0;
    goto LABEL_96;
  }
  uint64_t v53 = [*(id *)(a1 + 120) count];

  if (!v53) {
    goto LABEL_88;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obja = *(id *)(a1 + 120);
  uint64_t v54 = [obja countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (!v54) {
    goto LABEL_87;
  }
  uint64_t v56 = v54;
  uint64_t v57 = *(void *)v75;
  while (2)
  {
    uint64_t v58 = 0;
    while (2)
    {
      if (*(void *)v75 != v57) {
        objc_enumerationMutation(obja);
      }
      id v59 = *(void **)(*((void *)&v74 + 1) + 8 * v58);
      if (!v8)
      {
        if (v59) {
          goto LABEL_81;
        }
        goto LABEL_85;
      }
      if (!v59)
      {
LABEL_85:
        id Property = 0;
        goto LABEL_82;
      }
      if (!v59[2]) {
        goto LABEL_81;
      }
      uint64_t v60 = [(id)v8 threadId];
      uint64_t v61 = v59[2];
      if (v60 == v61) {
        goto LABEL_91;
      }
      if (!v61)
      {
LABEL_81:
        id Property = objc_getProperty(v59, v55, 8, 1);
LABEL_82:
        if (Property == v7)
        {
LABEL_91:

          a1 = 1;
          goto LABEL_92;
        }
      }
      if (v56 != ++v58) {
        continue;
      }
      break;
    }
    uint64_t v63 = [obja countByEnumeratingWithState:&v74 objects:v86 count:16];
    uint64_t v56 = v63;
    if (v63) {
      continue;
    }
    break;
  }
LABEL_87:

LABEL_88:
  a1 = 0;
LABEL_92:
  id v15 = v69;
LABEL_96:

LABEL_97:
  return a1;
}

void __59__SASamplePrinter_highestPriorityInThread_useBasePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v4 = (int)[v3 basePriority] <= *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v5 = v7;
    if (v4) {
      goto LABEL_7;
    }
    int v6 = [v7 basePriority];
  }
  else
  {
    BOOL v4 = (int)[v3 scheduledPriority] <= *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v5 = v7;
    if (v4) {
      goto LABEL_7;
    }
    int v6 = [v7 scheduledPriority];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  id v5 = v7;
LABEL_7:
}

- (uint64_t)highestPriorityInTask:(char)a3 useBasePriority:
{
  id v5 = a2;
  int v6 = v5;
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    int v15 = 0;
    id v7 = [v5 threads];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__SASamplePrinter_highestPriorityInTask_useBasePriority___block_invoke;
    v10[3] = &unk_1E63F93D0;
    char v11 = a3;
    v10[4] = a1;
    v10[5] = &v12;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];

    uint64_t v8 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __57__SASamplePrinter_highestPriorityInTask_useBasePriority___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 48);
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    uint64_t v16 = 0;
    unint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    uint64_t v8 = v4[4];
    uint64_t v9 = v4[5];
    uint64_t v10 = v4[6];
    uint64_t v11 = v4[7];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SASamplePrinter_highestPriorityInThread_useBasePriority___block_invoke;
    v14[3] = &unk_1E63F93A8;
    char v15 = v5;
    v14[4] = &v16;
    [v6 enumerateThreadStatesBetweenStartTime:v8 startSampleIndex:v10 endTime:v9 endSampleIndex:v11 reverseOrder:0 block:v14];
    int v12 = *((_DWORD *)v17 + 6);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    int v12 = 0;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v12 > *(_DWORD *)(v13 + 24)) {
    *(_DWORD *)(v13 + 24) = v12;
  }
}

- (void)largestFootprintInTask:(void *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__SASamplePrinter_largestFootprintInTask___block_invoke;
    v10[3] = &unk_1E63F93F8;
    v10[4] = &v11;
    [v3 enumerateTaskStatesBetweenStartTime:v5 startSampleIndex:v7 endTime:v6 endSampleIndex:v8 reverseOrder:0 block:v10];
    a1 = (void *)v12[3];
    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

void __42__SASamplePrinter_largestFootprintInTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 taskSizeInBytes] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 taskSizeInBytes];
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(id *)(a1 + 32) != v3)
  {
    id v5 = v3;
    if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 40), v3, 0, 0)) {
      [*(id *)(a1 + 48) addObject:v5];
    }
  }
  return MEMORY[0x1F4181820]();
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_3;
  v71[3] = &unk_1E63F9420;
  id v7 = v5;
  id v72 = v7;
  id v8 = v6;
  id v73 = v8;
  uint64_t v43 = (void *)MEMORY[0x1C18A6C80](v71);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_4;
  v68[3] = &unk_1E63F9420;
  id v9 = v7;
  id v69 = v9;
  id v10 = v8;
  id v70 = v10;
  uint64_t v42 = (void *)MEMORY[0x1C18A6C80](v68);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_5;
  v65[3] = &unk_1E63F9420;
  id v11 = v9;
  id v66 = v11;
  id v12 = v10;
  id v67 = v12;
  uint64_t v41 = (void *)MEMORY[0x1C18A6C80](v65);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_6;
  v62[3] = &unk_1E63F9448;
  v62[4] = *(void *)(a1 + 32);
  id v13 = v11;
  id v63 = v13;
  id v14 = v12;
  id v64 = v14;
  uint64_t v40 = (void *)MEMORY[0x1C18A6C80](v62);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_7;
  v59[3] = &unk_1E63F9420;
  id v15 = v13;
  id v60 = v15;
  id v16 = v14;
  id v61 = v16;
  int v44 = (void *)MEMORY[0x1C18A6C80](v59);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_8;
  v56[3] = &unk_1E63F9470;
  v56[4] = *(void *)(a1 + 32);
  id v17 = v15;
  id v57 = v17;
  id v18 = v16;
  id v58 = v18;
  int v19 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v56);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_9;
  v53[3] = &unk_1E63F9448;
  v53[4] = *(void *)(a1 + 32);
  id v20 = v17;
  id v54 = v20;
  id v21 = v18;
  id v55 = v21;
  long long v22 = (void *)MEMORY[0x1C18A6C80](v53);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __41__SASamplePrinter_printTasksIndividually__block_invoke_10;
  v49[3] = &unk_1E63F9498;
  id v23 = v20;
  uint64_t v24 = *(void *)(a1 + 32);
  id v39 = v23;
  id v50 = v23;
  uint64_t v51 = v24;
  id v38 = v21;
  id v52 = v38;
  char v25 = (uint64_t (**)(void))MEMORY[0x1C18A6C80](v49);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v37 = a1;
  id v26 = *(id *)(a1 + 40);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v74 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v46;
LABEL_3:
    uint64_t v30 = 0;
    while (2)
    {
      if (*(void *)v46 != v29) {
        objc_enumerationMutation(v26);
      }
      uint64_t v31 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v30), "unsignedLongLongValue", v37);
      switch(v31 & 0x7FFFFFFFFFFFFFFFLL)
      {
        case 1:
          uint64_t v33 = (uint64_t (*)(void))v43[2];
          goto LABEL_17;
        case 2:
          uint64_t v33 = (uint64_t (*)(void))v42[2];
          goto LABEL_17;
        case 3:
          uint64_t v32 = v19[2](v19, 1);
          goto LABEL_18;
        case 4:
          uint64_t v32 = v19[2](v19, 0);
          goto LABEL_18;
        case 5:
          uint64_t v33 = (uint64_t (*)(void))v22[2];
          goto LABEL_17;
        case 6:
        case 7:
        case 8:
        case 9:
          uint64_t v32 = v25[2](v25);
          goto LABEL_18;
        case 0xALL:
          uint64_t v33 = (uint64_t (*)(void))v44[2];
          goto LABEL_17;
        case 0xBLL:
          uint64_t v33 = (uint64_t (*)(void))v40[2];
          goto LABEL_17;
        case 0xCLL:
          uint64_t v33 = (uint64_t (*)(void))v41[2];
LABEL_17:
          uint64_t v32 = v33();
LABEL_18:
          if (!v32) {
            goto LABEL_19;
          }
          if (v31 >= 0) {
            uint64_t v35 = v32;
          }
          else {
            uint64_t v35 = -v32;
          }

          goto LABEL_36;
        default:
LABEL_19:
          if (v28 != ++v30) {
            continue;
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v74 count:16];
          if (!v28) {
            goto LABEL_21;
          }
          goto LABEL_3;
      }
    }
  }
LABEL_21:

  uint64_t v34 = v37;
  if ((([*(id *)(v37 + 40) containsObject:&unk_1F1A9AF98] & 1) != 0
     || (uint64_t v35 = ((uint64_t (*)(void))v44[2])()) == 0)
    && ((objc_msgSend(*(id *)(v37 + 40), "containsObject:", &unk_1F1A9AF68, v37) & 1) != 0
     || (uint64_t v35 = ((uint64_t (*)(void))v43[2])()) == 0)
    && (([*(id *)(v34 + 40) containsObject:&unk_1F1A9AFB0] & 1) != 0
     || (uint64_t v35 = ((uint64_t (*)(void))v42[2])()) == 0)
    && (([*(id *)(v34 + 40) containsObject:&unk_1F1A9AFC8] & 1) != 0
     || (uint64_t v35 = ((uint64_t (*)(void))v41[2])()) == 0)
    && (([*(id *)(v34 + 40) containsObject:&unk_1F1A9AFE0] & 1) != 0
     || (uint64_t v35 = ((uint64_t (*)(void))v40[2])()) == 0))
  {
    uint64_t v35 = 0;
  }
LABEL_36:

  return v35;
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) name];
  id v3 = [*(id *)(a1 + 40) name];
  if (![v2 length])
  {

    uint64_t v2 = 0;
  }
  if ([v3 length])
  {
    BOOL v4 = v2 != 0;
    if (v2 && v3)
    {
      uint64_t v5 = [v2 compare:v3 options:577];
      goto LABEL_11;
    }
  }
  else
  {

    id v3 = 0;
    BOOL v4 = v2 != 0;
  }
  if (v4) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 1;
  }
LABEL_11:

  return v5;
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_4(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) uniquePid];
  if (v2 < [*(id *)(a1 + 40) uniquePid]) {
    return -1;
  }
  unint64_t v3 = [*(id *)(a1 + 32) uniquePid];
  if (v3 > [*(id *)(a1 + 40) uniquePid]) {
    return 1;
  }
  int v5 = [*(id *)(a1 + 32) pid];
  if (v5 < (int)[*(id *)(a1 + 40) pid]) {
    return -1;
  }
  int v6 = [*(id *)(a1 + 32) pid];
  return v6 > (int)[*(id *)(a1 + 40) pid];
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) startTimestamp];
  uint64_t v3 = [*(id *)(a1 + 40) startTimestamp];
  BOOL v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v2) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = v3 != 0;
    }
  }
  else
  {
    uint64_t v6 = [v2 compare:v3];
  }

  return v6;
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_6(uint64_t a1)
{
  BOOL v2 = -[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32));
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    unint64_t v5 = [v3 sampleCountInSampleIndexRangeStart:v4[6] end:v4[7]];
    unint64_t v6 = [*(id *)(a1 + 48) sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)];
  }
  else
  {
    unint64_t v5 = [v3 sampleCountInTimestampRangeStart:v4[4] end:v4[5]];
    unint64_t v6 = [*(id *)(a1 + 48) sampleCountInTimestampRangeStart:*(void *)(*(void *)(a1 + 32) + 32) end:*(void *)(*(void *)(a1 + 32) + 40)];
  }
  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_7(uint64_t a1)
{
  if ([*(id *)(a1 + 32) uniquePid]) {
    int v2 = [*(id *)(a1 + 32) pid] == 0;
  }
  else {
    int v2 = 1;
  }
  if ([*(id *)(a1 + 40) uniquePid]) {
    int v3 = [*(id *)(a1 + 40) pid] == 0;
  }
  else {
    int v3 = 1;
  }
  uint64_t v4 = 1;
  if (!v2) {
    uint64_t v4 = -1;
  }
  if (v3 == v2) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_8(uint64_t a1, char a2)
{
  int v4 = -[SASamplePrinter highestPriorityInTask:useBasePriority:](*(void *)(a1 + 32), *(void **)(a1 + 40), a2);
  int v5 = -[SASamplePrinter highestPriorityInTask:useBasePriority:](*(void *)(a1 + 32), *(void **)(a1 + 48), a2);
  if (v4 <= v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v4 < v5) {
    return 1;
  }
  else {
    return v6;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_9(uint64_t a1)
{
  int v2 = -[SASamplePrinter largestFootprintInTask:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  int v3 = -[SASamplePrinter largestFootprintInTask:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  if (v2 <= v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = -1;
  }
  if (v2 < v3) {
    return 1;
  }
  else {
    return v4;
  }
}

uint64_t __41__SASamplePrinter_printTasksIndividually__block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  unint64_t v20 = 0;
  [*(id *)(a1 + 32) cpuTimeNs:&v22 cpuInstructions:&v21 cpuCycles:&v20 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v17 = 0;
  [*(id *)(a1 + 48) cpuTimeNs:&v19 cpuInstructions:&v18 cpuCycles:&v17 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
  switch(a2)
  {
    case 6:
      unint64_t v4 = v22;
      unint64_t v5 = v19;
      goto LABEL_12;
    case 7:
      unint64_t v4 = v21;
      unint64_t v5 = v18;
      goto LABEL_12;
    case 8:
      unint64_t v4 = v20;
      unint64_t v5 = v17;
LABEL_12:
      if (v4 < v5) {
        return 1;
      }
      if (v4 <= v5) {
        return 0;
      }
      return -1;
    case 9:
      double v6 = 0.0;
      double v7 = 0.0;
      if (v21) {
        double v7 = (double)v20 / (double)v21;
      }
      if (v18) {
        double v6 = (double)v17 / (double)v18;
      }
      if (v7 < v6) {
        return 1;
      }
      if (v7 <= v6) {
        return 0;
      }
      return -1;
    default:
      int v9 = *__error();
      id v10 = _sa_logt();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v24 = a2;
        _os_log_error_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_ERROR, "invalid sort option 0x%llx", buf, 0xCu);
      }

      *__error() = v9;
      _SASetCrashLogMessage(5122, "invalid sort option 0x%llx", v11, v12, v13, v14, v15, v16, a2);
      _os_crash();
      __break(1u);
      JUMPOUT(0x1BF2D37E0);
  }
}

void __41__SASamplePrinter_printTasksIndividually__block_invoke_1313(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 16) printJson])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v3 + 24))
    {
      [*(id *)(*(void *)(a1 + 32) + 8) appendString:@","];
      uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(unsigned char *)(v3 + 24) = 0;
    [*(id *)(*(void *)(a1 + 32) + 8) appendString:@"\n\n\n{"];
  }
  if (*(id *)(a1 + 40) != v25
    || ![*(id *)(*(void *)(a1 + 32) + 16) printTargetThreadOnly])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 160);
  if (v5 && (*(unsigned char *)(v5 + 326) & 1) != 0 && *(void *)(v4 + 112))
  {
LABEL_13:
    -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]((id *)v4, v25, 0, 0, 0, 0);
    goto LABEL_14;
  }
  uint64_t v6 = [*(id *)(v4 + 160) targetDispatchQueueId];
  if (v6)
  {
    double v7 = [v25 dispatchQueues];
    id v8 = [NSNumber numberWithUnsignedLongLong:v6];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId];
  if (v10)
  {
    uint64_t v11 = [v25 threads];
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v10];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (!(v10 | v6))
  {
    uint64_t v14 = [v25 mainThread];

    uint64_t v13 = v14;
  }
  if (!(v9 | v13))
  {
    int v15 = *__error();
    uint64_t v16 = _sa_logt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v25 debugDescription];
      *(_DWORD *)long long buf = 134218498;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2080;
      uint64_t v31 = [v17 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "target dispatch queue %llu, thread id 0x%llx, target task %s: no target dispatch queue nor thread", buf, 0x20u);
    }
    *__error() = v15;
    id v18 = [v25 debugDescription];
    [v18 UTF8String];
    _SASetCrashLogMessage(5248, "target dispatch queue %llu, thread id 0x%llx, target task %s: no target dispatch queue nor thread", v19, v20, v21, v22, v23, v24, v6);

    _os_crash();
    __break(1u);
  }
  -[SASamplePrinter printTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:](*(id **)(a1 + 32), v25, [(id)v9 identifier], objc_msgSend((id)v13, "threadId"), 0, 0);

LABEL_14:
  if ([*(id *)(*(void *)(a1 + 32) + 16) printJson]) {
    [*(id *)(*(void *)(a1 + 32) + 8) appendString:@"}"];
  }
}

- (void)printTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  if (a1)
  {
    uint64_t v12 = (void *)MEMORY[0x1C18A6A20]();
    if (a5 && a6)
    {
      int v52 = *__error();
      uint64_t v53 = _sa_logt();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v53, OS_LOG_TYPE_ERROR, "Omitting special and other", buf, 2u);
      }

      *__error() = v52;
      _SASetCrashLogMessage(5961, "Omitting special and other", v54, v55, v56, v57, v58, v59, v60);
      _os_crash();
      __break(1u);
    }
    uint64_t v13 = -[SASamplePrinter printTaskHeaderForTask:specialDispatchQueueId:specialThreadId:omitSpecial:omitOther:]((uint64_t)a1, v11, a3, a4, a5, a6);
    if (v13 < 0) {
      goto LABEL_49;
    }
    uint64_t v14 = (unsigned char *)v13;
    if ([a1[2] binaryImagesBeforeStacks]) {
      -[SASamplePrinter printBinaryImagesForTask:]((uint64_t)a1, v11);
    }
    int v15 = a1[2];
    if (!v15 || (uint64_t v16 = v15[19], v16 != 3) && (v16 || !*((unsigned char *)v15 + 11)))
    {
      id v23 = v11;
      context = (void *)MEMORY[0x1C18A6A20]();
      uint64_t v24 = -[SASamplePrinter stacksForTask:taskSampleCount:](a1, v23, v14);
      if ([a1[2] printJson]) {
        [a1[1] appendString:@",\"threads\":["];
      }
      unint64_t v62 = v23;
      unint64_t v65 = v12;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:buf count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = 0;
        uint64_t v29 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v67 != v29) {
              objc_enumerationMutation(v25);
            }
            uint64_t v31 = *(unsigned char **)(*((void *)&v66 + 1) + 8 * i);
            if (!v31 || (v31[8] & 1) == 0)
            {
              int v32 = [a1[2] printJson];
              uint64_t v33 = @"\n";
              if (v32)
              {
                if (v28) {
                  [a1[1] appendString:@","];
                }
                uint64_t v33 = @"{";
              }
              [a1[1] appendString:v33];
              -[SASamplePrinter printStack:stream:]((uint64_t)a1, v31, a1[1]);
              if ([a1[2] printJson]) {
                [a1[1] appendString:@"}"];
              }
              ++v28;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v66 objects:buf count:16];
        }
        while (v27);
      }
      else
      {
        uint64_t v28 = 0;
      }

      if ([a1[2] printJson])
      {
        [a1[1] appendString:@"]\n\n"];
        uint64_t v12 = v65;
      }
      else
      {
        uint64_t v12 = v65;
        if (!v28)
        {
          if (!-[SASamplePrinter hasTimeIndexes]((uint64_t)a1)) {
            goto LABEL_40;
          }
          uint64_t v37 = [v62 taskStates];
          id v38 = [v37 firstObject];
          unint64_t v39 = [v38 endSampleIndex];
          uint64_t v40 = [v62 taskStates];
          uint64_t v41 = [v40 lastObject];
          unint64_t v42 = [v41 endSampleIndex];

          BOOL v43 = v39 >= v42;
          uint64_t v12 = v65;
          if (!v43)
          {
LABEL_40:
            [a1[1] appendString:@"\n"];
            objc_msgSend(a1[1], "printWithFormat:", @"%*sNo threads sampled\n", 2, "", context);
          }
        }
      }

      goto LABEL_47;
    }
    if (!(a4 | a3))
    {
      *(void *)long long buf = v11;
      uint64_t v34 = (void *)MEMORY[0x1E4F1C978];
      id v35 = v11;
      uint64_t v36 = [v34 arrayWithObjects:buf count:1];

      -[SASamplePrinter printSingleStackForTasks:limitToDispatchQueueIds:limitToThreadIds:intersection:sampleCount:]((uint64_t)a1, v36, 0, 0, 0, (unint64_t)v14);
      goto LABEL_47;
    }
    id v64 = v12;
    if (a6)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v18 = [NSNumber numberWithUnsignedLongLong:a4];
      uint64_t v19 = objc_msgSend(v17, "initWithObjects:", v18, 0);

      id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a3];
      uint64_t v22 = objc_msgSend(v20, "initWithObjects:", v21, 0);
    }
    else
    {
      id v44 = objc_alloc(MEMORY[0x1E4F1CA80]);
      long long v45 = [v11 threads];
      long long v46 = [v45 allKeys];
      id v63 = (void *)[v44 initWithArray:v46];

      id v47 = objc_alloc(MEMORY[0x1E4F1CA80]);
      long long v48 = [v11 dispatchQueues];
      uint64_t v49 = [v48 allKeys];
      uint64_t v22 = (void *)[v47 initWithArray:v49];

      if (!a5)
      {
        uint64_t v19 = v63;
        uint64_t v12 = v64;
        goto LABEL_46;
      }
      id v50 = [NSNumber numberWithUnsignedLongLong:a4];
      uint64_t v19 = v63;
      [v63 removeObject:v50];

      uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a3];
      [v22 removeObject:v21];
    }
    uint64_t v12 = v64;

LABEL_46:
    id v70 = v11;
    uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    -[SASamplePrinter printSingleStackForTasks:limitToDispatchQueueIds:limitToThreadIds:intersection:sampleCount:]((uint64_t)a1, v51, v22, v19, a6, (unint64_t)v14);

LABEL_47:
    if (([a1[2] binaryImagesBeforeStacks] & 1) == 0) {
      -[SASamplePrinter printBinaryImagesForTask:]((uint64_t)a1, v11);
    }
LABEL_49:
  }
}

void __44__SASamplePrinter_printTasksWithAggregation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    uint64_t v5 = [v3 mainBinary];
    if (v5)
    {
      if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 40), v4, 0, 0))
      {
        if (*(unsigned char *)(a1 + 56))
        {
          uint64_t v6 = (void *)[v4 resourceCoalitionID];
          if (v6)
          {
            double v7 = [v4 sharedCache];
          }
          else
          {
            double v7 = 0;
          }
        }
        else
        {
          double v7 = 0;
          uint64_t v6 = 0;
        }
        id v11 = -[SATaskAggregationIdentifier initWithBinary:sharedCache:rcid:]((id *)[SATaskAggregationIdentifier alloc], v5, v7, v6);
        id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v4];
      }
    }
    else
    {
      int v8 = *__error();
      uint64_t v9 = _sa_logt();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = -[SASamplePrinter displayNameForTask:includePid:](*(void **)(a1 + 40), v4, 1);
        int v13 = 138412290;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: No main binary for %@, not including in report", (uint8_t *)&v13, 0xCu);
      }
      *__error() = v8;
    }
  }
}

- (id)displayNameForTask:(int)a3 includePid:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:64];
    uint64_t v6 = [v5 name];
    if (v6)
    {
      double v7 = [v5 name];
      int v8 = SACopySanitizedString(v7, 1, 0);
      [a1 appendString:v8];
    }
    else
    {
      if ([v5 pid]) {
        uint64_t v9 = @"UNKNOWN";
      }
      else {
        uint64_t v9 = @"kernel_task";
      }
      [a1 appendString:v9];
    }

    uint64_t v10 = [v5 bundleName];

    if (v10)
    {
      id v11 = [v5 bundleName];
      id v12 = SACopySanitizedString(v11, 1, 0);
      [a1 appendFormat:@" (%@)", v12];
    }
    if (a3)
    {
      objc_msgSend(a1, "appendFormat:", @" [%d]", objc_msgSend(v5, "pid"));
      if ([v5 uniquePid] != -1)
      {
        uint64_t v13 = [v5 uniquePid];
        if (v13 != (int)[v5 pid]) {
          objc_msgSend(a1, "appendFormat:", @" [unique pid %llu]", objc_msgSend(v5, "uniquePid"));
        }
      }
    }
  }

  return a1;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_1320(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_2;
  v75[3] = &unk_1E63F9420;
  id v7 = v5;
  id v76 = v7;
  id v8 = v6;
  id v77 = v8;
  id v44 = (void *)MEMORY[0x1C18A6C80](v75);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_3;
  v72[3] = &unk_1E63F9420;
  id v9 = v7;
  id v73 = v9;
  id v10 = v8;
  id v74 = v10;
  unint64_t v42 = (void *)MEMORY[0x1C18A6C80](v72);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_4;
  v69[3] = &unk_1E63F9420;
  id v11 = v9;
  id v70 = v11;
  id v12 = v10;
  id v71 = v12;
  BOOL v43 = (void *)MEMORY[0x1C18A6C80](v69);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_5;
  v66[3] = &unk_1E63F9448;
  v66[4] = *(void *)(a1 + 32);
  id v13 = v11;
  id v67 = v13;
  id v14 = v12;
  id v68 = v14;
  long long v45 = (void *)MEMORY[0x1C18A6C80](v66);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_6;
  v63[3] = &unk_1E63F9420;
  id v15 = v13;
  id v64 = v15;
  id v16 = v14;
  id v65 = v16;
  long long v46 = (void *)MEMORY[0x1C18A6C80](v63);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_7;
  v59[3] = &unk_1E63F9470;
  id v17 = v15;
  uint64_t v18 = *(void *)(a1 + 32);
  id v60 = v17;
  uint64_t v61 = v18;
  id v19 = v16;
  id v62 = v19;
  id v20 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v59);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_8;
  v55[3] = &unk_1E63F9448;
  id v21 = v17;
  uint64_t v22 = *(void *)(a1 + 32);
  id v56 = v21;
  uint64_t v57 = v22;
  id v23 = v19;
  id v58 = v23;
  uint64_t v24 = (void *)MEMORY[0x1C18A6C80](v55);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __44__SASamplePrinter_printTasksWithAggregation__block_invoke_9;
  v51[3] = &unk_1E63F9498;
  id v25 = v21;
  uint64_t v26 = *(void *)(a1 + 32);
  id v41 = v25;
  id v52 = v25;
  uint64_t v53 = v26;
  id v40 = v23;
  id v54 = v40;
  uint64_t v27 = (uint64_t (**)(void))MEMORY[0x1C18A6C80](v51);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v39 = a1;
  id v28 = *(id *)(a1 + 40);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v78 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
LABEL_3:
    uint64_t v32 = 0;
    while (2)
    {
      if (*(void *)v48 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v32), "unsignedLongLongValue", v39);
      switch(v33 & 0x7FFFFFFFFFFFFFFFLL)
      {
        case 1:
          id v35 = (uint64_t (*)(void))v44[2];
          goto LABEL_17;
        case 2:
          id v35 = (uint64_t (*)(void))v42[2];
          goto LABEL_17;
        case 3:
          uint64_t v34 = v20[2](v20, 1);
          goto LABEL_18;
        case 4:
          uint64_t v34 = v20[2](v20, 0);
          goto LABEL_18;
        case 5:
          id v35 = (uint64_t (*)(void))v24[2];
          goto LABEL_17;
        case 6:
        case 7:
        case 8:
        case 9:
          uint64_t v34 = v27[2](v27);
          goto LABEL_18;
        case 0xALL:
          id v35 = (uint64_t (*)(void))v46[2];
          goto LABEL_17;
        case 0xBLL:
          id v35 = (uint64_t (*)(void))v45[2];
          goto LABEL_17;
        case 0xCLL:
          id v35 = (uint64_t (*)(void))v43[2];
LABEL_17:
          uint64_t v34 = v35();
LABEL_18:
          if (!v34) {
            goto LABEL_19;
          }
          if (v33 >= 0) {
            uint64_t v37 = v34;
          }
          else {
            uint64_t v37 = -v34;
          }

          goto LABEL_34;
        default:
LABEL_19:
          if (v30 != ++v32) {
            continue;
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v78 count:16];
          if (!v30) {
            goto LABEL_21;
          }
          goto LABEL_3;
      }
    }
  }
LABEL_21:

  uint64_t v36 = v39;
  if ((([*(id *)(v39 + 40) containsObject:&unk_1F1A9AF98] & 1) != 0
     || (uint64_t v37 = ((uint64_t (*)(void))v46[2])()) == 0)
    && ((objc_msgSend(*(id *)(v39 + 40), "containsObject:", &unk_1F1A9AFE0, v39) & 1) != 0
     || (uint64_t v37 = ((uint64_t (*)(void))v45[2])()) == 0)
    && (([*(id *)(v36 + 40) containsObject:&unk_1F1A9AF68] & 1) != 0
     || (uint64_t v37 = ((uint64_t (*)(void))v44[2])()) == 0)
    && (([*(id *)(v36 + 40) containsObject:&unk_1F1A9AFC8] & 1) != 0
     || (uint64_t v37 = ((uint64_t (*)(void))v43[2])()) == 0))
  {
    uint64_t v37 = 0;
  }
LABEL_34:

  return v37;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = [v2 name];

  uint64_t v4 = [*(id *)(a1 + 40) firstObject];
  id v5 = [v4 name];

  if (![v3 length])
  {

    id v3 = 0;
  }
  if ([v5 length])
  {
    BOOL v6 = v3 != 0;
    if (v3 && v5)
    {
      uint64_t v7 = [v3 compare:v5 options:577];
      goto LABEL_11;
    }
  }
  else
  {

    id v5 = 0;
    BOOL v6 = v3 != 0;
  }
  if (v6) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
LABEL_11:

  return v7;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = [*(id *)(a1 + 40) firstObject];
  unint64_t v4 = [v2 uniquePid];
  if (v4 < [v3 uniquePid])
  {
LABEL_5:
    uint64_t v6 = -1;
    goto LABEL_6;
  }
  unint64_t v5 = [v2 uniquePid];
  if (v5 <= [v3 uniquePid])
  {
    int v7 = [v2 pid];
    if (v7 >= (int)[v3 pid])
    {
      int v9 = [v2 pid];
      uint64_t v6 = v9 > (int)[v3 pid];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = [v2 startTimestamp];

  unint64_t v4 = [*(id *)(a1 + 40) firstObject];
  unint64_t v5 = [v4 startTimestamp];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v3) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = v5 != 0;
    }
  }
  else
  {
    uint64_t v7 = [v3 compare:v5];
  }

  return v7;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_5(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (-[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32)))
  {
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      unint64_t v5 = 0;
      uint64_t v6 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v37 != v6) {
            objc_enumerationMutation(v2);
          }
          v5 += [*(id *)(*((void *)&v36 + 1) + 8 * i) sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v4);
    }
    else
    {
      unint64_t v5 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      unint64_t v16 = 0;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          v16 += [*(id *)(*((void *)&v32 + 1) + 8 * j) sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v15);
      goto LABEL_37;
    }
LABEL_36:
    unint64_t v16 = 0;
    goto LABEL_37;
  }
  long long v30 = 0uLL;
  long long v31 = 0uLL;
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v5 = 0;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v10; ++k)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v5 += [*(id *)(*((void *)&v28 + 1) + 8 * k) sampleCountInTimestampRangeStart:*(void *)(*(void *)(a1 + 32) + 32) end:*(void *)(*(void *)(a1 + 32) + 40)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v5 = 0;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = *(id *)(a1 + 48);
  uint64_t v19 = [v13 countByEnumeratingWithState:&v24 objects:v40 count:16];
  if (!v19) {
    goto LABEL_36;
  }
  uint64_t v20 = v19;
  unint64_t v16 = 0;
  uint64_t v21 = *(void *)v25;
  do
  {
    for (uint64_t m = 0; m != v20; ++m)
    {
      if (*(void *)v25 != v21) {
        objc_enumerationMutation(v13);
      }
      v16 += objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * m), "sampleCountInTimestampRangeStart:end:", *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 40), (void)v24);
    }
    uint64_t v20 = [v13 countByEnumeratingWithState:&v24 objects:v40 count:16];
  }
  while (v20);
LABEL_37:

  if (v5 > v16) {
    return -1;
  }
  else {
    return v5 < v16;
  }
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  uint64_t v3 = [*(id *)(a1 + 40) firstObject];
  if ([v2 uniquePid]) {
    int v4 = [v2 pid] == 0;
  }
  else {
    int v4 = 1;
  }
  if ([v3 uniquePid]) {
    int v5 = [v3 pid] == 0;
  }
  else {
    int v5 = 1;
  }
  uint64_t v6 = 1;
  if (!v4) {
    uint64_t v6 = -1;
  }
  if (v5 == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }

  return v7;
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_7(uint64_t a1, char a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = -[SASamplePrinter highestPriorityInTask:useBasePriority:](*(void *)(a1 + 40), *(void **)(*((void *)&v24 + 1) + 8 * i), a2);
        if (v10 > v7) {
          int v7 = v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        int v17 = -[SASamplePrinter highestPriorityInTask:useBasePriority:](*(void *)(a1 + 40), *(void **)(*((void *)&v20 + 1) + 8 * j), a2);
        if (v17 > v14) {
          int v14 = v17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }
  else
  {
    int v14 = 0;
  }

  if (v7 <= v14) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = -1;
  }
  if (v7 < v14) {
    return 1;
  }
  else {
    return v18;
  }
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_8(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = -[SASamplePrinter largestFootprintInTask:](*(void **)(a1 + 40), *(void **)(*((void *)&v22 + 1) + 8 * i));
        if (v8 > v5) {
          uint64_t v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = -[SASamplePrinter largestFootprintInTask:](*(void **)(a1 + 40), *(void **)(*((void *)&v18 + 1) + 8 * j));
        if (v15 > v12) {
          uint64_t v12 = v15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  if (v5 <= v12) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = -1;
  }
  if (v5 < v12) {
    return 1;
  }
  else {
    return v16;
  }
}

uint64_t __44__SASamplePrinter_printTasksWithAggregation__block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        *(void *)long long buf = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        [v11 cpuTimeNs:buf cpuInstructions:&v39 cpuCycles:&v38 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
        v8 += *(void *)buf;
        v7 += v39;
        v6 += v38;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        *(void *)long long buf = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        [v19 cpuTimeNs:buf cpuInstructions:&v39 cpuCycles:&v38 betweenStartTime:*(void *)(*(void *)(a1 + 40) + 32) endTime:*(void *)(*(void *)(a1 + 40) + 40)];
        v14 += *(void *)buf;
        v15 += v39;
        v16 += v38;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
  }

  switch(a2)
  {
    case 6:
      BOOL v20 = v8 > v14;
      if (v8 >= v14) {
        goto LABEL_33;
      }
      return 1;
    case 7:
      BOOL v20 = v7 > v15;
      if (v7 < v15) {
        return 1;
      }
      goto LABEL_33;
    case 8:
      BOOL v20 = v6 > v16;
      if (v6 < v16) {
        return 1;
      }
LABEL_33:
      if (!v20) {
        return 0;
      }
      return -1;
    case 9:
      double v21 = 0.0;
      double v22 = 0.0;
      if (v7) {
        double v22 = (double)v6 / (double)v7;
      }
      if (v15) {
        double v21 = (double)v16 / (double)v15;
      }
      if (v22 < v21) {
        return 1;
      }
      if (v22 <= v21) {
        return 0;
      }
      return -1;
    default:
      int v24 = *__error();
      long long v25 = _sa_logt();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = a2;
        _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "invalid sort option 0x%llx", buf, 0xCu);
      }

      *__error() = v24;
      _SASetCrashLogMessage(5508, "invalid sort option 0x%llx", v26, v27, v28, v29, v30, v31, a2);
      _os_crash();
      __break(1u);
      JUMPOUT(0x1BF2D58A0);
  }
}

- (void)printSingleStackForTasks:(void *)a3 limitToDispatchQueueIds:(void *)a4 limitToThreadIds:(char)a5 intersection:(unint64_t)a6 sampleCount:
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  *((void *)&v131 + 1) = a3;
  *(void *)&long long v131 = a4;
  uint64_t v133 = a1;
  if (([*(id *)(a1 + 16) printHeavyStacks] & 1) == 0)
  {
    int v79 = *__error();
    long long v80 = _sa_logt();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      LOWORD(dest.receiver) = 0;
      _os_log_error_impl(&dword_1BF22B000, v80, OS_LOG_TYPE_ERROR, "!printHeavyStacks", (uint8_t *)&dest, 2u);
    }

    *__error() = v79;
    _SASetCrashLogMessage(7975, "!printHeavyStacks", v81, v82, v83, v84, v85, v86, v120);
    _os_crash();
    __break(1u);
    goto LABEL_93;
  }
  if (![v11 count])
  {
LABEL_93:
    int v87 = *__error();
    unint64_t v88 = _sa_logt();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      LOWORD(dest.receiver) = 0;
      _os_log_error_impl(&dword_1BF22B000, v88, OS_LOG_TYPE_ERROR, "Printing single stack for 0 tasks", (uint8_t *)&dest, 2u);
    }

    *__error() = v87;
    _SASetCrashLogMessage(7976, "Printing single stack for 0 tasks", v89, v90, v91, v92, v93, v94, v120);
    _os_crash();
    __break(1u);
    goto LABEL_96;
  }
  if (v131 != 0 && [v11 count] != 1)
  {
LABEL_96:
    int v95 = *__error();
    uint64_t v96 = _sa_logt();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      LOWORD(dest.receiver) = 0;
      _os_log_error_impl(&dword_1BF22B000, v96, OS_LOG_TYPE_ERROR, "Limiting to specific dispatch queues/threads, but with multiple tasks", (uint8_t *)&dest, 2u);
    }

    *__error() = v95;
    _SASetCrashLogMessage(7977, "Limiting to specific dispatch queues/threads, but with multiple tasks", v97, v98, v99, v100, v101, v102, v120);
    _os_crash();
    __break(1u);
    goto LABEL_99;
  }
  id v130 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([*(id *)(a1 + 16) microstackshotsFormat] & 1) != 0
    || [*(id *)(a1 + 16) systemstatsFormat])
  {
    self = objc_alloc_init(SAMicrostackshotSummary);
  }
  else
  {
    self = 0;
  }
  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v170 objects:v180 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v171;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v171 != v13) {
          objc_enumerationMutation(obj);
        }
        unint64_t v15 = *(void **)(*((void *)&v170 + 1) + 8 * i);
        unint64_t v16 = [v15 threads];
        v162[0] = MEMORY[0x1E4F143A8];
        v162[1] = 3221225472;
        v162[2] = __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke;
        v162[3] = &unk_1E63F97F8;
        id v163 = *((id *)&v131 + 1);
        id v17 = (id)v131;
        char v169 = a5;
        id v164 = v17;
        uint64_t v165 = v133;
        uint64_t v166 = v15;
        id v167 = v130;
        double v168 = self;
        [v16 enumerateKeysAndObjectsUsingBlock:v162];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v170 objects:v180 count:16];
    }
    while (v12);
  }

  long long v18 = [obj firstObject];
  long long v124 = -[SASamplePrinter binaryImagesHitByTask:](v133, v18);

  uint64_t v125 = [obj firstObject];
  if ([(id)v125 pid])
  {
    int v19 = 0;
  }
  else
  {
    if (v125) {
      objc_copyStruct(&dest, (const void *)(v125 + 288), 8, 1, 0);
    }
    int v19 = CSArchitectureIs32Bit() ^ 1;
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v129 = obj;
  uint64_t v20 = [v129 countByEnumeratingWithState:&v158 objects:v179 count:16];
  if (!v20)
  {
    id obja = 0;
    uint64_t v44 = v129;
    goto LABEL_69;
  }
  id obja = 0;
  p_objc_super dest = &dest;
  uint64_t v21 = *(void *)v159;
  do
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      if (*(void *)v159 != v21) {
        objc_enumerationMutation(v129);
      }
      long long v23 = *(void **)(*((void *)&v158 + 1) + 8 * j);
      int v24 = [v23 mainBinaryLoadInfo];
      long long v25 = v24;
      if (v24)
      {
        if (!obja) {
          goto LABEL_32;
        }
        unint64_t v26 = [v24 loadAddress];
        uint64_t v27 = [obja mainBinaryLoadInfo];
        unint64_t v28 = [v27 loadAddress];

        if (!v19)
        {
          if (v26 >= v28) {
            goto LABEL_33;
          }
LABEL_32:
          id v29 = v23;

          id obja = v29;
          goto LABEL_33;
        }
        if (v26 > v28) {
          goto LABEL_32;
        }
      }
LABEL_33:
    }
    uint64_t v20 = [v129 countByEnumeratingWithState:&v158 objects:v179 count:16];
  }
  while (v20);

  if (!obja)
  {
    id obja = 0;
    goto LABEL_70;
  }
  uint64_t v121 = [(id)v125 mainBinary];
  if (!v121)
  {
LABEL_99:
    int v103 = *__error();
    int v104 = _sa_logt();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      id v105 = [(id)v125 debugDescription];
      uint64_t v106 = [v105 UTF8String];
      uint64_t v107 = [(id)v125 mainBinaryLoadInfo];
      id v108 = [v107 debugDescription];
      uint64_t v109 = [v108 UTF8String];
      LODWORD(dest.receiver) = 136315394;
      *(id *)((char *)&p_dest->receiver + 4) = (id)v106;
      WORD2(dest.super_class) = 2080;
      *(Class *)((char *)&p_dest->super_class + 6) = (Class)v109;
      _os_log_error_impl(&dword_1BF22B000, v104, OS_LOG_TYPE_ERROR, "No main binary for %s with main binary load info %s", (uint8_t *)&dest, 0x16u);
    }
    *__error() = v103;
    id v110 = [(id)v125 debugDescription];
    char v111 = [v110 UTF8String];
    id v112 = [(id)v125 mainBinaryLoadInfo];
    id v113 = [v112 debugDescription];
    [v113 UTF8String];
    _SASetCrashLogMessage(8047, "No main binary for %s with main binary load info %s", v114, v115, v116, v117, v118, v119, v111);

    _os_crash();
    __break(1u);
  }
  long long v122 = objc_msgSend(v124, "objectForKeyedSubscript:");
  if ([v122 count])
  {
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v126 = [v124 objectForKeyedSubscript:v121];
    uint64_t v128 = [v126 countByEnumeratingWithState:&v154 objects:v178 count:16];
    if (v128)
    {
      uint64_t v127 = *(void *)v155;
      do
      {
        for (uint64_t k = 0; k != v128; ++k)
        {
          if (*(void *)v155 != v127) {
            objc_enumerationMutation(v126);
          }
          long long v32 = *(void **)(*((void *)&v154 + 1) + 8 * k);
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          long long v33 = [obja binaryLoadInfos];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v150 objects:v177 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v151;
            while (2)
            {
              for (uint64_t m = 0; m != v34; ++m)
              {
                if (*(void *)v151 != v35) {
                  objc_enumerationMutation(v33);
                }
                long long v37 = *(void **)(*((void *)&v150 + 1) + 8 * m);
                uint64_t v38 = [v37 binary];
                uint64_t v39 = [v32 binary];
                if (v38 == v39)
                {
                  long long v40 = [v37 segment];
                  long long v41 = [v32 segment];
                  BOOL v42 = v40 == v41;

                  if (v42)
                  {
                    uint64_t v43 = [v37 loadAddress];
                    if (v32) {
                      v32[3] = v43;
                    }
                    goto LABEL_56;
                  }
                }
                else
                {
                }
              }
              uint64_t v34 = [v33 countByEnumeratingWithState:&v150 objects:v177 count:16];
              if (v34) {
                continue;
              }
              break;
            }
          }
LABEL_56:
        }
        uint64_t v128 = [v126 countByEnumeratingWithState:&v154 objects:v178 count:16];
      }
      while (v128);
    }
  }
  else
  {
    if (!v122)
    {
      long long v122 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [v124 setObject:v122 forKeyedSubscript:v121];
    }
    long long v45 = [SABinaryLoadInfoToDisplay alloc];
    id v46 = [obja mainBinaryLoadInfo];
    if (v45)
    {
      uint64_t v47 = v46;
      long long v48 = [v46 binary];
      long long v49 = [v47 segment];
      uint64_t v50 = [v47 loadAddress];
      dest.receiver = v45;
      dest.super_class = (Class)SABinaryLoadInfoToDisplay;
      long long v45 = (SABinaryLoadInfoToDisplay *)objc_msgSendSuper2(&dest, sel_initWithBinary_segment_loadAddress_, v48, v49, v50);

      if (v45)
      {
        v45->_isInKernelAddressSpace = [v47 isInKernelAddressSpace];
        uint64_t v51 = [v47 exclave];
        exclave = v45->_exclave;
        v45->_exclave = (SAExclave *)v51;
      }
      id v46 = v47;
    }
    id v126 = v46;

    [v122 addObject:v45];
  }

  uint64_t v44 = (void *)v121;
LABEL_69:

LABEL_70:
  dest.receiver = 0;
  dest.super_class = (Class)&dest;
  uint64_t v175 = 0x2020000000;
  int v176 = 0;
  uint64_t v146 = 0;
  char v147 = &v146;
  uint64_t v148 = 0x2020000000;
  uint64_t v149 = 0;
  if (self)
  {
    uint64_t v142 = 0;
    char v143 = &v142;
    uint64_t v144 = 0x2020000000;
    uint64_t v145 = 0;
    id v53 = objc_getProperty(self, v30, 8, 1);
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_1743;
    v141[3] = &unk_1E63F9820;
    v141[4] = &v142;
    v141[5] = &dest;
    [v53 enumerateKeysAndObjectsUsingBlock:v141];

    uint64_t v137 = 0;
    BOOL v138 = &v137;
    uint64_t v139 = 0x2020000000;
    uint64_t v140 = 0;
    id v55 = objc_getProperty(self, v54, 16, 1);
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2_1745;
    v136[3] = &unk_1E63F9820;
    v136[4] = &v137;
    v136[5] = &v146;
    [v55 enumerateKeysAndObjectsUsingBlock:v136];

    int v56 = [*(id *)(v133 + 16) printJson];
    uint64_t v57 = *(void **)(v133 + 8);
    if (v56)
    {
      [v57 appendString:@",\"primaryMicrostackshotState\":{"];
      id v58 = *(void **)(v133 + 8);
      uint64_t v59 = [NSNumber numberWithUnsignedInteger:v143[3]];
      SAJSONWriteDictionaryFirstEntry(v58, @"count", v59);

      +[SACallTreeState writeJSONDictionaryEntriesToStream:microstackshotState:primaryMicrostackshotState:includeIdleAndBattery:]((uint64_t)SACallTreeState, *(void **)(v133 + 8), *((_DWORD *)dest.super_class + 6), ~(unsigned __int16)*((_DWORD *)dest.super_class + 6), [*(id *)(v133 + 16) includeUserIdleAndBatteryStateInStacks]);
      [*(id *)(v133 + 8) appendString:@"}"];
      [*(id *)(v133 + 8) appendString:@",\"primaryCountedState\":{"];
      id v60 = *(void **)(v133 + 8);
      uint64_t v61 = [NSNumber numberWithUnsignedInteger:v138[3]];
      SAJSONWriteDictionaryFirstEntry(v60, @"count", v61);

      +[SACallTreeState writeJSONDictionaryEntriesToStream:state:primaryState:]((uint64_t)SACallTreeState, *(void **)(v133 + 8), v147[3], 0);
      [*(id *)(v133 + 8) appendString:@"}"];
      if (([*(id *)(v133 + 16) includeUserIdleAndBatteryStateInStacks] & 1) == 0)
      {
        id v62 = *(void **)(v133 + 8);
        id v63 = [NSNumber numberWithUnsignedInteger:self->_userActiveCount];
        SAJSONWriteDictionaryEntry(v62, @"userActiveSampleCount", v63);

        id v64 = *(void **)(v133 + 8);
        id v65 = [NSNumber numberWithUnsignedInteger:self->_userIdleCount];
        SAJSONWriteDictionaryEntry(v64, @"userIdleSampleCount", v65);

        long long v66 = *(void **)(v133 + 8);
        id v67 = [NSNumber numberWithUnsignedInteger:self->_onBatteryCount];
        SAJSONWriteDictionaryEntry(v66, @"onBatterySampleCount", v67);

        id v68 = *(void **)(v133 + 8);
        long long v69 = [NSNumber numberWithUnsignedInteger:self->_onACCount];
        SAJSONWriteDictionaryEntry(v68, @"onACSampleCount", v69);
      }
    }
    else
    {
      objc_msgSend(v57, "printWithFormat:", @"%-*s%lu samples ", 18, "Primary state: ", v143[3]);
      saos_printf_microstackshot_state(*(void **)(v133 + 8), *((unsigned int *)dest.super_class + 6), ~*((_DWORD *)dest.super_class + 6), [*(id *)(v133 + 16) systemstatsFormat], objc_msgSend(*(id *)(v133 + 16), "includeUserIdleAndBatteryStateInStacks"));
      uint64_t v72 = v147[3];
      char v73 = [*(id *)(v133 + 16) systemstatsFormat];
      if (v72) {
        char v74 = v73;
      }
      else {
        char v74 = 1;
      }
      if ((v74 & 1) == 0)
      {
        [*(id *)(v133 + 8) appendString:@", "];
        _saos_printf_state_appended_noparens(*(void **)(v133 + 8), v147[3], 0, 0);
      }
      [*(id *)(v133 + 8) appendString:@"\n"];
      if (([*(id *)(v133 + 16) includeUserIdleAndBatteryStateInStacks] & 1) == 0)
      {
        [*(id *)(v133 + 8) printWithFormat:@"%-*s%lu samples Idle, %lu samples Active", 18, "User Activity: ", self->_userIdleCount, self->_userActiveCount];
        uint64_t v75 = *(void **)(v133 + 8);
        unint64_t v76 = a6 - (self->_userActiveCount + self->_userIdleCount);
        if (v76) {
          [v75 printWithFormat:@", %lu samples Unknown\n", v76];
        }
        else {
          [v75 appendString:@"\n"];
        }
        [*(id *)(v133 + 8) printWithFormat:@"%-*s%lu samples on Battery, %lu samples on AC", 18, "Power Source: ", self->_onBatteryCount, self->_onACCount];
        id v77 = *(void **)(v133 + 8);
        unint64_t v78 = a6 - (self->_onACCount + self->_onBatteryCount);
        if (v78) {
          [v77 printWithFormat:@", %lu samples Unknown\n", v78];
        }
        else {
          [v77 appendString:@"\n"];
        }
        *((_DWORD *)dest.super_class + 6) &= 0xFFFFFFE3;
      }
    }
    _Block_object_dispose(&v137, 8);
    _Block_object_dispose(&v142, 8);
    id v71 = v147 + 3;
    int v70 = *((_DWORD *)dest.super_class + 6);
  }
  else
  {
    int v70 = 0;
    id v71 = &v149;
  }
  -[SASamplePrinter addStack:toStream:sampleCount:binariesToDisplay:primaryState:primaryMicrostackshotState:onlyHeaviestStack:](v133, v130, *(void **)(v133 + 8), a6, v124, (uint64_t)v71, v70, 0);
  _Block_object_dispose(&v146, 8);
  _Block_object_dispose(&dest, 8);
}

void __51__SASamplePrinter_printTaskHeaderForMultipleTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 indexOfFirstThreadStateOnOrAfterTime:*(void *)(*(void *)(a1 + 32) + 32) sampleIndex:*(void *)(*(void *)(a1 + 32) + 48)];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    unint64_t v8 = [v5 indexOfLastThreadStateOnOrBeforeTime:*(void *)(*(void *)(a1 + 32) + 40) sampleIndex:*(void *)(*(void *)(a1 + 32) + 56)];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = v8;
      unint64_t v10 = v8 - v7;
      if (v8 < v7)
      {
        int v25 = *__error();
        unint64_t v26 = _sa_logt();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = [*(id *)(*(void *)(a1 + 32) + 32) debugDescription];
          uint64_t v28 = [v27 UTF8String];
          id v29 = [*(id *)(*(void *)(a1 + 32) + 40) debugDescription];
          *(_DWORD *)long long buf = 134218754;
          unint64_t v40 = v7;
          __int16 v41 = 2080;
          uint64_t v42 = v28;
          __int16 v43 = 2048;
          unint64_t v44 = v9;
          __int16 v45 = 2080;
          uint64_t v46 = [v29 UTF8String];
          _os_log_error_impl(&dword_1BF22B000, v26, OS_LOG_TYPE_ERROR, "firstThreadStateIndex %lu after reportStartTime %s > lastThreadStateIndex %lu before reportEndTime %s", buf, 0x2Au);
        }
        *__error() = v25;
        id v30 = [*(id *)(*(void *)(a1 + 32) + 32) debugDescription];
        [v30 UTF8String];
        id v31 = [*(id *)(*(void *)(a1 + 32) + 40) debugDescription];
        [v31 UTF8String];
        _SASetCrashLogMessage(5802, "firstThreadStateIndex %lu after reportStartTime %s > lastThreadStateIndex %lu before reportEndTime %s", v32, v33, v34, v35, v36, v37, v7);

        _os_crash();
        __break(1u);
      }
      id v11 = [v5 threadStates];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v7];

      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
        || ([v12 startTimestamp],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            int v14 = [v13 lt:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)],
            v13,
            v14))
      {
        uint64_t v15 = [v12 startTimestamp];
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        if (*(unsigned char *)(a1 + 80))
        {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 startSampleIndex];
          if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL) {
            *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v12 endSampleIndex] + 1;
          }
        }
      }
      long long v18 = [v5 threadStates];
      int v19 = [v18 objectAtIndexedSubscript:v9];

      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
        || ([v19 endTimestamp],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            int v21 = [v20 gt:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)],
            v20,
            v21))
      {
        uint64_t v22 = [v19 endTimestamp];
        uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
        int v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        if (*(unsigned char *)(a1 + 80)) {
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v19 endSampleIndex];
        }
      }
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v10 + 1;
    }
  }
}

- (uint64_t)numIOsForTask:(void *)a3 ioSize:
{
  id v5 = a2;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = [v5 threads];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__SASamplePrinter_numIOsForTask_ioSize___block_invoke;
  v9[3] = &unk_1E63F9130;
  v9[4] = a1;
  v9[5] = &v14;
  v9[6] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  *a3 = v15[3];
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (uint64_t)printTaskHeaderForTask:(unint64_t)a3 specialDispatchQueueId:(uint64_t)a4 specialThreadId:(char *)a5 omitSpecial:(int)a6 omitOther:
{
  unint64_t v11 = (unint64_t)buf;
  uint64_t v453 = *MEMORY[0x1E4F143B8];
  char v324 = a2;
  if (a5 && a6)
  {
    int v190 = *__error();
    id v191 = _sa_logt();
    if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
    {
      id v192 = [v324 debugDescription];
      uint64_t v193 = [v192 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v193;
      _os_log_error_impl(&dword_1BF22B000, v191, OS_LOG_TYPE_ERROR, "%s: omitSpecialThreadId and omitOtherThreads", buf, 0xCu);
    }
    *__error() = v190;
    id v194 = [v324 debugDescription];
    char v195 = [v194 UTF8String];
    _SASetCrashLogMessage(6031, "%s: omitSpecialThreadId and omitOtherThreads", v196, v197, v198, v199, v200, v201, v195);

    _os_crash();
    __break(1u);
    goto LABEL_251;
  }
  int v328 = a6;
  BOOL v12 = -[SASamplePrinter hasTimeIndexes](a1);
  if (!a3) {
    goto LABEL_10;
  }
  uint64_t v13 = [v324 dispatchQueues];
  uint64_t v14 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v332 = [v13 objectForKeyedSubscript:v14];

  if (!v332) {
    goto LABEL_260;
  }
  if (a4)
  {
    while (1)
    {
      uint64_t v15 = [v324 threads];
      uint64_t v16 = [NSNumber numberWithUnsignedLongLong:a4];
      uint64_t v322 = [v15 objectForKeyedSubscript:v16];

      if (v322) {
        break;
      }
      LODWORD(a5) = *__error();
      uint64_t v17 = _sa_logt();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v324 debugDescription];
        uint64_t v19 = [v18 UTF8String];
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a4;
        _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "%s: specialThreadId 0x%llx doesn't exist", buf, 0x16u);
      }
      *__error() = (int)a5;
      id v20 = [v324 debugDescription];
      char v21 = [v20 UTF8String];
      _SASetCrashLogMessage(6044, "%s: specialThreadId 0x%llx doesn't exist", v22, v23, v24, v25, v26, v27, v21);

      _os_crash();
      __break(1u);
LABEL_10:
      uint64_t v332 = 0;
      if (!a4) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v322 = 0;
  }
  unint64_t v316 = a4 | a3;
  if (a4 | a3)
  {
    if (a5)
    {
      uint64_t v28 = @"(other dispatch queues/threads)";
      if (!a3) {
        uint64_t v28 = @"(other threads)";
      }
      uint64_t v319 = v28;
    }
    else
    {
      id v29 = [NSString alloc];
      id v30 = v29;
      if (a3)
      {
        uint64_t v31 = -[SASamplePrinter displayNameForDispatchQueue:]((void *)v332);
        uint64_t v32 = (void *)v31;
        if (a4) {
          uint64_t v33 = [v30 initWithFormat:@"%@ 0x%llx, %@ %@", @"Thread", a4, @"DispatchQueue", v31];
        }
        else {
          uint64_t v33 = [v30 initWithFormat:@"%@ %@", @"DispatchQueue", v31, v269, v270];
        }
        uint64_t v319 = (void *)v33;
      }
      else
      {
        uint64_t v319 = (void *)[v29 initWithFormat:@"%@ 0x%llx", @"Thread", a4];
      }
    }
  }
  else
  {
    uint64_t v319 = 0;
  }
  uint64_t v430 = 0;
  id v431 = &v430;
  uint64_t v432 = 0x2020000000;
  uint64_t v433 = 0;
  uint64_t v426 = 0;
  v427 = &v426;
  uint64_t v428 = 0x2020000000;
  uint64_t v429 = 0;
  uint64_t v422 = 0;
  double v423 = &v422;
  uint64_t v424 = 0x2020000000;
  uint64_t v425 = 0;
  a3 = (unint64_t)v420;
  v420[0] = 0;
  v420[1] = v420;
  v420[2] = 0x2020000000;
  char v421 = 0;
  v418[0] = 0;
  v418[1] = v418;
  v418[2] = 0x2020000000;
  char v419 = 0;
  uint64_t v414 = 0;
  int v415 = &v414;
  uint64_t v416 = 0x2020000000;
  uint64_t v417 = 0;
  uint64_t v410 = 0;
  int v411 = &v410;
  uint64_t v412 = 0x2020000000;
  uint64_t v413 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v406 = 0;
  uint64_t v407 = &v406;
  uint64_t v408 = 0x2020000000;
  uint64_t v409 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v400 = 0;
  double v401 = &v400;
  uint64_t v402 = 0x3032000000;
  id v403 = __Block_byref_object_copy__4;
  v404 = __Block_byref_object_dispose__4;
  id v405 = 0;
  uint64_t v394 = 0;
  id v395 = &v394;
  uint64_t v396 = 0x3032000000;
  double v397 = __Block_byref_object_copy__4;
  double v398 = __Block_byref_object_dispose__4;
  id v399 = 0;
  uint64_t v390 = 0;
  v391 = &v390;
  uint64_t v392 = 0x2020000000;
  uint64_t v393 = 0;
  uint64_t v386 = 0;
  unint64_t v387 = &v386;
  uint64_t v388 = 0x2020000000;
  uint64_t v389 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3810000000;
  id v449 = &unk_1BF343D4B;
  uint64_t v450 = 0;
  uint64_t v451 = 0;
  uint64_t v452 = 0;
  obuint64_t j = (v322 | v332) != 0;
  if (v322 | v332)
  {
    uint64_t v34 = *(void **)(a1 + 32);
    uint64_t v35 = *(void **)(a1 + 40);
    unint64_t v36 = *(void *)(a1 + 48);
    unint64_t v37 = *(void *)(a1 + 56);
    v385[0] = MEMORY[0x1E4F143A8];
    v385[1] = 3221225472;
    v385[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke;
    v385[3] = &unk_1E63F9588;
    v385[4] = a1;
    v385[5] = &v390;
    v385[6] = &v386;
    v385[7] = buf;
    -[SATask enumerateThreadStatesForThread:dispatchQueue:betweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]((uint64_t)v324, (void *)v322, (void *)v332, v34, v36, v35, v37, 0, v385);
  }
  uint64_t v38 = *(void *)(a1 + 32);
  uint64_t v39 = *(void *)(a1 + 40);
  uint64_t v40 = *(void *)(a1 + 48);
  uint64_t v41 = *(void *)(a1 + 56);
  v384[0] = MEMORY[0x1E4F143A8];
  v384[1] = 3221225472;
  v384[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2;
  v384[3] = &unk_1E63F95B0;
  v384[4] = a1;
  v384[5] = &v400;
  v384[6] = &v394;
  v384[7] = &v414;
  v384[8] = &v410;
  v384[9] = &v406;
  v384[10] = v420;
  v384[11] = v418;
  v384[12] = &v422;
  v384[13] = &v430;
  v384[14] = &v426;
  [v324 enumerateTaskStatesBetweenStartTime:v38 startSampleIndex:v40 endTime:v39 endSampleIndex:v41 reverseOrder:0 block:v384];
  uint64_t v6 = v436;
  if ((v401[5] != 0) != (v395[5] != 0))
  {
LABEL_251:
    unint64_t v11 = *__error();
    int v202 = _sa_logt();
    a5 = "n";
    if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
    {
      id v203 = [v324 debugDescription];
      uint64_t v204 = [v203 UTF8String];
      if (v401[5]) {
        id v205 = "y";
      }
      else {
        id v205 = "n";
      }
      if (v395[5]) {
        uint64_t v206 = "y";
      }
      else {
        uint64_t v206 = "n";
      }
      *(_DWORD *)double v436 = 136315650;
      *(void *)(v6 + 4) = v204;
      WORD2(v437) = 2080;
      *(void *)(v6 + 14) = v205;
      HIWORD(v438) = 2080;
      v439 = (uint64_t (*)(uint64_t, uint64_t))v206;
      _os_log_error_impl(&dword_1BF22B000, v202, OS_LOG_TYPE_ERROR, "%s: firstTaskState %s, lastTaskState %s", v436, 0x20u);
    }
    *__error() = v11;
    id v207 = [v324 debugDescription];
    char v208 = [v207 UTF8String];
    _SASetCrashLogMessage(6135, "%s: firstTaskState %s, lastTaskState %s", v209, v210, v211, v212, v213, v214, v208);

    _os_crash();
    __break(1u);
LABEL_260:
    int v215 = *__error();
    double v216 = _sa_logt();
    if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
    {
      id v217 = [v324 debugDescription];
      uint64_t v218 = [v217 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      *(void *)(v11 + 4) = v218;
      *(_WORD *)&buf[12] = 2048;
      *(void *)(v11 + 14) = a3;
      _os_log_error_impl(&dword_1BF22B000, v216, OS_LOG_TYPE_ERROR, "%s: specialDispatchQueue %llu doesn't exist", buf, 0x16u);
    }
    *__error() = v215;
    id v219 = [v324 debugDescription];
    char v220 = [v219 UTF8String];
    _SASetCrashLogMessage(6038, "%s: specialDispatchQueue %llu doesn't exist", v221, v222, v223, v224, v225, v226, v220);

    _os_crash();
    __break(1u);
    goto LABEL_263;
  }
  int v321 = [v324 startTimestamp];
  uint64_t v320 = [v324 endTimestamp];
  int v42 = v328;
  int v43 = (int)a5;
  if (!v401[5])
  {
    uint64_t v52 = -1;
    if (!v321
      || !v320
      || ([v321 gt:*(void *)(a1 + 40)] & 1) != 0
      || ([v320 lt:*(void *)(a1 + 32)] & 1) != 0)
    {
      goto LABEL_245;
    }
  }
  if (v12
    || ([v324 taskStates],
        unint64_t v44 = objc_claimAutoreleasedReturnValue(),
        BOOL v45 = [v44 count] == 0,
        v44,
        int v42 = v328,
        !v45))
  {
    if (!v316) {
      goto LABEL_50;
    }
    if (a5)
    {
      if (v12) {
        goto LABEL_50;
      }
      unint64_t v46 = v423[3];
      unint64_t v47 = v391[3];
      BOOL v48 = v46 >= v47;
      unint64_t v49 = v46 - v47;
      if (!v48) {
        goto LABEL_270;
      }
      v423[3] = v49;
      uint64_t v50 = v431;
      uint64_t v51 = v431[3] - v387[3];
      goto LABEL_48;
    }
    if (!v42) {
      goto LABEL_50;
    }
    v423[3] = v391[3];
LABEL_47:
    uint64_t v51 = v387[3];
    uint64_t v50 = v431;
LABEL_48:
    v50[3] = v51;
    v427[3] = 0;
    goto LABEL_50;
  }
  if (v423[3]) {
    goto LABEL_267;
  }
  if (v316 && (v328 & 1) != 0)
  {
    v423[3] = v391[3];
    goto LABEL_47;
  }
  id v53 = [v324 threads];
  v378[0] = MEMORY[0x1E4F143A8];
  v378[1] = 3221225472;
  v378[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1366;
  v378[3] = &unk_1E63F9600;
  v378[4] = a1;
  char v383 = (char)a5;
  id v379 = (id)v332;
  id v380 = (id)v322;
  long long v381 = &v422;
  uint64_t v382 = &v430;
  [v53 enumerateKeysAndObjectsUsingBlock:v378];

LABEL_50:
  SEL v54 = *(void **)(a1 + 128);
  if (v54)
  {
    if (v54 == v324 && !a5) {
      goto LABEL_68;
    }
  }
  else
  {
    id v55 = [*(id *)(a1 + 160) targetProcess];
    if (v55 == v324) {
      char v56 = (char)a5;
    }
    else {
      char v56 = 1;
    }

    if ((v56 & 1) == 0) {
      goto LABEL_68;
    }
  }
  if (!v423[3] && ![*(id *)(a1 + 16) displayTasksWithZeroCount]) {
    goto LABEL_75;
  }
  if ([*(id *)(a1 + 16) omitTasksBelowSampleCount] < 1) {
    unint64_t v57 = 0;
  }
  else {
    unint64_t v57 = [*(id *)(a1 + 16) omitTasksBelowSampleCount];
  }
  if ((int)[*(id *)(a1 + 16) omitTasksBelowPercentOfTotalSamples] >= 1)
  {
    uint64_t v58 = *(void *)(a1 + 64);
    int v59 = [*(id *)(a1 + 16) omitTasksBelowPercentOfTotalSamples];
    if (v57 <= v58 * v59 / 0x64uLL) {
      unint64_t v57 = v58 * v59 / 0x64uLL;
    }
  }
  if (v57 && v423[3] <= v57)
  {
LABEL_75:
    uint64_t v52 = -1;
    goto LABEL_245;
  }
LABEL_68:
  uint64_t v374 = 0;
  long long v375 = &v374;
  uint64_t v376 = 0x2020000000;
  uint64_t v377 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v370 = 0;
  id v371 = &v370;
  uint64_t v372 = 0x2020000000;
  uint64_t v373 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
  {
    id v60 = (void *)v401[5];
    if (v60)
    {
      unint64_t v61 = [v60 startSampleIndex];
      unint64_t v62 = *(void *)(a1 + 48);
      if (v61 > v62) {
        unint64_t v62 = v61;
      }
      v375[3] = v62;
      unint64_t v63 = [(id)v395[5] endSampleIndex];
      unint64_t v64 = *(void *)(a1 + 56);
      if (v63 < v64) {
        unint64_t v64 = v63;
      }
      v371[3] = v64;
    }
    else
    {
      id v65 = [v324 threads];
      v369[0] = MEMORY[0x1E4F143A8];
      v369[1] = 3221225472;
      v369[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1370;
      v369[3] = &unk_1E63F9628;
      v369[4] = &v374;
      v369[5] = &v370;
      [v65 enumerateKeysAndObjectsUsingBlock:v369];

      unint64_t v66 = v375[3];
      if (v66 <= *(void *)(a1 + 48)) {
        unint64_t v66 = *(void *)(a1 + 48);
      }
      v375[3] = v66;
      unint64_t v67 = v371[3];
      if (v67 >= *(void *)(a1 + 56)) {
        unint64_t v67 = *(void *)(a1 + 56);
      }
      v371[3] = v67;
    }
  }
  id v68 = [*(id *)(a1 + 160) tasksByUniquePid];
  long long v69 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v324, "uniquePid"));
  int v70 = [v68 objectForKeyedSubscript:v69];
  id v71 = v70;
  if (v70)
  {
    id v72 = v70;
  }
  else
  {
    char v73 = [*(id *)(a1 + 160) tasksByPid];
    char v74 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v324, "pid"));
    id v72 = [v73 objectForKeyedSubscript:v74];
  }
  long long v368 = 0u;
  long long v367 = 0u;
  long long v366 = 0u;
  long long v365 = 0u;
  a5 = (char *)v72;
  uint64_t v75 = [a5 countByEnumeratingWithState:&v365 objects:v447 count:16];
  if (!v75)
  {
LABEL_263:

    goto LABEL_264;
  }
  BOOL v76 = 0;
  id v77 = 0;
  uint64_t v78 = *(void *)v366;
LABEL_86:
  uint64_t v79 = 0;
  while (1)
  {
    if (*(void *)v366 != v78) {
      objc_enumerationMutation(a5);
    }
    long long v80 = *(void **)(*((void *)&v365 + 1) + 8 * v79);
    if (v76) {
      break;
    }
    BOOL v76 = v80 == v324;
    if (v80 != v324)
    {
      uint64_t v81 = v80;

      id v77 = v81;
    }
    if (v75 == ++v79)
    {
      uint64_t v75 = [a5 countByEnumeratingWithState:&v365 objects:v447 count:16];
      if (!v75)
      {

        if (v80 == v324)
        {
          uint64_t v82 = 0;
          goto LABEL_97;
        }
LABEL_264:
        int v227 = *__error();
        double v228 = _sa_logt();
        if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
        {
          id v229 = [v324 debugDescription];
          uint64_t v230 = [v229 UTF8String];
          id v231 = [a5 debugDescription];
          uint64_t v232 = [v231 UTF8String];
          *(_DWORD *)double v436 = 136315394;
          *(void *)(v6 + 4) = v230;
          WORD2(v437) = 2080;
          *(void *)(v6 + 14) = v232;
          _os_log_error_impl(&dword_1BF22B000, v228, OS_LOG_TYPE_ERROR, "%s not in tasksWithSamePid %s", v436, 0x16u);
        }
        *__error() = v227;
        id v233 = [v324 debugDescription];
        char v234 = [v233 UTF8String];
        id v235 = [a5 debugDescription];
        [v235 UTF8String];
        _SASetCrashLogMessage(6295, "%s not in tasksWithSamePid %s", v236, v237, v238, v239, v240, v241, v234);

        _os_crash();
        __break(1u);
LABEL_267:
        int v242 = *__error();
        unint64_t v243 = _sa_logt();
        if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR))
        {
          id v244 = [v324 debugDescription];
          uint64_t v245 = [v244 UTF8String];
          uint64_t v246 = v423[3];
          *(_DWORD *)double v436 = 136315394;
          *(void *)(v6 + 4) = v245;
          WORD2(v437) = 2048;
          *(void *)(v6 + 14) = v246;
          _os_log_error_impl(&dword_1BF22B000, v243, OS_LOG_TYPE_ERROR, "%s: %lu numSamples (!hasTimeIndexes, no task states)", v436, 0x16u);
        }
        *__error() = v242;
        id v247 = [v324 debugDescription];
        char v248 = [v247 UTF8String];
        _SASetCrashLogMessage(6156, "%s: %lu numSamples (!hasTimeIndexes, no task states)", v249, v250, v251, v252, v253, v254, v248);

        _os_crash();
        __break(1u);
LABEL_270:
        int v255 = *__error();
        double v256 = _sa_logt();
        if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
        {
          id v257 = [v324 debugDescription];
          uint64_t v258 = [v257 UTF8String];
          uint64_t v259 = v423[3];
          double v260 = (uint64_t (*)(uint64_t, uint64_t))v391[3];
          *(_DWORD *)double v436 = 136315650;
          *(void *)(v6 + 4) = v258;
          WORD2(v437) = 2048;
          *(void *)(v6 + 14) = v259;
          HIWORD(v438) = 2048;
          v439 = v260;
          _os_log_error_impl(&dword_1BF22B000, v256, OS_LOG_TYPE_ERROR, "%s: numSamples %lu >= specialNumSamples %lu", v436, 0x20u);
        }
        *__error() = v255;
        id v261 = [v324 debugDescription];
        char v262 = [v261 UTF8String];
        _SASetCrashLogMessage(6203, "%s: numSamples %lu >= specialNumSamples %lu", v263, v264, v265, v266, v267, v268, v262);

        _os_crash();
        __break(1u);
      }
      goto LABEL_86;
    }
  }
  uint64_t v82 = v80;

LABEL_97:
  if (v77)
  {
    uint64_t v83 = [v77 sharedCache];
    uint64_t v84 = [v324 sharedCache];
    if (v83 == v84)
    {
      uint64_t v85 = [v77 endTimestamp];
      int v86 = [v85 ge:*(void *)(a1 + 32)];

      if (v86)
      {
        uint64_t v317 = -[SASamplePrinter displayNameForTask:]((void *)a1, v77);
        if (!v82) {
          goto LABEL_108;
        }
        goto LABEL_104;
      }
    }
    else
    {
    }
  }
  uint64_t v317 = 0;
  if (!v82)
  {
LABEL_108:
    uint64_t v315 = 0;
    goto LABEL_109;
  }
LABEL_104:
  int v87 = [v82 sharedCache];
  unint64_t v88 = [v324 sharedCache];
  if (v87 != v88)
  {

    goto LABEL_108;
  }
  uint64_t v89 = [v82 startTimestamp];
  int v90 = [v89 le:*(void *)(a1 + 40)];

  if (!v90) {
    goto LABEL_108;
  }
  uint64_t v315 = -[SASamplePrinter displayNameForTask:]((void *)a1, v82);
LABEL_109:

  uint64_t v91 = [v324 startTimestamp];
  uint64_t v92 = [v324 ppid];
  if (v92 == -1 || v92 == [v324 pid])
  {
    id v314 = 0;
  }
  else
  {
    uint64_t v93 = -[SASampleStore lastTaskWithPid:onOrBeforeTimestamp:](*(void **)(a1 + 160), v92, v91);
    if (v93)
    {
      id v94 = v93;
    }
    else
    {
      -[SASampleStore firstTaskWithPid:](*(void **)(a1 + 160), v92);
      id v94 = (id)objc_claimAutoreleasedReturnValue();

      if (!v94)
      {
        id v314 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)a1, v92, 0, v91);
        goto LABEL_116;
      }
    }
    id v314 = -[SASamplePrinter displayNameForTask:]((void *)a1, v94);
  }
LABEL_116:
  uint64_t v95 = [v324 rpid];
  if ((int)v95 < 1 || v95 == [v324 pid])
  {
    char v313 = 0;
    goto LABEL_123;
  }
  uint64_t v96 = -[SASampleStore lastTaskWithPid:onOrBeforeTimestamp:](*(void **)(a1 + 160), v95, v91);
  if (v96)
  {
    id v97 = v96;

LABEL_122:
    char v313 = -[SASamplePrinter displayNameForTask:]((void *)a1, v97);

    goto LABEL_123;
  }
  -[SASampleStore firstTaskWithPid:](*(void **)(a1 + 160), v95);
  id v97 = (id)objc_claimAutoreleasedReturnValue();

  if (v97) {
    goto LABEL_122;
  }
  char v313 = -[SASamplePrinter displayNameForPid:threadId:timestamp:]((void *)a1, v95, 0, v91);
LABEL_123:

  if ([v324 pid])
  {
    uint64_t v312 = 0;
  }
  else
  {
    uint64_t v98 = [*(id *)(a1 + 160) kernelVersion];
    if (v98)
    {
      uint64_t v99 = [*(id *)(a1 + 160) kernelVersion];
      SACopySanitizedString(v99, 1, 0);
      uint64_t v312 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v312 = @"???";
    }
  }
  uint64_t v100 = v401;
  uint64_t v101 = (void *)v401[5];
  if (v101)
  {
    uint64_t v102 = [v101 taskSizeInBytes];
    int v103 = v328;
    uint64_t v100 = v401;
    if (v102)
    {
      unint64_t v290 = [(id)v401[5] taskSizeInBytes];
      *(void *)double v436 = 0;
      double v437 = v436;
      uint64_t v438 = 0x2020000000;
      v439 = 0;
      v439 = (uint64_t (*)(uint64_t, uint64_t))[(id)v395[5] taskSizeInBytes];
      unint64_t v104 = *((void *)v437 + 3);
      if (!v104)
      {
        uint64_t v105 = *(void *)(a1 + 32);
        uint64_t v106 = *(void *)(a1 + 40);
        uint64_t v107 = *(void *)(a1 + 48);
        uint64_t v108 = *(void *)(a1 + 56);
        v364[0] = MEMORY[0x1E4F143A8];
        v364[1] = 3221225472;
        v364[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1373;
        v364[3] = &unk_1E63F93F8;
        v364[4] = v436;
        [v324 enumerateTaskStatesBetweenStartTime:v105 startSampleIndex:v107 endTime:v106 endSampleIndex:v108 reverseOrder:1 block:v364];
        unint64_t v104 = *((void *)v437 + 3);
      }
      unint64_t v289 = v104;
      _Block_object_dispose(v436, 8);
      uint64_t v100 = v401;
    }
    else
    {
      unint64_t v290 = 0;
      unint64_t v289 = 0;
    }
  }
  else
  {
    unint64_t v290 = 0;
    unint64_t v289 = 0;
    int v103 = v328;
  }
  if (v100[5])
  {
    int v109 = [(id)v395[5] pageins];
    unsigned int v288 = v109 - [(id)v401[5] pageins];
  }
  else
  {
    unsigned int v288 = 0;
  }
  unint64_t v363 = 0;
  unint64_t v362 = 0;
  unint64_t v361 = 0;
  unint64_t v360 = 0;
  unint64_t v359 = 0;
  unint64_t v358 = 0;
  if ([*(id *)(a1 + 160) dataSource] != 8
    || ([*(id *)(a1 + 160) haveKPerfSched] | v103) == 1)
  {
    if ([*(id *)(a1 + 160) dataStyle] == 1)
    {
      if (!v103) {
        goto LABEL_154;
      }
    }
    else if (![*(id *)(a1 + 160) dataStyle] && (v103 & 1) == 0)
    {
      goto LABEL_154;
    }
    if ((((v322 | v332) != 0) & v103) == 0) {
      -[SATask cpuTimeNs:cpuInstructions:cpuCycles:nonThreadCpuTimeNs:nonThreadCpuInstructions:nonThreadCpuCycles:betweenStartTime:endTime:](v324, &v363, &v362, &v361, &v360, &v359, &v358, *(void **)(a1 + 32), *(void **)(a1 + 40));
    }
    if (((v43 | v103) & obj) == 1)
    {
      if (v43)
      {
        uint64_t v110 = *(void *)(*(void *)&buf[8] + 40);
        v363 -= *(void *)(*(void *)&buf[8] + 32);
        v362 -= v110;
        unint64_t v111 = v361 - *(void *)(*(void *)&buf[8] + 48);
LABEL_153:
        unint64_t v361 = v111;
        goto LABEL_154;
      }
      if (v103)
      {
        unint64_t v112 = *(void *)(*(void *)&buf[8] + 40);
        unint64_t v363 = *(void *)(*(void *)&buf[8] + 32);
        unint64_t v362 = v112;
        unint64_t v111 = *(void *)(*(void *)&buf[8] + 48);
        goto LABEL_153;
      }
    }
  }
LABEL_154:
  uint64_t v354 = 0;
  uint64_t v355 = &v354;
  uint64_t v356 = 0x2020000000;
  uint64_t v357 = 0;
  if (!(v322 | v332) || (v43 & 1) != 0 || (v103 & 1) != 0)
  {
    uint64_t v121 = [v324 threads];
    v339[0] = MEMORY[0x1E4F143A8];
    v339[1] = 3221225472;
    v339[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_3;
    v339[3] = &unk_1E63F79B8;
    v339[4] = a1;
    v339[5] = &v354;
    [v121 enumerateKeysAndObjectsUsingBlock:v339];

    uint64_t v323 = 0;
    goto LABEL_190;
  }
  if (!v332)
  {
    long long v122 = [v324 threads];
    uint64_t v123 = [v122 count];

    uint64_t v120 = v123 - 1;
LABEL_170:
    uint64_t v323 = v120;
    goto LABEL_190;
  }
  id v113 = [v324 threads];
  uint64_t v323 = [v113 count];

  if (v322)
  {
    long long v353 = 0u;
    long long v352 = 0u;
    long long v351 = 0u;
    long long v350 = 0u;
    uint64_t v114 = [(id)v322 threadStates];
    uint64_t v115 = [v114 countByEnumeratingWithState:&v350 objects:v446 count:16];
    if (v115)
    {
      uint64_t v116 = *(void *)v351;
      while (2)
      {
        for (uint64_t i = 0; i != v115; ++i)
        {
          if (*(void *)v351 != v116) {
            objc_enumerationMutation(v114);
          }
          uint64_t v118 = [*(id *)(*((void *)&v350 + 1) + 8 * i) dispatchQueue];
          BOOL v119 = v118 == (void *)v332;

          if (!v119)
          {

            goto LABEL_190;
          }
        }
        uint64_t v115 = [v114 countByEnumeratingWithState:&v350 objects:v446 count:16];
        if (v115) {
          continue;
        }
        break;
      }
    }

    uint64_t v120 = v323 - 1;
    goto LABEL_170;
  }
  id v124 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v125 = *(void **)(a1 + 32);
  id v126 = *(void **)(a1 + 40);
  unint64_t v127 = *(void *)(a1 + 48);
  unint64_t v128 = *(void *)(a1 + 56);
  v348[0] = MEMORY[0x1E4F143A8];
  v348[1] = 3221225472;
  v348[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1374;
  v348[3] = &unk_1E63F9650;
  id v129 = v124;
  id v349 = v129;
  -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:](v332, v125, v127, v126, v128, 0, v348);
  long long v347 = 0u;
  long long v346 = 0u;
  long long v345 = 0u;
  long long v344 = 0u;
  id v130 = v129;
  uint64_t v131 = [v130 countByEnumeratingWithState:&v344 objects:v445 count:16];
  if (v131)
  {
    uint64_t v132 = *(void *)v345;
    do
    {
      for (uint64_t j = 0; j != v131; ++j)
      {
        if (*(void *)v345 != v132) {
          objc_enumerationMutation(v130);
        }
        uint64_t v134 = *(void *)(*((void *)&v344 + 1) + 8 * j);
        int v135 = [v324 threads];
        int v136 = [v135 objectForKeyedSubscript:v134];

        long long v343 = 0u;
        long long v342 = 0u;
        long long v341 = 0u;
        long long v340 = 0u;
        uint64_t v137 = [v136 threadStates];
        uint64_t v138 = [v137 countByEnumeratingWithState:&v340 objects:v444 count:16];
        if (v138)
        {
          uint64_t v139 = *(void *)v341;
          while (2)
          {
            for (uint64_t k = 0; k != v138; ++k)
            {
              if (*(void *)v341 != v139) {
                objc_enumerationMutation(v137);
              }
              char v141 = [*(id *)(*((void *)&v340 + 1) + 8 * k) dispatchQueue];
              BOOL v142 = v141 == (void *)v332;

              if (!v142)
              {

                goto LABEL_187;
              }
            }
            uint64_t v138 = [v137 countByEnumeratingWithState:&v340 objects:v444 count:16];
            if (v138) {
              continue;
            }
            break;
          }
        }

        --v323;
LABEL_187:
      }
      uint64_t v131 = [v130 countByEnumeratingWithState:&v344 objects:v445 count:16];
    }
    while (v131);
  }

LABEL_190:
  id v311 = -[SASamplePrinter architectureStringForTask:](a1, v324);
  if (v319)
  {
    id v143 = [NSString alloc];
    uint64_t v144 = -[SASamplePrinter displayNameForTask:]((void *)a1, v324);
    id v310 = (void *)[v143 initWithFormat:@"%@ %@", v144, v319];
  }
  else
  {
    id v310 = -[SASamplePrinter displayNameForTask:]((void *)a1, v324);
  }
  if ([v324 pid])
  {
    uint64_t v145 = [v324 sharedCache];
    uint64_t v146 = v145;
    if (v145)
    {
      id v147 = v145;
    }
    else
    {
      id v147 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v309 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v147, 0);
  }
  else
  {
    uint64_t v309 = 0;
  }
  if ([v324 resourceCoalitionID])
  {
    uint64_t v148 = -[SASamplePrinter displayStringForResourceCoalition:](v324);
    uint64_t v442 = v148;
    uint64_t v149 = [NSNumber numberWithUnsignedInteger:v423[3]];
    double v443 = v149;
    v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v443 forKeys:&v442 count:1];
  }
  else
  {
    v308 = 0;
  }
  if ([*(id *)(a1 + 160) dataStyle] == 1 || !objc_msgSend(*(id *)(a1 + 160), "dataStyle"))
  {
    if ([*(id *)(a1 + 160) dataSource] == 8)
    {
      BOOL v286 = 0;
      goto LABEL_209;
    }
    BOOL v150 = [*(id *)(a1 + 160) dataSource] != 0;
  }
  else
  {
    BOOL v150 = 1;
  }
  BOOL v286 = v150;
LABEL_209:
  uint64_t v338 = 0;
  -[SASamplePrinter numIOsForTask:ioSize:](a1, v324, &v338);
  if ((obj & v328) == 1)
  {
    *(void *)double v436 = 0;
    double v437 = v436;
    uint64_t v438 = 0x3032000000;
    v439 = __Block_byref_object_copy__4;
    double v440 = __Block_byref_object_dispose__4;
    id v441 = 0;
    long long v151 = *(void **)(a1 + 32);
    long long v152 = *(void **)(a1 + 40);
    unint64_t v153 = *(void *)(a1 + 48);
    unint64_t v154 = *(void *)(a1 + 56);
    v337[0] = MEMORY[0x1E4F143A8];
    v337[1] = 3221225472;
    v337[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_5;
    v337[3] = &unk_1E63F96A0;
    v337[4] = a1;
    v337[5] = v436;
    -[SATask enumerateThreadStatesForThread:dispatchQueue:betweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]((uint64_t)v324, (void *)v322, (void *)v332, v151, v153, v152, v154, 0, v337);
    long long v155 = (_DWORD *)*((void *)v437 + 5);
    if (v155 && v155[2])
    {
      int v307 = -[SAOnBehalfOfMultiple displayString](v155);
    }
    else
    {
      int v307 = 0;
    }
    _Block_object_dispose(v436, 8);
  }
  else
  {
    uint64_t v435 = v324;
    long long v156 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v435 count:1];
    int v307 = -[SASamplePrinter displayStringForOnBehalfOfForTasks:includePid:](a1, v156);
  }
  long long v335 = 0u;
  long long v336 = 0u;
  long long v333 = 0u;
  long long v334 = 0u;
  long long v157 = [v324 threads];
  long long v158 = 0;
  long long v159 = 0;
  uint64_t v160 = [v157 countByEnumeratingWithState:&v333 objects:v434 count:16];
  if (v160)
  {
    uint64_t v329 = *(void *)v334;
    id obja = v157;
    do
    {
      uint64_t v161 = 0;
      do
      {
        if (*(void *)v334 != v329) {
          objc_enumerationMutation(obja);
        }
        char v162 = [*(id *)(a1 + 144) objectForKeyedSubscript:*(void *)(*((void *)&v333 + 1) + 8 * v161)];
        id v163 = v162;
        if (v162)
        {
          id v164 = [v162 threadState];
          uint64_t v165 = [v164 startTimestamp];
          if ([v165 gt:*(void *)(a1 + 40)])
          {

LABEL_224:
            goto LABEL_226;
          }
          uint64_t v166 = [v163 threadState];
          id v167 = [v166 endTimestamp];
          char v168 = [v167 lt:*(void *)(a1 + 32)];

          if ((v168 & 1) == 0)
          {
            if ([v163 isPartOfADeadlock])
            {
              char v169 = [v163 thread];
              long long v170 = [v163 threadState];
              id v164 = -[SASamplePrinter displayNameForTask:thread:threadState:]((void *)a1, 0, v169, v170);

              if (v158) {
                [v158 addObject:v164];
              }
              else {
                long long v158 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v164, 0);
              }
              goto LABEL_224;
            }
            if ([v163 isBlockedByADeadlock])
            {
              long long v171 = [v163 thread];
              long long v172 = [v163 threadState];
              id v164 = -[SASamplePrinter displayNameForTask:thread:threadState:]((void *)a1, 0, v171, v172);

              if (v159) {
                [v159 addObject:v164];
              }
              else {
                long long v159 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v164, 0);
              }
              goto LABEL_224;
            }
          }
        }
LABEL_226:

        ++v161;
      }
      while (v160 != v161);
      long long v157 = obja;
      uint64_t v173 = [obja countByEnumeratingWithState:&v333 objects:v434 count:16];
      uint64_t v160 = v173;
    }
    while (v173);
  }
  uint64_t v318 = v159;
  uint64_t v330 = v158;

  [v158 sortUsingSelector:sel_compare_];
  [v159 sortUsingSelector:sel_compare_];
  char v285 = -[SASamplePrinter taskHasSwallowedAnExceptionNotedByHIException:](a1, v324);
  if (([*(id *)(a1 + 16) printJson] & 1) == 0) {
    [*(id *)(a1 + 8) appendString:@"\n\n"];
  }
  double v284 = *(void **)(a1 + 8);
  id objb = [v324 mainBinary];
  uint64_t v306 = [v324 mainBinaryPath];
  unsigned int v283 = [v324 uid];
  uint64_t v305 = [v324 bundleIdentifier];
  uint64_t v304 = [v324 bundleVersion];
  uint64_t v303 = [v324 bundleShortVersion];
  uint64_t v302 = [v324 bundleBuildVersion];
  uint64_t v301 = [v324 bundleProjectName];
  v300 = [v324 bundleSourceVersion];
  int v299 = [v324 bundleProductBuildVersion];
  uint64_t v282 = [v324 adamID];
  uint64_t v298 = [v324 installerVersionID];
  char v281 = [v324 developerType];
  uint64_t v297 = [v324 appType];
  unsigned __int8 v280 = [v324 isBeta];
  uint64_t v296 = [v324 cohortID];
  uint64_t v295 = [v324 vendorID];
  uint64_t v293 = [v324 distributorID];
  double v292 = [v324 codesigningID];
  uint64_t v294 = [v324 teamID];
  if (v324) {
    id Property = objc_getProperty(v324, v174, 272, 1);
  }
  else {
    id Property = 0;
  }
  id v291 = Property;
  if (v286) {
    unint64_t v287 = *(void *)(a1 + 64);
  }
  else {
    unint64_t v287 = 0;
  }
  unint64_t v278 = v371[3];
  unint64_t v279 = v375[3];
  uint64_t v276 = v431[3];
  unint64_t v277 = v423[3];
  unint64_t v274 = v415[3];
  uint64_t v275 = v427[3];
  unint64_t v272 = v407[3];
  unint64_t v273 = v411[3];
  unint64_t v176 = v363;
  unint64_t v177 = v362;
  unint64_t v178 = v361;
  unint64_t v179 = v360;
  unint64_t v180 = v359;
  unint64_t v181 = v358;
  char v271 = [v324 usesSuddenTermination];
  char v182 = [v324 allowsIdleExit];
  char v183 = [v324 isTranslocated];
  char v184 = [v324 isUnresponsive];
  [v324 timeOfLastResponse];
  double v186 = v185;
  id v187 = [v324 threads];
  uint64_t v188 = [v187 count];
  -[SASamplePrinter addTaskHeaderToStream:displayName:pid:mainBinary:mainBinaryPath:sharedCaches:uid:bundleIdentifier:bundleVersion:bundleShortVersion:bundleBuildVersion:bundleProjectName:bundleSourceVersion:bundleProductBuildVersion:adamID:installerVersionID:developerType:appType:isBeta:cohortID:vendorID:distributorID:codesigningID:teamID:resourceCoalitionSampleCounts:onBehalfOfProcesses:architectureString:kernelVersion:parentName:responsibleName:taskExecedFromName:taskExecedToName:pidStartTimestamp:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:numSamples:totalNumSamples:numSamplesSuspended:numSamplesTerminated:startingTaskSize:endingTaskSize:maxTaskSize:startSampleIndexOfMaxTaskSize:endSampleIndexOfMaxTaskSize:numPageins:cpuTimeNs:cpuInstructions:cpuCycles:nonThreadCpuTimeNs:nonThreadCpuInstructions:nonThreadCpuCycles:usesSuddenTermination:allowsIdleExit:isTranslocated:isUnresponsive:timeOfLastResponse:numThreads:numIdleWorkQueueThreads:numOtherHiddenThreads:hieSwallowedException:wqExceededConstrainedThreadLimit:wqExceededTotalThreadLimit:threadsDeadlocked:threadsBlockedByADeadlock:ioSize:numIOs:isReportHeader:](a1, v284, v310, 0xFFFFFFFFLL, objb, v306, v309, v283, v186, v305, v304, v303, v302, v301, v300, v299, v282, v298, v281,
    v297,
    v280,
    v296,
    v295,
    v293,
    v292,
    v294,
    v308,
    v307,
    v311,
    v312,
    v314,
    v313,
    v317,
    v315,
    v291,
    v321,
    v320,
    v279,
    v278,
    v277,
    v287,
    v276,
    v275,
    v290,
    v289,
    v274,
    v273,
    v272,
    v288,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v271,
    v182,
    v183,
    v184,
    v188,
    v355[3],
    v323,
    v285);

  uint64_t v52 = v423[3];
  _Block_object_dispose(&v354, 8);

  _Block_object_dispose(&v370, 8);
  _Block_object_dispose(&v374, 8);
LABEL_245:

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v386, 8);
  _Block_object_dispose(&v390, 8);
  _Block_object_dispose(&v394, 8);

  _Block_object_dispose(&v400, 8);
  _Block_object_dispose(&v406, 8);
  _Block_object_dispose(&v410, 8);
  _Block_object_dispose(&v414, 8);
  _Block_object_dispose(v418, 8);
  _Block_object_dispose(v420, 8);
  _Block_object_dispose(&v422, 8);
  _Block_object_dispose(&v426, 8);
  _Block_object_dispose(&v430, 8);

  return v52;
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke(void *a1, void *a2, void *a3, unint64_t a4)
{
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = *(void *)(v7 + 56);
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = [v10 sampleCountInSampleIndexRangeStart:v8 end:v9];
  *(void *)(*(void *)(a1[5] + 8) + 24) += v12;
  LODWORD(v9) = [v10 isSuspended];

  if (v9) {
    *(void *)(*(void *)(a1[6] + 8) + 24) += v12;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  [(SAThread *)v11 cpuTimeForThreadStateIndex:*(void **)(a1[4] + 32) inTimestampRangeStart:*(void **)(a1[4] + 40) end:&v14];

  uint64_t v13 = v15;
  *(void *)(*(void *)(a1[7] + 8) + 32) += v14;
  *(void *)(*(void *)(a1[7] + 8) + 40) += v13;
  *(void *)(*(void *)(a1[7] + 8) + 48) += v16;
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2(void *a1, void *a2)
{
  id v22 = a2;
  uint64_t v4 = [v22 sampleCountInSampleIndexRangeStart:*(void *)(a1[4] + 48) end:*(void *)(a1[4] + 56)];
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  uint64_t v7 = (id *)(v6 + 40);
  if (!v8) {
    objc_storeStrong(v7, a2);
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  unint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 24);
  id v10 = v22;
  if (v9 && (v11 = v9 >= [v22 taskSizeInBytes], id v10 = v22, v11))
  {
    uint64_t v18 = *(void *)(*(void *)(a1[7] + 8) + 24);
    BOOL v19 = v18 == [v22 taskSizeInBytes];
    uint64_t v17 = v22;
    if (!v19) {
      goto LABEL_12;
    }
    uint64_t v16 = a1 + 9;
    uint64_t v20 = *(void *)(*(void *)(a1[9] + 8) + 24) + 1;
    BOOL v19 = v20 == [v22 startSampleIndex];
    uint64_t v17 = v22;
    if (!v19) {
      goto LABEL_12;
    }
    unint64_t v21 = [v22 endSampleIndex];
    unint64_t v15 = *(void *)(a1[4] + 56);
    if (v21 < v15) {
      unint64_t v15 = v21;
    }
  }
  else
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = [v10 taskSizeInBytes];
    unint64_t v12 = [v22 startSampleIndex];
    unint64_t v13 = *(void *)(a1[4] + 48);
    if (v12 > v13) {
      unint64_t v13 = v12;
    }
    *(void *)(*(void *)(a1[8] + 8) + 24) = v13;
    unint64_t v14 = [v22 endSampleIndex];
    unint64_t v15 = *(void *)(a1[4] + 56);
    if (v14 < v15) {
      unint64_t v15 = v14;
    }
    uint64_t v16 = a1 + 9;
  }
  *(void *)(*(void *)(*v16 + 8) + 24) = v15;
  uint64_t v17 = v22;
LABEL_12:
  if ([v17 wqExceededTotalThreadLimit]) {
    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 1;
  }
  if ([v22 wqExceededConstrainedThreadLimit]) {
    *(unsigned char *)(*(void *)(a1[11] + 8) + 24) = 1;
  }
  *(void *)(*(void *)(a1[12] + 8) + 24) += v5;
  if ([v22 isSuspended]) {
    *(void *)(*(void *)(a1[13] + 8) + 24) += v5;
  }
  if (([v22 isTerminatedSnapshot] & 1) != 0 || objc_msgSend(v22, "transitionIsTerminated")) {
    *(void *)(*(void *)(a1[14] + 8) + 24) += v5;
  }
LABEL_21:
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1366(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[4];
  uint64_t v7 = v5[5];
  uint64_t v8 = v5[6];
  uint64_t v9 = v5[7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1367;
  v11[3] = &unk_1E63F95D8;
  char v17 = *(unsigned char *)(a1 + 72);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v4;
  uint64_t v15 = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 56);
  id v10 = v4;
  [v10 enumerateThreadStatesBetweenStartTime:v6 startSampleIndex:v8 endTime:v7 endSampleIndex:v9 reverseOrder:0 block:v11];
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1367(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v10 = v3;
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v6)
    {
      if (!v5 || v5 == *(void *)(a1 + 48))
      {
        uint64_t v7 = [v3 dispatchQueue];

        id v4 = v10;
        if (v6 == v7) {
          goto LABEL_11;
        }
      }
    }
    else if (v5 && v5 == *(void *)(a1 + 48))
    {
      goto LABEL_11;
    }
  }
  uint64_t v8 = [v4 sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 56) + 48) end:*(void *)(*(void *)(a1 + 56) + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v8;
  int v9 = [v10 isSuspended];
  id v4 = v10;
  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v8;
  }
LABEL_11:
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1370(uint64_t a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  id v4 = [v19 threadStates];
  uint64_t v5 = [v4 count];

  uint64_t v6 = v19;
  if (v5)
  {
    uint64_t v7 = [v19 threadStates];
    uint64_t v8 = [v7 firstObject];

    unint64_t v9 = [v8 startSampleIndex];
    id v10 = [v19 threadStates];
    BOOL v11 = [v10 lastObject];

    unint64_t v12 = [v11 endSampleIndex];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v14 = *(void *)(v13 + 24);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 > v9) {
        *(void *)(v13 + 24) = v9;
      }
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v17 = *(void *)(v16 + 24);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL || v17 < v12) {
      *(void *)(v16 + 24) = v12;
    }

    uint64_t v6 = v19;
  }
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_1373(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 taskSizeInBytes])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 taskSizeInBytes];
    *a4 = 1;
  }
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_2_1374(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v5 = [a2 thread];
  id v4 = objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v5, "threadId"));
  [v2 addObject:v4];
}

uint64_t __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[4];
  uint64_t v6 = v4[5];
  uint64_t v7 = v4[6];
  uint64_t v8 = v4[7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_4;
  v10[3] = &unk_1E63F9678;
  v10[4] = *(void *)(a1 + 40);
  return [a3 enumerateThreadStatesBetweenStartTime:v5 startSampleIndex:v7 endTime:v6 endSampleIndex:v8 reverseOrder:0 block:v10];
}

uint64_t __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isIdleWorkQueue];
  if (result)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *a4 = 1;
  }
  return result;
}

void __103__SASamplePrinter_printTaskHeaderForTask_specialDispatchQueueId_specialThreadId_omitSpecial_omitOther___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  uint64_t v4 = [v17 originPid];
  uint64_t v5 = [v17 proximatePid];
  uint64_t v6 = v5;
  if (v4 != -1 || v5 != -1)
  {
    uint64_t v7 = *(id **)(a1 + 32);
    uint64_t v8 = [v17 endTimestamp];
    unint64_t v9 = -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v7, v4, v8);

    id v10 = *(id **)(a1 + 32);
    BOOL v11 = [v17 endTimestamp];
    unint64_t v12 = -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v10, v6, v11);

    uint64_t v13 = *(_DWORD **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v13)
    {
      unint64_t v14 = objc_alloc_init(SAOnBehalfOfMultiple);
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v13 = *(_DWORD **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    -[SAOnBehalfOfMultiple addProximateName:proximatePid:originName:originPid:count:](v13, v12, v6, v9, v4, 1);
  }
}

- (__CFString)displayNameForPid:(id *)a1 aroundTimestamp:(uint64_t)a2 includePid:(void *)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [a1[20] tasksByPid];
    unint64_t v7 = 0x1E4F28000uLL;
    uint64_t v8 = [NSNumber numberWithInt:a2];
    unint64_t v9 = [v6 objectForKeyedSubscript:v8];

    if (v5)
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v74 objects:v80 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        unsigned int v72 = a2;
        char v73 = v9;
        uint64_t v13 = 0;
        id v14 = 0;
        uint64_t v15 = *(void *)v75;
LABEL_5:
        uint64_t v16 = 0;
        id v17 = v13;
        id v18 = v14;
        while (1)
        {
          if (*(void *)v75 != v15) {
            objc_enumerationMutation(v10);
          }
          id v19 = *(void **)(*((void *)&v74 + 1) + 8 * v16);
          uint64_t v13 = [v19 endTimestamp];
          if (([v13 ge:v5] & 1) == 0) {
            break;
          }
          id v14 = v19;

          ++v16;
          id v17 = v13;
          id v18 = v14;
          if (v12 == v16)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v74 objects:v80 count:16];
            if (v12) {
              goto LABEL_5;
            }
            goto LABEL_27;
          }
        }
        if (!v18)
        {
          id v18 = v19;
          goto LABEL_26;
        }
        uint64_t v20 = [v19 startTimestamp];
        if ([v20 le:v5]) {
          goto LABEL_14;
        }
        if (v17)
        {
          [v17 machContTimeSeconds];
          if (v30 == 0.0 || ([v5 machContTimeSeconds], v31 == 0.0))
          {
            [v17 machAbsTimeSeconds];
            if (v35 == 0.0 || ([v5 machAbsTimeSeconds], v36 == 0.0))
            {
              [v17 wallTime];
              if (v38 == 0.0) {
                goto LABEL_60;
              }
              [v5 wallTime];
              if (v39 == 0.0) {
                goto LABEL_60;
              }
              [v17 wallTime];
              double v33 = v40;
              [v5 wallTime];
            }
            else
            {
              [v17 machAbsTimeSeconds];
              double v33 = v37;
              [v5 machAbsTimeSeconds];
            }
          }
          else
          {
            [v17 machContTimeSeconds];
            double v33 = v32;
            [v5 machContTimeSeconds];
          }
          double v41 = v33 - v34;
          if (v41 >= 0.0) {
            double v42 = v41;
          }
          else {
            double v42 = -v41;
          }
          if (v42 != 0.0)
          {
            [v20 machContTimeSeconds];
            if (v43 == 0.0 || ([v5 machContTimeSeconds], v44 == 0.0))
            {
              [v20 machAbsTimeSeconds];
              if (v48 == 0.0 || ([v5 machAbsTimeSeconds], v49 == 0.0))
              {
                [v20 wallTime];
                if (v51 == 0.0) {
                  goto LABEL_60;
                }
                [v5 wallTime];
                if (v52 == 0.0) {
                  goto LABEL_60;
                }
                [v20 wallTime];
                double v46 = v53;
                [v5 wallTime];
              }
              else
              {
                [v20 machAbsTimeSeconds];
                double v46 = v50;
                [v5 machAbsTimeSeconds];
              }
            }
            else
            {
              [v20 machContTimeSeconds];
              double v46 = v45;
              [v5 machContTimeSeconds];
            }
            double v54 = v46 - v47;
            if (v54 < 0.0) {
              double v54 = -v54;
            }
            if (v54 != 0.0)
            {
              if (v42 < v54) {
                goto LABEL_15;
              }
              goto LABEL_14;
            }
          }
LABEL_60:
          if ([v17 machContTime] && objc_msgSend(v5, "machContTime"))
          {
            uint64_t v55 = [v17 machContTime];
            uint64_t v56 = [v5 machContTime];
          }
          else
          {
            if (![v17 machAbsTime] || !objc_msgSend(v5, "machAbsTime")) {
              goto LABEL_14;
            }
            uint64_t v55 = [v17 machAbsTime];
            uint64_t v56 = [v5 machAbsTime];
          }
          if (v55 - v56 >= 0) {
            unint64_t v57 = v55 - v56;
          }
          else {
            unint64_t v57 = v56 - v55;
          }
          if (v55 != v56)
          {
            if ([v20 machContTime] && objc_msgSend(v5, "machContTime"))
            {
              uint64_t v58 = [v20 machContTime];
              uint64_t v59 = [v5 machContTime];
              goto LABEL_76;
            }
            if ([v20 machAbsTime] && objc_msgSend(v5, "machAbsTime"))
            {
              uint64_t v58 = [v20 machAbsTime];
              uint64_t v59 = [v5 machAbsTime];
LABEL_76:
              if (v58 - v59 >= 0) {
                unint64_t v60 = v58 - v59;
              }
              else {
                unint64_t v60 = v59 - v58;
              }
              if (v58 != v59 && v57 < v60) {
                goto LABEL_15;
              }
            }
          }
LABEL_14:
          id v21 = v19;

          id v18 = v21;
LABEL_15:

LABEL_26:
          uint64_t v13 = v17;
          id v14 = v18;
LABEL_27:

          unint64_t v9 = v73;
          a2 = v72;
          unint64_t v7 = 0x1E4F28000;
          goto LABEL_28;
        }
        int v61 = *__error();
        unint64_t v62 = _sa_logt();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          id v63 = [v10 debugDescription];
          uint64_t v64 = [v63 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          uint64_t v79 = v64;
          _os_log_error_impl(&dword_1BF22B000, v62, OS_LOG_TYPE_ERROR, "no earlierTaskEndTimestamp in %s", buf, 0xCu);
        }
        *__error() = v61;
        id v5 = [v10 debugDescription];
        char v65 = [v5 UTF8String];
        _SASetCrashLogMessage(12816, "no earlierTaskEndTimestamp in %s", v66, v67, v68, v69, v70, v71, v65);

        _os_crash();
        __break(1u);
        goto LABEL_87;
      }
      id v14 = 0;
LABEL_28:

      if (v14) {
        goto LABEL_29;
      }
    }
    else
    {
      id v14 = [v9 lastObject];
      if (v14)
      {
LABEL_29:
        -[SASamplePrinter displayNameForTask:includePid:](a1, v14, 0);
        uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
    }
    id Property = a1[20];
    if (Property) {
      id Property = objc_getProperty(Property, v22, 976, 1);
    }
    id v24 = Property;
    uint64_t v25 = [*(id *)(v7 + 3792) numberWithInt:a2];
    uint64_t v26 = [v24 objectForKeyedSubscript:v25];

    if (!v26)
    {
      uint64_t v27 = @"UNKNOWN";
      if (!a2) {
        uint64_t v27 = @"kernel_task";
      }
      uint64_t v26 = v27;
    }
    uint64_t v28 = v26;

    goto LABEL_30;
  }
LABEL_87:
  uint64_t v28 = 0;
LABEL_31:

  return v28;
}

uint64_t __1143__SASamplePrinter_addTaskHeaderToStream_displayName_pid_mainBinary_mainBinaryPath_sharedCaches_uid_bundleIdentifier_bundleVersion_bundleShortVersion_bundleBuildVersion_bundleProjectName_bundleSourceVersion_bundleProductBuildVersion_adamID_installerVersionID_developerType_appType_isBeta_cohortID_vendorID_distributorID_codesigningID_teamID_resourceCoalitionSampleCounts_onBehalfOfProcesses_architectureString_kernelVersion_parentName_responsibleName_taskExecedFromName_taskExecedToName_pidStartTimestamp_startTimestamp_endTimestamp_startSampleIndex_endSampleIndex_numSamples_totalNumSamples_numSamplesSuspended_numSamplesTerminated_startingTaskSize_endingTaskSize_maxTaskSize_startSampleIndexOfMaxTaskSize_endSampleIndexOfMaxTaskSize_numPageins_cpuTimeNs_cpuInstructions_cpuCycles_nonThreadCpuTimeNs_nonThreadCpuInstructions_nonThreadCpuCycles_usesSuddenTermination_allowsIdleExit_isTranslocated_isUnresponsive_timeOfLastResponse_numThreads_numIdleWorkQueueThreads_numOtherHiddenThreads_hieSwallowedException_wqExceededConstrainedThreadLimit_wqExceededTotalThreadLimit_threadsDeadlocked_threadsBlockedByADeadlock_ioSize_numIOs_isReportHeader___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 objectForKeyedSubscript:a3];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (__CFString)timeIndexDescriptionForStartSampleIndex:(unint64_t)a3 endSampleIndex:(unsigned int)a4 formattedToLength:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = &stru_1F1A80538;
    goto LABEL_76;
  }
  if (a2 != 0x7FFFFFFFFFFFFFFFLL && a2 > a3)
  {
    int v40 = *__error();
    double v41 = _sa_logt();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v53 = a2;
      __int16 v54 = 2048;
      unint64_t v55 = a3;
      _os_log_error_impl(&dword_1BF22B000, v41, OS_LOG_TYPE_ERROR, "startSampleIndex %lu > endSampleIndex %lu", buf, 0x16u);
    }

    *__error() = v40;
    _SASetCrashLogMessage(12602, "startSampleIndex %lu > endSampleIndex %lu", v42, v43, v44, v45, v46, v47, a2);
    _os_crash();
    __break(1u);
  }
  unint64_t v8 = *(void *)(a1 + 56);
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 <= a3) {
      goto LABEL_7;
    }
  }
  else if (v8 < a2)
  {
LABEL_7:
    if (!a4)
    {
      id v9 = [NSString alloc];
      uint64_t v10 = *(void *)(a1 + 56);
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v11 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v12 = v10 + 1;
        if (v11) {
          v12 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v48 = v12;
      id v24 = @"after time index %lu";
LABEL_38:
      uint64_t v25 = v9;
LABEL_75:
      uint64_t v4 = (__CFString *)objc_msgSend(v25, "initWithFormat:", v24, v48, v49, v50, v51);
      goto LABEL_76;
    }
    goto LABEL_33;
  }
  if (*(void *)(a1 + 48) > a3)
  {
    if (!a4)
    {
      id v9 = [NSString alloc];
      uint64_t v13 = *(void *)(a1 + 48);
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v14 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v15 = v13 + 1;
        if (v14) {
          v15 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v48 = v15;
      id v24 = @"before time index %lu";
      goto LABEL_38;
    }
LABEL_33:
    uint64_t v4 = @"No samples";
    goto LABEL_76;
  }
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      if (a4 >> 1 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = a4 >> 1;
      }
      BOOL v18 = (a4 & 1) == 0 && v16 > 1;
      uint64_t v19 = (v16 - v18);
      id v20 = [NSString alloc];
      BOOL v21 = -[SASamplePrinter hasTimeIndexes](a1);
      if (a2 == a3)
      {
        if (v21)
        {
          int v22 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v23 = a3 + 1;
          if (v22) {
            v23 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v50 = v16;
        uint64_t v51 = v23;
        uint64_t v48 = v19;
        double v49 = "";
        id v24 = @"%*s %-*lu";
      }
      else
      {
        if (v21)
        {
          uint64_t v31 = a2 + 1;
          if ([*(id *)(a1 + 16) forceOneBasedTimeIndexes]) {
            v31 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          int v35 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v36 = a3 + 1;
          if (v35) {
            v36 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v50 = v16;
        uint64_t v51 = v36;
        uint64_t v48 = v19;
        double v49 = (const char *)v31;
        id v24 = @"%*lu-%-*lu";
      }
    }
    else
    {
      id v20 = [NSString alloc];
      BOOL v26 = -[SASamplePrinter hasTimeIndexes](a1);
      if (a2 == a3)
      {
        if (v26)
        {
          int v27 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v28 = a3 + 1;
          if (v27) {
            v28 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v48 = v28;
        id v24 = @"at time index %lu";
      }
      else
      {
        if (v26)
        {
          uint64_t v32 = a2 + 1;
          if ([*(id *)(a1 + 16) forceOneBasedTimeIndexes]) {
            v32 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          int v37 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v38 = a3 + 1;
          if (v37) {
            v38 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v48 = v32;
        double v49 = (const char *)v38;
        id v24 = @"at time indexes %lu-%lu";
      }
    }
    uint64_t v25 = v20;
    goto LABEL_75;
  }
  if (a4) {
    goto LABEL_33;
  }
  id v29 = [NSString alloc];
  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    uint64_t v30 = a3 + 1;
    if ([*(id *)(a1 + 16) forceOneBasedTimeIndexes]) {
      v30 -= *(void *)(a1 + 48);
    }
  }
  else
  {
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (-[SASamplePrinter hasTimeIndexes](a1))
  {
    int v33 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
    uint64_t v34 = a3 + 2;
    if (v33) {
      v34 -= *(void *)(a1 + 48);
    }
  }
  else
  {
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v4 = (__CFString *)objc_msgSend(v29, "initWithFormat:", @"between time indexes %lu and %lu", v30, v34, v50, v51);
LABEL_76:
  return v4;
}

- (__CFString)timeIndexDescriptionForTimestamp:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!-[SASamplePrinter hasTimeIndexes](a1))
  {
    uint64_t v13 = &stru_1F1A80538;
    goto LABEL_46;
  }
  if ([v3 lt:*(void *)(a1 + 32)])
  {
    [*(id *)(a1 + 32) machAbsTimeSeconds];
    double v5 = v4;
    [v3 machAbsTimeSeconds];
    double v7 = v5 - v6;
    id v8 = [NSString alloc];
    uint64_t v9 = *(void *)(a1 + 48);
    BOOL v10 = -[SASamplePrinter hasTimeIndexes](a1);
    if (v7 >= 0.1)
    {
      if (v10)
      {
        int v22 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v23 = v9 + 1;
        if (v22) {
          v23 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v49 = v23;
      double v48 = v7;
      uint64_t v30 = @"%.1fs before time index %lu";
    }
    else
    {
      if (v10)
      {
        int v11 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v12 = v9 + 1;
        if (v11) {
          v12 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      double v48 = *(double *)&v12;
      uint64_t v30 = @"<0.1s before time index %lu";
    }
  }
  else
  {
    if (![v3 gt:*(void *)(a1 + 40)])
    {
      unint64_t v24 = [*(id *)(a1 + 160) indexOfLastSampleOnOrBeforeTimestamp:v3];
      unint64_t v25 = [*(id *)(a1 + 160) indexOfFirstSampleOnOrAfterTimestamp:v3];
      if (v24 > v25)
      {
        int v38 = *__error();
        double v39 = _sa_logt();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v40 = [v3 debugDescription];
          *(_DWORD *)long long buf = 134218498;
          unint64_t v51 = v24;
          __int16 v52 = 2048;
          unint64_t v53 = v25;
          __int16 v54 = 2080;
          uint64_t v55 = [v40 UTF8String];
          _os_log_error_impl(&dword_1BF22B000, v39, OS_LOG_TYPE_ERROR, "indexBefore %lu > indexAfter %lu for %s", buf, 0x20u);
        }
        *__error() = v38;
        id v41 = [v3 debugDescription];
        [v41 UTF8String];
        _SASetCrashLogMessage(12741, "indexBefore %lu > indexAfter %lu for %s", v42, v43, v44, v45, v46, v47, v24);

        _os_crash();
        __break(1u);
      }
      id v26 = [NSString alloc];
      BOOL v27 = -[SASamplePrinter hasTimeIndexes](a1);
      if (v25 == v24)
      {
        if (v27)
        {
          int v28 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v29 = v24 + 1;
          if (v28) {
            v29 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
        }
        double v48 = *(double *)&v29;
        uint64_t v30 = @"at time index %lu";
      }
      else
      {
        if (v27)
        {
          uint64_t v33 = v24 + 1;
          if ([*(id *)(a1 + 16) forceOneBasedTimeIndexes]) {
            v33 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          int v35 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v36 = v25 + 1;
          if (v35) {
            v36 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        double v48 = *(double *)&v33;
        uint64_t v49 = v36;
        uint64_t v30 = @"between time indexes %lu and %lu";
      }
      uint64_t v34 = v26;
      goto LABEL_45;
    }
    [v3 machAbsTimeSeconds];
    double v15 = v14;
    [*(id *)(a1 + 40) machAbsTimeSeconds];
    double v17 = v15 - v16;
    id v8 = [NSString alloc];
    uint64_t v18 = *(void *)(a1 + 56);
    BOOL v19 = -[SASamplePrinter hasTimeIndexes](a1);
    if (v17 >= 0.1)
    {
      if (v19)
      {
        int v31 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v32 = v18 + 1;
        if (v31) {
          v32 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v49 = v32;
      double v48 = v17;
      uint64_t v30 = @"%.1fs after time index %lu";
    }
    else
    {
      if (v19)
      {
        int v20 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v21 = v18 + 1;
        if (v20) {
          v21 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      double v48 = *(double *)&v21;
      uint64_t v30 = @"<0.1s after time index %lu";
    }
  }
  uint64_t v34 = v8;
LABEL_45:
  uint64_t v13 = (__CFString *)objc_msgSend(v34, "initWithFormat:", v30, *(void *)&v48, v49);
LABEL_46:

  return v13;
}

- (SABinaryLoadInfoToDisplay)displayedBinaryLoadInfoForBinary:(void *)a1 segment:(void *)a2 desiredLoadAddress:(uint64_t)a3 offsetIntoLoadInfo:(unint64_t)a4 isInKernelAddressSpace:(BOOL)a5 exclave:(void *)a6 binariesToDisplay:(void *)a7 extraBinariesToDisplay:(void *)a8
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v12 = a1;
  id v13 = a2;
  obuint64_t j = a6;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = v15;
  id v18 = v16;
  if (v17 == v16)
  {

    id v18 = 0;
  }
  BOOL v19 = [v17 objectForKeyedSubscript:v12];
  id v68 = v18;
  id v69 = v12;
  int v20 = [v18 objectForKeyedSubscript:v12];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v75;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v75 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        id v27 = [v26 segment];
        if (v27 == v13)
        {
          id v28 = [v26 exclave];

          if (v28 == v14)
          {
            uint64_t v29 = v26;
            char v66 = 1;
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v74 objects:v80 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
  uint64_t v29 = 0;
  char v66 = 0;
LABEL_15:

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v30 = v20;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (!v31)
  {
    char v38 = 0;
    double v39 = v69;
LABEL_32:
    id v40 = v68;

    if (!v29)
    {
      uint64_t v29 = [SABinaryLoadInfoToDisplay alloc];
      id v41 = v14;
      if (v29)
      {
        *(void *)uint64_t v78 = v29;
        *(void *)&v78[8] = SABinaryLoadInfoToDisplay;
        uint64_t v42 = (SABinaryLoadInfoToDisplay *)objc_msgSendSuper2((objc_super *)v78, sel_initWithBinary_segment_loadAddress_, v69, v13, a3);
        uint64_t v29 = v42;
        if (v42)
        {
          v42->_isInKernelAddressSpace = a5;
          objc_storeStrong((id *)&v42->_exclave, obj);
        }
      }

      id v40 = v68;
      double v39 = v69;
    }
    goto LABEL_37;
  }
  uint64_t v32 = v31;
  char v65 = v17;
  uint64_t v33 = *(void *)v71;
LABEL_17:
  uint64_t v34 = 0;
  while (1)
  {
    if (*(void *)v71 != v33) {
      objc_enumerationMutation(v30);
    }
    int v35 = *(SABinaryLoadInfoToDisplay **)(*((void *)&v70 + 1) + 8 * v34);
    id v36 = [(SABinaryLoadInfo *)v35 segment];
    if (v36 == v13) {
      break;
    }

LABEL_23:
    if (v32 == ++v34)
    {
      uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v32) {
        goto LABEL_17;
      }
      char v38 = 0;
      goto LABEL_31;
    }
  }
  id v37 = [(SABinaryLoadInfoToDisplay *)v35 exclave];

  if (v37 != v14) {
    goto LABEL_23;
  }
  if (!v29)
  {
    uint64_t v29 = v35;
    char v38 = 1;
LABEL_31:
    double v39 = v69;
    id v17 = v65;
    goto LABEL_32;
  }
  id v40 = v68;
  double v39 = v69;
  id v17 = v65;
  if (v29 != v35)
  {
    int v47 = *__error();
    double v48 = _sa_logt();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = [(SABinaryLoadInfoToDisplay *)v29 debugDescription];
      uint64_t v50 = [v49 UTF8String];
      id v51 = [(SABinaryLoadInfoToDisplay *)v35 debugDescription];
      uint64_t v52 = [v51 UTF8String];
      *(_DWORD *)uint64_t v78 = 136315394;
      *(void *)&v78[4] = v50;
      *(_WORD *)&v78[12] = 2080;
      *(void *)&v78[14] = v52;
      _os_log_error_impl(&dword_1BF22B000, v48, OS_LOG_TYPE_ERROR, "mismatch between binaries and extra binaries: %s vs %s", v78, 0x16u);
    }
    *__error() = v47;
    id v53 = [(SABinaryLoadInfoToDisplay *)v29 debugDescription];
    char v54 = [v53 UTF8String];
    id v55 = [(SABinaryLoadInfoToDisplay *)v35 debugDescription];
    [v55 UTF8String];
    _SASetCrashLogMessage(7399, "mismatch between binaries and extra binaries: %s vs %s", v56, v57, v58, v59, v60, v61, v54);

    _os_crash();
    __break(1u);
  }

  char v38 = 1;
LABEL_37:
  if ([(SABinaryLoadInfoToDisplay *)v29 highestOffset] < a4) {
    -[SABinaryLoadInfoToDisplay setHighestOffset:](v29, "setHighestOffset:");
  }
  if ((v66 & 1) == 0)
  {
    if (v21)
    {
      [v21 addObject:v29];
    }
    else
    {
      uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v29, 0);
      [v17 setObject:v43 forKeyedSubscript:v39];
    }
  }
  if (v40) {
    char v44 = v38;
  }
  else {
    char v44 = 1;
  }
  if ((v44 & 1) == 0)
  {
    if (v30)
    {
      [v30 addObject:v29];
    }
    else
    {
      uint64_t v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v29, 0);
      [v40 setObject:v45 forKeyedSubscript:v39];
    }
  }

  return v29;
}

void __50__SASamplePrinter_sortedLoadInfosForBinaryImages___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] == 1)
  {
    double v5 = [v4 firstObject];
    if (([*(id *)(*(void *)(a1 + 32) + 16) displayAllBinaries] & 1) == 0)
    {
      uint64_t v6 = [v5 segment];
      if (v6)
      {
        double v7 = (void *)v6;
        id v8 = [v5 segment];
        if ([v8 hasOffsetIntoBinary])
        {
          uint64_t v9 = [v5 segment];
          uint64_t v10 = [v9 offsetIntoBinary];

          if (!v10)
          {
            uint64_t v11 = 1;
LABEL_17:
            [v5 setIsZerothAndOnlySegment:v11];
            [*(id *)(a1 + 40) addObject:v5];

            goto LABEL_18;
          }
        }
        else
        {
        }
      }
    }
    uint64_t v11 = 0;
    goto LABEL_17;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "setIsZerothAndOnlySegment:", 0, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v12];
LABEL_18:
}

uint64_t __50__SASamplePrinter_sortedLoadInfosForBinaryImages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if ([v4 isInKernelAddressSpace]
    && ![v5 isInKernelAddressSpace])
  {
    goto LABEL_10;
  }
  if ([v4 isInKernelAddressSpace] & 1) == 0 && (objc_msgSend(v5, "isInKernelAddressSpace")) {
    goto LABEL_12;
  }
  unint64_t v6 = [v4 loadAddress];
  unint64_t v7 = [v5 loadAddress];
  if (v6)
  {
    if (v7 - 1 >= v6)
    {
LABEL_12:
      uint64_t v8 = -1;
      goto LABEL_13;
    }
    if (v6 > v7) {
      goto LABEL_10;
    }
  }
  else if (v7)
  {
    goto LABEL_10;
  }
  *(void *)uu1 = 0;
  uint64_t v23 = 0;
  *(void *)uu2 = 0;
  uint64_t v21 = 0;
  uint64_t v9 = [v4 binary];
  uint64_t v10 = [v9 uuid];
  [v10 getUUIDBytes:uu1];

  uint64_t v11 = [v5 binary];
  id v12 = [v11 uuid];
  [v12 getUUIDBytes:uu2];

  int v13 = uuid_compare(uu1, uu2);
  if (v13 > 0) {
    goto LABEL_12;
  }
  if ((v13 & 0x80000000) == 0)
  {
    uint64_t v15 = [v4 segment];
    uint64_t v16 = [v15 name];

    long long v17 = [v5 segment];
    long long v18 = [v17 name];

    if (![v16 length])
    {

      uint64_t v16 = 0;
    }
    if ([v18 length])
    {
      BOOL v19 = v16 != 0;
      if (v16 && v18)
      {
        uint64_t v8 = [v16 compare:v18 options:577];
LABEL_25:

        goto LABEL_13;
      }
    }
    else
    {

      long long v18 = 0;
      BOOL v19 = v16 != 0;
    }
    if (v19) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 1;
    }
    goto LABEL_25;
  }
LABEL_10:
  uint64_t v8 = 1;
LABEL_13:

  return v8;
}

void __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 binary];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
  unint64_t v6 = [v3 segment];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "segment", (void)v13);

        if (v12 == v6)
        {

          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [v7 addObject:v3];
LABEL_13:
}

void __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_2(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_3;
  v9[3] = &unk_1E63F9760;
  id v10 = *(id *)(a1 + 40);
  id v4 = a2;
  -[SATask enumerateFrames:]((uint64_t)v4, v9);
  id v5 = [v4 mainBinaryLoadInfo];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v5 binary];
    uint64_t v8 = -[SASamplePrinter indexForBinary:](v6, (uint64_t)v7);

    if (!v8) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 24));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id WeakRetained = v5;
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

uint64_t __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v13 = 0;
  *(void *)uu2 = 0;
  uint64_t v11 = 0;
  id v4 = a3;
  id v5 = [a2 uuid];
  [v5 getUUIDBytes:uu1];

  uint64_t v6 = [v4 uuid];

  [v6 getUUIDBytes:uu2];
  int v7 = uuid_compare(uu1, uu2);
  int v8 = v7 >> 31;
  if (v7 >= 1) {
    return 1;
  }
  return v8;
}

uint64_t __52__SASamplePrinter_printSystemStatsStyleBinaryImages__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 segment];
  uint64_t v6 = [v4 segment];

  if (v5 == v6)
  {
    uint64_t v9 = 0;
  }
  else if (v5)
  {
    if (v6)
    {
      int v7 = [v5 name];
      int v8 = [v6 name];
      uint64_t v9 = [v7 compare:v8];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    if (!v7) {
      goto LABEL_14;
    }
    int v8 = *(unsigned __int8 *)(a1 + 80);
    int v9 = [v7 containsObject:v5];
    if (v8)
    {
      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (!v9
      || !-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 48), *(void **)(a1 + 56), v6, 0))
    {
LABEL_14:
      uint64_t v11 = *(void **)(a1 + 48);
      uint64_t v12 = v11[4];
      uint64_t v13 = v11[5];
      uint64_t v14 = v11[6];
      uint64_t v15 = v11[7];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2;
      v21[3] = &unk_1E63F97D0;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      id v22 = v16;
      uint64_t v23 = v17;
      id v18 = v6;
      uint64_t v19 = *(void *)(a1 + 56);
      long long v20 = *(void **)(a1 + 64);
      id v24 = v18;
      uint64_t v25 = v19;
      id v26 = v20;
      id v27 = *(id *)(a1 + 72);
      [v18 enumerateThreadStatesBetweenStartTime:v12 startSampleIndex:v14 endTime:v13 endSampleIndex:v15 reverseOrder:0 block:v21];

      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((!v7 || [v7 containsObject:v5])
    && -[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 48), *(void **)(a1 + 56), v6, 0))
  {
LABEL_12:
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v10, 0, 0, v6, 0, *(void **)(a1 + 56), *(void **)(a1 + 64), 1, 1, 1, 1, 1, *(void **)(a1 + 72), 0, 1u);
    }
  }
LABEL_15:
}

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = NSNumber;
  int v7 = [a2 dispatchQueue];
  int v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "identifier"));
  LODWORD(v5) = [v5 containsObject:v8];

  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v9 = *(void **)(a1 + 48);
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    v13[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    if (v10) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v10, 0, 0, v9, v12, *(void **)(a1 + 56), *(void **)(a1 + 64), 1, 1, 1, 1, 1, *(void **)(a1 + 72), 0, 1u);
    }
  }
}

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_1743(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 unsignedIntValue];
  unint64_t v7 = [v5 unsignedLongValue];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v8 + 24) < v7)
  {
    *(void *)(v8 + 24) = v7;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

void __110__SASamplePrinter_printSingleStackForTasks_limitToDispatchQueueIds_limitToThreadIds_intersection_sampleCount___block_invoke_2_1745(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedLongLongValue];
  unint64_t v7 = [v5 unsignedLongValue];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v8 + 24) < v7)
  {
    *(void *)(v8 + 24) = v7;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

- (id)stacksForTask:(unsigned char *)a3 taskSampleCount:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v57 = v5;
  if (a1)
  {
    uint64_t v6 = v5;
    id v7 = (id)MEMORY[0x1C18A6A20]();
    uint64_t v8 = a1[2];
    if (v8)
    {
      uint64_t v9 = v8[19];
      if (v9) {
        goto LABEL_8;
      }
      if (*((unsigned char *)v8 + 11))
      {
        do
        {
          a3 = buf;
          int v10 = *__error();
          uint64_t v6 = _sa_logt();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            id v7 = [a1[2] debugDescription];
            uint64_t v11 = [v7 UTF8String];
            *(_DWORD *)long long buf = 136315138;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_error_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_ERROR, "stacksForTask without kSAAggregateCallTreesByProcess: %s", buf, 0xCu);
          }
          *__error() = v10;
          a1 = [a1[2] debugDescription];
          char v12 = [a1 UTF8String];
          _SASetCrashLogMessage(0x2000, "stacksForTask without kSAAggregateCallTreesByProcess: %s", v13, v14, v15, v16, v17, v18, v12);

          _os_crash();
          __break(1u);
LABEL_8:
          ;
        }
        while (v9 == 3);
      }
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = a1[2];
    if (!v20 || v20[20] != 1 && (uint64_t v21 = v20[19], v21 != 3) && (v21 || !*((unsigned char *)v20 + 11)))
    {
      id v22 = v6;
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v24 = [v22 swiftTasks];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke;
      v70[3] = &unk_1E63F9B50;
      v70[4] = a1;
      id v71 = v23;
      id v25 = v23;
      [v24 enumerateKeysAndObjectsUsingBlock:v70];

      id v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_3;
      long long v73 = &unk_1E63F9B98;
      long long v74 = a1;
      id v27 = v26;
      id v75 = v27;
      id v28 = v22;
      long long v76 = v28;
      long long v77 = a3;
      [v25 enumerateKeysAndObjectsUsingBlock:buf];
      uint64_t v29 = v76;
      id v30 = v27;

      [v19 addObjectsFromArray:v30];
      long long v20 = a1[2];
      if (!v20) {
        goto LABEL_25;
      }
    }
    uint64_t v31 = v20[19];
    if (v31)
    {
      if (v31 != 1)
      {
        if (v31 == 2)
        {
          uint64_t v32 = [v6 threads];
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke;
          v67[3] = &unk_1E63F9848;
          v67[4] = a1;
          uint64_t v33 = (id *)&v68;
          id v68 = v6;
          uint64_t v34 = (id *)v69;
          v69[0] = v19;
          v69[1] = a3;
          [v32 enumerateKeysAndObjectsUsingBlock:v67];

LABEL_21:
          double v39 = [a1[2] callTreeSortAttributes];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_1793;
          v58[3] = &unk_1E63F98E8;
          id v59 = v39;
          id v40 = v39;
          [v19 sortUsingComparator:v58];
          a1 = (id *)[v19 copy];

          goto LABEL_22;
        }
LABEL_25:
        int v42 = *__error();
        uint64_t v43 = _sa_logt();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          char v44 = a1[2];
          if (v44)
          {
            uint64_t v45 = v44[19];
            if (!v45)
            {
              if (*((unsigned char *)v44 + 11)) {
                uint64_t v45 = 3;
              }
              else {
                uint64_t v45 = 1;
              }
            }
          }
          else
          {
            uint64_t v45 = 0;
          }
          id v46 = [v44 debugDescription];
          uint64_t v47 = [v46 UTF8String];
          *(_DWORD *)long long buf = 134218242;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v47;
          _os_log_error_impl(&dword_1BF22B000, v43, OS_LOG_TYPE_ERROR, "stacksForTask with not kSAAggregateCallTreesByDispatchQueue nor Thread %llu: %s", buf, 0x16u);
        }
        *__error() = v42;
        id v48 = a1[2];
        char v49 = -[SASamplePrintOptions callTreeAggregationResolved]((uint64_t)v48);
        id v50 = [v48 debugDescription];
        [v50 UTF8String];
        _SASetCrashLogMessage(8219, "stacksForTask with not kSAAggregateCallTreesByDispatchQueue nor Thread %llu: %s", v51, v52, v53, v54, v55, v56, v49);

        _os_crash();
        __break(1u);
      }
    }
    else if (*((unsigned char *)v20 + 11))
    {
      goto LABEL_25;
    }
    int v35 = [v6 dispatchQueues];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2;
    v64[3] = &unk_1E63F9870;
    v64[4] = a1;
    uint64_t v33 = (id *)&v65;
    id v36 = v6;
    char v65 = v36;
    uint64_t v34 = (id *)v66;
    id v37 = v19;
    v66[0] = v37;
    v66[1] = a3;
    [v35 enumerateKeysAndObjectsUsingBlock:v64];

    char v38 = [v36 threads];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3;
    v60[3] = &unk_1E63F9848;
    v60[4] = a1;
    uint64_t v61 = v36;
    id v62 = v37;
    id v63 = a3;
    [v38 enumerateKeysAndObjectsUsingBlock:v60];

    goto LABEL_21;
  }
LABEL_22:

  return a1;
}

- (void)printStack:(void *)a3 stream:
{
  uint64_t v251 = *MEMORY[0x1E4F143B8];
  self = a2;
  unint64_t v5 = a3;
  if (!self) {
    goto LABEL_290;
  }
  id v6 = objc_getProperty(self, (SEL)self, 56, 1);
  id v8 = objc_getProperty(self, v7, 40, 1);
  id v10 = objc_getProperty(self, v9, 48, 1);
  int v11 = *((unsigned char *)self + 11) & 1;
  id v13 = objc_getProperty(self, v12, 64, 1);
  int v209 = self[3] & 1;
  unint64_t v203 = *((void *)self + 4);
  unint64_t v204 = *((void *)self + 9);
  uint64_t v200 = *((void *)self + 10);
  id v15 = objc_getProperty(self, v14, 88, 1);
  uint64_t v214 = self[4];
  uint64_t v205 = self[5];
  uint64_t v212 = self[6];
  uint64_t v201 = self[7];
  unint64_t v215 = *((void *)self + 12);
  unint64_t v202 = *((void *)self + 13);
  LODWORD(v206) = *((unsigned char *)self + 14) & 1;
  HIDWORD(v206) = *((unsigned char *)self + 13) & 1;
  unint64_t v207 = *((void *)self + 14);
  unint64_t v208 = *((void *)self + 17);
  uint64_t v217 = *((void *)self + 18);
  for (double i = *((double *)self + 19); ; double i = 0.0)
  {
    id v17 = (id)v5;
    id v18 = v6;
    id v19 = v8;
    id v20 = v10;
    id v221 = v13;
    id v216 = v15;
    context = (void *)MEMORY[0x1C18A6A20]();
    uint64_t v225 = v17;
    id v218 = v18;
    id v219 = v19;
    id v220 = v20;
    if ([*(id *)(a1 + 16) printJson])
    {
      [v17 appendString:@"\n\n"];
      if (![v18 count] && (objc_msgSend(v19, "count") || objc_msgSend(v20, "count")))
      {
        if (![v19 count])
        {
          if (![v20 count])
          {
LABEL_170:
            if (v215)
            {
              uint64_t v121 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
              long long v122 = @"cpuTimeNs";
              if (v206) {
                long long v122 = @"cpuForcedIdleTimeNs";
              }
              if (HIDWORD(v206)) {
                uint64_t v123 = @"cpuIdleTimeNs";
              }
              else {
                uint64_t v123 = v122;
              }
              SAJSONWriteDictionaryEntry(v17, v123, v121);

              id v124 = [NSNumber numberWithUnsignedLongLong:v207];
              SAJSONWriteDictionaryEntry(v17, @"cycles", v124);

              uint64_t v125 = [NSNumber numberWithUnsignedLongLong:v202];
              SAJSONWriteDictionaryEntry(v17, @"intructions", v125);
            }
            if ((v214 & 0x80000000) == 0)
            {
              id v126 = objc_msgSend(NSNumber, "numberWithInt:");
              SAJSONWriteDictionaryEntry(v17, @"minPriority", v126);

              unint64_t v127 = [NSNumber numberWithInt:v205];
              SAJSONWriteDictionaryEntry(v17, @"maxPriority", v127);

              if ((v212 & 0x80000000) == 0)
              {
                unint64_t v128 = [NSNumber numberWithInt:v212];
                SAJSONWriteDictionaryEntry(v17, @"minBasePriority", v128);

                id v129 = [NSNumber numberWithInt:v201];
                SAJSONWriteDictionaryEntry(v17, @"maxBasePriority", v129);
              }
            }
            if (v221)
            {
              SAJSONWriteDictionaryEntry(v17, @"threadName", v221);
              if (v209) {
                SAJSONWriteDictionaryEntry(v17, @"threadNameChanges", MEMORY[0x1E4F1CC38]);
              }
            }
            if ([v19 count])
            {
              id v130 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
              long long v226 = 0u;
              long long v227 = 0u;
              long long v228 = 0u;
              long long v229 = 0u;
              id v131 = v19;
              uint64_t v132 = [v131 countByEnumeratingWithState:&v226 objects:v244 count:16];
              if (v132)
              {
                uint64_t v133 = v132;
                uint64_t v134 = *(void *)v227;
                do
                {
                  for (uint64_t j = 0; j != v133; ++j)
                  {
                    if (*(void *)v227 != v134) {
                      objc_enumerationMutation(v131);
                    }
                    int v136 = *(void **)(*((void *)&v226 + 1) + 8 * j);
                    uint64_t v137 = [MEMORY[0x1E4F1CA98] null];

                    if (v136 != v137)
                    {
                      uint64_t v138 = [v136 dispatchQueueLabel];
                      if (v138) {
                        [v130 addObject:v138];
                      }
                    }
                  }
                  uint64_t v133 = [v131 countByEnumeratingWithState:&v226 objects:v244 count:16];
                }
                while (v133);
              }

              id v17 = v225;
              id v18 = v218;
              id v20 = v220;
              if ([v130 count])
              {
                if ([v130 count] == 1)
                {
                  uint64_t v139 = [v130 firstObject];
                  SAJSONWriteDictionaryEntry(v225, @"dispatchQueueLabel", v139);
                }
                else
                {
                  SAJSONWriteDictionaryEntry(v225, @"dispatchQueueLabel", v130);
                }
              }

              id v19 = v219;
            }
            if (-[SASamplePrinter hasTimeIndexes](a1))
            {
              uint64_t v140 = [NSNumber numberWithUnsignedInteger:v203];
              SAJSONWriteDictionaryEntry(v17, @"numSamples", v140);

              char v141 = NSNumber;
              if (-[SASamplePrinter hasTimeIndexes](a1))
              {
                int v142 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
                uint64_t v143 = v204 + 1;
                if (v142) {
                  v143 -= *(void *)(a1 + 48);
                }
              }
              else
              {
                uint64_t v143 = 0x7FFFFFFFFFFFFFFFLL;
              }
              uint64_t v144 = [v141 numberWithUnsignedInteger:v143];
              SAJSONWriteDictionaryEntry(v17, @"firstSampleIndex", v144);

              uint64_t v145 = NSNumber;
              if (-[SASamplePrinter hasTimeIndexes](a1))
              {
                int v146 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
                uint64_t v147 = v200 + 1;
                if (v146) {
                  v147 -= *(void *)(a1 + 48);
                }
              }
              else
              {
                uint64_t v147 = 0x7FFFFFFFFFFFFFFFLL;
              }
              uint64_t v148 = [v145 numberWithUnsignedInteger:v147];
              SAJSONWriteDictionaryEntry(v17, @"lastSampleIndex", v148);
            }
            if (v217)
            {
              uint64_t v149 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
              SAJSONWriteDictionaryEntry(v17, @"numIOs", v149);

              BOOL v150 = [NSNumber numberWithUnsignedLongLong:v208];
              SAJSONWriteDictionaryEntry(v17, @"ioSize", v150);
            }
            goto LABEL_279;
          }
          if ([v20 count] == 1)
          {
            uint64_t v99 = [v20 firstObject];
            uint64_t v100 = [MEMORY[0x1E4F1CA98] null];

            if (v99 == v100) {
              goto LABEL_155;
            }
            uint64_t v101 = [v99 identifier];
            if (!v101) {
              goto LABEL_155;
            }
            uint64_t v102 = [NSNumber numberWithUnsignedLongLong:v101];
            SAJSONWriteDictionaryFirstEntry(v17, @"swiftTaskID", v102);
            goto LABEL_154;
          }
          uint64_t v211 = a1;
          int v86 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
          long long v245 = 0u;
          long long v246 = 0u;
          long long v247 = 0u;
          long long v248 = 0u;
          id v155 = v20;
          uint64_t v156 = [v155 countByEnumeratingWithState:&v245 objects:v249 count:16];
          if (v156)
          {
            uint64_t v157 = v156;
            uint64_t v158 = *(void *)v246;
            do
            {
              for (uint64_t k = 0; k != v157; ++k)
              {
                if (*(void *)v246 != v158) {
                  objc_enumerationMutation(v155);
                }
                uint64_t v160 = *(void **)(*((void *)&v245 + 1) + 8 * k);
                uint64_t v161 = [MEMORY[0x1E4F1CA98] null];

                if (v160 == v161)
                {
                  [v86 addObject:&unk_1F1A9AF80];
                }
                else
                {
                  char v162 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v160, "identifier"));
                  [v86 addObject:v162];
                }
              }
              uint64_t v157 = [v155 countByEnumeratingWithState:&v245 objects:v249 count:16];
            }
            while (v157);
          }

          id v17 = v225;
          SAJSONWriteDictionaryFirstEntry(v225, @"swiftTaskID", v86);
LABEL_169:

          a1 = v211;
          id v18 = v218;
          id v19 = v219;
          goto LABEL_170;
        }
        if ([v19 count] == 1)
        {
          uint64_t v31 = [v19 firstObject];
          uint64_t v32 = [MEMORY[0x1E4F1CA98] null];

          if (v31 != v32)
          {
            uint64_t v33 = [v31 identifier];
            if (v33)
            {
              uint64_t v34 = [NSNumber numberWithUnsignedLongLong:v33];
              SAJSONWriteDictionaryFirstEntry(v17, @"dispatchQueueID", v34);
            }
          }
        }
        else
        {
          int v103 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
          long long v234 = 0u;
          long long v235 = 0u;
          long long v236 = 0u;
          long long v237 = 0u;
          id v104 = v19;
          uint64_t v105 = [v104 countByEnumeratingWithState:&v234 objects:v249 count:16];
          if (v105)
          {
            uint64_t v106 = v105;
            uint64_t v107 = *(void *)v235;
            do
            {
              for (uint64_t m = 0; m != v106; ++m)
              {
                if (*(void *)v235 != v107) {
                  objc_enumerationMutation(v104);
                }
                int v109 = *(void **)(*((void *)&v234 + 1) + 8 * m);
                uint64_t v110 = [MEMORY[0x1E4F1CA98] null];

                if (v109 == v110)
                {
                  [v103 addObject:&unk_1F1A9AF80];
                }
                else
                {
                  unint64_t v111 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v109, "identifier"));
                  [v103 addObject:v111];
                }
              }
              uint64_t v106 = [v104 countByEnumeratingWithState:&v234 objects:v249 count:16];
            }
            while (v106);
          }

          id v17 = v225;
          SAJSONWriteDictionaryFirstEntry(v225, @"dispatchQueueID", v103);

          id v18 = v218;
          id v19 = v219;
        }
        if (![v20 count]) {
          goto LABEL_170;
        }
        if ([v20 count] == 1) {
          goto LABEL_151;
        }
        uint64_t v211 = a1;
        int v86 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
        long long v230 = 0u;
        long long v231 = 0u;
        long long v232 = 0u;
        long long v233 = 0u;
        id v87 = v20;
        uint64_t v114 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
        if (v114)
        {
          uint64_t v115 = v114;
          uint64_t v116 = *(void *)v231;
          do
          {
            for (uint64_t n = 0; n != v115; ++n)
            {
              if (*(void *)v231 != v116) {
                objc_enumerationMutation(v87);
              }
              uint64_t v118 = *(void **)(*((void *)&v230 + 1) + 8 * n);
              BOOL v119 = [MEMORY[0x1E4F1CA98] null];

              if (v118 == v119)
              {
                [v86 addObject:&unk_1F1A9AF80];
              }
              else
              {
                uint64_t v120 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v118, "identifier"));
                [v86 addObject:v120];
              }
            }
            uint64_t v115 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
          }
          while (v115);
        }
      }
      else
      {
        if ([v18 count] == 1)
        {
          uint64_t v21 = [v18 firstObject];
          SAJSONWriteDictionaryFirstEntry(v17, @"threadID", v21);
        }
        else
        {
          SAJSONWriteDictionaryFirstEntry(v17, @"threadID", v18);
        }
        if ([v19 count])
        {
          if ([v19 count] == 1)
          {
            int v35 = [v19 firstObject];
            id v36 = [MEMORY[0x1E4F1CA98] null];

            if (v35 != v36)
            {
              uint64_t v37 = [v35 identifier];
              if (v37)
              {
                char v38 = [NSNumber numberWithUnsignedLongLong:v37];
                SAJSONWriteDictionaryEntry(v17, @"dispatchQueueID", v38);
              }
            }
          }
          else
          {
            long long v77 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
            long long v234 = 0u;
            long long v235 = 0u;
            long long v236 = 0u;
            long long v237 = 0u;
            id v78 = v19;
            uint64_t v79 = [v78 countByEnumeratingWithState:&v234 objects:v249 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              uint64_t v81 = *(void *)v235;
              do
              {
                for (idouble i = 0; ii != v80; ++ii)
                {
                  if (*(void *)v235 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  uint64_t v83 = *(void **)(*((void *)&v234 + 1) + 8 * ii);
                  uint64_t v84 = [MEMORY[0x1E4F1CA98] null];

                  if (v83 == v84)
                  {
                    [v77 addObject:&unk_1F1A9AF80];
                  }
                  else
                  {
                    uint64_t v85 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v83, "identifier"));
                    [v77 addObject:v85];
                  }
                }
                uint64_t v80 = [v78 countByEnumeratingWithState:&v234 objects:v249 count:16];
              }
              while (v80);
            }

            id v17 = v225;
            SAJSONWriteDictionaryEntry(v225, @"dispatchQueueID", v77);

            id v18 = v218;
            id v19 = v219;
          }
        }
        if (![v20 count]) {
          goto LABEL_170;
        }
        if ([v20 count] == 1)
        {
LABEL_151:
          uint64_t v99 = [v20 firstObject];
          unint64_t v112 = [MEMORY[0x1E4F1CA98] null];

          if (v99 == v112) {
            goto LABEL_155;
          }
          uint64_t v113 = [v99 identifier];
          if (!v113) {
            goto LABEL_155;
          }
          uint64_t v102 = [NSNumber numberWithUnsignedLongLong:v113];
          SAJSONWriteDictionaryEntry(v17, @"swiftTaskID", v102);
LABEL_154:

LABEL_155:
          goto LABEL_170;
        }
        uint64_t v211 = a1;
        int v86 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
        long long v230 = 0u;
        long long v231 = 0u;
        long long v232 = 0u;
        long long v233 = 0u;
        id v87 = v20;
        uint64_t v88 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
        if (v88)
        {
          uint64_t v89 = v88;
          uint64_t v90 = *(void *)v231;
          do
          {
            for (juint64_t j = 0; jj != v89; ++jj)
            {
              if (*(void *)v231 != v90) {
                objc_enumerationMutation(v87);
              }
              uint64_t v92 = *(void **)(*((void *)&v230 + 1) + 8 * jj);
              uint64_t v93 = [MEMORY[0x1E4F1CA98] null];

              if (v92 == v93)
              {
                [v86 addObject:&unk_1F1A9AF80];
              }
              else
              {
                id v94 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v92, "identifier"));
                [v86 addObject:v94];
              }
            }
            uint64_t v89 = [v87 countByEnumeratingWithState:&v230 objects:&v245 count:16];
          }
          while (v89);
        }
      }

      id v17 = v225;
      SAJSONWriteDictionaryEntry(v225, @"swiftTaskID", v86);
      goto LABEL_169;
    }
    objc_msgSend(v17, "printWithFormat:", @"%*s", 2, "");
    uint64_t v210 = a1;
    if ([v18 count])
    {
      long long v236 = 0u;
      long long v237 = 0u;
      long long v234 = 0u;
      long long v235 = 0u;
      obuint64_t j = v18;
      uint64_t v22 = [obj countByEnumeratingWithState:&v234 objects:v249 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        int v24 = 0;
        uint64_t v25 = *(void *)v235;
        char v26 = 1;
        do
        {
          for (kuint64_t k = 0; kk != v23; ++kk)
          {
            if (*(void *)v235 != v25) {
              objc_enumerationMutation(obj);
            }
            id v28 = *(void **)(*((void *)&v234 + 1) + 8 * kk);
            if (v26) {
              uint64_t v29 = @"Thread ";
            }
            else {
              uint64_t v29 = @",";
            }
            int v30 = [v225 appendString:v29];
            char v26 = 0;
            v24 += v30
                 + objc_msgSend(v225, "printWithFormat:", @"0x%llx", objc_msgSend(v28, "unsignedLongLongValue"));
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v234 objects:v249 count:16];
          char v26 = 0;
        }
        while (v23);
      }
      else
      {
        int v24 = 0;
      }

      id v17 = v225;
      if (v11) {
        v24 += [v225 appendString:@" (idle work queue)"];
      }
      id v18 = v218;
      id v19 = v219;
    }
    else
    {
      int v24 = 0;
    }
    if ((unint64_t)[v20 count] > 1
      || [v20 count] == 1
      && ([v20 firstObject],
          double v39 = objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x1E4F1CA98] null],
          id v40 = objc_claimAutoreleasedReturnValue(),
          v40,
          v39,
          v39 != v40))
    {
      if (v24) {
        objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      }
      uint64_t v41 = a1;
      long long v232 = 0u;
      long long v233 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      id v42 = v20;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v230 objects:&v245 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        int v24 = 0;
        uint64_t v45 = *(void *)v231;
        char v46 = 1;
        do
        {
          for (muint64_t m = 0; mm != v44; ++mm)
          {
            if (*(void *)v231 != v45) {
              objc_enumerationMutation(v42);
            }
            id v48 = *(void **)(*((void *)&v230 + 1) + 8 * mm);
            if (v46)
            {
              int v49 = [v225 appendString:@"Swift Task"] + v24;
              int v24 = [v225 appendString:@" "];
            }
            else
            {
              int v49 = [v225 appendString:@","];
            }
            id v50 = [MEMORY[0x1E4F1CA98] null];

            if (v48 == v50)
            {
              int v51 = [v225 appendString:@"none"];
            }
            else if ([v48 identifier] == -1)
            {
              int v51 = [v225 printWithFormat:@"%@", @"UNKNOWN"];
            }
            else
            {
              int v51 = objc_msgSend(v225, "printWithFormat:", @"%llu", objc_msgSend(v48, "identifier"));
            }
            char v46 = 0;
            v24 += v49 + v51;
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v230 objects:&v245 count:16];
          char v46 = 0;
        }
        while (v44);
      }
      else
      {
        int v24 = 0;
      }

      a1 = v41;
      id v17 = v225;
      id v18 = v218;
      id v19 = v219;
    }
    if ((unint64_t)[v19 count] > 1
      || [v19 count] == 1
      && ([v19 firstObject],
          uint64_t v52 = objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x1E4F1CA98] null],
          uint64_t v53 = objc_claimAutoreleasedReturnValue(),
          v53,
          v52,
          v52 != v53))
    {
      if (v24) {
        objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      }
      long long v228 = 0u;
      long long v229 = 0u;
      long long v226 = 0u;
      long long v227 = 0u;
      id obja = v19;
      uint64_t v54 = [obja countByEnumeratingWithState:&v226 objects:v244 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        int v24 = 0;
        char v56 = 1;
        uint64_t v57 = *(void *)v227;
        do
        {
          for (uint64_t nn = 0; nn != v55; ++nn)
          {
            if (*(void *)v227 != v57) {
              objc_enumerationMutation(obja);
            }
            id v59 = *(void **)(*((void *)&v226 + 1) + 8 * nn);
            uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
            if (v59 == v60) {
              uint64_t v61 = 0;
            }
            else {
              uint64_t v61 = v59;
            }
            id v62 = v61;

            if (v56)
            {
              int v63 = [v225 appendString:@"DispatchQueue"] + v24;
              int v24 = [v225 appendString:@" "];
            }
            else
            {
              int v63 = [v225 appendString:@","];
            }
            int v64 = v63 + v24;
            char v65 = -[SASamplePrinter displayNameForDispatchQueue:](v62);
            int v24 = v64 + [v225 printWithFormat:@"%@", v65];

            char v56 = 0;
          }
          uint64_t v55 = [obja countByEnumeratingWithState:&v226 objects:v244 count:16];
          char v56 = 0;
        }
        while (v55);
      }
      else
      {
        int v24 = 0;
      }

      a1 = v210;
      id v17 = v225;
      id v18 = v218;
      id v19 = v219;
    }
    if (v221)
    {
      if (v24) {
        objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      }
      uint64_t v66 = SACopySanitizedString(v221, 1, 0);
      uint64_t v67 = (void *)v66;
      if (v209) {
        id v68 = @"Thread name \"%@\" (changed)";
      }
      else {
        id v68 = @"Thread name \"%@\"";
      }
      int v24 = objc_msgSend(v17, "printWithFormat:", v68, v66);
    }
    if (!-[SASamplePrinter hasTimeIndexes](a1))
    {
      if (v216)
      {
        [v216 machAbsTimeSeconds];
        double v73 = v72;
        [*(id *)(a1 + 32) machAbsTimeSeconds];
        double v75 = v73 - v74;
        if (v75 > 0.0)
        {
          if (v75 >= 0.01) {
            int v76 = [v17 printWithFormat:@"(not sampled for first %.2fs)", *(void *)&v75];
          }
          else {
            int v76 = [v17 appendString:@"(not sampled for first <0.01s)"];
          }
          v24 += v76;
        }
      }
      goto LABEL_239;
    }
    if (v24) {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
    }
    if (v203 == 1) {
      id v69 = "";
    }
    else {
      id v69 = "s";
    }
    int v24 = objc_msgSend(v17, "printWithFormat:", @"%lu sample%s", v203, v69, v199);
    if (v204 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_239;
    }
    if (-[SASamplePrinter hasTimeIndexes](a1))
    {
      int v70 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
      uint64_t v71 = v204 + 1;
      if (v70) {
        v71 -= *(void *)(a1 + 48);
      }
    }
    else
    {
      uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
    }
    int v95 = objc_msgSend(v17, "printWithFormat:", @" (%lu"), v71 + v24;
    uint64_t v96 = v200 - v204;
    if (v200 != v204)
    {
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        int v97 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
        uint64_t v98 = v200 + 1;
        if (v97) {
          v98 -= *(void *)(a1 + 48);
        }
      }
      else
      {
        uint64_t v98 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v95 += objc_msgSend(v17, "printWithFormat:", @"-%lu", v98);
    }
    if ([*(id *)(a1 + 16) printHeavyStacks]) {
      goto LABEL_218;
    }
    if (v96 + 1 >= v203) {
      break;
    }
    unint64_t v5 = *__error();
    char v183 = _sa_logt();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218496;
      uint64_t v239 = v200;
      __int16 v240 = 2048;
      unint64_t v241 = v204;
      __int16 v242 = 2048;
      unint64_t v243 = v203;
      _os_log_error_impl(&dword_1BF22B000, v183, OS_LOG_TYPE_ERROR, "lastSampleIndex %lu - firstSampleIndex %lu + 1 < count %lu", buf, 0x20u);
    }

    *__error() = v5;
    unint64_t v199 = v203;
    _SASetCrashLogMessage(9447, "lastSampleIndex %lu - firstSampleIndex %lu + 1 < count %lu", v184, v185, v186, v187, v188, v189, v200);
    _os_crash();
    __break(1u);
LABEL_290:
    uint64_t v217 = 0;
    uint64_t v206 = 0;
    unint64_t v207 = 0;
    uint64_t v214 = 0;
    unint64_t v215 = 0;
    uint64_t v212 = 0;
    uint64_t v200 = 0;
    uint64_t v201 = 0;
    unint64_t v203 = 0;
    unint64_t v204 = 0;
    id v13 = 0;
    id v10 = 0;
    id v6 = 0;
    id v8 = 0;
    int v11 = 0;
    int v209 = 0;
    id v15 = 0;
    uint64_t v205 = 0;
    unint64_t v202 = 0;
    unint64_t v208 = 0;
  }
  if (v96 + 1 != v203) {
    v95 += objc_msgSend(v17, "printWithFormat:", @" with gaps of %d", v96 + 1 - v203);
  }
LABEL_218:
  if (v216)
  {
    unint64_t v151 = objc_msgSend(*(id *)(a1 + 160), "indexOfFirstSampleOnOrAfterTimestamp:");
    if (v151)
    {
      unint64_t v152 = v151;
      if (v151 != 0x7FFFFFFFFFFFFFFFLL && v151 <= v204)
      {
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          int v153 = [*(id *)(a1 + 16) forceOneBasedTimeIndexes];
          uint64_t v154 = v152 + 1;
          if (v153) {
            v154 -= *(void *)(a1 + 48);
          }
        }
        else
        {
          uint64_t v154 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v95 += [v17 printWithFormat:@", not sampled before %lu", v154];
      }
    }
  }
  int v24 = [v17 appendString:@""]) + v95;
LABEL_239:
  uint64_t v163 = v214;
  if ((v214 & 0x80000000) == 0)
  {
    if (v24)
    {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      uint64_t v163 = v214;
    }
    int v164 = v163;
    int v24 = objc_msgSend(v17, "printWithFormat:", @"priority %d", v163);
    if (v164 != v205) {
      v24 += objc_msgSend(v17, "printWithFormat:", @"-%d", v205);
    }
    if ((v212 & 0x80000000) == 0)
    {
      int v165 = objc_msgSend(v17, "printWithFormat:", @" (base %d"), v212 + v24;
      if (v212 != v201) {
        v165 += objc_msgSend(v17, "printWithFormat:", @"-%d", v201);
      }
      int v24 = [v17 appendString:@""]) + v165;
    }
  }
  if (i > 0.0
    && (([*(id *)(a1 + 16) displayDetailedCpuTime] & 1) != 0
     || -[SASamplePrinter shouldPrintTimeOutsideSamplingRange:](a1, i)))
  {
    if (v24) {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
    }
    int v166 = [v17 appendString:@"runnable before first sample for "];
    if ([*(id *)(a1 + 16) displayDetailedCpuTime]) {
      uint64_t v167 = 9;
    }
    else {
      uint64_t v167 = 3;
    }
    int v24 = saos_printf_seconds(v17, (unint64_t)(i * 1000000000.0), v167) + v166;
  }
  uint64_t v168 = v217;
  if (v215)
  {
    if (v24) {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
    }
    char v169 = @"cpu time ";
    if (v206) {
      char v169 = @"forced idle time ";
    }
    if (HIDWORD(v206)) {
      long long v170 = @"idle time ";
    }
    else {
      long long v170 = v169;
    }
    int v171 = [v17 appendString:v170];
    if ([*(id *)(a1 + 16) displayDetailedCpuTime]) {
      uint64_t v172 = 9;
    }
    else {
      uint64_t v172 = 3;
    }
    int v24 = saos_printf_seconds(v17, v215, v172) + v171;
    if (v207) {
      v24 += saos_printf_cycles_instructions(v17, v207, v202, [*(id *)(a1 + 16) displayDetailedCpuTime]);
    }
    uint64_t v168 = v217;
  }
  if (v168)
  {
    if (v24)
    {
      objc_msgSend(v17, "printWithFormat:", @"%*s", 4, "");
      uint64_t v168 = v217;
    }
    if (v168 == 1) {
      uint64_t v173 = "";
    }
    else {
      uint64_t v173 = "s";
    }
    uint64_t v174 = v168;
    uint64_t v175 = SAFormattedBytesEx(v208, 1, 0, 1, 0);
    [v17 printWithFormat:@"%lu I/O%s (%@)", v174, v173, v175];

    id v19 = v219;
  }
  [v17 appendString:@"\n"];
  id v20 = v220;
LABEL_279:

  unint64_t v176 = self;
  if (self)
  {
    if (!*((void *)self + 4) || (v177 = objc_getProperty(self, (SEL)self, 120, 1), unint64_t v176 = self, v177))
    {
      if (objc_getProperty(v176, (SEL)v176, 120, 1))
      {
        id v179 = objc_getProperty(self, v178, 120, 1);
        unint64_t v180 = *((void *)self + 4);
        id Property = objc_getProperty(self, v181, 128, 1);
        -[SASamplePrinter addStack:toStream:sampleCount:binariesToDisplay:primaryState:primaryMicrostackshotState:onlyHeaviestStack:](a1, v179, v17, v180, Property, 0, 0, 0);
      }
      goto LABEL_284;
    }
    int v190 = *__error();
    id v191 = _sa_logt();
    if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
    {
      uint64_t v192 = *((void *)self + 4);
      *(_DWORD *)uint64_t v249 = 134217984;
      uint64_t v250 = v192;
      _os_log_error_impl(&dword_1BF22B000, v191, OS_LOG_TYPE_ERROR, "%lu count, but no rootObjects", v249, 0xCu);
    }

    *__error() = v190;
    _SASetCrashLogMessage(8747, "%lu count, but no rootObjects", v193, v194, v195, v196, v197, v198, *((void *)self + 4));
    _os_crash();
    __break(1u);
  }
  else
  {
LABEL_284:
  }
}

void __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 32), *(void **)(a1 + 40), v6, 0))
  {
    id v4 = *(void **)(a1 + 48);
    unint64_t v5 = -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:](*(void *)(a1 + 32), v6, 0, *(void **)(a1 + 40), *(void *)(a1 + 56), [v6 threadId] == objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "targetThreadId"));
    [v4 addObject:v5];
  }
}

- (SAStack)stackForThread:(void *)a3 threadStateIndexes:(void *)a4 task:(uint64_t)a5 taskSampleCount:(BOOL)a6 isTarget:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (!a1)
  {
    SEL v14 = 0;
    goto LABEL_21;
  }
  SEL v14 = objc_alloc_init(SAStack);
  char v15 = [v11 isMainThread];
  if (v14)
  {
    v14->_isMainThread = v15;
    v14->_isTargetCallTree = a6;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "threadId"));
  id v19 = objc_msgSend(v16, "initWithObjects:", v17, 0);
  if (v14) {
    objc_setProperty_atomic(v14, v18, v19, 56);
  }

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if (v14) {
    objc_setProperty_atomic(v14, v20, v21, 40);
  }

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v14) {
    objc_setProperty_atomic(v14, v22, v23, 48);
  }

  int v24 = -[SASamplePrinter binaryImagesHitByTask:](a1, v13);
  char v26 = v24;
  if (v14)
  {
    objc_setProperty_atomic(v14, v25, v24, 128);

    -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:](a1, 0, 0, v11, v12, v14, v13, a5);
    if (!v14->_omit && v14->_count)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL threadNameChanges = v14->_threadNameChanges;
      unint64_t v29 = [(NSMutableArray *)v14->_dispatchQueues count];
      unint64_t v30 = [(NSMutableArray *)v14->_swiftTasks count];
      unint64_t v31 = [(NSMutableArray *)v14->_threadIds count];
      char v32 = v14->_minPriority != v14->_maxPriority || v14->_minBasePriority != v14->_maxBasePriority;
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](a1, 0, 0, v11, v12, v13, v27, threadNameChanges, v29 > 1, v30 > 1, v31 > 1, v32, 0, 0, 1u);
      objc_setProperty_atomic(v14, v33, v27, 120);
      uint64_t v34 = v14;

      goto LABEL_20;
    }
  }
  else
  {

    -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:](a1, 0, 0, v11, v12, 0, v13, a5);
  }
  int v35 = v14;
LABEL_20:

LABEL_21:
  return v14;
}

void __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  if (-[SASamplePrinter aggregateByDispatchQueue:](a1[4], v47))
  {
    id v4 = (void *)a1[5];
    unint64_t v5 = [*(id *)(a1[4] + 160) targetProcess];
    if (v4 == v5)
    {
      uint64_t v7 = [v47 identifier];
      BOOL v6 = v7 == [*(id *)(a1[4] + 160) targetDispatchQueueId];
    }
    else
    {
      BOOL v6 = 0;
    }

    uint64_t v8 = a1[4];
    SEL v9 = (void *)a1[5];
    id v10 = (void *)a1[6];
    uint64_t v11 = a1[7];
    id v12 = v47;
    unint64_t v13 = v9;
    if (v8)
    {
      uint64_t v14 = *(void *)(v8 + 16);
      if (v14)
      {
        uint64_t v15 = *(void *)(v14 + 152);
        if (v15 == 1 || !v15 && !*(unsigned char *)(v14 + 11))
        {
          id v16 = objc_alloc_init(SAStack);
          id v17 = v16;
          if (v16) {
            v16->_isTargetCallTree = v6;
          }
          id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          if (v17) {
            objc_setProperty_atomic(v17, v18, v19, 56);
          }

          uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v12, 0);
          if (v17) {
            objc_setProperty_atomic(v17, v20, v21, 40);
          }

          id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v17) {
            objc_setProperty_atomic(v17, v22, v23, 48);
          }

          int v24 = -[SASamplePrinter binaryImagesHitByTask:](v8, (void *)v13);
          char v26 = v24;
          if (v17)
          {
            objc_setProperty_atomic(v17, v25, v24, 128);

            -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:](v8, v12, 0, 0, 0, v17, (void *)v13, v11);
            if (!v17->_omit && v17->_count)
            {
              id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              BOOL threadNameChanges = v17->_threadNameChanges;
              unint64_t v29 = [(NSMutableArray *)v17->_dispatchQueues count];
              unint64_t v30 = [(NSMutableArray *)v17->_swiftTasks count];
              unint64_t v31 = [(NSMutableArray *)v17->_threadIds count];
              char v32 = v17->_minPriority != v17->_maxPriority || v17->_minBasePriority != v17->_maxBasePriority;
              -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v8, v12, 0, 0, 0, (void *)v13, v27, threadNameChanges, v29 > 1, v30 > 1, v31 > 1, v32, 0, 0, 1u);
              objc_setProperty_atomic(v17, v33, v27, 120);
              uint64_t v34 = v17;

              goto LABEL_36;
            }
          }
          else
          {

            -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:](v8, v12, 0, 0, 0, 0, (void *)v13, v11);
          }
          char v46 = v17;
LABEL_36:

          goto LABEL_37;
        }
      }
      unint64_t v13 = *__error();
      int v35 = _sa_logt();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(v8 + 16);
        if (v36)
        {
          uint64_t v37 = *(void *)(v36 + 152);
          if (!v37)
          {
            if (*(unsigned char *)(v36 + 11)) {
              uint64_t v37 = 3;
            }
            else {
              uint64_t v37 = 1;
            }
          }
        }
        else
        {
          uint64_t v37 = 0;
        }
        id v12 = [(id)v36 debugDescription];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v49 = v37;
        __int16 v50 = 2080;
        uint64_t v51 = [v12 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v35, OS_LOG_TYPE_ERROR, "stackForDispatchQueue, but not kSAAggregateCallTreesByDispatchQueue %llu: %s", buf, 0x16u);
      }
      *__error() = v13;
      char v38 = *(void **)(v8 + 16);
      id v10 = (void *)-[SASamplePrintOptions callTreeAggregationResolved]((uint64_t)v38);
      id v39 = [v38 debugDescription];
      [v39 UTF8String];
      _SASetCrashLogMessage(11936, "stackForDispatchQueue, but not kSAAggregateCallTreesByDispatchQueue %llu: %s", v40, v41, v42, v43, v44, v45, (char)v10);

      _os_crash();
      __break(1u);
    }
    id v17 = 0;
LABEL_37:

    [v10 addObject:v17];
  }
}

- (uint64_t)aggregateByDispatchQueue:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 hasConcurrentExecution]) {
      a1 = [*(id *)(a1 + 16) printHeavyStacks];
    }
    else {
      a1 = 1;
    }
  }

  return a1;
}

void __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 32), *(void **)(a1 + 40), v55, 0))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v11 = v55;
    unint64_t v12 = v7;
    uint64_t v54 = v10;
    if (!v8)
    {
LABEL_42:

      [v54 addObjectsFromArray:v8];
      goto LABEL_43;
    }
    uint64_t v13 = *(void *)(v8 + 16);
    if (!v13 || (uint64_t v14 = *(void *)(v13 + 152), v14 != 1) && (v14 || *(unsigned char *)(v13 + 11)))
    {
      unint64_t v12 = *__error();
      id v39 = _sa_logt();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(v8 + 16);
        if (v40)
        {
          uint64_t v9 = *(void *)(v40 + 152);
          if (!v9)
          {
            if (*(unsigned char *)(v40 + 11)) {
              uint64_t v9 = 3;
            }
            else {
              uint64_t v9 = 1;
            }
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
        id v41 = [(id)v40 debugDescription];
        *(_DWORD *)long long buf = 134218242;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = [v41 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v39, OS_LOG_TYPE_ERROR, "stacksForThread, but not kSAAggregateCallTreesByDispatchQueue %llu: %s", buf, 0x16u);
      }
      *__error() = v12;
      uint64_t v42 = *(void **)(v8 + 16);
      unint64_t v29 = (void *)-[SASamplePrintOptions callTreeAggregationResolved]((uint64_t)v42);
      id v11 = [v42 debugDescription];
      [v11 UTF8String];
      _SASetCrashLogMessage(8566, "stacksForThread, but not kSAAggregateCallTreesByDispatchQueue %llu: %s", v43, v44, v45, v46, v47, v48, (char)v29);

      _os_crash();
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v15 = [*(id *)(v8 + 160) targetDispatchQueueId];
    if (v15)
    {
      id v3 = [*(id *)(v8 + 160) targetProcess];
      if (v3 == (id)v12)
      {

        goto LABEL_17;
      }
      if ([v11 isMainThread])
      {

LABEL_15:
        id v18 = objc_alloc(MEMORY[0x1E4F1C978]);
        id v19 = -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:](v8, v11, 0, (void *)v12, v9, [v11 threadId] == objc_msgSend(*(id *)(v8 + 160), "targetThreadId"));
        uint64_t v8 = objc_msgSend(v18, "initWithObjects:", v19, 0);

        goto LABEL_42;
      }
    }
    else if ([v11 isMainThread])
    {
      goto LABEL_15;
    }
    uint64_t v16 = [v11 threadId];
    uint64_t v17 = [*(id *)(v8 + 160) targetThreadId];
    if (v15) {

    }
    if (v16 == v17) {
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v53 = v9;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v61 = 0;
    id v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 1;
    uint64_t v21 = *(void *)(v8 + 32);
    uint64_t v22 = *(void *)(v8 + 40);
    uint64_t v23 = *(void *)(v8 + 48);
    uint64_t v24 = *(void *)(v8 + 56);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke;
    uint64_t v66 = &unk_1E63F9910;
    uint64_t v67 = v8;
    uint64_t v71 = &v61;
    id v25 = (id)v12;
    id v68 = v25;
    id v26 = v11;
    id v69 = v26;
    id v70 = v20;
    id v27 = v26;
    id v28 = v26;
    id v4 = v70;
    [v28 enumerateThreadStatesBetweenStartTime:v21 startSampleIndex:v23 endTime:v22 endSampleIndex:v24 reverseOrder:0 block:buf];
    if ([v4 count] != 1 || !*((unsigned char *)v62 + 24))
    {
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke_2;
      v56[3] = &unk_1E63F9938;
      v56[4] = v8;
      id v57 = v25;
      id v58 = v27;
      id v35 = v34;
      id v59 = v35;
      uint64_t v60 = v53;
      [v4 enumerateKeysAndObjectsUsingBlock:v56];
      uint64_t v36 = v59;
      id v37 = v35;

      uint64_t v8 = (uint64_t)v37;
LABEL_41:

      _Block_object_dispose(&v61, 8);
      goto LABEL_42;
    }
    unint64_t v29 = v25;
    uint64_t v9 = v53;
    uint64_t v30 = [*(id *)(v8 + 160) targetThreadId];
    id v3 = v27;
    unint64_t v31 = *(void **)(v8 + 160);
    if (v30)
    {
      if (![v31 targetDispatchQueueId])
      {
        uint64_t v38 = [v27 threadId];
        BOOL v33 = v38 == [*(id *)(v8 + 160) targetThreadId];
        goto LABEL_40;
      }
      uint64_t v32 = [v27 threadId];
      if (v32 == [*(id *)(v8 + 160) targetThreadId])
      {
        unint64_t v5 = [*(id *)(v8 + 160) targetProcess];
        if (v5 != v29)
        {
          BOOL v33 = 0;
LABEL_39:

          goto LABEL_40;
        }
        goto LABEL_38;
      }
    }
    else if ([v31 targetDispatchQueueId])
    {
      unint64_t v5 = [*(id *)(v8 + 160) targetProcess];
      if (v5 != v29)
      {
        BOOL v33 = 0;
        goto LABEL_39;
      }
LABEL_38:
      uint64_t v49 = [v4 allKeys];
      uint64_t v52 = [v49 firstObject];
      uint64_t v50 = [v52 unsignedLongLongValue];
      BOOL v33 = v50 == [*(id *)(v8 + 160) targetDispatchQueueId];

      goto LABEL_39;
    }
    BOOL v33 = 0;
LABEL_40:
    id v51 = objc_alloc(MEMORY[0x1E4F1C978]);
    -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:](v8, v3, 0, v29, v9, v33);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend(v51, "initWithObjects:", v37, 0);
    goto LABEL_41;
  }
LABEL_43:
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_1793(uint64_t a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  BOOL v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1C18A6A20]();
  if (v5 && (v5[10] & 1) != 0)
  {
    if (!v6 || (v6[10] & 1) == 0)
    {
      uint64_t v8 = -1;
      goto LABEL_44;
    }
  }
  else if (v6 && (v6[10] & 1) != 0)
  {
    uint64_t v8 = 1;
    goto LABEL_44;
  }
  context = v7;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2_1794;
  v63[3] = &unk_1E63F9420;
  uint64_t v36 = v5;
  uint64_t v9 = v5;
  id v64 = v9;
  id v35 = v6;
  id v10 = v6;
  id v65 = v10;
  uint64_t v40 = (void *)MEMORY[0x1C18A6C80](v63);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3_1795;
  v60[3] = &unk_1E63F9420;
  id v11 = v9;
  id v61 = v11;
  unint64_t v12 = v10;
  id v62 = v12;
  id v39 = (void *)MEMORY[0x1C18A6C80](v60);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_4;
  v57[3] = &unk_1E63F9420;
  uint64_t v13 = v11;
  id v58 = v13;
  uint64_t v14 = v12;
  id v59 = v14;
  id v37 = (void *)MEMORY[0x1C18A6C80](v57);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_5;
  v54[3] = &unk_1E63F9420;
  uint64_t v15 = v13;
  id v55 = v15;
  uint64_t v16 = v14;
  id v56 = v16;
  uint64_t v38 = (void *)MEMORY[0x1C18A6C80](v54);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_6;
  v51[3] = &unk_1E63F9420;
  uint64_t v17 = v15;
  id v52 = v17;
  id v18 = v16;
  id v53 = v18;
  id v19 = (void *)MEMORY[0x1C18A6C80](v51);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_7;
  v48[3] = &unk_1E63F9898;
  id v20 = v17;
  id v49 = v20;
  uint64_t v21 = v18;
  id v50 = v21;
  uint64_t v22 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v48);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_8;
  v45[3] = &unk_1E63F98C0;
  uint64_t v46 = v20;
  uint64_t v47 = v21;
  uint64_t v23 = (uint64_t (**)(void))MEMORY[0x1C18A6C80](v45);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v33 = a1;
  id v24 = *(id *)(a1 + 32);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v66 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
LABEL_11:
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v42 != v27) {
        objc_enumerationMutation(v24);
      }
      uint64_t v29 = [*(id *)(*((void *)&v41 + 1) + 8 * v28) unsignedLongLongValue];
      switch(v29 & 0x7FFFFFFFFFFFFFFFLL)
      {
        case 1:
          unint64_t v31 = (uint64_t (*)(void))v40[2];
          goto LABEL_24;
        case 2:
          unint64_t v31 = (uint64_t (*)(void))v39[2];
          goto LABEL_24;
        case 3:
          unint64_t v31 = (uint64_t (*)(void))v37[2];
          goto LABEL_24;
        case 4:
          unint64_t v31 = (uint64_t (*)(void))v19[2];
          goto LABEL_24;
        case 5:
          uint64_t v30 = v22[2](v22, 1);
          goto LABEL_25;
        case 6:
          uint64_t v30 = v22[2](v22, 0);
          goto LABEL_25;
        case 7:
        case 8:
        case 9:
        case 0xALL:
          uint64_t v30 = v23[2](v23);
          goto LABEL_25;
        case 0xBLL:
          unint64_t v31 = (uint64_t (*)(void))v38[2];
LABEL_24:
          uint64_t v30 = v31();
LABEL_25:
          if (!v30) {
            goto LABEL_26;
          }
          if (v29 >= 0) {
            uint64_t v8 = v30;
          }
          else {
            uint64_t v8 = -v30;
          }

          goto LABEL_43;
        default:
LABEL_26:
          if (v26 != ++v28) {
            continue;
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v66 count:16];
          if (!v26) {
            goto LABEL_28;
          }
          goto LABEL_11;
      }
    }
  }
LABEL_28:

  if ((([*(id *)(v33 + 32) containsObject:&unk_1F1A9AF68] & 1) != 0
     || (uint64_t v8 = ((uint64_t (*)(void))v40[2])()) == 0)
    && (([*(id *)(v33 + 32) containsObject:&unk_1F1A9AFB0] & 1) != 0
     || (uint64_t v8 = ((uint64_t (*)(void))v39[2])()) == 0)
    && (([*(id *)(v33 + 32) containsObject:&unk_1F1A9AFE0] & 1) != 0
     || (uint64_t v8 = ((uint64_t (*)(void))v38[2])()) == 0)
    && (([*(id *)(v33 + 32) containsObject:&unk_1F1A9AFF8] & 1) != 0
     || (uint64_t v8 = ((uint64_t (*)(void))v37[2])()) == 0)
    && (([*(id *)(v33 + 32) containsObject:&unk_1F1A9AF38] & 1) != 0
     || (uint64_t v8 = ((uint64_t (*)(void *))v19[2])(v19)) == 0))
  {
    uint64_t v8 = 0;
  }
LABEL_43:

  BOOL v6 = v35;
  unint64_t v5 = v36;
  uint64_t v7 = context;
LABEL_44:

  return v8;
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_2_1794(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(unsigned char *)(v1 + 9) & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4 || (*(unsigned char *)(v4 + 9) & 1) == 0) {
      return -1;
    }
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2 && (*(unsigned char *)(v2 + 9) & 1) != 0) {
      return 1;
    }
  }
  return 0;
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_3_1795(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  if (v2 == v4) {
    return 0;
  }
  if (v1) {
    unint64_t v1 = *(void *)(v1 + 32);
  }
  if (v3) {
    unint64_t v3 = *(void *)(v3 + 32);
  }
  if (v1 > v3) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_4(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40, 1);
  }
  id v5 = Property;
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 40, 1);
  }
  id v7 = v6;
  unint64_t v8 = [v5 count];
  uint64_t v9 = [v7 count];
  if (!(v8 | v9)) {
    goto LABEL_16;
  }
  unint64_t v10 = v9;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      id v11 = [v5 firstObject];
      unint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      BOOL v13 = v11 == v12;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
  if ([v7 count])
  {
    if ([v7 count] != 1)
    {
      if (v13) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }
    uint64_t v14 = [v7 firstObject];
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    BOOL v16 = v14 == v15;
  }
  else
  {
    BOOL v16 = 1;
  }
  if (v13 && v16)
  {
LABEL_16:
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  if (v16) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 1;
  }
  if (!v16 && !v13)
  {
LABEL_24:
    if (v10 < v8)
    {
      uint64_t v17 = -1;
      goto LABEL_17;
    }
    if (v8 < v10)
    {
LABEL_27:
      uint64_t v17 = 1;
      goto LABEL_17;
    }
    if (!v8) {
      goto LABEL_16;
    }
    for (uint64_t i = 0; v8 != i; ++i)
    {
      id v20 = [v5 objectAtIndexedSubscript:i];
      uint64_t v21 = [MEMORY[0x1E4F1CA98] null];

      if (v20 == v21)
      {

        id v20 = 0;
      }
      uint64_t v22 = [v7 objectAtIndexedSubscript:i];
      uint64_t v23 = [MEMORY[0x1E4F1CA98] null];

      if (v22 == v23)
      {

        uint64_t v22 = 0;
      }
      uint64_t v24 = [v20 dispatchQueueLabel];
      uint64_t v25 = [v22 dispatchQueueLabel];
      uint64_t v26 = (void *)v25;
      if (v24 && v25)
      {
        uint64_t v27 = [(id)v24 compare:v25 options:577];
        if (v27)
        {
          char v28 = 0;
          uint64_t v32 = v27;
          goto LABEL_53;
        }
      }
      else
      {
        uint64_t v29 = -1;
        if (!v24) {
          uint64_t v29 = 1;
        }
        if (v24 | v25)
        {
LABEL_48:
          char v28 = 0;
          goto LABEL_49;
        }
      }
      unint64_t v30 = [v20 identifier];
      unint64_t v31 = [v22 identifier];
      if (v30 && v31)
      {
        if (v30 < v31)
        {
          char v28 = 0;
          uint64_t v29 = -1;
LABEL_49:
          uint64_t v32 = v29;
          goto LABEL_53;
        }
        if (v30 > v31)
        {
          char v28 = 0;
          uint64_t v29 = 1;
          goto LABEL_49;
        }
      }
      else
      {
        uint64_t v29 = -1;
        if (!v30) {
          uint64_t v29 = 1;
        }
        if (v30 | v31) {
          goto LABEL_48;
        }
      }
      char v28 = 1;
LABEL_53:

      if ((v28 & 1) == 0)
      {
        uint64_t v17 = v32;
        break;
      }
      uint64_t v17 = 0;
    }
  }
LABEL_17:

  return v17;
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_5(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 48, 1);
  }
  id v5 = Property;
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 48, 1);
  }
  id v7 = v6;
  unint64_t v8 = [v5 count];
  uint64_t v9 = [v7 count];
  if (!(v8 | v9)) {
    goto LABEL_16;
  }
  unint64_t v10 = v9;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      id v11 = [v5 firstObject];
      unint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      BOOL v13 = v11 == v12;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
  if ([v7 count])
  {
    if ([v7 count] != 1)
    {
      if (v13) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }
    uint64_t v14 = [v7 firstObject];
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    BOOL v16 = v14 == v15;
  }
  else
  {
    BOOL v16 = 1;
  }
  if (v13 && v16)
  {
LABEL_16:
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  BOOL v19 = v16 || v13;
  if (v16) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 1;
  }
  if (v19) {
    goto LABEL_17;
  }
LABEL_24:
  if (v10 < v8)
  {
    uint64_t v17 = -1;
    goto LABEL_17;
  }
  if (v8 < v10)
  {
LABEL_27:
    uint64_t v17 = 1;
    goto LABEL_17;
  }
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v20 = 0;
  while (1)
  {
    uint64_t v21 = [v5 objectAtIndexedSubscript:v20];
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];

    if (v21 == v22)
    {

      uint64_t v21 = 0;
    }
    uint64_t v23 = [v7 objectAtIndexedSubscript:v20];
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];

    if (v23 == v24)
    {

      uint64_t v23 = 0;
    }
    unint64_t v25 = [v21 identifier];
    unint64_t v26 = [v23 identifier];
    if (!v25 || !v26) {
      break;
    }
    if (v25 < v26)
    {
      uint64_t v17 = -1;
      goto LABEL_46;
    }
    if (v25 > v26)
    {
      uint64_t v17 = 1;
      goto LABEL_46;
    }
LABEL_40:

    uint64_t v17 = 0;
    if (v8 == ++v20) {
      goto LABEL_17;
    }
  }
  if (!(v25 | v26)) {
    goto LABEL_40;
  }
  if (v25) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 1;
  }
LABEL_46:

LABEL_17:
  return v17;
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_6(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 56, 1);
  }
  id v5 = Property;
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    id v6 = objc_getProperty(v6, v4, 56, 1);
  }
  id v7 = v6;
  unint64_t v8 = [v5 count];
  unint64_t v9 = [v7 count];
  if (!(v8 | v9)) {
    goto LABEL_16;
  }
  if (v9 >= v8)
  {
    if (v8 < v9)
    {
LABEL_9:
      uint64_t v10 = 1;
      goto LABEL_17;
    }
    if (v8)
    {
      uint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = [v5 objectAtIndexedSubscript:v11];
        BOOL v13 = [v7 objectAtIndexedSubscript:v11];
        unint64_t v14 = [v12 unsignedLongLongValue];
        if (v14 < [v13 unsignedLongLongValue]) {
          break;
        }
        unint64_t v15 = [v12 unsignedLongLongValue];
        unint64_t v16 = [v13 unsignedLongLongValue];

        if (v15 > v16) {
          goto LABEL_9;
        }
        uint64_t v10 = 0;
        if (v8 == ++v11) {
          goto LABEL_17;
        }
      }

      goto LABEL_7;
    }
LABEL_16:
    uint64_t v10 = 0;
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v10 = -1;
LABEL_17:

  return v10;
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_7(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v2) {
      LODWORD(v2) = *(_DWORD *)(v2 + 28);
    }
    unint64_t v3 = *(_DWORD **)(a1 + 40);
    if (v3)
    {
      v3 += 7;
LABEL_10:
      LODWORD(v3) = *v3;
    }
  }
  else
  {
    if (v2) {
      LODWORD(v2) = *(_DWORD *)(v2 + 20);
    }
    unint64_t v3 = *(_DWORD **)(a1 + 40);
    if (v3)
    {
      v3 += 5;
      goto LABEL_10;
    }
  }
  BOOL v4 = (int)v2 < (int)v3;
  if ((int)v2 <= (int)v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -1;
  }
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

uint64_t __49__SASamplePrinter_stacksForTask_taskSampleCount___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 7:
      uint64_t v2 = *(void **)(a1 + 32);
      if (!v2) {
        goto LABEL_45;
      }
      unint64_t v3 = v2[12];
      goto LABEL_4;
    case 8:
      uint64_t v2 = *(void **)(a1 + 32);
      if (v2) {
        unint64_t v15 = v2[13];
      }
      else {
        unint64_t v15 = 0;
      }
      BOOL v4 = *(void **)(a1 + 40);
      if (v4) {
        unint64_t v16 = v4[13];
      }
      else {
        unint64_t v16 = 0;
      }
      if (v15 < v16) {
        return 1;
      }
      if (v2) {
        uint64_t v2 = (void *)v2[13];
      }
      if (v4) {
        BOOL v4 = (void *)v4[13];
      }
      goto LABEL_39;
    case 9:
      uint64_t v2 = *(void **)(a1 + 32);
      if (v2) {
        unint64_t v6 = v2[14];
      }
      else {
        unint64_t v6 = 0;
      }
      BOOL v4 = *(void **)(a1 + 40);
      if (v4) {
        unint64_t v7 = v4[14];
      }
      else {
        unint64_t v7 = 0;
      }
      if (v6 < v7) {
        return 1;
      }
      if (v2) {
        uint64_t v2 = (void *)v2[14];
      }
      if (v4) {
        BOOL v4 = (void *)v4[14];
      }
      goto LABEL_39;
    case 10:
      uint64_t v8 = *(void *)(a1 + 32);
      double v9 = 0.0;
      double v10 = 0.0;
      if (v8)
      {
        unint64_t v11 = *(void *)(v8 + 104);
        if (v11) {
          double v10 = (double)*(unint64_t *)(v8 + 112) / (double)v11;
        }
      }
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        unint64_t v13 = *(void *)(v12 + 104);
        if (v13) {
          double v9 = (double)*(unint64_t *)(v12 + 112) / (double)v13;
        }
      }
      if (v10 < v9) {
        return 1;
      }
      if (v10 > v9) {
        return -1;
      }
      return 0;
    default:
      int v17 = *__error();
      id v18 = _sa_logt();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v27 = a2;
        _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "invalid sort option 0x%llx", buf, 0xCu);
      }

      *__error() = v17;
      _SASetCrashLogMessage(8459, "invalid sort option 0x%llx", v19, v20, v21, v22, v23, v24, a2);
      a1 = _os_crash();
      __break(1u);
LABEL_45:
      unint64_t v3 = 0;
LABEL_4:
      BOOL v4 = *(void **)(a1 + 40);
      if (v4) {
        unint64_t v5 = v4[12];
      }
      else {
        unint64_t v5 = 0;
      }
      if (v3 < v5) {
        return 1;
      }
      if (v2) {
        uint64_t v2 = (void *)v2[12];
      }
      if (v4) {
        BOOL v4 = (void *)v4[12];
      }
LABEL_39:
      if (v2 > v4) {
        return -1;
      }
      else {
        return 0;
      }
  }
}

void __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  if ([v24 isIdleWorkQueue]
    && ([*(id *)(*(void *)(a1 + 32) + 16) displayIdleWorkQueueThreads] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_36;
  }
  unint64_t v5 = [v24 dispatchQueue];
  if (v5) {
    int v6 = -[SASamplePrinter aggregateByDispatchQueue:](*(void *)(a1 + 32), v5);
  }
  else {
    int v6 = 0;
  }
  if ([v24 isIdleWorkQueue]) {
    uint64_t v7 = -3;
  }
  else {
    uint64_t v7 = [v5 identifier];
  }
  if (![*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId]
    || (uint64_t v8 = *(void **)(a1 + 40),
        [*(id *)(*(void *)(a1 + 32) + 160) targetProcess],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8 != v9))
  {
    if ([*(id *)(a1 + 48) isMainThread])
    {
      uint64_t v7 = 0;
LABEL_31:
      int v17 = *(void **)(a1 + 56);
      id v18 = [NSNumber numberWithUnsignedLongLong:v7];
      uint64_t v19 = [v17 objectForKeyedSubscript:v18];

      if (v19)
      {
        uint64_t v20 = [NSNumber numberWithUnsignedInteger:a3];
        [v19 addObject:v20];
      }
      else
      {
        id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v22 = [NSNumber numberWithUnsignedInteger:a3];
        uint64_t v19 = objc_msgSend(v21, "initWithObjects:", v22, 0);

        uint64_t v23 = *(void **)(a1 + 56);
        uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v7];
        [v23 setObject:v19 forKeyedSubscript:v20];
      }

      goto LABEL_35;
    }
    uint64_t v10 = [*(id *)(a1 + 48) threadId];
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId];
    if (v10 == v11) {
      char v12 = 0;
    }
    else {
      char v12 = v6;
    }
    if (v10 == v11) {
      uint64_t v7 = 0;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 160) targetThreadId])
  {
    uint64_t v15 = [v5 identifier];
    if (v15 == [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId]) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  uint64_t v13 = [*(id *)(a1 + 48) threadId];
  if (v13 != [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId])
  {
LABEL_26:
    int v16 = [*(id *)(a1 + 48) isMainThread];
    if (v16) {
      uint64_t v7 = 0;
    }
    if ((v6 & ~(_BYTE)v16 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  uint64_t v14 = [v5 identifier];
  if (v14 == [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId])
  {
    uint64_t v7 = [v5 identifier];
    goto LABEL_31;
  }
  if (!v6) {
    goto LABEL_31;
  }
LABEL_29:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_35:

LABEL_36:
}

void __56__SASamplePrinter_stacksForThread_task_taskSampleCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 160) targetThreadId]
    && [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId]
    && (int v6 = *(void **)(a1 + 40),
        [*(id *)(*(void *)(a1 + 32) + 160) targetProcess],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6 == v7)
    && (uint64_t v8 = [*(id *)(a1 + 48) threadId],
        v8 == [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId]))
  {
    uint64_t v9 = [v13 unsignedLongLongValue];
    BOOL v10 = v9 == [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId];
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = *(void **)(a1 + 56);
  char v12 = -[SASamplePrinter stackForThread:threadStateIndexes:task:taskSampleCount:isTarget:](*(void *)(a1 + 32), *(void **)(a1 + 48), v5, *(void **)(a1 + 40), *(void *)(a1 + 64), v10);
  [v11 addObject:v12];
}

- (void)addHeaderForDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 andThreadStateIndexes:(void *)a6 toStack:(void *)a7 task:(uint64_t)a8 taskSampleCount:
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  int v17 = a3;
  id v18 = a4;
  id v19 = a5;
  uint64_t v20 = v17;
  id v21 = v19;
  id v22 = a6;
  uint64_t v23 = a7;
  uint64_t v24 = MEMORY[0x1C18A6A20]();
  if ((v20 || v16 || !v18) && (v20 || !v16 || v18) && (!v20 || v16 || v18))
  {
    int v94 = *__error();
    int v95 = _sa_logt();
    uint64_t v23 = v20;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      if (v18) {
        uint64_t v96 = "y";
      }
      else {
        uint64_t v96 = "n";
      }
      if (v16) {
        uint64_t v20 = "y";
      }
      else {
        uint64_t v20 = "n";
      }
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = v96;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v20;
      if (v23) {
        id v18 = "y";
      }
      else {
        id v18 = "n";
      }
      *(_WORD *)&buf[22] = 2080;
      id v261 = (uint64_t (*)(uint64_t, uint64_t))v18;
      _os_log_error_impl(&dword_1BF22B000, v95, OS_LOG_TYPE_ERROR, "aThread %s, aDispatchQueue %s, swiftTaskStates %s", buf, 0x20u);
    }
    else
    {
      if (v18) {
        uint64_t v96 = "y";
      }
      else {
        uint64_t v96 = "n";
      }
      if (v16) {
        uint64_t v20 = "y";
      }
      else {
        uint64_t v20 = "n";
      }
      if (v23) {
        id v18 = "y";
      }
      else {
        id v18 = "n";
      }
    }

    *__error() = v94;
    _SASetCrashLogMessage(8788, "aThread %s, aDispatchQueue %s, swiftTaskStates %s", v97, v98, v99, v100, v101, v102, (char)v96);
    _os_crash();
    __break(1u);
    goto LABEL_137;
  }
  context = (void *)v24;
  char v8 = [*(id *)(a1 + 16) omitStacksOnAC];
  char v120 = [*(id *)(a1 + 16) omitStacksOnBattery];
  char v116 = [*(id *)(a1 + 16) omitStacksWithUserIdle];
  char v113 = [*(id *)(a1 + 16) omitStacksWithUserActive];
  char v112 = [*(id *)(a1 + 16) omitStacksWithPCore];
  char v111 = [*(id *)(a1 + 16) omitStacksWithECore];
  int v110 = [*(id *)(a1 + 16) omitStacksBelowBasePriority];
  int v109 = [*(id *)(a1 + 16) omitStacksAboveBasePriority];
  if ([*(id *)(a1 + 16) swiftAsyncDisplayCRootCallstacks]) {
    char v108 = 1;
  }
  else {
    char v108 = [*(id *)(a1 + 16) swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
  }
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v115 = v21;
  self = v22;
  uint64_t v103 = a8;
  if (!v26)
  {
LABEL_137:
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    goto LABEL_22;
  }
  uint64_t v27 = *(void *)(v26 + 152);
  if (!v27)
  {
    if (*(unsigned char *)(v26 + 11)) {
      uint64_t v27 = 3;
    }
    else {
      uint64_t v27 = 1;
    }
  }
  uint64_t v28 = *(void *)(v26 + 160);
  if (!v28)
  {
    if (*(unsigned char *)(v26 + 14)) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 3;
    }
  }
LABEL_22:
  uint64_t v254 = 0;
  int v255 = &v254;
  uint64_t v256 = 0x2020000000;
  uint64_t v257 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v250 = 0;
  uint64_t v251 = &v250;
  uint64_t v252 = 0x2020000000;
  uint64_t v253 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v246 = 0;
  long long v247 = &v246;
  uint64_t v248 = 0x2020000000;
  char v249 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v261 = __Block_byref_object_copy__4;
  char v262 = __Block_byref_object_dispose__4;
  id v263 = 0;
  uint64_t v123 = (char *)v18;
  uint64_t v124 = a1;
  if (self)
  {
    id v29 = objc_getProperty(self, v25, 40, 1);
    id v107 = objc_getProperty(self, v30, 48, 1);
    id Property = objc_getProperty(self, v31, 56, 1);
    uint64_t v106 = v29;
    uint64_t v33 = v23;
  }
  else
  {
    uint64_t v33 = v23;
    uint64_t v106 = 0;
    id v107 = 0;
    id Property = 0;
  }
  id v34 = Property;
  uint64_t v240 = 0;
  unint64_t v241 = &v240;
  uint64_t v242 = 0x3032000000;
  unint64_t v243 = __Block_byref_object_copy__4;
  id v244 = __Block_byref_object_dispose__4;
  id v245 = 0;
  uint64_t v236 = 0;
  long long v237 = &v236;
  uint64_t v238 = 0x2020000000;
  char v239 = 0;
  uint64_t v232 = 0;
  long long v233 = &v232;
  uint64_t v234 = 0x2020000000;
  uint64_t v235 = 0;
  uint64_t v228 = 0;
  long long v229 = &v228;
  uint64_t v230 = 0x2020000000;
  char v231 = 0;
  uint64_t v224 = 0;
  uint64_t v225 = &v224;
  uint64_t v226 = 0x2020000000;
  int v227 = -1;
  uint64_t v220 = 0;
  id v221 = &v220;
  uint64_t v222 = 0x2020000000;
  int v223 = -1;
  uint64_t v216 = 0;
  uint64_t v217 = &v216;
  uint64_t v218 = 0x2020000000;
  int v219 = -1;
  uint64_t v212 = 0;
  uint64_t v213 = &v212;
  uint64_t v214 = 0x2020000000;
  int v215 = -1;
  uint64_t v208 = 0;
  int v209 = &v208;
  uint64_t v210 = 0x2020000000;
  uint64_t v211 = 0;
  uint64_t v204 = 0;
  uint64_t v205 = &v204;
  uint64_t v206 = 0x2020000000;
  uint64_t v207 = 0;
  uint64_t v200 = 0;
  uint64_t v201 = &v200;
  uint64_t v202 = 0x2020000000;
  uint64_t v203 = 0;
  uint64_t v196 = 0;
  uint64_t v197 = &v196;
  uint64_t v198 = 0x2020000000;
  uint64_t v199 = 0;
  uint64_t v192 = 0;
  uint64_t v193 = &v192;
  uint64_t v194 = 0x2020000000;
  uint64_t v195 = 0;
  v191[0] = 0;
  v191[1] = v191;
  v191[2] = 0x2020000000;
  v191[3] = 0;
  v189[0] = 0;
  v189[1] = v189;
  v189[2] = 0x3032000000;
  v189[3] = __Block_byref_object_copy__4;
  v189[4] = __Block_byref_object_dispose__4;
  id v190 = 0;
  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x3032000000;
  v187[3] = __Block_byref_object_copy__4;
  v187[4] = __Block_byref_object_dispose__4;
  id v188 = 0;
  uint64_t v183 = 0;
  uint64_t v184 = &v183;
  uint64_t v185 = 0x2020000000;
  uint64_t v186 = 0;
  v181[0] = 0;
  v181[1] = v181;
  v181[2] = 0x2020000000;
  char v182 = 1;
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke;
  v139[3] = &unk_1E63F9960;
  uint64_t v105 = (uint64_t)v16;
  id v119 = v16;
  id v140 = v119;
  uint64_t v141 = v124;
  uint64_t v118 = v33;
  int v142 = v118;
  uint64_t v148 = &v228;
  int v172 = v109;
  int v173 = v110;
  char v174 = v113;
  char v175 = v116;
  char v176 = v8;
  char v177 = v120;
  char v178 = v112;
  char v179 = v111;
  char v180 = v108;
  uint64_t v170 = v28;
  uint64_t v171 = v27;
  uint64_t v117 = v20;
  uint64_t v143 = v117;
  uint64_t v149 = v181;
  BOOL v150 = &v246;
  id v35 = v123;
  uint64_t v144 = v35;
  id v114 = v34;
  id v145 = v114;
  id v122 = v106;
  id v146 = v122;
  id v121 = v107;
  id v147 = v121;
  unint64_t v151 = &v254;
  unint64_t v152 = buf;
  int v153 = &v250;
  uint64_t v154 = &v236;
  id v155 = &v240;
  uint64_t v156 = &v232;
  uint64_t v157 = &v224;
  uint64_t v158 = &v220;
  long long v159 = &v216;
  uint64_t v160 = &v212;
  uint64_t v161 = &v208;
  char v162 = &v204;
  uint64_t v163 = &v200;
  int v164 = v191;
  int v165 = v189;
  int v166 = v187;
  uint64_t v167 = &v196;
  uint64_t v168 = &v192;
  char v169 = &v183;
  uint64_t v36 = (void (**)(void, void, void, void))MEMORY[0x1C18A6C80](v139);
  id v37 = v36;
  if (v16)
  {
    uint64_t v38 = *(void **)(v124 + 32);
    id v39 = *(void **)(v124 + 40);
    unint64_t v40 = *(void *)(v124 + 48);
    unint64_t v41 = *(void *)(v124 + 56);
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke_2;
    v137[3] = &unk_1E63F9CD8;
    uint64_t v138 = v36;
    -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]((uint64_t)v119, v38, v40, v39, v41, 0, v137);
    long long v42 = v138;
  }
  else if (v20)
  {
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v42 = v117;
    uint64_t v51 = [v42 countByEnumeratingWithState:&v133 objects:v259 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v134;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v134 != v52) {
            objc_enumerationMutation(v42);
          }
          uint64_t v54 = *(void **)(*((void *)&v133 + 1) + 8 * i);
          id v55 = [v54 thread];
          id v56 = [v54 threadState];
          ((void (**)(void, void *, void *, uint64_t))v37)[2](v37, v55, v56, [v54 threadStateIndex]);
        }
        uint64_t v51 = [v42 countByEnumeratingWithState:&v133 objects:v259 count:16];
      }
      while (v51);
    }
  }
  else if (v115)
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v42 = v115;
    uint64_t v57 = [v42 countByEnumeratingWithState:&v129 objects:v258 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v130;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v130 != v58) {
            objc_enumerationMutation(v42);
          }
          uint64_t v60 = [*(id *)(*((void *)&v129 + 1) + 8 * j) unsignedLongValue];
          id v61 = [v35 threadStates];
          id v62 = [v61 objectAtIndexedSubscript:v60];
          ((void (**)(void, char *, void *, uint64_t))v37)[2](v37, v35, v62, v60);
        }
        uint64_t v57 = [v42 countByEnumeratingWithState:&v129 objects:v258 count:16];
      }
      while (v57);
    }
  }
  else
  {
    uint64_t v84 = *(void *)(v124 + 32);
    uint64_t v85 = *(void *)(v124 + 40);
    uint64_t v86 = *(void *)(v124 + 48);
    uint64_t v87 = *(void *)(v124 + 56);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke_3;
    v126[3] = &unk_1E63F9988;
    unint64_t v128 = v36;
    unint64_t v127 = v35;
    [v127 enumerateThreadStatesBetweenStartTime:v84 startSampleIndex:v86 endTime:v85 endSampleIndex:v87 reverseOrder:0 block:v126];

    long long v42 = v128;
  }

  unint64_t v43 = v255[3];
  uint64_t v44 = v124;
  if (v43 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v43 <= *(void *)(v124 + 48)) {
      unint64_t v43 = *(void *)(v124 + 48);
    }
    v255[3] = v43;
  }
  unint64_t v45 = v251[3];
  uint64_t v46 = v105;
  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v47 = *(void *)(v124 + 56);
    if (v45 < v47) {
      unint64_t v47 = v251[3];
    }
    v251[3] = v47;
  }
  if (self) {
    *((void *)self + 4) = v233[3];
  }
  if (v123 && [*(id *)(v124 + 160) targetThreadId])
  {
    uint64_t v48 = [v35 threadId];
    uint64_t v49 = [*(id *)(v124 + 160) targetThreadId];
    if (!v105 || v48 == v49)
    {
      if (v48 == v49) {
        goto LABEL_77;
      }
      goto LABEL_65;
    }
  }
  else if (!v105)
  {
    goto LABEL_65;
  }
  if ([*(id *)(v124 + 160) targetDispatchQueueId])
  {
    id v50 = [*(id *)(v124 + 160) targetProcess];
    if (v50 == v118)
    {
      uint64_t v63 = [v119 identifier];
      uint64_t v46 = v63 == [*(id *)(v124 + 160) targetDispatchQueueId];

      uint64_t v44 = v124;
      if (v46) {
        goto LABEL_77;
      }
    }
    else
    {

      uint64_t v44 = v124;
    }
  }
LABEL_65:
  if (v233[3] || *((unsigned char *)v229 + 24) && ([*(id *)(v44 + 16) displayCallTreesWithZeroCount] & 1) != 0)
  {
    if ([*(id *)(v44 + 16) omitStacksBelowSampleCount] < 1) {
      unint64_t v64 = 0;
    }
    else {
      unint64_t v64 = [*(id *)(v44 + 16) omitStacksBelowSampleCount];
    }
    if ((int)[*(id *)(v44 + 16) omitStacksBelowPercentOfTaskSamples] >= 1)
    {
      int v65 = [*(id *)(v44 + 16) omitStacksBelowPercentOfTaskSamples];
      if (v64 <= v65 * v103 / 0x64uLL) {
        unint64_t v64 = v65 * v103 / 0x64uLL;
      }
    }
    if (!v64 || v233[3] > v64)
    {
LABEL_77:
      if ([v122 count] == 1)
      {
        uint64_t v66 = [v122 firstObject];
        uint64_t v67 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v46 = v66 == v67;

        uint64_t v44 = v124;
        if (v46) {
          [v122 removeAllObjects];
        }
      }
      if ([v121 count] == 1)
      {
        id v69 = [v121 firstObject];
        id v70 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v46 = v69 == v70;

        uint64_t v44 = v124;
        if (v46) {
          [v121 removeAllObjects];
        }
      }
      uint64_t v71 = *(void **)(*(void *)&buf[8] + 40);
      if (!v71)
      {
        double v74 = 0;
LABEL_112:
        if (self)
        {
          *((unsigned char *)self + 11) = *((unsigned char *)v247 + 24);
          objc_setProperty_atomic(self, v68, (id)v241[5], 64);
          *((unsigned char *)self + 12) = *((unsigned char *)v237 + 24);
          *((void *)self + 4) = v233[3];
          *((void *)self + 9) = v255[3];
          *((void *)self + 10) = v251[3];
          objc_setProperty_atomic(self, v88, v74, 88);
          *((_DWORD *)self + 4) = *((_DWORD *)v225 + 6);
          *((_DWORD *)self + 5) = *((_DWORD *)v221 + 6);
          *((_DWORD *)self + 6) = *((_DWORD *)v217 + 6);
          *((_DWORD *)self + 7) = *((_DWORD *)v213 + 6);
          *((void *)self + 12) = v209[3];
          *((void *)self + 13) = v205[3];
          *((void *)self + 14) = v201[3];
        }
        char v89 = [v35 isProcessorIdleThread];
        if (self) {
          *((unsigned char *)self + 13) = v89;
        }
        char v90 = [v35 isGlobalForcedIdle];
        if (self)
        {
          *((unsigned char *)self + 14) = v90;
          *((void *)self + 17) = v197[3];
          *((void *)self + 18) = v193[3];
          *((void *)self + 19) = v184[3];
        }

        goto LABEL_119;
      }
      id v72 = v71;
      double v73 = [*(id *)(v44 + 160) timeWhenTransitionedToSamplingAllThreads];
      if (v73)
      {
      }
      else
      {
        double v75 = [*(id *)(v124 + 160) timeWhenTransitionedToSamplingAllProcesses];
        uint64_t v46 = v75 == 0;

        if (v46)
        {
          double v74 = 0;
LABEL_111:

          goto LABEL_112;
        }
      }
      if (-[SASamplePrinter hasTimeIndexes](v124)) {
        uint64_t v76 = 0;
      }
      else {
        uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
      }
      long long v77 = [v72 firstThreadStateOnOrAfterTime:0 sampleIndex:v76];
      if (!v77) {
        goto LABEL_109;
      }
      if (!-[SASamplePrinter hasTimeIndexes](v124)
        || (unint64_t)[v77 startSampleIndex] <= *(void *)(v124 + 48))
      {
        if (-[SASamplePrinter hasTimeIndexes](v124)) {
          goto LABEL_109;
        }
        id v78 = [v77 startTimestamp];
        int v79 = [v78 gt:*(void *)(v124 + 32)];

        if (!v79) {
          goto LABEL_109;
        }
      }
      uint64_t v80 = [v72 creationTimestamp];
      if (!v80)
      {
LABEL_124:
        double v74 = [v77 startTimestamp];
        goto LABEL_110;
      }
      BOOL v81 = -[SASamplePrinter hasTimeIndexes](v124);
      if (v81)
      {
        uint64_t v82 = *(void **)(v124 + 160);
        uint64_t v46 = [v72 creationTimestamp];
        unint64_t v83 = [v82 indexOfFirstSampleOnOrAfterTimestamp:v46];
        if (v83 < [v77 startSampleIndex])
        {

          goto LABEL_124;
        }
        if (-[SASamplePrinter hasTimeIndexes](v124))
        {

          goto LABEL_108;
        }
      }
      else if (-[SASamplePrinter hasTimeIndexes](v124))
      {
LABEL_108:

        goto LABEL_109;
      }
      uint64_t v91 = [v72 creationTimestamp];
      uint64_t v92 = [v77 startTimestamp];
      int v93 = [v91 lt:v92];

      if (v81)
      {

        if (v93) {
          goto LABEL_124;
        }
      }
      else
      {

        if (v93) {
          goto LABEL_124;
        }
      }
LABEL_109:
      double v74 = 0;
LABEL_110:

      goto LABEL_111;
    }
  }
  if (self) {
    *((unsigned char *)self + 8) = 1;
  }
LABEL_119:

  _Block_object_dispose(v181, 8);
  _Block_object_dispose(&v183, 8);
  _Block_object_dispose(v187, 8);

  _Block_object_dispose(v189, 8);
  _Block_object_dispose(v191, 8);
  _Block_object_dispose(&v192, 8);
  _Block_object_dispose(&v196, 8);
  _Block_object_dispose(&v200, 8);
  _Block_object_dispose(&v204, 8);
  _Block_object_dispose(&v208, 8);
  _Block_object_dispose(&v212, 8);
  _Block_object_dispose(&v216, 8);
  _Block_object_dispose(&v220, 8);
  _Block_object_dispose(&v224, 8);
  _Block_object_dispose(&v228, 8);
  _Block_object_dispose(&v232, 8);
  _Block_object_dispose(&v236, 8);
  _Block_object_dispose(&v240, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v246, 8);
  _Block_object_dispose(&v250, 8);
  _Block_object_dispose(&v254, 8);
}

void __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  if ([*(id *)(*(void *)(a1 + 40) + 160) targetDispatchQueueId])
  {
    BOOL v10 = *(void **)(a1 + 48);
    uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 160) targetProcess];
    if (v10 == v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) identifier];
      uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 160) targetDispatchQueueId];

      if (v12 == v13)
      {
        if (![*(id *)(*(void *)(a1 + 40) + 160) targetThreadId]) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  if ([v8 isMainThread]) {
    goto LABEL_139;
  }
LABEL_9:
  uint64_t v14 = [v8 threadId];
  if (v14 == [*(id *)(*(void *)(a1 + 40) + 160) targetThreadId]) {
    goto LABEL_139;
  }
LABEL_10:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
  int v15 = *(_DWORD *)(a1 + 288);
  if (v15 && v15 < (int)[v9 basePriority]) {
    goto LABEL_139;
  }
  int v16 = *(_DWORD *)(a1 + 292);
  if (v16)
  {
    if (v16 > (int)[v9 basePriority]) {
      goto LABEL_139;
    }
  }
  if (*(unsigned char *)(a1 + 296)
    && [v9 isBatteryAndUserActivityValid]
    && ([v9 isUserActive] & 1) != 0)
  {
    goto LABEL_139;
  }
  if (*(unsigned char *)(a1 + 297)
    && [v9 isBatteryAndUserActivityValid]
    && ![v9 isUserActive])
  {
    goto LABEL_139;
  }
  if (*(unsigned char *)(a1 + 298)
    && [v9 isBatteryAndUserActivityValid]
    && ![v9 isOnBattery])
  {
    goto LABEL_139;
  }
  if (*(unsigned char *)(a1 + 299)
    && [v9 isBatteryAndUserActivityValid]
    && ([v9 isOnBattery] & 1) != 0)
  {
    goto LABEL_139;
  }
  if (*(unsigned char *)(a1 + 300) || *(unsigned char *)(a1 + 301))
  {
    if ([v9 isRunning])
    {
      int v17 = (const char *)[v9 cpuNum];
      if (v17 != -1)
      {
        id v18 = v17;
        if (*(unsigned char *)(a1 + 300))
        {
          if ((-[SASampleStore clusterFlagsForCPUNum:](*(void **)(*(void *)(a1 + 40) + 160), v17) & 2) != 0) {
            goto LABEL_139;
          }
        }
        if (*(unsigned char *)(a1 + 301)
          && (-[SASampleStore clusterFlagsForCPUNum:](*(void **)(*(void *)(a1 + 40) + 160), v18) & 1) != 0)
        {
          goto LABEL_139;
        }
      }
    }
  }
  if ([v9 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)[v9 startSampleIndex] > *(void *)(*(void *)(a1 + 40) + 56))
  {
    goto LABEL_139;
  }
  if ([v9 endSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)[v9 endSampleIndex] < *(void *)(*(void *)(a1 + 40) + 48))
  {
    goto LABEL_139;
  }
  if (!*(unsigned char *)(a1 + 302) && *(void *)(a1 + 272) != 1 && *(void *)(a1 + 280) != 3 && !*(void *)(a1 + 56))
  {
    if ([v9 hasSwiftTask])
    {
      if (([v8 isMainThread] & 1) == 0)
      {
        uint64_t v19 = [v8 threadId];
        if (v19 != [*(id *)(*(void *)(a1 + 40) + 160) targetThreadId]) {
          goto LABEL_139;
        }
      }
    }
  }
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = *(void **)(a1 + 48);
  id v22 = [v9 dispatchQueue];
  LODWORD(v20) = -[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](v20, v21, v8, v22);

  if (!v20) {
    goto LABEL_139;
  }
  if (!*(void *)(a1 + 32)
    && !*(void *)(a1 + 56)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
    && [v9 isIdleWorkQueue])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
  }
  if (!*(void *)(a1 + 64))
  {
    uint64_t v23 = *(void **)(a1 + 72);
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "threadId"));
    LOBYTE(v23) = [v23 containsObject:v24];

    if ((v23 & 1) == 0)
    {
      unint64_t v25 = *(void **)(a1 + 72);
      uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "threadId"));
      [v25 addObject:v26];
    }
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v27 = [v9 dispatchQueue];
    uint64_t v28 = *(void **)(a1 + 80);
    if (v27)
    {
      if (([*(id *)(a1 + 80) containsObject:v27] & 1) == 0) {
        [*(id *)(a1 + 80) addObject:v27];
      }
    }
    else
    {
      id v29 = [MEMORY[0x1E4F1CA98] null];
      char v30 = [v28 containsObject:v29];

      if ((v30 & 1) == 0)
      {
        SEL v31 = *(void **)(a1 + 80);
        uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
        [v31 addObject:v32];
      }
    }
  }
  uint64_t v33 = [v9 swiftTask];
  id v34 = *(void **)(a1 + 88);
  if (v33)
  {
    if (([*(id *)(a1 + 88) containsObject:v33] & 1) == 0) {
      [*(id *)(a1 + 88) addObject:v33];
    }
  }
  else
  {
    id v35 = [MEMORY[0x1E4F1CA98] null];
    char v36 = [v34 containsObject:v35];

    if ((v36 & 1) == 0)
    {
      id v37 = *(void **)(a1 + 88);
      uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
      [v37 addObject:v38];
    }
  }
  if ([v9 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    if (v39 == 0x7FFFFFFFFFFFFFFFLL || v39 > [v9 startSampleIndex])
    {
      *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = [v9 startSampleIndex];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), a2);
    }
    unint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
    if (v40 == 0x7FFFFFFFFFFFFFFFLL || v40 < [v9 endSampleIndex]) {
      *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [v9 endSampleIndex];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24)) {
    goto LABEL_84;
  }
  unint64_t v41 = [v9 name];

  uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40);
  if (!v41)
  {
    if (!v42) {
      goto LABEL_84;
    }
    goto LABEL_82;
  }
  unint64_t v43 = [v9 name];
  uint64_t v44 = v43;
  uint64_t v45 = *(void *)(*(void *)(a1 + 152) + 8);
  uint64_t v46 = *(void **)(v45 + 40);
  if (!v42)
  {
    *(void *)(v45 + 40) = v43;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
      goto LABEL_84;
    }
    goto LABEL_82;
  }
  if (v43 == v46)
  {

    goto LABEL_84;
  }
  unint64_t v47 = [v9 name];
  char v48 = [v47 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];

  if ((v48 & 1) == 0) {
LABEL_82:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = 1;
LABEL_84:
  *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) += [v9 sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 40) + 48) end:*(void *)(*(void *)(a1 + 40) + 56)];
  if ([*(id *)(*(void *)(a1 + 40) + 160) dataSource] != 8
    || [*(id *)(*(void *)(a1 + 40) + 160) haveKPerfSched])
  {
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) & 0x80000000) != 0
      || (int)[v9 scheduledPriority] < *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = [v9 scheduledPriority];
    }
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) & 0x80000000) != 0
      || (int)[v9 scheduledPriority] > *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = [v9 scheduledPriority];
    }
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24) & 0x80000000) != 0
      || (int)[v9 basePriority] < *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 184) + 8) + 24) = [v9 basePriority];
    }
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) & 0x80000000) != 0
      || (int)[v9 basePriority] > *(_DWORD *)(*(void *)(*(void *)(a1 + 192) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = [v9 basePriority];
    }
    id v104 = 0;
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    [(SAThread *)v8 cpuTimeForThreadStateIndex:*(void **)(*(void *)(a1 + 40) + 32) inTimestampRangeStart:*(void **)(*(void *)(a1 + 40) + 40) end:&v104];
    uint64_t v49 = v105;
    *(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 24) += v104;
    *(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 24) += v49;
    *(void *)(*(void *)(*(void *)(a1 + 216) + 8) + 24) += v106;
  }
  uint64_t v103 = 0;
  id v104 = 0;
  uint64_t v102 = 0;
  uint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24);
  if (v50 != [v8 threadId])
  {
    *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = [v8 threadId];
    id Property = *(id *)(*(void *)(a1 + 40) + 160);
    if (Property) {
      id Property = objc_getProperty(Property, v51, 968, 1);
    }
    id v53 = Property;
    uint64_t v54 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24)];
    id v55 = [v53 objectForKeyedSubscript:v54];
    uint64_t v56 = [v55 objectEnumerator];
    uint64_t v57 = *(void *)(*(void *)(a1 + 232) + 8);
    uint64_t v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

    uint64_t v59 = [*(id *)(*(void *)(*(void *)(a1 + 232) + 8) + 40) nextObject];
    uint64_t v60 = *(void *)(*(void *)(a1 + 240) + 8);
    id v61 = *(void **)(v60 + 40);
    *(void *)(v60 + 40) = v59;
  }
  id v62 = *(void **)(*(void *)(*(void *)(a1 + 240) + 8) + 40);
  if (v62)
  {
    uint64_t v63 = -[SASamplePrinter _findIOBefore:during:after:thread:stateIndex:inIO:nextIO:](*(void *)(a1 + 40), &v104, &v103, &v102, v8, a4, *(void **)(*(void *)(*(void *)(a1 + 232) + 8) + 40), v62);
    uint64_t v64 = *(void *)(*(void *)(a1 + 240) + 8);
    int v65 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v63;

    uint64_t v66 = v104;
  }
  else
  {
    uint64_t v66 = 0;
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v67 = v66;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v98 objects:v109 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v99 != v70) {
          objc_enumerationMutation(v67);
        }
        *(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) += [*(id *)(*((void *)&v98 + 1) + 8 * i) size];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v98 objects:v109 count:16];
    }
    while (v69);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v72 = v103;
  uint64_t v73 = [v72 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v74; ++j)
      {
        if (*(void *)v95 != v75) {
          objc_enumerationMutation(v72);
        }
        *(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) += [*(id *)(*((void *)&v94 + 1) + 8 * j) size];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v74);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v77 = v102;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v90 objects:v107 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v91;
    do
    {
      for (uint64_t k = 0; k != v79; ++k)
      {
        if (*(void *)v91 != v80) {
          objc_enumerationMutation(v77);
        }
        *(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 24) += objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * k), "size", (void)v90);
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v90 objects:v107 count:16];
    }
    while (v79);
  }

  uint64_t v82 = [v67 count];
  uint64_t v83 = [v72 count] + v82;
  *(void *)(*(void *)(*(void *)(a1 + 256) + 8) + 24) += v83 + [v77 count];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
  {
    if ([v9 isRunnable])
    {
      if (([v9 isRunning] & 1) == 0)
      {
        uint64_t v84 = [v9 timestampLastMadeRunnable];

        if (v84)
        {
          uint64_t v85 = [v9 startTimestamp];
          if ([v85 gt:*(void *)(*(void *)(a1 + 40) + 32)])
          {
            id v86 = [v9 startTimestamp];
          }
          else
          {
            id v86 = *(id *)(*(void *)(a1 + 40) + 32);
          }

          if (v86)
          {
            uint64_t v87 = [v9 timestampLastMadeRunnable];
            [v87 deltaSecondsTo:v86 timeDomainPriorityList:&unk_1F1A9B160 timeDomainUsed:0];
            *(void *)(*(void *)(*(void *)(a1 + 264) + 8) + 24) = v88;

            uint64_t v89 = *(void *)(*(void *)(a1 + 264) + 8);
            if (*(double *)(v89 + 24) < 0.0) {
              *(void *)(v89 + 24) = 0;
            }
          }
        }
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;

LABEL_139:
}

- (id)_findIOBefore:(void *)a3 during:(void *)a4 after:(void *)a5 thread:(unint64_t)a6 stateIndex:(void *)a7 inIO:(void *)a8 nextIO:
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  uint64_t v70 = v17;
  uint64_t v71 = v15;
  if (!a1)
  {
    id v29 = 0;
    goto LABEL_61;
  }
  id v18 = v17;
  id v67 = a2;
  uint64_t v19 = [v15 threadStates];
  uint64_t v20 = [v19 objectAtIndexedSubscript:a6];

  unint64_t v65 = a6;
  if (a6)
  {
    id v21 = [v15 threadStates];
    id v22 = [v21 objectAtIndexedSubscript:a6 - 1];

    uint64_t v23 = [v22 endTimestamp];
    if ([v22 isIdleWorkQueue]) {
      char v24 = 0;
    }
    else {
      char v24 = [v20 isIdleWorkQueue];
    }
  }
  else
  {
    uint64_t v23 = [v15 creationTimestamp];
    char v24 = 0;
  }
  uint64_t v68 = a3;
  uint64_t v69 = a4;
  if (!v23 || *(void *)(a1 + 32) && (objc_msgSend(v23, "lt:") & 1) != 0)
  {
    id v25 = *(id *)(a1 + 32);

    id v26 = v18;
    if (!v25)
    {
      id v29 = v26;
      uint64_t v23 = 0;
LABEL_35:
      char v36 = 0;
      uint64_t v45 = 0;
      id v35 = 0;
      goto LABEL_60;
    }
    int v27 = 0;
    uint64_t v23 = v25;
  }
  else
  {
    id v28 = v18;
    int v27 = 1;
  }
  id v29 = v18;
  while (1)
  {
    if (v27)
    {
      char v30 = [v29 startTimestamp];
      char v31 = [v30 lt:v23];

      if ((v31 & 1) == 0) {
        break;
      }
      goto LABEL_19;
    }
    uint64_t v32 = [v29 endTimestamp];
    int v33 = [v32 le:v23];

    if (!v33) {
      break;
    }
LABEL_19:
    uint64_t v34 = [v16 nextObject];

    id v29 = (void *)v34;
    if (!v34) {
      goto LABEL_35;
    }
  }
  uint64_t v64 = a1;
  id v35 = 0;
  char v36 = 0;
  while (1)
  {
    id v37 = [v29 startTimestamp];
    uint64_t v38 = [v20 endTimestamp];
    int v39 = [v37 lt:v38];

    if (!v39) {
      break;
    }
    unint64_t v40 = [v29 endTimestamp];
    unint64_t v41 = [v20 startTimestamp];
    int v42 = [v40 le:v41];

    if (!v42)
    {
      if (!v36)
      {
        char v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v29, 0);
        goto LABEL_32;
      }
      unint64_t v43 = v36;
      goto LABEL_29;
    }
    if ((v24 & 1) == 0)
    {
      if (!v35)
      {
        id v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v29, 0);
        goto LABEL_32;
      }
      unint64_t v43 = v35;
LABEL_29:
      [v43 addObject:v29];
    }
LABEL_32:
    uint64_t v44 = [v16 nextObject];

    id v29 = (void *)v44;
    if (!v44) {
      goto LABEL_33;
    }
  }
  uint64_t v46 = [v71 threadStates];
  unint64_t v47 = [v46 count] - 1;

  if (v47 <= v65)
  {
    uint64_t v50 = [v71 exitTimestamp];
    uint64_t v51 = v64;
    goto LABEL_41;
  }
  char v48 = [v71 threadStates];
  uint64_t v49 = [v48 objectAtIndexedSubscript:v65 + 1];

  uint64_t v50 = [v49 startTimestamp];
  uint64_t v51 = v64;
  if (([v20 isIdleWorkQueue] & 1) != 0 || (objc_msgSend(v49, "isIdleWorkQueue") & 1) == 0)
  {
    uint64_t v45 = 0;
LABEL_46:

LABEL_59:
  }
  else
  {

LABEL_41:
    if (v50 && ![v50 gt:*(void *)(v51 + 40)])
    {
      int v66 = 1;
      goto LABEL_48;
    }
    id v52 = *(id *)(v51 + 40);

    if (v52)
    {
      int v66 = 0;
      uint64_t v50 = v52;
LABEL_48:
      uint64_t v45 = 0;
      id v53 = v50;
      while (1)
      {
        if (v66)
        {
          uint64_t v49 = [v29 endTimestamp];
          if (![v49 le:v50]) {
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v54 = [v29 startTimestamp];
          int v55 = [v54 lt:v50];

          if (!v55)
          {
            uint64_t v50 = v53;
            goto LABEL_59;
          }
        }
        if (v45) {
          [v45 addObject:v29];
        }
        else {
          uint64_t v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v29, 0);
        }
        uint64_t v50 = v53;
        uint64_t v56 = [v16 nextObject];

        id v29 = (void *)v56;
        if (!v56) {
          goto LABEL_59;
        }
      }
    }
LABEL_33:
    uint64_t v45 = 0;
  }
LABEL_60:
  uint64_t v57 = *v67;
  *id v67 = v35;
  id v58 = v35;

  uint64_t v59 = *v68;
  const char *v68 = v36;
  id v60 = v36;

  id v61 = *v69;
  *uint64_t v69 = v45;
  id v62 = v45;

LABEL_61:
  return v29;
}

void __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 thread];
  BOOL v4 = [v3 threadState];
  uint64_t v5 = [v3 threadStateIndex];

  (*(void (**)(uint64_t, id, void *, uint64_t))(v2 + 16))(v2, v6, v4, v5);
}

uint64_t __123__SASamplePrinter_addHeaderForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_toStack_task_taskSampleCount___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (void)iterateDispatchQueue:(void *)a3 orSwiftTaskStates:(void *)a4 orThread:(void *)a5 threadStateIndexes:(unint64_t)a6 startingAtIndex:(void *)a7 endingAfterTimestamp:(void *)a8 task:(char)a9 stopAtTimeJumps:(void *)a10 callback:
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v110 = a5;
  id v117 = a7;
  id v20 = a8;
  uint64_t v115 = a10;
  char v112 = v18;
  if (v18 || v17 || !v19)
  {
    if (!v18 && v17 && !v19)
    {
      id v22 = [v17 states];
      goto LABEL_10;
    }
    if (!v18 || v17 || v19) {
      goto LABEL_122;
    }
    id v21 = v18;
  }
  else
  {
    id v21 = v110;
    if (!v110)
    {
      id v22 = [v19 threadStates];
LABEL_10:
      uint64_t v23 = v22;
      unint64_t v24 = [v22 count];

      goto LABEL_16;
    }
  }
  unint64_t v24 = [v21 count];
LABEL_16:
  if (v24 > a6)
  {
    char v108 = v19;
    unint64_t v109 = 0;
    unint64_t v25 = 0;
    id v26 = 0;
    int v121 = 0;
    char v111 = 1;
    unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    id v113 = v17;
    unint64_t v114 = v24;
    while (1)
    {
      context = (void *)MEMORY[0x1C18A6A20]();
      if (v17) {
        break;
      }
      if (v112)
      {
        id v29 = [v112 objectAtIndexedSubscript:a6];
        id v30 = [v29 thread];
LABEL_25:
        uint64_t v32 = [v29 threadStateIndex];
        goto LABEL_26;
      }
      id v30 = v108;
      if (!v110)
      {
        uint64_t v119 = a6;
        goto LABEL_27;
      }
      id v29 = [v110 objectAtIndexedSubscript:a6];
      uint64_t v32 = [v29 unsignedLongValue];
LABEL_26:
      uint64_t v119 = v32;

LABEL_27:
      int v33 = [v30 threadStates];
      id v29 = [v33 objectAtIndexedSubscript:v119];

      unint64_t v34 = [v29 startSampleIndex];
      id v120 = v30;
      id v122 = v29;
      if (-[SASamplePrinter hasTimeIndexes](a1))
      {
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v17 = 0;
          goto LABEL_111;
        }
        if (v34 <= *(void *)(a1 + 48)) {
          unint64_t v34 = *(void *)(a1 + 48);
        }
        id v35 = [*(id *)(a1 + 160) sampleTimestamps];
        id v17 = [v35 objectAtIndexedSubscript:v34];

        id v29 = v122;
      }
      else
      {
        id v17 = [v29 startTimestamp];
      }
      unint64_t v36 = v27;
      unint64_t v118 = a6;
      id v37 = [v29 endTimestamp];
      if (![v17 le:v37])
      {
        int v77 = v121;
        id v67 = v17;
        goto LABEL_102;
      }
      do
      {
        int v38 = [v17 le:v117];

        if (!v38) {
          goto LABEL_103;
        }
        unint64_t v27 = v36;
        if (!v20) {
          goto LABEL_47;
        }
        int v39 = [v20 taskStates];
        uint64_t v40 = [v39 count];

        if (!v40) {
          goto LABEL_47;
        }
        if (v26)
        {
          unint64_t v41 = [v26 endTimestamp];
          int v42 = [v41 lt:v17];

          if (!v42) {
            goto LABEL_47;
          }
        }

        unint64_t v43 = v25 + ((v111 & 1) == 0);
        uint64_t v44 = [v20 taskStates];
        unint64_t v45 = [v44 count];

        if (v43 >= v45)
        {
          id v26 = 0;
LABEL_47:
          id v29 = v122;
          goto LABEL_48;
        }
        while (1)
        {
          uint64_t v46 = [v20 taskStates];
          id v26 = [v46 objectAtIndexedSubscript:v43];

          if (!-[SASamplePrinter hasTimeIndexes](a1) || [v26 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v47 = [v26 endTimestamp];
            int v48 = [v47 ge:v17];

            if (v48) {
              break;
            }
          }

          ++v43;
          uint64_t v49 = [v20 taskStates];
          unint64_t v50 = [v49 count];

          if (v43 >= v50)
          {
            id v26 = 0;
            char v111 = 0;
            unint64_t v27 = v36;
            goto LABEL_47;
          }
        }
        uint64_t v78 = [v26 startTimestamp];
        char v79 = [v78 le:v17];

        id v29 = v122;
        if ((v79 & 1) == 0)
        {
          int v80 = *__error();
          BOOL v81 = _sa_logt();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            uint64_t v82 = [v26 startTimestamp];
            id v83 = [v82 debugDescription];
            uint64_t v84 = [v83 UTF8String];
            id v85 = [v17 debugDescription];
            uint64_t v86 = [v85 UTF8String];
            *(_DWORD *)long long buf = 136315394;
            uint64_t v124 = v84;
            __int16 v125 = 2080;
            uint64_t v126 = v86;
            _os_log_error_impl(&dword_1BF22B000, v81, OS_LOG_TYPE_ERROR, "tempTaskState.startTimestamp %s > timestamp %s", buf, 0x16u);
          }
          *__error() = v80;
          uint64_t v87 = [v26 startTimestamp];
          id v88 = [v87 debugDescription];
          char v89 = [v88 UTF8String];
          id v19 = [v17 debugDescription];
          [v19 UTF8String];
          _SASetCrashLogMessage(9637, "tempTaskState.startTimestamp %s > timestamp %s", v90, v91, v92, v93, v94, v95, v89);

          _os_crash();
          __break(1u);
LABEL_122:
          int v96 = *__error();
          long long v97 = _sa_logt();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            if (v19) {
              long long v98 = "y";
            }
            else {
              long long v98 = "n";
            }
            if (v17) {
              long long v99 = "y";
            }
            else {
              long long v99 = "n";
            }
            *(_DWORD *)long long buf = 136315650;
            uint64_t v124 = (uint64_t)v98;
            __int16 v125 = 2080;
            uint64_t v126 = (uint64_t)v99;
            if (v112) {
              long long v100 = "y";
            }
            else {
              long long v100 = "n";
            }
            __int16 v127 = 2080;
            unint64_t v128 = v100;
            _os_log_error_impl(&dword_1BF22B000, v97, OS_LOG_TYPE_ERROR, "thread %s, dispatchQueue %s, swiftTaskStates %s", buf, 0x20u);
          }
          else if (v19)
          {
            long long v98 = "y";
          }
          else
          {
            long long v98 = "n";
          }

          *__error() = v96;
          _SASetCrashLogMessage(9560, "thread %s, dispatchQueue %s, swiftTaskStates %s", v101, v102, v103, v104, v105, v106, (char)v98);
          _os_crash();
          __break(1u);
        }
        char v111 = 0;
        unint64_t v25 = v43;
        unint64_t v27 = v36;
LABEL_48:
        buf[0] = 0;
        BOOL v52 = v27 != 0x7FFFFFFFFFFFFFFFLL && v27 == v34;
        LOBYTE(v107) = v121;
        a6 = v118;
        id v30 = v120;
        v115[2](v115, v118, v34, v26, v120, v119, v29, v52, v107, buf);
        if (buf[0]) {
          goto LABEL_116;
        }
        if (a9 && *(void *)(a1 + 96))
        {
          BOOL v53 = -[SASamplePrinter hasTimeIndexes](a1);
          BOOL v54 = v27 != 0x7FFFFFFFFFFFFFFFLL && v27 > v34;
          BOOL v55 = v54;
          if (v53 && !v55)
          {
            unint64_t v56 = v109;
            if (v109 < [*(id *)(a1 + 96) count])
            {
              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v57 = [*(id *)(a1 + 96) objectAtIndexedSubscript:v109];
                uint64_t v58 = [v57 unsignedLongValue];

                unint64_t v27 = v58;
                unint64_t v56 = v109;
              }
              if (v27 <= v34)
              {
                do
                {
                  if (++v56 >= [*(id *)(a1 + 96) count]) {
                    break;
                  }
                  uint64_t v59 = [*(id *)(a1 + 96) objectAtIndexedSubscript:v56];
                  unint64_t v60 = [v59 unsignedLongValue];

                  unint64_t v27 = v60;
                }
                while (v60 <= v34);
              }
              unint64_t v109 = v56;
              if (v56 >= [*(id *)(a1 + 96) count]) {
                unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
              }
              id v30 = v120;
            }
          }
        }
        if (!v26) {
          goto LABEL_79;
        }
        if (-[SASamplePrinter hasTimeIndexes](a1))
        {
          unint64_t v61 = [v26 endSampleIndex];
          if (v61 >= [v122 endSampleIndex]) {
            goto LABEL_79;
          }
        }
        if (!-[SASamplePrinter hasTimeIndexes](a1))
        {
          id v62 = [v26 endTimestamp];
          [v122 endTimestamp];
          v64 = unint64_t v63 = v27;
          int v65 = [v62 ge:v64];

          unint64_t v27 = v63;
          id v30 = v120;

          if (v65)
          {
LABEL_79:
            if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v29 = v122;
              if (-[SASamplePrinter hasTimeIndexes](a1) && v27 < [v122 endSampleIndex] + 1)
              {
                int v66 = [*(id *)(a1 + 160) sampleTimestamps];
                id v67 = [v66 objectAtIndexedSubscript:v27];

                id v17 = v66;
                unint64_t v36 = v27;
                unint64_t v34 = v27;
                goto LABEL_97;
              }
              goto LABEL_109;
            }
            unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_108:
            id v29 = v122;
LABEL_109:
            int v121 = 0;
            goto LABEL_110;
          }
        }
        if (v27 != 0x7FFFFFFFFFFFFFFFLL
          && -[SASamplePrinter hasTimeIndexes](a1)
          && v27 < [v26 endSampleIndex] + 1)
        {
          uint64_t v68 = [*(id *)(a1 + 160) sampleTimestamps];
          id v67 = [v68 objectAtIndexedSubscript:v27];

          id v17 = v68;
          unint64_t v36 = v27;
          unint64_t v34 = v27;
          goto LABEL_96;
        }
        unint64_t v36 = v27;
        unint64_t v69 = v25 + 1;
        do
        {
          unint64_t v25 = v69;
          uint64_t v70 = [v20 taskStates];
          unint64_t v71 = [v70 count];

          if (v25 >= v71)
          {

LABEL_107:
            id v26 = 0;
            unint64_t v27 = v36;
            id v30 = v120;
            goto LABEL_108;
          }
          id v72 = [v20 taskStates];
          uint64_t v73 = [v72 objectAtIndexedSubscript:v25];

          if (!-[SASamplePrinter hasTimeIndexes](a1)) {
            break;
          }
          uint64_t v74 = [v73 startSampleIndex];
          unint64_t v69 = v25 + 1;
          id v26 = v73;
        }
        while (v74 == 0x7FFFFFFFFFFFFFFFLL);
        if (!v73) {
          goto LABEL_107;
        }
        uint64_t v75 = [v73 startSampleIndex];
        if (v75 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v67 = [v73 startTimestamp];
          unint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v34 = v75;
          uint64_t v76 = [*(id *)(a1 + 160) sampleTimestamps];
          id v67 = [v76 objectAtIndexedSubscript:v34];

          id v17 = v76;
        }
        id v26 = v73;
LABEL_96:
        id v29 = v122;
LABEL_97:

        id v37 = [v29 endTimestamp];
        int v121 = 0;
        int v77 = 0;
        id v17 = v67;
      }
      while (([v67 le:v37] & 1) != 0);
LABEL_102:

      id v17 = v67;
      int v121 = v77;
LABEL_103:
      a6 = v118;
      unint64_t v27 = v36;
      id v30 = v120;
      id v29 = v122;
LABEL_110:
      if ([v17 gt:v117])
      {
LABEL_116:

        id v17 = v113;
        goto LABEL_117;
      }
LABEL_111:

      id v17 = v113;
LABEL_112:

      if (++a6 == v114)
      {
LABEL_117:

        id v19 = v108;
        goto LABEL_118;
      }
    }
    id v28 = [v17 states];
    id v29 = [v28 objectAtIndexedSubscript:a6];

    id v30 = [v29 thread];
    if (![*(id *)(a1 + 160) targetDispatchQueueId])
    {
      if (([v30 isMainThread] & 1) != 0
        || (uint64_t v31 = [v30 threadId], v31 == objc_msgSend(*(id *)(a1 + 160), "targetThreadId")))
      {
        int v121 = 1;
        goto LABEL_112;
      }
    }
    goto LABEL_25;
  }
LABEL_118:
}

- (id)stateChangeStringForThreadState:(void *)a3 serialDispatchQueue:(void *)a4 swiftTaskStates:(void *)a5 thread:(void *)a6 threadStateIndexes:(void *)a7 taskState:(void *)a8 task:(uint64_t)a9 iteratorIndex:(char)a10 missingStateIsInAnotherStack:(uint64_t)a11 numSamplesOmittedSincePreviousDisplayedSample:(void *)a12 sampleTimestamp:(void *)a13 previousSampleTimestamp:(void *)a14 previousDisplayedTimestamp:(void *)a15 previousTaskState:(void *)a16 previousThread:(void *)a17 previousThreadState:(char)a18 dispatchQueueChanges:(char)a19 swiftTaskChanges:(char)a20 priorityChanges:(char)a21 nameChanges:(char)a22 threadChanges:(char)a23 isTimeJump:(void *)a24 ioEventsSincePreviousThreadState:
{
  uint64_t v377 = *MEMORY[0x1E4F143B8];
  id v351 = a2;
  unint64_t v337 = a3;
  unint64_t v335 = a4;
  id v346 = a5;
  id v334 = a6;
  id v349 = a7;
  id v336 = a8;
  id v343 = a12;
  id v340 = a13;
  id v31 = a14;
  id v348 = a15;
  id v338 = a16;
  id v350 = a17;
  id v342 = a24;
  uint64_t v347 = a1;
  v339 = v31;
  if (!a1)
  {
LABEL_432:
    id v272 = 0;
LABEL_418:

    return v272;
  }
  uint64_t v366 = 0;
  long long v367 = &v366;
  uint64_t v368 = 0x3032000000;
  double v369 = __Block_byref_object_copy__4;
  uint64_t v370 = __Block_byref_object_dispose__4;
  id v371 = 0;
  if (v31 && a23)
  {
    if (!v343 || !v340)
    {
LABEL_426:
      int v288 = *__error();
      unint64_t v289 = _sa_logt();
      if (os_log_type_enabled(v289, OS_LOG_TYPE_ERROR))
      {
        id v290 = [v340 debugDescription];
        a6 = (void *)[v290 UTF8String];
        id v291 = [v343 debugDescription];
        uint64_t v292 = [v291 UTF8String];
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = a6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v292;
        _os_log_error_impl(&dword_1BF22B000, v289, OS_LOG_TYPE_ERROR, "timeJump, but previousSampleTimestamp %s and sampleTimestamp %s", buf, 0x16u);
      }
      *__error() = v288;
      id v293 = [v340 debugDescription];
      unint64_t v50 = [v293 UTF8String];
      id v294 = [v343 debugDescription];
      [v294 UTF8String];
      _SASetCrashLogMessage(9778, "timeJump, but previousSampleTimestamp %s and sampleTimestamp %s", v295, v296, v297, v298, v299, v300, v50);

      _os_crash();
      __break(1u);
LABEL_429:
      LODWORD(v348) = *__error();
      uint64_t v301 = _sa_logt();
      if (os_log_type_enabled(v301, OS_LOG_TYPE_ERROR))
      {
        id v349 = [v338 debugDescription];
        uint64_t v302 = [v349 UTF8String];
        id v303 = [v350 debugDescription];
        uint64_t v304 = [v303 UTF8String];
        id v305 = [v346 debugDescription];
        uint64_t v306 = [v305 UTF8String];
        id v307 = [v351 debugDescription];
        uint64_t v308 = [v307 UTF8String];
        *(_DWORD *)long long buf = 134219266;
        *(void *)&uint8_t buf[4] = a6;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2080;
        uint64_t v373 = (uint64_t (*)(uint64_t, uint64_t))v302;
        *(_WORD *)uint64_t v374 = 2080;
        *(void *)&v374[2] = v304;
        *(_WORD *)&v374[10] = 2080;
        *(void *)&v374[12] = v306;
        __int16 v375 = 2080;
        uint64_t v376 = v308;
        _os_log_error_impl(&dword_1BF22B000, v301, OS_LOG_TYPE_ERROR, "expected index %lu, actual is %lu, previousThread:%s previousThreadState:%s thread:%s threadState:%s", buf, 0x3Eu);
      }
      *__error() = (int)v348;
      id v309 = [v338 debugDescription];
      [v309 UTF8String];
      id v310 = [v350 debugDescription];
      [v310 UTF8String];
      id v311 = [v346 debugDescription];
      [v311 UTF8String];
      id v312 = [v351 debugDescription];
      [v312 UTF8String];
      _SASetCrashLogMessage(9839, "expected index %lu, actual is %lu, previousThread:%s previousThreadState:%s thread:%s threadState:%s", v313, v314, v315, v316, v317, v318, (char)a6);

      _os_crash();
      __break(1u);
      goto LABEL_432;
    }
    double v32 = -[SASamplePrinter timeSpentAsleepBetweenStartTimestamp:endTimestamp:](a1, v31, v343);
    if (v32 > 0.0)
    {
      int v33 = (void *)v367[5];
      if (v33)
      {
        [v33 appendString:@", "];
      }
      else
      {
        uint64_t v34 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
        id v35 = (void *)v367[5];
        v367[5] = v34;
      }
      objc_msgSend((id)v367[5], "appendFormat:", @"machine asleep for %.0fs", *(void *)&v32);
    }
    if (-[SASamplePrinter complainAboutSamplingGapBetweenStartTimestamp:endTimestamp:](a1, v340, v343))
    {
      unint64_t v36 = (void *)v367[5];
      if (v36)
      {
        [v36 appendString:@", "];
      }
      else
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
        int v38 = (void *)v367[5];
        v367[5] = v37;
      }
      int v39 = (void *)v367[5];
      [v343 machAbsTimeSeconds];
      double v41 = v40;
      [v340 machAbsTimeSeconds];
      objc_msgSend(v39, "appendFormat:", @"%.0fms gap with no samples", (v41 - v42) * 1000.0);
    }
  }
  if (!-[SASamplePrinter hasTimeIndexes](a1)) {
    goto LABEL_64;
  }
  if (v337)
  {
    unint64_t v43 = @"DispatchQueue";
LABEL_19:
    if (a11)
    {
      uint64_t v44 = (void *)v367[5];
      if (v44)
      {
        [v44 appendString:@", "];
      }
      else
      {
        uint64_t v46 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
        unint64_t v47 = (void *)v367[5];
        v367[5] = v46;
      }
      int v48 = @"s";
      if (a11 == 1) {
        int v48 = &stru_1F1A80538;
      }
      [(id)v367[5] appendFormat:@"%@ omitted via filtering for %lu sample%@", v43, a11, v48];
    }
    if (!v351 || v350 == v351)
    {
LABEL_64:
      if (v346) {
        BOOL v63 = v338 == v346;
      }
      else {
        BOOL v63 = 1;
      }
      char v64 = v63;
      char v333 = v64;
      if (!v63 && a22)
      {
        int v65 = (void *)v367[5];
        if (v65)
        {
          [v65 appendString:@", "];
        }
        else
        {
          uint64_t v66 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
          id v67 = (void *)v367[5];
          v367[5] = v66;
        }
        [(id)v367[5] appendFormat:@"%@ 0x%llx", @"Thread", objc_msgSend(v346, "threadId")];
      }
      if (v351) {
        BOOL v68 = v350 == v351;
      }
      else {
        BOOL v68 = 1;
      }
      char v69 = v68;
      char v341 = v69;
      if (v68) {
        goto LABEL_135;
      }
      if (v350)
      {
        uint64_t v70 = [v350 swiftTask];
        unint64_t v71 = [v351 swiftTask];
        if (v70 == v71)
        {

LABEL_103:
          id v83 = [v350 dispatchQueue];
          uint64_t v84 = [v351 dispatchQueue];
          if (v83 == v84)
          {

            if ((a21 & 1) == 0) {
              goto LABEL_135;
            }
LABEL_113:
            uint64_t v91 = [v350 name];
            uint64_t v92 = [v351 name];
            BOOL v93 = v91 == v92;

            if (v93) {
              goto LABEL_135;
            }
            uint64_t v94 = [v350 name];
            if (v94)
            {
              uint64_t v95 = [v351 name];
              if (v95)
              {
                int v96 = [v350 name];
                long long v97 = [v351 name];
                char v98 = [v96 isEqualToString:v97];

                if (v98) {
                  goto LABEL_135;
                }
              }
              else
              {
              }
            }
            goto LABEL_121;
          }

          goto LABEL_106;
        }
      }
      else if ((a19 & 1) == 0)
      {
        goto LABEL_105;
      }
      id v72 = [v351 swiftTask];
      uint64_t v73 = v72;
      if (v72)
      {
        uint64_t v74 = [v72 identifier];
        uint64_t v75 = (void *)v367[5];
        if (v74 == -1)
        {
          if (v75)
          {
            [v75 appendString:@", "];
          }
          else
          {
            uint64_t v81 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
            uint64_t v82 = (void *)v367[5];
            v367[5] = v81;
          }
          [(id)v367[5] appendFormat:@"%@ %@", @"Swift Task", @"UNKNOWN"];
        }
        else
        {
          if (v75)
          {
            [v75 appendString:@", "];
          }
          else
          {
            uint64_t v77 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
            uint64_t v78 = (void *)v367[5];
            v367[5] = v77;
          }
          [(id)v367[5] appendFormat:@"%@ %llu", @"Swift Task", objc_msgSend(v73, "identifier")];
        }
      }
      else
      {
        uint64_t v76 = (void *)v367[5];
        if (v76)
        {
          [v76 appendString:@", "];
        }
        else
        {
          uint64_t v79 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
          int v80 = (void *)v367[5];
          v367[5] = v79;
        }
        [(id)v367[5] appendFormat:@"%@ none", @"Swift Task"];
      }

      if (v350) {
        goto LABEL_103;
      }
LABEL_105:
      if (!a18)
      {
        if ((a21 & 1) == 0) {
          goto LABEL_135;
        }
LABEL_121:
        long long v99 = [v351 name];

        long long v100 = (void *)v367[5];
        if (v99)
        {
          if (v100)
          {
            [v100 appendString:@", "];
          }
          else
          {
            uint64_t v102 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
            uint64_t v103 = (void *)v367[5];
            v367[5] = v102;
          }
          uint64_t v104 = (void *)v367[5];
          uint64_t v105 = [v351 name];
          uint64_t v106 = SACopySanitizedString(v105, 1, 0);
          [v104 appendFormat:@"Thread name \"%@\"", v106];

          goto LABEL_135;
        }
        if (v350)
        {
          if (v100)
          {
            [v100 appendString:@", "];
            uint64_t v101 = @"Thread name cleared";
LABEL_134:
            [(id)v367[5] appendFormat:v101];
            goto LABEL_135;
          }
          uint64_t v107 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
          char v108 = (void *)v367[5];
          v367[5] = v107;
          uint64_t v101 = @"Thread name cleared";
        }
        else
        {
          if (v100)
          {
            [v100 appendString:@", "];
            uint64_t v101 = @"Thread name unset";
            goto LABEL_134;
          }
          uint64_t v109 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
          char v108 = (void *)v367[5];
          v367[5] = v109;
          uint64_t v101 = @"Thread name unset";
        }

        goto LABEL_134;
      }
LABEL_106:
      id v85 = (void *)v367[5];
      if (v85)
      {
        [v85 appendString:@", "];
      }
      else
      {
        uint64_t v86 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
        uint64_t v87 = (void *)v367[5];
        v367[5] = v86;
      }
      id v88 = (void *)v367[5];
      char v89 = [v351 dispatchQueue];
      uint64_t v90 = -[SASamplePrinter displayNameForDispatchQueue:](v89);
      [v88 appendFormat:@"%@ %@", @"DispatchQueue", v90];

      if (a21)
      {
        if (!v350) {
          goto LABEL_121;
        }
        goto LABEL_113;
      }
LABEL_135:
      if (v349) {
        BOOL v110 = v348 == v349;
      }
      else {
        BOOL v110 = 1;
      }
      char v111 = v110;
      char v345 = v111;
      if (v110)
      {
LABEL_155:
        if (v341) {
          goto LABEL_205;
        }
        char v119 = [*(id *)(v347 + 16) displayQoSTransitionsBetweenUnspecifiedAndUnavailable];
        v364[0] = MEMORY[0x1E4F143A8];
        v364[1] = 3221225472;
        v364[2] = __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke;
        v364[3] = &__block_descriptor_33_e8_B12__0C8l;
        char v365 = v119;
        id v120 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v364);
        v362[0] = MEMORY[0x1E4F143A8];
        v362[1] = 3221225472;
        v362[2] = __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_2;
        v362[3] = &__block_descriptor_33_e11_B16__0C8C12l;
        char v363 = v119;
        int v121 = (uint64_t (**)(void, void, void))MEMORY[0x1C18A6C80](v362);
        if (v350)
        {
          int v122 = v121[2](v121, [v350 threadRequestedQos], objc_msgSend(v351, "threadRequestedQos"));
          int v123 = v121[2](v121, [v350 threadRequestedQosOverride], objc_msgSend(v351, "threadRequestedQosOverride"));
          int v124 = v121[2](v121, [v350 threadQosPromote], objc_msgSend(v351, "threadQosPromote"));
          int v125 = v121[2](v121, [v350 threadQosKEventOverride], objc_msgSend(v351, "threadQosKEventOverride"));
          int v332 = v121[2](v121, [v350 threadQosWorkQueueOverride], objc_msgSend(v351, "threadQosWorkQueueOverride"));
          int v126 = v121[2](v121, [v350 threadQosWorkloopServicerOverride], objc_msgSend(v351, "threadQosWorkloopServicerOverride"));
          int v127 = [v351 isPromotedAboveTask];
          if (v127 == [v350 isPromotedAboveTask])
          {
            if (((v122 | v123 | v124 | v125 | v332 | v126) & 1) == 0)
            {
              int v128 = [v351 threadQos];
              if (v128 == [v350 threadQos]) {
                goto LABEL_204;
              }
LABEL_166:
              int v129 = 0;
              int v331 = 0;
              int v332 = 0;
              int v124 = 0;
              LOBYTE(v122) = 0;
              LOBYTE(v123) = 0;
              LOBYTE(v125) = 0;
              LOBYTE(v126) = 0;
LABEL_167:
              long long v130 = (void *)v367[5];
              if (v130)
              {
                [v130 appendString:@", "];
              }
              else
              {
                uint64_t v131 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                long long v132 = (void *)v367[5];
                v367[5] = v131;
              }
              long long v133 = (void *)v367[5];
              long long v134 = StringForThreadQoS([v351 threadQos]);
              [v133 appendFormat:@"thread QoS %@", v134];

              if (!v129) {
                goto LABEL_204;
              }
              objc_msgSend((id)v367[5], "appendString:", @" (");
              if (v122)
              {
                long long v135 = (void *)v367[5];
                long long v136 = StringForThreadQoS([v351 threadRequestedQos]);
                [v135 appendFormat:@"requested %@", v136];

                if ((v123 & 1) == 0)
                {
                  if ((v124 & 1) == 0)
                  {
LABEL_186:
                    if ((v125 & 1) == 0)
                    {
                      if ((v332 & 1) == 0)
                      {
LABEL_193:
                        if (v126)
                        {
                          [(id)v367[5] appendString:@", "];
LABEL_195:
                          id v145 = (void *)v367[5];
                          id v146 = StringForThreadQoS([v351 threadQosWorkloopServicerOverride]);
                          [v145 appendFormat:@"workloop servicer override %@", v146];

                          if (!v331) {
                            goto LABEL_203;
                          }
                          goto LABEL_198;
                        }
                        if (v331)
                        {
LABEL_198:
                          [(id)v367[5] appendString:@", "];
                          goto LABEL_199;
                        }
LABEL_203:
                        [(id)v367[5] appendString:@""]);
                        goto LABEL_204;
                      }
                      goto LABEL_191;
                    }
                    [(id)v367[5] appendString:@", "];
LABEL_188:
                    uint64_t v141 = (void *)v367[5];
                    int v142 = StringForThreadQoS([v351 threadQosKEventOverride]);
                    [v141 appendFormat:@"kevent override %@", v142];

                    if (!v332) {
                      goto LABEL_193;
                    }
LABEL_191:
                    [(id)v367[5] appendString:@", "];
LABEL_192:
                    uint64_t v143 = (void *)v367[5];
                    uint64_t v144 = StringForThreadQoS([v351 threadQosWorkQueueOverride]);
                    [v143 appendFormat:@"work queue override %@", v144];

                    goto LABEL_193;
                  }
                  goto LABEL_184;
                }
                [(id)v367[5] appendString:@", "];
              }
              else if ((v123 & 1) == 0)
              {
                if ((v124 & 1) == 0)
                {
                  if ((v125 & 1) == 0)
                  {
                    if ((v332 & 1) == 0)
                    {
                      if (v126) {
                        goto LABEL_195;
                      }
                      if (v331)
                      {
LABEL_199:
                        if ([v351 isPromotedAboveTask]) {
                          id v147 = @"thread promoted above process clamp";
                        }
                        else {
                          id v147 = @"thread limited by process clamp";
                        }
                        [(id)v367[5] appendFormat:v147];
                        goto LABEL_203;
                      }
                      goto LABEL_203;
                    }
                    goto LABEL_192;
                  }
                  goto LABEL_188;
                }
                goto LABEL_185;
              }
              uint64_t v137 = (void *)v367[5];
              uint64_t v138 = StringForThreadQoS([v351 threadRequestedQosOverride]);
              [v137 appendFormat:@"requested override %@", v138];

              if (!v124) {
                goto LABEL_186;
              }
LABEL_184:
              [(id)v367[5] appendString:@", "];
LABEL_185:
              uint64_t v139 = (void *)v367[5];
              id v140 = StringForThreadQoS([v351 threadQosPromote]);
              [v139 appendFormat:@"promote %@", v140];

              goto LABEL_186;
            }
            goto LABEL_164;
          }
        }
        else
        {
          int v122 = v120[2](v120, [v351 threadRequestedQos]);
          int v123 = v120[2](v120, [v351 threadRequestedQosOverride]);
          int v124 = v120[2](v120, [v351 threadQosPromote]);
          int v125 = v120[2](v120, [v351 threadQosKEventOverride]);
          int v332 = v120[2](v120, [v351 threadQosWorkQueueOverride]);
          int v126 = v120[2](v120, [v351 threadQosWorkloopServicerOverride]);
          if (([v351 isPromotedAboveTask] & 1) == 0)
          {
            if (((v122 | v123 | v124 | v125 | v332 | v126) & 1) == 0)
            {
              if (![v351 threadQos])
              {
LABEL_204:

LABEL_205:
                if (v345)
                {
                  if (!v351) {
                    goto LABEL_267;
                  }
                  goto LABEL_234;
                }
                if (![v336 usesSuddenTermination])
                {
LABEL_220:
                  if (!v348)
                  {
                    if (([v349 isBoosted] & 1) == 0) {
                      goto LABEL_233;
                    }
                    goto LABEL_224;
                  }
LABEL_221:
                  int v155 = [v349 isBoosted];
                  if (v155 == [v348 isBoosted])
                  {
LABEL_233:
                    if (!v351) {
                      goto LABEL_260;
                    }
LABEL_234:
                    if (v350 != v351)
                    {
                      if (v350)
                      {
                        int v162 = [v350 isDarwinBG];
                        if (v162 != [v351 isDarwinBG])
                        {
LABEL_237:
                          uint64_t v163 = (void *)v367[5];
                          if (v163)
                          {
                            [v163 appendString:@", "];
                          }
                          else
                          {
                            uint64_t v165 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                            int v166 = (void *)v367[5];
                            v367[5] = v165;
                          }
                          uint64_t v167 = (void *)v367[5];
                          int v168 = [v351 isDarwinBG];
                          char v169 = @"not ";
                          if (v168) {
                            char v169 = &stru_1F1A80538;
                          }
                          [v167 appendFormat:@"thread %@darwinbg", v169];
                          int v164 = 0;
LABEL_245:
                          if (v345) {
                            goto LABEL_267;
                          }
                          if (v348)
                          {
                            int v170 = [v348 isDarwinBG];
                            if (v170 == [v349 isDarwinBG])
                            {
LABEL_260:
                              char v177 = [v348 donatingUniquePids];
                              uint64_t v178 = [v349 donatingUniquePids];
                              char v179 = (void *)v178;
                              if ((v177 != 0) != (v178 != 0)
                                || v177 && v178 && ([v177 isEqualToSet:v178] & 1) == 0)
                              {
                                v358[0] = MEMORY[0x1E4F143A8];
                                v358[1] = 3221225472;
                                v358[2] = __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_3;
                                v358[3] = &unk_1E63F99F0;
                                id v359 = v336;
                                uint64_t v360 = v347;
                                unint64_t v361 = &v366;
                                uint64_t v180 = MEMORY[0x1C18A6C80](v358);
                                SEL v181 = (void (**)(void, void, void, void, void))v180;
                                if (v339 != 0 && v177 != 0) {
                                  (*(void (**)(uint64_t, void *, void *, __CFString *, void *))(v180 + 16))(v180, v177, v179, @"dropped", v339);
                                }
                                char v182 = [v349 startTimestamp];
                                if (v182) {
                                  ((void (**)(void, void *, void *, __CFString *, void *))v181)[2](v181, v179, v177, @"received", v182);
                                }
                              }
LABEL_267:
                              if (![*(id *)(v347 + 16) displayDifferentTypesOfSuspension]) {
                                goto LABEL_335;
                              }
                              if ((v341 & 1) == 0)
                              {
                                if (v350)
                                {
                                  int v183 = [v351 isSuspended];
                                  if (v183 != [v350 isSuspended])
                                  {
LABEL_271:
                                    int v184 = 1;
                                    goto LABEL_278;
                                  }
                                }
                                else if ([v351 isSuspended])
                                {
                                  goto LABEL_271;
                                }
                              }
                              int v184 = 0;
LABEL_278:
                              if (v345) {
                                goto LABEL_325;
                              }
                              if (v348)
                              {
                                int v185 = [v349 suspendCount];
                                BOOL v186 = v185 != [v348 suspendCount];
                                int v187 = [v349 isPidSuspended];
                                if (v187 != [v348 isPidSuspended]) {
                                  goto LABEL_281;
                                }
                              }
                              else
                              {
                                BOOL v186 = [v349 suspendCount] != 0;
                                if ([v349 isPidSuspended])
                                {
LABEL_281:
                                  if ([v349 isPidSuspended])
                                  {
                                    id v188 = (void *)v367[5];
                                    if (v188)
                                    {
                                      [v188 appendString:@", "];
                                      uint64_t v189 = @"process pidsuspended";
LABEL_303:
                                      [(id)v367[5] appendFormat:v189];
                                      if (!v186) {
                                        goto LABEL_325;
                                      }
                                      char v190 = 1;
LABEL_305:
                                      if ([v349 suspendCount])
                                      {
                                        uint64_t v203 = (void *)v367[5];
                                        if (v203)
                                        {
                                          [v203 appendString:@", "];
                                        }
                                        else
                                        {
                                          uint64_t v207 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                          uint64_t v208 = (void *)v367[5];
                                          v367[5] = v207;
                                        }
                                        uint64_t v199 = (void *)v367[5];
                                        uint64_t v200 = [v349 suspendCount];
                                        uint64_t v201 = @"process suspend count %d";
LABEL_318:
                                        objc_msgSend(v199, "appendFormat:", v201, v200);
                                        goto LABEL_325;
                                      }
                                      if ((v190 & 1) != 0 || ![v349 isPidSuspended])
                                      {
                                        if ((v184 & 1) == 0 && [v351 isSuspended])
                                        {
                                          uint64_t v206 = (void *)v367[5];
                                          if (v206)
                                          {
                                            [v206 appendString:@", "];
                                          }
                                          else
                                          {
                                            uint64_t v274 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                            uint64_t v275 = (void *)v367[5];
                                            v367[5] = v274;
                                          }
                                          [(id)v367[5] appendFormat:@"process suspend count 0 (thread still suspended)"];
                                          goto LABEL_336;
                                        }
                                        int v209 = (void *)v367[5];
                                        if (v209)
                                        {
                                          [v209 appendString:@", "];
                                          uint64_t v205 = @"process suspend count 0";
                                          goto LABEL_324;
                                        }
                                        uint64_t v210 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                        uint64_t v211 = (void *)v367[5];
                                        v367[5] = v210;
                                        uint64_t v205 = @"process suspend count 0";
                                      }
                                      else
                                      {
                                        uint64_t v204 = (void *)v367[5];
                                        if (v204)
                                        {
                                          [v204 appendString:@", "];
                                          uint64_t v205 = @"process suspend count 0 (process still pidsuspended)";
LABEL_324:
                                          [(id)v367[5] appendFormat:v205];
LABEL_325:
                                          if (!v184) {
                                            goto LABEL_335;
                                          }
                                          int v213 = [v351 isSuspended];
                                          uint64_t v214 = (void *)v367[5];
                                          if (v213)
                                          {
                                            if (v214)
                                            {
                                              [v214 appendString:@", "];
                                              int v215 = @"thread suspended";
LABEL_334:
                                              [(id)v367[5] appendFormat:v215];
LABEL_335:
                                              if (v345) {
                                                goto LABEL_371;
                                              }
LABEL_336:
                                              if (v348)
                                              {
                                                int v219 = [v349 isSuppressed];
                                                if (v219 == [v348 isSuppressed])
                                                {
LABEL_349:
                                                  int v226 = [v349 latencyQos];
                                                  if (v226 == [v348 latencyQos]) {
                                                    goto LABEL_371;
                                                  }
                                                  goto LABEL_353;
                                                }
                                              }
                                              else if (([v349 isSuppressed] & 1) == 0)
                                              {
                                                goto LABEL_351;
                                              }
                                              int v220 = [v349 isSuppressed];
                                              id v221 = (void *)v367[5];
                                              if (v220)
                                              {
                                                if (v221)
                                                {
                                                  [v221 appendString:@", "];
                                                  uint64_t v222 = @"process suppressed";
                                                  goto LABEL_348;
                                                }
                                                uint64_t v223 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                uint64_t v224 = (void *)v367[5];
                                                v367[5] = v223;
                                                uint64_t v222 = @"process suppressed";
                                              }
                                              else
                                              {
                                                if (v221)
                                                {
                                                  [v221 appendString:@", "];
                                                  uint64_t v222 = @"process unsuppressed";
                                                  goto LABEL_348;
                                                }
                                                uint64_t v225 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                uint64_t v224 = (void *)v367[5];
                                                v367[5] = v225;
                                                uint64_t v222 = @"process unsuppressed";
                                              }

LABEL_348:
                                              [(id)v367[5] appendFormat:v222];
                                              if (v348) {
                                                goto LABEL_349;
                                              }
LABEL_351:
                                              int v227 = [v349 latencyQos];
                                              if (!v227 || v227 == 16711681)
                                              {
LABEL_371:
                                                if ((v341 & 1) == 0)
                                                {
                                                  if (v350
                                                    && (int v239 = [v351 ioTier],
                                                        v239 == [v350 ioTier])
                                                    && (int v240 = [v351 isIOPassive],
                                                        v240 == [v350 isIOPassive]))
                                                  {
                                                    if ((a20 & 1) == 0) {
                                                      goto LABEL_399;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    unint64_t v241 = (void *)v367[5];
                                                    if (v241)
                                                    {
                                                      [v241 appendString:@", "];
                                                    }
                                                    else
                                                    {
                                                      uint64_t v242 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                      unint64_t v243 = (void *)v367[5];
                                                      v367[5] = v242;
                                                    }
                                                    objc_msgSend((id)v367[5], "appendFormat:", @"IO tier %d", objc_msgSend(v351, "ioTier"));
                                                    if ([v351 isIOPassive]) {
                                                      [(id)v367[5] appendString:@" and passive"];
                                                    }
                                                    if ((a20 & 1) == 0) {
                                                      goto LABEL_399;
                                                    }
                                                    if (!v350) {
                                                      goto LABEL_386;
                                                    }
                                                  }
                                                  int v244 = [v350 scheduledPriority];
                                                  if (v244 != [v351 scheduledPriority]
                                                    || (int v245 = [v350 basePriority],
                                                        v245 != [v351 basePriority]))
                                                  {
LABEL_386:
                                                    if (([v351 scheduledPriority] & 0x80000000) == 0)
                                                    {
                                                      int v246 = [v351 basePriority];
                                                      long long v247 = (void *)v367[5];
                                                      if (v246 < 0)
                                                      {
                                                        if (v247)
                                                        {
                                                          [v247 appendString:@", "];
                                                        }
                                                        else
                                                        {
                                                          uint64_t v251 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                          uint64_t v252 = (void *)v367[5];
                                                          v367[5] = v251;
                                                        }
                                                        objc_msgSend((id)v367[5], "appendFormat:", @"priority %d", objc_msgSend(v351, "scheduledPriority"));
                                                      }
                                                      else
                                                      {
                                                        if (v247)
                                                        {
                                                          [v247 appendString:@", "];
                                                        }
                                                        else
                                                        {
                                                          uint64_t v249 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                          uint64_t v250 = (void *)v367[5];
                                                          v367[5] = v249;
                                                        }
                                                        objc_msgSend((id)v367[5], "appendFormat:", @"priority %d (%d)", objc_msgSend(v351, "scheduledPriority"), objc_msgSend(v351, "basePriority"));
                                                      }
                                                    }
                                                  }
                                                }
LABEL_399:
                                                if ([v342 count])
                                                {
                                                  uint64_t v253 = (void *)v367[5];
                                                  if (v253)
                                                  {
                                                    [v253 appendString:@", "];
                                                  }
                                                  else
                                                  {
                                                    uint64_t v254 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                    int v255 = (void *)v367[5];
                                                    v367[5] = v254;
                                                  }
                                                  uint64_t v256 = (void *)v367[5];
                                                  uint64_t v257 = (void *)-[SASamplePrinter copyDescriptionForIOEvents:]((id *)v347, v342);
                                                  [v256 appendString:v257];
                                                }
                                                if ((v333 & 1) == 0)
                                                {
                                                  uint64_t v258 = [*(id *)(v347 + 160) mountStatusTracker];
                                                  int v259 = -[SAMountStatusTracker hasUnresponsiveMountsForThreadID:]((uint64_t)v258, [v346 threadId]);

                                                  if (v259)
                                                  {
                                                    double v260 = v339;
                                                    if (!v339) {
                                                      double v260 = *(void **)(v347 + 32);
                                                    }
                                                    id v261 = v260;
                                                    if (v337 | v335)
                                                    {
                                                      *(void *)long long buf = 0;
                                                      *(void *)&buf[8] = buf;
                                                      *(void *)&uint8_t buf[16] = 0x3032000000;
                                                      uint64_t v373 = __Block_byref_object_copy__4;
                                                      *(void *)uint64_t v374 = __Block_byref_object_dispose__4;
                                                      id v262 = v351;
                                                      *(void *)&v374[8] = v262;
                                                      id v263 = *(void **)(v347 + 40);
                                                      v354[0] = MEMORY[0x1E4F143A8];
                                                      v354[1] = 3221225472;
                                                      v354[2] = __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_4;
                                                      v354[3] = &unk_1E63F9A18;
                                                      id v355 = v346;
                                                      uint64_t v357 = buf;
                                                      id v356 = v262;
                                                      -[SASamplePrinter iterateDispatchQueue:orSwiftTaskStates:orThread:threadStateIndexes:startingAtIndex:endingAfterTimestamp:task:stopAtTimeJumps:callback:](v347, (void *)v337, (void *)v335, 0, 0, a9 + 1, v263, 0, 0, v354);
                                                      uint64_t v264 = [*(id *)(*(void *)&buf[8] + 40) endTimestamp];

                                                      _Block_object_dispose(buf, 8);
                                                    }
                                                    else if (v334)
                                                    {
                                                      uint64_t v265 = [v346 threadStates];
                                                      uint64_t v266 = [v334 lastObject];
                                                      uint64_t v267 = objc_msgSend(v265, "objectAtIndexedSubscript:", objc_msgSend(v266, "unsignedLongValue"));
                                                      uint64_t v264 = [v267 endTimestamp];
                                                    }
                                                    else
                                                    {
                                                      uint64_t v268 = [v346 lastThreadStateOnOrBeforeTime:*(void *)(v347 + 40) sampleIndex:*(void *)(v347 + 56)];
                                                      uint64_t v264 = [v268 endTimestamp];
                                                    }
                                                    if ([*(id *)(v347 + 160) sanitizePaths])char v269 = os_variant_has_internal_diagnostics() ^ 1; {
                                                    else
                                                    }
                                                      char v269 = 0;
                                                    uint64_t v270 = [*(id *)(v347 + 160) mountStatusTracker];
                                                    uint64_t v271 = [v346 threadId];
                                                    v352[0] = MEMORY[0x1E4F143A8];
                                                    v352[1] = 3221225472;
                                                    v352[2] = __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_5;
                                                    v352[3] = &unk_1E63F9A40;
                                                    char v353 = v269;
                                                    v352[4] = &v366;
                                                    -[SAMountStatusTracker enumerateMountsBlockingThread:betweenStartTime:endTime:block:]((uint64_t)v270, v271, v261, v264, v352);
                                                  }
                                                }
                                                id v272 = (id)v367[5];
                                                _Block_object_dispose(&v366, 8);

                                                goto LABEL_418;
                                              }
LABEL_353:
                                              int v228 = [v349 latencyQos];
                                              long long v229 = (void *)v367[5];
                                              if (v228)
                                              {
                                                if (v229)
                                                {
                                                  [v229 appendString:@", "];
                                                }
                                                else
                                                {
                                                  uint64_t v230 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                  char v231 = (void *)v367[5];
                                                  v367[5] = v230;
                                                }
                                                uint64_t v232 = (void *)v367[5];
                                                LODWORD(v233) = [v349 latencyQos] - 16711681;
                                                if (v233 >= 6) {
                                                  uint64_t v233 = 0xFFFFFFFFLL;
                                                }
                                                else {
                                                  uint64_t v233 = v233;
                                                }
                                                objc_msgSend(v232, "appendFormat:", @"timers tier %d", v233);
                                              }
                                              else
                                              {
                                                if (v229)
                                                {
                                                  [v229 appendString:@", "];
                                                }
                                                else
                                                {
                                                  uint64_t v234 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                                  uint64_t v235 = (void *)v367[5];
                                                  v367[5] = v234;
                                                }
                                                [(id)v367[5] appendFormat:@"timers tier unspecified"];
                                              }
                                              int v236 = [v349 latencyQos];
                                              long long v237 = @" (normal)";
                                              if (v236 && v236 != 16711681)
                                              {
                                                if (objc_msgSend(v349, "latencyQos", @" (normal)")
                                                   - 16711682 >= 3)
                                                {
                                                  int v248 = [v349 latencyQos];
                                                  uint64_t v238 = (void *)v367[5];
                                                  if ((v248 - 16711685) >= 2)
                                                  {
                                                    objc_msgSend(v238, "appendFormat:", @" (unknown: 0x%x)", objc_msgSend(v349, "latencyQos"));
                                                    goto LABEL_371;
                                                  }
                                                  long long v237 = @" (throttled)";
LABEL_370:
                                                  [v238 appendString:v237];
                                                  goto LABEL_371;
                                                }
                                                long long v237 = @" (coalesced)";
                                              }
                                              uint64_t v238 = (void *)v367[5];
                                              goto LABEL_370;
                                            }
                                            uint64_t v216 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                            uint64_t v217 = (void *)v367[5];
                                            v367[5] = v216;
                                            int v215 = @"thread suspended";
                                          }
                                          else
                                          {
                                            if (v214)
                                            {
                                              [v214 appendString:@", "];
                                              int v215 = @"thread unsuspended";
                                              goto LABEL_334;
                                            }
                                            uint64_t v218 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                            uint64_t v217 = (void *)v367[5];
                                            v367[5] = v218;
                                            int v215 = @"thread unsuspended";
                                          }

                                          goto LABEL_334;
                                        }
                                        uint64_t v212 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                        uint64_t v211 = (void *)v367[5];
                                        v367[5] = v212;
                                        uint64_t v205 = @"process suspend count 0 (process still pidsuspended)";
                                      }

                                      goto LABEL_324;
                                    }
                                    uint64_t v194 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                    uint64_t v195 = (void *)v367[5];
                                    v367[5] = v194;
                                    uint64_t v189 = @"process pidsuspended";
                                  }
                                  else
                                  {
                                    if (!v186 && [v349 suspendCount])
                                    {
                                      id v191 = (void *)v367[5];
                                      if (v191)
                                      {
                                        [v191 appendString:@", "];
                                      }
                                      else
                                      {
                                        uint64_t v197 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                        uint64_t v198 = (void *)v367[5];
                                        v367[5] = v197;
                                      }
                                      uint64_t v199 = (void *)v367[5];
                                      uint64_t v200 = [v349 suspendCount];
                                      uint64_t v201 = @"process unpidsuspended (process suspend count still %d)";
                                      goto LABEL_318;
                                    }
                                    if ((v184 & 1) != 0 || ![v351 isSuspended])
                                    {
                                      uint64_t v193 = (void *)v367[5];
                                      if (v193)
                                      {
                                        [v193 appendString:@", "];
                                        uint64_t v189 = @"process unpidsuspended";
                                        goto LABEL_303;
                                      }
                                      uint64_t v196 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                      uint64_t v195 = (void *)v367[5];
                                      v367[5] = v196;
                                      uint64_t v189 = @"process unpidsuspended";
                                    }
                                    else
                                    {
                                      uint64_t v192 = (void *)v367[5];
                                      if (v192)
                                      {
                                        [v192 appendString:@", "];
                                        uint64_t v189 = @"process unpidsuspended (thread still suspended)";
                                        goto LABEL_303;
                                      }
                                      uint64_t v202 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                                      uint64_t v195 = (void *)v367[5];
                                      v367[5] = v202;
                                      uint64_t v189 = @"process unpidsuspended (thread still suspended)";
                                    }
                                  }

                                  goto LABEL_303;
                                }
                              }
                              if (!v186) {
                                goto LABEL_325;
                              }
                              char v190 = 0;
                              goto LABEL_305;
                            }
                          }
                          else if (([v349 isDarwinBG] & 1) == 0)
                          {
                            goto LABEL_260;
                          }
                          uint64_t v171 = (void *)v367[5];
                          if (v171)
                          {
                            [v171 appendString:@", "];
                          }
                          else
                          {
                            uint64_t v172 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                            int v173 = (void *)v367[5];
                            v367[5] = v172;
                          }
                          char v174 = (void *)v367[5];
                          if ([v349 isDarwinBG]) {
                            char v175 = &stru_1F1A80538;
                          }
                          else {
                            char v175 = @"not ";
                          }
                          char v176 = &stru_1F1A80538;
                          if (([v349 isDarwinBG] & 1) == 0
                            && (v164 & [v351 isDarwinBG]) != 0)
                          {
                            char v176 = @" (thread still darwinbg)";
                          }
                          [v174 appendFormat:@"process %@darwinbg%@", v175, v176];
                          goto LABEL_260;
                        }
                      }
                      else if ([v351 isDarwinBG])
                      {
                        goto LABEL_237;
                      }
                    }
                    int v164 = 1;
                    goto LABEL_245;
                  }
LABEL_224:
                  int v156 = [v349 isBoosted];
                  uint64_t v157 = (void *)v367[5];
                  if (v156)
                  {
                    if (v157)
                    {
                      [v157 appendString:@", "];
                      uint64_t v158 = @"process unclamped";
LABEL_232:
                      [(id)v367[5] appendFormat:v158];
                      goto LABEL_233;
                    }
                    uint64_t v159 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                    uint64_t v160 = (void *)v367[5];
                    v367[5] = v159;
                    uint64_t v158 = @"process unclamped";
                  }
                  else
                  {
                    if (v157)
                    {
                      [v157 appendString:@", "];
                      uint64_t v158 = @"process clamped";
                      goto LABEL_232;
                    }
                    uint64_t v161 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                    uint64_t v160 = (void *)v367[5];
                    v367[5] = v161;
                    uint64_t v158 = @"process clamped";
                  }

                  goto LABEL_232;
                }
                if (v348)
                {
                  int v148 = [v349 isDirty];
                  if (v148 == [v348 isDirty]) {
                    goto LABEL_221;
                  }
                }
                int v149 = [v349 isDirty];
                BOOL v150 = (void *)v367[5];
                if (v149)
                {
                  if (v150)
                  {
                    [v150 appendString:@", "];
                    unint64_t v151 = @"process sudden termination dirty";
LABEL_219:
                    [(id)v367[5] appendFormat:v151];
                    goto LABEL_220;
                  }
                  uint64_t v152 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                  int v153 = (void *)v367[5];
                  v367[5] = v152;
                  unint64_t v151 = @"process sudden termination dirty";
                }
                else
                {
                  if (v150)
                  {
                    [v150 appendString:@", "];
                    unint64_t v151 = @"process sudden termination clean";
                    goto LABEL_219;
                  }
                  uint64_t v154 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
                  int v153 = (void *)v367[5];
                  v367[5] = v154;
                  unint64_t v151 = @"process sudden termination clean";
                }

                goto LABEL_219;
              }
              goto LABEL_166;
            }
LABEL_164:
            int v331 = 0;
            int v129 = 1;
            goto LABEL_167;
          }
        }
        int v129 = 1;
        int v331 = 1;
        goto LABEL_167;
      }
      if (v348)
      {
        int v112 = [v349 isForeground];
        if (v112 == [v348 isForeground]) {
          goto LABEL_155;
        }
      }
      else if (([v349 isForeground] & 1) == 0)
      {
        goto LABEL_155;
      }
      int v113 = [v349 isForeground];
      unint64_t v114 = (void *)v367[5];
      if (v113)
      {
        if (v114)
        {
          [v114 appendString:@", "];
          uint64_t v115 = @"process frontmost";
LABEL_154:
          [(id)v367[5] appendFormat:v115];
          goto LABEL_155;
        }
        uint64_t v116 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
        id v117 = (void *)v367[5];
        v367[5] = v116;
        uint64_t v115 = @"process frontmost";
      }
      else
      {
        if (v114)
        {
          [v114 appendString:@", "];
          uint64_t v115 = @"process non-frontmost";
          goto LABEL_154;
        }
        uint64_t v118 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
        id v117 = (void *)v367[5];
        v367[5] = v118;
        uint64_t v115 = @"process non-frontmost";
      }

      goto LABEL_154;
    }
    if (v350) {
      a6 = (void *)([v350 endSampleIndex] + 1);
    }
    else {
      a6 = *(void **)(a1 + 48);
    }
    unint64_t v49 = [v351 startSampleIndex];
    if (v49 <= *(void *)(a1 + 48)) {
      unint64_t v50 = *(void *)(a1 + 48);
    }
    else {
      unint64_t v50 = v49;
    }
    unint64_t v51 = v50 - (void)a6;
    if (v50 >= (unint64_t)a6)
    {
      if ((unint64_t)a6 + a11 < v50)
      {
        if (a10)
        {
          BOOL v52 = @"in another call tree";
        }
        else
        {
          BOOL v52 = @"not seen";
          if (!v337 && !v335 && v334)
          {
            BOOL v53 = [v346 threadStates];
            id v54 = [v53 firstObject];
            if (v54 == v351)
            {
              BOOL v52 = @"not seen";
            }
            else
            {
              BOOL v55 = [v346 threadStates];
              unint64_t v56 = [v55 firstObject];
              BOOL v52 = @"in another call tree";
              if ([v56 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v344 = [v351 startSampleIndex];
                uint64_t v57 = [v346 threadStates];
                uint64_t v58 = [v57 firstObject];
                if (v344 == [v58 endSampleIndex] + 1) {
                  BOOL v52 = @"not seen";
                }
              }
            }
          }
        }
        uint64_t v59 = (void *)v367[5];
        if (v59)
        {
          [v59 appendString:@", "];
        }
        else
        {
          uint64_t v60 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
          unint64_t v61 = (void *)v367[5];
          v367[5] = v60;
        }
        id v62 = @"s";
        if (v51 == 1) {
          id v62 = &stru_1F1A80538;
        }
        [(id)v367[5] appendFormat:@"%@ %@ for %lu sample%@", v43, v52, v51, v62];
      }
      goto LABEL_64;
    }
    goto LABEL_429;
  }
  if (!v335)
  {
    unint64_t v43 = @"Thread";
    goto LABEL_19;
  }
  uint64_t v45 = *(void *)(a1 + 16);
  if (v45)
  {
    switch(*(void *)(v45 + 160))
    {
      case 0:
        if (*(unsigned char *)(v45 + 14)) {
          goto LABEL_54;
        }
        goto LABEL_25;
      case 1:
        int v276 = *__error();
        unint64_t v277 = _sa_logt();
        if (os_log_type_enabled(v277, OS_LOG_TYPE_ERROR))
        {
          id v278 = [*(id *)(a1 + 16) debugDescription];
          uint64_t v279 = [v278 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = v279;
          _os_log_error_impl(&dword_1BF22B000, v277, OS_LOG_TYPE_ERROR, "state for swiftTaskStates, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s", buf, 0xCu);
        }
        *__error() = v276;
        id v280 = [*(id *)(a1 + 16) debugDescription];
        char v281 = [v280 UTF8String];
        _SASetCrashLogMessage(9801, "state for swiftTaskStates, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s", v282, v283, v284, v285, v286, v287, v281);

        _os_crash();
        __break(1u);
        goto LABEL_426;
      case 2:
LABEL_54:
        unint64_t v43 = @"Swift Async Base Function";
        break;
      case 3:
      case 5:
LABEL_25:
        unint64_t v43 = @"Swift Task";
        break;
      case 4:
        unint64_t v43 = @"Swift Async";
        goto LABEL_19;
      default:
        unint64_t v43 = 0;
        goto LABEL_19;
    }
    goto LABEL_19;
  }
  int v319 = *__error();
  uint64_t v320 = _sa_logt();
  if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
  {
    id v321 = [*(id *)(a1 + 16) debugDescription];
    uint64_t v322 = [v321 UTF8String];
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v322;
    _os_log_error_impl(&dword_1BF22B000, v320, OS_LOG_TYPE_ERROR, "swiftAsyncCallTreeAggregationResolved returned default: %s", buf, 0xCu);
  }
  *__error() = v319;
  id v323 = [*(id *)(a1 + 16) debugDescription];
  char v324 = [v323 UTF8String];
  _SASetCrashLogMessage(9821, "swiftAsyncCallTreeAggregationResolved returned default: %s", v325, v326, v327, v328, v329, v330, v324);

  id result = (id)_os_crash();
  __break(1u);
  return result;
}

uint64_t __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    BOOL v2 = a2 == 125;
  }
  else {
    BOOL v2 = 1;
  }
  unsigned int v3 = !v2;
  if (*(unsigned char *)(a1 + 32)) {
    return 1;
  }
  else {
    return v3;
  }
}

BOOL __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_2(uint64_t a1, int a2, int a3)
{
  if (a2 == a3) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 32) || a3 != 125 && a3) {
    return 1;
  }
  if (a2) {
    BOOL v4 = a2 == 125;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

void __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v30 = a4;
  id v10 = a5;
  uint64_t v11 = [a2 allObjects];
  uint64_t v12 = [v11 sortedArrayUsingSelector:sel_compare_];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v19 = [v18 unsignedLongLongValue];
        if (v19 != [*(id *)(a1 + 32) uniquePid] && (objc_msgSend(v9, "containsObject:", v18) & 1) == 0)
        {
          id v20 = -[SASampleStore taskWithUniquePid:atTimestamp:](*(void **)(*(void *)(a1 + 40) + 160), [v18 unsignedLongLongValue], v10);
          id v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (v20)
          {
            if (v21)
            {
              [v21 appendString:@", "];
            }
            else
            {
              uint64_t v22 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
              uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
              unint64_t v24 = *(void **)(v23 + 40);
              *(void *)(v23 + 40) = v22;
            }
            unint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            id v26 = -[SASamplePrinter displayNameForTask:](*(void **)(a1 + 40), v20);
            [v25 appendFormat:@"process %@ importance donation from %@", v30, v26];
          }
          else
          {
            if (v21)
            {
              [v21 appendString:@", "];
            }
            else
            {
              uint64_t v27 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
              uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
              id v29 = *(void **)(v28 + 40);
              *(void *)(v28 + 40) = v27;
            }
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"process %@ importance donation from %@ [%llu]", v30, @"UNKNOWN", objc_msgSend(v18, "unsignedLongLongValue")];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }
}

- (uint64_t)copyDescriptionForIOEvents:(id *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!a1) {
    goto LABEL_26;
  }
  if ([v3 count])
  {
    if ([v4 count] == 1)
    {
      uint64_t v5 = [v4 firstObject];
      a1 = (id *)-[SASamplePrinter copyDescriptionForIOEvent:](v5);
    }
    else
    {
      if ((unint64_t)[v4 count] < 6) {
        LOBYTE(v6) = 0;
      }
      else {
        int v6 = [a1[2] displayEachIndividualIOInCallTrees] ^ 1;
      }
      id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
      unint64_t v8 = [v4 count];
      uint64_t v9 = 5;
      if (v8 > 5) {
        uint64_t v9 = v8;
      }
      a1 = (id *)[v7 initWithCapacity:16 * v9];
      if ([v4 count])
      {
        unint64_t v10 = 0;
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = [v4 objectAtIndexedSubscript:v10];
          id v13 = v12;
          if (v10 > 2) {
            char v14 = v6;
          }
          else {
            char v14 = 0;
          }
          if (v14)
          {
            v11 += [v12 size];
          }
          else
          {
            if (v10) {
              [a1 appendString:@", "];
            }
            uint64_t v15 = (void *)-[SASamplePrinter copyDescriptionForIOEvent:](v13);
            [a1 appendString:v15];
          }
          ++v10;
        }
        while (v10 < [v4 count]);
        if ((v6 & 1) == 0) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v11 = 0;
        if ((v6 & 1) == 0)
        {
LABEL_26:

          return (uint64_t)a1;
        }
      }
      uint64_t v16 = [v4 count] - 3;
      uint64_t v5 = SAFormattedBytesEx(v11, 1, 0, 0, 0x1000uLL);
      [a1 appendFormat:@"... and %lu more I/Os totaling %@", v16, v5];
    }

    goto LABEL_26;
  }
  int v18 = *__error();
  uint64_t v19 = _sa_logt();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "No IO events", buf, 2u);
  }

  *__error() = v18;
  _SASetCrashLogMessage(12272, "No IO events", v20, v21, v22, v23, v24, v25, v26);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned char *a10)
{
  if (*(void *)(a1 + 32) == a5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
  else {
    *a10 = 1;
  }
}

void __461__SASamplePrinter_stateChangeStringForThreadState_serialDispatchQueue_swiftTaskStates_thread_threadStateIndexes_taskState_task_iteratorIndex_missingStateIsInAnotherStack_numSamplesOmittedSincePreviousDisplayedSample_sampleTimestamp_previousSampleTimestamp_previousDisplayedTimestamp_previousTaskState_previousThread_previousThreadState_dispatchQueueChanges_swiftTaskChanges_priorityChanges_nameChanges_threadChanges_isTimeJump_ioEventsSincePreviousThreadState___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  int v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    if (v6)
    {
      [v6 appendString:@", "];
    }
    else
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    unint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    unint64_t v11 = SACopySanitizedString(v5, 1, 0);
    [v10 appendFormat:@"Thread becomes blocked by network mount (%@)", v11];
  }
  else
  {
    if (v6)
    {
      [v6 appendString:@", "];
    }
    else
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      char v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    unint64_t v11 = SACopySanitizedString(v17, 1, 0);
    uint64_t v16 = SACopySanitizedString(v5, 1, 0);
    [v15 appendFormat:@"Thread becomes blocked by network mount %@ (%@)", v11, v16];
  }
}

uint64_t __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke_2114(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5, char *a6, void *a7, int a8, char a9)
{
  LODWORD(v598) = a8;
  uint64_t v656 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = a4;
  long long v584 = a5;
  id v17 = a5;
  id v582 = a7;
  int v18 = a7;
  uint64_t v19 = v18;
  double v585 = v16;
  long long v587 = v18;
  v611 = v17;
  uint64_t v594 = a2;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
    uint64_t v20 = [v23 objectAtIndexedSubscript:a3];

    unint64_t v24 = [v19 endSampleIndex];
    unint64_t v25 = *(void *)(*(void *)(a1 + 32) + 56);
    if (v24 < v25) {
      unint64_t v25 = v24;
    }
    unint64_t v606 = v25;
    if (v16 && *(unsigned char *)(a1 + 248))
    {
      unint64_t v26 = [v16 endSampleIndex];
      unint64_t v27 = v606;
      if (v606 >= v26) {
        unint64_t v27 = v26;
      }
      unint64_t v606 = v27;
    }
    uint64_t v9 = v606;
    if (v606 < a3)
    {
      int v374 = *__error();
      __int16 v375 = _sa_logt();
      if (!os_log_type_enabled(v375, OS_LOG_TYPE_FAULT))
      {
LABEL_613:

        int v96 = 0;
        *__error() = v374;
        uint64_t v95 = v611;
        goto LABEL_590;
      }
LABEL_688:
      unint64_t v498 = *(void *)(*(void *)(a1 + 32) + 176);
      -[SAThreadState debugDescriptionWithThread:](v587, v611);
      id v610 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v499 = -[SATaskState debugDescriptionWithTask:]((uint64_t)v16, *(void **)(a1 + 40));
      int v608 = *(unsigned __int8 *)(a1 + 248);
      uint64_t v500 = *(void *)(a1 + 32);
      id v603 = (void *)v499;
      uint64_t v605 = *(void *)(v500 + 48);
      uint64_t v589 = v20;
      uint64_t v501 = *(void *)(v500 + 56);
      id v502 = [*(id *)(v500 + 32) debugDescription];
      double v503 = [*(id *)(*(void *)(a1 + 32) + 40) debugDescription];
      uint64_t v504 = *(void *)(a1 + 208);
      BOOL v505 = *(void *)(a1 + 48) != 0;
      BOOL v506 = *(void *)(a1 + 56) != 0;
      BOOL v507 = *(void *)(a1 + 64) != 0;
      BOOL v508 = *(void *)(a1 + 72) != 0;
      *(_DWORD *)long long buf = 138416130;
      unint64_t v632 = v498;
      uint64_t v19 = v587;
      __int16 v633 = 2048;
      uint64_t v634 = a3;
      __int16 v635 = 2048;
      unint64_t v636 = v606;
      __int16 v637 = 2112;
      *(void *)id v638 = v610;
      *(_WORD *)&v638[8] = 2112;
      *(void *)&v638[10] = v603;
      *(_WORD *)&v638[18] = 1024;
      *(_DWORD *)&v638[20] = v608;
      *(_WORD *)&v638[24] = 2048;
      *(void *)&v638[26] = v605;
      __int16 v639 = 2048;
      uint64_t v640 = v501;
      uint64_t v20 = v589;
      __int16 v641 = 2112;
      uint64_t v642 = (uint64_t)v502;
      __int16 v643 = 2112;
      uint64_t v644 = (uint64_t)v503;
      __int16 v645 = 2048;
      uint64_t v646 = v504;
      __int16 v647 = 2048;
      *(void *)v648 = v594;
      *(_WORD *)&v648[8] = 1024;
      *(_DWORD *)&v648[10] = v505;
      __int16 v649 = 1024;
      *(_DWORD *)v650 = v506;
      *(_WORD *)&v650[4] = 1024;
      *(_DWORD *)&v650[6] = v507;
      LOWORD(v651) = 1024;
      *(_DWORD *)((char *)&v651 + 2) = v508;
      _os_log_fault_impl(&dword_1BF22B000, v375, OS_LOG_TYPE_FAULT, "incident %@. sampleIndex %lu, endIndex %lu, thread state %@, task state %@ (%d), report start index %lu, report end index %lu, report start time %@, report end time %@, starting iterator index %lu, iterator index %lu, by-thread:%d indexes:%d, by-dispatchQueue:%d, by-swiftTaskStates:%d", buf, 0x8Eu);

      uint64_t v16 = v585;
      goto LABEL_613;
    }
    uint64_t v28 = v606 - a3 + 1;
    id v29 = [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
    id v609 = [v29 objectAtIndexedSubscript:v606];

    goto LABEL_24;
  }
  uint64_t v20 = [v18 startTimestamp];
  if (v16 && *(unsigned char *)(a1 + 248))
  {
    uint64_t v21 = [v16 startTimestamp];
    uint64_t v9 = v20;
    int v22 = [v21 gt:v20];

    if (v22)
    {
      uint64_t v20 = [v16 startTimestamp];
    }
    else
    {
      uint64_t v20 = v9;
    }
  }
  long long v31 = [v19 endTimestamp];
  if (v16 && *(unsigned char *)(a1 + 248))
  {
    uint64_t v9 = v20;
    long long v32 = [v16 endTimestamp];
    int v33 = [v32 lt:v31];

    if (v33)
    {
      uint64_t v34 = [v16 endTimestamp];

      long long v31 = (void *)v34;
    }
    uint64_t v20 = v9;
  }
  if (!v20)
  {
    uint64_t v376 = v17;
    int v377 = *__error();
    long long v378 = _sa_logt();
    if (os_log_type_enabled(v378, OS_LOG_TYPE_ERROR))
    {
      -[SAThreadState debugDescriptionWithThread:](v19, v376);
      id v379 = objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v379 UTF8String];
      -[SATaskState debugDescriptionWithTask:]((uint64_t)v16, *(void **)(a1 + 40));
      a3 = (unint64_t) objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 136315394;
      unint64_t v632 = v9;
      __int16 v633 = 2080;
      uint64_t v634 = [(id)a3 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v378, OS_LOG_TYPE_ERROR, "nil startTimestamp for %s %s", buf, 0x16u);
    }
    *__error() = v377;
    -[SAThreadState debugDescriptionWithThread:](v19, v376);
    id v380 = objc_claimAutoreleasedReturnValue();
    char v381 = [v380 UTF8String];
    -[SATaskState debugDescriptionWithTask:]((uint64_t)v16, *(void **)(a1 + 40));
    id v17 = objc_claimAutoreleasedReturnValue();
    [v17 UTF8String];
    _SASetCrashLogMessage(10504, "nil startTimestamp for %s %s", v382, v383, v384, v385, v386, v387, v381);

    _os_crash();
    __break(1u);
    goto LABEL_617;
  }
  if (!v31)
  {
LABEL_617:
    uint64_t v388 = v17;
    int v389 = *__error();
    uint64_t v390 = _sa_logt();
    if (os_log_type_enabled(v390, OS_LOG_TYPE_ERROR))
    {
      -[SAThreadState debugDescriptionWithThread:](v19, v388);
      id v391 = objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v391 UTF8String];
      -[SATaskState debugDescriptionWithTask:]((uint64_t)v16, *(void **)(a1 + 40));
      a3 = (unint64_t) objc_claimAutoreleasedReturnValue();
      uint64_t v392 = [(id)a3 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      unint64_t v632 = v9;
      __int16 v633 = 2080;
      uint64_t v634 = v392;
      _os_log_error_impl(&dword_1BF22B000, v390, OS_LOG_TYPE_ERROR, "nil endTimestamp for %s %s", buf, 0x16u);
    }
    *__error() = v389;
    -[SAThreadState debugDescriptionWithThread:](v19, v388);
    uint64_t v258 = (uint64_t *) objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v258 UTF8String];
    -[SATaskState debugDescriptionWithTask:]((uint64_t)v16, *(void **)(a1 + 40));
    id v294 = (int *) objc_claimAutoreleasedReturnValue();
    [v294 UTF8String];
    _SASetCrashLogMessage(10505, "nil endTimestamp for %s %s", v393, v394, v395, v396, v397, v398, v20);

    _os_crash();
    __break(1u);
    goto LABEL_620;
  }
  id v609 = v31;
  unint64_t v606 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = 1;
LABEL_24:
  id v35 = *(void **)(a1 + 80);
  uint64_t v604 = a1;
  if (v35
    && (uint64_t v9 = v20,
        objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "threadId")),
        uint64_t v36 = objc_claimAutoreleasedReturnValue(),
        char v37 = [v35 containsObject:v36],
        v36,
        uint64_t v20 = v9,
        (v37 & 1) != 0)
    || !*(unsigned char *)(a1 + 249))
  {
    unint64_t v581 = 0;
    int v41 = 0;
    goto LABEL_138;
  }
  long long v629 = 0u;
  long long v630 = 0u;
  long long v627 = 0u;
  long long v628 = 0u;
  id v38 = *(id *)(*(void *)(a1 + 32) + 120);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v627 objects:v655 count:16];
  int v41 = v39 == 0;
  if (!v39)
  {
    unint64_t v581 = 0;
LABEL_134:

    goto LABEL_138;
  }
  uint64_t v42 = v39;
  LODWORD(v592) = v39 == 0;
  uint64_t v595 = v28;
  uint64_t v28 = v20;
  uint64_t v43 = *(void *)v628;
  char v44 = 1;
  unint64_t v600 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v601 = a3;
  unint64_t v607 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v45 = 0;
    do
    {
      if (*(void *)v628 != v43) {
        objc_enumerationMutation(v38);
      }
      uint64_t v9 = *(void *)(*((void *)&v627 + 1) + 8 * v45);
      if (v9)
      {
        if (*(void *)(v9 + 16))
        {
          uint64_t v46 = [v611 threadId];
          uint64_t v47 = *(void *)(v9 + 16);
          if (v46 == v47)
          {
            if (!-[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32))) {
              goto LABEL_53;
            }
LABEL_42:
            if (*(void *)(v9 + 40) > v606) {
              goto LABEL_89;
            }
            unint64_t v50 = *(void *)(v9 + 48);
            goto LABEL_44;
          }
          if (v47) {
            goto LABEL_89;
          }
        }
        id Property = objc_getProperty((id)v9, v40, 8, 1);
      }
      else
      {
        id Property = 0;
      }
      id v49 = Property;
      uint64_t p_superclass = *(void *)(a1 + 40);

      if (v49 != (id)p_superclass) {
        goto LABEL_89;
      }
      if (!-[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32)))
      {
        if (v9) {
LABEL_53:
        }
          id v54 = objc_getProperty((id)v9, v40, 24, 1);
        else {
          id v54 = 0;
        }
        id v55 = v54;
        if (([v55 le:v609] & 1) == 0)
        {

          goto LABEL_89;
        }
        if (v9) {
          id v57 = objc_getProperty((id)v9, v56, 32, 1);
        }
        else {
          id v57 = 0;
        }
        uint64_t p_superclass = (uint64_t)v57;
        int v58 = [(id)p_superclass ge:v28];

        if (v58)
        {
          if (v9) {
            id v59 = objc_getProperty((id)v9, v40, 32, 1);
          }
          else {
            id v59 = 0;
          }
          uint64_t v60 = (void *)v28;
          id v61 = v59;
          int v62 = [v61 gt:v609];

          if (v62)
          {
            a1 = v604;
            if (v9) {
              id v64 = objc_getProperty((id)v9, v63, 32, 1);
            }
            else {
              id v64 = 0;
            }
            id v65 = v64;

            id v609 = v65;
          }
          else
          {
            a1 = v604;
          }
          if (v9) {
            id v66 = objc_getProperty((id)v9, v63, 24, 1);
          }
          else {
            id v66 = 0;
          }
          id v67 = v66;
          uint64_t p_superclass = [v67 lt:v28];

          if (p_superclass)
          {
            if (v9) {
              id v68 = objc_getProperty((id)v9, v40, 24, 1);
            }
            else {
              id v68 = 0;
            }
            uint64_t v28 = (uint64_t)v68;
          }
          goto LABEL_79;
        }
        goto LABEL_88;
      }
      if (v9) {
        goto LABEL_42;
      }
      unint64_t v50 = 0;
LABEL_44:
      if (v50 < v601) {
        goto LABEL_89;
      }
      unint64_t v51 = v607;
      unint64_t v52 = v600;
      if (v607 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v53 = v9 ? *(void *)(v9 + 40) : 0;
        if (v607 <= v53)
        {
          if (v600 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v9) {
              goto LABEL_74;
            }
            unint64_t v69 = 0;
LABEL_75:
            if (v52 >= v69)
            {
              unint64_t v607 = v51;
LABEL_79:
              char v44 = 0;
              goto LABEL_89;
            }
          }
          if (v9)
          {
LABEL_77:
            unint64_t v607 = v51;
            char v44 = 0;
            unint64_t v600 = *(void *)(v9 + 48);
            goto LABEL_89;
          }
          unint64_t v607 = v51;
          unint64_t v600 = 0;
          goto LABEL_79;
        }
      }
      if (v9)
      {
        unint64_t v51 = *(void *)(v9 + 40);
        if (v600 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_77;
        }
LABEL_74:
        unint64_t v69 = *(void *)(v9 + 48);
        goto LABEL_75;
      }
      unint64_t v607 = 0;
      if (v600 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v51 = 0;
        unint64_t v69 = 0;
        a1 = v604;
        unint64_t v52 = v600;
        goto LABEL_75;
      }
      char v44 = 0;
      unint64_t v600 = 0;
LABEL_88:
      a1 = v604;
LABEL_89:
      ++v45;
    }
    while (v42 != v45);
    uint64_t v70 = [v38 countByEnumeratingWithState:&v627 objects:v655 count:16];
    uint64_t v42 = v70;
  }
  while (v70);

  if (v44)
  {
    unint64_t v581 = 0;
    int v41 = 1;
    uint64_t v16 = v585;
LABEL_136:
    uint64_t v19 = v587;
    a3 = v601;
    uint64_t v20 = v28;
    goto LABEL_137;
  }
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = v585;
  if (v607 == 0x7FFFFFFFFFFFFFFFLL || v607 <= v601) {
    goto LABEL_128;
  }
  if (v607 > v606)
  {
    int v439 = *__error();
    double v440 = _sa_logt();
    if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR))
    {
      id v441 = [v587 debugDescription];
      uint64_t v442 = [v441 UTF8String];
      id v443 = [v585 debugDescription];
      uint64_t v28 = [v443 UTF8String];
      uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 120) debugDescription];
      uint64_t v444 = [v16 UTF8String];
      *(_DWORD *)long long buf = 134219266;
      unint64_t v632 = v607;
      __int16 v633 = 2048;
      uint64_t v634 = v601;
      __int16 v635 = 2048;
      unint64_t v636 = v595;
      __int16 v637 = 2080;
      *(void *)id v638 = v442;
      *(_WORD *)&v638[8] = 2080;
      *(void *)&v638[10] = v28;
      *(_WORD *)&v638[18] = 2080;
      *(void *)&v638[20] = v444;
      _os_log_error_impl(&dword_1BF22B000, v440, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu < sampleIndex %lu + sampleCount %lu for %s, %s hidStepSamples:\n%s", buf, 0x3Eu);
    }
    *__error() = v439;
    id v445 = [v587 debugDescription];
    [v445 UTF8String];
    id v446 = [v585 debugDescription];
    [v446 UTF8String];
    id v447 = [*(id *)(*(void *)(a1 + 32) + 120) debugDescription];
    [v447 UTF8String];
    _SASetCrashLogMessage(10564, "startSampleIndexCap %lu < sampleIndex %lu + sampleCount %lu for %s, %s hidStepSamples:\n%s", v448, v449, v450, v451, v452, v453, v607);

    _os_crash();
    __break(1u);
    goto LABEL_652;
  }
  unint64_t v71 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  unint64_t v72 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  if (v71 >= v72 && v71 != 0x7FFFFFFFFFFFFFFFLL || v72 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v72 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  }
  uint64_t v75 = *(void *)(a1 + 32);
  uint64_t v76 = *(void *)(v75 + 48);
  uint64_t v77 = v76 - 1;
  if (!v76) {
    uint64_t v77 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v72 != 0x7FFFFFFFFFFFFFFFLL || v76 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v79 = v72;
  }
  else {
    unint64_t v79 = v77;
  }
  unint64_t v80 = v607 - 1;
  if (v79 == 0x7FFFFFFFFFFFFFFFLL || v79 < v80)
  {
    if (v79 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v82 = 0;
    }
    else {
      unint64_t v82 = ~v79;
    }
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += v82 + v607;
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v80;
    uint64_t v75 = *(void *)(a1 + 32);
  }
  uint64_t v595 = v606 - v607 + 1;
  id v83 = [*(id *)(v75 + 160) sampleTimestamps];
  uint64_t v9 = [v83 objectAtIndexedSubscript:v607];

  uint64_t v28 = v9;
  unint64_t v601 = v607;
LABEL_128:
  int v41 = 0;
  if (v600 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v581 = 0;
    goto LABEL_136;
  }
  if (v606 > v600)
  {
    if (v600 >= v601)
    {
      id v38 = [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
      [v38 objectAtIndexedSubscript:v600];
      v84 = uint64_t v9 = v600;

      unint64_t v581 = v606 - v600;
      unint64_t v606 = v600;
      id v609 = (id)v84;
      uint64_t v19 = v587;
      a3 = v601;
      uint64_t v20 = v28;
      uint64_t v28 = v600 - v601 + 1;
      int v41 = v592;
      goto LABEL_134;
    }
LABEL_652:
    int v454 = *__error();
    id v455 = _sa_logt();
    if (os_log_type_enabled(v455, OS_LOG_TYPE_ERROR))
    {
      id v456 = [v587 debugDescription];
      uint64_t v457 = [v456 UTF8String];
      id v458 = [v585 debugDescription];
      uint64_t v28 = [v458 UTF8String];
      uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 120) debugDescription];
      uint64_t v459 = [v16 UTF8String];
      *(_DWORD *)long long buf = 134219010;
      unint64_t v632 = v607;
      __int16 v633 = 2048;
      uint64_t v634 = v601;
      __int16 v635 = 2080;
      unint64_t v636 = v457;
      __int16 v637 = 2080;
      *(void *)id v638 = v28;
      *(_WORD *)&v638[8] = 2080;
      *(void *)&v638[10] = v459;
      _os_log_error_impl(&dword_1BF22B000, v455, OS_LOG_TYPE_ERROR, "endSampleIndexCap %lu >= sampleIndex %lu for %s, %s hidStepSamples:\n%s", buf, 0x34u);
    }
    *__error() = v454;
    id v460 = [v587 debugDescription];
    [v460 UTF8String];
    uint64_t v9 = [v585 debugDescription];
    [(id)v9 UTF8String];
    id v461 = [*(id *)(*(void *)(a1 + 32) + 120) debugDescription];
    [v461 UTF8String];
    _SASetCrashLogMessage(10586, "endSampleIndexCap %lu >= sampleIndex %lu for %s, %s hidStepSamples:\n%s", v462, v463, v464, v465, v466, v467, v607);

    _os_crash();
    __break(1u);
LABEL_655:
    int v468 = *__error();
    v469 = _sa_logt();
    if (os_log_type_enabled(v469, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [*(id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40) debugDescription];
      uint64_t v470 = [(id)v20 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      unint64_t v632 = v470;
      _os_log_error_impl(&dword_1BF22B000, v469, OS_LOG_TYPE_ERROR, "leaf frame %s !isLeafFrame", buf, 0xCu);
    }
    *__error() = v468;
    id v471 = [*(id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40) debugDescription];
    char v472 = [v471 UTF8String];
    _SASetCrashLogMessage(11030, "leaf frame %s !isLeafFrame", v473, v474, v475, v476, v477, v478, v472);

    _os_crash();
    __break(1u);
LABEL_658:
    int v479 = *__error();
    v480 = _sa_logt();
    if (os_log_type_enabled(v480, OS_LOG_TYPE_ERROR))
    {
      uint64_t v481 = (objc_class *)objc_opt_class();
      NSStringFromClass(v481);
      uint64_t v20 = (uint64_t) objc_claimAutoreleasedReturnValue();
      uint64_t v482 = [(id)v20 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      unint64_t v632 = v482;
      _os_log_error_impl(&dword_1BF22B000, v480, OS_LOG_TYPE_ERROR, "treeCountedState is a %s", buf, 0xCu);
    }
    *__error() = v479;
    id v483 = (objc_class *)objc_opt_class();
    NSStringFromClass(v483);
    uint64_t v258 = (uint64_t *) objc_claimAutoreleasedReturnValue();
    char v484 = [v258 UTF8String];
    _SASetCrashLogMessage(11039, "treeCountedState is a %s", v485, v486, v487, v488, v489, v490, v484);

    _os_crash();
    __break(1u);
    goto LABEL_661;
  }
  uint64_t v20 = v28;
  unint64_t v581 = 0;
  uint64_t v19 = v587;
  a3 = v601;
LABEL_137:
  uint64_t v28 = v595;
LABEL_138:
  if ((!*(unsigned char *)(a1 + 250) || ([v19 isRunning] & 1) == 0)
    && (!*(unsigned char *)(a1 + 251) || ([v19 isRunnable] & 1) == 0)
    && (!*(unsigned char *)(a1 + 252)
     || ([v19 isRunning] & 1) != 0
     || [v19 isRunnable]))
  {
    int v41 = 1;
  }
  int v85 = *(_DWORD *)(a1 + 240);
  if (v85 && v85 < (int)[v19 basePriority]
    || (int v86 = *(_DWORD *)(a1 + 244)) != 0 && v86 > (int)[v19 basePriority]
    || *(unsigned char *)(a1 + 253)
    && [v19 isBatteryAndUserActivityValid]
    && ([v19 isUserActive] & 1) != 0
    || *(unsigned char *)(a1 + 254)
    && [v19 isBatteryAndUserActivityValid]
    && ![v19 isUserActive]
    || *(unsigned char *)(a1 + 255)
    && [v19 isBatteryAndUserActivityValid]
    && ([v19 isOnBattery] & 1) != 0
    || *(unsigned char *)(a1 + 256)
    && [v19 isBatteryAndUserActivityValid]
    && ([v19 isOnBattery] & 1) == 0)
  {
    int v41 = 1;
  }
  if (*(unsigned char *)(a1 + 257) || *(unsigned char *)(a1 + 258))
  {
    if ([v19 isRunning])
    {
      uint64_t v87 = (const char *)[v19 cpuNum];
      if (v87 != -1)
      {
        id v88 = v87;
        if (*(unsigned char *)(a1 + 257)) {
          v41 |= ((unint64_t)-[SASampleStore clusterFlagsForCPUNum:](*(void **)(*(void *)(a1 + 32) + 160), v87) >> 1) & 1;
        }
        if (*(unsigned char *)(a1 + 258)) {
          v41 |= -[SASampleStore clusterFlagsForCPUNum:](*(void **)(*(void *)(a1 + 32) + 160), v88);
        }
      }
    }
  }
  uint64_t v588 = v20;
  if (*(unsigned char *)(a1 + 259)
    || *(void *)(a1 + 216) == 1
    || *(void *)(a1 + 224) == 3
    || *(void *)(a1 + 72)
    || ![v19 hasSwiftTask]
    || ([v611 isMainThread] & 1) != 0
    || [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId]
    && (uint64_t v89 = [v611 threadId],
        v89 == [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId]))
  {
    BOOL v90 = 0;
    goto LABEL_180;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId] || !*(void *)(a1 + 64)) {
    goto LABEL_181;
  }
  char v353 = [*(id *)(*(void *)(a1 + 32) + 160) targetProcess];
  if (v353 == *(void **)(a1 + 40))
  {
    uint64_t v362 = [*(id *)(a1 + 64) identifier];
    BOOL v90 = v362 != [*(id *)(*(void *)(a1 + 32) + 160) targetDispatchQueueId];
  }
  else
  {
    BOOL v90 = 1;
  }

LABEL_180:
  char v91 = v90 | v41;
  uint64_t v20 = v588;
  if (v91)
  {
LABEL_181:
    unint64_t v92 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    if (v92 == 0x7FFFFFFFFFFFFFFFLL || v606 > v92)
    {
      if (v92 < a3 || v92 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v92 = a3 - 1;
      }
      *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) += v606 - v92;
      *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v606;
    }
    uint64_t v94 = *(void *)(*(void *)(a1 + 128) + 8);
    uint64_t v95 = v611;
    if (!*(unsigned char *)(v94 + 24) && v598) {
      *(unsigned char *)(v94 + 24) = 1;
    }
    int v96 = v609;
    goto LABEL_590;
  }
  id v626 = 0;
  id newValue = 0;
  id v624 = 0;
  uint64_t v95 = v611;
  if (*(unsigned char *)(a1 + 260))
  {
    uint64_t v97 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
    if (v97 != [v611 threadId])
    {
      *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [v611 threadId];
      id v99 = *(id *)(*(void *)(a1 + 32) + 160);
      if (v99) {
        id v99 = objc_getProperty(v99, v98, 968, 1);
      }
      id v100 = v99;
      uint64_t v101 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24)];
      uint64_t v9 = [v100 objectForKeyedSubscript:v101];
      uint64_t v102 = [(id)v9 objectEnumerator];
      uint64_t v103 = *(void *)(*(void *)(a1 + 144) + 8);
      uint64_t v104 = *(void **)(v103 + 40);
      *(void *)(v103 + 40) = v102;

      uint64_t v105 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) nextObject];
      uint64_t v106 = *(void *)(*(void *)(a1 + 152) + 8);
      uint64_t v107 = *(void **)(v106 + 40);
      *(void *)(v106 + 40) = v105;

      uint64_t v20 = v588;
    }
    char v108 = *(void **)(*(void *)(*(void *)(a1 + 152) + 8) + 40);
    if (v108)
    {
      uint64_t v109 = -[SASamplePrinter _findIOBefore:during:after:thread:stateIndex:inIO:nextIO:](*(void *)(a1 + 32), &v626, &newValue, &v624, v611, (unint64_t)a6, *(void **)(*(void *)(*(void *)(a1 + 144) + 8) + 40), v108);
      uint64_t v110 = *(void *)(*(void *)(a1 + 152) + 8);
      char v111 = *(void **)(v110 + 40);
      *(void *)(v110 + 40) = v109;
    }
  }
  if (v598)
  {
LABEL_203:
    int v571 = 1;
  }
  else
  {
    uint64_t v112 = *(void *)(*(void *)(a1 + 128) + 8);
    if (*(unsigned char *)(v112 + 24))
    {
      *(unsigned char *)(v112 + 24) = 0;
      goto LABEL_203;
    }
    int v571 = 0;
  }
  unint64_t v601 = a3;
  uint64_t v595 = v28;
  if (*(unsigned char *)(a1 + 261) && !*(unsigned char *)(a1 + 262))
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v114 = 0;
      uint64_t p_superclass = 0;
    }
    else
    {
      uint64_t v115 = [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
      uint64_t p_superclass = [v115 objectAtIndexedSubscript:a3];

      uint64_t v116 = *(void *)(a1 + 32);
      if (a3 <= *(void *)(v116 + 48))
      {
        id v114 = 0;
      }
      else
      {
        id v117 = [*(id *)(v116 + 160) sampleTimestamps];
        id v114 = [v117 objectAtIndexedSubscript:a3 - 1];
      }
    }
    uint64_t v118 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
    if (v118)
    {
      char v119 = v626;
      if (v626)
      {
        objc_msgSend(v626, "addObjectsFromArray:");
        id v120 = (id)[v119 sortedArrayUsingComparator:&__block_literal_global_2126];
      }
      else
      {
        id v626 = v118;
      }
    }
    int v121 = *(void **)(a1 + 64);
    int v122 = *(void **)(a1 + 72);
    int v123 = *(void **)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    int v124 = *(void **)(a1 + 40);
    if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) >= v601) {
      uint64_t v125 = 0;
    }
    else {
      uint64_t v125 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    }
    if (!v114
      || (v126 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) lt:v114], int v127 = v114, v126))
    {
      int v127 = *(void **)(*(void *)(*(void *)(a1 + 168) + 8) + 40);
    }
    int v562 = *(_DWORD *)(a1 + 264);
    uint64_t v561 = v125;
    uint64_t v19 = v587;
    int v128 = v122;
    uint64_t v95 = v611;
    uint64_t v16 = v585;
    -[SASamplePrinter stateChangeStringForThreadState:serialDispatchQueue:swiftTaskStates:thread:threadStateIndexes:taskState:task:iteratorIndex:missingStateIsInAnotherStack:numSamplesOmittedSincePreviousDisplayedSample:sampleTimestamp:previousSampleTimestamp:previousDisplayedTimestamp:previousTaskState:previousThread:previousThreadState:dispatchQueueChanges:swiftTaskChanges:priorityChanges:nameChanges:threadChanges:isTimeJump:ioEventsSincePreviousThreadState:](v9, v587, v121, v128, v611, v123, v585, v124, v594, a9, v561, (void *)p_superclass, v114, v127, *(void **)(*(void *)(*(void *)(a1 + 176) + 8) + 40), *(void **)(*(void *)(*(void *)(a1 + 184) + 8) + 40), *(void **)(*(void *)(*(void *)(a1 + 192) + 8) + 40), *(unsigned char *)(a1 + 263), v562,
      SBYTE1(v562),
      SBYTE2(v562),
      SHIBYTE(v562),
      v571,
    uint64_t v113 = v626);

    a3 = v601;
    uint64_t v20 = v588;
    uint64_t v28 = v595;
  }
  else
  {
    uint64_t v113 = 0;
  }
  uint64_t v598 = v113;
  if (*(unsigned char *)(a1 + 268))
  {
    if ([v19 hasSwiftTask])
    {
      int v129 = v95;
      uint64_t v130 = *(void *)(a1 + 32);
      uint64_t v131 = *(void *)(a1 + 72);
      if ([v129 isMainThread])
      {
        BOOL v132 = 1;
      }
      else
      {
        uint64_t v134 = [v129 threadId];
        BOOL v132 = v134 == [*(id *)(*(void *)(a1 + 32) + 160) targetThreadId];
      }
      if (!v130)
      {
        uint64_t v133 = 0;
        goto LABEL_241;
      }
      uint64_t v135 = *(void *)(v130 + 16);
      if (v135
        && (*(void *)(v135 + 160) == 1
         || (uint64_t v136 = *(void *)(v135 + 152), v136 == 3)
         || !v136 && *(unsigned char *)(v135 + 11)))
      {
        int v137 = [(id)v135 swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
        uint64_t v133 = 4;
        if (!v137) {
          uint64_t v133 = 0;
        }
LABEL_241:
        uint64_t v95 = v611;
        uint64_t v20 = v588;
      }
      else
      {
        if (v131)
        {
          uint64_t v20 = v588;
          if ([(id)v135 swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways])
          {
            uint64_t v133 = 0;
          }
          else
          {
            int v138 = [*(id *)(v130 + 16) swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways];
            uint64_t v133 = 8;
            if (!(v132 | v138)) {
              uint64_t v133 = 0;
            }
          }
        }
        else
        {
          uint64_t v20 = v588;
          if ([(id)v135 swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways])
          {
            uint64_t v133 = 4;
          }
          else
          {
            int v139 = [*(id *)(v130 + 16) swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways];
            uint64_t v133 = 16;
            uint64_t v140 = 4;
            if (!v132) {
              uint64_t v140 = 16;
            }
            if (!v139) {
              uint64_t v133 = v140;
            }
          }
        }
        uint64_t v95 = v611;
      }
    }
    else
    {
      uint64_t v133 = 0;
    }
  }
  else
  {
    uint64_t v133 = 2;
  }
  uint64_t v141 = v133 | (*(unsigned char *)(a1 + 269) == 0);
  if (*(unsigned char *)(a1 + 270)) {
    uint64_t v142 = v141;
  }
  else {
    uint64_t v142 = v141 | 0x20;
  }
  uint64_t v143 = *(id **)(*(void *)(*(void *)(a1 + 192) + 8) + 40);
  if (v143
    && v143 == v19
    && (!*(unsigned char *)(a1 + 248) || *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 176) + 8) + 40) == v16))
  {
    if (!v598)
    {
      uint64_t v598 = 0;
      goto LABEL_586;
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_274;
    }
    goto LABEL_635;
  }
  LODWORD(v594) = 0;
  if (!v143 || *(unsigned char *)(a1 + 262))
  {
LABEL_279:
    uint64_t v154 = [*(id *)(*(void *)(a1 + 32) + 160) cpuSignalHandlerStackLeafKernelFrame];
    int v155 = [v19 stackWithBacktraceStyle:v142 ignoringKernelStackWithLeafFrame:v154];

    id v146 = v155;
    if (![v155 count])
    {
      uint64_t v159 = *(void *)(*(void *)(a1 + 200) + 8);
      uint64_t v9 = *(void *)(v159 + 40);
      *(void *)(v159 + 40) = 0;
      goto LABEL_365;
    }
    if (!*(unsigned char *)(a1 + 271)) {
      goto LABEL_301;
    }
    int v156 = [v155 objectAtIndexedSubscript:0];
    if ([v156 isTruncatedBacktraceFrame])
    {
      uint64_t v157 = v146;
      unint64_t v158 = [v146 count];

      if (v158 < 2)
      {
        id v146 = v157;
        goto LABEL_301;
      }
      id v146 = [v95 patchedStackForTruncatedStack:v157];
      int v156 = v157;
    }

LABEL_301:
    uint64_t v9 = (uint64_t)*(id *)(a1 + 88);
    uint64_t v165 = [v146 count];
    long long v620 = 0u;
    long long v621 = 0u;
    long long v622 = 0u;
    long long v623 = 0u;
    obuint64_t j = v146;
    uint64_t v592 = [obj countByEnumeratingWithState:&v620 objects:v654 count:16];
    id v579 = (unsigned __int8 *)v165;
    a1 = 0;
    if (!v592) {
      goto LABEL_363;
    }
    uint64_t p_superclass = v165 - 1;
    uint64_t v590 = *(void *)v621;
    uint64_t v578 = 138412290;
    unint64_t v166 = 0x1E63F6000uLL;
    unint64_t v167 = 0x1EA144000uLL;
    while (1)
    {
      int v168 = 0;
      unint64_t v600 = v9;
      do
      {
        if (*(void *)v621 != v590) {
          objc_enumerationMutation(obj);
        }
        a6 = v168;
        uint64_t v9 = *(void *)(*((void *)&v620 + 1) + 8 * (void)v168);
        if (v594) {
          goto LABEL_332;
        }
        if (!*(unsigned char *)(v604 + 262))
        {
          uint64_t v180 = [(id)v600 lastObject];
          if (!v180) {
            goto LABEL_331;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_331;
          }
          int v181 = [v180 isTruncatedLeafCallstack];
          if (v181 != [(id)v9 isLeafyCallstackIsInAnotherCallTreeFrame]) {
            goto LABEL_331;
          }
          if (((p_superclass == a1) ^ v180[*(int *)(v167 + 3484)])) {
            goto LABEL_331;
          }
          uint64_t v182 = *(void *)(v604 + 32);
          a3 = [v180 frame];
          LODWORD(v182) = -[SASamplePrinter frame:matchesFrame:](v182, (void *)a3, (void *)v9);

          if (!v182) {
            goto LABEL_331;
          }
          uint64_t v16 = v180;

LABEL_344:
          uint64_t v191 = v598;
          objc_msgSend(v16, "setSampleCount:", objc_msgSend(v16, "sampleCount") + v595);
          a3 = v601;
          goto LABEL_354;
        }
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        unint64_t v607 = (unint64_t)(id)v600;
        uint64_t v169 = [(id)v607 countByEnumeratingWithState:&v616 objects:v653 count:16];
        if (!v169) {
          goto LABEL_324;
        }
        uint64_t v170 = v169;
        uint64_t v171 = *(void *)v617;
        do
        {
          uint64_t v172 = 0;
          do
          {
            if (*(void *)v617 != v171) {
              objc_enumerationMutation((id)v607);
            }
            int v173 = *(unsigned __int8 **)(*((void *)&v616 + 1) + 8 * v172);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              a3 = [v173 isTruncatedLeafCallstack];
              if (a3 == [(id)v9 isLeafyCallstackIsInAnotherCallTreeFrame])
              {
                if (v173)
                {
                  if (((p_superclass == a1) ^ v173[*(int *)(v167 + 3484)])) {
                    goto LABEL_318;
                  }
                }
                else if (p_superclass == a1)
                {
                  goto LABEL_318;
                }
                uint64_t v174 = *(void *)(v604 + 32);
                [v173 frame];
                unint64_t v175 = v166;
                uint64_t v176 = a1;
                v178 = uint64_t v177 = p_superclass;
                a3 = -[SASamplePrinter frame:matchesFrame:](v174, v178, (void *)v9);

                uint64_t p_superclass = v177;
                a1 = v176;
                unint64_t v166 = v175;
                unint64_t v167 = 0x1EA144000;
                if (a3)
                {
                  uint64_t v16 = v173;

                  uint64_t v19 = v587;
                  uint64_t v95 = v611;
                  if (!v173) {
                    goto LABEL_332;
                  }
                  goto LABEL_344;
                }
              }
            }
LABEL_318:
            ++v172;
          }
          while (v170 != v172);
          uint64_t v179 = [(id)v607 countByEnumeratingWithState:&v616 objects:v653 count:16];
          uint64_t v170 = v179;
        }
        while (v179);
        uint64_t v19 = v587;
        uint64_t v95 = v611;
LABEL_324:
        uint64_t v180 = (unsigned __int8 *)v607;
LABEL_331:

LABEL_332:
        if (v598)
        {
          [(id)v600 addObject:v598];
        }
        if (![(id)v9 isLeafyCallstackIsInAnotherCallTreeFrame])
        {
          a3 = v601;
          [*(id *)(v166 + 3336) callTreeFrameWithFrame:v9 startSampleIndex:v601 sampleCount:v595 isLeafFrame:p_superclass == a1];
          uint64_t v16 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
          goto LABEL_353;
        }
        uint64_t v183 = p_superclass - a1;
        if (p_superclass != a1)
        {
          uint64_t p_superclass = *__error();
          char v363 = _sa_logt();
          if (os_log_type_enabled(v363, OS_LOG_TYPE_ERROR))
          {
            id v364 = [(id)v9 debugDescription];
            uint64_t v365 = [v364 UTF8String];
            uint64_t v366 = a1 + 1;
            a1 = (uint64_t)obj;
            [obj objectAtIndexedSubscript:v366];
            uint64_t v9 = v241 = v9;
            a3 = [(id)v9 debugDescription];
            uint64_t v367 = [(id)a3 UTF8String];
            *(_DWORD *)long long buf = 136315650;
            unint64_t v632 = v365;
            __int16 v633 = 2048;
            uint64_t v634 = v183;
            __int16 v635 = 2080;
            unint64_t v636 = v367;
            _os_log_error_impl(&dword_1BF22B000, v363, OS_LOG_TYPE_ERROR, "leafy truncated frame %s not leaf: %lu more to go (%s is next)", buf, 0x20u);
          }
          else
          {
            uint64_t v366 = a1 + 1;
            a1 = (uint64_t)obj;
            uint64_t v241 = v9;
          }

          *__error() = p_superclass;
          uint64_t v258 = [(id)v241 debugDescription];
          id v294 = (int *)[v258 UTF8String];
          uint64_t v20 = [(id)a1 objectAtIndexedSubscript:v366];
          uint64_t v19 = [(id)v20 debugDescription];
          [v19 UTF8String];
          _SASetCrashLogMessage(10829, "leafy truncated frame %s not leaf: %lu more to go (%s is next)", v368, v369, v370, v371, v372, v373, (char)v294);

          _os_crash();
          __break(1u);
          goto LABEL_609;
        }
        int v184 = (void *)v9;
        if ([(id)v9 isSwiftAsync])
        {
          int v185 = [v19 swiftTask];
          uint64_t v186 = [v185 identifier];
          if (v185)
          {
            if (v186 != -1)
            {
              uint64_t v187 = [[NSString alloc] initWithFormat:@"%@ %llu", @"Swift Task", v186];
              goto LABEL_351;
            }
          }
          else
          {
            int v194 = *__error();
            uint64_t v195 = _sa_logt();
            if (os_log_type_enabled(v195, OS_LOG_TYPE_FAULT))
            {
              -[SAThreadState debugDescriptionWithThread:](v19, v611);
              id v197 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)long long buf = 138412290;
              unint64_t v632 = (unint64_t)v197;
              _os_log_fault_impl(&dword_1BF22B000, v195, OS_LOG_TYPE_FAULT, "isLeafyCallstackIsInAnotherCallTreeFrame, but no swiftTask for %@", buf, 0xCu);
            }
            *__error() = v194;
            uint64_t v95 = v611;
          }
          uint64_t v187 = [[NSString alloc] initWithFormat:@"%@ %@", @"Swift Task", @"UNKNOWN"];
LABEL_351:
          uint64_t v193 = (void *)v187;
        }
        else
        {
          uint64_t v188 = [v95 threadId];
          id v189 = [NSString alloc];
          if (v188) {
            uint64_t v190 = [v189 initWithFormat:@"%@ 0x%llx", @"Thread", objc_msgSend(v95, "threadId")];
          }
          else {
            uint64_t v190 = [v189 initWithFormat:@"%@ %@", @"Thread", @"UNKNOWN"];
          }
          uint64_t v193 = (void *)v190;
        }
        a3 = v601;
        +[SACallTreeTruncatedLeafCallstacks callTreeFrameWithFrame:startSampleIndex:sampleCount:otherCallTreeDescription:]((uint64_t)SACallTreeTruncatedLeafCallstacks, v184, v601, v595, v193);
        uint64_t v16 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

LABEL_353:
        [(id)v600 addObject:v16];
        uint64_t v191 = 0;
LABEL_354:
        uint64_t v598 = v191;
        if (p_superclass == a1)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40), v16);

          uint64_t v9 = v600;
          a1 = p_superclass;
          goto LABEL_363;
        }
        if (v16) {
          id v196 = objc_getProperty(v16, v192, 40, 1);
        }
        else {
          id v196 = 0;
        }
        uint64_t v9 = (uint64_t)v196;

        ++a1;
        int v168 = a6 + 1;
        unint64_t v600 = v9;
      }
      while (a6 + 1 != (char *)v592);
      uint64_t v198 = [obj countByEnumeratingWithState:&v620 objects:v654 count:16];
      uint64_t v592 = v198;
      if (!v198)
      {
LABEL_363:
        id v146 = obj;

        if (*(void *)(*(void *)(*(void *)(v604 + 200) + 8) + 40))
        {
          uint64_t v16 = v585;
          a1 = v604;
LABEL_365:
          unint64_t v151 = v606;

LABEL_366:
          goto LABEL_367;
        }
        uint64_t v20 = *__error();
        double v401 = _sa_logt();
        if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR))
        {
          id v402 = [obj debugDescription];
          uint64_t v403 = [v402 UTF8String];
          *(_DWORD *)long long buf = 134218498;
          unint64_t v632 = a1;
          __int16 v633 = 2048;
          uint64_t v634 = (uint64_t)v579;
          __int16 v635 = 2080;
          unint64_t v636 = v403;
          _os_log_error_impl(&dword_1BF22B000, v401, OS_LOG_TYPE_ERROR, "No leaf frame picked: index %lu, count %lu, stack %s", buf, 0x20u);
        }
        *__error() = v20;
        uint64_t v258 = [obj debugDescription];
        [v258 UTF8String];
        _SASetCrashLogMessage(10868, "No leaf frame picked: index %lu, count %lu, stack %s", v404, v405, v406, v407, v408, v409, a1);

        _os_crash();
        __break(1u);
LABEL_625:
        id v579 = v16;
        if (a6
          && -[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:]((uint64_t)a6, *((_DWORD *)v258 + 7), v258[6], *(void *)(a1 + 232), 0, 0))
        {
          int v400 = 0;
          id v399 = 0;
          uint64_t v19 = v587;
          a3 = v601;
          goto LABEL_628;
        }
        LODWORD(v590) = 1;
        uint64_t v19 = v587;
LABEL_638:
        LODWORD(v592) = v9 ^ 1;
        uint64_t v9 = (uint64_t)objc_getProperty(v258, v295, 64, 1);
        LODWORD(v28) = [(id)v9 isEqual:obj];
        if (v28)
        {
          LODWORD(a1) = 0;
          int v435 = 0;
          goto LABEL_662;
        }
        uint64_t v16 = (unsigned __int8 *)objc_getProperty(v258, v434, 64, 1);
        LODWORD(a1) = v16 != 0;
        if (v16)
        {
          id v574 = objc_getProperty(v258, v436, 64, 1);
          if (-[SATurnstileInfo displaysSameContentAs:forPid:tid:displayOptions:]((uint64_t)v574, obj, *((unsigned int *)v258 + 7), v258[6], *(void *)(v604 + 232)))
          {
            int v435 = 0;
            LODWORD(a1) = 1;
            goto LABEL_662;
          }
        }
        int v437 = 1;
        id v438 = objc_getProperty(v258, v436, 64, 1);
        if (v438)
        {
          int v400 = 0;
          goto LABEL_648;
        }
        if (obj
          && (-[SATurnstileInfo _displaysContentForPid:tid:threadPriority:options:displayString:nameCallback:]((uint64_t)obj, *((_DWORD *)v258 + 7), v258[6], 0, *(void *)(v604 + 232), 0, 0) & 1) != 0)
        {
          int v400 = 0;
          id v438 = 0;
          uint64_t v19 = v587;
LABEL_648:
          a3 = v601;
LABEL_665:

          if (a1)
          {
LABEL_666:

            if ((v437 & 1) == 0) {
              goto LABEL_667;
            }
LABEL_672:

            a1 = v604;
            if (v590)
            {
              id v399 = 0;
              uint64_t v16 = v579;
LABEL_674:
              char v410 = v598;
              int v411 = v592;
LABEL_675:

              if (v410)
              {
LABEL_676:

                if ((v411 & 1) == 0) {
                  goto LABEL_677;
                }
LABEL_682:

                if ((v400 & 1) == 0) {
                  goto LABEL_683;
                }
LABEL_678:
                uint64_t v250 = v258;

                uint64_t v214 = v568;
LABEL_554:
                uint64_t v16 = v585;
                uint64_t v249 = a6;
                if (*(unsigned char *)(a1 + 276))
                {
                  uint64_t v297 = v214;
                  if ((v571 & 1) != 0
                    || (uint64_t v354 = *((void *)v250 + 12), v354 == 0x7FFFFFFFFFFFFFFFLL)
                    || v354 + 1 != a3)
                  {
                    id v298 = objc_getProperty(v250, v296, 88, 1);
                    uint64_t v299 = [[SATimeRange alloc] initWithStart:v588 end:v609];
                    [v298 addObject:v299];
                  }
                  else
                  {
                    id v298 = objc_getProperty(v250, v296, 88, 1);
                    id v355 = [v298 lastObject];
                    uint64_t v299 = v355;
                    if (v355) {
                      objc_setProperty_atomic(v355, v356, v609, 16);
                    }
                  }

                  uint64_t v214 = v297;
                }
                *((void *)v250 + 12) = v606;
                objc_msgSend(v250, "setSampleCount:", objc_msgSend(v250, "sampleCount") + v595);
                goto LABEL_448;
              }
LABEL_681:
              if (v411) {
                goto LABEL_682;
              }
LABEL_677:

              if (v400) {
                goto LABEL_678;
              }
LABEL_683:
              int v220 = v611;
LABEL_684:
              uint64_t v241 = (uint64_t)v258;
              uint64_t v214 = v568;
LABEL_446:

              goto LABEL_447;
            }
            uint64_t v16 = v579;
LABEL_680:
            int v411 = v592;
            if (v598) {
              goto LABEL_676;
            }
            goto LABEL_681;
          }
LABEL_671:
          if (v437) {
            goto LABEL_672;
          }
LABEL_667:

          a1 = v604;
          uint64_t v16 = v579;
          if (v590)
          {
            id v399 = 0;
            goto LABEL_674;
          }
          goto LABEL_680;
        }
LABEL_661:
        int v435 = 1;
LABEL_662:
        int v437 = v28 ^ 1;
        if (([v568 isPartOfADeadlock] ^ *((unsigned __int8 *)v258 + 25)))
        {
          int v400 = 0;
          a3 = v601;
          if (v435)
          {
LABEL_664:
            id v438 = 0;
            uint64_t v19 = v587;
            goto LABEL_665;
          }
        }
        else
        {
          int v491 = [v568 isBlockedByADeadlock];
          int v400 = v491 ^ [v568 isBlockedByADeadlock] ^ 1;
          a3 = v601;
          if (v435) {
            goto LABEL_664;
          }
        }
        uint64_t v19 = v587;
        if (a1) {
          goto LABEL_666;
        }
        goto LABEL_671;
      }
    }
  }
  if (-[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32))
    && *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) + 1 != a3
    || ![*(id *)(*(void *)(*(void *)(a1 + 192) + 8) + 40) hasSameStackAs:v19])
  {
    LODWORD(v594) = !*(unsigned char *)(a1 + 262)
                 && *(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 40)
                 && -[SASamplePrinter hasTimeIndexes](*(void *)(a1 + 32))
                 && *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) + 1 < a3;
    goto LABEL_279;
  }
  uint64_t v144 = [*(id *)(a1 + 88) lastObject];
  if (v144)
  {
    id v145 = (void *)v144;
    do
    {
      objc_opt_class();
      id v146 = v145;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      objc_msgSend(v145, "setSampleCount:", objc_msgSend(v145, "sampleCount") + v28);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 200) + 8) + 40), v145);
      id v148 = objc_getProperty(v145, v147, 40, 1);
      uint64_t v149 = [v148 lastObject];
      BOOL v150 = v146;
      id v146 = (void *)v149;

      id v145 = v146;
    }
    while (v146);
    uint64_t v19 = v587;
    unint64_t v151 = v606;
    goto LABEL_366;
  }
  unint64_t v151 = v606;
LABEL_367:
  if (!*(unsigned char *)(a1 + 261))
  {
    uint64_t v206 = a4;
    uint64_t v205 = v584;
    goto LABEL_542;
  }
  uint64_t v199 = *(void *)(a1 + 32);
  uint64_t v200 = *(void **)(v199 + 16);
  id v201 = *(id *)(v199 + 160);
  uint64_t p_superclass = v19;
  uint64_t v20 = v200;
  if (![(id)p_superclass isRunning])
  {
    if ([(id)p_superclass isRunnable])
    {
      if ([(id)v20 displayThreadRunningState]) {
        uint64_t v202 = 2;
      }
      else {
        uint64_t v202 = 0;
      }
    }
    else
    {
      uint64_t v202 = 0;
    }
    if (![(id)v20 displayCPUNumForNonRunningThreads]) {
      goto LABEL_390;
    }
    unsigned int v207 = [(id)p_superclass cpuNum];
    if (v207 == -1) {
      goto LABEL_390;
    }
    unsigned int v208 = v207;
    if (v207 < 0xFF)
    {
      v202 |= 8 * v207 + 8;
      goto LABEL_390;
    }
    int v374 = *__error();
    __int16 v375 = _sa_logt();
    if (os_log_type_enabled(v375, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v632) = v208;
      _os_log_error_impl(&dword_1BF22B000, v375, OS_LOG_TYPE_ERROR, "bad cpu num %u", buf, 8u);
    }

    *__error() = v374;
    _SASetCrashLogMessage(168, "bad cpu num %u", v492, v493, v494, v495, v496, v497, v208);
    _os_crash();
    __break(1u);
    goto LABEL_688;
  }
  if ([(id)v20 displayThreadRunningState]) {
    uint64_t v202 = 4;
  }
  else {
    uint64_t v202 = 0;
  }
  if (([(id)v20 displayCPUNumForRunningThreads] & 1) != 0
    || [(id)v20 displayCPUClusterInfoForRunningThreads])
  {
    uint64_t v203 = [(id)p_superclass cpuNum];
    if (v203 != -1)
    {
      uint64_t v204 = (const char *)v203;
      if ([(id)v20 displayCPUNumForRunningThreads])
      {
        if (v204 >= 0xFF)
        {
          uint64_t v300 = *__error();
          uint64_t v160 = _sa_logt();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v632) = v204;
            _os_log_error_impl(&dword_1BF22B000, v160, OS_LOG_TYPE_ERROR, "bad cpu num %u", buf, 8u);
          }

          *__error() = v300;
          _SASetCrashLogMessage(147, "bad cpu num %u", v509, v510, v511, v512, v513, v514, (char)v204);
          _os_crash();
          __break(1u);
          goto LABEL_692;
        }
        v202 |= (8 * v204 + 8);
      }
      if ([(id)v20 displayCPUClusterInfoForRunningThreads]) {
        v202 |= ((unint64_t)-[SASampleStore clusterFlagsForCPUNum:](v201, v204) & 3) << 11;
      }
    }
  }
LABEL_390:
  uint64_t v9 = [(id)p_superclass isSuspended];

  if (*(unsigned char *)(a1 + 272))
  {
    int v209 = [(id)p_superclass waitInfo];

    a6 = v209;
    if (*(unsigned char *)(a1 + 272))
    {
      obuint64_t j = [(id)p_superclass turnstileInfo];

      goto LABEL_395;
    }
  }
  else
  {
    a6 = 0;
  }
  obuint64_t j = 0;
LABEL_395:
  uint64_t v210 = *(void **)(*(void *)(a1 + 32) + 144);
  uint64_t v211 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v611, "threadId"));
  uint64_t v28 = [v210 objectForKeyedSubscript:v211];

  uint64_t v212 = [(id)v28 threadState];

  long long v573 = (void *)p_superclass;
  if (v212 == (void *)p_superclass)
  {
    uint64_t v214 = (void *)v28;
  }
  else
  {

    uint64_t v214 = 0;
  }
  uint64_t v578 = v202 | v9;
  if (*(unsigned char *)(a1 + 273))
  {
    LODWORD(v600) = [(id)p_superclass originPid];
    uint64_t v19 = v587;
    if (*(unsigned char *)(a1 + 273)) {
      LODWORD(v594) = [(id)p_superclass proximatePid];
    }
    else {
      LODWORD(v594) = -1;
    }
  }
  else
  {
    LODWORD(v600) = -1;
    LODWORD(v594) = -1;
    uint64_t v19 = v587;
  }
  if (!*(unsigned char *)(a1 + 274))
  {
    LODWORD(v607) = 0;
LABEL_416:
    int v220 = v611;
    goto LABEL_440;
  }
  if (!v16)
  {
    int v412 = *__error();
    uint64_t v413 = _sa_logt();
    if (os_log_type_enabled(v413, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v413, OS_LOG_TYPE_ERROR, "No task state for thread state in microstackshot data", buf, 2u);
    }

    *__error() = v412;
    _SASetCrashLogMessage(10890, "No task state for thread state in microstackshot data", v414, v415, v416, v417, v418, v419, v559);
    _os_crash();
    __break(1u);
    goto LABEL_632;
  }
  unsigned int v215 = SAMicrostackshotStateForFlagsTaskAndThreadState([(id)p_superclass microstackshotFlags], v16, (void *)p_superclass);
  uint64_t v216 = *(char **)(a1 + 96);
  if (!v216)
  {
    if (*(unsigned char *)(a1 + 275)) {
      unsigned int v219 = v215;
    }
    else {
      unsigned int v219 = v215 & 0xFFFFFFE3;
    }
    LODWORD(v607) = v219;
    goto LABEL_416;
  }
  if ((v215 & 0x10) == 0)
  {
    if (*(unsigned char *)(a1 + 275)) {
      unsigned int v217 = v215;
    }
    else {
      unsigned int v217 = v215 & 0xFFFFFFE3;
    }
    LODWORD(v607) = v217;
    uint64_t v218 = v595;
    goto LABEL_426;
  }
  uint64_t v221 = 40;
  if ((v215 & 8) == 0) {
    uint64_t v221 = 48;
  }
  uint64_t v218 = v595;
  *(void *)&v216[v221] += v595;
  uint64_t v216 = *(char **)(a1 + 96);
  if (v216)
  {
    uint64_t v222 = 32;
    if ((v215 & 4) == 0) {
      uint64_t v222 = 24;
    }
    *(void *)&v216[v222] += v595;
    uint64_t v216 = *(char **)(a1 + 96);
    if (*(unsigned char *)(a1 + 275)) {
      unsigned int v223 = v215;
    }
    else {
      unsigned int v223 = v215 & 0xFFFFFFE3;
    }
    LODWORD(v607) = v223;
    if (v216) {
LABEL_426:
    }
      uint64_t v216 = (char *)objc_getProperty(v216, v213, 8, 1);
  }
  else
  {
    if (*(unsigned char *)(a1 + 275)) {
      unsigned int v558 = v215;
    }
    else {
      unsigned int v558 = v215 & 0xFFFFFFE3;
    }
    LODWORD(v607) = v558;
  }
  uint64_t v224 = v216;
  uint64_t v225 = [NSNumber numberWithUnsignedInt:v607];
  int v226 = [v224 objectForKeyedSubscript:v225];

  if (v226) {
    objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v226, "unsignedLongValue") + v218);
  }
  else {
  int v228 = [NSNumber numberWithUnsignedInteger:v218];
  }
  id v229 = *(id *)(a1 + 96);
  if (v229) {
    id v229 = objc_getProperty(v229, v227, 8, 1);
  }
  id v230 = v229;
  char v231 = [NSNumber numberWithUnsignedInt:v607];
  [v230 setObject:v228 forKeyedSubscript:v231];

  id v233 = *(id *)(a1 + 96);
  if (v233) {
    id v233 = objc_getProperty(v233, v232, 16, 1);
  }
  id v234 = v233;
  uint64_t v235 = [NSNumber numberWithUnsignedLongLong:v578];
  uint64_t v9 = [v234 objectForKeyedSubscript:v235];

  if (v9) {
    objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend((id)v9, "unsignedLongValue") + v595);
  }
  else {
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:v595];
  }
  id v237 = *(id *)(a1 + 96);
  if (v237) {
    id v237 = objc_getProperty(v237, v236, 16, 1);
  }
  id v238 = v237;
  uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v578];
  [v238 setObject:v28 forKeyedSubscript:v16];

  int v220 = v611;
  a3 = v601;
LABEL_440:
  int v239 = *(unsigned char **)(*(void *)(*(void *)(a1 + 200) + 8) + 40);
  if (v239)
  {
    if (v239[24])
    {
      id v240 = objc_getProperty(v239, v213, 40, 1);
      goto LABEL_444;
    }
LABEL_632:
    int v420 = *__error();
    char v421 = _sa_logt();
    if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR))
    {
      id v422 = [*(id *)(*(void *)(*(void *)(a1 + 200) + 8) + 40) debugDescription];
      uint64_t v423 = [v422 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      unint64_t v632 = v423;
      _os_log_error_impl(&dword_1BF22B000, v421, OS_LOG_TYPE_ERROR, "leaf frame %s !isLeafFrame", buf, 0xCu);
    }
    *__error() = v420;
    id v424 = [*(id *)(*(void *)(*(void *)(a1 + 200) + 8) + 40) debugDescription];
    char v425 = [v424 UTF8String];
    _SASetCrashLogMessage(10934, "leaf frame %s !isLeafFrame", v426, v427, v428, v429, v430, v431, v425);

    _os_crash();
    __break(1u);
LABEL_635:
    int v432 = *__error();
    uint64_t v433 = _sa_logt();
    if (os_log_type_enabled(v433, OS_LOG_TYPE_FAULT)) {
      goto LABEL_710;
    }
    while (2)
    {

      *__error() = v432;
      uint64_t v16 = v585;
      a3 = v601;
      a1 = v604;
      uint64_t v20 = v588;
LABEL_274:
      uint64_t v152 = *(unsigned char **)(*(void *)(*(void *)(a1 + 200) + 8) + 40);
      if (v152)
      {
        if ((v152[24] & 1) == 0) {
          goto LABEL_655;
        }
        id v153 = objc_getProperty(v152, v30, 40, 1);
      }
      else
      {
        id v153 = *(id *)(a1 + 88);
      }
      uint64_t p_superclass = (uint64_t)v153;
      uint64_t v160 = [v153 lastObject];
      if (!v160)
      {
        [(id)p_superclass addObject:v598];
        goto LABEL_585;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_658;
      }
      if ([v160 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL
        && [v160 startSampleIndex] >= a3)
      {
        objc_msgSend((id)p_superclass, "insertObject:atIndex:", v598, objc_msgSend((id)p_superclass, "count") - 1);
        goto LABEL_584;
      }
      uint64_t v161 = 0x1EA144000uLL;
      unint64_t isa = (unint64_t)v160[12].isa;
      [(id)p_superclass addObject:v598];
      uint64_t v20 = v588;
      if (isa == 0x7FFFFFFFFFFFFFFFLL || isa < a3) {
        goto LABEL_585;
      }
      uint64_t v163 = [v160 sampleCount];
      if ([v160 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v164 = -1;
      }
      else {
        uint64_t v164 = [v160 startSampleIndex] - a3;
      }
      uint64_t v300 = v164 + v163;
      if ([v160 sampleCount] > (unint64_t)(v164 + v163))
      {
        uint64_t v20 = v588;
        if (!v300) {
          goto LABEL_585;
        }
        unint64_t v600 = v300;
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v302 = objc_getProperty(v160, v301, 88, 1);
          id v303 = [v302 lastObject];
          id v304 = [v303 startTime];
        }
        else
        {
          id v302 = [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
          id v303 = [v302 objectAtIndexedSubscript:a3];
          id v304 = v303;
        }

        if (!v304) {
          goto LABEL_695;
        }
        id v306 = objc_getProperty(v160, v305, 88, 1);
        id v307 = [v306 lastObject];
        uint64_t v308 = [v307 startTime];
        char v309 = [v308 le:v304];

        if (v309)
        {
          id v311 = objc_getProperty(v160, v310, 88, 1);
          id v312 = [v311 lastObject];
          uint64_t v313 = [v312 endTime];
          uint64_t v595 = p_superclass;
          unint64_t v607 = (unint64_t)v304;
          if ([v313 ge:v304])
          {
            id v315 = objc_getProperty(v160, v314, 88, 1);
            uint64_t v316 = [v315 lastObject];
            id v317 = [v316 endTime];
          }
          else
          {
            id v317 = v304;
          }

          if (v317)
          {
            long long v597 = +[SATimeRange timeRangeStart:v607 end:v317];
            [v160 setSampleCount:[v160 sampleCount] - v600];
            v160[12].unint64_t isa = (Class)((char *)v160[12].isa - v600);
            if (v571 && v601 && v601 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v319 = [*(id *)(*(void *)(a1 + 32) + 160) sampleTimestamps];
              uint64_t v322 = [v319 objectAtIndexedSubscript:v601 - 1];
              id v358 = objc_getProperty(v160, v357, 88, 1);
              id v359 = [v358 lastObject];
              unint64_t v361 = v359;
              id v323 = v587;
              if (v359) {
                objc_setProperty_atomic(v359, v360, v322, 16);
              }
            }
            else
            {
              id v319 = objc_getProperty(v160, v318, 88, 1);
              uint64_t v320 = [v319 lastObject];
              uint64_t v322 = v320;
              id v323 = v587;
              if (v320) {
                objc_setProperty_atomic(v320, v321, (id)v607, 16);
              }
            }

            id v325 = objc_getProperty(v160, v324, 56, 1);
            id v327 = objc_getProperty(v160, v326, 64, 1);
            uint64_t v328 = +[SACallTreeState treeCountedStateWithWaitInfo:turnstileInfo:isPartOfADeadlock:isBlockedByADeadlock:state:microstackshotState:pid:threadId:threadPriority:timeRange:originPid:proximatePid:startSampleIndex:sampleCount:]((uint64_t)SACallTreeState, v325, v327, BYTE1(v160[3].isa) & 1, BYTE2(v160[3].isa) & 1, (uint64_t)v160[9].isa, v160[4].isa, HIDWORD(v160[3].isa), (uint64_t)v160[6].isa, [v323 basePriority], v597, *(uint64_t *)((char *)&v160[4].isa + 4), v601, v600);

            uint64_t p_superclass = v595;
            [(id)v595 addObject:v328];
            uint64_t v16 = v585;
            if (v601 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v330 = objc_getProperty(v160, v329, 80, 1);
              uint64_t v331 = [v330 count];

              unint64_t v333 = 0;
              if (v331)
              {
                do
                {
                  id v334 = objc_getProperty(v160, v332, 80, 1);
                  unint64_t v335 = [v334 objectAtIndexedSubscript:v333];

                  id v336 = [v335 startTimestamp];
                  char v337 = [v336 gt:v607];

                  if (v337) {
                    break;
                  }
                  ++v333;
                  id v338 = objc_getProperty(v160, v332, 80, 1);
                  unint64_t v339 = [v338 count];
                }
                while (v333 < v339);
              }
              id v340 = objc_getProperty(v160, v332, 80, 1);
              unint64_t v341 = [v340 count];

              if (v333 < v341)
              {
                id v343 = objc_getProperty(v160, v342, 80, 1);
                unint64_t v344 = [v343 count] - v333;

                id v346 = objc_getProperty(v160, v345, 80, 1);
                unint64_t v602 = v344;
                uint64_t v347 = objc_msgSend(v346, "subarrayWithRange:", v333, v344);
                id v349 = (void *)[v347 mutableCopy];
                if (v328) {
                  objc_setProperty_atomic(v328, v348, v349, 80);
                }

                id v351 = objc_getProperty(v160, v350, 80, 1);
                objc_msgSend(v351, "removeObjectsInRange:", v333, v602);
              }
            }

            a1 = v604;
LABEL_584:
            uint64_t v20 = v588;
LABEL_585:

            uint64_t v19 = v587;
            uint64_t v95 = v611;
LABEL_586:
            uint64_t v206 = a4;
            uint64_t v205 = v584;
            unint64_t v151 = v606;
            goto LABEL_587;
          }
        }
        else
        {
LABEL_695:
          v517 = v304;
          int v518 = *__error();
          double v519 = _sa_logt();
          if (os_log_type_enabled(v519, OS_LOG_TYPE_ERROR))
          {
            id v520 = [v160 debugDescription];
            uint64_t v161 = [v520 UTF8String];
            id v521 = [v517 debugDescription];
            uint64_t v522 = [v521 UTF8String];
            *(_DWORD *)long long buf = 136315650;
            unint64_t v632 = v161;
            __int16 v633 = 2048;
            uint64_t v634 = v601;
            __int16 v635 = 2080;
            unint64_t v636 = v522;
            _os_log_error_impl(&dword_1BF22B000, v519, OS_LOG_TYPE_ERROR, "%s splitting at %lu %s", buf, 0x20u);
          }
          *__error() = v518;
          uint64_t v160 = [v160 debugDescription];
          char v523 = [v160 UTF8String];
          id v524 = [v517 debugDescription];
          [v524 UTF8String];
          _SASetCrashLogMessage(11054, "%s splitting at %lu %s", v525, v526, v527, v528, v529, v530, v523);

          _os_crash();
          __break(1u);
        }
        int v531 = *__error();
        id v532 = _sa_logt();
        if (os_log_type_enabled(v532, OS_LOG_TYPE_ERROR))
        {
          id v533 = [v160 debugDescription];
          uint64_t v161 = [v533 UTF8String];
          id v534 = [(id)v607 debugDescription];
          uint64_t v535 = [v534 UTF8String];
          *(_DWORD *)long long buf = 136315394;
          unint64_t v632 = v161;
          __int16 v633 = 2080;
          uint64_t v634 = v535;
          _os_log_error_impl(&dword_1BF22B000, v532, OS_LOG_TYPE_ERROR, "nil newCountedStateEndTimestamp from %s and %s", buf, 0x16u);
        }
        *__error() = v531;
        uint64_t v160 = [v160 debugDescription];
        id v515 = [v160 UTF8String];
        id v536 = [(id)v607 debugDescription];
        [v536 UTF8String];
        _SASetCrashLogMessage(11058, "nil newCountedStateEndTimestamp from %s and %s", v537, v538, v539, v540, v541, v542, (char)v515);

        _os_crash();
        __break(1u);
LABEL_701:
        uint64_t v590 = [*(id *)(v604 + 40) taskStates];
        uint64_t v516 = [(id)v590 indexOfObject:v585];
        goto LABEL_702;
      }
LABEL_692:
      unint64_t v600 = v300;
      uint64_t v595 = p_superclass;
      LODWORD(v609) = *__error();
      id v515 = _sa_logt();
      if (os_log_type_enabled(v515, OS_LOG_TYPE_ERROR))
      {
        unint64_t v606 = [v160 startSampleIndex];
        uint64_t v598 = [v160 sampleCount];
        LODWORD(v161) = p_superclass == *(void *)(v604 + 88);
        unint64_t v607 = [v611 threadStates];
        a6 = (char *)[(id)v607 indexOfObject:v587];
        uint64_t v594 = [v587 startSampleIndex];
        uint64_t v592 = [v587 endSampleIndex];
        if (v585) {
          goto LABEL_701;
        }
        uint64_t v516 = -1;
LABEL_702:
        uint64_t v543 = [v585 startSampleIndex];
        uint64_t v544 = [v585 endSampleIndex];
        uint64_t v545 = [*(id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40) startSampleIndex];
        uint64_t v546 = [*(id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40) sampleCount];
        id v547 = [(id)v595 lastObject];
        uint64_t v548 = [v547 UTF8String];
        *(_DWORD *)long long buf = 134221570;
        unint64_t v632 = v606;
        __int16 v633 = 2048;
        uint64_t v634 = v598;
        __int16 v635 = 2048;
        unint64_t v636 = v600;
        __int16 v637 = 1024;
        *(_DWORD *)id v638 = v161;
        *(_WORD *)&v638[4] = 2048;
        *(void *)&v638[6] = v601;
        *(_WORD *)&v638[14] = 2048;
        *(void *)&v638[16] = a6;
        *(_WORD *)&v638[24] = 2048;
        *(void *)&v638[26] = v594;
        __int16 v639 = 2048;
        uint64_t v640 = v592;
        __int16 v641 = 2048;
        uint64_t v642 = v516;
        __int16 v643 = 2048;
        uint64_t v644 = v543;
        __int16 v645 = 2048;
        uint64_t v646 = v544;
        __int16 v647 = 1024;
        *(_DWORD *)v648 = v571;
        *(_WORD *)&v648[4] = 2048;
        *(void *)&v648[6] = v545;
        __int16 v649 = 2048;
        *(void *)v650 = v546;
        *(_WORD *)&v650[8] = 2080;
        uint64_t v651 = v548;
        _os_log_error_impl(&dword_1BF22B000, v515, OS_LOG_TYPE_ERROR, "start %lu, count %lu, newcount %lu, is root %d, index %lu, thread state %lu %lu-%lu, task state %lu %lu-%lu, timeJump %d, leaf start %lu, count %lu, state %s", buf, 0x90u);

        if (v585) {
      }
        }

      *__error() = (int)v609;
      id v609 = (id)[v160 startSampleIndex];
      uint64_t v549 = [v160 sampleCount];
      unint64_t v606 = v595 == *(void *)(v604 + 88);
      unint64_t v607 = v549;
      uint64_t v433 = [v611 threadStates];
      v611 = (void *)[v433 indexOfObject:v587];
      LODWORD(v28) = [v587 startSampleIndex];
      uint64_t p_superclass = [v587 endSampleIndex];
      if (v585)
      {
        uint64_t v598 = [*(id *)(v604 + 40) taskStates];
        [(id)v598 indexOfObject:v585];
      }
      [v585 startSampleIndex];
      [v585 endSampleIndex];
      uint64_t v9 = [*(id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40) startSampleIndex];
      int v432 = [*(id *)(*(void *)(*(void *)(v604 + 200) + 8) + 40) sampleCount];
      id v550 = [(id)v595 lastObject];
      [v550 UTF8String];
      _SASetCrashLogMessage(11050, "start %lu, count %lu, newcount %lu, is root %d, index %lu, thread state %lu %lu-%lu, task state %lu %lu-%lu, timeJump %d, leaf start %lu, count %lu, state %s", v551, v552, v553, v554, v555, v556, (char)v609);

      if (v585) {
      _os_crash();
      }
      __break(1u);
LABEL_710:
      uint64_t v557 = [ (id) v598 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      unint64_t v632 = v557;
      _os_log_fault_impl(&dword_1BF22B000, v433, OS_LOG_TYPE_FAULT, "Countless state change %s, but no sampleIndex", buf, 0xCu);
      continue;
    }
  }
  id v240 = *(id *)(a1 + 88);
LABEL_444:
  uint64_t p_superclass = (uint64_t)SAMicrostackshotStatistics.superclass;
  uint64_t v241 = v598;
  id v572 = v240;
  if (v598)
  {
    [v240 addObject:v598];
    goto LABEL_446;
  }
  if (!*(unsigned char *)(a1 + 262))
  {
    uint64_t v241 = [v240 lastObject];
    if (!v241) {
      goto LABEL_446;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || *(void *)(v241 + 72) != v578
      || *(_DWORD *)(v241 + 32) != v607
      || *(_DWORD *)(v241 + 36) != v600
      || *(_DWORD *)(v241 + 40) != v594)
    {
      goto LABEL_446;
    }
    long long v568 = v214;
    id v294 = (int *)0x1EA144000;
    uint64_t v20 = (uint64_t)objc_getProperty((id)v241, v293, 56, 1);
    LODWORD(v9) = [(id)v20 isEqual:a6];
    uint64_t v258 = (uint64_t *)v241;
    if (v9)
    {
      LODWORD(v598) = 0;
      LODWORD(v590) = 0;
      goto LABEL_638;
    }
LABEL_609:
    uint64_t v16 = (unsigned __int8 *)objc_getProperty((id)v241, v295, v294[876], 1);
    LODWORD(v598) = v16 != 0;
    if (v16)
    {
      id v576 = objc_getProperty((id)v241, v295, v294[876], 1);
      if (-[SAWaitInfo displaysSameContentAs:forPid:tid:displayOptions:]((uint64_t)v576, a6, *(_DWORD *)(v241 + 28), *(void *)(v241 + 48), *(void *)(a1 + 232)))
      {
        id v579 = v16;
        LODWORD(v590) = 0;
        LODWORD(v598) = 1;
        goto LABEL_638;
      }
    }
LABEL_620:
    id v399 = objc_getProperty(v258, v295, v294[876], 1);
    if (!v399) {
      goto LABEL_625;
    }
    int v400 = 0;
LABEL_628:
    char v410 = v598;
    int v411 = 1;
    goto LABEL_675;
  }
  long long v568 = v214;
  long long v614 = 0u;
  long long v615 = 0u;
  long long v612 = 0u;
  long long v613 = 0u;
  uint64_t v258 = (uint64_t *)v240;
  uint64_t v259 = [v258 countByEnumeratingWithState:&v612 objects:v652 count:16];
  if (!v259) {
    goto LABEL_684;
  }
  uint64_t v260 = v259;
  uint64_t v261 = v578;
  if (v578) {
    BOOL v262 = 0;
  }
  else {
    BOOL v262 = v607 == 0;
  }
  BOOL v264 = v262 && v600 == 0 && v594 == 0;
  uint64_t v265 = *(void *)v613;
  char v266 = v264;
  char v563 = v266;
  unint64_t v267 = 0x1EA144000uLL;
  while (2)
  {
    uint64_t v268 = 0;
LABEL_471:
    if (*(void *)v613 != v265) {
      objc_enumerationMutation(v258);
    }
    uint64_t v269 = *(void *)(*((void *)&v612 + 1) + 8 * v268);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_531;
    }
    if (v269)
    {
      if (*(void *)(v269 + *(int *)(v267 + 3520)) == v261
        && *(_DWORD *)(v269 + 32) == v607
        && *(_DWORD *)(v269 + 36) == v600
        && *(_DWORD *)(v269 + 40) == v594)
      {
        id v271 = objc_getProperty((id)v269, v270, 56, 1);
        goto LABEL_480;
      }
LABEL_531:
      if (v260 == ++v268)
      {
        uint64_t v292 = [v258 countByEnumeratingWithState:&v612 objects:v652 count:16];
        uint64_t v260 = v292;
        if (!v292)
        {
          a1 = v604;
          uint64_t v241 = (uint64_t)v258;
          uint64_t v214 = v568;
          int v220 = v611;
          goto LABEL_446;
        }
        continue;
      }
      goto LABEL_471;
    }
    break;
  }
  if ((v563 & 1) == 0)
  {
    uint64_t v19 = v587;
    uint64_t v261 = v578;
    unint64_t v267 = 0x1EA144000;
    goto LABEL_531;
  }
  id v271 = 0;
  uint64_t v19 = v587;
  uint64_t v261 = v578;
LABEL_480:
  id v591 = v271;
  int v273 = [v591 isEqual:a6];
  if (v273)
  {
    BOOL v593 = 0;
    goto LABEL_482;
  }
  if (v269)
  {
    id v276 = objc_getProperty((id)v269, v272, 56, 1);
    BOOL v593 = v276 != 0;
    id v569 = v276;
    if (v276)
    {
      int v599 = 1;
      id v567 = objc_getProperty((id)v269, v272, 56, 1);
      if (-[SAWaitInfo displaysSameContentAs:forPid:tid:displayOptions:]((uint64_t)v567, a6, *(_DWORD *)(v269 + 28), *(void *)(v269 + 48), *(void *)(v604 + 232)))
      {
        int v577 = 0;
        BOOL v593 = 1;
        uint64_t v274 = obj;
        unint64_t v275 = 0x1EA144000uLL;
LABEL_488:
        id v277 = objc_getProperty((id)v269, v272, *(int *)(v275 + 3508), 1);
        goto LABEL_489;
      }
    }
    int v599 = 1;
    id v570 = objc_getProperty((id)v269, v272, 56, 1);
    if (v570)
    {
      char v286 = 0;
      goto LABEL_520;
    }
    id v272 = (const char *)*(unsigned int *)(v269 + 28);
    uint64_t v288 = *(void *)(v269 + 48);
  }
  else
  {
    id v272 = 0;
    BOOL v593 = 0;
    id v569 = 0;
    uint64_t v288 = 0;
  }
  unint64_t v267 = 0x1EA144000;
  if (a6)
  {
    id v570 = 0;
    if (-[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:]((uint64_t)a6, (int)v272, v288, *(void *)(v604 + 232), 0, 0))
    {
      char v286 = 0;
      int v599 = 1;
      goto LABEL_521;
    }
  }
  else
  {
    id v570 = 0;
  }
LABEL_482:
  uint64_t v274 = obj;
  unint64_t v275 = 0x1EA144000;
  int v599 = v273 ^ 1;
  if (v269)
  {
    int v577 = v273 ^ 1;
    goto LABEL_488;
  }
  id v277 = 0;
  int v577 = v273 ^ 1;
LABEL_489:
  id v575 = v277;
  int v279 = [v575 isEqual:v274];
  if (v279)
  {
    BOOL v580 = 0;
    goto LABEL_491;
  }
  if (!v269)
  {
    int v289 = 0;
    BOOL v580 = 0;
    id v565 = 0;
    uint64_t v290 = 0;
    if (v274) {
      goto LABEL_509;
    }
    goto LABEL_535;
  }
  id v283 = objc_getProperty((id)v269, v278, *(int *)(v275 + 3508), 1);
  BOOL v580 = v283 != 0;
  id v565 = v283;
  if (v283)
  {
    id v564 = objc_getProperty((id)v269, v284, *(int *)(v275 + 3508), 1);
    if (-[SATurnstileInfo displaysSameContentAs:forPid:tid:displayOptions:]((uint64_t)v564, v274, *(unsigned int *)(v269 + 28), *(void *)(v269 + 48), *(void *)(v604 + 232)))
    {
      int v281 = [v568 isPartOfADeadlock];
      int v282 = 0;
      int v280 = 1;
      BOOL v580 = 1;
LABEL_497:
      int v285 = v280;
      int v280 = v282;
      if ((v281 ^ *(unsigned __int8 *)(v269 + 25))) {
        goto LABEL_498;
      }
LABEL_516:
      char v291 = [v568 isBlockedByADeadlock];
      uint64_t v261 = v578;
      char v286 = v291 ^ [v568 isBlockedByADeadlock] ^ 1;
      if (v280) {
        goto LABEL_517;
      }
LABEL_524:
      if (!v580) {
        goto LABEL_525;
      }
LABEL_518:

      uint64_t v19 = v587;
      if ((v285 & 1) == 0) {
        goto LABEL_519;
      }
LABEL_526:

      if ((v577 & 1) == 0) {
        goto LABEL_527;
      }
LABEL_520:
      unint64_t v267 = 0x1EA144000;
LABEL_521:

      if (v593) {
        goto LABEL_522;
      }
LABEL_528:
      if (v599) {
        goto LABEL_529;
      }
      goto LABEL_530;
    }
  }
  ptrdiff_t v287 = *(int *)(v275 + 3508);
  int v285 = 1;
  id v566 = objc_getProperty((id)v269, v284, v287, 1);
  if (v566)
  {
    char v286 = 0;
    goto LABEL_517;
  }
  int v289 = *(_DWORD *)(v269 + 28);
  uint64_t v290 = *(void *)(v269 + 48);
  if (!v274)
  {
LABEL_535:
    id v566 = 0;
    goto LABEL_491;
  }
LABEL_509:
  id v566 = 0;
  if (-[SATurnstileInfo _displaysContentForPid:tid:threadPriority:options:displayString:nameCallback:]((uint64_t)v274, v289, v290, 0, *(void *)(v604 + 232), 0, 0))
  {
    char v286 = 0;
    int v285 = 1;
    goto LABEL_517;
  }
LABEL_491:
  int v280 = v279 ^ 1;
  int v281 = [v568 isPartOfADeadlock];
  if (v269)
  {
    int v282 = v279 ^ 1;
    goto LABEL_497;
  }
  int v285 = v279 ^ 1;
  if ((v281 & 1) == 0) {
    goto LABEL_516;
  }
LABEL_498:
  char v286 = 0;
  if (!v280) {
    goto LABEL_524;
  }
LABEL_517:

  if (v580) {
    goto LABEL_518;
  }
LABEL_525:
  uint64_t v19 = v587;
  if (v285) {
    goto LABEL_526;
  }
LABEL_519:

  if (v577) {
    goto LABEL_520;
  }
LABEL_527:
  unint64_t v267 = 0x1EA144000;
  if (!v593) {
    goto LABEL_528;
  }
LABEL_522:

  if (v599) {
LABEL_529:
  }

LABEL_530:
  if ((v286 & 1) == 0) {
    goto LABEL_531;
  }
  uint64_t v250 = (unsigned int *)(id)v269;

  a1 = v604;
  uint64_t v214 = v568;
  int v220 = v611;
  if (v269)
  {
    a3 = v601;
    goto LABEL_554;
  }
LABEL_447:
  uint64_t v242 = p_superclass + 912;
  unsigned int v243 = [v214 isPartOfADeadlock];
  unsigned int v244 = [v214 isBlockedByADeadlock];
  int v245 = [*(id *)(a1 + 40) pid];
  uint64_t v246 = [v220 threadId];
  char v247 = [v573 basePriority];
  int v248 = [[SATimeRange alloc] initWithStart:v588 end:v609];
  char v560 = v247;
  uint64_t v249 = a6;
  +[SACallTreeState treeCountedStateWithWaitInfo:turnstileInfo:isPartOfADeadlock:isBlockedByADeadlock:state:microstackshotState:pid:threadId:threadPriority:timeRange:originPid:proximatePid:startSampleIndex:sampleCount:](v242, a6, obj, v243, v244, v578, v607, v245, v246, v560, v248, __SPAIR64__(v594, v600), v601, v595);
  uint64_t v250 = (unsigned int *)objc_claimAutoreleasedReturnValue();

  a1 = v604;
  [v572 addObject:v250];
  uint64_t v16 = v585;
LABEL_448:
  uint64_t v206 = a4;
  uint64_t v205 = v584;
  if ([newValue count])
  {
    uint64_t v252 = v214;
    if (v250) {
      id v253 = objc_getProperty(v250, v251, 80, 1);
    }
    else {
      id v253 = 0;
    }
    id v254 = v253;

    if (v254)
    {
      if (v250) {
        id v256 = objc_getProperty(v250, v255, 80, 1);
      }
      else {
        id v256 = 0;
      }
      id v257 = v256;
      [v257 addObjectsFromArray:newValue];

      uint64_t v214 = v252;
    }
    else
    {
      uint64_t v214 = v252;
      if (v250) {
        objc_setProperty_atomic(v250, v255, newValue, 80);
      }
    }
  }

  uint64_t v598 = 0;
  unint64_t v151 = v606;
LABEL_542:
  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v151;
  uint64_t v95 = v611;
  uint64_t v20 = v588;
LABEL_587:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 192) + 8) + 40), v582);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 176) + 8) + 40), v206);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40), v205);
  int v96 = v609;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40), v609);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 160) + 8) + 40), v624);
  uint64_t v352 = v151 + v581;
  if (!v581) {
    uint64_t v352 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v352;
  *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = v581;

LABEL_590:
}

uint64_t __245__SASamplePrinter_addStackForDispatchQueue_orSwiftTaskStates_orThread_andThreadStateIndexes_task_toRootObjects_nameChanges_dispatchQueueChanges_swiftTaskChanges_threadChanges_priorityChanges_microstackshotSummary_onlyHeaviestStack_includeState___block_invoke_2123(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startTimestamp];
  int v6 = [v4 startTimestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  int v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v47 = *__error();
    int v48 = _sa_logt();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      unint64_t v3 = (unint64_t) objc_claimAutoreleasedReturnValue();
      uint64_t v50 = [(id)v3 UTF8String];
      unint64_t v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      id v52 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 136315394;
      uint64_t v93 = v50;
      __int16 v94 = 2080;
      uint64_t v95 = [v52 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v48, OS_LOG_TYPE_ERROR, "first is a %s, second is a %s", buf, 0x16u);
    }
    *__error() = v47;
    unint64_t v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    int v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v6 UTF8String];
    id v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    id v7 = objc_claimAutoreleasedReturnValue();
    [v7 UTF8String];
    _SASetCrashLogMessage(11159, "first is a %s, second is a %s", v55, v56, v57, v58, v59, v60, (char)v12);

    _os_crash();
    __break(1u);
LABEL_57:
    if (v47)
    {
      id v43 = 0;
      uint64_t v10 = 1;
LABEL_96:

      goto LABEL_33;
    }
    if (v12)
    {
      id v61 = objc_getProperty(v12, v46, 56, 1);
      if (v4)
      {
        id v62 = 0;
        char v91 = v61;
        if (v61)
        {
          uint64_t v10 = -1;
          id v4 = 0;
          goto LABEL_95;
        }
        goto LABEL_94;
      }
LABEL_62:
      id v62 = objc_getProperty((id)v3, v46, 56, 1);
      if (v61)
      {
        char v91 = v61;
        id v4 = v62;
        if (v62)
        {
          if (v12) {
            id Property = objc_getProperty(v12, v63, 56, 1);
          }
          else {
            id Property = 0;
          }
          id v65 = Property;
          id v67 = objc_getProperty((id)v3, v66, 56, 1);
          uint64_t v10 = [v65 compare:v67];

          goto LABEL_95;
        }
        goto LABEL_70;
      }
LABEL_94:
      char v91 = 0;
      id v4 = v62;
      uint64_t v10 = v62 != 0;
      goto LABEL_95;
    }
    id v61 = 0;
    if ((v4 & 1) == 0) {
      goto LABEL_62;
    }
LABEL_93:
    id v62 = 0;
    goto LABEL_94;
  }
  unint64_t v8 = [v6 sampleCount];
  unint64_t v9 = [v7 sampleCount];
  if (v8 < v9)
  {
LABEL_4:
    uint64_t v10 = 1;
    goto LABEL_8;
  }
  if (v8 > v9) {
    goto LABEL_7;
  }
  uint64_t v12 = 0x1E63F6000;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v3 = *__error();
      id v68 = _sa_logt();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        unint64_t v69 = (objc_class *)objc_opt_class();
        NSStringFromClass(v69);
        uint64_t v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 136315138;
        uint64_t v93 = [v12 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v68, OS_LOG_TYPE_ERROR, "first is a %s", buf, 0xCu);
      }
      *__error() = v3;
      uint64_t v70 = (objc_class *)objc_opt_class();
      NSStringFromClass(v70);
      id v7 = objc_claimAutoreleasedReturnValue();
      char v71 = [v7 UTF8String];
      _SASetCrashLogMessage(11201, "first is a %s", v72, v73, v74, v75, v76, v77, v71);

      _os_crash();
      __break(1u);
LABEL_70:
      uint64_t v10 = -1;
LABEL_95:

      unint64_t v47 = 0;
      id v43 = 0;
      goto LABEL_96;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v78 = *__error();
        unint64_t v79 = _sa_logt();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          unint64_t v80 = (objc_class *)objc_opt_class();
          NSStringFromClass(v80);
          id v81 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 136315138;
          uint64_t v93 = [v81 UTF8String];
          _os_log_error_impl(&dword_1BF22B000, v79, OS_LOG_TYPE_ERROR, "second is a %s", buf, 0xCu);
        }
        *__error() = v78;
        unint64_t v82 = (objc_class *)objc_opt_class();
        NSStringFromClass(v82);
        id v83 = objc_claimAutoreleasedReturnValue();
        char v84 = [v83 UTF8String];
        _SASetCrashLogMessage(11205, "second is a %s", v85, v86, v87, v88, v89, v90, v84);

        _os_crash();
        __break(1u);
      }
      uint64_t v12 = v6;
      unint64_t v27 = v7;
      unint64_t v3 = (unint64_t)v27;
      if (!v12)
      {
        if (!v27) {
          goto LABEL_93;
        }
        if (v27[25] & 1) != 0 || (v27[26]) {
          goto LABEL_42;
        }
        Class isa = 0;
        goto LABEL_39;
      }
      char v29 = BYTE1(v12[3].isa);
      if (v27)
      {
        if ((v29 & 1) == (v27[25] & 1))
        {
          char v29 = BYTE2(v12[3].isa);
          if ((v29 & 1) == (v27[26] & 1))
          {
LABEL_38:
            Class isa = v12[9].isa;
LABEL_39:
            unint64_t v40 = *(void *)(v3 + 72);
            if ((unint64_t)isa < v40)
            {
LABEL_40:
              uint64_t v10 = -1;
LABEL_33:

              goto LABEL_8;
            }
            if ((unint64_t)isa <= v40)
            {
              if (v12) {
                unsigned int v41 = v12[4].isa;
              }
              else {
                unsigned int v41 = 0;
              }
              unsigned int v42 = *(_DWORD *)(v3 + 32);
              if (v41 < v42) {
                goto LABEL_40;
              }
              if (v41 <= v42)
              {
                if (!v12)
                {
                  id v43 = 0;
                  goto LABEL_50;
                }
                LOBYTE(v10) = 0;
LABEL_49:
                LOBYTE(v4) = 1;
                id v43 = objc_getProperty(v12, v28, 64, 1);
                if (v10)
                {
                  id v44 = 0;
LABEL_51:
                  id v45 = v44;
                  unint64_t v47 = (unint64_t)v45;
                  if (v43)
                  {
                    if (v45) {
                      uint64_t v10 = [v43 compare:v45];
                    }
                    else {
                      uint64_t v10 = -1;
                    }
                    goto LABEL_96;
                  }
                  goto LABEL_57;
                }
LABEL_50:
                id v44 = objc_getProperty((id)v3, v28, 64, 1);
                LOBYTE(v4) = 0;
                goto LABEL_51;
              }
            }
            goto LABEL_42;
          }
        }
      }
      else if ((BYTE1(v12[3].isa) & 1) == 0)
      {
        char v29 = BYTE2(v12[3].isa);
        if ((v29 & 1) == 0)
        {
          if (!v12[9].isa)
          {
            uint64_t v10 = 1;
            if (LODWORD(v12[4].isa)) {
              goto LABEL_33;
            }
            goto LABEL_49;
          }
LABEL_42:
          uint64_t v10 = 1;
          goto LABEL_33;
        }
      }
      if (v29) {
        uint64_t v10 = -1;
      }
      else {
        uint64_t v10 = 1;
      }
      goto LABEL_33;
    }
LABEL_7:
    uint64_t v10 = -1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    unint64_t v3 = *__error();
    int v6 = _sa_logt();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      uint64_t v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 136315138;
      uint64_t v93 = [v12 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_ERROR, "second is a %s", buf, 0xCu);
    }
    *__error() = v3;
    long long v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    id v7 = objc_claimAutoreleasedReturnValue();
    char v32 = [v7 UTF8String];
    _SASetCrashLogMessage(11197, "second is a %s", v33, v34, v35, v36, v37, v38, v32);

    _os_crash();
    __break(1u);
    goto LABEL_38;
  }
  if (v6) {
    id v15 = objc_getProperty(v6, v14, 40, 1);
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  unint64_t v17 = [v16 count];

  if (v7) {
    id v19 = objc_getProperty(v7, v18, 40, 1);
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;
  unint64_t v21 = [v20 count];

  if (v17 < v21) {
    goto LABEL_7;
  }
  if (v17 > v21) {
    goto LABEL_4;
  }
  int v22 = [v6 frame];
  unint64_t v23 = [v22 address];

  unint64_t v24 = [v7 frame];
  unint64_t v25 = [v24 address];

  if (v23 <= v25) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = -1;
  }
  if (v23 < v25) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v26;
  }
LABEL_8:

  return v10;
}

uint64_t __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2154(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v16 = *__error();
    unint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 UTF8String];
      unint64_t v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      id v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 136315394;
      uint64_t v35 = v20;
      __int16 v36 = 2080;
      uint64_t v37 = [v22 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "first is a %s, second is a %s", buf, 0x16u);
    }
    *__error() = v16;
    unint64_t v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    char v25 = [v24 UTF8String];
    uint64_t v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    id v27 = objc_claimAutoreleasedReturnValue();
    [v27 UTF8String];
    _SASetCrashLogMessage(11278, "first is a %s, second is a %s", v28, v29, v30, v31, v32, v33, v25);

    _os_crash();
    __break(1u);
  }
  unint64_t v6 = [v4 size];
  if (v6 < [v5 size]) {
    goto LABEL_4;
  }
  unint64_t v8 = [v4 size];
  if (v8 > [v5 size] || (unsigned int v9 = objc_msgSend(v4, "tier"), v9 < objc_msgSend(v5, "tier")))
  {
LABEL_7:
    uint64_t v7 = -1;
    goto LABEL_8;
  }
  unsigned int v11 = [v4 tier];
  if (v11 <= [v5 tier])
  {
    if (v4)
    {
      unsigned int v12 = v4[3];
      if (v5)
      {
LABEL_12:
        unsigned int v13 = v5[3];
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v12 = 0;
      if (v5) {
        goto LABEL_12;
      }
    }
    unsigned int v13 = 0;
LABEL_13:
    if (v12 < v13) {
      goto LABEL_7;
    }
    if (v4)
    {
      unsigned int v14 = v4[3];
      if (v5)
      {
LABEL_16:
        unsigned int v15 = v5[3];
LABEL_17:
        uint64_t v7 = v14 > v15;
        goto LABEL_8;
      }
    }
    else
    {
      unsigned int v14 = 0;
      if (v5) {
        goto LABEL_16;
      }
    }
    unsigned int v15 = 0;
    goto LABEL_17;
  }
LABEL_4:
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

void __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2162(uint64_t a1, void *a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v403 = *MEMORY[0x1E4F143B8];
  id v369 = a2;
  unsigned int v13 = (void *)MEMORY[0x1C18A6A20]();
  if (a3 >= 0x7FFFFFFF)
  {
    int v23 = *__error();
    uint64_t v252 = _sa_logt();
    if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v399 = 67109120;
      *(_DWORD *)&v399[4] = a3;
      _os_log_error_impl(&dword_1BF22B000, v252, OS_LOG_TYPE_ERROR, "unmodifed depth %u", v399, 8u);
    }

    *__error() = v23;
    _SASetCrashLogMessage(11343, "unmodifed depth %u", v253, v254, v255, v256, v257, v258, a3);
    _os_crash();
    __break(1u);
    goto LABEL_315;
  }
  unint64_t v14 = *(void *)(a1 + 168);
  if (v14 && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) >= v14) {
    goto LABEL_7;
  }
  int v15 = *(unsigned __int8 *)(a1 + 208);
  if (*(unsigned char *)(a1 + 208))
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
    unsigned int v17 = *(_DWORD *)(v16 + 24);
    if ((v17 & 0x80000000) == 0 && v17 >= a3)
    {
LABEL_7:
      *a4 = 1;
      goto LABEL_375;
    }
    *(_DWORD *)(v16 + 24) = a3;
  }
  uint64_t v18 = *(void *)(a1 + 96);
  uint64_t v19 = *(unsigned int *)(*(void *)(v18 + 8) + 24);
  if ((int)v19 >= 1)
  {
    unint64_t v20 = v19 + 1;
    do
    {
      if (*(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) + 8 * (v20 - 2)) >= a3) {
        --*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      }
      --v20;
    }
    while (v20 > 1);
    uint64_t v18 = *(void *)(a1 + 96);
  }
  uint64_t v4 = (uint64_t)buf;
  *(void *)id v399 = 0;
  int v400 = v399;
  uint64_t v401 = 0x2020000000;
  unsigned int v402 = a3;
  int v21 = *(_DWORD *)(*(void *)(v18 + 8) + 24);
  uint64_t v22 = *(void *)(a1 + 104);
  int v23 = a3;
  uint64_t v371 = a1;
  if (v21 > 0)
  {
    int v23 = *(_DWORD *)(*(void *)(*(void *)(v22 + 8) + 24) + 8 * (v21 - 1) + 4) + a3;
    if (v23 >= 0)
    {
      unsigned int v402 = *(_DWORD *)(*(void *)(*(void *)(v22 + 8) + 24) + 8 * (v21 - 1) + 4) + a3;
      goto LABEL_18;
    }
LABEL_315:
    int v259 = *__error();
    uint64_t v260 = _sa_logt();
    if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
    {
      int v261 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(v371 + 104) + 8) + 24)
                       + 8 * *(int *)(*(void *)(*(void *)(v371 + 96) + 8) + 24)
                       - 4);
      *(_DWORD *)uint64_t v395 = 67109632;
      *(_DWORD *)&v395[4] = v23;
      LOWORD(v396) = 1024;
      *(_DWORD *)(v4 + 58) = a3;
      HIWORD(v396) = 1024;
      LODWORD(v397) = v261;
      _os_log_error_impl(&dword_1BF22B000, v260, OS_LOG_TYPE_ERROR, "adjustDepth %d (%u + %d)", v395, 0x14u);
    }

    *__error() = v259;
    _SASetCrashLogMessage(11373, "adjustDepth %d (%u + %d)", v262, v263, v264, v265, v266, v267, v23);
    _os_crash();
    __break(1u);
LABEL_318:
    int v268 = *__error();
    uint64_t v269 = _sa_logt();
    if (os_log_type_enabled(v269, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24);
      uint64_t v270 = [self startSampleIndex];
      *(_DWORD *)long long buf = 134218240;
      uint64_t v390 = v4;
      __int16 v391 = 2048;
      uint64_t v392 = v270;
      _os_log_error_impl(&dword_1BF22B000, v269, OS_LOG_TYPE_ERROR, "leafFrameSkippedCountedStateToIndex %lu + 1 != treeCountedState.startSampleIndex %lu", buf, 0x16u);
    }

    *__error() = v268;
    uint64_t v271 = *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24);
    [self startSampleIndex];
    _SASetCrashLogMessage(11708, "leafFrameSkippedCountedStateToIndex %lu + 1 != treeCountedState.startSampleIndex %lu", v272, v273, v274, v275, v276, v277, v271);
    _os_crash();
    __break(1u);
LABEL_321:
    int v278 = *__error();
    int v279 = _sa_logt();
    if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
    {
      int v280 = [v6 binary];
      id v5 = [v280 debugDescription];
      uint64_t v281 = [v5 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      *(void *)(v4 + 4) = v281;
      _os_log_error_impl(&dword_1BF22B000, v279, OS_LOG_TYPE_ERROR, "binaryIndex nil for %s", buf, 0xCu);
    }
    *__error() = v278;
    int v282 = [v6 binary];
    id v283 = [v282 debugDescription];
    char v284 = [v283 UTF8String];
    _SASetCrashLogMessage(12311, "binaryIndex nil for %s", v285, v286, v287, v288, v289, v290, v284);

    _os_crash();
    __break(1u);
    goto LABEL_324;
  }
LABEL_18:
  context = v13;
  *(void *)uint64_t v395 = 0;
  uint64_t v396 = v395;
  uint64_t v397 = 0x2020000000;
  int v24 = 2 * v23 + 2;
  if (v15) {
    int v24 = 2;
  }
  int v398 = v24;
  v384[0] = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v384[1] = 3221225472;
  v384[2] = __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2167;
  v384[3] = &unk_1E63F9AB0;
  v384[4] = v18;
  v384[5] = v22;
  unsigned int v385 = a3;
  v384[6] = v399;
  v384[7] = v395;
  char v386 = v15;
  uint64_t v368 = (void (**)(void, void))MEMORY[0x1C18A6C80](v384);
  objc_opt_class();
  uint64_t v7 = a1;
  if (objc_opt_isKindOfClass())
  {
    self = (uint64_t *)v369;
    if (*(void *)(a1 + 176) && (unint64_t)[self sampleCount] <= *(void *)(a1 + 176))
    {
      id Property = self;
      if (self) {
        id Property = objc_getProperty(self, v25, 40, 1);
      }
      id v77 = Property;
      [v77 removeAllObjects];

      goto LABEL_373;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 16) systemstatsFormat]
      && ([self isTruncatedLeafCallstack] & 1) != 0)
    {
      goto LABEL_373;
    }
    if (!a3)
    {
      id v83 = [self frame];
      int v84 = [v83 isTruncatedBacktraceFrame];

      uint64_t v7 = v371;
      uint64_t v85 = *(void *)(*(void *)(v371 + 112) + 8);
      int v365 = 0;
      if (v84) {
        *(unsigned char *)(v85 + 24) = 1;
      }
      else {
        *(unsigned char *)(v85 + 24) = 0;
      }
      goto LABEL_135;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
    {
      int v365 = 0;
      goto LABEL_135;
    }
LABEL_107:
    uint64_t v101 = [self frame];
    uint64_t v102 = (void *)v101;
    if (v101) {
      uint64_t v103 = *(void **)(v101 + 32);
    }
    else {
      uint64_t v103 = 0;
    }
    id v104 = v103;
    if ([v104 isTruncatedBacktraceFrame])
    {
      uint64_t v105 = [self frame];
      uint64_t v106 = (void *)v105;
      if (v105) {
        uint64_t v107 = *(void **)(v105 + 32);
      }
      else {
        uint64_t v107 = 0;
      }
      id v5 = v107;
      int v108 = [v5 isExclave];

      int v365 = v108 ^ 1;
    }
    else
    {
      int v365 = 0;
    }

    uint64_t v7 = v371;
LABEL_135:
    if (*(void *)(v7 + 64))
    {
      id v123 = self;
      if (self) {
        id v123 = objc_getProperty(self, v26, 40, 1);
      }
      id v124 = v123;
      [v124 sortUsingComparator:*(void *)(v371 + 64)];

      uint64_t v7 = v371;
    }
    if (*(unsigned char *)(v7 + 209))
    {
      uint64_t v125 = *(void *)(*(void *)(v7 + 120) + 8);
      if (*(unsigned char *)(v125 + 24)) {
        *(unsigned char *)(v125 + 24) = 0;
      }
      else {
        [*(id *)(v7 + 40) appendString:@","];
      }
      [*(id *)(v371 + 40) appendString:@"{"];
      [self writeJSONDictionaryEntriesToStream:*(void *)(v371 + 40)];
      int v127 = *(void **)(v371 + 40);
      int v128 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v400 + 6)];
      SAJSONWriteDictionaryEntry(v127, @"depth", v128);

      if (!*(unsigned char *)(v371 + 210))
      {
        int v129 = *(void **)(v371 + 40);
        uint64_t v130 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v371 + 32), objc_msgSend(self, "startSampleIndex") + objc_msgSend(self, "sampleCount") - 1));
        SAJSONWriteDictionaryEntry(v129, @"endIndex", v130);
      }
      if (v365) {
        SAJSONWriteDictionaryEntry(*(void **)(v371 + 40), @"patched", MEMORY[0x1E4F1CC38]);
      }
      [*(id *)(v371 + 40) appendString:@"}"];
      uint64_t v75 = *(void *)(v371 + 80);
LABEL_231:
      ++*(void *)(*(void *)(v75 + 8) + 24);
      goto LABEL_373;
    }
    uint64_t v126 = *(void *)(*(void *)(*(void *)(v7 + 128) + 8) + 24);
    if (v126 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(unsigned char *)(v7 + 210))
      {
        saos_printf_frame(*(void **)(v7 + 40), *(unsigned int *)(*(void *)(*(void *)(v7 + 136) + 8) + 24), *(unsigned int *)(v7 + 200), v126 - *(void *)(*(void *)(*(void *)(v7 + 144) + 8) + 24) + 1, *(unsigned __int8 *)(*(void *)(*(void *)(v7 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v7 + 160) + 8) + 40));
      }
      else
      {
        unint64_t v149 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v7 + 32), v126);
        saos_printf_timeline_frame(*(void **)(v371 + 40), *(unsigned int *)(*(void *)(*(void *)(v371 + 136) + 8) + 24), *(unsigned int *)(v371 + 200), *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v371 + 160) + 8) + 40), v149);
      }
      ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
      *(unsigned char *)(*(void *)(*(void *)(v371 + 152) + 8) + 24) = 0;
      *(_DWORD *)(*(void *)(*(void *)(v371 + 136) + 8) + 24) = 0;
      uint64_t v150 = *(void *)(*(void *)(v371 + 160) + 8);
      unint64_t v151 = *(void **)(v150 + 40);
      *(void *)(v150 + 40) = 0;

      uint64_t v7 = v371;
      *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (![*(id *)(*(void *)(v7 + 32) + 16) systemstatsFormat])
    {
      uint64_t v160 = [self frame];
      int v161 = [v160 isKernel];

      if (v161)
      {
        uint64_t v162 = v371;
        uint64_t v154 = -[SASamplePrinter binaryImagesHitByTask:](*(void *)(v371 + 32), *(void **)(v371 + 48));
        uint64_t v163 = *(__CFString **)(v371 + 56);
        uint64_t v164 = v163;
      }
      else
      {
        uint64_t v164 = 0;
        uint64_t v162 = v371;
        uint64_t v163 = *(__CFString **)(v371 + 56);
        uint64_t v154 = v163;
      }
      uint64_t v165 = v163;
      int v166 = [self isTruncatedLeafCallstack];
      uint64_t v167 = *(void *)(v162 + 32);
      if (v166)
      {
        uint64_t v169 = [self frame];
        id v170 = self;
        if (self) {
          id v170 = objc_getProperty(self, v168, 48, 1);
        }
        id v171 = v170;
        uint64_t v172 = (void *)-[SASamplePrinter copyDescriptionForTruncatedLeafFrame:otherCallTreeDescription:binariesToDisplay:extraBinariesToDisplay:](v167, v169, v171, v154, v164);
        uint64_t v393 = v172;
        int v173 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v393 count:1];
      }
      else
      {
        uint64_t v169 = [self frame];
        int v173 = -[SASamplePrinter copyDescriptionsForFrame:binariesToDisplay:extraBinariesToDisplay:](v167, v169, v154, v164);
      }

      goto LABEL_346;
    }
    uint64_t v152 = *(void *)(v7 + 32);
    id v153 = [self frame];
    uint64_t v154 = v153;
    if (!v152)
    {
      uint64_t v164 = 0;
LABEL_345:

      uint64_t v394 = v164;
      int v173 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v394 count:1];
LABEL_346:

      if (v365)
      {
        uint64_t v320 = (void *)[v173 mutableCopy];
        [v320 insertObject:@"<patched truncated backtrace>" atIndex:0];
      }
      else
      {
        uint64_t v320 = v173;
      }
      uint64_t v321 = v371;
      if ((unint64_t)[v320 count] >= 2)
      {
        for (unint64_t i = 0; i < [v320 count] - 1; ++i)
        {
          id v323 = [v320 objectAtIndexedSubscript:i];
          uint64_t v324 = *(void *)(v321 + 32);
          if (*(unsigned char *)(v321 + 210))
          {
            int v325 = [*(id *)(v324 + 16) systemstatsFormat];
            SEL v326 = *(void **)(v321 + 40);
            uint64_t v327 = *((unsigned int *)v396 + 6);
            if (v325)
            {
              uint64_t v328 = [self sampleCount];
              uint64_t v329 = [self frame];
              saos_printf_frame_noindent(v326, v327, v328, [v329 isKernel], v323);
            }
            else
            {
              uint64_t v335 = *(unsigned int *)(v321 + 200);
              uint64_t v336 = [self sampleCount];
              uint64_t v329 = [self frame];
              saos_printf_frame(v326, v327, v335, v336, [v329 isKernel], v323);
            }
          }
          else
          {
            unint64_t v330 = -[SASamplePrinter displayTimeIndexForSampleIndex:](v324, [self startSampleIndex] + objc_msgSend(self, "sampleCount") - 1);
            int v331 = [*(id *)(*(void *)(v321 + 32) + 16) systemstatsFormat];
            int v332 = *(void **)(v321 + 40);
            uint64_t v333 = *((unsigned int *)v396 + 6);
            if (v331)
            {
              uint64_t v334 = [self sampleCount];
              uint64_t v329 = [self frame];
              saos_printf_timeline_frame_noindent(v332, v333, v334, [v329 isKernel], v323, v330);
            }
            else
            {
              uint64_t v337 = *(unsigned int *)(v321 + 200);
              uint64_t v338 = [self sampleCount];
              uint64_t v329 = [self frame];
              saos_printf_timeline_frame(v332, v333, v337, v338, [v329 isKernel], v323, v330);
            }
          }

          ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
          v368[2](v368, 1);

          uint64_t v321 = v371;
        }
      }
      unint64_t v339 = [v320 lastObject];
      if (self && (self[3] & 1) != 0 && !*(unsigned char *)(v321 + 208) && !*(unsigned char *)(v321 + 211))
      {
        SEL v357 = [self frame];
        *(unsigned char *)(*(void *)(*(void *)(v321 + 152) + 8) + 24) = [v357 isKernel];

        *(_DWORD *)(*(void *)(*(void *)(v371 + 136) + 8) + 24) = *((_DWORD *)v396 + 6);
        objc_storeStrong((id *)(*(void *)(*(void *)(v371 + 160) + 8) + 40), v339);
        *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24) = [self startSampleIndex];
        uint64_t v355 = *(void *)(*(void *)(v371 + 128) + 8);
        uint64_t v356 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v340 = *(void *)(v321 + 32);
        if (*(unsigned char *)(v321 + 210))
        {
          int v341 = [*(id *)(v340 + 16) systemstatsFormat];
          id v342 = *(void **)(v321 + 40);
          uint64_t v343 = *((unsigned int *)v396 + 6);
          if (v341)
          {
            uint64_t v344 = [self sampleCount];
            SEL v345 = [self frame];
            saos_printf_frame_noindent(v342, v343, v344, [v345 isKernel], v339);
          }
          else
          {
            uint64_t v351 = *(unsigned int *)(v321 + 200);
            uint64_t v352 = [self sampleCount];
            SEL v345 = [self frame];
            saos_printf_frame(v342, v343, v351, v352, [v345 isKernel], v339);
          }
        }
        else
        {
          unint64_t v346 = -[SASamplePrinter displayTimeIndexForSampleIndex:](v340, [self startSampleIndex] + objc_msgSend(self, "sampleCount") - 1);
          int v347 = [*(id *)(*(void *)(v321 + 32) + 16) systemstatsFormat];
          id v348 = *(void **)(v321 + 40);
          uint64_t v349 = *((unsigned int *)v396 + 6);
          if (v347)
          {
            uint64_t v350 = [self sampleCount];
            SEL v345 = [self frame];
            saos_printf_timeline_frame_noindent(v348, v349, v350, [v345 isKernel], v339, v346);
          }
          else
          {
            uint64_t v353 = *(unsigned int *)(v321 + 200);
            uint64_t v354 = [self sampleCount];
            SEL v345 = [self frame];
            saos_printf_timeline_frame(v348, v349, v353, v354, [v345 isKernel], v339, v346);
          }
        }

        uint64_t v355 = *(void *)(*(void *)(v371 + 80) + 8);
        uint64_t v356 = *(void *)(v355 + 24) + 1;
      }
      *(void *)(v355 + 24) = v356;

      goto LABEL_373;
    }
    if (v153)
    {
      id WeakRetained = objc_loadWeakRetained(v153 + 3);
      unint64_t v6 = WeakRetained;
      if (WeakRetained)
      {
        int v156 = [WeakRetained binary];
        uint64_t v157 = [v6 segment];
        uint64_t v8 = [v157 name];
        unint64_t v158 = [*(id *)(v152 + 80) objectForKeyedSubscript:v156];
        uint64_t v159 = v158;
        if (v8)
        {
          uint64_t v7 = [v158 objectForKeyedSubscript:v8];
        }
        else
        {
          unint64_t v175 = [MEMORY[0x1E4F1CA98] null];
          uint64_t v7 = [v159 objectForKeyedSubscript:v175];
        }
        if (v7)
        {
          uint64_t v164 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu + %llu", objc_msgSend((id)v7, "unsignedLongValue"), objc_msgSend(v154, "address") - objc_msgSend(v6, "loadAddress"));

LABEL_344:
          goto LABEL_345;
        }
        goto LABEL_321;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    uint64_t v164 = @"???";
    goto LABEL_344;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = (uint64_t *)v369;
    if (*((_DWORD *)v400 + 6)
      || !*(void *)(a1 + 176)
      || (unint64_t)[self sampleCount] > *(void *)(a1 + 176))
    {
      if (*(void *)(a1 + 72))
      {
        id v28 = self;
        if (self) {
          id v28 = objc_getProperty(self, v27, 80, 1);
        }
        id v29 = v28;
        [v29 sortUsingComparator:*(void *)(v371 + 72)];

        uint64_t v7 = v371;
      }
      if (*(unsigned char *)(v7 + 212))
      {
        uint64_t v8 = 0x1EA144000uLL;
        id v5 = (int *)0x1EA144000;
        uint64_t v30 = self;
        if (!self) {
          goto LABEL_333;
        }
        uint64_t v31 = *((unsigned int *)self + 9);
        if (*(uint64_t *)((char *)self + 36) != -1)
        {
          uint64_t v34 = *(id **)(v7 + 32);
          uint64_t v33 = (id **)(v7 + 32);
          uint64_t v32 = v34;
          uint64_t v30 = objc_getProperty(self, v27, 88, 1);
          goto LABEL_38;
        }
      }
      uint64_t v366 = 0;
      goto LABEL_85;
    }
    goto LABEL_373;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = (uint64_t *)v369;
      if (*(unsigned char *)(a1 + 209))
      {
        uint64_t v78 = *(void *)(*(void *)(a1 + 120) + 8);
        if (*(unsigned char *)(v78 + 24)) {
          *(unsigned char *)(v78 + 24) = 0;
        }
        else {
          [*(id *)(a1 + 40) appendString:@","];
        }
        uint64_t v174 = [self stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1F1A80538];

        uint64_t v7 = v371;
        SAJSONWriteItem(*(void **)(v371 + 40), v174);
        self = (uint64_t *)v174;
      }
      else
      {
        uint64_t v148 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24);
        if (v148 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*(unsigned char *)(a1 + 210))
          {
            saos_printf_frame(*(void **)(a1 + 40), *(unsigned int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24), *(unsigned int *)(a1 + 200), v148 - *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) + 1, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40));
          }
          else
          {
            unint64_t v203 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(a1 + 32), v148);
            saos_printf_timeline_frame(*(void **)(a1 + 40), *(unsigned int *)(*(void *)(*(void *)(a1 + 136) + 8) + 24), *(unsigned int *)(a1 + 200), *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40), v203);
          }
          ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
          *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 128)
                                                                                               + 8)
                                                                                   + 24)
                                                                       + 1;
          *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
        }
        [*(id *)(a1 + 40) printWithFormat:@"%-*s<%@>\n", 2, "", self];
      }
      uint64_t v75 = *(void *)(v7 + 80);
      goto LABEL_231;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_374;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_374;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_374;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_374;
    }
    int v87 = *__error();
    uint64_t v88 = _sa_logt();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      uint64_t v89 = (objc_class *)objc_opt_class();
      NSStringFromClass(v89);
      id v90 = objc_claimAutoreleasedReturnValue();
      uint64_t v91 = [v90 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      uint64_t v390 = v91;
      _os_log_error_impl(&dword_1BF22B000, v88, OS_LOG_TYPE_ERROR, "treeNode is a %s", buf, 0xCu);
    }
    *__error() = v87;
    unint64_t v92 = (objc_class *)objc_opt_class();
    NSStringFromClass(v92);
    id v93 = objc_claimAutoreleasedReturnValue();
    char v94 = [v93 UTF8String];
    _SASetCrashLogMessage(11904, "treeNode is a %s", v95, v96, v97, v98, v99, v100, v94);

    _os_crash();
    __break(1u);
    goto LABEL_107;
  }
  uint64_t v50 = (uint64_t *)v369;
  self = v50;
  if (*(unsigned char *)(a1 + 209))
  {
    if (v50) {
      uint64_t v50 = (uint64_t *)objc_getProperty(v50, v51, 40, 1);
    }
    id v52 = v50;
    if ([v52 count])
    {

LABEL_50:
      long long v378 = 0u;
      long long v379 = 0u;
      long long v376 = 0u;
      long long v377 = 0u;
      id v55 = self;
      if (self) {
        id v55 = objc_getProperty(self, v54, 40, 1);
      }
      id v56 = v55;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v376 objects:v388 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v377;
        do
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v377 != v58) {
              objc_enumerationMutation(v56);
            }
            uint64_t v60 = *(void **)(*((void *)&v376 + 1) + 8 * j);
            uint64_t v61 = *(void *)(*(void *)(v371 + 120) + 8);
            if (*(unsigned char *)(v61 + 24)) {
              *(unsigned char *)(v61 + 24) = 0;
            }
            else {
              [*(id *)(v371 + 40) appendString:@","];
            }
            [*(id *)(v371 + 40) appendString:@"{"];
            [v60 writeJSONDictionaryEntriesToStream:*(void *)(v371 + 40)];
            id v62 = *(void **)(v371 + 40);
            BOOL v63 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v400 + 6)];
            SAJSONWriteDictionaryEntry(v62, @"depth", v63);

            [*(id *)(v371 + 40) appendString:@"}"];
          }
          uint64_t v57 = [v56 countByEnumeratingWithState:&v376 objects:v388 count:16];
        }
        while (v57);
      }

      uint64_t v65 = v371;
      if (*(unsigned char *)(v371 + 213))
      {
        long long v374 = 0u;
        long long v375 = 0u;
        long long v372 = 0u;
        long long v373 = 0u;
        id v66 = self;
        if (self) {
          id v66 = objc_getProperty(self, v64, 32, 1);
        }
        id v67 = v66;
        uint64_t v68 = [v67 countByEnumeratingWithState:&v372 objects:v387 count:16];
        if (v68)
        {
          uint64_t v69 = *(void *)v373;
          do
          {
            for (uint64_t k = 0; k != v68; ++k)
            {
              if (*(void *)v373 != v69) {
                objc_enumerationMutation(v67);
              }
              char v71 = *(void **)(*((void *)&v372 + 1) + 8 * k);
              uint64_t v72 = *(void *)(*(void *)(v371 + 120) + 8);
              if (*(unsigned char *)(v72 + 24)) {
                *(unsigned char *)(v72 + 24) = 0;
              }
              else {
                [*(id *)(v371 + 40) appendString:@","];
              }
              [*(id *)(v371 + 40) appendString:@"{"];
              [v71 writeJSONDictionaryEntriesToStream:*(void *)(v371 + 40)];
              uint64_t v73 = *(void **)(v371 + 40);
              uint64_t v74 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v400 + 6)];
              SAJSONWriteDictionaryEntry(v73, @"depth", v74);

              [*(id *)(v371 + 40) appendString:@"}"];
            }
            uint64_t v68 = [v67 countByEnumeratingWithState:&v372 objects:v387 count:16];
          }
          while (v68);
        }

        uint64_t v65 = v371;
      }
      uint64_t v75 = *(void *)(v65 + 80);
      goto LABEL_231;
    }
    if (*(unsigned char *)(a1 + 213))
    {
      id v131 = self;
      if (self) {
        id v131 = objc_getProperty(self, v53, 32, 1);
      }
      id v132 = v131;
      BOOL v133 = v132 == 0;

      if (!v133) {
        goto LABEL_50;
      }
    }
    else
    {
    }
LABEL_200:
    v368[2](v368, 0xFFFFFFFFLL);
    goto LABEL_373;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 16) systemstatsFormat])
  {
    id v140 = self;
    if (self) {
      id v140 = objc_getProperty(self, v111, 40, 1);
    }
    id v141 = v140;
    BOOL v142 = [v141 count] == 0;

    if (v142)
    {
      SEL v147 = 0;
    }
    else
    {
      id v144 = self;
      id v145 = *(id **)(v371 + 32);
      if (self) {
        id v144 = objc_getProperty(self, v143, 40, 1);
      }
      id v146 = v144;
      SEL v147 = (void *)-[SASamplePrinter copyDescriptionForIOEvents:](v145, v146);
    }
    uint64_t v176 = v371;
    if (*(unsigned char *)(v371 + 213))
    {
      uint64_t v177 = *(void *)(v371 + 32);
      id v178 = self;
      if (self) {
        id v178 = objc_getProperty(self, v143, 32, 1);
      }
      id v179 = v178;
      id v180 = -[SASamplePrinter copyDescriptionForTimeRanges:](v177, v179);

      uint64_t v176 = v371;
    }
    else
    {
      id v180 = 0;
    }
    if ([v180 length])
    {
      uint64_t v181 = [v147 length];
      uint64_t v182 = v180;
      if (v181)
      {
        id v183 = [v147 stringByAppendingFormat:@", %@", v180];
        goto LABEL_212;
      }
    }
    else
    {
      uint64_t v184 = [v147 length];
      uint64_t v182 = v147;
      if (!v184) {
        goto LABEL_216;
      }
    }
    id v183 = v182;
LABEL_212:
    int v185 = v183;
    if (v183)
    {
      uint64_t v186 = *(void *)(*(void *)(*(void *)(v176 + 128) + 8) + 24);
      if (v186 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (*(unsigned char *)(v176 + 210))
        {
          saos_printf_frame(*(void **)(v176 + 40), *(unsigned int *)(*(void *)(*(void *)(v176 + 136) + 8) + 24), *(unsigned int *)(v176 + 200), v186 - *(void *)(*(void *)(*(void *)(v176 + 144) + 8) + 24) + 1, *(unsigned __int8 *)(*(void *)(*(void *)(v176 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v176 + 160) + 8) + 40));
        }
        else
        {
          unint64_t v250 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v176 + 32), v186);
          saos_printf_timeline_frame(*(void **)(v176 + 40), *(unsigned int *)(*(void *)(*(void *)(v176 + 136) + 8) + 24), *(unsigned int *)(v176 + 200), *(void *)(*(void *)(*(void *)(v176 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(v176 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(v176 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v176 + 160) + 8) + 40), v250);
        }
        ++*(void *)(*(void *)(*(void *)(v176 + 80) + 8) + 24);
        *(void *)(*(void *)(*(void *)(v176 + 144) + 8) + 24) = *(void *)(*(void *)(*(void *)(v176 + 128)
                                                                                               + 8)
                                                                                   + 24)
                                                                       + 1;
        *(void *)(*(void *)(*(void *)(v176 + 128) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
      }
      saos_printf_call_tree_node_without_count(*(void **)(v176 + 40), *((unsigned int *)v396 + 6), *(unsigned int *)(v176 + 200), v185);
      ++*(void *)(*(void *)(*(void *)(v176 + 80) + 8) + 24);

      goto LABEL_309;
    }
LABEL_216:
    v368[2](v368, 0xFFFFFFFFLL);
LABEL_309:

    goto LABEL_373;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 16) displayIOInCallTrees])
  {
    if (*(unsigned char *)(a1 + 213))
    {
      id v113 = self;
      if (self) {
        id v113 = objc_getProperty(self, v112, 32, 1);
      }
      id v114 = v113;
      BOOL v115 = [v114 count] == 0;

      if (!v115)
      {
        if ([*(id *)(*(void *)(v371 + 32) + 16) callTreeTimestampsTimeDomain] != 1) {
          goto LABEL_330;
        }
        id v117 = NSString;
        uint64_t v118 = *(void *)(v371 + 32);
        id v119 = self;
        if (self) {
          id v119 = objc_getProperty(self, v116, 32, 1);
        }
        id v120 = v119;
        id v121 = -[SASamplePrinter copyDescriptionForTimeRanges:](v118, v120);
        int v122 = [v117 stringWithFormat:@"walltime %@", v121];

        saos_printf_call_tree_node_noindent(*(void **)(v371 + 40), *((unsigned int *)v396 + 6), [self sampleCount], v122);
        goto LABEL_373;
      }
    }
    goto LABEL_200;
  }
LABEL_324:
  int v291 = *__error();
  uint64_t v292 = _sa_logt();
  if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v292, OS_LOG_TYPE_ERROR, "Displaying IO in call trees unsupported in systemstats format", buf, 2u);
  }

  *__error() = v291;
  _SASetCrashLogMessage(11803, "Displaying IO in call trees unsupported in systemstats format", v293, v294, v295, v296, v297, v298, v358);
  _os_crash();
  __break(1u);
  while (1)
  {
    int v299 = *__error();
    uint64_t v300 = _sa_logt();
    if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24);
      uint64_t v301 = [self startSampleIndex];
      *(_DWORD *)long long buf = 134218240;
      uint64_t v390 = v4;
      __int16 v391 = 2048;
      uint64_t v392 = v301;
      _os_log_error_impl(&dword_1BF22B000, v300, OS_LOG_TYPE_ERROR, "leafFrameSkippedCountedStateToIndex %lu + 1 != treeCountedState.startSampleIndex %lu", buf, 0x16u);
    }

    *__error() = v299;
    uint64_t v302 = *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24);
    [self startSampleIndex];
    _SASetCrashLogMessage(11618, "leafFrameSkippedCountedStateToIndex %lu + 1 != treeCountedState.startSampleIndex %lu", v303, v304, v305, v306, v307, v308, v302);
    _os_crash();
    __break(1u);
LABEL_330:
    int v309 = *__error();
    id v310 = _sa_logt();
    if (os_log_type_enabled(v310, OS_LOG_TYPE_ERROR))
    {
      uint64_t v311 = [*(id *)(*(void *)(v371 + 32) + 16) callTreeTimestampsTimeDomain];
      *(_DWORD *)long long buf = 134217984;
      *(void *)(v4 + 4) = v311;
      _os_log_error_impl(&dword_1BF22B000, v310, OS_LOG_TYPE_ERROR, "Time domain other than walltime not handled for systemstats format: 0x%llx", buf, 0xCu);
    }

    *__error() = v309;
    char v312 = [*(id *)(*(void *)(v371 + 32) + 16) callTreeTimestampsTimeDomain];
    _SASetCrashLogMessage(11806, "Time domain other than walltime not handled for systemstats format: 0x%llx", v313, v314, v315, v316, v317, v318, v312);
    uint64_t v30 = (void *)_os_crash();
    __break(1u);
LABEL_333:
    uint64_t v31 = 0;
    id v319 = *(id **)(v7 + 32);
    uint64_t v33 = (id **)(v7 + 32);
    uint64_t v32 = v319;
LABEL_38:
    id v35 = v30;
    __int16 v36 = [v35 firstObject];
    uint64_t v37 = [v36 startTime];
    unint64_t v6 = -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v32, v31, v37);

    uint64_t v39 = *v33;
    if (self)
    {
      uint64_t v40 = *(unsigned int *)((char *)self + *(int *)(v8 + 3536));
      id v41 = objc_getProperty(self, v38, v5[872], 1);
    }
    else
    {
      uint64_t v40 = 0;
      id v41 = 0;
    }
    id v42 = v41;
    id v43 = [v42 firstObject];
    id v44 = [v43 startTime];
    id v45 = -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v39, v40, v44);

    uint64_t v46 = *v33;
    if (self)
    {
      uint64_t v4 = *(unsigned int *)((char *)self + *(int *)(v8 + 3536));
      id v5 = (int *)*((unsigned int *)self + 9);
      if (!v46) {
        goto LABEL_337;
      }
    }
    else
    {
      uint64_t v4 = 0;
      id v5 = 0;
      if (!v46)
      {
LABEL_337:
        uint64_t v366 = 0;
        goto LABEL_43;
      }
    }
    unint64_t v47 = (objc_class *)NSString;
    id v48 = v6;
    id v49 = v45;
    uint64_t v366 = [[v47 alloc] initWithFormat:@"%@ [%d] (originated by %@ [%d])", v49, v4, v48, v5];

LABEL_43:
    uint64_t v7 = v371;
LABEL_85:
    if (*(unsigned char *)(v7 + 209)) {
      break;
    }
    if (*((_DWORD *)v400 + 6)) {
      goto LABEL_235;
    }
    uint64_t v86 = *(void *)(*(void *)(*(void *)(v7 + 128) + 8) + 24);
    if (v86 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_219;
    }
    if (v86 + 1 == [self startSampleIndex])
    {
      if (*(unsigned char *)(v7 + 210))
      {
        saos_printf_frame(*(void **)(v7 + 40), *(unsigned int *)(*(void *)(*(void *)(v7 + 136) + 8) + 24), *(unsigned int *)(v7 + 200), *(void *)(*(void *)(*(void *)(v7 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(v7 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(v7 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v7 + 160) + 8) + 40));
      }
      else
      {
        unint64_t v187 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v7 + 32), *(void *)(*(void *)(*(void *)(v7 + 128) + 8) + 24));
        saos_printf_timeline_frame(*(void **)(v7 + 40), *(unsigned int *)(*(void *)(*(void *)(v7 + 136) + 8) + 24), *(unsigned int *)(v7 + 200), *(void *)(*(void *)(*(void *)(v7 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(v7 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(v7 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v7 + 160) + 8) + 40), v187);
      }
      ++*(void *)(*(void *)(*(void *)(v7 + 80) + 8) + 24);
      *(unsigned char *)(*(void *)(*(void *)(v7 + 152) + 8) + 24) = 0;
      *(_DWORD *)(*(void *)(*(void *)(v7 + 136) + 8) + 24) = 0;
      uint64_t v188 = *(void *)(*(void *)(v7 + 160) + 8);
      id v189 = *(void **)(v188 + 40);
      *(void *)(v188 + 40) = 0;

      uint64_t v7 = v371;
      *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
LABEL_219:
      uint64_t v190 = -[SASamplePrinter copyDescriptionsForFrame:binariesToDisplay:extraBinariesToDisplay:](*(void *)(v7 + 32), 0, *(void **)(v7 + 56), 0);
      unint64_t v6 = [v190 firstObject];

      uint64_t v4 = v371;
      if (*(unsigned char *)(v371 + 211))
      {
        uint64_t v191 = *(void *)(v371 + 32);
        if (*(unsigned char *)(v371 + 210))
        {
          int v192 = [*(id *)(v191 + 16) systemstatsFormat];
          uint64_t v193 = *(void **)(v371 + 40);
          uint64_t v194 = *((unsigned int *)v396 + 6);
          if (v192) {
            saos_printf_frame_noindent(v193, v194, [self sampleCount], 0, v6);
          }
          else {
            saos_printf_frame(v193, v194, *(unsigned int *)(v371 + 200), [self sampleCount], 0, v6);
          }
        }
        else
        {
          unint64_t v199 = -[SASamplePrinter displayTimeIndexForSampleIndex:](v191, [self startSampleIndex] + objc_msgSend(self, "sampleCount") - 1);
          int v200 = [*(id *)(*(void *)(v371 + 32) + 16) systemstatsFormat];
          id v201 = *(void **)(v371 + 40);
          uint64_t v202 = *((unsigned int *)v396 + 6);
          if (v200) {
            saos_printf_timeline_frame_noindent(v201, v202, [self sampleCount], 0, v6, v199);
          }
          else {
            saos_printf_timeline_frame(v201, v202, *(unsigned int *)(v371 + 200), [self sampleCount], 0, v6, v199);
          }
        }
        ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
        v368[2](v368, 1);
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(v371 + 152) + 8) + 24) = 0;
        uint64_t v195 = -[SASamplePrinter copyDescriptionsForFrame:binariesToDisplay:extraBinariesToDisplay:](*(void *)(v371 + 32), 0, *(void **)(v371 + 56), 0);
        uint64_t v196 = [v195 firstObject];
        uint64_t v197 = *(void *)(*(void *)(v371 + 160) + 8);
        uint64_t v198 = *(void **)(v197 + 40);
        *(void *)(v197 + 40) = v196;

        *(_DWORD *)(*(void *)(*(void *)(v371 + 136) + 8) + 24) = *((_DWORD *)v396 + 6);
        *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24) = [self startSampleIndex];
        *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
      }

LABEL_235:
      if (self)
      {
        id v364 = objc_getProperty(self, v27, 64, 1);
        uint64_t v205 = (int *)objc_getProperty(self, v204, 56, 1);
        id v5 = v205;
        unint64_t v6 = (void *)0x1EA144000;
        uint64_t v4 = (uint64_t)v364;
        if (v364)
        {
          uint64_t v7 = (uint64_t)v205;
          uint64_t v206 = *((unsigned int *)self + 7);
          uint64_t v207 = self[6];
          uint64_t v208 = *((unsigned __int8 *)self + 24);
          uint64_t v209 = *(void *)(v371 + 192);
          v382[0] = MEMORY[0x1E4F143A8];
          v382[1] = v9;
          v382[2] = __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2183;
          v382[3] = &unk_1E63F9AD8;
          v382[4] = *(void *)(v371 + 32);
          uint64_t v383 = self;
          uint64_t v8 = [v364 descriptionForPid:v206 tid:v207 threadPriority:v208 options:v209 nameCallback:v382];

          id v5 = (int *)v7;
          if (!v7) {
            goto LABEL_251;
          }
          if (v8)
          {
            if (([*(id *)(*(void *)(v371 + 32) + 16) displayMultipleMatchingBlockedReasons] & 1) == 0
              && ([(id)v7 hasMatchingBlocker:v364] & 1) != 0)
            {
              uint64_t v210 = v371;
              id v5 = (int *)v7;
              goto LABEL_252;
            }
            uint64_t v4 = 0;
            id v5 = (int *)v7;
LABEL_246:
            uint64_t v211 = *((unsigned int *)self + 7);
            uint64_t v212 = self[6];
            uint64_t v213 = *(void *)(v371 + 192);
            v380[0] = MEMORY[0x1E4F143A8];
            v380[1] = v9;
            v380[2] = __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2;
            v380[3] = &unk_1E63F9AD8;
            v380[4] = *(void *)(v371 + 32);
            char v381 = self;
            uint64_t v214 = [v5 descriptionForPid:v211 tid:v212 options:v213 nameCallback:v380];
            unsigned int v215 = v214;
            if (v214)
            {
              if (v4)
              {
                uint64_t v8 = v214;
              }
              else
              {
                uint64_t v216 = [(id)v8 stringByAppendingFormat:@", %@", v214];

                uint64_t v8 = v216;
              }
            }

LABEL_251:
            uint64_t v210 = v371;
LABEL_252:
            if (*((unsigned char *)self + 25))
            {
              char v363 = v5;
              unsigned int v217 = @" - part of a deadlock";
              if (v8) {
                goto LABEL_257;
              }
LABEL_255:
              uint64_t v362 = v217;
              goto LABEL_279;
            }
            if (*((unsigned char *)self + 26))
            {
              char v363 = v5;
              unsigned int v217 = @" - ends in a deadlock";
              if (!v8) {
                goto LABEL_255;
              }
LABEL_257:
              uint64_t v218 = [(id)v8 stringByAppendingFormat:v217];

              uint64_t v8 = v218;
              uint64_t v210 = v371;
              id v5 = v363;
            }
LABEL_258:
            char v363 = v5;
            if (v8 | v366)
            {
              uint64_t v362 = (__CFString *)v8;
              goto LABEL_279;
            }
            int v219 = *((_DWORD *)self + 8);
LABEL_261:
            if (_microstackshot_state_has_change_to_display(v219, *(_DWORD *)(v210 + 204), [*(id *)(*(void *)(v210 + 32) + 16) systemstatsFormat], objc_msgSend(*(id *)(*(void *)(v371 + 32) + 16), "includeUserIdleAndBatteryStateInStacks")))
            {
              uint64_t v362 = 0;
              goto LABEL_278;
            }
            if (self) {
              uint64_t v220 = self[9];
            }
            else {
              uint64_t v220 = 0;
            }
            uint64_t v221 = *(void **)(v371 + 184);
            char v222 = [*(id *)(*(void *)(v371 + 32) + 16) systemstatsFormat];
            uint64_t v210 = v371;
            if ((v222 & 1) == 0)
            {
              if (v221)
              {
                if (*v221 == v220) {
                  goto LABEL_268;
                }
LABEL_305:
                uint64_t v362 = 0;
LABEL_279:
                uint64_t v229 = *(void *)(*(void *)(*(void *)(v210 + 128) + 8) + 24);
                if (v229 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v229 + 1 != [self startSampleIndex]) {
                    goto LABEL_318;
                  }
                  if (*(unsigned char *)(v371 + 210))
                  {
                    saos_printf_frame(*(void **)(v371 + 40), *(unsigned int *)(*(void *)(*(void *)(v371 + 136) + 8) + 24), *(unsigned int *)(v371 + 200), *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v371 + 160) + 8) + 40));
                  }
                  else
                  {
                    unint64_t v230 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v371 + 32), *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24));
                    saos_printf_timeline_frame(*(void **)(v371 + 40), *(unsigned int *)(*(void *)(*(void *)(v371 + 136) + 8) + 24), *(unsigned int *)(v371 + 200), *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24)- *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24)+ 1, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v371 + 160) + 8) + 40), v230);
                  }
                  uint64_t v210 = v371;
                  ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
                }
                if (*(unsigned char *)(v210 + 210))
                {
                  char v231 = *(void **)(v210 + 40);
                  if (*(unsigned char *)(v210 + 211))
                  {
                    unsigned int v360 = *((_DWORD *)v396 + 6);
                    unsigned int v232 = *(_DWORD *)(v210 + 200);
                    uint64_t v233 = [self sampleCount];
                    if (self)
                    {
                      uint64_t v234 = self[9];
                      unsigned int v235 = *((_DWORD *)self + 8);
                    }
                    else
                    {
                      uint64_t v234 = 0;
                      unsigned int v235 = 0;
                    }
                    saos_printf_microstackshot_state_as_frame(v231, v360, v232, v233, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24) != 0, v234, *(uint64_t **)(v371 + 184), v235, *(_DWORD *)(v371 + 204), [*(id *)(*(void *)(v371 + 32) + 16) systemstatsFormat], objc_msgSend(*(id *)(*(void *)(v371 + 32) + 16), "includeUserIdleAndBatteryStateInStacks"), objc_msgSend(*(id *)(*(void *)(v371 + 32) + 16), "systemstatsFormat"), (void *)v366);
                  }
                  else
                  {
                    uint64_t v241 = *(unsigned int *)(*(void *)(*(void *)(v210 + 136) + 8) + 24);
                    uint64_t v242 = *(unsigned int *)(v210 + 200);
                    uint64_t v243 = [self sampleCount];
                    if (self) {
                      uint64_t v244 = self[9];
                    }
                    else {
                      uint64_t v244 = 0;
                    }
                    saos_printf_frame_with_state(v231, v241, v242, v243, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v371 + 160) + 8) + 40), v244, v362);
                    v368[2](v368, 0xFFFFFFFFLL);
                  }
                }
                else
                {
                  unint64_t v236 = -[SASamplePrinter displayTimeIndexForSampleIndex:](*(void *)(v210 + 32), [self startSampleIndex] + objc_msgSend(self, "sampleCount") - 1);
                  id v237 = *(void **)(v371 + 40);
                  if (*(unsigned char *)(v371 + 211))
                  {
                    unsigned int v359 = *(_DWORD *)(v371 + 200);
                    unsigned int v361 = *((_DWORD *)v396 + 6);
                    uint64_t v238 = [self sampleCount];
                    if (self)
                    {
                      uint64_t v239 = self[9];
                      unsigned int v240 = *((_DWORD *)self + 8);
                    }
                    else
                    {
                      uint64_t v239 = 0;
                      unsigned int v240 = 0;
                    }
                    saos_printf_microstackshot_state_as_timeline_frame(v237, v361, v359, v238, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24) != 0, v239, *(uint64_t **)(v371 + 184), v240, *(_DWORD *)(v371 + 204), [*(id *)(*(void *)(v371 + 32) + 16) systemstatsFormat], objc_msgSend(*(id *)(*(void *)(v371 + 32) + 16), "includeUserIdleAndBatteryStateInStacks"), v236, objc_msgSend(*(id *)(*(void *)(v371 + 32) + 16), "systemstatsFormat"), (void *)v366);
                  }
                  else
                  {
                    uint64_t v245 = *(unsigned int *)(*(void *)(*(void *)(v371 + 136) + 8) + 24);
                    uint64_t v246 = *(unsigned int *)(v371 + 200);
                    uint64_t v247 = [self sampleCount];
                    if (self) {
                      uint64_t v248 = self[9];
                    }
                    else {
                      uint64_t v248 = 0;
                    }
                    saos_printf_timeline_frame_with_state(v237, v245, v246, v247, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v371 + 160) + 8) + 40), v248, v362, v236);
                    v368[2](v368, 0xFFFFFFFFLL);
                  }
                }
                ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
                uint64_t v249 = [self startSampleIndex];
                *(void *)(*(void *)(*(void *)(v371 + 144) + 8) + 24) = [self sampleCount]
                                                                               + v249;
                *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;

LABEL_301:
                goto LABEL_302;
              }
              if (v220) {
                goto LABEL_305;
              }
            }
LABEL_268:
            if (!*(unsigned char *)(v371 + 211))
            {
              if (*(unsigned char *)(v371 + 210))
              {
                unsigned int v223 = *(void **)(v371 + 40);
                uint64_t v224 = *(unsigned int *)(*(void *)(*(void *)(v371 + 136) + 8) + 24);
                uint64_t v225 = *(unsigned int *)(v371 + 200);
                uint64_t v226 = [self sampleCount];
                if (self) {
                  uint64_t v227 = self[9];
                }
                else {
                  uint64_t v227 = 0;
                }
                saos_printf_frame_with_state(v223, v224, v225, v226, *(unsigned __int8 *)(*(void *)(*(void *)(v371 + 152) + 8) + 24), *(void **)(*(void *)(*(void *)(v371 + 160) + 8) + 40), v227, 0);
                ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
              }
              else
              {
                uint64_t v251 = [self startSampleIndex];
                *(void *)(*(void *)(*(void *)(v371 + 128) + 8) + 24) = v251
                                                                               + [self sampleCount]
                                                                               - 1;
              }
            }
            v368[2](v368, 0xFFFFFFFFLL);
            goto LABEL_301;
          }
LABEL_244:
          uint64_t v4 = 1;
          goto LABEL_246;
        }
        if (v205)
        {
          uint64_t v8 = 0;
          goto LABEL_244;
        }
        if ((*((unsigned char *)self + 25) & 1) == 0)
        {
          id v5 = 0;
          uint64_t v210 = v371;
          if ((*((unsigned char *)self + 26) & 1) == 0)
          {
            uint64_t v8 = 0;
            goto LABEL_258;
          }
          uint64_t v362 = @" - ends in a deadlock";
          char v363 = 0;
          id v364 = 0;
          goto LABEL_279;
        }
        char v363 = 0;
        id v364 = 0;
        int v228 = @" - part of a deadlock";
      }
      else
      {
        char v363 = 0;
        if (!v366)
        {
          int v219 = 0;
          id v364 = 0;
          uint64_t v210 = v371;
          goto LABEL_261;
        }
        int v228 = 0;
        id v364 = 0;
      }
      uint64_t v362 = v228;
LABEL_278:
      uint64_t v210 = v371;
      goto LABEL_279;
    }
  }
  if (self)
  {
    BOOL v79 = *((_DWORD *)self + 8) != *(_DWORD *)(v7 + 204);
    uint64_t v80 = self[9];
  }
  else
  {
    uint64_t v80 = 0;
    BOOL v79 = *(_DWORD *)(v7 + 204) != 0;
  }
  id v81 = *(void **)(v7 + 184);
  if (v81) {
    BOOL v82 = *v81 == v80;
  }
  else {
    BOOL v82 = v80 == 0;
  }
  int v109 = !v82;
  if (((v79 | v109) & 1) != 0 || v366)
  {
    uint64_t v110 = *(void *)(*(void *)(v7 + 120) + 8);
    if (*(unsigned char *)(v110 + 24)) {
      *(unsigned char *)(v110 + 24) = 0;
    }
    else {
      [*(id *)(v7 + 40) appendString:@","];
    }
    [*(id *)(v371 + 40) appendString:@"{"];
    uint64_t v134 = *(void **)(v371 + 40);
    uint64_t v135 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(self, "sampleCount"));
    SAJSONWriteDictionaryFirstEntry(v134, @"count", v135);

    uint64_t v136 = *(void **)(v371 + 40);
    int v137 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v400 + 6)];
    SAJSONWriteDictionaryEntry(v136, @"depth", v137);

    if (v79)
    {
      if (self) {
        unsigned int v138 = *((_DWORD *)self + 8);
      }
      else {
        LOWORD(v138) = 0;
      }
      +[SACallTreeState writeJSONDictionaryEntriesToStream:microstackshotState:primaryMicrostackshotState:includeIdleAndBattery:]((uint64_t)SACallTreeState, *(void **)(v371 + 40), v138, *(_DWORD *)(v371 + 204), [*(id *)(*(void *)(v371 + 32) + 16) includeUserIdleAndBatteryStateInStacks]);
    }
    if (v109)
    {
      if (self) {
        uint64_t v139 = self[9];
      }
      else {
        uint64_t v139 = 0;
      }
      +[SACallTreeState writeJSONDictionaryEntriesToStream:state:primaryState:]((uint64_t)SACallTreeState, *(void **)(v371 + 40), v139, *(uint64_t **)(v371 + 184));
    }
    if (v366) {
      SAJSONWriteDictionaryEntry(*(void **)(v371 + 40), @"onBehalfOf", (void *)v366);
    }
    [*(id *)(v371 + 40) appendString:@"}"];
    ++*(void *)(*(void *)(*(void *)(v371 + 80) + 8) + 24);
  }
  else
  {
    v368[2](v368, 0xFFFFFFFFLL);
  }
LABEL_302:

LABEL_373:
LABEL_374:

  _Block_object_dispose(v395, 8);
  _Block_object_dispose(v399, 8);
  unsigned int v13 = context;
LABEL_375:
}

void *__125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2167(void *result, int a2)
{
  unint64_t v3 = result;
  uint64_t v4 = *(void *)(result[4] + 8);
  uint64_t v5 = *(int *)(v4 + 24);
  if (!v5
    || (uint64_t v6 = *(void *)(*(void *)(result[5] + 8) + 24),
        uint64_t v7 = v5 - 1,
        *(_DWORD *)(v6 + 8 * (v5 - 1)) != *((_DWORD *)result + 16)))
  {
    *(_DWORD *)(v4 + 24) = v5 + 1;
    uint64_t result = malloc_type_realloc(*(void **)(*(void *)(result[5] + 8) + 24), 8 * *(int *)(*(void *)(result[4] + 8) + 24), 0x100004000313F17uLL);
    *(void *)(*(void *)(v3[5] + 8) + 24) = result;
    *(_DWORD *)(*(void *)(*(void *)(v3[5] + 8) + 24) + 8 * *(int *)(*(void *)(v3[4] + 8) + 24) - 8) = *((_DWORD *)v3 + 16);
    uint64_t v8 = *(int *)(*(void *)(v3[4] + 8) + 24);
    uint64_t v9 = *(void *)(*(void *)(v3[5] + 8) + 24);
    if ((int)v8 < 2)
    {
      int v10 = 0;
      uint64_t v11 = v8 - 1;
    }
    else
    {
      int v10 = *(_DWORD *)(v9 + 8 * (v8 - 2) + 4);
      uint64_t v11 = (v8 - 1);
    }
    *(_DWORD *)(v9 + 8 * v11 + 4) = v10;
    uint64_t v6 = *(void *)(*(void *)(v3[5] + 8) + 24);
    uint64_t v7 = *(int *)(*(void *)(v3[4] + 8) + 24) - 1;
  }
  *(_DWORD *)(v6 + 8 * v7 + 4) += a2;
  *(_DWORD *)(*(void *)(v3[6] + 8) + 24) += a2;
  if (*((unsigned char *)v3 + 68)) {
    int v12 = 2;
  }
  else {
    int v12 = 2 * *(_DWORD *)(*(void *)(v3[6] + 8) + 24) + 2;
  }
  *(_DWORD *)(*(void *)(v3[7] + 8) + 24) = v12;
  return result;
}

- (uint64_t)copyDescriptionForTruncatedLeafFrame:(void *)a3 otherCallTreeDescription:(void *)a4 binariesToDisplay:(void *)a5 extraBinariesToDisplay:
{
  if (result)
  {
    uint64_t v8 = result;
    id v9 = a3;
    int v10 = -[SASamplePrinter copyDescriptionsForFrame:binariesToDisplay:extraBinariesToDisplay:](v8, a2, a4, a5);
    if ([v10 count])
    {
      uint64_t v11 = [v10 firstObject];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = [NSString alloc];
    unsigned int v13 = @"???";
    if (v11) {
      unsigned int v13 = v11;
    }
    uint64_t v14 = [v12 initWithFormat:@"<callstack in another call tree for %@: %@>", v9, v13];

    return v14;
  }
  return result;
}

id __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2183(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 88, 1);
  }
  id v7 = Property;
  uint64_t v8 = [v7 firstObject];
  id v9 = [v8 startTime];
  int v10 = -[SASamplePrinter displayNameForPid:threadId:timestamp:](v6, (uint64_t)a2, a3, v9);

  return v10;
}

id __125__SASamplePrinter_addStack_toStream_sampleCount_binariesToDisplay_primaryState_primaryMicrostackshotState_onlyHeaviestStack___block_invoke_2(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 88, 1);
  }
  id v7 = Property;
  uint64_t v8 = [v7 firstObject];
  id v9 = [v8 startTime];
  int v10 = -[SASamplePrinter displayNameForPid:threadId:timestamp:](v6, (uint64_t)a2, a3, v9);

  return v10;
}

- (id)copyDescriptionForTimeRanges:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
LABEL_24:
    id v30 = 0;
    goto LABEL_20;
  }
  if (![*(id *)(a1 + 16) callTreeTimestampsTimeDomain])
  {
    int v32 = *__error();
    uint64_t v33 = _sa_logt();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v33, OS_LOG_TYPE_ERROR, "Displaying timestamp with no time domain", buf, 2u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(12137, "Displaying timestamp with no time domain", v34, v35, v36, v37, v38, v39, v40);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v4 = [*(id *)(a1 + 16) callTreeTimestampsTimeDomain];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 16 * objc_msgSend(v3, "count"));
  uint64_t v6 = -[SASamplePrinter eventStartTimeWithWallTime](a1);
  id v7 = -[SASamplePrinter eventEndTimeWithWallTime](a1);
  BOOL v8 = (v4 & (v4 - 1)) != 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke;
  v56[3] = &unk_1E63F9BC0;
  uint64_t v60 = v4;
  id v9 = v5;
  id v57 = v9;
  BOOL v61 = v8;
  id v10 = v6;
  id v58 = v10;
  uint64_t v59 = a1;
  uint64_t v11 = (void *)MEMORY[0x1C18A6C80](v56);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke_2;
  v50[3] = &unk_1E63F9BE8;
  id v12 = v9;
  id v51 = v12;
  id v13 = v10;
  id v52 = v13;
  id v14 = v7;
  id v53 = v14;
  id v15 = v11;
  id v54 = v15;
  BOOL v55 = v8;
  uint64_t v16 = (void (**)(void, void))MEMORY[0x1C18A6C80](v50);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (!v18)
  {

    unint64_t v20 = 0;
    goto LABEL_19;
  }
  uint64_t v19 = v18;
  id v41 = v12;
  id v42 = v15;
  id v43 = v14;
  id v44 = v13;
  unint64_t v20 = 0;
  uint64_t v21 = *(void *)v47;
  id v45 = v3;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v47 != v21) {
        objc_enumerationMutation(v17);
      }
      int v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if (v20)
      {
        int v24 = [v20 endTime];
        char v25 = [v23 startTime];
        int v26 = [v24 eq:v25];

        if (v26)
        {
          id v27 = [v23 endTime];
          objc_setProperty_atomic(v20, v28, v27, 16);
          goto LABEL_13;
        }
        ((void (**)(void, void *))v16)[2](v16, v20);
      }
      uint64_t v29 = objc_msgSend(v23, "copy", v41);
      id v27 = v20;
      unint64_t v20 = (void *)v29;
LABEL_13:
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v63 count:16];
  }
  while (v19);

  if (v20) {
    ((void (**)(void, void *))v16)[2](v16, v20);
  }
  id v13 = v44;
  id v3 = v45;
  id v15 = v42;
  id v14 = v43;
  id v12 = v41;
LABEL_19:
  id v30 = v12;

LABEL_20:
  return v30;
}

void __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)v5[4];
  id v7 = (void *)v5[5];
  unint64_t v8 = v5[6];
  unint64_t v9 = v5[7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_2;
  v11[3] = &unk_1E63F9B28;
  void v11[4] = v5;
  id v12 = v4;
  id v13 = *(id *)(a1 + 40);
  id v10 = v4;
  -[SARecipe enumerateStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:]((uint64_t)v10, v6, v8, v7, v9, 0, v11);
}

void __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = v3;
  id v7 = v5;
  if (v4)
  {
    uint64_t v8 = *(void *)(v4 + 16);
    if (!v8)
    {
      int v18 = *__error();
      uint64_t v19 = _sa_logt();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = [*(id *)(v4 + 16) debugDescription];
        *(_DWORD *)long long buf = 136315138;
        uint64_t v42 = [v20 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "swiftAsyncCallTreeAggregationResolved returned default: %s", buf, 0xCu);
      }
      *__error() = v18;
      id v21 = [*(id *)(v4 + 16) debugDescription];
      char v22 = [v21 UTF8String];
      _SASetCrashLogMessage(11991, "swiftAsyncCallTreeAggregationResolved returned default: %s", v23, v24, v25, v26, v27, v28, v22);

      _os_crash();
      __break(1u);
    }
    id v40 = &unk_1F1A9AF80;
    switch(*(void *)(v8 + 160))
    {
      case 0:
        if (*(unsigned char *)(v8 + 14)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 1:
        int v29 = *__error();
        id v30 = _sa_logt();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v31 = [*(id *)(v4 + 16) debugDescription];
          *(_DWORD *)long long buf = 136315138;
          uint64_t v42 = [v31 UTF8String];
          _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "aggregationPointForSwiftTask, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s", buf, 0xCu);
        }
        *__error() = v29;
        id v32 = [*(id *)(v4 + 16) debugDescription];
        char v33 = [v32 UTF8String];
        _SASetCrashLogMessage(11968, "aggregationPointForSwiftTask, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s", v34, v35, v36, v37, v38, v39, v33);

        _os_crash();
        __break(1u);
        JUMPOUT(0x1BF2EF814);
      case 2:
LABEL_5:
        unint64_t v9 = NSNumber;
        id v10 = -[SASwiftTaskState baseFunctionAddress](v7);
        goto LABEL_11;
      case 3:
LABEL_6:
        uint64_t v11 = NSNumber;
        id v12 = [v7 thread];
        uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedLongLong:", objc_msgSend(v12, "threadId"));
        goto LABEL_7;
      case 5:
        if (([(id)v8 printHeavyStacks] & 1) == 0 && objc_msgSend(v6, "identifier") == -1)
        {
          id v17 = NSNumber;
          id v12 = [v7 thread];
          uint64_t v13 = [v17 numberWithUnsignedLong:v12];
LABEL_7:
          id v40 = (id)v13;
        }
        else
        {
          unint64_t v9 = NSNumber;
          id v10 = (void *)[v6 identifier];
LABEL_11:
          id v40 = [v9 numberWithUnsignedLongLong:v10];
        }
        break;
      default:
        break;
    }
  }
  else
  {
    id v40 = 0;
  }

  uint64_t v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v40];
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v40];
    [v16 addObject:v7];
  }
  else
  {
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);

    [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v40];
  }
}

void __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([*(id *)(a1[4] + 16) printHeavyStacks] & 1) == 0) {
    [v4 sortUsingComparator:&__block_literal_global_2220];
  }
  uint64_t v6 = a1[4];
  id v5 = (id)a1[5];
  uint64_t v8 = (void *)a1[6];
  uint64_t v7 = a1[7];
  id v41 = v4;
  id v9 = v8;
  if (!v6)
  {
    char v22 = 0;
    goto LABEL_29;
  }
  uint64_t v10 = *(void *)(v6 + 16);
  if (v10)
  {
    if (*(void *)(v10 + 160) == 1) {
      goto LABEL_34;
    }
    uint64_t v11 = *(void *)(v10 + 152);
    if (v11) {
      goto LABEL_11;
    }
    if (*(unsigned char *)(v10 + 11))
    {
LABEL_34:
      do
      {
        int v12 = *__error();
        uint64_t v13 = _sa_logt();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v9 = [*(id *)(v6 + 16) debugDescription];
          uint64_t v14 = [v9 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          uint64_t v43 = v14;
          _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "stackForSwiftTasks, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s", buf, 0xCu);
        }
        *__error() = v12;
        id v5 = [*(id *)(v6 + 16) debugDescription];
        char v15 = [v5 UTF8String];
        _SASetCrashLogMessage(12036, "stackForSwiftTasks, but kSAAggregateSwiftAsyncTogetherWithOtherCallTrees: %s", v16, v17, v18, v19, v20, v21, v15);

        _os_crash();
        __break(1u);
LABEL_11:
        ;
      }
      while (v11 == 3);
    }
  }
  char v22 = objc_alloc_init(SAStack);
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  if (v22) {
    objc_setProperty_atomic(v22, v23, v24, 56);
  }

  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  if (v22) {
    objc_setProperty_atomic(v22, v25, v26, 40);
  }

  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  if (v22) {
    objc_setProperty_atomic(v22, v27, v28, 48);
  }

  int v29 = -[SASamplePrinter binaryImagesHitByTask:](v6, v9);
  id v31 = v29;
  if (v22)
  {
    objc_setProperty_atomic(v22, v30, v29, 128);

    -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:](v6, 0, v41, 0, 0, v22, v9, v7);
    if (!v22->_omit && v22->_count)
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL threadNameChanges = v22->_threadNameChanges;
      unint64_t v34 = [(NSMutableArray *)v22->_dispatchQueues count];
      unint64_t v35 = [(NSMutableArray *)v22->_swiftTasks count];
      unint64_t v36 = [(NSMutableArray *)v22->_threadIds count];
      char v37 = v22->_minPriority != v22->_maxPriority || v22->_minBasePriority != v22->_maxBasePriority;
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v6, 0, v41, 0, 0, v9, v32, threadNameChanges, v34 > 1, v35 > 1, v36 > 1, v37, 0, 0, 1u);
      objc_setProperty_atomic(v22, v38, v32, 120);
      uint64_t v39 = v22;

      goto LABEL_28;
    }
  }
  else
  {

    -[SASamplePrinter addHeaderForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:toStack:task:taskSampleCount:](v6, 0, v41, 0, 0, 0, v9, v7);
  }
  id v40 = v22;
LABEL_28:

LABEL_29:
  [v5 addObject:v22];
}

uint64_t __61__SASamplePrinter_stacksForSwiftAsyncInTask_taskSampleCount___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 threadState];
  uint64_t v6 = [v5 startTimestamp];
  uint64_t v7 = [v4 threadState];

  uint64_t v8 = [v7 startTimestamp];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

void __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  id v26 = v3;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0)
    {
      if ((v4 & 4) == 0)
      {
        if ((v4 & 8) == 0)
        {
          if ((v4 & 0x10) == 0) {
            goto LABEL_46;
          }
          goto LABEL_41;
        }
        goto LABEL_34;
      }
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) appendString:@"wall:"];
    id v3 = v26;
  }
  [v3 wallTime];
  if (v5 == 0.0)
  {
    uint64_t v13 = *(void **)(a1 + 32);
    goto LABEL_17;
  }
  [*(id *)(a1 + 40) wallTime];
  if (v6 == 0.0)
  {
    char v14 = [*(id *)(*(void *)(a1 + 48) + 16) omitAbsoluteWallTimes];
    char v15 = *(void **)(a1 + 32);
    if ((v14 & 1) == 0)
    {
      [v26 wallTime];
      long double v23 = v22;
      if ([*(id *)(*(void *)(a1 + 48) + 16) displayDetailedWallTime]) {
        int v24 = 9;
      }
      else {
        int v24 = 3;
      }
      uint64_t v25 = _CopyStringForTime(v24, v23);
      [v15 appendString:v25];

      goto LABEL_18;
    }
    uint64_t v13 = *(void **)(a1 + 32);
LABEL_17:
    [v13 appendString:@"???"];
    goto LABEL_18;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  int v8 = [*(id *)(*(void *)(a1 + 48) + 16) displayDetailedWallTime];
  [v26 wallTime];
  double v10 = v9;
  [*(id *)(a1 + 40) wallTime];
  uint64_t v12 = 3;
  if (v8) {
    uint64_t v12 = 9;
  }
  objc_msgSend(v7, "appendFormat:", @"%.*fs", v12, v10 - v11);
LABEL_18:
  if ((*(unsigned char *)(a1 + 56) & 2) != 0)
  {
    [*(id *)(a1 + 32) appendString:@" "];
    id v3 = v26;
LABEL_20:
    if (*(unsigned char *)(a1 + 64))
    {
      [*(id *)(a1 + 32) appendString:@"machabs:"];
      id v3 = v26;
    }
    if ([v3 machAbsTime]) {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%llu", objc_msgSend(v26, "machAbsTime"));
    }
    else {
      [*(id *)(a1 + 32) appendString:@"???"];
    }
  }
  if ((*(unsigned char *)(a1 + 56) & 4) == 0) {
    goto LABEL_32;
  }
  [*(id *)(a1 + 32) appendString:@" "];
  id v3 = v26;
LABEL_27:
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) appendString:@"machabssec:"];
    id v3 = v26;
  }
  [v3 machAbsTimeSeconds];
  uint64_t v16 = *(void **)(a1 + 32);
  if (v17 == 0.0)
  {
    [*(id *)(a1 + 32) appendString:@"???"];
  }
  else
  {
    [v26 machAbsTimeSeconds];
    objc_msgSend(v16, "appendFormat:", @"%fs", v18);
  }
LABEL_32:
  if ((*(unsigned char *)(a1 + 56) & 8) != 0)
  {
    [*(id *)(a1 + 32) appendString:@" "];
    id v3 = v26;
LABEL_34:
    if (*(unsigned char *)(a1 + 64))
    {
      [*(id *)(a1 + 32) appendString:@"machcont:"];
      id v3 = v26;
    }
    if ([v3 machContTime]) {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%llu", objc_msgSend(v26, "machContTime"));
    }
    else {
      [*(id *)(a1 + 32) appendString:@"???"];
    }
  }
  if ((*(unsigned char *)(a1 + 56) & 0x10) == 0) {
    goto LABEL_46;
  }
  [*(id *)(a1 + 32) appendString:@" "];
LABEL_41:
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) appendString:@"machcontsec:"];
  }
  [v26 machContTimeSeconds];
  uint64_t v19 = *(void **)(a1 + 32);
  if (v20 == 0.0)
  {
    [v19 appendString:@"???"];
  }
  else
  {
    [v26 machContTimeSeconds];
    objc_msgSend(v19, "appendFormat:", @"%fs", v21);
  }
LABEL_46:
}

void __48__SASamplePrinter_copyDescriptionForTimeRanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  id v3 = [v8 startTime];
  if ([*(id *)(a1 + 40) isComparable:v3]
    && [*(id *)(a1 + 40) gt:v3])
  {
    id v4 = *(id *)(a1 + 40);

    id v3 = v4;
  }
  double v5 = [v8 endTime];
  if ([*(id *)(a1 + 48) isComparable:v5]
    && [*(id *)(a1 + 48) lt:v5])
  {
    id v6 = *(id *)(a1 + 48);

    double v5 = v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([v3 ne:v5])
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v7 = @" - ";
    }
    else {
      uint64_t v7 = @"-";
    }
    [*(id *)(a1 + 32) appendString:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (uint64_t)copyDescriptionForIOEvent:(void *)a1
{
  unint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = [v1 alloc];
  id v4 = SAFormattedBytesEx([v2 size], 1, 0, 0, 0x1000uLL);
  double v5 = [v2 type];
  uint64_t v6 = [v2 tier];

  uint64_t v7 = [v3 initWithFormat:@"%@ %@T%u", v4, v5, v6];
  return v7;
}

void __45__SASamplePrinter_copySymbolStringsForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  uint64_t v7 = [v20 name];
  id v8 = v7;
  if (v7)
  {
    double v9 = SACopySanitizedString(v7, 1, 0);
    [v6 appendString:v9];
  }
  else
  {
    [v6 appendString:@"???"];
    if (![*(id *)(*(void *)(a1 + 32) + 16) displayOffsetsFromUnnamedSymbols]) {
      goto LABEL_5;
    }
  }
  objc_msgSend(v6, "appendFormat:", @" + %llu", objc_msgSend(*(id *)(a1 + 40), "offsetIntoSegment")- objc_msgSend(v20, "offsetIntoSegment")+ objc_msgSend(*(id *)(a1 + 48), "isSymbolicationOffByOne"));
LABEL_5:
  objc_msgSend(v6, "appendString:", @" (");
  if (v5)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) displayFullSourcePaths])
    {
      double v10 = [v5 filePath];
      double v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [v5 fileName];
      }
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = [v5 fileName];
    }
    uint64_t v14 = [v5 lineNum];
    uint64_t v15 = [v5 columnNum];
    if (v13)
    {
      uint64_t v16 = v15;
      double v17 = SACopySanitizedString(v13, 1, 0);
      [v6 appendString:v17];

      if (v14)
      {
        objc_msgSend(v6, "appendFormat:", @":%u", v14);
        if (v16) {
          objc_msgSend(v6, "appendFormat:", @",%u", v16);
        }
      }
    }
    [v6 appendString:@" in "];
  }
  [v6 appendFormat:@"%@ + %llu%@"], *(void *)(a1 + 56), *(void *)(a1 + 80), *(void *)(a1 + 64));
  uint64_t v18 = *(void **)(a1 + 72);
  uint64_t v19 = (void *)[v6 copy];
  [v18 addObject:v19];
}

- (id)displayNameForTask:(uint64_t)a3 threadId:
{
  id v4 = -[SASamplePrinter displayNameForTask:](a1, a2);
  id v5 = v4;
  if (a3) {
    id v6 = (id)[[NSString alloc] initWithFormat:@"%@ thread 0x%llx", v4, a3];
  }
  else {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

void __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[4];
  uint64_t v7 = v5[5];
  uint64_t v8 = v5[6];
  uint64_t v9 = v5[7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_2;
  v13[3] = &unk_1E63F9C38;
  v13[4] = v5;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v14 = v10;
  uint64_t v15 = v11;
  uint64_t v16 = v12;
  [a3 enumerateThreadStatesBetweenStartTime:v6 startSampleIndex:v8 endTime:v7 endSampleIndex:v9 reverseOrder:0 block:v13];
}

void __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_2(uint64_t a1, void *a2)
{
  id v33 = a2;
  uint64_t v3 = [v33 originPid];
  uint64_t v4 = [v33 proximatePid];
  uint64_t v5 = v4;
  if (v3 != -1 || v4 != -1)
  {
    uint64_t v6 = *(id **)(a1 + 32);
    uint64_t v7 = [v33 endTimestamp];
    uint64_t v8 = -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v6, v3, v7);

    uint64_t v9 = *(id **)(a1 + 32);
    id v10 = [v33 endTimestamp];
    uint64_t v11 = -[SASamplePrinter displayNameForPid:aroundTimestamp:includePid:](v9, v5, v10);

    unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 160) dataStyle];
    if (v12 - 2 >= 3)
    {
      if (v12 <= 1) {
        -[SAOnBehalfOfMultiple addProximateName:proximatePid:originName:originPid:count:](*(_DWORD **)(a1 + 40), v11, v5, v8, v3, [v33 sampleCountInSampleIndexRangeStart:*(void *)(*(void *)(a1 + 32) + 48) end:*(void *)(*(void *)(a1 + 32) + 56)]);
      }
    }
    else if ([v33 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }
      uint64_t v16 = [SAOnBehalfOfSingle alloc];
      id v17 = v11;
      id v18 = v8;
      if (v16)
      {
        v34.receiver = v16;
        v34.super_class = (Class)SAOnBehalfOfSingle;
        uint64_t v16 = (SAOnBehalfOfSingle *)objc_msgSendSuper2(&v34, sel_init);
        if (v16)
        {
          uint64_t v19 = [v17 copy];
          proximateName = v16->_proximateName;
          v16->_proximateName = (NSString *)v19;

          uint64_t v21 = [v18 copy];
          originName = v16->_originName;
          v16->_originName = (NSString *)v21;

          v16->_proximatePid = v5;
          v16->_originPid = v3;
        }
      }

      long double v23 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v16];
      if (!v23)
      {
        long double v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:*(void *)(a1 + 56)];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v23 forKeyedSubscript:v16];
      }
      unint64_t v24 = *(void *)(*(void *)(a1 + 32) + 48);
      unint64_t v25 = [v33 startSampleIndex];
      if (v24 <= v25) {
        unint64_t v24 = v25;
      }
      unint64_t v26 = *(void *)(*(void *)(a1 + 32) + 56);
      unint64_t v27 = [v33 endSampleIndex];
      if (v26 >= v27) {
        unint64_t v28 = v27;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v24 < v28)
      {
        do
        {
          uint64_t v29 = [v23 mutableBytes];
          *(unsigned char *)(v29 + (v24 >> 3)) |= 1 << (v24 & 7);
          ++v24;
          unint64_t v30 = *(void *)(*(void *)(a1 + 32) + 56);
          unint64_t v31 = [v33 endSampleIndex];
          if (v30 >= v31) {
            unint64_t v32 = v31;
          }
          else {
            unint64_t v32 = v30;
          }
        }
        while (v24 < v32);
      }
    }
  }
}

void __65__SASamplePrinter_displayStringForOnBehalfOfForTasks_includePid___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  self = a2;
  id v5 = a3;
  uint64_t v6 = (int8x8_t *)[v5 bytes];
  unint64_t v7 = [v5 length];
  if (v7 == *(void *)(a1 + 40))
  {
    if (v7 >= 8)
    {
      LODWORD(v9) = 0;
      unint64_t v11 = v7 >> 3;
      id v10 = self;
      do
      {
        int8x8_t v12 = *v6++;
        uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
        v13.i16[0] = vaddlv_u8(v13);
        LODWORD(v9) = v9 + v13.i32[0];
        --v11;
      }
      while (v11);
    }
    else
    {
      LODWORD(v9) = 0;
      id v10 = self;
    }
    a1 = *(void *)(a1 + 32);
    if (v10)
    {
      id v14 = objc_getProperty(v10, v8, 16, 1);
      uint64_t v15 = self[2];
      id v17 = objc_getProperty(self, v16, 24, 1);
      int v18 = self[3];
      goto LABEL_8;
    }
  }
  else
  {
    int v19 = *__error();
    uint64_t v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 length];
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 134218240;
      uint64_t v31 = v20;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "sampleIndexBitfield.length %lu != bitfieldSize %llu", buf, 0x16u);
    }

    *__error() = v19;
    char v22 = [v5 length];
    _SASetCrashLogMessage(13054, "sampleIndexBitfield.length %lu != bitfieldSize %llu", v23, v24, v25, v26, v27, v28, v22);
    _os_crash();
    __break(1u);
  }
  id v17 = 0;
  id v14 = 0;
  uint64_t v15 = 0;
  int v18 = 0;
LABEL_8:
  -[SAOnBehalfOfMultiple addProximateName:proximatePid:originName:originPid:count:]((_DWORD *)a1, v14, v15, v17, v18, (int)v9);
}

uint64_t __44__SASamplePrinter_displayStringForHIDEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = [v5 hidEventTimestamp];
  }
  else
  {
    if (v5) {
      id Property = objc_getProperty(v5, v6, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = Property;

    unint64_t v7 = [v9 startTime];
    id v5 = v9;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v11 = [v4 hidEventTimestamp];
  }
  else
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v10, 32, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    unint64_t v11 = [v13 startTime];
  }
  uint64_t v14 = [v7 compare:v11];

  return v14;
}

void __40__SASamplePrinter_numIOsForTask_ioSize___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  id Property = *(id *)(a1[4] + 160);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 968, 1);
  }
  id v9 = Property;
  id v10 = [v9 objectForKeyedSubscript:v5];

  if (v10)
  {
    unint64_t v11 = [v7 creationTimestamp];
    id v12 = v11;
    if (!v11 || [v11 lt:*(void *)(a1[4] + 32)])
    {
      id v13 = *(id *)(a1[4] + 32);

      id v12 = v13;
    }
    uint64_t v14 = [v7 exitTimestamp];
    uint64_t v15 = v14;
    id v28 = v7;
    id v29 = v5;
    if (!v14 || [v14 gt:*(void *)(a1[4] + 40)])
    {
      id v16 = *(id *)(a1[4] + 40);

      uint64_t v15 = v16;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v27 = v10;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          char v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v23 = [v22 endTimestamp];
          char v24 = [v12 gt:v23];

          if ((v24 & 1) == 0)
          {
            uint64_t v25 = [v22 endTimestamp];
            char v26 = [v15 lt:v25];

            if (v26) {
              goto LABEL_20;
            }
            *(void *)(*(void *)(a1[5] + 8) + 24) += [v22 size];
            ++*(void *)(*(void *)(a1[6] + 8) + 24);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }
LABEL_20:

    id v7 = v28;
    id v5 = v29;
    id v10 = v27;
  }
}

void __73__SASamplePrinter_addStackForDispatchQueue_andThread_task_toRootObjects___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 dispatchQueue];
  uint64_t v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v7 addObject:v8];
  }
}

- (void)addStackForSwiftTask:(void *)a3 andThread:(void *)a4 task:(void *)a5 toRootObjects:
{
  unint64_t v9 = a2;
  unint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a1)
  {
LABEL_7:

    return;
  }
  if (v9 | v10)
  {
    if (v10)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v14 = a1[4];
      uint64_t v15 = a1[5];
      uint64_t v16 = a1[6];
      uint64_t v17 = a1[7];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __69__SASamplePrinter_addStackForSwiftTask_andThread_task_toRootObjects___block_invoke;
      v28[3] = &unk_1E63F8DC0;
      id v29 = (id)v9;
      id v30 = v13;
      id v18 = v13;
      [(id)v10 enumerateThreadStatesBetweenStartTime:v14 startSampleIndex:v16 endTime:v15 endSampleIndex:v17 reverseOrder:0 block:v28];
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]((uint64_t)a1, 0, 0, (void *)v10, v18, v11, v12, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    else
    {
      id v18 = [(id)v9 states];
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]((uint64_t)a1, 0, v18, 0, 0, v11, v12, 0, 0, 0, 0, 0, 0, 0, 0);
    }

    goto LABEL_7;
  }
  int v19 = *__error();
  uint64_t v20 = _sa_logt();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "Neither thread nor swiftTask provided", buf, 2u);
  }

  *__error() = v19;
  _SASetCrashLogMessage(13454, "Neither thread nor swiftTask provided", v21, v22, v23, v24, v25, v26, v27);
  _os_crash();
  __break(1u);
}

void __69__SASamplePrinter_addStackForSwiftTask_andThread_task_toRootObjects___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 swiftTask];
  uint64_t v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithUnsignedInteger:a3];
    [v7 addObject:v8];
  }
}

void __49__SASamplePrinter_addStackForTask_toRootObjects___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 32), *(void **)(a1 + 40), v5, 0))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v4, 0, 0, v5, 0, *(void **)(a1 + 40), *(void **)(a1 + 48), 1, 1, 1, 1, 1, 0, 0, 1u);
    }
  }
}

void __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 mainBinary];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v6 = [v3 threads];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke_2;
    v7[3] = &unk_1E63F9D28;
    v7[4] = *(void *)(a1 + 48);
    id v8 = v3;
    id v9 = *(id *)(a1 + 56);
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (-[SASamplePrinter shouldPrintTask:thread:dispatchQueue:](*(void *)(a1 + 32), *(void **)(a1 + 40), v5, 0))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:](v4, 0, 0, v5, 0, *(void **)(a1 + 40), *(void **)(a1 + 48), 1, 1, 1, 1, 1, 0, 0, 1u);
    }
  }
}

- (id)callTreesForThreadsInTask:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    id v5 = 0;
    goto LABEL_37;
  }
  if (-[SASamplePrinter hasTimeIndexes]((uint64_t)self)) {
    uint64_t v6 = (unsigned char *)[v4 sampleCountInSampleIndexRangeStart:self->_reportStartSampleIndex end:self->_reportEndSampleIndex];
  }
  else {
    uint64_t v6 = (unsigned char *)[v4 sampleCountInTimestampRangeStart:self->_reportStartTime end:self->_reportEndTime];
  }
  uint64_t v34 = v4;
  id v7 = -[SASamplePrinter stacksForTask:taskSampleCount:]((id *)&self->super.isa, v4, v6);
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(id **)(*((void *)&v35 + 1) + 8 * v13);
        if (v14)
        {
          if ((unint64_t)[v14[7] count] > 1)
          {
            uint64_t v15 = 0;
            goto LABEL_16;
          }
          uint64_t v16 = [v34 threads];
          id Property = objc_getProperty(v14, v17, 56, 1);
        }
        else
        {
          uint64_t v16 = [v34 threads];
          id Property = 0;
        }
        int v19 = [Property firstObject];
        uint64_t v15 = [v16 objectForKeyedSubscript:v19];

        if (!v14)
        {
          id v22 = 0;
          goto LABEL_19;
        }
LABEL_16:
        if ((unint64_t)[v14[5] count] > 1)
        {
          uint64_t v21 = 0;
          goto LABEL_22;
        }
        id v22 = objc_getProperty(v14, v20, 40, 1);
LABEL_19:
        uint64_t v21 = [v22 firstObject];
        uint64_t v23 = [MEMORY[0x1E4F1CA98] null];

        if (v21 == v23)
        {

          uint64_t v21 = 0;
        }
        if (!v14)
        {
          id v28 = 0;
          goto LABEL_25;
        }
LABEL_22:
        if ((unint64_t)[v14[6] count] >= 2)
        {
          uint64_t v26 = [SAThreadCallTree alloc];
          char v27 = 0;
LABEL_28:
          id v30 = objc_getProperty(v14, v25, 120, 1);
          goto LABEL_29;
        }
        id v28 = objc_getProperty(v14, v24, 48, 1);
LABEL_25:
        char v27 = [v28 firstObject];
        id v29 = [MEMORY[0x1E4F1CA98] null];

        if (v27 == v29)
        {

          char v27 = 0;
        }
        uint64_t v26 = [SAThreadCallTree alloc];
        if (v14) {
          goto LABEL_28;
        }
        id v30 = 0;
LABEL_29:
        long long v31 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]((id *)&v26->super.super.isa, v15, v21, v27, v30);
        [v8 addObject:v31];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v32 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v11 = v32;
    }
    while (v32);
  }

  id v4 = v34;
  id v5 = -[SATaskThreadCallTrees initWithTask:threadCallTrees:]([SATaskThreadCallTrees alloc], v34, v8);

LABEL_37:
  return v5;
}

- (id)callTreeForTask:(id)a3
{
  id v4 = a3;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v7 = v4;
    id v8 = v6;
    if (self)
    {
      id v9 = [v7 threads];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __49__SASamplePrinter_addStackForTask_toRootObjects___block_invoke;
      v11[3] = &unk_1E63F9D28;
      void v11[4] = self;
      id v12 = v7;
      id v13 = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v11];
    }
    id v5 = -[SATaskCallTree initWithTask:rootObjects:]([SATaskCallTree alloc], v7, (uint64_t)v8);
  }
  return v5;
}

- (id)callTreeForDispatchQueue:(id)a3 andThread:(id)a4 inTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    uint64_t v11 = 0;
LABEL_9:

    return v11;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  unint64_t v13 = (unint64_t)v8;
  unint64_t v14 = (unint64_t)v9;
  id v15 = v10;
  id v16 = v12;
  if (!self)
  {
LABEL_8:

    uint64_t v11 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]((id *)[SAThreadCallTree alloc], (void *)v14, (void *)v13, 0, v16);
    goto LABEL_9;
  }
  if (v13 | v14)
  {
    if (v14)
    {
      id v33 = v8;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t reportStartSampleIndex = self->_reportStartSampleIndex;
      reportEndTime = self->_reportEndTime;
      reportStartTime = self->_reportStartTime;
      unint64_t reportEndSampleIndex = self->_reportEndSampleIndex;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      long long v36 = __73__SASamplePrinter_addStackForDispatchQueue_andThread_task_toRootObjects___block_invoke;
      long long v37 = &unk_1E63F8DC0;
      id v38 = (id)v13;
      id v39 = v17;
      id v20 = v17;
      [(id)v14 enumerateThreadStatesBetweenStartTime:reportStartTime startSampleIndex:reportStartSampleIndex endTime:reportEndTime endSampleIndex:reportEndSampleIndex reverseOrder:0 block:buf];
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]((uint64_t)self, 0, 0, (void *)v14, v20, v15, v16, 0, 0, 0, 0, 0, 0, 0, 0);

      id v8 = v33;
    }
    else
    {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]((uint64_t)self, (void *)v13, 0, 0, 0, v15, v16, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    goto LABEL_8;
  }
  int v22 = *__error();
  uint64_t v23 = _sa_logt();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "Neither thread nor dispatchQueue provided", buf, 2u);
  }

  *__error() = v22;
  _SASetCrashLogMessage(13438, "Neither thread nor dispatchQueue provided", v24, v25, v26, v27, v28, v29, v30);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

- (id)callTreeForSwiftTask:(id)a3 thread:(id)a4 inTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    -[SASamplePrinter addStackForSwiftTask:andThread:task:toRootObjects:](self, v8, v9, v10, v12);
    uint64_t v11 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]((id *)[SAThreadCallTree alloc], v9, 0, v8, v12);
  }
  return v11;
}

- (id)callTreeForDispatchQueue:(id)a3 swiftTask:(id)a4 thread:(id)a5 inTask:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    unint64_t v14 = 0;
  }
  else
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    -[SASamplePrinter addStackForSwiftTask:andThread:task:toRootObjects:](self, v11, v12, v13, v15);
    unint64_t v14 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]((id *)[SAThreadCallTree alloc], v12, v10, v11, v15);
  }
  return v14;
}

- (id)callTreeForThread:(id)a3 inTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    id v8 = 0;
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    if (self) {
      -[SASamplePrinter addStackForDispatchQueue:orSwiftTaskStates:orThread:andThreadStateIndexes:task:toRootObjects:nameChanges:dispatchQueueChanges:swiftTaskChanges:threadChanges:priorityChanges:microstackshotSummary:onlyHeaviestStack:includeState:]((uint64_t)self, 0, 0, v6, 0, v7, v9, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    id v8 = (void *)-[SAThreadCallTree initWithThread:dispatchQueue:swiftTask:rootObjects:]((id *)[SAThreadCallTree alloc], v6, 0, 0, v9);
  }
  return v8;
}

- (id)callTreeForExecutable:(id)a3
{
  id v4 = a3;
  if (-[SASamplePrinter checkForBadOptions]((uint64_t)self))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v7 = v4;
    id v8 = v6;
    if (self)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      sampleStore = self->_sampleStore;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __55__SASamplePrinter_addStackForExecutable_toRootObjects___block_invoke;
      id v16 = &unk_1E63F9CB0;
      id v17 = v7;
      id v18 = v9;
      int v19 = self;
      id v20 = v8;
      id v11 = v9;
      [(SASampleStore *)sampleStore enumerateTasks:&v13];
      self = (SASamplePrinter *)objc_msgSend(v11, "copy", v13, v14, v15, v16);
    }
    id v5 = -[SAExecutableCallTree initWithTasks:rootObjects:]([SAExecutableCallTree alloc], self, (uint64_t)v8);
  }
  return v5;
}

- (NSString)headerNote
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setHeaderNote:(id)a3
{
}

- (NSUUID)incidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)shareWithAppDevs
{
  return self->_shareWithAppDevs;
}

- (void)setShareWithAppDevs:(BOOL)a3
{
  self->_shareWithAppDevs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentUUID, 0);
  objc_storeStrong((id *)&self->_headerNote, 0);
  objc_storeStrong((id *)&self->_sampleStore, 0);
  objc_storeStrong((id *)&self->_dependencyGraphForLastStackshot, 0);
  objc_storeStrong((id *)&self->_heaviestThread, 0);
  objc_storeStrong((id *)&self->_heaviestTask, 0);
  objc_storeStrong((id *)&self->_targetHidStepSamples, 0);
  objc_storeStrong((id *)&self->_targetHIDEvent, 0);
  objc_storeStrong((id *)&self->_timeJumps, 0);
  objc_storeStrong((id *)&self->_indexForImage, 0);
  objc_storeStrong((id *)&self->_binaryImagesHit, 0);
  objc_storeStrong((id *)&self->_reportEndTime, 0);
  objc_storeStrong((id *)&self->_reportStartTime, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end