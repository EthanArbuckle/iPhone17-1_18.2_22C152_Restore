@interface NRFMonitor
+ (id)sharedInstance;
- (NRFMonitor)init;
- (void)addInstance;
- (void)releaseAllNRFSingletons;
- (void)removeInstance;
@end

@implementation NRFMonitor

+ (id)sharedInstance
{
  if (qword_26B429650 != -1) {
    dispatch_once(&qword_26B429650, &unk_270E341C8);
  }
  v2 = (void *)qword_26B429658;

  return v2;
}

- (NRFMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRFMonitor;
  v2 = [(NRFMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_instanceCount = 0;
    uint64_t TargetingPThreadRootQueueWithPriority = FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority();
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)TargetingPThreadRootQueueWithPriority;
  }
  return v3;
}

- (void)addInstance
{
  p_instanceCountlock = &self->_instanceCountlock;
  os_unfair_lock_lock(&self->_instanceCountlock);
  ++self->_instanceCount;
  id currentBlock = self->_currentBlock;
  if (currentBlock)
  {
    dispatch_block_cancel(currentBlock);
    id v5 = self->_currentBlock;
    self->_id currentBlock = 0;
  }
  if (!self->_NRFSingletonsAllocated)
  {
    getpid();
    v6 = (OS_os_transaction *)FigOSTransactionCreate();
    NRFSingletonsOSTransaction = self->_NRFSingletonsOSTransaction;
    self->_NRFSingletonsOSTransaction = v6;

    self->_NRFSingletonsAllocated = 1;
  }

  os_unfair_lock_unlock(p_instanceCountlock);
}

- (void)removeInstance
{
  p_instanceCountlock = &self->_instanceCountlock;
  os_unfair_lock_lock(&self->_instanceCountlock);
  unsigned int instanceCount = self->_instanceCount;
  if (instanceCount)
  {
    unsigned int v5 = instanceCount - 1;
    self->_unsigned int instanceCount = v5;
    if (!v5)
    {
      id currentBlock = self->_currentBlock;
      if (currentBlock)
      {
        dispatch_block_cancel(currentBlock);
        id v7 = self->_currentBlock;
        self->_id currentBlock = 0;
      }
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = sub_262FD0F9C;
      v11[3] = &unk_2655C37E8;
      objc_copyWeak(&v12, &location);
      dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
      id v9 = self->_currentBlock;
      self->_id currentBlock = v8;

      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      dispatch_after(v10, (dispatch_queue_t)self->_workerQueue, self->_currentBlock);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(p_instanceCountlock);
}

- (void)releaseAllNRFSingletons
{
  p_instanceCountlock = &self->_instanceCountlock;
  os_unfair_lock_lock(&self->_instanceCountlock);
  id currentBlock = self->_currentBlock;
  self->_id currentBlock = 0;

  if (!self->_instanceCount)
  {
    objc_msgSend_releaseSharedInstance(RegWarpHelperShared, v5, v6, v7);
    objc_msgSend_releaseSharedInstance(DeepFusionLaplacianPyramidShared, v8, v9, v10);
    objc_msgSend_releaseSharedInstance(PostEspressoShared, v11, v12, v13);
    objc_msgSend_releaseSharedInstance(SyntheticReferenceShared, v14, v15, v16);
    objc_msgSend_releaseSharedInstance(GrayGhostDetectionShared, v17, v18, v19);
    objc_msgSend_releaseSharedInstance(MotionDetectionShared, v20, v21, v22);
    objc_msgSend_releaseSharedInstance(RegPyrFusionShared, v23, v24, v25);
    objc_msgSend_releaseSharedInstance(RegDenseShared, v26, v27, v28);
    objc_msgSend_releaseSharedInstance(FusionRemixStageShared, v29, v30, v31);
    objc_msgSend_releaseSharedInstance(WarpStageShared, v32, v33, v34);
    objc_msgSend_releaseSharedInstance(OutliersRemovalShared, v35, v36, v37);
    objc_msgSend_releaseSharedInstance(DenoiseRemixStageShared, v38, v39, v40);
    objc_msgSend_releaseSharedInstance(DenoiseFusePipelineShared, v41, v42, v43);
    objc_msgSend_releaseSharedInstance(BilateralGridShared, v44, v45, v46);
    objc_msgSend_releaseSharedInstance(ToneMappingShared, v47, v48, v49);
    objc_msgSend_releaseSharedInstance(PyramidStageShared_NRF, v50, v51, v52);
    id v56 = (id)objc_msgSend_releaseSharedInstance(DenoiseRemixStageConfig, v53, v54, v55);
    objc_msgSend_releaseSharedInstance(SingleColorCubeCorrectionStageShared, v57, v58, v59);
    objc_msgSend_releaseSharedInstance(GainMapShared, v60, v61, v62);
    objc_msgSend_releaseSharedInstance(SemanticStylesShared, v63, v64, v65);
    objc_msgSend_releaseSharedInstance(TextureUtilsShared, v66, v67, v68);
    objc_msgSend_releaseSharedInstance(ColorConvertStageShared, v69, v70, v71);
    objc_msgSend_releaseSharedInstance(GlobalDistortionCorrectionShared, v72, v73, v74);
    objc_msgSend_releaseSharedInstance(BlinkDetectionStageShared, v75, v76, v77);
    objc_msgSend_releaseSharedInstance(SyntheticLongShared, v78, v79, v80);
    NRFSingletonsOSTransaction = self->_NRFSingletonsOSTransaction;
    self->_NRFSingletonsOSTransaction = 0;

    self->_NRFSingletonsAllocated = 0;
  }

  os_unfair_lock_unlock(p_instanceCountlock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NRFSingletonsOSTransaction, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong(&self->_currentBlock, 0);
}

@end