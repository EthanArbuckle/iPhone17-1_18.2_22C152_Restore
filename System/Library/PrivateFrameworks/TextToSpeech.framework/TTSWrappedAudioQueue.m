@interface TTSWrappedAudioQueue
- (AVAudioConverter)cachedAudioConverter;
- (AVAudioFormat)outputFormat;
- (AVAudioFormat)queueFormat;
- (AVAudioSession)audioSession;
- (BOOL)_attemptQueueStart;
- (BOOL)_startQueueWithRetry;
- (BOOL)audioQueueActive;
- (BOOL)isRunning;
- (BOOL)needsParameterSync;
- (BOOL)needsPropertySync;
- (BOOL)play;
- (BOOL)shouldRebuildAudioQueue;
- (BOOL)usingSharedSession;
- (NSArray)channels;
- (NSDictionary)graphParameters;
- (NSDictionary)graphProperties;
- (NSMutableOrderedSet)inflightBuffers;
- (NSNumber)currentSilenceBufferCount;
- (NSString)dspGraph;
- (OS_dispatch_queue)callbackQueue;
- (OpaqueATAudioProcessingNode)procNodeRef;
- (OpaqueAudioQueue)aqRef;
- (TTSWrappedAudioQueue)init;
- (id)convertBufferIfNecessary:(id)a3;
- (unint64_t)_minimumBufferByteSize;
- (unint64_t)state;
- (unsigned)audioQueueFlags;
- (void)_buildAudioQueue;
- (void)_configureEffects;
- (void)_initializeDSPGraphAU;
- (void)_rebuildAudioQueue;
- (void)_reconfigureQueueFormatForMultiChannelOutputIfNecessary;
- (void)_selectChannels:(OpaqueAudioQueue *)a3;
- (void)_syncGraphParameters;
- (void)_syncGraphProperties;
- (void)_tearDownAudioQueue;
- (void)_tearDownDSPGraphAU;
- (void)bufferCallback:(AudioQueueBuffer *)a3;
- (void)dealloc;
- (void)handleMediaServicesReset;
- (void)pause;
- (void)playBuffer:(id)a3 completionHandler:(id)a4;
- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4;
- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4 lastBuffer:(BOOL)a5;
- (void)setAqRef:(OpaqueAudioQueue *)a3;
- (void)setAudioQueueFlags:(unsigned int)a3;
- (void)setAudioSession:(id)a3;
- (void)setCachedAudioConverter:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setChannels:(id)a3;
- (void)setCurrentSilenceBufferCount:(id)a3;
- (void)setDspGraph:(id)a3;
- (void)setGraphParameters:(id)a3;
- (void)setGraphProperties:(id)a3;
- (void)setInflightBuffers:(id)a3;
- (void)setNeedsParameterSync:(BOOL)a3;
- (void)setNeedsPropertySync:(BOOL)a3;
- (void)setOutputFormat:(id)a3;
- (void)setProcNodeRef:(OpaqueATAudioProcessingNode *)a3;
- (void)setQueueFormat:(id)a3;
- (void)setShouldRebuildAudioQueue:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setUsingSharedSession:(BOOL)a3;
- (void)stop;
@end

@implementation TTSWrappedAudioQueue

- (TTSWrappedAudioQueue)init
{
  v31.receiver = self;
  v31.super_class = (Class)TTSWrappedAudioQueue;
  v2 = [(TTSWrappedAudioQueue *)&v31 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_bufferLock._os_unfair_lock_opaque = 0;
    id v4 = objc_alloc(MEMORY[0x1E4F15398]);
    uint64_t v6 = objc_msgSend_initWithCommonFormat_sampleRate_channels_interleaved_(v4, v5, 1, 1, 0, 22050.0);
    outputFormat = v3->_outputFormat;
    v3->_outputFormat = (AVAudioFormat *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F15398]);
    uint64_t v10 = objc_msgSend_initWithCommonFormat_sampleRate_channels_interleaved_(v8, v9, 1, 1, 1, 22050.0);
    queueFormat = v3->_queueFormat;
    v3->_queueFormat = (AVAudioFormat *)v10;

    uint64_t v16 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v12, v13, v14, v15);
    inflightBuffers = v3->_inflightBuffers;
    v3->_inflightBuffers = (NSMutableOrderedSet *)v16;

    cachedAudioConverter = v3->_cachedAudioConverter;
    v3->_cachedAudioConverter = 0;

    v3->_audioQueueFlags = 0;
    audioSession = v3->_audioSession;
    v3->_audioSession = 0;

    channels = v3->_channels;
    v3->_channels = (NSArray *)MEMORY[0x1E4F1CBF0];

    v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    dispatch_queue_t v22 = dispatch_queue_create("TTSAQ.callback", v21);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v22;

    v28 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26, v27);
    objc_msgSend_addObserver_selector_name_object_(v28, v29, (uint64_t)v3, (uint64_t)sel_handleMediaServicesReset, *MEMORY[0x1E4F15040], 0);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3, v4);
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  objc_msgSend__tearDownAudioQueue(self, v10, v11, v12, v13);
  v14.receiver = self;
  v14.super_class = (Class)TTSWrappedAudioQueue;
  [(TTSWrappedAudioQueue *)&v14 dealloc];
}

