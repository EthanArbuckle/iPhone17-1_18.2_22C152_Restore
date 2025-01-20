@interface PSEVideoProcessor
+ (BOOL)needsProcessing;
+ (uint64_t)needsProcessing;
+ (void)initialize;
- (BOOL)canProcessSurface:(__IOSurface *)a3;
- (BOOL)inTestingMode;
- (KernelData)_prepare_contrast_kernels;
- (PSEVideoProcessor)init;
- (id)_prepare_gamma_kernel:(float)a3 shape:(float)a4 scale:(float)a5;
- (id)validationCallback;
- (int)_colorSpaceFromSurface:(__IOSurface *)a3;
- (int)_colorSpaceValueForName:(__CFString *)a3;
- (int)_computeFrameRateIndexSelection;
- (int)_deviceClass;
- (unint64_t)_pixelFormatForSurface:(__IOSurface *)a3;
- (void)_computeDisplaySizeIndexSelection;
- (void)_computeFrameRateIndexSelection;
- (void)_initialize;
- (void)_initializeProtectedBuffers:(unint64_t)a3;
- (void)_processFrame:(id)a3 sourceSurface:(__IOSurface *)a4 outSurface:(__IOSurface *)a5;
- (void)_processSurface:(__IOSurface *)a3 withTimestamp:(double)a4 destinationSurface:(__IOSurface *)a5 options:(id)a6;
- (void)_resetState:(unint64_t)a3;
- (void)_sourceCopyDebuggingChanged:(id)a3;
- (void)_visualDebuggingChanged:(id)a3;
- (void)processSourceSurface:(__IOSurface *)a3 withTimestamp:(double)a4 toDestinationSurface:(__IOSurface *)a5 options:(id)a6;
- (void)setInTestingMode:(BOOL)a3;
- (void)setValidationCallback:(id)a3;
@end

@implementation PSEVideoProcessor

+ (BOOL)needsProcessing
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v2 = (uint64_t (*)(void))get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  v16 = get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke;
    v11 = &unk_265460520;
    v12 = &v13;
    v3 = (void *)libAccessibilityLibrary();
    v14[3] = (uint64_t)dlsym(v3, "_AXSPhotosensitiveMitigationEnabled");
    get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr = *(_UNKNOWN **)(v12[1] + 24);
    v2 = (uint64_t (*)(void))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v2)
  {
    +[PSEVideoProcessor needsProcessing]();
    goto LABEL_11;
  }
  int v4 = v2();
  if (v4)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v5 = (uint64_t (*)(void))getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr;
    v16 = getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr;
    if (!getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr)
    {
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      v10 = __getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_block_invoke;
      v11 = &unk_265460520;
      v12 = &v13;
      __getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_block_invoke((uint64_t)&v8);
      v5 = (uint64_t (*)(void))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (v5)
    {
      LOBYTE(v4) = v5();
      return v4;
    }
LABEL_11:
    v6 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing]();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v6);
  }
  return v4;
}

+ (void)initialize
{
  PSELog = (uint64_t)os_log_create("com.apple.Accessibility", "Photosensitivity");

  MEMORY[0x270F9A758]();
}

- (PSEVideoProcessor)init
{
  v17.receiver = self;
  v17.super_class = (Class)PSEVideoProcessor;
  v2 = [(PSEVideoProcessor *)&v17 init];
  v2->_needsInitialization = 1;
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  if (!v2->_swiftProcessor)
  {
    uint64_t v5 = objc_opt_new();
    swiftProcessor = v2->_swiftProcessor;
    v2->_swiftProcessor = (SwiftVideoProcessor *)v5;
  }
  [(PSEVideoProcessor *)v2 _visualDebuggingChanged:0];
  [(PSEVideoProcessor *)v2 _sourceCopyDebuggingChanged:0];
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v8 = (void *)getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr;
  uint64_t v26 = getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr;
  if (!getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_block_invoke;
    v21 = &unk_265460520;
    v22 = &v23;
    uint64_t v9 = (void *)libAccessibilityLibrary();
    v10 = dlsym(v9, "kAXSPhotosensitiveVisualDebuggingEnabledNotification");
    *(void *)(v22[1] + 24) = v10;
    getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr = *(void *)(v22[1] + 24);
    uint64_t v8 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v8)
  {
    +[PSEVideoProcessor needsProcessing]();
    goto LABEL_11;
  }
  [v7 addObserver:v2 selector:sel__visualDebuggingChanged_ name:*v8 object:0];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v12 = (void *)getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr;
  uint64_t v26 = getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr;
  if (!getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_block_invoke;
    v21 = &unk_265460520;
    v22 = &v23;
    uint64_t v13 = (void *)libAccessibilityLibrary();
    v14 = dlsym(v13, "kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification");
    *(void *)(v22[1] + 24) = v14;
    getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr = *(void *)(v22[1] + 24);
    v12 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v12)
  {
LABEL_11:
    v16 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing]();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v16);
  }
  [v11 addObserver:v2 selector:sel__sourceCopyDebuggingChanged_ name:*v12 object:0];

  return v2;
}

- (void)_visualDebuggingChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_bufferConstants.bDebug = soft_AXSPhotosensitiveVisualDebuggingEnabled() != 0;
  [(SwiftVideoProcessor *)self->_swiftProcessor setDebugMode:soft_AXSPhotosensitiveVisualDebuggingEnabled() != 0];
  if (a3)
  {
    uint64_t v5 = (void *)PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSNumber;
      BOOL bCopyOnly = self->_bufferConstants.bCopyOnly;
      uint64_t v8 = v5;
      uint64_t v9 = [v6 numberWithBool:bCopyOnly];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_259DA0000, v8, OS_LOG_TYPE_DEFAULT, "Visual debug mode: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_sourceCopyDebuggingChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_bufferConstants.BOOL bCopyOnly = soft_AXSPhotosensitiveSourceCopyDebuggingEnabled() != 0;
  [(SwiftVideoProcessor *)self->_swiftProcessor setCopySourceOnlyDebugging:soft_AXSPhotosensitiveSourceCopyDebuggingEnabled() != 0];
  if (a3)
  {
    uint64_t v5 = (void *)PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSNumber;
      BOOL bCopyOnly = self->_bufferConstants.bCopyOnly;
      uint64_t v8 = v5;
      uint64_t v9 = [v6 numberWithBool:bCopyOnly];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_259DA0000, v8, OS_LOG_TYPE_DEFAULT, "Source copy only mode: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setValidationCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(v4);
  id validationCallback = self->_validationCallback;
  self->_id validationCallback = v5;

  [(SwiftVideoProcessor *)self->_swiftProcessor setValidationCallback:v4];
  self->_bufferConstants.bCallbackValues = v4 != 0;
}

- (void)_initialize
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259DA0000, v0, v1, "No library: %@", v2, v3, v4, v5, v6);
}

