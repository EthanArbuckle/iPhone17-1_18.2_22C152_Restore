@interface UniImage
+ (UniImage)imageWithCIImage:(id)a3;
+ (UniImage)imageWithMTLTexture:(id)a3;
+ (UniImage)imageWithObject:(id)a3;
+ (id)_cleanupParameterDescription:(id)a3;
+ (id)_objectsForNames:(id)a3 forKernel:(id)a4;
+ (id)_orderedInputNamesForKernel:(id)a3 inputImageSet:(id)a4 outputImageSet:(id)a5 showNonImageParams:(BOOL)a6;
+ (id)_stringForObject:(id)a3 objectToStringMap:(id)a4;
+ (id)_textureDescriptionForDot:(id)a3;
+ (void)metalRenderImageArray:(id)a3 queue:(id)a4 waitUntilScheduled:(BOOL)a5 waitUntilCompleted:(BOOL)a6;
- (CGRect)extent;
- (CIImage)image;
- (MTLCommandBuffer)buffer;
- (MTLTexture)texture;
- (UniImage)initWithCIImage:(id)a3;
- (UniImage)initWithKernel:(id)a3;
- (UniImage)initWithMTLTexture:(id)a3;
- (UniImage)initWithObject:(id)a3;
- (UniKernel)kernel;
- (id)coreImageRender:(id)a3;
- (id)coreImageRender:(id)a3 subRect:(CGRect)a4 outputTexture:(id)a5;
- (id)debugQuickLookObject;
- (id)description;
- (void)metalRender;
- (void)metalRender:(id)a3 waitUntilScheduled:(BOOL)a4 waitUntilCompleted:(BOOL)a5;
- (void)setBuffer:(id)a3;
- (void)setKernel:(id)a3;
- (void)setTexture:(id)a3;
@end

@implementation UniImage

- (CIImage)image
{
  return self->image;
}

- (MTLTexture)texture
{
  return self->texture;
}

- (MTLCommandBuffer)buffer
{
  return self->buffer;
}

- (UniKernel)kernel
{
  return self->kernel;
}

- (UniImage)initWithKernel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UniImage;
  v6 = [(UniImage *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->kernel, a3);
    image = v7->image;
    v7->image = 0;

    texture = v7->texture;
    v7->texture = 0;

    buffer = v7->buffer;
    v7->buffer = 0;
  }
  return v7;
}

- (UniImage)initWithCIImage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)UniImage;
    v6 = [(UniImage *)&v13 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->image, a3);
      texture = v7->texture;
      v7->texture = 0;

      kernel = v7->kernel;
      v7->kernel = 0;

      buffer = v7->buffer;
      v7->buffer = 0;
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (UniImage)imageWithCIImage:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)objc_opt_class());
    v6 = objc_msgSend_initWithCIImage_(v4, v5, (uint64_t)v3);
  }
  else
  {
    v6 = 0;
  }

  return (UniImage *)v6;
}

- (UniImage)initWithMTLTexture:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UniImage;
  v6 = [(UniImage *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->texture, a3);
    uint64_t v9 = objc_msgSend_imageWithMTLTexture_options_(MEMORY[0x263F00650], v8, (uint64_t)v7->texture, MEMORY[0x263EFFA78]);
    image = v7->image;
    v7->image = (CIImage *)v9;

    kernel = v7->kernel;
    v7->kernel = 0;

    buffer = v7->buffer;
    v7->buffer = 0;
  }
  return v7;
}

+ (UniImage)imageWithMTLTexture:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v6 = objc_msgSend_initWithMTLTexture_(v4, v5, (uint64_t)v3);

  return (UniImage *)v6;
}

- (UniImage)initWithObject:(id)a3
{
  id v4 = a3;
  v6 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (!objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)&unk_270E2A1A0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_msgSend_initWithCIImage_(self, v9, (uint64_t)v6);
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v6;
      goto LABEL_7;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v8 = objc_msgSend_initWithMTLTexture_(self, v7, (uint64_t)v6);
LABEL_6:
  v10 = v8;
  self = v10;
LABEL_7:
  v11 = v10;
LABEL_11:

  return v11;
}

