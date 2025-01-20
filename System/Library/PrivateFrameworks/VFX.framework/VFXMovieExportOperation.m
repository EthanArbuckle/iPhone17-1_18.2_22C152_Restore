@interface VFXMovieExportOperation
- (CGImage)_copySnapshot:(CGSize)a3;
- (VFXMovieExportOperation)initWithRenderer:(id)a3 size:(CGSize)a4 attributes:(id)a5 outputURL:(id)a6;
- (void)_finishedExport;
- (void)appendImage:(CGImage *)a3 withPresentationTime:(id *)a4 usingAdaptor:(id)a5;
- (void)dealloc;
- (void)main;
- (void)renderAndAppendWithPresentationTime:(id *)a3 usingAdaptor:(id)a4 metalTextureCache:(__CVMetalTextureCache *)a5 cvQueue:(id)a6 completionBlock:(id)a7;
@end

@implementation VFXMovieExportOperation

- (VFXMovieExportOperation)initWithRenderer:(id)a3 size:(CGSize)a4 attributes:(id)a5 outputURL:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v160.receiver = self;
  v160.super_class = (Class)VFXMovieExportOperation;
  v11 = [(VFXMovieExportOperation *)&v160 init];
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setAntialiasingMode_(v11, v12, 2, v13);
    id v20 = (id)objc_msgSend_mutableCopy(a5, v15, v16, v17);
    if (!v20) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_msgSend_removeObjectForKey_(v20, v18, @"kExportPointOfViewAttribute", v19);
    v23 = objc_msgSend_valueForKey_(v20, v21, @"rate", v22);
    objc_msgSend_floatValue(v23, v24, v25, v26);
    v14->_rate = v27;
    objc_msgSend_removeObjectForKey_(v20, v28, @"rate", v29);
    if (v14->_rate == 0.0) {
      v14->_rate = 0.033333;
    }
    v32 = objc_msgSend_valueForKey_(v20, v30, @"VFXExportMovieFrameRate", v31);
    int v36 = objc_msgSend_intValue(v32, v33, v34, v35);
    objc_msgSend_removeObjectForKey_(v20, v37, @"VFXExportMovieFrameRate", v38);
    if (v36) {
      v14->_rate = 1.0 / (float)v36;
    }
    v41 = objc_msgSend_valueForKey_(v20, v39, @"VFXExportMovieMirrored", v40);
    v14->_mirrored = objc_msgSend_BOOLValue(v41, v42, v43, v44);
    objc_msgSend_removeObjectForKey_(v20, v45, @"VFXExportMovieMirrored", v46);
    v49 = objc_msgSend_valueForKey_(v20, v47, @"VFXExportMovieSupersamplingFactor", v48);
    objc_msgSend_floatValue(v49, v50, v51, v52);
    v14->_supersampling = v53;
    objc_msgSend_removeObjectForKey_(v20, v54, @"VFXExportMovieSupersamplingFactor", v55);
    if (v14->_supersampling == 0.0) {
      v14->_supersampling = 1.0;
    }
    objc_msgSend_removeObjectForKey_(v20, v56, @"QTAddImageCodecType", v57);
    objc_msgSend_removeObjectForKey_(v20, v58, @"QTMovieRateAttribute", v59);
    uint64_t v60 = *MEMORY[0x1E4F16220];
    if (!objc_msgSend_objectForKey_(v20, v61, *MEMORY[0x1E4F16220], v62)) {
      objc_msgSend_setValue_forKey_(v20, v63, *MEMORY[0x1E4F16210], v60);
    }
    uint64_t v65 = objc_msgSend_numberWithInt_(NSNumber, v63, (int)width, v64);
    objc_msgSend_setValue_forKey_(v20, v66, v65, *MEMORY[0x1E4F16300]);
    uint64_t v69 = objc_msgSend_numberWithInt_(NSNumber, v67, (int)height, v68);
    objc_msgSend_setValue_forKey_(v20, v70, v69, *MEMORY[0x1E4F162A0]);
    id v71 = objc_alloc(MEMORY[0x1E4F163C0]);
    v14->_assetWriterInput = (AVAssetWriterInput *)objc_msgSend_initWithMediaType_outputSettings_(v71, v72, *MEMORY[0x1E4F15C18], (uint64_t)v20);
    v76 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v73, v74, v75);
    objc_msgSend_setExpectsMediaDataInRealTime_(v14->_assetWriterInput, v77, 0, v78);
    uint64_t v81 = objc_msgSend_numberWithInt_(NSNumber, v79, 1111970369, v80);
    objc_msgSend_setObject_forKey_(v76, v82, v81, *MEMORY[0x1E4F24D70]);
    uint64_t v85 = objc_msgSend_numberWithInt_(NSNumber, v83, (int)width, v84);
    objc_msgSend_setObject_forKey_(v76, v86, v85, *MEMORY[0x1E4F24E10]);
    uint64_t v89 = objc_msgSend_numberWithInt_(NSNumber, v87, (int)height, v88);
    objc_msgSend_setObject_forKey_(v76, v90, v89, *MEMORY[0x1E4F24D08]);
    uint64_t v94 = objc_msgSend_device(a3, v91, v92, v93);
    v96 = (uint64_t *)MEMORY[0x1E4F24CA8];
    if (v94) {
      v96 = (uint64_t *)MEMORY[0x1E4F24D40];
    }
    objc_msgSend_setObject_forKey_(v76, v95, MEMORY[0x1E4F1CC38], *v96);
    id v97 = objc_alloc(MEMORY[0x1E4F163D8]);
    v14->_avAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)objc_msgSend_initWithAssetWriterInput_sourcePixelBufferAttributes_(v97, v98, (uint64_t)v14->_assetWriterInput, (uint64_t)v76);
    uint64_t v159 = 0;
    v102 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v99, v100, v101);
    objc_msgSend_removeItemAtURL_error_(v102, v103, (uint64_t)a6, 0);
    id v104 = objc_alloc(MEMORY[0x1E4F163B8]);
    v106 = (AVAssetWriter *)objc_msgSend_initWithURL_fileType_error_(v104, v105, (uint64_t)a6, *MEMORY[0x1E4F15AB0], &v159);
    v14->_assetWriter = v106;
    if (objc_msgSend_status(v106, v107, v108, v109) == 3)
    {
      sub_1B63F2F54(16, @"Error: AVAssetWriter can't create a movie at %@ (error:%@)", v111, v112, v113, v114, v115, v116, (uint64_t)a6);

      return 0;
    }
    else
    {
      objc_msgSend_addInput_(v14->_assetWriter, v110, (uint64_t)v14->_assetWriterInput, v112);
      objc_msgSend_startWriting(v14->_assetWriter, v117, v118, v119);
      assetWriter = v14->_assetWriter;
      v158[0] = 0;
      v158[1] = 0x100000001;
      v158[2] = 0;
      objc_msgSend_startSessionAtSourceTime_(assetWriter, v121, (uint64_t)v158, v122);
      objc_msgSend_setRenderer_(v14, v123, (uint64_t)a3, v124);
      objc_msgSend_setSize_(v14, v125, v126, v127, width, height);
      objc_msgSend_setAttributes_(v14, v128, (uint64_t)v20, v129);
      v133 = objc_msgSend_world(a3, v130, v131, v132);
      objc_msgSend_startTime(v133, v134, v135, v136);
      objc_msgSend_setStartTime_(v14, v137, v138, v139);
      v143 = objc_msgSend_world(a3, v140, v141, v142);
      objc_msgSend_endTime(v143, v144, v145, v146);
      objc_msgSend_setEndTime_(v14, v147, v148, v149);
      objc_msgSend_setOutputURL_(v14, v150, (uint64_t)a6, v151);
      uint64_t v154 = objc_msgSend_objectForKey_(a5, v152, @"kExportPointOfViewAttribute", v153);
      objc_msgSend_setPointOfView_(v14, v155, v154, v156);
    }
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMovieExportOperation;
  [(_VFXExportOperation *)&v3 dealloc];
}