void __32__PSEVideoProcessor__initialize__block_invoke()
{
  v0 = (void *)UFMKernels;
  UFMKernels = (uint64_t)&unk_2707BC440;

  uint64_t v1 = (void *)qword_26A3F2BB8;
  qword_26A3F2BB8 = (uint64_t)&unk_2707BC458;

  uint64_t v2 = (void *)qword_26A3F2BC0;
  qword_26A3F2BC0 = (uint64_t)&unk_2707BC470;

  uint64_t v3 = (void *)qword_26A3F2BC8;
  qword_26A3F2BC8 = (uint64_t)&unk_2707BC488;

  uint64_t v4 = (void *)qword_26A3F2BD0;
  qword_26A3F2BD0 = (uint64_t)&unk_2707BC4A0;

  uint64_t v5 = (void *)qword_26A3F2BD8;
  qword_26A3F2BD8 = (uint64_t)&unk_2707BC4B8;

  uint8_t v6 = (void *)qword_26A3F2BE0;
  qword_26A3F2BE0 = (uint64_t)&unk_2707BC4D0;

  v7 = (void *)qword_26A3F2BE8;
  qword_26A3F2BE8 = (uint64_t)&unk_2707BC4E8;

  uint64_t v8 = (void *)qword_26A3F2BF0;
  qword_26A3F2BF0 = (uint64_t)&unk_2707BC500;

  uint64_t v9 = (void *)qword_26A3F2BF8;
  qword_26A3F2BF8 = (uint64_t)&unk_2707BC518;

  int v10 = (void *)qword_26A3F2C00;
  qword_26A3F2C00 = (uint64_t)&unk_2707BC530;

  v11 = (void *)qword_26A3F2C08;
  qword_26A3F2C08 = (uint64_t)&unk_2707BC548;

  uint64_t v12 = (void *)qword_26A3F2C10;
  qword_26A3F2C10 = (uint64_t)&unk_2707BC560;

  uint64_t v13 = (void *)qword_26A3F2C18;
  qword_26A3F2C18 = (uint64_t)&unk_2707BC578;

  v14 = (void *)qword_26A3F2C20;
  qword_26A3F2C20 = (uint64_t)&unk_2707BC590;

  uint64_t v15 = (void *)qword_26A3F2C28;
  qword_26A3F2C28 = (uint64_t)&unk_2707BC5A8;

  v16 = (void *)qword_26A3F2C30;
  qword_26A3F2C30 = (uint64_t)&unk_2707BC5C0;

  objc_super v17 = (void *)qword_26A3F2C38;
  qword_26A3F2C38 = (uint64_t)&unk_2707BC5D8;

  uint64_t v18 = (void *)qword_26A3F2C40;
  qword_26A3F2C40 = (uint64_t)&unk_2707BC5F0;

  uint64_t v19 = (void *)qword_26A3F2C48;
  qword_26A3F2C48 = (uint64_t)&unk_2707BC608;

  v20 = (void *)qword_26A3F2C50;
  qword_26A3F2C50 = (uint64_t)&unk_2707BC620;

  v21 = (void *)qword_26A3F2C58;
  qword_26A3F2C58 = (uint64_t)&unk_2707BC638;

  v22 = (void *)qword_26A3F2C60;
  qword_26A3F2C60 = (uint64_t)&unk_2707BC650;

  uint64_t v23 = (void *)qword_26A3F2C68;
  qword_26A3F2C68 = (uint64_t)&unk_2707BC668;

  v24 = (void *)qword_26A3F2C70;
  qword_26A3F2C70 = (uint64_t)&unk_2707BC680;

  uint64_t v25 = (void *)qword_26A3F2C78;
  qword_26A3F2C78 = (uint64_t)&unk_2707BC698;

  uint64_t v26 = (void *)qword_26A3F2C80;
  qword_26A3F2C80 = (uint64_t)&unk_2707BC6B0;

  v27 = (void *)qword_26A3F2C88;
  qword_26A3F2C88 = (uint64_t)&unk_2707BC6C8;

  v28 = (void *)qword_26A3F2C90;
  qword_26A3F2C90 = (uint64_t)&unk_2707BC6E0;

  v29 = (void *)qword_26A3F2C98;
  qword_26A3F2C98 = (uint64_t)&unk_2707BC6F8;

  v30 = (void *)qword_26A3F2CA0;
  qword_26A3F2CA0 = (uint64_t)&unk_2707BC710;

  v31 = (void *)qword_26A3F2CA8;
  qword_26A3F2CA8 = (uint64_t)&unk_2707BC728;

  v32 = (void *)qword_26A3F2CB0;
  qword_26A3F2CB0 = (uint64_t)&unk_2707BC740;

  v33 = (void *)qword_26A3F2CB8;
  qword_26A3F2CB8 = (uint64_t)&unk_2707BC758;

  v34 = (void *)qword_26A3F2CC0;
  qword_26A3F2CC0 = (uint64_t)&unk_2707BC770;

  v35 = (void *)qword_26A3F2CC8;
  qword_26A3F2CC8 = (uint64_t)&unk_2707BC788;

  v36 = (void *)qword_26A3F2CD0;
  qword_26A3F2CD0 = (uint64_t)&unk_2707BC7A0;

  v37 = (void *)qword_26A3F2CD8;
  qword_26A3F2CD8 = (uint64_t)&unk_2707BC7B8;

  v38 = (void *)qword_26A3F2CE0;
  qword_26A3F2CE0 = (uint64_t)&unk_2707BC7D0;

  v39 = (void *)qword_26A3F2CE8;
  qword_26A3F2CE8 = (uint64_t)&unk_2707BC7E8;

  v40 = (void *)qword_26A3F2CF0;
  qword_26A3F2CF0 = (uint64_t)&unk_2707BC800;

  v41 = (void *)qword_26A3F2CF8;
  qword_26A3F2CF8 = (uint64_t)&unk_2707BC818;

  v42 = (void *)qword_26A3F2D00;
  qword_26A3F2D00 = (uint64_t)&unk_2707BC830;

  v43 = (void *)qword_26A3F2D08;
  qword_26A3F2D08 = (uint64_t)&unk_2707BC848;

  v44 = (void *)qword_26A3F2D10;
  qword_26A3F2D10 = (uint64_t)&unk_2707BC860;

  v45 = (void *)qword_26A3F2D18;
  qword_26A3F2D18 = (uint64_t)&unk_2707BC878;

  v46 = (void *)qword_26A3F2D20;
  qword_26A3F2D20 = (uint64_t)&unk_2707BC890;

  v47 = (void *)qword_26A3F2D28;
  qword_26A3F2D28 = (uint64_t)&unk_2707BC8A8;

  v48 = (void *)qword_26A3F2D30;
  qword_26A3F2D30 = (uint64_t)&unk_2707BC8C0;

  v49 = (void *)qword_26A3F2D38;
  qword_26A3F2D38 = (uint64_t)&unk_2707BC8D8;

  v50 = (void *)qword_26A3F2D40;
  qword_26A3F2D40 = (uint64_t)&unk_2707BC8F0;

  v51 = (void *)qword_26A3F2D48;
  qword_26A3F2D48 = (uint64_t)&unk_2707BC908;

  v52 = (void *)qword_26A3F2D50;
  qword_26A3F2D50 = (uint64_t)&unk_2707BC920;

  v53 = (void *)qword_26A3F2D58;
  qword_26A3F2D58 = (uint64_t)&unk_2707BC938;

  v54 = (void *)qword_26A3F2D60;
  qword_26A3F2D60 = (uint64_t)&unk_2707BC950;

  v55 = (void *)qword_26A3F2D68;
  qword_26A3F2D68 = (uint64_t)&unk_2707BC968;

  v56 = (void *)qword_26A3F2D70;
  qword_26A3F2D70 = (uint64_t)&unk_2707BC980;

  v57 = (void *)qword_26A3F2D78;
  qword_26A3F2D78 = (uint64_t)&unk_2707BC998;

  v58 = (void *)qword_26A3F2D80;
  qword_26A3F2D80 = (uint64_t)&unk_2707BC9B0;

  v59 = (void *)qword_26A3F2D88;
  qword_26A3F2D88 = (uint64_t)&unk_2707BC9C8;

  v60 = (void *)qword_26A3F2D90;
  qword_26A3F2D90 = (uint64_t)&unk_2707BC9E0;

  v61 = (void *)qword_26A3F2D98;
  qword_26A3F2D98 = (uint64_t)&unk_2707BC9F8;

  v62 = (void *)qword_26A3F2DA0;
  qword_26A3F2DA0 = (uint64_t)&unk_2707BCA10;

  v63 = (void *)qword_26A3F2DA8;
  qword_26A3F2DA8 = (uint64_t)&unk_2707BCA28;

  v64 = (void *)qword_26A3F2DB0;
  qword_26A3F2DB0 = (uint64_t)&unk_2707BCA40;

  v65 = (void *)qword_26A3F2DB8;
  qword_26A3F2DB8 = (uint64_t)&unk_2707BCA58;

  v66 = (void *)qword_26A3F2DC0;
  qword_26A3F2DC0 = (uint64_t)&unk_2707BCA70;

  v67 = (void *)qword_26A3F2DC8;
  qword_26A3F2DC8 = (uint64_t)&unk_2707BCA88;

  v68 = (void *)qword_26A3F2DD0;
  qword_26A3F2DD0 = (uint64_t)&unk_2707BCAA0;

  v69 = (void *)qword_26A3F2DD8;
  qword_26A3F2DD8 = (uint64_t)&unk_2707BCAB8;

  v70 = (void *)qword_26A3F2DE0;
  qword_26A3F2DE0 = (uint64_t)&unk_2707BCAD0;

  v71 = (void *)qword_26A3F2DE8;
  qword_26A3F2DE8 = (uint64_t)&unk_2707BCAE8;

  v72 = (void *)qword_26A3F2DF0;
  qword_26A3F2DF0 = (uint64_t)&unk_2707BCB00;

  v73 = (void *)qword_26A3F2DF8;
  qword_26A3F2DF8 = (uint64_t)&unk_2707BCB18;

  v74 = (void *)qword_26A3F2E00;
  qword_26A3F2E00 = (uint64_t)&unk_2707BCB30;

  v75 = (void *)qword_26A3F2E08;
  qword_26A3F2E08 = (uint64_t)&unk_2707BCB48;

  v76 = (void *)qword_26A3F2E10;
  qword_26A3F2E10 = (uint64_t)&unk_2707BCB60;

  v77 = (void *)qword_26A3F2E18;
  qword_26A3F2E18 = (uint64_t)&unk_2707BCB78;

  v78 = (void *)qword_26A3F2E20;
  qword_26A3F2E20 = (uint64_t)&unk_2707BCB90;

  v79 = (void *)qword_26A3F2E28;
  qword_26A3F2E28 = (uint64_t)&unk_2707BCBA8;

  v80 = (void *)qword_26A3F2E30;
  qword_26A3F2E30 = (uint64_t)&unk_2707BCBC0;

  v81 = (void *)qword_26A3F2E38;
  qword_26A3F2E38 = (uint64_t)&unk_2707BCBD8;

  v82 = (void *)qword_26A3F2E40;
  qword_26A3F2E40 = (uint64_t)&unk_2707BCBF0;

  v83 = (void *)qword_26A3F2E48;
  qword_26A3F2E48 = (uint64_t)&unk_2707BCC08;

  v84 = (void *)qword_26A3F2E50;
  qword_26A3F2E50 = (uint64_t)&unk_2707BCC20;

  v85 = (void *)qword_26A3F2E58;
  qword_26A3F2E58 = (uint64_t)&unk_2707BCC38;

  v86 = (void *)qword_26A3F2E60;
  qword_26A3F2E60 = (uint64_t)&unk_2707BCC50;

  v87 = (void *)qword_26A3F2E68;
  qword_26A3F2E68 = (uint64_t)&unk_2707BCC68;

  v88 = (void *)qword_26A3F2E70;
  qword_26A3F2E70 = (uint64_t)&unk_2707BCC80;

  v89 = (void *)qword_26A3F2E78;
  qword_26A3F2E78 = (uint64_t)&unk_2707BCC98;

  v90 = (void *)qword_26A3F2E80;
  qword_26A3F2E80 = (uint64_t)&unk_2707BCCB0;

  v91 = (void *)qword_26A3F2E88;
  qword_26A3F2E88 = (uint64_t)&unk_2707BCCC8;

  v92 = (void *)qword_26A3F2E90;
  qword_26A3F2E90 = (uint64_t)&unk_2707BCCE0;

  v93 = (void *)qword_26A3F2E98;
  qword_26A3F2E98 = (uint64_t)&unk_2707BCCF8;

  v94 = (void *)qword_26A3F2EA0;
  qword_26A3F2EA0 = (uint64_t)&unk_2707BCD10;

  v95 = (void *)qword_26A3F2EA8;
  qword_26A3F2EA8 = (uint64_t)&unk_2707BCD28;

  v96 = (void *)qword_26A3F2EB0;
  qword_26A3F2EB0 = (uint64_t)&unk_2707BCD40;

  v97 = (void *)qword_26A3F2EB8;
  qword_26A3F2EB8 = (uint64_t)&unk_2707BCD58;

  v98 = (void *)qword_26A3F2EC0;
  qword_26A3F2EC0 = (uint64_t)&unk_2707BCD70;

  v99 = (void *)qword_26A3F2EC8;
  qword_26A3F2EC8 = (uint64_t)&unk_2707BCD88;

  v100 = (void *)qword_26A3F2ED0;
  qword_26A3F2ED0 = (uint64_t)&unk_2707BCDA0;

  v101 = (void *)qword_26A3F2ED8;
  qword_26A3F2ED8 = (uint64_t)&unk_2707BCDB8;

  v102 = (void *)qword_26A3F2EE0;
  qword_26A3F2EE0 = (uint64_t)&unk_2707BCDD0;

  v103 = (void *)qword_26A3F2EE8;
  qword_26A3F2EE8 = (uint64_t)&unk_2707BCDE8;

  v104 = (void *)qword_26A3F2EF0;
  qword_26A3F2EF0 = (uint64_t)&unk_2707BCE00;

  v105 = PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v106 = 0;
    _os_log_impl(&dword_259DA0000, v105, OS_LOG_TYPE_DEFAULT, "UMF Kernels Initialized", v106, 2u);
  }
}