+ (UniImage)imageWithObject:(id)a3
{
  id v3 = a3;
  id v4 = [UniImage alloc];
  v6 = objc_msgSend_initWithObject_(v4, v5, (uint64_t)v3);

  return (UniImage *)v6;
}

- (CGRect)extent
{
  id v4 = objc_msgSend_image(self, a2, v2);

  if (v4)
  {
    objc_msgSend_extent(self->image, v5, v6);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    v15 = objc_msgSend_texture(self, v5, v6);

    if (v15)
    {
      v18 = objc_msgSend_texture(self, v16, v17);
      v20 = objc_msgSend__mtlTextureForImage_(UniKernel, v19, (uint64_t)v18);

      if (v20 && objc_msgSend_conformsToProtocol_(v20, v21, (uint64_t)&unk_270E2A1A0))
      {
        double v12 = (double)(unint64_t)objc_msgSend_width(v20, v22, v23);
        double v14 = (double)(unint64_t)objc_msgSend_height(v20, v24, v25);
        double v8 = 0.0;
        double v10 = 0.0;
      }
      else
      {
        double v8 = *MEMORY[0x263F001A8];
        double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
      }
    }
    else
    {
      double v8 = *MEMORY[0x263F001A8];
      double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
  }
  double v26 = v8;
  double v27 = v10;
  double v28 = v12;
  double v29 = v14;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p", v4, self);
  double v9 = objc_msgSend_texture(self, v7, v8);

  if (v9)
  {
    double v12 = objc_msgSend_texture(self, v10, v11);
    int v14 = objc_msgSend_conformsToProtocol_(v12, v13, (uint64_t)&unk_270E2A1A0);

    uint64_t v17 = objc_msgSend_texture(self, v15, v16);
    v20 = v17;
    if (v14) {
      shortTextureDescription(v17);
    }
    else {
    v21 = objc_msgSend_description(v17, v18, v19);
    }
    objc_msgSend_appendString_(v6, v22, (uint64_t)v21);
  }
  uint64_t v23 = objc_msgSend_image(self, v10, v11);

  if (v23)
  {
    double v26 = NSString;
    double v27 = objc_msgSend_image(self, v24, v25);
    double v29 = objc_msgSend_stringWithFormat_(v26, v28, @" image = %@", v27);
    objc_msgSend_appendString_(v6, v30, (uint64_t)v29);
  }
  v31 = objc_msgSend_buffer(self, v24, v25);

  if (v31)
  {
    v34 = NSString;
    v35 = objc_msgSend_buffer(self, v32, v33);
    v37 = objc_msgSend_stringWithFormat_(v34, v36, @" buffer = %@", v35);
    objc_msgSend_appendString_(v6, v38, (uint64_t)v37);
  }
  v39 = objc_msgSend_kernel(self, v32, v33);

  if (v39)
  {
    v42 = NSString;
    v43 = objc_msgSend_kernel(self, v40, v41);
    v45 = objc_msgSend_stringWithFormat_(v42, v44, @" kernel = %@", v43);
    objc_msgSend_appendString_(v6, v46, (uint64_t)v45);
  }
  objc_msgSend_appendString_(v6, v40, @">");

  return v6;
}

- (id)debugQuickLookObject
{
  uint64_t v4 = objc_msgSend_image(self, a2, v2);

  if (v4)
  {
    double v7 = objc_msgSend_image(self, v5, v6);
    if (!v7)
    {
LABEL_12:
      uint64_t v16 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend_texture(self, v5, v6);

    if (!v8) {
      goto LABEL_12;
    }
    uint64_t v11 = (void *)MEMORY[0x263F00650];
    double v12 = objc_msgSend_texture(self, v9, v10);
    double v7 = objc_msgSend_imageWithMTLTexture_options_(v11, v13, (uint64_t)v12, 0);

    if (!v7) {
      goto LABEL_12;
    }
  }
  SEL v14 = NSSelectorFromString(&cfstr_Initwithciimag.isa);
  v15 = NSClassFromString(&cfstr_Nsbitmapimager.isa);
  if (!v15) {
    v15 = NSClassFromString(&cfstr_Uiimage.isa);
  }
  uint64_t v16 = 0;
  if (v15 && v14)
  {
    id v17 = [v15 alloc];
    uint64_t v16 = objc_msgSend_performSelector_withObject_(v17, v18, (uint64_t)v14, v7);
  }
LABEL_13:

  return v16;
}

+ (void)metalRenderImageArray:(id)a3 queue:(id)a4 waitUntilScheduled:(BOOL)a5 waitUntilCompleted:(BOOL)a6
{
  BOOL v115 = a6;
  BOOL v118 = a5;
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v121 = a4;
  v120 = objc_msgSend_set(MEMORY[0x263EFF9C0], v8, v9);
  v116 = objc_msgSend_array(MEMORY[0x263EFF980], v10, v11);
  SEL v14 = objc_msgSend_set(MEMORY[0x263EFF9C0], v12, v13);
  id v17 = objc_msgSend_weakObjectsPointerArray(MEMORY[0x263F08A88], v15, v16);
  v20 = objc_msgSend_lastObject(v7, v18, v19);
  uint64_t v23 = objc_msgSend_kernel(v20, v21, v22);

  double v26 = objc_msgSend_getRenderOrder(v23, v24, v25);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v27 = v7;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v126, v135, 16);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v127 != v31) {
          objc_enumerationMutation(v27);
        }
        sub_262E371A8(*(void **)(*((void *)&v126 + 1) + 8 * i), v14, v17);
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v33, (uint64_t)&v126, v135, 16);
    }
    while (v30);
  }

  id v34 = v26;
  if (v34 && objc_msgSend_pointerAtIndex_(v34, v35, 0))
  {
    v114 = v23;
    v37 = objc_msgSend_pointerAtIndex_(v34, v36, 0);
    v40 = objc_msgSend_device(v37, v38, v39);
    v43 = v40;
    if (!v121) {
      id v121 = (id)objc_msgSend_newCommandQueue(v40, v41, v42);
    }
    v112 = v43;
    objc_opt_class();
    objc_opt_class();
    v44 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v47 = objc_msgSend_count(v34, v45, v46);
    v117 = objc_msgSend_setWithCapacity_(v44, v48, v47);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v113 = v34;
    id obj = v34;
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v122, v132, 16);
    if (v50)
    {
      uint64_t v51 = v50;
      v52 = 0;
      uint64_t v53 = *(void *)v123;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v123 != v53) {
            objc_enumerationMutation(obj);
          }
          v55 = *(void **)(*((void *)&v122 + 1) + 8 * v54);
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            sub_262E4D514();
          }
          if ((sub_262E3735C(v55) & 1) == 0)
          {
            v56 = uni_activity();
            os_activity_t v57 = _os_activity_create(&dword_262E0F000, "kernel run", v56, OS_ACTIVITY_FLAG_DEFAULT);
          }
          v58 = uni_logger_render();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
            sub_262E4D47C(v133, v52, (uint64_t *)&v134, v58);
          }

          v60 = objc_msgSend_run_(v55, v59, (uint64_t)v121);
          uint64_t v62 = objc_msgSend_objectAtIndexedSubscript_(v60, v61, 0);
          if (!v62) {
            sub_262E4D424();
          }
          v63 = (void *)v62;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_msgSend_conformsToProtocol_(v63, v64, (uint64_t)&unk_270E2BC48) & 1) == 0) {
              sub_262E4D450();
            }
            objc_msgSend_writeDebugTextures_filesWritten_(v55, v65, (uint64_t)v63, v117);
            objc_msgSend_commit(v63, v66, v67);
            if (v118) {
              objc_msgSend_waitUntilScheduled(v63, v68, v69);
            }
            if (objc_msgSend_shouldWriteDebugTextures(UniKernel, v68, v69)) {
              objc_msgSend_waitUntilCompleted(v63, v70, v71);
            }
            v72 = uni_logger_render();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_stringWithFormat_(NSString, v73, @"%@", v55);
              id v74 = objc_claimAutoreleasedReturnValue();
              uint64_t v77 = objc_msgSend_UTF8String(v74, v75, v76);
              *(_DWORD *)buf = 136315138;
              uint64_t v131 = v77;
              _os_log_impl(&dword_262E0F000, v72, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
            }
            if ((objc_msgSend_containsObject_(v120, v78, (uint64_t)v63) & 1) == 0)
            {
              objc_msgSend_addObject_(v116, v79, (uint64_t)v63);
              objc_msgSend_addObject_(v120, v80, (uint64_t)v63);
            }
            ++v52;
          }

          ++v54;
        }
        while (v51 != v54);
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v122, v132, 16);
      }
      while (v51);
    }

    if (v115)
    {
      v84 = objc_msgSend_lastObject(v116, v82, v83);
      objc_msgSend_waitUntilCompleted(v84, v85, v86);
    }
    v87 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v82, v83);
    v90 = objc_msgSend_processName(v87, v88, v89);

    v91 = NSString;
    uint64_t v92 = getpid();
    v94 = objc_msgSend_stringWithFormat_(v91, v93, @"_pid%d", v92);
    v96 = v94;
    uint64_t v23 = v114;
    if (v90)
    {
      objc_msgSend_stringByAppendingString_(v90, v95, (uint64_t)v94);
      id v97 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v97 = v94;
    }
    v99 = objc_opt_new();
    objc_msgSend_temporaryDirectory(v99, v100, v101);
    id v102 = objc_claimAutoreleasedReturnValue();
    uint64_t v105 = objc_msgSend_fileSystemRepresentation(v102, v103, v104);

    v106 = NSString;
    uint64_t v107 = atomic_load((unsigned int *)dword_26A997630);
    v109 = objc_msgSend_stringWithFormat_(v106, v108, @"/%s/%@_%d.dot", v105, v97, v107);
    atomic_fetch_add_explicit(dword_26A997630, 1u, memory_order_relaxed);
    v110 = objc_opt_class();
    objc_msgSend__spewDot_filename_(v110, v111, (uint64_t)obj, v109);

    v98 = v112;
    id v34 = v113;
  }
  else
  {
    v98 = uni_logger_api();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v133 = 136446210;
      v134 = "+[UniImage metalRenderImageArray:queue:waitUntilScheduled:waitUntilCompleted:]";
      _os_log_impl(&dword_262E0F000, v98, OS_LOG_TYPE_INFO, "%{public}s Nothing to do ... ", v133, 0xCu);
    }
  }
}

