@interface NRFConfig
- (NRFConfig)initWithDefaults:(id)a3;
- (void)dealloc;
@end

@implementation NRFConfig

- (NRFConfig)initWithDefaults:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)NRFConfig;
  v5 = [(NRFConfig *)&v52 init];
  v8 = v5;
  if (v5)
  {
    v5->_compressionLevel = -3;
    v5->_allocatorType = 0;
    v5->_allocatorForceSize = 0;
    int v9 = 1;
    v5->_allocatorWireMemory = 1;
    *(_WORD *)&v5->_allocateOnSetup = 256;
    v5->_regMethod = 2;
    *(_WORD *)&v5->_enableFlickerDetection = 257;
    v5->_forceEnableMotionDetection = 0;
    v5->_defaultDoRedFaceFix = -1;
    v10 = objc_msgSend_objectForKeyedSubscript_(v4, v6, *MEMORY[0x263F2F7A0], v7);
    v14 = v10;
    if (v10) {
      int v9 = objc_msgSend_integerValue(v10, v11, v12, v13);
    }
    v8->_isAsynchronous = v9;
    v15 = objc_msgSend_objectForKeyedSubscript_(v4, v11, *MEMORY[0x263F2F798], v13);

    if (v15) {
      int v19 = objc_msgSend_integerValue(v15, v16, v17, v18);
    }
    else {
      int v19 = 2;
    }
    v8->_ctxCreateSynchronization = v19;
    v20 = objc_msgSend_objectForKeyedSubscript_(v4, v16, *MEMORY[0x263F2F1F0], v18);

    if (v20) {
      int v24 = objc_msgSend_integerValue(v20, v21, v22, v23);
    }
    else {
      int v24 = 1;
    }
    v8->_gpuPriority = v24;
    v25 = objc_msgSend_objectForKeyedSubscript_(v4, v21, *MEMORY[0x263F2F7A8], v23);

    if (v25) {
      char v29 = objc_msgSend_BOOLValue(v25, v26, v27, v28);
    }
    else {
      char v29 = 0;
    }
    v8->_isPanoramaMode = v29;
    v8->_isOnlySingleImage = 1;
    v30 = objc_msgSend_objectForKeyedSubscript_(v4, v26, *MEMORY[0x263F2F7D0], v28);
    v8->_isDepthEnabled = objc_msgSend_BOOLValue(v30, v31, v32, v33);

    v36 = objc_msgSend_objectForKeyedSubscript_(v4, v34, *MEMORY[0x263F2F7C0], v35);
    v39 = objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)&unk_270E50658, v38);
    v8->_enableDeepFusion = v39 != 0;

    v42 = objc_msgSend_objectForKeyedSubscript_(v36, v40, (uint64_t)&unk_270E50670, v41);
    v8->_enableUBFusion = v42 != 0;

    v45 = objc_msgSend_objectForKeyedSubscript_(v36, v43, (uint64_t)&unk_270E50688, v44);
    BOOL v46 = v45 != 0;

    v8->_enableProgressiveFusion = v46;
    *(_WORD *)&v8->_enableGreenTintCorrection = 1;
    v8->_forceToneCurve = 0;
    int v47 = FigCapturePlatformIdentifier();
    int v48 = FigCapturePlatformChipRevisionIdentifier();
    BOOL v50 = v47 == 9 && v48 == 0;
    v8->_forceSoftwareCSC = v50;
    v8->_applyGDCtoInputs = 0;
    v8->_gdcAmount = 1.0;
    v8->_gdcIgnoreModifyInputs = 0;
    v8->_greenGhostMitigationType = 4;
    v8->_enableSTF = 0;
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NRFConfig;
  [(NRFConfig *)&v2 dealloc];
}

@end