- (id)convertBufferIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_queueFormat(self, v5, v6, v7, v8);
  objc_super v14 = objc_msgSend_format(v4, v10, v11, v12, v13);
  int isEqual = objc_msgSend_isEqual_(v9, v15, (uint64_t)v14, v16, v17);

  if (isEqual)
  {
    id v23 = v4;
    goto LABEL_10;
  }
  uint64_t v24 = objc_msgSend_cachedAudioConverter(self, v19, v20, v21, v22);
  if (v24)
  {
    v29 = (void *)v24;
    v30 = objc_msgSend_cachedAudioConverter(self, v25, v26, v27, v28);
    v35 = objc_msgSend_inputFormat(v30, v31, v32, v33, v34);
    v40 = objc_msgSend_format(v4, v36, v37, v38, v39);
    if (objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42, v43))
    {
      v48 = objc_msgSend_cachedAudioConverter(self, v44, v45, v46, v47);
      v53 = objc_msgSend_outputFormat(v48, v49, v50, v51, v52);
      v58 = objc_msgSend_queueFormat(self, v54, v55, v56, v57);
      char v62 = objc_msgSend_isEqual_(v53, v59, (uint64_t)v58, v60, v61);

      if (v62) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v67 = objc_alloc(MEMORY[0x1E4F15378]);
  v72 = objc_msgSend_format(v4, v68, v69, v70, v71);
  v77 = objc_msgSend_queueFormat(self, v73, v74, v75, v76);
  v80 = objc_msgSend_initFromFormat_toFormat_(v67, v78, (uint64_t)v72, (uint64_t)v77, v79);
  objc_msgSend_setCachedAudioConverter_(self, v81, (uint64_t)v80, v82, v83);

  v88 = objc_msgSend_channels(self, v84, v85, v86, v87);
  v92 = objc_msgSend_ax_mappedArrayUsingBlock_(v88, v89, (uint64_t)&unk_1EFB802A0, v90, v91);
  v97 = objc_msgSend_cachedAudioConverter(self, v93, v94, v95, v96);
  objc_msgSend_setChannelMap_(v97, v98, (uint64_t)v92, v99, v100);

LABEL_9:
  v101 = objc_msgSend_queueFormat(self, v63, v64, v65, v66);
  objc_msgSend_sampleRate(v101, v102, v103, v104, v105);
  double v107 = v106;
  v112 = objc_msgSend_format(v4, v108, v109, v110, v111);
  objc_msgSend_sampleRate(v112, v113, v114, v115, v116);
  *(float *)&double v107 = v107 / v117;

  id v118 = objc_alloc(MEMORY[0x1E4F153B8]);
  v123 = objc_msgSend_queueFormat(self, v119, v120, v121, v122);
  unsigned int v128 = objc_msgSend_frameLength(v4, v124, v125, v126, v127);
  id v23 = (id)objc_msgSend_initWithPCMFormat_frameCapacity_(v118, v129, (uint64_t)v123, (float)(*(float *)&v107 * (float)v128), v130);

  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x2020000000;
  char v144 = 0;
  v135 = objc_msgSend_cachedAudioConverter(self, v131, v132, v133, v134);
  v141 = v143;
  id v142 = 0;
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = sub_1A66E46FC;
  v139[3] = &unk_1E5C69560;
  id v140 = v4;
  objc_msgSend_convertToBuffer_error_withInputFromBlock_(v135, v136, (uint64_t)v23, (uint64_t)&v142, (uint64_t)v139);
  id v137 = v142;

  _Block_object_dispose(v143, 8);
LABEL_10:

  return v23;
}

- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4 lastBuffer:(BOOL)a5
{
  BOOL v5 = a5;
  objc_msgSend_scheduleBuffer_completionHandler_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  if (v5) {
    AX_PERFORM_WITH_LOCK();
  }
}

- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A66E48D4;
    aBlock[3] = &unk_1E5C695B0;
    id v13 = v7;
    uint64_t v11 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend_playBuffer_completionHandler_(self, v8, (uint64_t)v6, (uint64_t)v11, v9);
}