- (void)_initializeProtectedBuffers:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v62 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v7 = [(MTLDevice *)self->_device heapBufferSizeAndAlignWithLength:qword_259DB0210[v5] options:544];
    v6 += (v8 + v7 - 1) & -v8;
    ++v5;
  }
  while (v5 != 11);
  uint64_t v9 = objc_opt_new();
  [v9 setSize:v6];
  [v9 setHazardTrackingMode:2];
  int v10 = (void *)[(MTLDevice *)self->_device newHeapWithDescriptor:v9];
  [v9 setProtectionOptions:a3];
  v11 = (void *)[(MTLDevice *)self->_device newHeapWithDescriptor:v9];
  uint64_t v12 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = NSNumber;
    v14 = v12;
    uint64_t v15 = [v13 numberWithUnsignedLongLong:a3];
    int v60 = 138412290;
    v61 = v15;
    _os_log_impl(&dword_259DA0000, v14, OS_LOG_TYPE_DEFAULT, "Making new protected heap with %@", (uint8_t *)&v60, 0xCu);
  }
  v16 = (MTLBuffer *)[v10 newBufferWithLength:4 options:544];
  objc_super v17 = self->_bufferFrameLumaSum[0];
  self->_bufferFrameLumaSum[0] = v16;

  uint64_t v18 = (MTLBuffer *)[v10 newBufferWithLength:56 options:544];
  uint64_t v19 = self->_bufferData[0];
  self->_bufferData[0] = v18;

  v20 = (MTLBuffer *)[v10 newBufferWithLength:144 options:544];
  v21 = self->_bufferCurState[0];
  self->_bufferCurState[0] = v20;

  v22 = (MTLBuffer *)[v10 newBufferWithLength:1024 options:544];
  uint64_t v23 = self->_bufferGammaKernel[0];
  self->_bufferGammaKernel[0] = v22;

  v24 = (MTLBuffer *)[v10 newBufferWithLength:5120 options:544];
  uint64_t v25 = self->_bufferEnergy[0];
  self->_bufferEnergy[0] = v24;

  uint64_t v26 = (MTLBuffer *)[v10 newBufferWithLength:5120 options:544];
  v27 = self->_bufferEnergy2[0];
  self->_bufferEnergy2[0] = v26;

  v28 = (MTLBuffer *)[v10 newBufferWithLength:640 options:544];
  v29 = self->_bufferContrastKernel[0];
  self->_bufferContrastKernel[0] = v28;

  v30 = (MTLBuffer *)[v10 newBufferWithLength:640 options:544];
  v31 = self->_bufferContrast[0];
  self->_bufferContrast[0] = v30;

  v32 = (MTLBuffer *)[v10 newBufferWithLength:20 options:544];
  v33 = self->_bufferResponses[0];
  self->_bufferResponses[0] = v32;

  v34 = (MTLBuffer *)[v10 newBufferWithLength:20 options:544];
  v35 = self->_bufferResponsesNorm[0];
  self->_bufferResponsesNorm[0] = v34;

  v36 = (MTLBuffer *)[v10 newBufferWithLength:40 options:544];
  v37 = self->_bufferResults[0];
  self->_bufferResults[0] = v36;

  if (v11)
  {
    v38 = (MTLBuffer *)[v11 newBufferWithLength:4 options:544];
    v39 = self->_bufferFrameLumaSum[1];
    self->_bufferFrameLumaSum[1] = v38;

    v40 = (MTLBuffer *)[v11 newBufferWithLength:56 options:544];
    v41 = self->_bufferData[1];
    self->_bufferData[1] = v40;

    v42 = (MTLBuffer *)[v11 newBufferWithLength:144 options:544];
    v43 = self->_bufferCurState[1];
    self->_bufferCurState[1] = v42;

    v44 = (MTLBuffer *)[v11 newBufferWithLength:1024 options:544];
    v45 = self->_bufferGammaKernel[1];
    self->_bufferGammaKernel[1] = v44;

    v46 = (MTLBuffer *)[v11 newBufferWithLength:5120 options:544];
    v47 = self->_bufferEnergy[1];
    self->_bufferEnergy[1] = v46;

    v48 = (MTLBuffer *)[v11 newBufferWithLength:5120 options:544];
    v49 = self->_bufferEnergy2[1];
    self->_bufferEnergy2[1] = v48;

    v50 = (MTLBuffer *)[v11 newBufferWithLength:640 options:544];
    v51 = self->_bufferContrastKernel[1];
    self->_bufferContrastKernel[1] = v50;

    v52 = (MTLBuffer *)[v11 newBufferWithLength:640 options:544];
    v53 = self->_bufferContrast[1];
    self->_bufferContrast[1] = v52;

    v54 = (MTLBuffer *)[v11 newBufferWithLength:20 options:544];
    v55 = self->_bufferResponses[1];
    self->_bufferResponses[1] = v54;

    v56 = (MTLBuffer *)[v11 newBufferWithLength:20 options:544];
    v57 = self->_bufferResponsesNorm[1];
    self->_bufferResponsesNorm[1] = v56;

    v58 = (MTLBuffer *)[v11 newBufferWithLength:40 options:544];
    v59 = self->_bufferResults[1];
    self->_bufferResults[1] = v58;

    self->_protectionStatus = a3;
    self->_madeProtectedBuffers = self->_bufferFrameLumaSum[1] != 0;
  }
}