- (void)metalRender:(id)a3 waitUntilScheduled:(BOOL)a4 waitUntilCompleted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  v13[0] = self;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, (uint64_t)v13, 1);
  objc_msgSend_metalRenderImageArray_queue_waitUntilScheduled_waitUntilCompleted_(v9, v12, (uint64_t)v11, v8, v6, v5);
}

- (void)metalRender
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_class();
  v7[0] = self;
  BOOL v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, (uint64_t)v7, 1);
  objc_msgSend_metalRenderImageArray_queue_waitUntilScheduled_waitUntilCompleted_(v3, v6, (uint64_t)v5, 0, 1, 1);
}

+ (id)_textureDescriptionForDot:(id)a3
{
  id v3 = a3;
  if (!v3) {
    sub_262E4D540();
  }
  id v4 = v3;
  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_msgSend_texture(v4, v5, v6);
  }
  uint64_t v8 = objc_msgSend_pixelFormat(v7, v5, v6);
  uint64_t v11 = objc_msgSend_device(v7, v9, v10);
  uint64_t v12 = pixelFormatName(v8, v11);

  if (!v12) {
    sub_262E4D56C();
  }
  v15 = NSString;
  uint64_t v16 = objc_msgSend_width(v7, v13, v14);
  uint64_t v19 = objc_msgSend_height(v7, v17, v18);
  v21 = objc_msgSend_stringWithFormat_(v15, v20, @"%ldx%ld\\n%s", v16, v19, v12);

  return v21;
}

