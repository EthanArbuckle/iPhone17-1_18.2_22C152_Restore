@interface TURemoteVideoClient
- (CALayer)videoLayer;
- (TURemoteVideoClient)init;
- (TURemoteVideoClient)initWithVideoContextSlotIdentifier:(int64_t)a3;
- (id)nameForSubLayer;
- (int64_t)videoContextSlotIdentifier;
- (void)cleanUpSubLayerForLayer:(id)a3;
- (void)insertSubLayerInLayer:(id)a3 videoSlotIdentifier:(int64_t)a4;
- (void)setVideoLayer:(id)a3;
- (void)setVideoLayer:(id)a3 forMode:(int)a4;
@end

@implementation TURemoteVideoClient

- (TURemoteVideoClient)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TURemoteVideoClient.m", 44, @"%s is not available. Use a designated initializer instead.", "-[TURemoteVideoClient init]");

  return 0;
}

- (TURemoteVideoClient)initWithVideoContextSlotIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TURemoteVideoClient;
  result = [(TURemoteVideoClient *)&v5 init];
  if (result) {
    result->_videoContextSlotIdentifier = a3;
  }
  return result;
}

- (void)setVideoLayer:(id)a3 forMode:(int)a4
{
  id v10 = a3;
  id v5 = [(TURemoteVideoClient *)self videoLayer];

  if (v5 != v10)
  {
    v6 = [(TURemoteVideoClient *)self videoLayer];

    if (v6)
    {
      v7 = [(TURemoteVideoClient *)self videoLayer];
      [(TURemoteVideoClient *)self cleanUpSubLayerForLayer:v7];
    }
    [(TURemoteVideoClient *)self setVideoLayer:v10];
    v8 = [(TURemoteVideoClient *)self videoLayer];

    if (v8)
    {
      [getCATransactionClass() begin];
      v9 = [(TURemoteVideoClient *)self videoLayer];
      [(TURemoteVideoClient *)self insertSubLayerInLayer:v9 videoSlotIdentifier:[(TURemoteVideoClient *)self videoContextSlotIdentifier]];

      [getCATransactionClass() commit];
    }
  }
}