- (int)_deviceClass
{
  return MGGetSInt32Answer();
}

- (BOOL)canProcessSurface:(__IOSurface *)a3
{
  uint64_t v5 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG)) {
    -[PSEVideoProcessor canProcessSurface:](v5, a3);
  }
  self->_anon_15c[12] = 0;
  signed int PixelFormat = IOSurfaceGetPixelFormat(a3);
  BOOL result = 1;
  if (PixelFormat <= 1380401728)
  {
    if (PixelFormat > 645428783)
    {
      if (PixelFormat > 875704437)
      {
        if (PixelFormat == 875704438) {
          return result;
        }
        int v8 = 1111970369;
      }
      else
      {
        if (PixelFormat == 645428784) {
          return result;
        }
        int v8 = 875704422;
      }
      goto LABEL_28;
    }
    if ((PixelFormat - 645166640) <= 4 && ((1 << (PixelFormat - 48)) & 0x15) != 0) {
      return [(MTLDevice *)self->_device supportsYCBCRPackedFormats12];
    }
    if (PixelFormat == 641230384) {
      return result;
    }
    int v8 = 641234480;
    goto LABEL_28;
  }
  if (PixelFormat > 1953903151)
  {
    if (PixelFormat <= 1999843441)
    {
      if (PixelFormat == 1953903152) {
        return result;
      }
      int v8 = 1953903154;
      goto LABEL_28;
    }
    if (PixelFormat == 1999843442 || PixelFormat == 2016686640) {
      return result;
    }
    int v8 = 2019963440;
LABEL_28:
    if (PixelFormat != v8) {
      return 0;
    }
    return result;
  }
  if (PixelFormat <= 1815162993)
  {
    if (PixelFormat == 1380401729) {
      return result;
    }
    int v8 = 1380411457;
    goto LABEL_28;
  }
  if (PixelFormat != 1815162994 && PixelFormat != 1882468912)
  {
    int v8 = 1885745712;
    goto LABEL_28;
  }
  return result;
}

- (unint64_t)_pixelFormatForSurface:(__IOSurface *)a3
{
  signed int PixelFormat = IOSurfaceGetPixelFormat(a3);
  unint64_t result = 70;
  if (PixelFormat <= 1882468911)
  {
    if (PixelFormat > 875704421)
    {
      if (PixelFormat <= 1111970368)
      {
        if (PixelFormat != 875704422 && PixelFormat != 875704438) {
          return result;
        }
        return 500;
      }
      int v5 = 1111970369;
      unint64_t v6 = 80;
      BOOL v7 = PixelFormat == 1380411457;
      unint64_t v8 = 115;
      goto LABEL_22;
    }
    if (PixelFormat == 641230384 || PixelFormat == 641234480) {
      return 500;
    }
    if (PixelFormat != 645428784) {
      return result;
    }
    return 508;
  }
  if (PixelFormat <= 1953903153)
  {
    if (PixelFormat == 1882468912 || PixelFormat == 1885745712) {
      return 508;
    }
    if (PixelFormat == 1953903152) {
      return 580;
    }
  }
  else
  {
    if (PixelFormat <= 2016686639)
    {
      int v5 = 1953903154;
      unint64_t v6 = 581;
      BOOL v7 = PixelFormat == 1999843442;
      unint64_t v8 = 554;
LABEL_22:
      if (!v7) {
        unint64_t v8 = 70;
      }
      if (PixelFormat == v5) {
        return v6;
      }
      else {
        return v8;
      }
    }
    if (PixelFormat == 2016686640 || PixelFormat == 2019963440) {
      return 505;
    }
  }
  return result;
}

- (void)_computeDisplaySizeIndexSelection
{
  int v3 = [(PSEVideoProcessor *)self _deviceClass] - 1;
  if (v3 > 5)
  {
    int v5 = 3;
    int v4 = 2;
    float v6 = 1265.6;
  }
  else
  {
    int v4 = dword_259DB0340[v3];
    int v5 = dword_259DB0358[v3];
    float v6 = flt_259DB0370[v3];
  }
  self->_idxEquivalentKernelIndex = v4;
  self->_idxEquivalentSize = v5;
  self->_area = v6;
}

- (int)_computeFrameRateIndexSelection
{
  uint64_t v2 = 0;
  int v3 = 0;
  float v4 = 1000.0;
  do
  {
    float v5 = vabds_f32(*(float *)&standardFrameRates[v2], self->_fps);
    if (v5 <= v4)
    {
      int v3 = v2;
      float v4 = v5;
    }
    ++v2;
  }
  while (v2 != 7);
  float v6 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG)) {
    [(PSEVideoProcessor *)v3 _computeFrameRateIndexSelection];
  }
  return v3;
}

- (KernelData)_prepare_contrast_kernels
{
  float v5 = (char *)malloc_type_malloc(0x280uLL, 0xF8EBE3E6uLL);
  bzero(v5, 0x280uLL);
  uint64_t v6 = 0;
  *(void *)retstr->var0 = 0;
  *(void *)&retstr->var0[2] = 0;
  LODWORD(retstr->var1) = 0;
  v14 = v5;
  *(void *)&retstr->var0[4] = 0;
  do
  {
    BOOL v7 = [(id)UFMKernels[35 * self->_idxEquivalentKernelIndex + 7 * v6 + self->_idxFrameRate] objectEnumerator];
    retstr->var0[v6] = 0;
    uint64_t v8 = [v7 nextObject];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = 0;
      do
      {
        [v9 floatValue];
        *(_DWORD *)&v5[4 * v10++] = v11;
        retstr->var0[v6] = v10;
        uint64_t v12 = [v7 nextObject];

        uint64_t v9 = (void *)v12;
      }
      while (v12);
    }

    ++v6;
    v5 += 128;
  }
  while (v6 != 5);
  *(void *)&retstr->var0[5] = v14;
  return result;
}