- (void)playBuffer:(id)a3 completionHandler:(id)a4
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_state(self, v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend_convertBufferIfNecessary_(self, v12, (uint64_t)v6, v13, v14);

    int v20 = objc_msgSend_frameLength(v15, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_format(v15, v21, v22, v23, v24);
    int v30 = *(_DWORD *)(objc_msgSend_streamDescription(v25, v26, v27, v28, v29) + 24);

    AudioQueueBufferRef outBuffer = 0;
    v35 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v31, v32, v33, v34);
    UInt32 v40 = objc_msgSend__minimumBufferByteSize(self, v36, v37, v38, v39);
    uint64_t v41 = AudioQueueAllocateBuffer(v35, v40, &outBuffer);
    uint64_t v42 = objc_alloc_init(TTSWrappedAudioQueueBuffer);
    objc_msgSend_setAqBuffer_(v42, v43, (uint64_t)outBuffer, v44, v45);
    if (v41)
    {
      AXTTSLogCommon();
      v49 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
        sub_1A688C320(v41, v49, v50, v51, v52);
      }

      v163[1] = MEMORY[0x1E4F143A8];
      v163[2] = 3221225472;
      v163[3] = sub_1A66E4FA8;
      v163[4] = &unk_1E5C69588;
      v163[5] = self;
      AX_PERFORM_WITH_LOCK();
      if (!v7) {
        goto LABEL_33;
      }
      uint64_t v57 = objc_msgSend_callbackQueue(self, v53, v54, v55, v56);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A66E4FE4;
      block[3] = &unk_1E5C695D8;
      v163[0] = v7;
      dispatch_async(v57, block);

      v58 = (id *)v163;
    }
    else
    {
      objc_msgSend_setCompletionHandler_(v42, v46, (uint64_t)v7, v47, v48);
      size_t v69 = (v30 * v20);
      *(_DWORD *)(objc_msgSend_aqBuffer(v42, v65, v66, v67, v68) + 16) = v69;
      if (objc_msgSend_frameLength(v15, v70, v71, v72, v73) == 1)
      {
        v78 = objc_msgSend_queueFormat(self, v74, v75, v76, v77);
        int v83 = *(_DWORD *)(objc_msgSend_streamDescription(v78, v79, v80, v81, v82) + 24);

        v88 = (_DWORD *)objc_msgSend_aqBuffer(v42, v84, v85, v86, v87);
        if ((v83 << 8) >= *v88) {
          size_t v93 = *v88;
        }
        else {
          size_t v93 = (v83 << 8);
        }
        uint64_t v94 = objc_msgSend_aqBuffer(v42, v89, v90, v91, v92);
        bzero(*(void **)(v94 + 8), v93);
        *(_DWORD *)(objc_msgSend_aqBuffer(v42, v95, v96, v97, v98) + 16) = v93;
      }
      else
      {
        uint64_t v103 = *(void **)(objc_msgSend_aqBuffer(v42, v74, v75, v76, v77) + 8);
        uint64_t v108 = objc_msgSend_audioBufferList(v15, v104, v105, v106, v107);
        memcpy(v103, *(const void **)(v108 + 16), v69);
      }
      *(void *)(objc_msgSend_aqBuffer(v42, v99, v100, v101, v102) + 24) = v42;
      uint64_t v156 = MEMORY[0x1E4F143A8];
      uint64_t v157 = 3221225472;
      v158 = sub_1A66E4FF8;
      v159 = &unk_1E5C69600;
      v160 = self;
      v161 = v42;
      AX_PERFORM_WITH_LOCK();
      uint64_t v152 = 0;
      v153 = &v152;
      uint64_t v154 = 0x2020000000;
      int v155 = 0;
      uint64_t v145 = MEMORY[0x1E4F143A8];
      uint64_t v146 = 3221225472;
      v147 = sub_1A66E504C;
      v148 = &unk_1E5C69628;
      v149 = self;
      uint64_t v109 = v161;
      v150 = v109;
      v151 = &v152;
      AX_PERFORM_WITH_LOCK();
      if (*((_DWORD *)v153 + 6))
      {
        uint64_t v139 = MEMORY[0x1E4F143A8];
        uint64_t v140 = 3221225472;
        v141 = sub_1A66E5124;
        id v142 = &unk_1E5C69600;
        v143 = self;
        char v144 = v109;
        AX_PERFORM_WITH_LOCK();
        if (*((_DWORD *)v153 + 6) == -66671)
        {
          uint64_t v134 = MEMORY[0x1E4F143A8];
          uint64_t v135 = 3221225472;
          v136 = sub_1A66E5178;
          id v137 = &unk_1E5C69588;
          v138 = self;
          AX_PERFORM_WITH_LOCK();
          uint64_t v114 = AXTTSLogCommon();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
            sub_1A688C294();
          }
        }
        else
        {
          uint64_t v114 = AXTTSLogCommon();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            uint64_t v126 = objc_msgSend_numberWithInt_(NSNumber, v123, *((unsigned int *)v153 + 6), v124, v125);
            sub_1A688C2C8(v126, buf, v114);
          }
        }

        if (v7)
        {
          v131 = objc_msgSend_callbackQueue(self, v127, v128, v129, v130);
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = sub_1A66E51B4;
          v132[3] = &unk_1E5C695D8;
          id v133 = v7;
          dispatch_async(v131, v132);
        }
      }
      else if (objc_msgSend_state(self, v110, v111, v112, v113) == 2 {
             || !objc_msgSend_state(self, v115, v116, v117, v118))
      }
      {
        AX_PERFORM_WITH_LOCK();
      }
      else
      {
        objc_msgSend__attemptQueueStart(self, v119, v120, v121, v122);
      }

      v58 = (id *)&v161;
      _Block_object_dispose(&v152, 8);
    }

LABEL_33:
    id v6 = v15;
    goto LABEL_34;
  }
  v59 = AXTTSLogCommon();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
    sub_1A688C260();
  }

  if (v7)
  {
    uint64_t v64 = objc_msgSend_callbackQueue(self, v60, v61, v62, v63);
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = sub_1A66E4F94;
    v165[3] = &unk_1E5C695D8;
    id v166 = v7;
    dispatch_async(v64, v165);
  }
LABEL_34:
}

- (BOOL)play
{
  if (objc_msgSend_shouldRebuildAudioQueue(self, a2, v2, v3, v4))
  {
    objc_msgSend__tearDownAudioQueue(self, v6, v7, v8, v9);
    objc_msgSend_setShouldRebuildAudioQueue_(self, v10, 0, v11, v12);
  }
  objc_msgSend__buildAudioQueue(self, v6, v7, v8, v9);
  if (objc_msgSend_state(self, v13, v14, v15, v16) == 2
    && !objc_msgSend__startQueueWithRetry(self, v17, v18, v19, v20))
  {
    return 0;
  }
  BOOL v21 = 1;
  objc_msgSend_setState_(self, v17, 1, v19, v20);
  return v21;
}

- (void)pause
{
}