+ (id)_cleanupParameterDescription:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, @"\"", &stru_270E15D18);
  BOOL v5 = objc_msgSend_substringToIndex_(v3, v4, 1);
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, @"{");

  if (isEqualToString)
  {
    uint64_t v10 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v8, 0, 1, &stru_270E15D18);

    id v3 = (void *)v10;
  }
  uint64_t v11 = objc_msgSend_length(v3, v8, v9);
  uint64_t v13 = objc_msgSend_substringFromIndex_(v3, v12, v11 - 1);
  int v15 = objc_msgSend_isEqualToString_(v13, v14, @"}");

  if (v15)
  {
    uint64_t v18 = objc_msgSend_length(v3, v16, v17);
    uint64_t v20 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v19, v18 - 1, 1, &stru_270E15D18);

    id v3 = (void *)v20;
  }
  v21 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v16, @"", &stru_270E15D18);;

  v24 = objc_msgSend_string(MEMORY[0x263F089D8], v22, v23);
  double v26 = objc_msgSend_componentsSeparatedByString_(v21, v25, @"\n");
  uint64_t v29 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x263F08708], v27, v28);
  v32 = objc_msgSend_invertedSet(v29, v30, v31);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v33 = v26;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v46, v50, 16);
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(v33);
        }
        v40 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v41 = objc_msgSend_rangeOfCharacterFromSet_(v40, v36, (uint64_t)v32, (void)v46);
        if (v41 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v42 = objc_msgSend_substringFromIndex_(v40, v36, v41);
          objc_msgSend_appendString_(v24, v43, (uint64_t)v42);

          objc_msgSend_appendString_(v24, v44, @"\\l");
        }
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v46, v50, 16);
    }
    while (v37);
  }

  return v24;
}