- (CGImage)_copySnapshot:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v11 = objc_msgSend_renderer(self, a2, v3, v4);
  double systemTime = self->super._systemTime;
  if (systemTime == 0.0) {
    CFTimeInterval v13 = CACurrentMediaTime();
  }
  else {
    CFTimeInterval v13 = systemTime + self->_rate;
  }
  self->super._double systemTime = v13;
  objc_msgSend_updateAtTime_(v11, v8, v9, v10);
  uint64_t v17 = objc_msgSend_snapshotWithSize_(v11, v14, v15, v16, width, height);
  v21 = (CGImage *)objc_msgSend_CGImage(v17, v18, v19, v20);

  return CGImageRetain(v21);
}

- (void)_finishedExport
{
  if (!objc_msgSend_error(self, a2, v2, v3)) {
    objc_msgSend_setSucceded_(self, v5, 1, v7);
  }
  v8 = objc_msgSend_delegate(self, v5, v6, v7);
  objc_msgSend_didEndSelector(self, v9, v10, v11);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = (const char *)objc_msgSend_didEndSelector(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_userInfo(self, v16, v17, v18);
    objc_msgSend(v8, v15, self, v19);
  }
}

- (void)appendImage:(CGImage *)a3 withPresentationTime:(id *)a4 usingAdaptor:(id)a5
{
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v10 = objc_msgSend_pixelBufferPool(a5, a2, (uint64_t)a3, (uint64_t)a4);
  if (v10)
  {
    uint64_t v17 = (__CVPixelBufferPool *)v10;
    unint64_t Width = CGImageGetWidth(a3);
    unint64_t Height = CGImageGetHeight(a3);
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v17, &pixelBufferOut))
    {
      uint64_t v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21, v22);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)self, @"VFXExport.m", 372, @"VFX: Couldn't create pixel buffer");
    }
    ColorSpace = CGImageGetColorSpace(a3);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    uint64_t v26 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, ColorSpace, 0x2006u);
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.double width = (double)Width;
    v41.size.double height = (double)Height;
    CGContextClearRect(v26, v41);
    v42.origin.x = 0.0;
    v42.origin.y = 0.0;
    v42.size.double width = (double)Width;
    v42.size.double height = (double)Height;
    CGContextDrawImage(v26, v42, a3);
    CGContextFlush(v26);
    CFRelease(v26);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    long long v36 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    if ((objc_msgSend_appendPixelBuffer_withPresentationTime_(a5, v27, (uint64_t)pixelBufferOut, (uint64_t)&v36) & 1) == 0) {
      sub_1B63F2F54(16, @"Error: append pixel buffer failed", v28, v29, v30, v31, v32, v33, v36);
    }
    CFRelease(pixelBufferOut);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: appendImage: failed to get a pixelBuffer from CVPixelBufferPoolRef", v11, v12, v13, v14, v15, v16, v40);
  }
}