- (void)stop
{
  uint64_t v3 = AXTTSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1A688C3B4();
  }

  if (objc_msgSend_state(self, v4, v5, v6, v7) || objc_msgSend_audioQueueActive(self, v8, v9, v10, v11))
  {
    objc_msgSend_setState_(self, v8, 0, v10, v11);
    AX_PERFORM_WITH_LOCK();
  }
  objc_msgSend_setState_(self, v8, 0, v10, v11);
}

- (void)setAudioSession:(id)a3
{
  id v5 = a3;
  uint64_t v10 = objc_msgSend_audioSession(self, v6, v7, v8, v9);
  int v15 = objc_msgSend_opaqueSessionID(v10, v11, v12, v13, v14);

  objc_storeStrong((id *)&self->_audioSession, a3);
  if (v15 != objc_msgSend_opaqueSessionID(v5, v16, v17, v18, v19))
  {
    uint64_t v20 = AXTTSLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_1A66D3000, v20, OS_LOG_TYPE_INFO, "TTSAQ: Audio session changed, rebuilding audio queue.", v43, 2u);
    }

    objc_msgSend__tearDownAudioQueue(self, v21, v22, v23, v24);
    int v29 = objc_msgSend_opaqueSessionID(v5, v25, v26, v27, v28);
    uint64_t v34 = objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v30, v31, v32, v33);
    BOOL v39 = v29 == objc_msgSend_opaqueSessionID(v34, v35, v36, v37, v38);
    objc_msgSend_setUsingSharedSession_(self, v40, v39, v41, v42);
  }
}

- (void)setChannels:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isEqualToArray_(v5, v6, (uint64_t)self->_channels, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_channels, a3);
    objc_msgSend__reconfigureQueueFormatForMultiChannelOutputIfNecessary(self, v9, v10, v11, v12);
    uint64_t v13 = AXTTSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A66D3000, v13, OS_LOG_TYPE_INFO, "TTSAQ: Audio channels changed, rebuilding audio queue.", v17, 2u);
    }

    objc_msgSend_setShouldRebuildAudioQueue_(self, v14, 1, v15, v16);
  }
}

- (void)setOutputFormat:(id)a3
{
  id v5 = a3;
  uint64_t v10 = objc_msgSend_outputFormat(self, v6, v7, v8, v9);
  char isEqual = objc_msgSend_isEqual_(v5, v11, (uint64_t)v10, v12, v13);

  if ((isEqual & 1) == 0)
  {
    uint64_t v19 = AXTTSLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1A66D3000, v19, OS_LOG_TYPE_INFO, "TTSAQ: Audio format changed, rebuilding audio queue.", v23, 2u);
    }

    objc_storeStrong((id *)&self->_outputFormat, a3);
    objc_msgSend_setShouldRebuildAudioQueue_(self, v20, 1, v21, v22);
  }
  objc_msgSend__reconfigureQueueFormatForMultiChannelOutputIfNecessary(self, v15, v16, v17, v18);
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_audioQueueFlags != a3)
  {
    uint64_t v3 = *(void *)&a3;
    id v5 = AXTTSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, v3, v7, v8);
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "TTSAQ: Audio queue flags changed to %@, rebuilding audio queue.", (uint8_t *)&v13, 0xCu);
    }
    self->_audioQueueFlags = v3;
    objc_msgSend_setShouldRebuildAudioQueue_(self, v10, 1, v11, v12);
  }
}

- (void)handleMediaServicesReset
{
  uint64_t v3 = AXTTSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_INFO, "TTSAQ: Media services reset", buf, 2u);
  }

  uint64_t v8 = objc_msgSend_callbackQueue(self, v4, v5, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A66E5898;
  block[3] = &unk_1E5C69588;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (BOOL)isRunning
{
  return objc_msgSend_state(self, a2, v2, v3, v4) == 1;
}

- (BOOL)audioQueueActive
{
  uint64_t v6 = objc_msgSend_aqRef(self, a2, v2, v3, v4);
  if (v6)
  {
    UInt32 ioDataSize = 4;
    int outData = 0;
    uint64_t v11 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v7, v8, v9, v10);
    if (AudioQueueGetProperty(v11, 0x6171726Eu, &outData, &ioDataSize)) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = outData == 0;
    }
    LOBYTE(v6) = !v12;
  }
  return v6;
}