+ (id)_objectsForNames:(id)a3 forKernel:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v10 = objc_msgSend_count(v5, v8, v9);
  uint64_t v12 = objc_msgSend_arrayWithCapacity_(v7, v11, v10);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v5;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v30, v34, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_inputs(v6, v16, v17, (void)v30);
        v24 = objc_msgSend_objectForKey_(v22, v23, v21);

        if (v24)
        {
          objc_msgSend_conformsToProtocol_(v24, v25, (uint64_t)&unk_270E2A1A0);
          objc_msgSend_addObject_(v12, v26, (uint64_t)v24);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v30, v34, 16);
    }
    while (v18);
  }

  uint64_t v28 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v27, (uint64_t)v12);

  return v28;
}

+ (id)_orderedInputNamesForKernel:(id)a3 inputImageSet:(id)a4 outputImageSet:(id)a5 showNonImageParams:(BOOL)a6
{
  BOOL v59 = a6;
  v81[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263EFF980];
  uint64_t v14 = objc_msgSend_inputs(v8, v12, v13);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);
  uint64_t v19 = objc_msgSend_arrayWithCapacity_(v11, v18, v17);

  v60 = v9;
  v61 = v10;
  v81[0] = v9;
  v81[1] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v20, (uint64_t)v81, 2);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v74, v80, 16);
  if (v64)
  {
    uint64_t v63 = *(void *)v75;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v75 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = v24;
        uint64_t v25 = *(void **)(*((void *)&v74 + 1) + 8 * v24);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        double v26 = objc_msgSend_inputs(v8, v22, v23);
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v70, v79, 16);
        if (v28)
        {
          uint64_t v31 = v28;
          uint64_t v32 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v71 != v32) {
                objc_enumerationMutation(v26);
              }
              uint64_t v34 = *(void *)(*((void *)&v70 + 1) + 8 * i);
              uint64_t v35 = objc_msgSend_inputs(v8, v29, v30);
              uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v35, v36, v34);

              if (v37 && objc_msgSend_containsObject_(v25, v38, (uint64_t)v37)) {
                objc_msgSend_addObject_(v19, v39, v34);
              }
            }
            uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v70, v79, 16);
          }
          while (v31);
        }

        uint64_t v24 = v65 + 1;
      }
      while (v65 + 1 != v64);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v74, v80, 16);
    }
    while (v64);
  }

  if (v59)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v42 = objc_msgSend_inputs(v8, v40, v41);
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v66, v78, 16);
    if (v44)
    {
      uint64_t v47 = v44;
      uint64_t v48 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v67 != v48) {
            objc_enumerationMutation(v42);
          }
          uint64_t v50 = *(void *)(*((void *)&v66 + 1) + 8 * j);
          uint64_t v51 = objc_msgSend_inputs(v8, v45, v46);
          uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v51, v52, v50);

          if (v53
            && (objc_msgSend_containsObject_(v60, v54, v50) & 1) == 0
            && (objc_msgSend_containsObject_(v61, v55, v50) & 1) == 0)
          {
            objc_msgSend_addObject_(v19, v56, v50);
          }
        }
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v66, v78, 16);
      }
      while (v47);
    }
  }
  os_activity_t v57 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v40, (uint64_t)v19);

  return v57;
}