- (id)_prepare_gamma_kernel:(float)a3 shape:(float)a4 scale:(float)a5
{
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:1024];
  objc_msgSend(v8, "resetBytesInRange:", 0, objc_msgSend(v8, "length"));
  float v9 = a4 + -1.0;
  float v19 = flt_259DB0284[(float)(a4 + -1.0)];
  float v10 = a3;
  double v18 = 1.0 / a3;
  float v11 = powf(a5, -a4);
  float v12 = 0.0;
  int v13 = 256;
  float v14 = 0.0;
  do
  {
    if ((float)(v12 / v10) > 0.99 && v14 >= 2.0) {
      break;
    }
    float v14 = v18 + v14;
    float v16 = v11 * expf((float)-v14 / a5);
    float v20 = (float)(powf(v14, v9) * v16) / v19;
    float v12 = v12 + v20;
    [v8 appendBytes:&v20 length:4];
    --v13;
  }
  while (v13);

  return v8;
}

- (int)_colorSpaceFromSurface:(__IOSurface *)a3
{
  CFTypeRef v5 = IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x263F0EDA0]);
  if (!v5
    || (uint64_t v6 = v5,
        BOOL v7 = CGColorSpaceCreateWithPropertyList(v5),
        CFStringRef Name = CGColorSpaceGetName(v7),
        CFRelease(v6),
        CGColorSpaceRelease(v7),
        !Name))
  {
    CFTypeRef v9 = IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x263F0EE00]);
    if (v9)
    {
      float v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFDataGetTypeID())
      {
        float v12 = (CGColorSpace *)MEMORY[0x25A2EAF50](v10);
        CFStringRef Name = CGColorSpaceGetName(v12);
        CGColorSpaceRelease(v12);
        CFRelease(v10);
        if (Name) {
          goto LABEL_6;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    if (IOSurfaceGetBulkAttachments()) {
      return 0;
    }
    else {
      return 0;
    }
  }
LABEL_6:

  return [(PSEVideoProcessor *)self _colorSpaceValueForName:Name];
}

- (int)_colorSpaceValueForName:(__CFString *)a3
{
  if (_colorSpaceValueForName__onceToken != -1) {
    dispatch_once(&_colorSpaceValueForName__onceToken, &__block_literal_global_54);
  }
  float v4 = [(id)_colorSpaceValueForName__Values objectForKey:a3];
  int v5 = [v4 intValue];

  return v5;
}

void __45__PSEVideoProcessor__colorSpaceValueForName___block_invoke()
{
  v15[25] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F001F0];
  v14[0] = *MEMORY[0x263F001E8];
  v14[1] = v0;
  v15[0] = &unk_2707B83D8;
  v15[1] = &unk_2707B83F0;
  uint64_t v1 = *MEMORY[0x263F002D8];
  v14[2] = *MEMORY[0x263F00218];
  v14[3] = v1;
  v15[2] = &unk_2707B8408;
  v15[3] = &unk_2707B8420;
  uint64_t v2 = *MEMORY[0x263F00238];
  v14[4] = *MEMORY[0x263F002C8];
  v14[5] = v2;
  v15[4] = &unk_2707B8438;
  v15[5] = &unk_2707B8450;
  uint64_t v3 = *MEMORY[0x263F00250];
  v14[6] = *MEMORY[0x263F00230];
  v14[7] = v3;
  v15[6] = &unk_2707B8468;
  v15[7] = &unk_2707B8480;
  uint64_t v4 = *MEMORY[0x263F00208];
  v14[8] = *MEMORY[0x263F002B8];
  v14[9] = v4;
  v15[8] = &unk_2707B8498;
  v15[9] = &unk_2707B84B0;
  uint64_t v5 = *MEMORY[0x263F00268];
  v14[10] = *MEMORY[0x263F00220];
  v14[11] = v5;
  v15[10] = &unk_2707B84C8;
  v15[11] = &unk_2707B84E0;
  uint64_t v6 = *MEMORY[0x263F00270];
  v14[12] = *MEMORY[0x263F00240];
  v14[13] = v6;
  v15[12] = &unk_2707B84F8;
  v15[13] = &unk_2707B8510;
  uint64_t v7 = *MEMORY[0x263F001D0];
  v14[14] = *MEMORY[0x263F00258];
  v14[15] = v7;
  v15[14] = &unk_2707B8528;
  v15[15] = &unk_2707B8540;
  uint64_t v8 = *MEMORY[0x263F001E0];
  v14[16] = *MEMORY[0x263F001D8];
  v14[17] = v8;
  v15[16] = &unk_2707B8558;
  v15[17] = &unk_2707B8570;
  uint64_t v9 = *MEMORY[0x263F002D0];
  v14[18] = *MEMORY[0x263F00298];
  v14[19] = v9;
  v15[18] = &unk_2707B8588;
  v15[19] = &unk_2707B85A0;
  uint64_t v10 = *MEMORY[0x263F00228];
  v14[20] = *MEMORY[0x263F00278];
  v14[21] = v10;
  v15[20] = &unk_2707B85B8;
  v15[21] = &unk_2707B85D0;
  uint64_t v11 = *MEMORY[0x263F00248];
  v14[22] = *MEMORY[0x263F00260];
  v14[23] = v11;
  v15[22] = &unk_2707B85E8;
  v15[23] = &unk_2707B8600;
  v14[24] = *MEMORY[0x263F00290];
  v15[24] = &unk_2707B8618;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:25];
  int v13 = (void *)_colorSpaceValueForName__Values;
  _colorSpaceValueForName__Values = v12;
}

- (void)processSourceSurface:(__IOSurface *)a3 withTimestamp:(double)a4 toDestinationSurface:(__IOSurface *)a5 options:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    [(SwiftVideoProcessor *)self->_swiftProcessor processSurfaceWithSourceSurface:a3 timestamp:a5 destinationSurface:v10 options:a4];
  }
  else
  {
    uint64_t v11 = PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_ERROR)) {
      -[PSEVideoProcessor processSourceSurface:withTimestamp:toDestinationSurface:options:](v11);
    }
  }
}

- (void)_processSurface:(__IOSurface *)a3 withTimestamp:(double)a4 destinationSurface:(__IOSurface *)a5 options:(id)a6
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (self->_needsInitialization)
  {
    [(PSEVideoProcessor *)self _initialize];
    uint64_t v11 = PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259DA0000, v11, OS_LOG_TYPE_DEFAULT, "PSE V8.1 Initialization Called", buf, 2u);
    }
  }
  if (a3)
  {
    uint64_t v12 = 0;
    double v13 = a4 - self->_previousSurfaceTime;
    if (v13 < 0.00833333333) {
      double v13 = 0.00833333333;
    }
    *(float *)&int v14 = fmin(v13, 0.0416666667);
    int v15 = FramePoolIdx;
    FrameDeltas[FramePoolIdx] = v14;
    FramePoolIdx = (v15 + 1) % 0xAu;
    float v16 = 0.0;
    float v17 = 10.0;
    float v18 = 0.001;
    do
    {
      float v19 = *(float *)&FrameDeltas[v12];
      if (v17 >= v19) {
        float v17 = *(float *)&FrameDeltas[v12];
      }
      if (v18 < v19) {
        float v18 = *(float *)&FrameDeltas[v12];
      }
      float v16 = v16 + v19;
      ++v12;
    }
    while (v12 != 10);
    uint64_t v20 = 0;
    float v21 = 0.0;
    float v22 = v16 / 10.0;
    do
    {
      float v21 = (float)(*(float *)&FrameDeltas[v20] - v22) * (float)(*(float *)&FrameDeltas[v20] - v22) / 10.0 + v21;
      ++v20;
    }
    while (v20 != 10);
    float fps = self->_fps;
    self->_float fps = 8.0 / (float)((float)(v16 - v17) - v18);
    self->_previousSurfaceTime = a4;
    v24 = (void *)PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
    {
      double v31 = fabs(sqrt(v21));
      if (v21 == -INFINITY) {
        double v31 = INFINITY;
      }
      float v32 = v31 / v22;
      v33 = NSNumber;
      v34 = v24;
      *(float *)&double v35 = v32;
      v36 = [v33 numberWithFloat:v35];
      *(float *)&double v37 = self->_fps;
      v38 = [NSNumber numberWithFloat:v37];
      v39 = [NSNumber numberWithDouble:self->_previousSurfaceTime];
      *(_DWORD *)buf = 138412802;
      v80 = v36;
      __int16 v81 = 2112;
      v82 = v38;
      __int16 v83 = 2112;
      v84 = v39;
      _os_log_debug_impl(&dword_259DA0000, v34, OS_LOG_TYPE_DEBUG, "PSE stdDelta value: %@, fps: %@ %@", buf, 0x20u);
    }
    size_t Width = IOSurfaceGetWidth(a3);
    size_t Height = IOSurfaceGetHeight(a3);
    uint64_t v27 = [(PSEVideoProcessor *)self _colorSpaceFromSurface:a3];
    unsigned int v28 = 1;
    unsigned int v29 = 1;
    switch((int)v27)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 16:
      case 19:
      case 21:
      case 26:
      case 27:
      case 29:
      case 31:
      case 32:
        v30 = (void *)PSELog;
        if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG)) {
          -[PSEVideoProcessor _processSurface:withTimestamp:destinationSurface:options:](v30, v27);
        }
        unsigned int v29 = 0;
        unsigned int v28 = 1;
        goto LABEL_32;
      case 1:
      case 2:
        goto LABEL_32;
      case 4:
      case 33:
        unsigned int v28 = 0;
        goto LABEL_32;
      case 5:
      case 7:
      case 20:
      case 30:
        goto LABEL_21;
      case 6:
      case 8:
      case 13:
        unsigned int v28 = 0;