- (void)insertSubLayerInLayer:(id)a3 videoSlotIdentifier:(int64_t)a4
{
  void (*v22)(_OWORD *__return_ptr, double);
  void (*v23)(_OWORD *__return_ptr, long long *);
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void v29[4];
  id v30;
  int64_t v31;
  _OWORD v32[8];
  _OWORD v33[3];
  _OWORD v34[8];
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  unsigned char v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(TURemoteVideoClient *)self nameForSubLayer];
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = [v6 sublayers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
      v13 = [v12 name];
      char v14 = [v13 isEqualToString:v7];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v46 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v12;

    if (v15) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v16 = (void *)getCALayerClass_softClass;
  v45 = (void *)getCALayerClass_softClass;
  if (!getCALayerClass_softClass)
  {
    *(void *)&v39 = MEMORY[0x1E4F143A8];
    *((void *)&v39 + 1) = 3221225472;
    *(void *)&v40 = __getCALayerClass_block_invoke;
    *((void *)&v40 + 1) = &unk_1E58E5F90;
    *(void *)&v41 = &v42;
    __getCALayerClass_block_invoke((uint64_t)&v39);
    v16 = (void *)v43[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v42, 8);
  id v15 = [v17 layer];
  [v6 addSublayer:v15];
LABEL_14:
  [v6 bounds];
  double v19 = v18;
  double v21 = v20;
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v20, v18);
  objc_msgSend(v15, "setPosition:", v19 * 0.5, v21 * 0.5);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v22 = (void (*)(_OWORD *__return_ptr, double))getCGAffineTransformMakeRotationSymbolLoc_ptr;
  v45 = getCGAffineTransformMakeRotationSymbolLoc_ptr;
  if (!getCGAffineTransformMakeRotationSymbolLoc_ptr)
  {
    *(void *)&v39 = MEMORY[0x1E4F143A8];
    *((void *)&v39 + 1) = 3221225472;
    *(void *)&v40 = __getCGAffineTransformMakeRotationSymbolLoc_block_invoke;
    *((void *)&v40 + 1) = &unk_1E58E5F90;
    *(void *)&v41 = &v42;
    __getCGAffineTransformMakeRotationSymbolLoc_block_invoke((uint64_t)&v39);
    v22 = (void (*)(_OWORD *__return_ptr, double))v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v22) {
    -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:]();
  }
  v22(v33, 1.57079633);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v23 = (void (*)(_OWORD *__return_ptr, long long *))getCATransform3DMakeAffineTransformSymbolLoc_ptr;
  v45 = getCATransform3DMakeAffineTransformSymbolLoc_ptr;
  if (!getCATransform3DMakeAffineTransformSymbolLoc_ptr)
  {
    *(void *)&v39 = MEMORY[0x1E4F143A8];
    *((void *)&v39 + 1) = 3221225472;
    *(void *)&v40 = __getCATransform3DMakeAffineTransformSymbolLoc_block_invoke;
    *((void *)&v40 + 1) = &unk_1E58E5F90;
    *(void *)&v41 = &v42;
    v24 = (void *)QuartzCoreLibrary();
    v25 = dlsym(v24, "CATransform3DMakeAffineTransform");
    *(void *)(*(void *)(v41 + 8) + 24) = v25;
    getCATransform3DMakeAffineTransformSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(v41 + 8) + 24);
    v23 = (void (*)(_OWORD *__return_ptr, long long *))v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v23) {
    -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:]();
  }
  v39 = v33[0];
  v40 = v33[1];
  v41 = v33[2];
  v23(v34, &v39);
  v32[4] = v34[4];
  v32[5] = v34[5];
  v32[6] = v34[6];
  v32[7] = v34[7];
  v32[0] = v34[0];
  v32[1] = v34[1];
  v32[2] = v34[2];
  v32[3] = v34[3];
  [v15 setTransform:v32];
  v26 = getkCAGravityResizeAspectFill();

  if (v26)
  {
    v27 = getkCAGravityResizeAspectFill();
    [v15 setContentsGravity:v27];
  }
  else
  {
    v27 = TUDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[TURemoteVideoClient insertSubLayerInLayer:videoSlotIdentifier:](v27);
    }
  }

  [v15 setName:v7];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __65__TURemoteVideoClient_insertSubLayerInLayer_videoSlotIdentifier___block_invoke;
  v29[3] = &unk_1E58E6590;
  v30 = v15;
  v31 = a4;
  v28 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v29);
}

uint64_t __65__TURemoteVideoClient_insertSubLayerInLayer_videoSlotIdentifier___block_invoke(uint64_t a1)
{
  [getCATransactionClass() begin];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getCAContextClass_softClass;
  uint64_t v10 = getCAContextClass_softClass;
  if (!getCAContextClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getCAContextClass_block_invoke;
    v6[3] = &unk_1E58E5F90;
    v6[4] = &v7;
    __getCAContextClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 objectForSlot:*(unsigned int *)(a1 + 40)];
  [*(id *)(a1 + 32) setContents:v4];

  return [getCATransactionClass() commit];
}

- (id)nameForSubLayer
{
  return (id)[NSString stringWithFormat:@"%@-%p", @"TURemoteVideoSubLayer", self];
}

- (void)cleanUpSubLayerForLayer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TURemoteVideoClient *)self nameForSubLayer];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "sublayers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      v12 = [v11 name];
      char v13 = [v12 isEqualToString:v5];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v14 = v11;

    if (!v14) {
      goto LABEL_13;
    }
    [v14 setContents:0];
    [v14 removeFromSuperlayer];
    id v6 = v14;
  }
LABEL_12:

LABEL_13:
}

- (int64_t)videoContextSlotIdentifier
{
  return self->_videoContextSlotIdentifier;
}

- (CALayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setVideoLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)insertSubLayerInLayer:videoSlotIdentifier:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CGAffineTransform _CGAffineTransformMakeRotation(CGFloat)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TURemoteVideoClient.m", 18, @"%s", dlerror());

  __break(1u);
}

- (void)insertSubLayerInLayer:videoSlotIdentifier:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CATransform3D _CATransform3DMakeAffineTransform(CGAffineTransform)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TURemoteVideoClient.m", 22, @"%s", dlerror());

  __break(1u);
}

- (void)insertSubLayerInLayer:(os_log_t)log videoSlotIdentifier:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Unable to weak-link symbol kCAGravityResizeAspectFill", v1, 2u);
}

@end