+ (id)_stringForObject:(id)a3 objectToStringMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    sub_262E4D598();
  }
  id v8 = v6;
  uint64_t v11 = objc_msgSend_objectForKey_(v6, v7, (uint64_t)v5);
  if (!v11)
  {
    uint64_t v12 = objc_msgSend_count(v8, v9, v10);
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v13, @"%ld", v12);
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v11, v5);
  }
  id v15 = v11;

  return v15;
}

- (id)coreImageRender:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_image(self, v5, v6);
  uint64_t v10 = objc_msgSend_texture(self, v8, v9);
  uint64_t v13 = objc_msgSend_kernel(self, v11, v12);
  if (!v13) {
    sub_262E4D5C4();
  }

  id v15 = objc_msgSend__mtlTextureForImage_(UniKernel, v14, (uint64_t)v10);

  uint64_t v17 = 0;
  if (v4 && v15 && v7)
  {
    uint64_t v18 = objc_msgSend__outputTextureForTexture_force_(UniKernel, v16, (uint64_t)v15, 0);
    if (!v18) {
      sub_262E4D5F0();
    }
    uint64_t v19 = (void *)v18;
    id v20 = objc_alloc(MEMORY[0x263F00670]);
    uint64_t v22 = objc_msgSend_initWithMTLTexture_commandBuffer_(v20, v21, (uint64_t)v19, 0);
    uint64_t v24 = v22;
    if (v22)
    {
      objc_msgSend_setColorSpace_(v22, v23, 0);
      objc_msgSend_setClamped_(v24, v25, 0);
      id v33 = 0;
      id v27 = objc_msgSend_startTaskToRender_toDestination_error_(v4, v26, (uint64_t)v7, v24, &v33);
      id v28 = v33;
      id v32 = v28;
      uint64_t v17 = objc_msgSend_waitUntilCompletedAndReturnError_(v27, v29, (uint64_t)&v32);
      id v30 = v32;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }

  return v17;
}

- (id)coreImageRender:(id)a3 subRect:(CGRect)a4 outputTexture:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v15 = objc_msgSend_image(self, v13, v14);
  uint64_t v18 = objc_msgSend_imageByCroppingToRect_(v15, v16, v17, x, y, width, height);

  uint64_t v21 = objc_msgSend_kernel(self, v19, v20);
  if (!v21) {
    sub_262E4D61C();
  }

  uint64_t v23 = 0;
  if (v11 && v12 && v18)
  {
    uint64_t v24 = objc_msgSend__outputTextureForTexture_force_(UniKernel, v22, (uint64_t)v12, 0);
    if (!v24) {
      sub_262E4D648();
    }
    uint64_t v25 = (void *)v24;
    id v26 = objc_alloc(MEMORY[0x263F00670]);
    id v28 = objc_msgSend_initWithMTLTexture_commandBuffer_(v26, v27, (uint64_t)v25, 0);
    id v30 = v28;
    if (v28)
    {
      objc_msgSend_setColorSpace_(v28, v29, 0);
      objc_msgSend_setClamped_(v30, v31, 0);
      objc_msgSend_extent(v18, v32, v33);
      CGFloat v35 = -v34;
      objc_msgSend_extent(v18, v36, v37);
      CGAffineTransformMakeTranslation(&v49, v35, -v38);
      uint64_t v40 = objc_msgSend_imageByApplyingTransform_(v18, v39, (uint64_t)&v49);

      id v48 = 0;
      uint64_t v42 = objc_msgSend_startTaskToRender_toDestination_error_(v11, v41, v40, v30, &v48);
      id v43 = v48;
      id v47 = v43;
      uint64_t v23 = objc_msgSend_waitUntilCompletedAndReturnError_(v42, v44, (uint64_t)&v47);
      id v45 = v47;

      uint64_t v18 = (void *)v40;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }

  return v23;
}

- (void)setTexture:(id)a3
{
}

- (void)setKernel:(id)a3
{
}

- (void)setBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buffer, 0);
  objc_storeStrong((id *)&self->kernel, 0);
  objc_storeStrong((id *)&self->texture, 0);

  objc_storeStrong((id *)&self->image, 0);
}

@end