LABEL_21:
        unsigned int v29 = 0;
        goto LABEL_32;
      case 17:
      case 25:
        unsigned int v28 = 0;
        goto LABEL_29;
      case 18:
      case 34:
        goto LABEL_29;
      case 22:
        unsigned int v28 = 2;
LABEL_29:
        unsigned int v29 = 2;
        goto LABEL_32;
      case 24:
      case 28:
        unsigned int v29 = 2;
        goto LABEL_31;
      case 35:
        unsigned int v29 = 0;
LABEL_31:
        unsigned int v28 = 3;
LABEL_32:
        self->_bufferConstants.uEOTF = v28;
        self->_bufferConstants.uColSpace = v29;
        break;
      default:
        break;
    }
    uint64_t ProtectionOptions = IOSurfaceGetProtectionOptions();
    uint64_t v41 = ProtectionOptions;
    if (ProtectionOptions && ProtectionOptions != self->_protectionStatus)
    {
      [(PSEVideoProcessor *)self _initializeProtectedBuffers:ProtectionOptions];
    }
    else
    {
      if (a4 - self->_previousSurfaceTime <= 1.0 && vabds_f32(self->_fps, fps) < 5.0)
      {
LABEL_41:
        if (self->_anon_15c[12])
        {
          double WidthOfPlane = (double)IOSurfaceGetWidthOfPlane(a3, 0);
          v50 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, (unint64_t)WidthOfPlane, (unint64_t)(double)IOSurfaceGetHeightOfPlane(a3, 0), 0);
          [v50 setUsage:2];
          [v50 setProtectionOptions:v41];
          v51 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v50 iosurface:a5 plane:0];
          processedTexture = self->_processedTexture;
          self->_processedTexture = v51;

          [v50 setUsage:1];
          [v50 setPixelFormat:20];
          v53 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v50 iosurface:a3 plane:0];
          sourceTexture = self->_sourceTexture;
          self->_sourceTexture = v53;

          objc_msgSend(v50, "setWidth:", IOSurfaceGetWidthOfPlane(a3, 1uLL));
          objc_msgSend(v50, "setHeight:", IOSurfaceGetHeightOfPlane(a3, 1uLL));
          [v50 setPixelFormat:60];
          v55 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v50 iosurface:a3 plane:1];
          sourceCbCrTexture = self->_sourceCbCrTexture;
          self->_sourceCbCrTexture = v55;
        }
        else
        {
          v50 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[PSEVideoProcessor _pixelFormatForSurface:](self, "_pixelFormatForSurface:", a3), (unint64_t)(double)Width, (unint64_t)(double)Height, 0);
          [v50 setUsage:1];
          [v50 setProtectionOptions:v41];
          v57 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v50 iosurface:a3 plane:0];
          v58 = self->_sourceTexture;
          self->_sourceTexture = v57;

          [v50 setUsage:2];
          objc_msgSend(v50, "setPixelFormat:", -[PSEVideoProcessor _pixelFormatForSurface:](self, "_pixelFormatForSurface:", a5));
          v59 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v50 iosurface:a5 plane:0];
          sourceCbCrTexture = self->_processedTexture;
          self->_processedTexture = v59;
        }

        int v60 = [v10 objectForKey:@"displayMaxNits"];
        [v60 floatValue];
        self->_bufferConstants.maxNits = v61;

        uint64_t v62 = [v10 objectForKey:@"sourceSurfaceEDR"];
        [v62 floatValue];
        self->_bufferConstants.edr = v63;

        v64 = [v10 objectForKey:@"displayEDRFactor"];
        v65 = v64;
        if (v64) {
          [v64 floatValue];
        }
        else {
          float v66 = 1.0;
        }
        self->_bufferConstants.displayEDR = v66;
        v67 = [v10 objectForKey:@"currentFPS"];
        [v67 floatValue];
        float v69 = v68;

        if (v69 <= 0.0) {
          float v69 = self->_fps;
        }
        self->_bufferConstants.float fps = v69;
        dispatch_semaphore_t v70 = dispatch_semaphore_create(0);
        v71 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
        [v71 setProtectionOptions:v41];
        uint64_t v73 = MEMORY[0x263EF8330];
        uint64_t v74 = 3221225472;
        v75 = __78__PSEVideoProcessor__processSurface_withTimestamp_destinationSurface_options___block_invoke;
        v76 = &unk_2654604F8;
        v77 = self;
        dispatch_semaphore_t v78 = v70;
        v72 = v70;
        [v71 addCompletedHandler:&v73];
        -[PSEVideoProcessor _processFrame:sourceSurface:outSurface:](self, "_processFrame:sourceSurface:outSurface:", v71, a3, a5, v73, v74, v75, v76, v77);
        [v71 commit];
        dispatch_semaphore_wait(v72, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_50;
      }
      v42 = (void *)PSELog;
      if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_INFO))
      {
        v43 = NSNumber;
        double v44 = a4 - self->_previousSurfaceTime;
        v45 = v42;
        v46 = [v43 numberWithDouble:v44];
        *(float *)&double v47 = vabds_f32(self->_fps, fps);
        v48 = [NSNumber numberWithFloat:v47];
        *(_DWORD *)buf = 138412546;
        v80 = v46;
        __int16 v81 = 2112;
        v82 = v48;
        _os_log_impl(&dword_259DA0000, v45, OS_LOG_TYPE_INFO, "Resetting state due to time %@ or fps: %@", buf, 0x16u);
      }
    }
    [(PSEVideoProcessor *)self _resetState:v41];
    goto LABEL_41;
  }
LABEL_50:
}

