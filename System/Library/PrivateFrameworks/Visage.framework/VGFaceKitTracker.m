@interface VGFaceKitTracker
- (BOOL)loadFaceKitSemantics;
- (BOOL)loadQuadFaceKitSemantics;
- (BOOL)processWithCaptureData:(id)a3 callback:(id)a4;
- (VGFaceKitTracker)init;
- (VGFaceKitTracker)initWithOptions:(const VGFaceKitTrackerOptions *)a3;
- (__CFDictionary)quadSemantics;
- (__CFDictionary)semantics;
- (id).cxx_construct;
- (id)buildInputDictionaryWithCaptureData:(id)a3 callback:(id)a4;
- (void)dealloc;
@end

@implementation VGFaceKitTracker

- (VGFaceKitTracker)initWithOptions:(const VGFaceKitTrackerOptions *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)VGFaceKitTracker;
  v4 = [(VGFaceKitTracker *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = *a3;
    v6 = objc_opt_new();
    [v6 setObject:&unk_270CFDA98 forKeyedSubscript:*MEMORY[0x263F26A68]];
    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F26AE8]];
    if (v5->_options.useInternalFaceDetector) {
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F26AE0]];
    }
    if (v5->_options.forceCPU) {
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F26A28]];
    }
    int v7 = CVAFaceTrackingCreate();
    if (v7)
    {
      v8 = __VGLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v13 = v7;
        _os_log_impl(&dword_260C8D000, v8, OS_LOG_TYPE_ERROR, " Error initializing FaceKit: %d ", buf, 8u);
      }
    }
    else if ([(VGFaceKitTracker *)v5 loadFaceKitSemantics] {
           && [(VGFaceKitTracker *)v5 loadQuadFaceKitSemantics])
    }
    {
      v9 = v5;
LABEL_15:

      goto LABEL_16;
    }
    v9 = 0;
    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (VGFaceKitTracker)init
{
  __int16 v3 = 0;
  return [(VGFaceKitTracker *)self initWithOptions:&v3];
}

- (void)dealloc
{
  faceKit = self->_faceKit;
  if (faceKit)
  {
    CFRelease(faceKit);
    self->_faceKit = 0;
  }
  semantics = self->_semantics;
  if (semantics)
  {
    CFRelease(semantics);
    self->_semantics = 0;
  }
  quadSemantics = self->_quadSemantics;
  if (quadSemantics)
  {
    CFRelease(quadSemantics);
    self->_quadSemantics = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VGFaceKitTracker;
  [(VGFaceKitTracker *)&v6 dealloc];
}

- (BOOL)loadFaceKitSemantics
{
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v3);
  cva::ItemHandler::createValue<BOOL>();
}

- (BOOL)loadQuadFaceKitSemantics
{
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v3);
  cva::ItemHandler::createValue<BOOL>();
}

- (__CFDictionary)semantics
{
  return self->_semantics;
}

- (__CFDictionary)quadSemantics
{
  return self->_quadSemantics;
}

- (id)buildInputDictionaryWithCaptureData:(id)a3 callback:(id)a4
{
  v58[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v44 = a4;
  v57[0] = *MEMORY[0x263F26A80];
  int v7 = objc_msgSend(MEMORY[0x263EFF8C0], "vg_arrayWithRowMajorNumbersFromFloat3x3:", *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
  v57[1] = *MEMORY[0x263F26AD0];
  v58[0] = v7;
  v58[1] = &unk_270CFD930;
  v45 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];

  uint64_t v54 = *MEMORY[0x263F26A40];
  uint64_t v8 = v54;
  v9 = (void *)MEMORY[0x263EFF8C0];
  [v6 videoIntrinsics];
  v10 = objc_msgSend(v9, "vg_arrayWithRowMajorNumbersFromFloat3x3:");
  uint64_t v55 = *MEMORY[0x263F26A10];
  uint64_t v11 = v55;
  v56[0] = v10;
  v56[1] = v45;
  v43 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v54 count:2];

  v52[0] = v8;
  v12 = (void *)MEMORY[0x263EFF8C0];
  [v6 depthIntrinsics];
  int v13 = objc_msgSend(v12, "vg_arrayWithRowMajorNumbersFromFloat3x3:");
  v52[1] = v11;
  v53[0] = v13;
  v53[1] = v45;
  v42 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

  if (self->_options.useInternalFaceDetector)
  {
    uint64_t v14 = 0;
    CGFloat v15 = 0.0;
    CGFloat v16 = 0.0;
    CGFloat v17 = 0.0;
    CGFloat v18 = 0.0;
  }
  else
  {
    v19 = [v6 face];
    [v19 bounds];
    CGFloat v18 = v20;
    CGFloat v17 = v21;
    CGFloat v15 = v22;
    CGFloat v16 = v23;

    v24 = [v6 face];
    uint64_t v14 = [v24 faceID];
  }
  v60.origin.x = v18;
  v60.origin.y = v17;
  v60.size.width = v15;
  v60.size.height = v16;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v60);
  v50[0] = *MEMORY[0x263F26AA8];
  if (v6) {
    [v6 timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v26 = CMTimeCopyAsDictionary(&time, 0);
  uint64_t v27 = *MEMORY[0x263F26958];
  v51[0] = v26;
  v51[1] = v43;
  uint64_t v28 = *MEMORY[0x263F26968];
  v50[1] = v27;
  v50[2] = v28;
  uint64_t v29 = [v6 yuvRectified];
  uint64_t v30 = *MEMORY[0x263F26960];
  v51[2] = v29;
  v51[3] = v42;
  uint64_t v31 = *MEMORY[0x263F26998];
  v50[3] = v30;
  v50[4] = v31;
  uint64_t v32 = [v6 depth];
  uint64_t v33 = *MEMORY[0x263F269B8];
  v51[4] = v32;
  v51[5] = &unk_270CFD8A0;
  uint64_t v34 = *MEMORY[0x263F26A20];
  uint64_t v35 = MEMORY[0x263EFFA88];
  v50[5] = v33;
  v50[6] = v34;
  v51[6] = MEMORY[0x263EFFA88];
  v50[7] = *MEMORY[0x263F26948];
  v36 = (void *)MEMORY[0x261227FC0](v44);
  v51[7] = v36;
  v50[8] = *MEMORY[0x263F269E0];
  v47[0] = *MEMORY[0x263F269C8];
  v37 = [NSNumber numberWithInteger:v14];
  v47[1] = *MEMORY[0x263F269D8];
  v48[0] = v37;
  v48[1] = DictionaryRepresentation;
  v38 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  v49 = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v50[9] = *MEMORY[0x263F26920];
  v51[8] = v39;
  v51[9] = v35;
  v40 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:10];

  return v40;
}

- (BOOL)processWithCaptureData:(id)a3 callback:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__VGFaceKitTracker_processWithCaptureData_callback___block_invoke;
  v14[3] = &unk_2655702D8;
  id v8 = v7;
  id v15 = v8;
  v9 = (void *)MEMORY[0x261227FC0](v14);
  v10 = [(VGFaceKitTracker *)self buildInputDictionaryWithCaptureData:v6 callback:v9];
  int v11 = CVAFaceTrackingProcess();
  if (v11)
  {
    v12 = __VGLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_ERROR, " Error running face kit: %d ", buf, 8u);
    }
  }
  return v11 == 0;
}

uint64_t __52__VGFaceKitTracker_processWithCaptureData_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 0;
  return self;
}

@end