- (void)renderAndAppendWithPresentationTime:(id *)a3 usingAdaptor:(id)a4 metalTextureCache:(__CVMetalTextureCache *)a5 cvQueue:(id)a6 completionBlock:(id)a7
{
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v14 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPool(a4, a2, (uint64_t)a3, (uint64_t)a4);
  if (v14)
  {
    id v212 = a7;
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, &pixelBufferOut))
    {
      v210 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23, v24);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v210, v211, (uint64_t)a2, (uint64_t)self, @"VFXExport.m", 412, @"VFX: Couldn't create pixel buffer");
    }
    CVMetalTextureRef textureOut = 0;
    unint64_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, 0);
    unint64_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, 0);
    CVMetalTextureCacheCreateTextureFromImage(v21, a5, pixelBufferOut, 0, MTLPixelFormatBGRA8Unorm_sRGB, WidthOfPlane, HeightOfPlane, 0, &textureOut);
    uint64_t v30 = objc_msgSend_renderPassDescriptor(MEMORY[0x1E4F352E0], v27, v28, v29);
    uint64_t v34 = objc_msgSend_colorAttachments(v30, v31, v32, v33);
    v37 = objc_msgSend_objectAtIndexedSubscript_(v34, v35, 0, v36);
    objc_msgSend_setLoadAction_(v37, v38, 2, v39);
    uint64_t v43 = objc_msgSend_renderer(self, v40, v41, v42);
    v47 = objc_msgSend_world(v43, v44, v45, v46);
    uint64_t v51 = objc_msgSend_background(v47, v48, v49, v50);
    uint64_t v55 = objc_msgSend_contents(v51, v52, v53, v54);
    objc_opt_class();
    double v59 = 1.0;
    double v60 = 1.0;
    double v61 = 1.0;
    double v62 = 1.0;
    if (objc_opt_isKindOfClass())
    {
      double v218 = 0.0;
      double v219 = 0.0;
      double v216 = 0.0;
      double v217 = 0.0;
      objc_msgSend_getRed_green_blue_alpha_(v55, v56, (uint64_t)&v219, (uint64_t)&v218, &v217, &v216);
      double v60 = v218;
      double v59 = v219;
      double v62 = v216;
      double v61 = v217;
    }
    v63 = objc_msgSend_colorAttachments(v30, v56, v57, v58);
    v66 = objc_msgSend_objectAtIndexedSubscript_(v63, v64, 0, v65);
    objc_msgSend_setClearColor_(v66, v67, v68, v69, v59, v60, v61, v62);
    id v71 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v70, 81, WidthOfPlane, HeightOfPlane, 0);
    uint64_t v75 = objc_msgSend_renderer(self, v72, v73, v74);
    v79 = objc_msgSend_device(v75, v76, v77, v78);
    if (j__objc_msgSend_supportsMemorylessRenderTargets(v79, v80, v81, v82)) {
      objc_msgSend_setStorageMode_(v71, v83, 3, v84);
    }
    else {
      objc_msgSend_setStorageMode_(v71, v83, 2, v84);
    }
    objc_msgSend_setUsage_(v71, v85, 5, v86);
    if (objc_msgSend_antialiasingMode(self, v87, v88, v89))
    {
      char v93 = objc_msgSend_antialiasingMode(self, v90, v91, v92);
      objc_msgSend_setSampleCount_(v71, v94, 1 << v93, v95);
      objc_msgSend_setTextureType_(v71, v96, 4, v97);
      uint64_t v101 = objc_msgSend_renderer(self, v98, v99, v100);
      v105 = objc_msgSend_device(v101, v102, v103, v104);
      uint64_t v108 = objc_msgSend_newTextureWithDescriptor_(v105, v106, (uint64_t)v71, v107);
      uint64_t v112 = objc_msgSend_colorAttachments(v30, v109, v110, v111);
      uint64_t v115 = objc_msgSend_objectAtIndexedSubscript_(v112, v113, 0, v114);
      objc_msgSend_setTexture_(v115, v116, (uint64_t)v108, v117);
      id Texture = CVMetalTextureGetTexture(textureOut);
      uint64_t v122 = objc_msgSend_colorAttachments(v30, v119, v120, v121);
      v125 = objc_msgSend_objectAtIndexedSubscript_(v122, v123, 0, v124);
      objc_msgSend_setResolveTexture_(v125, v126, (uint64_t)Texture, v127);
      uint64_t v131 = objc_msgSend_colorAttachments(v30, v128, v129, v130);
      v134 = objc_msgSend_objectAtIndexedSubscript_(v131, v132, 0, v133);
      objc_msgSend_setStoreAction_(v134, v135, 2, v136);
    }
    else
    {
      id v140 = CVMetalTextureGetTexture(textureOut);
      v144 = objc_msgSend_colorAttachments(v30, v141, v142, v143);
      v147 = objc_msgSend_objectAtIndexedSubscript_(v144, v145, 0, v146);
      objc_msgSend_setTexture_(v147, v148, (uint64_t)v140, v149);
    }
    v150 = objc_msgSend_renderer(self, v137, v138, v139);
    uint64_t v154 = objc_msgSend_commandQueue(v150, v151, v152, v153);
    v158 = objc_msgSend_commandBuffer(v154, v155, v156, v157);
    objc_msgSend_lock(VFXTransaction, v159, v160, v161);
    v165 = objc_msgSend_renderer(self, v162, v163, v164);
    v169 = objc_msgSend_world(v165, v166, v167, v168);
    objc_msgSend_lock(v169, v170, v171, v172);
    double systemTime = self->super._systemTime;
    if (systemTime == 0.0) {
      CFTimeInterval v177 = CACurrentMediaTime();
    }
    else {
      CFTimeInterval v177 = systemTime + self->_rate;
    }
    self->super._double systemTime = v177;
    objc_msgSend_startTime(v169, v173, v174, v175);
    double v179 = v178 + (float)((float)a3->var0 / (float)a3->var1);
    v183 = objc_msgSend_clock(v169, v180, v181, v182);
    objc_msgSend_setTime_(v183, v184, v185, v186, v179);
    v190 = objc_msgSend_renderer(self, v187, v188, v189);
    objc_msgSend_updateAtTime_(v190, v191, v192, v193, self->super._systemTime);
    v197 = objc_msgSend_renderer(self, v194, v195, v196);
    objc_msgSend_renderWithViewport_commandBuffer_passDescriptor_(v197, v198, (uint64_t)v158, (uint64_t)v30, 0.0, 0.0, (double)WidthOfPlane, (double)HeightOfPlane);
    objc_msgSend_unlock(v169, v199, v200, v201);
    objc_msgSend_unlock(VFXTransaction, v202, v203, v204);
    v213[0] = MEMORY[0x1E4F143A8];
    v213[1] = 3221225472;
    v213[2] = sub_1B65DABA8;
    v213[3] = &unk_1E6144FC8;
    v213[4] = a6;
    v213[5] = self;
    long long v214 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    v213[8] = pixelBufferOut;
    v213[9] = textureOut;
    v213[10] = a5;
    v213[6] = a4;
    v213[7] = v212;
    objc_msgSend_addCompletedHandler_(v158, v205, (uint64_t)v213, v206);
    objc_msgSend_commit(v158, v207, v208, v209);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: appendImage: failed to get a pixelBuffer from CVPixelBufferPoolRef", v15, v16, v17, v18, v19, v20, v223);
  }
}