void __78__PSEVideoProcessor__processSurface_withTimestamp_destinationSurface_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v4 + 318) || *(unsigned char *)(v4 + 317)) && !*(unsigned char *)(v4 + 321))
  {
    uint64_t v5 = (float *)[*(id *)(v4 + 280) contents];
    uint64_t v6 = *(unsigned char **)(a1 + 32);
    if (v6[317])
    {
      uint64_t v7 = PSELog;
      if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = *v5;
        double v9 = v5[1];
        double v10 = v5[2];
        double v11 = v5[3];
        double v12 = v5[4];
        double v13 = v5[5];
        double v14 = v5[6];
        double v15 = v5[7];
        double v16 = v5[13];
        double v17 = v5[8];
        double v18 = v5[11];
        double v19 = v5[12];
        double v20 = v5[9];
        double v21 = v5[10];
        int v24 = 134221312;
        double v25 = v8;
        __int16 v26 = 2048;
        double v27 = v9;
        __int16 v28 = 2048;
        double v29 = v10;
        __int16 v30 = 2048;
        double v31 = v11;
        __int16 v32 = 2048;
        double v33 = v12;
        __int16 v34 = 2048;
        double v35 = v13;
        __int16 v36 = 2048;
        double v37 = v14;
        __int16 v38 = 2048;
        double v39 = v15;
        __int16 v40 = 2048;
        double v41 = v16;
        __int16 v42 = 2048;
        double v43 = v17;
        __int16 v44 = 2048;
        double v45 = v18;
        __int16 v46 = 2048;
        double v47 = v19;
        __int16 v48 = 2048;
        double v49 = v20;
        __int16 v50 = 2048;
        double v51 = v21;
        _os_log_impl(&dword_259DA0000, v7, OS_LOG_TYPE_DEFAULT, "APL:%7.2fnits, AdaptLevel:%5.1fnits, Contrast:%6.2f, Response:%7.2f, Response2:%6.2f, Energy:%6.1f, E2:%4.2f, Risk:%6.2f, VFML:%6.2f, MitigateCF:%5.2f, MuAdapt:%5.3f, FPS:%3.0f, EDR:%4.2f, DisplayEDR:%4.2f", (uint8_t *)&v24, 0x8Eu);
      }
      uint64_t v6 = *(unsigned char **)(a1 + 32);
    }
    float v22 = [v6 validationCallback];

    if (v22)
    {
      uint64_t v23 = [*(id *)(a1 + 32) validationCallback];
      v23[2](*v5, v5[7], (float)(v5[8] * 100.0));
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

- (void)_resetState:(unint64_t)a3
{
  self->_idxFrameRate = [(PSEVideoProcessor *)self _computeFrameRateIndexSelection];
  [(PSEVideoProcessor *)self _computeDisplaySizeIndexSelection];
  uint64_t v5 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG)) {
    -[PSEVideoProcessor _resetState:]((uint64_t)self, v5);
  }
  *(float *)&double v6 = self->_fps;
  *(float *)&double v7 = self->_energyPoolGammaShape;
  *(float *)&double v8 = self->_energyPoolGammaScale;
  double v9 = [(PSEVideoProcessor *)self _prepare_gamma_kernel:v6 shape:v7 scale:v8];
  memset(v38, 0, 28);
  [(PSEVideoProcessor *)self _prepare_contrast_kernels];
  v35[1] = objc_msgSend(v9, "length", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0) >> 2;
  *(float *)&v35[2] = self->_nits * self->_avl;
  float fps = self->_fps;
  float v11 = 1.0 - exp(-1.0 / (float)(self->_tauadapt * fps));
  *(float *)&v35[3] = v11;
  float v12 = 1.0 - exp(-1.0 / (float)(fps * self->_taumitigation));
  *(float *)&v35[4] = v12;
  double v13 = pow(sqrt(self->_area * 1.6) / *(float *)&standardSizes[self->_idxEquivalentSize], self->_cA + self->_cA);
  double gain = self->_gain;
  float v15 = v13 * (gain / pow(fps, 1.0 / self->_energypoolexponent));
  *(float *)&v35[5] = v15;
  v35[14] = 1065353216;
  long long v36 = 0uLL;
  LODWORD(v37) = 0;
  double v16 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG)) {
    -[PSEVideoProcessor _resetState:](v16, v11);
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = *(uint64_t *)((char *)&v38[2] + 4);
  double v20 = (char *)&NormEnergyThreshold + 20 * self->_idxFrameRate;
  do
  {
    uint64_t v21 = *((unsigned int *)v38 + v18);
    float v22 = (float *)&v35[v18];
    *((_DWORD *)v22 + 21) = v21;
    float v23 = 0.0;
    if (v21)
    {
      uint64_t v24 = v17;
      do
      {
        double v25 = *(float *)(v19 + 4 * v24);
        float v23 = v25 * v25 + v23;
        ++v24;
        --v21;
      }
      while (v21);
    }
    v22[26] = v23;
    v22[31] = *(float *)&v20[4 * v18++];
    v17 += 32;
  }
  while (v18 != 5);
  __int16 v26 = (void *)[(MTLDevice *)self->_device newBufferWithBytes:v19 length:640 options:0];
  free(*(void **)((char *)&v38[2] + 4));
  device = self->_device;
  id v28 = v9;
  double v29 = (void *)-[MTLDevice newBufferWithBytes:length:options:](device, "newBufferWithBytes:length:options:", [v28 bytes], objc_msgSend(v28, "length"), 0);
  __int16 v30 = (void *)[(MTLDevice *)self->_device newBufferWithBytes:v35 length:144 options:0];
  double v31 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  __int16 v32 = [v31 blitCommandEncoder];
  [v32 copyFromBuffer:v30 sourceOffset:0 toBuffer:self->_bufferCurState[0] destinationOffset:0 size:144];
  objc_msgSend(v32, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v29, 0, self->_bufferGammaKernel[0], 0, objc_msgSend(v28, "length"));
  [v32 copyFromBuffer:v26 sourceOffset:0 toBuffer:self->_bufferContrastKernel[0] destinationOffset:0 size:640];
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferContrast[0], 0, 640, 0);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferEnergy[0], 0, objc_msgSend(v28, "length"), 0);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferEnergy2[0], 0, objc_msgSend(v28, "length"), 0);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferDataDebug, 0, 56, 0);
  [v32 endEncoding];
  [v31 commit];
  if (![(PSEVideoProcessor *)self inTestingMode] && self->_madeProtectedBuffers)
  {
    double v33 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

    [v33 setProtectionOptions:a3];
    __int16 v34 = [v33 blitCommandEncoder];

    [v34 copyFromBuffer:v30 sourceOffset:0 toBuffer:self->_bufferCurState[1] destinationOffset:0 size:144];
    objc_msgSend(v34, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v29, 0, self->_bufferGammaKernel[1], 0, objc_msgSend(v28, "length"));
    [v34 copyFromBuffer:v26 sourceOffset:0 toBuffer:self->_bufferContrastKernel[1] destinationOffset:0 size:640];
    objc_msgSend(v34, "fillBuffer:range:value:", self->_bufferContrast[1], 0, 640, 0);
    objc_msgSend(v34, "fillBuffer:range:value:", self->_bufferEnergy[1], 0, objc_msgSend(v28, "length"), 0);
    objc_msgSend(v34, "fillBuffer:range:value:", self->_bufferEnergy2[1], 0, objc_msgSend(v28, "length"), 0);
    [v34 endEncoding];
    [v33 commit];
    __int16 v32 = v34;
    double v31 = v33;
  }
}