- (void)bufferCallback:(AudioQueueBuffer *)a3
{
  outBuffer[3] = *(AudioQueueBufferRef *)MEMORY[0x1E4F143B8];
  uint64_t v114 = 0;
  uint64_t v115 = &v114;
  uint64_t v116 = 0x3032000000;
  uint64_t v117 = sub_1A66E5E70;
  uint64_t v118 = sub_1A66E5E9C;
  id v119 = 0;
  uint64_t v5 = a3->mUserData;
  uint64_t v108 = 0;
  uint64_t v109 = &v108;
  uint64_t v110 = 0x3032000000;
  uint64_t v111 = sub_1A66E5EA4;
  uint64_t v112 = sub_1A66E5EB4;
  id v113 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = &v104;
  uint64_t v106 = 0x2020000000;
  char v107 = 0;
  int v10 = objc_msgSend_audioQueueActive(self, v6, v7, v8, v9);
  uint64_t v96 = MEMORY[0x1E4F143A8];
  uint64_t v97 = 3221225472;
  uint64_t v98 = sub_1A66E5EBC;
  uint64_t v99 = &unk_1E5C69650;
  id v11 = v5;
  id v100 = v11;
  uint64_t v101 = self;
  uint64_t v102 = &v108;
  uint64_t v103 = &v104;
  AX_PERFORM_WITH_LOCK();
  if (v11)
  {
    uint64_t v16 = objc_msgSend_completionHandler((void *)v109[5], v12, v13, v14, v15);

    if (v16)
    {
      uint64_t v21 = objc_msgSend_completionHandler((void *)v109[5], v17, v18, v19, v20);
      uint64_t v22 = (void *)v115[5];
      v115[5] = v21;

      objc_msgSend_setCompletionHandler_((void *)v109[5], v23, 0, v24, v25);
    }
    uint64_t v26 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v17, v18, v19, v20);
    AudioQueueFreeBuffer(v26, a3);
    if (v115[5])
    {
      uint64_t v31 = objc_msgSend_state(self, v27, v28, v29, v30);
      uint64_t v36 = objc_msgSend_callbackQueue(self, v32, v33, v34, v35);
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = sub_1A66E5F54;
      v94[3] = &unk_1E5C69678;
      v94[4] = &v114;
      BOOL v95 = v31 == 0;
      dispatch_async(v36, v94);
    }
    if (*((unsigned char *)v105 + 24)) {
      int v37 = v10;
    }
    else {
      int v37 = 0;
    }
    if (v37 == 1)
    {
      UInt32 v38 = objc_msgSend__minimumBufferByteSize(self, v27, v28, v29, v30);
      outBuffer[0] = 0;
      uint64_t v43 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v39, v40, v41, v42);
      AudioQueueAllocateBuffer(v43, v38, outBuffer);
      AudioQueueBufferRef v44 = outBuffer[0];
      outBuffer[0]->mUserData = 0;
      v44->mAudioDataByteSize = v38;
      bzero(v44->mAudioData, v38);
      objc_msgSend_setCurrentSilenceBufferCount_(self, v45, (uint64_t)&unk_1EFB95528, v46, v47);
      uint64_t v52 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v48, v49, v50, v51);
      AudioQueueEnqueueBuffer(v52, outBuffer[0], 0, 0);
    }
  }
  else
  {
    v53 = objc_msgSend_currentSilenceBufferCount(self, v12, v13, v14, v15);
    unsigned int v58 = objc_msgSend_unsignedIntValue(v53, v54, v55, v56, v57);

    float v63 = (float)v58 * 0.1;
    if (v63 > 0.5)
    {
      int v70 = 1;
    }
    else
    {
      uint64_t v64 = objc_msgSend_audioSession(self, v59, v60, v61, v62);
      int isActive = objc_msgSend_isActive(v64, v65, v66, v67, v68);

      int v70 = isActive ^ 1;
      if (*((unsigned char *)v105 + 24)) {
        char v71 = isActive ^ 1;
      }
      else {
        char v71 = 1;
      }
      if ((v71 & 1) == 0 && ((v10 ^ 1) & 1) == 0)
      {
        uint64_t v72 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v59, v58 + 1, v61, v62);
        objc_msgSend_setCurrentSilenceBufferCount_(self, v73, (uint64_t)v72, v74, v75);

        uint64_t v80 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v76, v77, v78, v79);
        AudioQueueEnqueueBuffer(v80, a3, 0, 0);
        goto LABEL_24;
      }
    }
    uint64_t v81 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v59, v60, v61, v62);
    AudioQueueFreeBuffer(v81, a3);
    if (v70 && *((unsigned char *)v105 + 24))
    {
      uint64_t v82 = AXTTSLogCommon();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        *(float *)&double v87 = (float)v58 * 0.1;
        v88 = objc_msgSend_numberWithFloat_(NSNumber, v83, v84, v85, v86, v87);
        sub_1A688C484(v88, (uint8_t *)outBuffer, v82);
      }

      size_t v93 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v89, v90, v91, v92);
      AudioQueueStop(v93, 1u);
    }
  }
LABEL_24:

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
}

- (BOOL)_startQueueWithRetry
{
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  objc_msgSend__buildAudioQueue(self, a2, v2, v3, v4);
  if (objc_msgSend__attemptQueueStart(self, v6, v7, v8, v9)) {
    return 1;
  }
  unint64_t v11 = 0;
  do
  {
    unint64_t v12 = v11;
    uint64_t v13 = AXTTSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A688C4DC(v28, (const char *)(v12 + 1), v29, v13, v14);
    }

    objc_msgSend__tearDownAudioQueue(self, v15, v16, v17, v18);
    if (v12) {
      objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E4F29060], v19, v20, v21, v22, 0.1);
    }
    if (v12 == 2) {
      break;
    }
    objc_msgSend__buildAudioQueue(self, v19, v20, v21, v22);
    char v27 = objc_msgSend__attemptQueueStart(self, v23, v24, v25, v26);
    unint64_t v11 = v12 + 1;
  }
  while ((v27 & 1) == 0);
  return v12 < 2;
}

- (BOOL)_attemptQueueStart
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  int v4 = 0;
  AX_PERFORM_WITH_LOCK();
  _Block_object_dispose(v3, 8);
  return 1;
}

- (void)_buildAudioQueue
{
}

- (unint64_t)_minimumBufferByteSize
{
  uint64_t v6 = objc_msgSend_outputFormat(self, a2, v2, v3, v4);
  objc_msgSend_sampleRate(v6, v7, v8, v9, v10);
  unsigned int v12 = (v11 * 0.1);
  uint64_t v17 = objc_msgSend_outputFormat(self, v13, v14, v15, v16);
  unint64_t v22 = *(_DWORD *)(objc_msgSend_streamDescription(v17, v18, v19, v20, v21) + 24) * v12;

  return v22;
}