- (void)main
{
  uint64_t v3 = (void *)MEMORY[0x1BA9B76E0](self, a2);
  if (!objc_msgSend_renderer(self, v4, v5, v6)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v8, v9, v10, v11, v12, v13, (uint64_t)"renderer");
  }
  objc_msgSend_startTime(self, v7, v8, v9);
  float v15 = v14;
  objc_msgSend_endTime(self, v16, v17, v18);
  double v20 = v19;
  float rate = self->_rate;
  uint64_t v22 = dispatch_queue_create("serial assetwriter input queue", 0);
  uint64_t v23 = dispatch_semaphore_create(0);
  uint64_t v24 = dispatch_semaphore_create(0);
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  float v92 = v15;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  v90[3] = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  int v89 = 0;
  uint64_t v28 = objc_msgSend_renderer(self, v25, v26, v27);
  uint64_t v32 = objc_msgSend_device(v28, v29, v30, v31);
  BOOL v36 = v32 != 0;
  CVMetalTextureCacheRef cacheOut = 0;
  if (v32)
  {
    v37 = objc_msgSend_renderer(self, v33, v34, v35);
    uint64_t v41 = objc_msgSend_device(v37, v38, v39, v40);
    CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v41, 0, &cacheOut);
    uint64_t v45 = (const void *)objc_msgSend__copySnapshot_(self, v42, v43, v44, 1.0, 1.0);
    CFRelease(v45);
  }
  uint64_t v46 = objc_msgSend_currentProgress(MEMORY[0x1E4F28F90], v33, v34, v35);
  float v49 = v20;
  if (v46) {
    uint64_t v46 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v47, (int)vcvtps_s32_f32((float)(v49 - v15) / rate), v48);
  }
  assetWriterInput = self->_assetWriterInput;
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = sub_1B65DB060;
  v82[3] = &unk_1E6144FF0;
  v82[4] = v46;
  v82[5] = self;
  float v83 = rate;
  float v84 = v49;
  BOOL v86 = v36;
  v82[8] = v91;
  v82[9] = v88;
  v82[10] = v90;
  v82[11] = cacheOut;
  float v85 = v15;
  v82[6] = v22;
  v82[7] = v23;
  objc_msgSend_requestMediaDataWhenReadyOnQueue_usingBlock_(assetWriterInput, v47, (uint64_t)v22, (uint64_t)v82);
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  assetWriter = self->_assetWriter;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = sub_1B65DB390;
  v81[3] = &unk_1E61422C0;
  v81[4] = v24;
  objc_msgSend_finishWritingWithCompletionHandler_(assetWriter, v52, (uint64_t)v81, v53);
  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v23);
  dispatch_release(v24);
  dispatch_release(v22);
  if (cacheOut) {
    CFRelease(cacheOut);
  }
  if (objc_msgSend_error(self->_assetWriter, v54, v55, v56))
  {
    uint64_t v61 = objc_msgSend_error(self->_assetWriter, v57, v58, v59);
    objc_msgSend_setError_(self, v62, v61, v63);
    v67 = objc_msgSend_error(self->_assetWriter, v64, v65, v66);
    uint64_t v71 = objc_msgSend_localizedDescription(v67, v68, v69, v70);
    sub_1B63F2F54(16, @"Error: error while exporting movie: %@", v72, v73, v74, v75, v76, v77, v71);
  }
  LODWORD(v60) = 1.0;
  objc_msgSend_setProgress_(self, v57, v58, v59, v60);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v91, 8);
  objc_msgSend__finishedExport(self, v78, v79, v80);
}

@end