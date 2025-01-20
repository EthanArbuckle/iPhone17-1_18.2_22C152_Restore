@interface SKUIOffscreenRenderOperation
+ (void)preheatOffscreenRenderOperations;
- (SKUIOffscreenRenderOperation)init;
- (UIImage)outputImage;
- (id)createLayerBlock;
- (void)init;
- (void)main;
- (void)setCreateLayerBlock:(id)a3;
@end

@implementation SKUIOffscreenRenderOperation

- (SKUIOffscreenRenderOperation)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOffscreenRenderOperation init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIOffscreenRenderOperation;
  v3 = [(SKUIOffscreenRenderOperation *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUIOffscreenRenderOperation.accessQueu", MEMORY[0x1E4F14430]);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)main
{
  v134[5] = *MEMORY[0x1E4F143B8];
  if (([(SKUIOffscreenRenderOperation *)self isCancelled] & 1) == 0)
  {
    double v3 = CACurrentMediaTime();
    dispatch_queue_t v4 = [(SKUIOffscreenRenderOperation *)self createLayerBlock];
    id v126 = 0;
    id v127 = 0;
    _SKUIOffscreenRenderOperationPopRenderingContext(&v127, &v126);
    id v5 = v127;
    id v6 = v126;
    objc_super v7 = v6;
    if (!v5 || !v6) {
      goto LABEL_148;
    }
    v8 = [getEAGLContextClass() currentContext];
    [getEAGLContextClass() setCurrentContext:v7];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v125.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v125.size = v9;
    if (!v4
      || (((void (**)(void, CGRect *))v4)[2](v4, &v125),
          id v119 = (id)objc_claimAutoreleasedReturnValue(),
          v119,
          !v119))
    {
LABEL_147:
      [getEAGLContextClass() setCurrentContext:v8];
      _SKUIOffscreenRenderOperationPushRenderingContext(v5, v7);

LABEL_148:
      CFTimeInterval v110 = CACurrentMediaTime();
      NSLog(&cfstr_Skuioffscreenr_2.isa, v110 - v3);

      return;
    }
    if (CGRectIsNull(v125))
    {
      [v119 bounds];
      v125.origin.x = v10;
      v125.origin.y = v11;
      v125.size.width = v12;
      v125.size.height = v13;
    }
    [v119 contentsScale];
    double v15 = v14;
    [v119 rasterizationScale];
    double v17 = v16;
    v118 = [MEMORY[0x1E4F39BE8] layer];
    [v118 setContentsScale:v15];
    [v118 addSublayer:v119];
    objc_msgSend(v118, "convertRect:fromLayer:", v119, *(_OWORD *)&v125.origin, *(_OWORD *)&v125.size);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    memset(&v124, 0, sizeof(v124));
    CATransform3DMakeScale(&v124, 1.0, -1.0, 1.0);
    CATransform3D v123 = v124;
    [v118 setTransform:&v123];
    [v5 setLayer:v118];
    objc_msgSend(v5, "setBounds:", v19, v21, v23, v25);
    [MEMORY[0x1E4F39CF8] commit];
    [MEMORY[0x1E4F39CF8] flush];
    if ([(SKUIOffscreenRenderOperation *)self isCancelled])
    {
LABEL_146:

      goto LABEL_147;
    }
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v26 = (id *)getkIOSurfaceWidthSymbolLoc_ptr;
    v132 = (void *)getkIOSurfaceWidthSymbolLoc_ptr;
    if (!getkIOSurfaceWidthSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getkIOSurfaceWidthSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v27 = (void *)IOSurfaceLibrary();
      v28 = dlsym(v27, "kIOSurfaceWidth");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v28;
      getkIOSurfaceWidthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v26 = (id *)v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (!v26) {
      goto LABEL_150;
    }
    id v29 = *v26;
    v133[0] = v29;
    v135.origin.x = v19;
    v135.origin.y = v21;
    v135.size.width = v23;
    v135.size.height = v25;
    v116 = [NSNumber numberWithDouble:v17 * CGRectGetWidth(v135)];
    v134[0] = v116;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v30 = (id *)getkIOSurfaceHeightSymbolLoc_ptr;
    v132 = (void *)getkIOSurfaceHeightSymbolLoc_ptr;
    if (!getkIOSurfaceHeightSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getkIOSurfaceHeightSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v31 = (void *)IOSurfaceLibrary();
      v32 = dlsym(v31, "kIOSurfaceHeight");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v32;
      getkIOSurfaceHeightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v30 = (id *)v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (!v30) {
      goto LABEL_150;
    }
    id v112 = *v30;
    v133[1] = v112;
    v136.origin.x = v19;
    v136.origin.y = v21;
    v136.size.width = v23;
    v136.size.height = v25;
    v33 = [NSNumber numberWithDouble:v17 * CGRectGetHeight(v136)];
    v134[1] = v33;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v34 = (id *)getkIOSurfaceBytesPerElementSymbolLoc_ptr;
    v132 = (void *)getkIOSurfaceBytesPerElementSymbolLoc_ptr;
    if (!getkIOSurfaceBytesPerElementSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getkIOSurfaceBytesPerElementSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v35 = (void *)IOSurfaceLibrary();
      v36 = dlsym(v35, "kIOSurfaceBytesPerElement");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v36;
      getkIOSurfaceBytesPerElementSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v34 = (id *)v130[3];
    }
    v113 = v29;
    v37 = v8;
    _Block_object_dispose(&v129, 8);
    if (!v34) {
      goto LABEL_150;
    }
    id v38 = *v34;
    v133[2] = v38;
    v134[2] = &unk_1F1D61D78;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v39 = (id *)getkIOSurfacePixelFormatSymbolLoc_ptr;
    v132 = (void *)getkIOSurfacePixelFormatSymbolLoc_ptr;
    if (!getkIOSurfacePixelFormatSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getkIOSurfacePixelFormatSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v40 = (void *)IOSurfaceLibrary();
      v41 = dlsym(v40, "kIOSurfacePixelFormat");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v41;
      getkIOSurfacePixelFormatSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v39 = (id *)v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (!v39) {
      goto LABEL_150;
    }
    id v42 = *v39;
    v133[3] = v42;
    v134[3] = &unk_1F1D61D90;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v43 = (id *)getkIOSurfaceIsGlobalSymbolLoc_ptr;
    v132 = (void *)getkIOSurfaceIsGlobalSymbolLoc_ptr;
    if (!getkIOSurfaceIsGlobalSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getkIOSurfaceIsGlobalSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v44 = (void *)IOSurfaceLibrary();
      v45 = dlsym(v44, "kIOSurfaceIsGlobal");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v45;
      getkIOSurfaceIsGlobalSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v43 = (id *)v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (!v43) {
      goto LABEL_150;
    }
    id v46 = *v43;
    v133[4] = v46;
    v134[4] = MEMORY[0x1E4F1CC28];
    v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:5];
    v8 = v37;

    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v47 = (uint64_t (*)(void *))getIOSurfaceCreateSymbolLoc_ptr;
    v132 = getIOSurfaceCreateSymbolLoc_ptr;
    if (!getIOSurfaceCreateSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getIOSurfaceCreateSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v48 = (void *)IOSurfaceLibrary();
      v49 = dlsym(v48, "IOSurfaceCreate");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v49;
      getIOSurfaceCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v47 = (uint64_t (*)(void *))v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (!v47) {
      goto LABEL_150;
    }
    v50 = (const void *)v47(v115);
    if (!v50)
    {
LABEL_138:
      uint64_t Error = _SKUIglGetError();
      v109 = "invalid operation";
      switch((int)Error)
      {
        case 1280:
          v109 = "invalid enum";
          goto LABEL_144;
        case 1281:
          v109 = "invalid value";
          goto LABEL_144;
        case 1282:
          goto LABEL_144;
        case 1283:
        case 1284:
          goto LABEL_141;
        case 1285:
          v109 = "out of memory";
          goto LABEL_144;
        default:
          if (Error)
          {
LABEL_141:
            v109 = "unknown error";
LABEL_144:
            NSLog(&cfstr_Skuioffscreenr_0.isa, "-[SKUIOffscreenRenderOperation main]", 168, Error, v109);
          }

          break;
      }
      goto LABEL_146;
    }
    uint64_t v122 = 0;
    id v117 = v7;
    HIDWORD(v128) = 0;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x2020000000;
    v51 = (void (*)(uint64_t, char *))getglGenTexturesSymbolLoc_ptr;
    v132 = getglGenTexturesSymbolLoc_ptr;
    if (!getglGenTexturesSymbolLoc_ptr)
    {
      *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
      *(void *)&v123.m12 = 3221225472;
      *(void *)&v123.m13 = __getglGenTexturesSymbolLoc_block_invoke;
      *(void *)&v123.m14 = &unk_1E6424310;
      *(void *)&v123.m21 = &v129;
      v52 = (void *)OpenGLESLibrary();
      v53 = dlsym(v52, "glGenTextures");
      *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v53;
      getglGenTexturesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8) + 24);
      v51 = (void (*)(uint64_t, char *))v130[3];
    }
    _Block_object_dispose(&v129, 8);
    if (v51)
    {
      v51(1, (char *)&v128 + 4);
      uint64_t v54 = _SKUIglGetError();
      v55 = "invalid operation";
      switch((int)v54)
      {
        case 1280:
          v55 = "invalid enum";
          goto LABEL_37;
        case 1281:
          v55 = "invalid value";
          goto LABEL_37;
        case 1282:
          goto LABEL_37;
        case 1283:
        case 1284:
          goto LABEL_34;
        case 1285:
          v55 = "out of memory";
          goto LABEL_37;
        default:
          if (v54)
          {
LABEL_34:
            v55 = "unknown error";
LABEL_37:
            NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 248, v54, v55);
          }
          _SKUIglBindTexture(HIDWORD(v128));
          uint64_t v56 = _SKUIglGetError();
          v57 = "invalid operation";
          switch((int)v56)
          {
            case 1280:
              v57 = "invalid enum";
              goto LABEL_44;
            case 1281:
              v57 = "invalid value";
              goto LABEL_44;
            case 1282:
              goto LABEL_44;
            case 1283:
            case 1284:
              goto LABEL_41;
            case 1285:
              v57 = "out of memory";
              goto LABEL_44;
            default:
              if (v56)
              {
LABEL_41:
                v57 = "unknown error";
LABEL_44:
                NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 252, v56, v57);
              }
              uint64_t v129 = 0;
              v130 = &v129;
              uint64_t v131 = 0x2020000000;
              v58 = (uint64_t (*)(const void *))getIOSurfaceGetWidthSymbolLoc_ptr;
              v132 = getIOSurfaceGetWidthSymbolLoc_ptr;
              if (!getIOSurfaceGetWidthSymbolLoc_ptr)
              {
                *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                *(void *)&v123.m12 = 3221225472;
                *(void *)&v123.m13 = __getIOSurfaceGetWidthSymbolLoc_block_invoke;
                *(void *)&v123.m14 = &unk_1E6424310;
                *(void *)&v123.m21 = &v129;
                v59 = (void *)IOSurfaceLibrary();
                v60 = dlsym(v59, "IOSurfaceGetWidth");
                *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v60;
                getIOSurfaceGetWidthSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8) + 24);
                v58 = (uint64_t (*)(const void *))v130[3];
              }
              _Block_object_dispose(&v129, 8);
              if (!v58) {
                goto LABEL_150;
              }
              uint64_t v114 = v58(v50);
              uint64_t v129 = 0;
              v130 = &v129;
              uint64_t v131 = 0x2020000000;
              v61 = (uint64_t (*)(const void *))getIOSurfaceGetHeightSymbolLoc_ptr;
              v132 = getIOSurfaceGetHeightSymbolLoc_ptr;
              if (!getIOSurfaceGetHeightSymbolLoc_ptr)
              {
                *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                *(void *)&v123.m12 = 3221225472;
                *(void *)&v123.m13 = __getIOSurfaceGetHeightSymbolLoc_block_invoke;
                *(void *)&v123.m14 = &unk_1E6424310;
                *(void *)&v123.m21 = &v129;
                v62 = (void *)IOSurfaceLibrary();
                v63 = dlsym(v62, "IOSurfaceGetHeight");
                *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v63;
                getIOSurfaceGetHeightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8) + 24);
                v61 = (uint64_t (*)(const void *))v130[3];
              }
              _Block_object_dispose(&v129, 8);
              if (!v61) {
                goto LABEL_150;
              }
              uint64_t v64 = v61(v50);
              BYTE4(v111) = 0;
              LODWORD(v111) = 0;
              objc_msgSend(v117, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v50, 3553, 6408, v114, v64, 32993, 33639, v111);
              uint64_t v65 = _SKUIglGetError();
              v66 = "invalid operation";
              switch((int)v65)
              {
                case 1280:
                  v66 = "invalid enum";
                  goto LABEL_57;
                case 1281:
                  v66 = "invalid value";
                  goto LABEL_57;
                case 1282:
                  goto LABEL_57;
                case 1283:
                case 1284:
                  goto LABEL_54;
                case 1285:
                  v66 = "out of memory";
                  goto LABEL_57;
                default:
                  if (v65)
                  {
LABEL_54:
                    v66 = "unknown error";
LABEL_57:
                    NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 257, v65, v66);
                  }
                  _SKUIglTexParameteri(10241, 9728);
                  _SKUIglTexParameteri(10240, 9728);
                  _SKUIglTexParameteri(10242, 33071);
                  _SKUIglTexParameteri(10243, 33071);
                  uint64_t v67 = _SKUIglGetError();
                  v68 = "invalid operation";
                  switch((int)v67)
                  {
                    case 1280:
                      v68 = "invalid enum";
                      goto LABEL_64;
                    case 1281:
                      v68 = "invalid value";
                      goto LABEL_64;
                    case 1282:
                      goto LABEL_64;
                    case 1283:
                    case 1284:
                      goto LABEL_61;
                    case 1285:
                      v68 = "out of memory";
                      goto LABEL_64;
                    default:
                      if (v67)
                      {
LABEL_61:
                        v68 = "unknown error";
LABEL_64:
                        NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 263, v67, v68);
                      }
                      _SKUIglBindTexture(0);
                      uint64_t v69 = _SKUIglGetError();
                      v70 = "invalid operation";
                      switch((int)v69)
                      {
                        case 1280:
                          v70 = "invalid enum";
                          goto LABEL_71;
                        case 1281:
                          v70 = "invalid value";
                          goto LABEL_71;
                        case 1282:
                          goto LABEL_71;
                        case 1283:
                        case 1284:
                          goto LABEL_68;
                        case 1285:
                          v70 = "out of memory";
                          goto LABEL_71;
                        default:
                          if (v69)
                          {
LABEL_68:
                            v70 = "unknown error";
LABEL_71:
                            NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 266, v69, v70);
                          }
                          LODWORD(v128) = 0;
                          uint64_t v129 = 0;
                          v130 = &v129;
                          uint64_t v131 = 0x2020000000;
                          v71 = (void (*)(uint64_t, uint64_t *))getglGenFramebuffersSymbolLoc_ptr;
                          v132 = getglGenFramebuffersSymbolLoc_ptr;
                          if (!getglGenFramebuffersSymbolLoc_ptr)
                          {
                            *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                            *(void *)&v123.m12 = 3221225472;
                            *(void *)&v123.m13 = __getglGenFramebuffersSymbolLoc_block_invoke;
                            *(void *)&v123.m14 = &unk_1E6424310;
                            *(void *)&v123.m21 = &v129;
                            v72 = (void *)OpenGLESLibrary();
                            v73 = dlsym(v72, "glGenFramebuffers");
                            *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v73;
                            getglGenFramebuffersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8)
                                                                             + 24);
                            v71 = (void (*)(uint64_t, uint64_t *))v130[3];
                          }
                          _Block_object_dispose(&v129, 8);
                          if (!v71) {
                            goto LABEL_150;
                          }
                          v71(1, &v128);
                          _SKUIglBindFramebuffer(v128);
                          uint64_t v74 = HIDWORD(v128);
                          uint64_t v129 = 0;
                          v130 = &v129;
                          uint64_t v131 = 0x2020000000;
                          v75 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))getglFramebufferTexture2DSymbolLoc_ptr;
                          v132 = getglFramebufferTexture2DSymbolLoc_ptr;
                          if (!getglFramebufferTexture2DSymbolLoc_ptr)
                          {
                            *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                            *(void *)&v123.m12 = 3221225472;
                            *(void *)&v123.m13 = __getglFramebufferTexture2DSymbolLoc_block_invoke;
                            *(void *)&v123.m14 = &unk_1E6424310;
                            *(void *)&v123.m21 = &v129;
                            v76 = (void *)OpenGLESLibrary();
                            v77 = dlsym(v76, "glFramebufferTexture2D");
                            *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v77;
                            getglFramebufferTexture2DSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21
                                                                                              + 8)
                                                                                  + 24);
                            v75 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))v130[3];
                          }
                          _Block_object_dispose(&v129, 8);
                          if (!v75) {
                            goto LABEL_150;
                          }
                          v75(36160, 36064, 3553, v74, 0);
                          uint64_t v78 = _SKUIglGetError();
                          v79 = "invalid operation";
                          switch((int)v78)
                          {
                            case 1280:
                              v79 = "invalid enum";
                              goto LABEL_84;
                            case 1281:
                              v79 = "invalid value";
                              goto LABEL_84;
                            case 1282:
                              goto LABEL_84;
                            case 1283:
                            case 1284:
                              goto LABEL_81;
                            case 1285:
                              v79 = "out of memory";
                              goto LABEL_84;
                            default:
                              if (v78)
                              {
LABEL_81:
                                v79 = "unknown error";
LABEL_84:
                                NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 273, v78, v79);
                              }
                              uint64_t v129 = 0;
                              v130 = &v129;
                              uint64_t v131 = 0x2020000000;
                              v80 = getglViewportSymbolLoc_ptr;
                              v132 = getglViewportSymbolLoc_ptr;
                              if (!getglViewportSymbolLoc_ptr)
                              {
                                *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                                *(void *)&v123.m12 = 3221225472;
                                *(void *)&v123.m13 = __getglViewportSymbolLoc_block_invoke;
                                *(void *)&v123.m14 = &unk_1E6424310;
                                *(void *)&v123.m21 = &v129;
                                v81 = (void *)OpenGLESLibrary();
                                v82 = dlsym(v81, "glViewport");
                                *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v82;
                                getglViewportSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8)
                                                                          + 24);
                                v80 = (void *)v130[3];
                              }
                              _Block_object_dispose(&v129, 8);
                              if (!v80) {
                                goto LABEL_150;
                              }
                              ((void (*)(void, void, uint64_t, uint64_t))v80)(0, 0, v114, v64);
                              uint64_t v83 = _SKUIglGetError();
                              v84 = "invalid operation";
                              switch((int)v83)
                              {
                                case 1280:
                                  v84 = "invalid enum";
                                  goto LABEL_94;
                                case 1281:
                                  v84 = "invalid value";
                                  goto LABEL_94;
                                case 1282:
                                  goto LABEL_94;
                                case 1283:
                                case 1284:
                                  goto LABEL_91;
                                case 1285:
                                  v84 = "out of memory";
                                  goto LABEL_94;
                                default:
                                  if (v83)
                                  {
LABEL_91:
                                    v84 = "unknown error";
LABEL_94:
                                    NSLog(&cfstr_Skuioffscreenr_0.isa, "_SKUIOffscreenRenderOperationBindSurfaceToFramebuffer", 276, v83, v84);
                                  }
                                  uint64_t v122 = v128;

                                  uint64_t v129 = 0;
                                  v130 = &v129;
                                  uint64_t v131 = 0x2020000000;
                                  v85 = (void (*)(double, double, double, double))getglClearColorSymbolLoc_ptr;
                                  v132 = getglClearColorSymbolLoc_ptr;
                                  if (!getglClearColorSymbolLoc_ptr)
                                  {
                                    *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                                    *(void *)&v123.m12 = 3221225472;
                                    *(void *)&v123.m13 = __getglClearColorSymbolLoc_block_invoke;
                                    *(void *)&v123.m14 = &unk_1E6424310;
                                    *(void *)&v123.m21 = &v129;
                                    v86 = (void *)OpenGLESLibrary();
                                    v87 = dlsym(v86, "glClearColor");
                                    *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v87;
                                    getglClearColorSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8)
                                                                                + 24);
                                    v85 = (void (*)(double, double, double, double))v130[3];
                                  }
                                  _Block_object_dispose(&v129, 8);
                                  if (!v85) {
                                    goto LABEL_150;
                                  }
                                  v85(0.0, 0.0, 0.0, 0.0);
                                  uint64_t v129 = 0;
                                  v130 = &v129;
                                  uint64_t v131 = 0x2020000000;
                                  v88 = (void (*)(uint64_t))getglClearSymbolLoc_ptr;
                                  v132 = getglClearSymbolLoc_ptr;
                                  if (!getglClearSymbolLoc_ptr)
                                  {
                                    *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
                                    *(void *)&v123.m12 = 3221225472;
                                    *(void *)&v123.m13 = __getglClearSymbolLoc_block_invoke;
                                    *(void *)&v123.m14 = &unk_1E6424310;
                                    *(void *)&v123.m21 = &v129;
                                    v89 = (void *)OpenGLESLibrary();
                                    v90 = dlsym(v89, "glClear");
                                    *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v90;
                                    getglClearSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8)
                                                                           + 24);
                                    v88 = (void (*)(uint64_t))v130[3];
                                  }
                                  _Block_object_dispose(&v129, 8);
                                  if (!v88) {
                                    goto LABEL_150;
                                  }
                                  v88(0x4000);
                                  [v5 beginFrameAtTime:0 timeStamp:0.0];
                                  uint64_t v91 = _SKUIglGetError();
                                  v92 = "invalid operation";
                                  switch((int)v91)
                                  {
                                    case 1280:
                                      v92 = "invalid enum";
                                      goto LABEL_107;
                                    case 1281:
                                      v92 = "invalid value";
                                      goto LABEL_107;
                                    case 1282:
                                      goto LABEL_107;
                                    case 1283:
                                    case 1284:
                                      goto LABEL_104;
                                    case 1285:
                                      v92 = "out of memory";
                                      goto LABEL_107;
                                    default:
                                      if (v91)
                                      {
LABEL_104:
                                        v92 = "unknown error";
LABEL_107:
                                        NSLog(&cfstr_Skuioffscreenr_0.isa, "-[SKUIOffscreenRenderOperation main]", 147, v91, v92);
                                      }
                                      [v5 render];
                                      uint64_t v93 = _SKUIglGetError();
                                      v94 = "invalid operation";
                                      switch((int)v93)
                                      {
                                        case 1280:
                                          v94 = "invalid enum";
                                          goto LABEL_114;
                                        case 1281:
                                          v94 = "invalid value";
                                          goto LABEL_114;
                                        case 1282:
                                          goto LABEL_114;
                                        case 1283:
                                        case 1284:
                                          goto LABEL_111;
                                        case 1285:
                                          v94 = "out of memory";
                                          goto LABEL_114;
                                        default:
                                          if (v93)
                                          {
LABEL_111:
                                            v94 = "unknown error";
LABEL_114:
                                            NSLog(&cfstr_Skuioffscreenr_0.isa, "-[SKUIOffscreenRenderOperation main]", 149, v93, v94);
                                          }
                                          break;
                                      }
                                      break;
                                  }
                                  break;
                              }
                              break;
                          }
                          break;
                      }
                      break;
                  }
                  break;
              }
              break;
          }
          break;
      }
      [v5 endFrame];
      uint64_t v95 = _SKUIglGetError();
      v96 = "invalid operation";
      switch((int)v95)
      {
        case 1280:
          v96 = "invalid enum";
          goto LABEL_121;
        case 1281:
          v96 = "invalid value";
          goto LABEL_121;
        case 1282:
          goto LABEL_121;
        case 1283:
        case 1284:
          goto LABEL_118;
        case 1285:
          v96 = "out of memory";
          goto LABEL_121;
        default:
          if (v95)
          {
LABEL_118:
            v96 = "unknown error";
LABEL_121:
            NSLog(&cfstr_Skuioffscreenr_0.isa, "-[SKUIOffscreenRenderOperation main]", 151, v95, v96);
          }
          [v5 setLayer:0];
          _SKUIglBindFramebuffer(0);
          uint64_t v129 = 0;
          v130 = &v129;
          uint64_t v131 = 0x2020000000;
          v97 = (void (*)(uint64_t, uint64_t *))getglDeleteFramebuffersSymbolLoc_ptr;
          v132 = getglDeleteFramebuffersSymbolLoc_ptr;
          if (!getglDeleteFramebuffersSymbolLoc_ptr)
          {
            *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
            *(void *)&v123.m12 = 3221225472;
            *(void *)&v123.m13 = __getglDeleteFramebuffersSymbolLoc_block_invoke;
            *(void *)&v123.m14 = &unk_1E6424310;
            *(void *)&v123.m21 = &v129;
            v98 = (void *)OpenGLESLibrary();
            v99 = dlsym(v98, "glDeleteFramebuffers");
            *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v99;
            getglDeleteFramebuffersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8) + 24);
            v97 = (void (*)(uint64_t, uint64_t *))v130[3];
          }
          _Block_object_dispose(&v129, 8);
          if (!v97) {
            goto LABEL_150;
          }
          v97(1, &v122);
          uint64_t v129 = 0;
          v130 = &v129;
          uint64_t v131 = 0x2020000000;
          v100 = (void (*)(uint64_t, char *))getglDeleteTexturesSymbolLoc_ptr;
          v132 = getglDeleteTexturesSymbolLoc_ptr;
          if (!getglDeleteTexturesSymbolLoc_ptr)
          {
            *(void *)&v123.m11 = MEMORY[0x1E4F143A8];
            *(void *)&v123.m12 = 3221225472;
            *(void *)&v123.m13 = __getglDeleteTexturesSymbolLoc_block_invoke;
            *(void *)&v123.m14 = &unk_1E6424310;
            *(void *)&v123.m21 = &v129;
            v101 = (void *)OpenGLESLibrary();
            v102 = dlsym(v101, "glDeleteTextures");
            *(void *)(*(void *)(*(void *)&v123.m21 + 8) + 24) = v102;
            getglDeleteTexturesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v123.m21 + 8) + 24);
            v100 = (void (*)(uint64_t, char *))v130[3];
          }
          _Block_object_dispose(&v129, 8);
          if (v100)
          {
            v100(1, (char *)&v122 + 4);
            uint64_t v103 = _SKUIglGetError();
            v104 = "invalid operation";
            switch((int)v103)
            {
              case 1280:
                v104 = "invalid enum";
                goto LABEL_134;
              case 1281:
                v104 = "invalid value";
                goto LABEL_134;
              case 1282:
                goto LABEL_134;
              case 1283:
              case 1284:
                goto LABEL_131;
              case 1285:
                v104 = "out of memory";
                goto LABEL_134;
              default:
                if (v103)
                {
LABEL_131:
                  v104 = "unknown error";
LABEL_134:
                  NSLog(&cfstr_Skuioffscreenr_0.isa, "-[SKUIOffscreenRenderOperation main]", 158, v103, v104);
                }
                v105 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) _initWithIOSurface:v50 scale:0 orientation:v17];
                v106 = v105;
                if (v105)
                {
                  accessQueue = self->_accessQueue;
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __36__SKUIOffscreenRenderOperation_main__block_invoke;
                  block[3] = &unk_1E6421FF8;
                  block[4] = self;
                  id v121 = v105;
                  dispatch_barrier_async(accessQueue, block);
                }
                CFRelease(v50);

                break;
            }
            goto LABEL_138;
          }
          getCNComposeRecipientViewDidChangeNotification_cold_1();
          break;
      }
    }
    else
    {
LABEL_150:
      getCNComposeRecipientViewDidChangeNotification_cold_1();
    }
    __break(1u);
  }
}