- (void)_tearDownAudioQueue
{
  if (objc_msgSend_aqRef(self, a2, v2, v3, v4))
  {
    AXTTSLogCommon();
    uint64_t v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG)) {
      sub_1A688C55C(self, v6, v7, v8, v9);
    }

    uint64_t v14 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v10, v11, v12, v13);
    AudioQueueRemovePropertyListener(v14, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1A66E64D8, self);
    uint64_t v19 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v15, v16, v17, v18);
    AudioQueueStop(v19, 1u);
    objc_msgSend_procNodeRef(self, v20, v21, v22, v23);
    ATAudioProcessingNodeDispose();
    uint64_t v28 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v24, v25, v26, v27);
    AudioQueueDispose(v28, 1u);
    objc_msgSend_setState_(self, v29, 0, v30, v31);
    objc_msgSend_setAqRef_(self, v32, 0, v33, v34);
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_1A66E5EA4;
    v45[4] = sub_1A66E5EB4;
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v35, v36, v37, v38);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    void block[5] = MEMORY[0x1E4F143A8];
    block[6] = 3221225472;
    block[7] = sub_1A66E6574;
    block[8] = &unk_1E5C696A0;
    block[9] = self;
    block[10] = v45;
    AX_PERFORM_WITH_LOCK();
    uint64_t v43 = objc_msgSend_callbackQueue(self, v39, v40, v41, v42);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A66E66DC;
    block[3] = &unk_1E5C696C8;
    void block[4] = v45;
    dispatch_async(v43, block);

    _Block_object_dispose(v45, 8);
  }
}

- (void)_rebuildAudioQueue
{
  if (objc_msgSend_usingSharedSession(self, a2, v2, v3, v4)) {
    objc_msgSend_sharedInstance(MEMORY[0x1E4F153D8], v6, v7, v8, v9);
  }
  else {
  uint64_t v10 = objc_msgSend_audioSession(self, v6, v7, v8, v9);
  }
  objc_msgSend_opaqueSessionID(v10, v11, v12, v13, v14);

  objc_msgSend_streamDescription(self->_queueFormat, v15, v16, v17, v18);
  objc_msgSend_audioQueueFlags(self, v19, v20, v21, v22);
  AudioQueueNewOutputWithAudioSession();
  uint64_t v27 = objc_msgSend_audioSession(self, v23, v24, v25, v26);
  objc_msgSend_setPreferredIOBufferDuration_error_(v27, v28, 0, v29, v30, 0.003);

  objc_msgSend__selectChannels_(self, v31, 0, v32, v33);
  self->_aqRef = 0;
  objc_msgSend__configureEffects(self, v34, v35, v36, v37);
  AudioQueueAddPropertyListener(self->_aqRef, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1A66E64D8, self);
  AXTTSLogCommon();
  uint64_t v38 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG)) {
    sub_1A688C718(self, v38, v39, v40, v41);
  }
}

- (void)_reconfigureQueueFormatForMultiChannelOutputIfNecessary
{
  uint64_t v6 = objc_msgSend_outputFormat(self, a2, v2, v3, v4);

  if (v6)
  {
    uint64_t v11 = objc_msgSend_outputFormat(self, v7, v8, v9, v10);
    uint64_t v16 = objc_msgSend_streamDescription(v11, v12, v13, v14, v15);
    uint64_t v17 = *(void *)(v16 + 32);
    long long v18 = *(_OWORD *)(v16 + 16);
    long long v45 = *(_OWORD *)v16;
    long long v46 = v18;
    uint64_t v47 = v17;

    if (objc_msgSend_count(self->_channels, v19, v20, v21, v22)) {
      int v27 = objc_msgSend_count(self->_channels, v23, v24, v25, v26);
    }
    else {
      int v27 = 1;
    }
    if (HIDWORD(v46) == v27)
    {
      objc_msgSend_outputFormat(self, v23, v24, v25, v26);
      uint64_t v29 = (AVAudioFormat *)objc_claimAutoreleasedReturnValue();
      queueFormat = self->_queueFormat;
      self->_queueFormat = v29;
    }
    else
    {
      DWORD2(v46) *= v27;
      HIDWORD(v46) = v27;
      HIDWORD(v45) &= ~0x20u;
      LODWORD(v46) = v46 * v27;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      LODWORD(v41) = v27 | 0x930000;
      HIDWORD(v41) = 15;
      id v31 = objc_alloc(MEMORY[0x1E4F15398]);
      id v32 = objc_alloc(MEMORY[0x1E4F15358]);
      uint64_t v36 = objc_msgSend_initWithLayout_(v32, v33, (uint64_t)&v41, v34, v35);
      uint64_t v39 = (AVAudioFormat *)objc_msgSend_initWithStreamDescription_channelLayout_(v31, v37, (uint64_t)&v45, (uint64_t)v36, v38, v41, v42, v43, v44);
      uint64_t v40 = self->_queueFormat;
      self->_queueFormat = v39;
    }
  }
  else
  {
    uint64_t v28 = AXTTSLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1A688C7B0();
    }
  }
}