- (void)_processFrame:(id)a3 sourceSurface:(__IOSurface *)a4 outSurface:(__IOSurface *)a5
{
  id v7 = a3;
  BOOL v8 = [v7 protectionOptions] != 0;
  self->_bufferConstants.bProtected = v8;
  double Width = (double)IOSurfaceGetWidth(a4);
  double Height = (double)IOSurfaceGetHeight(a4);
  float v11 = Width * Height;
  self->_bufferConstants.fPixelCnt = v11;
  float v12 = [v7 blitCommandEncoder];
  objc_msgSend(v12, "fillBuffer:range:value:", self->_bufferFrameLumaSum[v8], 0, -[MTLBuffer length](self->_bufferFrameLumaSum[v8], "length"), 0);
  [v12 endEncoding];
  uint64_t v21 = v7;
  double v13 = [v7 computeCommandEncoder];
  [v13 setLabel:@"Primary Compute Encoder"];
  [v13 setComputePipelineState:self->_cptPSO_RiskComputePass0];
  [v13 setTexture:self->_sourceTexture atIndex:0];
  [v13 setTexture:self->_sourceCbCrTexture atIndex:1];
  [v13 setTexture:self->_processedTexture atIndex:2];
  [v13 setBytes:&self->_bufferConstants length:56 atIndex:0];
  [v13 setBuffer:self->_bufferFrameLumaSum[v8] offset:0 atIndex:1];
  bufferData = self->_bufferData;
  [v13 setBuffer:self->_bufferData[v8] offset:0 atIndex:2];
  bufferGammaKernel = self->_bufferGammaKernel;
  [v13 setBuffer:self->_bufferGammaKernel[v8] offset:0 atIndex:3];
  bufferCurState = self->_bufferCurState;
  [v13 setBuffer:self->_bufferCurState[v8] offset:0 atIndex:4];
  unint64_t v17 = [(MTLComputePipelineState *)self->_cptPSO_RiskComputePass0 threadExecutionWidth];
  unint64_t v18 = [(MTLComputePipelineState *)self->_cptPSO_RiskComputePass0 maxTotalThreadsPerThreadgroup];
  v35[0] = (unint64_t)Width;
  v35[1] = (unint64_t)Height;
  v35[2] = 1;
  v34[0] = v17;
  v34[1] = v18 / v17;
  v34[2] = 1;
  [v13 dispatchThreads:v35 threadsPerThreadgroup:v34];
  if (!self->_bufferConstants.bCopyOnly)
  {
    [v13 setComputePipelineState:self->_cptPSO_RiskComputePass1];
    [v13 setBytes:&self->_bufferConstants length:56 atIndex:0];
    [v13 setBuffer:self->_bufferFrameLumaSum[v8] offset:0 atIndex:1];
    [v13 setBuffer:bufferData[v8] offset:0 atIndex:2];
    [v13 setBuffer:bufferGammaKernel[v8] offset:0 atIndex:3];
    [v13 setBuffer:bufferCurState[v8] offset:0 atIndex:4];
    uint64_t v19 = &self->super.isa + v8;
    [v13 setBuffer:v19[23] offset:0 atIndex:5];
    [v13 setBuffer:v19[25] offset:0 atIndex:6];
    [v13 setBuffer:v19[27] offset:0 atIndex:7];
    [v13 setBuffer:v19[29] offset:0 atIndex:8];
    long long v32 = xmmword_259DB01B0;
    uint64_t v33 = 1;
    long long v30 = xmmword_259DB01C0;
    uint64_t v31 = 1;
    [v13 dispatchThreads:&v32 threadsPerThreadgroup:&v30];
    [v13 setComputePipelineState:self->_cptPSO_RiskComputePass2];
    [v13 setBytes:&self->_bufferConstants length:56 atIndex:0];
    [v13 setBuffer:bufferData[v8] offset:0 atIndex:2];
    [v13 setBuffer:bufferGammaKernel[v8] offset:0 atIndex:3];
    [v13 setBuffer:bufferCurState[v8] offset:0 atIndex:4];
    [v13 setBuffer:v19[27] offset:0 atIndex:7];
    [v13 setBuffer:v19[29] offset:0 atIndex:8];
    [v13 setBuffer:v19[19] offset:0 atIndex:9];
    [v13 setBuffer:v19[21] offset:0 atIndex:10];
    [v13 setBuffer:v19[31] offset:0 atIndex:11];
    long long v28 = xmmword_259DB01D0;
    uint64_t v29 = 1;
    long long v26 = xmmword_259DB01E0;
    uint64_t v27 = 1;
    [v13 dispatchThreads:&v28 threadsPerThreadgroup:&v26];
    [v13 setComputePipelineState:self->_cptPSO_RiskComputePass3];
    [v13 setBytes:&self->_bufferConstants length:56 atIndex:0];
    [v13 setBuffer:bufferCurState[v8] offset:0 atIndex:4];
    [v13 setBuffer:bufferData[v8] offset:0 atIndex:2];
    [v13 setBuffer:v19[31] offset:0 atIndex:11];
    int64x2_t v24 = vdupq_n_s64(1uLL);
    uint64_t v25 = 1;
    int64x2_t v22 = v24;
    uint64_t v23 = 1;
    [v13 dispatchThreads:&v24 threadsPerThreadgroup:&v22];
  }
  [v13 endEncoding];
  if ((self->_bufferConstants.bCallbackValues || self->_bufferConstants.bDebug) && !self->_bufferConstants.bProtected)
  {
    double v20 = [v21 blitCommandEncoder];
    [v20 copyFromBuffer:self->_bufferData[0] sourceOffset:0 toBuffer:self->_bufferDataDebug destinationOffset:0 size:56];
    [v20 endEncoding];
  }
}

- (id)validationCallback
{
  return self->_validationCallback;
}

- (BOOL)inTestingMode
{
  return self->_inTestingMode;
}

- (void)setInTestingMode:(BOOL)a3
{
  self->_inTestingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validationCallback, 0);
  objc_storeStrong((id *)&self->_processedTexture, 0);
  objc_storeStrong((id *)&self->_sourceCbCrTexture, 0);
  objc_storeStrong((id *)&self->_sourceTexture, 0);
  objc_storeStrong((id *)&self->_bufferDataDebug, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_bufferResults[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_bufferResponsesNorm[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_bufferResponses[k + 1], 0);
  for (uint64_t m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_bufferContrast[m + 1], 0);
  for (uint64_t n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_bufferContrastKernel[n + 1], 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_bufferEnergy2[ii + 1], 0);
  for (juint64_t j = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_bufferEnergy[jj + 1], 0);
  for (kuint64_t k = 0; kk != -2; --kk)
    objc_storeStrong((id *)&self->_bufferGammaKernel[kk + 1], 0);
  for (muint64_t m = 0; mm != -2; --mm)
    objc_storeStrong((id *)&self->_bufferCurState[mm + 1], 0);
  for (nuint64_t n = 0; nn != -2; --nn)
    objc_storeStrong((id *)&self->_bufferData[nn + 1], 0);
  for (uint64_t i1 = 0; i1 != -2; --i1)
    objc_storeStrong((id *)&self->_bufferFrameLumaSum[i1 + 1], 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass3, 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass2, 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass1, 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass0, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_swiftProcessor, 0);
}

+ (uint64_t)needsProcessing
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[PSEVideoProcessor _initialize](v0);
}

- (void)canProcessSurface:(void *)a1 .cold.1(void *a1, __IOSurface *a2)
{
  id v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = [v3 numberWithUnsignedInt:IOSurfaceGetPixelFormat(a2)];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_259DA0000, v6, v7, "Pixel format: %@", v8, v9, v10, v11, v12);
}

- (void)_computeFrameRateIndexSelection
{
  uint64_t v2 = NSNumber;
  int v3 = standardFrameRates[a1];
  id v4 = a2;
  LODWORD(v5) = v3;
  uint64_t v6 = [v2 numberWithFloat:v5];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_259DA0000, v7, v8, "Choosing standard FPS: %@", v9, v10, v11, v12, v13);
}

- (void)processSourceSurface:(os_log_t)log withTimestamp:toDestinationSurface:options:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_259DA0000, log, OS_LOG_TYPE_ERROR, "Options should be passed in", v1, 2u);
}

- (void)_processSurface:(void *)a1 withTimestamp:(uint64_t)a2 destinationSurface:options:.cold.1(void *a1, uint64_t a2)
{
  int v3 = NSNumber;
  id v4 = a1;
  double v5 = [v3 numberWithInt:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_259DA0000, v6, v7, "Unsupported color space: %@", v8, v9, v10, v11, v12);
}

- (void)_resetState:(void *)a1 .cold.1(void *a1, float a2)
{
  int v3 = NSNumber;
  id v4 = a1;
  *(float *)&double v5 = a2;
  uint64_t v6 = [v3 numberWithFloat:v5];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_259DA0000, v7, v8, "Current value for mu: %@", v9, v10, v11, v12, v13);
}

- (void)_resetState:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = NSNumber;
  int v4 = standardSizes[*(int *)(a1 + 428)];
  double v5 = a2;
  LODWORD(v6) = v4;
  uint64_t v7 = [v3 numberWithFloat:v6];
  LODWORD(v8) = *(_DWORD *)(a1 + 368);
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  int v10 = 138412546;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint8_t v13 = v9;
  _os_log_debug_impl(&dword_259DA0000, v5, OS_LOG_TYPE_DEBUG, "Choosing standard screen size: %@, fps: %@", (uint8_t *)&v10, 0x16u);
}

@end