void __36__SKUIOffscreenRenderOperation_main__block_invoke(uint64_t a1)
{
}

- (id)createLayerBlock
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CGSize v9 = __Block_byref_object_copy__44;
  CGFloat v10 = __Block_byref_object_dispose__44;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SKUIOffscreenRenderOperation_createLayerBlock__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  double v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__SKUIOffscreenRenderOperation_createLayerBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 256) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (UIImage)outputImage
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CGSize v9 = __Block_byref_object_copy__17;
  CGFloat v10 = __Block_byref_object_dispose__18;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SKUIOffscreenRenderOperation_outputImage__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIImage *)v3;
}

void __43__SKUIOffscreenRenderOperation_outputImage__block_invoke(uint64_t a1)
{
}

- (void)setCreateLayerBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SKUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke;
  v7[3] = &unk_1E6423820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __52__SKUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 256);
  *(void *)(v3 + 256) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

+ (void)preheatOffscreenRenderOperations
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIOffscreenRenderOperation preheatOffscreenRenderOperations]";
}

void __64__SKUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke()
{
  int v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  NSLog(&cfstr_Skuioffscreenr_4.isa, 2);
  char v1 = 1;
  double v2 = CACurrentMediaTime();
  do
  {
    char v3 = v1;
    id v12 = 0;
    id v13 = 0;
    _SKUIOffscreenRenderOperationPopRenderingContext(&v13, &v12);
    id v4 = v13;
    id v5 = v12;
    if (v5) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      [v0 addObject:v4];
      [v0 addObject:v5];
    }

    char v1 = 0;
  }
  while ((v3 & 1) != 0);
  if ((unint64_t)[v0 count] >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = [v0 objectAtIndex:v7 - 1];
      CGSize v9 = [v0 objectAtIndex:v7];
      _SKUIOffscreenRenderOperationPushRenderingContext(v8, v9);

      v7 += 2;
    }
    while (v7 < [v0 count]);
  }
  CFTimeInterval v10 = CACurrentMediaTime();
  NSLog(&cfstr_Skuioffscreenr_5.isa, 2, v10 - v2);
  id v11 = dispatch_get_global_queue(0, 0);
  dispatch_async(v11, &__block_literal_global_27);
}

void __64__SKUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke_2()
{
  NSLog(&cfstr_Skuioffscreenr_6.isa);
  double v0 = CACurrentMediaTime();
  IOSurfaceLibrary();
  OpenGLESLibrary();
  CFTimeInterval v1 = CACurrentMediaTime();
  NSLog(&cfstr_Skuioffscreenr_7.isa, v1 - v0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong(&self->_createLayerBlock, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  CFTimeInterval v1 = "-[SKUIOffscreenRenderOperation init]";
}

@end