- (void)_selectChannels:(OpaqueAudioQueue *)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AXTTSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    channels = self->_channels;
    *(_DWORD *)buf = 138412290;
    *(void *)double v87 = channels;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "TTSAQ: Selecting channels %@", buf, 0xCu);
  }

  p_channels = &self->_channels;
  if (objc_msgSend_count(self->_channels, v8, v9, v10, v11))
  {
    uint64_t v16 = objc_msgSend_queueFormat(self, v12, v13, v14, v15);
    uint64_t v21 = *(unsigned int *)(objc_msgSend_streamDescription(v16, v17, v18, v19, v20) + 28);

    uint64_t v26 = objc_msgSend_queueFormat(self, v22, v23, v24, v25);
    int v31 = objc_msgSend_channelCount(v26, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_count(self->_channels, v32, v33, v34, v35);

    if (v36 == v31)
    {
      uint64_t v37 = &v78 - 2 * v21;
      size_t v38 = 16 * v21;
      bzero(v37, v38);
      long long v85 = 0u;
      long long v84 = 0u;
      long long v83 = 0u;
      long long v82 = 0u;
      uint64_t v39 = *p_channels;
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v82, (uint64_t)v90, 16);
      if (v41)
      {
        uint64_t v46 = v41;
        size_t v79 = v38;
        *(void *)&long long v80 = a3;
        uint64_t v81 = &v78;
        int v47 = 0;
        uint64_t v48 = *(void *)v83;
        do
        {
          uint64_t v49 = 0;
          int v50 = v47;
          uint64_t v51 = &v37[2 * v47 + 1];
          do
          {
            if (*(void *)v83 != v48) {
              objc_enumerationMutation(v39);
            }
            uint64_t v52 = *(void **)(*((void *)&v82 + 1) + 8 * v49);
            *(_DWORD *)uint64_t v51 = objc_msgSend_channelNumber(v52, v42, v43, v44, v45);
            uint64_t v57 = objc_msgSend_owningPortUID(v52, v53, v54, v55, v56);
            *(v51 - 1) = (uint64_t)v57;

            ++v49;
            v51 += 2;
          }
          while (v46 != v49);
          uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v82, (uint64_t)v90, 16);
          int v47 = v50 + v49;
        }
        while (v46);

        OSStatus v58 = AudioQueueSetProperty((AudioQueueRef)v80, 0x61716361u, v37, v79);
        if (v58 << 16)
        {
          __int16 v59 = v58;
          uint64_t v60 = AXTTSLogCommon();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            sub_1A688C7F0(v59, v60);
          }

          if (objc_msgSend_count(*p_channels, v61, v62, v63, v64))
          {
            unint64_t v66 = 0;
            uint64_t v67 = v37 + 1;
            *(void *)&long long v65 = 67109634;
            long long v80 = v65;
            do
            {
              uint64_t v68 = AXTTSLogCommon();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                int v73 = *v67;
                uint64_t v74 = *((void *)v67 - 1);
                *(_DWORD *)buf = v80;
                *(_DWORD *)double v87 = v66;
                *(_WORD *)&v87[4] = 1024;
                *(_DWORD *)&v87[6] = v73;
                __int16 v88 = 2112;
                uint64_t v89 = v74;
                _os_log_error_impl(&dword_1A66D3000, v68, OS_LOG_TYPE_ERROR, "TTSAQ: Channel layout error: [%d], channel number: %d, deviceUID: %@", buf, 0x18u);
              }

              ++v66;
              v67 += 4;
            }
            while (objc_msgSend_count(*p_channels, v69, v70, v71, v72) > v66);
          }
        }
      }
      else
      {
      }
    }
    else
    {
      uint64_t v75 = AXTTSLogCommon();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        sub_1A688C87C(v21, (const char *)p_channels, v75, v76, v77);
      }
    }
  }
}

- (void)_initializeDSPGraphAU
{
  objc_msgSend_aqRef(self, a2, v2, v3, v4);
  uint64_t v6 = ATAudioProcessingNodeInstantiate();
  objc_msgSend_setProcNodeRef_(self, v7, 0, v8, v9);
  if (v6)
  {
    AXTTSLogCommon();
    uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_1A688C938(v6, v10, v11, v12, v13);
    }
  }
}

- (void)_tearDownDSPGraphAU
{
  if (objc_msgSend_procNodeRef(self, a2, v2, v3, v4))
  {
    objc_msgSend_procNodeRef(self, v6, v7, v8, v9);
    ATAudioProcessingNodeDispose();
    objc_msgSend_setProcNodeRef_(self, v10, 0, v11, v12);
  }
}

- (void)setDspGraph:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isEqualToString_(self->_dspGraph, v6, (uint64_t)v5, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dspGraph, a3);
    AX_PERFORM_WITH_LOCK();
  }
}

- (void)setGraphProperties:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isEqualToDictionary_(self->_graphProperties, v6, (uint64_t)v5, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_graphProperties, a3);
    AX_PERFORM_WITH_LOCK();
  }
}

- (void)setGraphParameters:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isEqualToDictionary_(self->_graphParameters, v6, (uint64_t)v5, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_graphParameters, a3);
    AX_PERFORM_WITH_LOCK();
  }
}

