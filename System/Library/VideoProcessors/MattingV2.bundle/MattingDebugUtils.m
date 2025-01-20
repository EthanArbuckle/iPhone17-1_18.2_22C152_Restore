@interface MattingDebugUtils
+ (BOOL)saveTextureArray:(id)a3 AsBinaryFile:(const char *)a4;
+ (void)createPathIfNeeded:(id)a3;
@end

@implementation MattingDebugUtils

+ (void)createPathIfNeeded:(id)a3
{
  v3 = objc_msgSend_stringByDeletingLastPathComponent(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5);
  id v11 = 0;
  char v8 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v6, v7, (uint64_t)v3, 1, 0, &v11);
  id v9 = v11;
  v10 = v9;
  if ((v8 & 1) == 0) {
    NSLog(&cfstr_FailedToCreate.isa, v3, v9);
  }
}

+ (BOOL)saveTextureArray:(id)a3 AsBinaryFile:(const char *)a4
{
  id v5 = a3;
  v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"%s", a4);
  uint64_t v10 = objc_msgSend_pixelFormat(v5, v8, v9);
  if (v10 <= 69)
  {
    switch(v10)
    {
      case 10:
        uint64_t v13 = 1;
        goto LABEL_17;
      case 25:
        uint64_t v13 = 2;
        goto LABEL_17;
      case 55:
        goto LABEL_9;
    }
LABEL_15:
    NSLog(&cfstr_UnsupportedPix.isa, v7);
    char v14 = 0;
    goto LABEL_24;
  }
  if (v10 > 114)
  {
    if (v10 == 115)
    {
      uint64_t v13 = 8;
      goto LABEL_17;
    }
    if (v10 == 125)
    {
      uint64_t v13 = 16;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v10 != 70 && v10 != 80) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v13 = 4;
LABEL_17:
  uint64_t v15 = objc_msgSend_width(v5, v11, v12);
  id v16 = objc_alloc(MEMORY[0x263EFF990]);
  uint64_t v19 = objc_msgSend_width(v5, v17, v18);
  uint64_t v22 = objc_msgSend_height(v5, v20, v21);
  uint64_t v25 = objc_msgSend_arrayLength(v5, v23, v24);
  id v27 = objc_msgSend_initWithLength_(v16, v26, v19 * v13 * v22 * v25);
  uint64_t v30 = objc_msgSend_bytes(v27, v28, v29);
  if (objc_msgSend_arrayLength(v5, v31, v32))
  {
    uint64_t v35 = 0;
    uint64_t v36 = v15 * v13;
    unsigned int v37 = 1;
    do
    {
      uint64_t v38 = objc_msgSend_pixelFormat(v5, v33, v34);
      v40 = objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(v5, v39, v38, 2, 0, 1, v35, 1);
      uint64_t v43 = v30 + v35 * v36 * objc_msgSend_height(v5, v41, v42);
      uint64_t v46 = objc_msgSend_width(v5, v44, v45);
      uint64_t v49 = objc_msgSend_height(v5, v47, v48);
      memset(v62, 0, 24);
      v62[3] = v46;
      v62[4] = v49;
      v62[5] = 1;
      objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v40, v50, v43, v36, v62, 0);

      uint64_t v35 = v37;
    }
    while (objc_msgSend_arrayLength(v5, v51, v52) > (unint64_t)v37++);
  }
  objc_msgSend_createPathIfNeeded_(MattingDebugUtils, v33, (uint64_t)v7);
  id v61 = 0;
  char v14 = objc_msgSend_writeToFile_options_error_(v27, v54, (uint64_t)v7, 1, &v61);
  id v55 = v61;
  v58 = v55;
  if (v14)
  {
    NSLog(&cfstr_WroteFile.isa, v7);
  }
  else
  {
    v59 = objc_msgSend_localizedDescription(v55, v56, v57);
    NSLog(&cfstr_Error.isa, v59);
  }
LABEL_24:

  return v14;
}

@end