- (void)_syncGraphParameters
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_aqRef(self, a2, v2, v3, v4)
    && objc_msgSend_procNodeRef(self, v6, v7, v8, v9)
    && objc_msgSend_needsParameterSync(self, v6, v10, v8, v9))
  {
    objc_msgSend_setNeedsParameterSync_(self, v6, 0, v8, v9);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v15 = objc_msgSend_graphParameters(self, v11, v12, v13, v14);
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v53, (uint64_t)v61, 16);
    if (v17)
    {
      uint64_t v23 = v17;
      uint64_t v24 = *(void *)v54;
      *(void *)&long long v22 = 138412546;
      long long v51 = v22;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v15);
          }
          uint64_t v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          LODWORD(v52) = 0;
          objc_msgSend_unsignedIntValue(v26, v18, v19, v20, v21, v51, 0, v52);
          int v31 = objc_msgSend_graphParameters(self, v27, v28, v29, v30);
          uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v26, v33, v34);
          objc_msgSend_floatValue(v35, v36, v37, v38, v39);

          objc_msgSend_procNodeRef(self, v40, v41, v42, v43);
          uint64_t v44 = ATAudioProcessingNodeSetParameter();
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = AXTTSLogCommon();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              int v50 = objc_msgSend_numberWithInt_(NSNumber, v47, v45, v48, v49);
              *(_DWORD *)buf = v51;
              OSStatus v58 = v26;
              __int16 v59 = 2112;
              uint64_t v60 = v50;
              _os_log_error_impl(&dword_1A66D3000, v46, OS_LOG_TYPE_ERROR, "TTSAQ: Could not set AUDSPGraph parameter [%@] with error: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v53, (uint64_t)v61, 16);
      }
      while (v23);
    }
  }
  else
  {
    objc_msgSend_setNeedsParameterSync_(self, v6, 1, v8, v9);
  }
}

- (void)_syncGraphProperties
{
  BOOL v11 = !objc_msgSend_aqRef(self, a2, v2, v3, v4)
     || !objc_msgSend_procNodeRef(self, v6, v7, v8, v9)
     || (objc_msgSend_needsPropertySync(self, v6, v10, v8, v9) & 1) == 0;

  objc_msgSend_setNeedsPropertySync_(self, v6, v11, v8, v9);
}

- (void)_configureEffects
{
  objc_msgSend__tearDownDSPGraphAU(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_dspGraph(self, v6, v7, v8, v9);

  if (v10)
  {
    if (!objc_msgSend_procNodeRef(self, v11, v12, v13, v14)) {
      objc_msgSend__initializeDSPGraphAU(self, v15, v16, v17, v18);
    }
    objc_msgSend_dspGraph(self, v15, v16, v17, v18);

    objc_msgSend_procNodeRef(self, v19, v20, v21, v22);
    uint64_t v23 = ATAudioProcessingNodeSetProperty();
    objc_msgSend_setNeedsPropertySync_(self, v24, 1, v25, v26);
    objc_msgSend_setNeedsParameterSync_(self, v27, 1, v28, v29);
    if (v23)
    {
      AXTTSLogCommon();
      uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
        sub_1A688C9C8(v23, v30, v31, v32, v33);
      }
    }
  }
}

- (NSString)dspGraph
{
  return self->_dspGraph;
}

- (NSDictionary)graphParameters
{
  return self->_graphParameters;
}

- (NSDictionary)graphProperties
{
  return self->_graphProperties;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (NSArray)channels
{
  return self->_channels;
}

- (AVAudioFormat)outputFormat
{
  return self->_outputFormat;
}

- (unsigned)audioQueueFlags
{
  return self->_audioQueueFlags;
}

- (OpaqueAudioQueue)aqRef
{
  return self->_aqRef;
}

- (void)setAqRef:(OpaqueAudioQueue *)a3
{
  self->_aqRef = a3;
}

- (OpaqueATAudioProcessingNode)procNodeRef
{
  return self->_procNodeRef;
}

- (void)setProcNodeRef:(OpaqueATAudioProcessingNode *)a3
{
  self->_procNodeRef = a3;
}

- (AVAudioFormat)queueFormat
{
  return self->_queueFormat;
}

- (void)setQueueFormat:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)shouldRebuildAudioQueue
{
  return self->_shouldRebuildAudioQueue;
}

- (void)setShouldRebuildAudioQueue:(BOOL)a3
{
  self->_shouldRebuildAudioQueue = a3;
}

- (NSMutableOrderedSet)inflightBuffers
{
  return self->_inflightBuffers;
}

- (void)setInflightBuffers:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (BOOL)usingSharedSession
{
  return self->_usingSharedSession;
}

- (void)setUsingSharedSession:(BOOL)a3
{
  self->_usingSharedSession = a3;
}

- (AVAudioConverter)cachedAudioConverter
{
  return self->_cachedAudioConverter;
}

- (void)setCachedAudioConverter:(id)a3
{
}

- (NSNumber)currentSilenceBufferCount
{
  return self->_currentSilenceBufferCount;
}

- (void)setCurrentSilenceBufferCount:(id)a3
{
}

- (BOOL)needsParameterSync
{
  return self->_needsParameterSync;
}

- (void)setNeedsParameterSync:(BOOL)a3
{
  self->_needsParameterSync = a3;
}

- (BOOL)needsPropertySync
{
  return self->_needsPropertySync;
}

- (void)setNeedsPropertySync:(BOOL)a3
{
  self->_needsPropertySync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSilenceBufferCount, 0);
  objc_storeStrong((id *)&self->_cachedAudioConverter, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_inflightBuffers, 0);
  objc_storeStrong((id *)&self->_queueFormat, 0);
  objc_storeStrong((id *)&self->_outputFormat, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_graphProperties, 0);
  objc_storeStrong((id *)&self->_graphParameters, 0);

  objc_storeStrong((id *)&self->_dspGraph, 0);
}

@end