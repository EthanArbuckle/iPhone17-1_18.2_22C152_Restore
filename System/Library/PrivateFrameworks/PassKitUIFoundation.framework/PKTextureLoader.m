@interface PKTextureLoader
- (PKTextureLoader)init;
- (id)initForDevice:(CGImage *)a3 image:(void *)a4 withStorageMode:(int)a5 premultiplyAlpha:(CGColorSpace *)a6 colorSpace:(CGColorRenderingIntent)a7 renderingIntent:;
- (unint64_t)format;
- (void)_decode:(uint64_t)a1;
- (void)_tiling:(void *)a3 read:;
- (void)dealloc;
- (void)decode;
- (void)read:(id)a3;
- (void)tiling:(BOOL)a3 read:(id)a4;
@end

@implementation PKTextureLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)read:(id)a3
{
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CFRelease(image);
  }
  vImageConverter_Release(self->_converter);
  CGColorSpaceRelease(self->_sourceColorSpace);
  CGColorSpaceRelease(self->_destinationColorSpace);
  v4.receiver = self;
  v4.super_class = (Class)PKTextureLoader;
  [(PKTextureLoader *)&v4 dealloc];
}

- (id)initForDevice:(CGImage *)a3 image:(void *)a4 withStorageMode:(int)a5 premultiplyAlpha:(CGColorSpace *)a6 colorSpace:(CGColorRenderingIntent)a7 renderingIntent:
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v14 = a2;
  v15 = v14;
  v16 = 0;
  if (a1 && v14 && a3)
  {
    int v81 = a5;
    CGColorRenderingIntent v82 = a7;
    v80 = a4;
    *((_DWORD *)&srcFormat.renderingIntent + 1) = 0;
    uint32_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
    uint32_t BitsPerPixel = CGImageGetBitsPerPixel(a3);
    ColorSpace = CGImageGetColorSpace(a3);
    CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(a3);
    srcFormat.bitsPerComponent = BitsPerComponent;
    srcFormat.bitsPerPixel = BitsPerPixel;
    srcFormat.colorSpace = ColorSpace;
    srcFormat.bitmapInfo = BitmapInfo;
    srcFormat.version = 0;
    srcFormat.decode = CGImageGetDecode(a3);
    uint64_t v21 = BitmapInfo & 0x1F;
    srcFormat.renderingIntent = CGImageGetRenderingIntent(a3);
    if (!ColorSpace && v21 != 7)
    {
      v22 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        v16 = 0;
        goto LABEL_123;
      }
      LOWORD(buf.bitsPerComponent) = 0;
      v23 = "PKTextureLoader: declining to initialize - missing color space.";
      p_vImage_CGImageFormat buf = (uint8_t *)&buf;
LABEL_8:
      v25 = v22;
      uint32_t v26 = 2;
LABEL_9:
      _os_log_impl(&dword_21EEBD000, v25, OS_LOG_TYPE_DEFAULT, v23, p_buf, v26);
      goto LABEL_10;
    }
    v79 = a1;
    if (v21 == 7) {
      size_t NumberOfComponents = 0;
    }
    else {
      size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
    }
    if ((BitmapInfo & 0x1F) != 0) {
      size_t v28 = NumberOfComponents + 1;
    }
    else {
      size_t v28 = NumberOfComponents;
    }
    if (v28 * BitsPerComponent == BitsPerPixel)
    {
      if (a6) {
        v29 = a6;
      }
      else {
        v29 = ColorSpace;
      }
      a1 = v79;
      if (v29 && v21 != 7)
      {
        v30 = v29;
        CGColorSpaceModel Model = CGColorSpaceGetModel(v29);
        v78 = v30;
        size_t v32 = CGColorSpaceGetNumberOfComponents(v30);
        size_t v33 = v32;
        if (Model == kCGColorSpaceModelRGB)
        {
          v29 = v78;
          if (v32 != 3)
          {
            v34 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              buf.bitsPerComponent = 134217984;
              *(void *)&buf.bitsPerPixel = v33;
              v35 = "PKTextureLoader: declining to initialize - invalid number of channels (%zu) for RGB color space.";
              goto LABEL_70;
            }
LABEL_71:

            goto LABEL_72;
          }
        }
        else
        {
          if (Model)
          {
            v39 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.bitsPerComponent) = 0;
              v40 = "PKTextureLoader: declining to initialize - invalid destination color model.";
              v41 = v39;
              uint32_t v42 = 2;
LABEL_66:
              _os_log_impl(&dword_21EEBD000, v41, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&buf, v42);
            }
LABEL_67:

LABEL_72:
            v16 = 0;
            goto LABEL_123;
          }
          v29 = v78;
          if (v32 != 1)
          {
            v34 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              buf.bitsPerComponent = 134217984;
              *(void *)&buf.bitsPerPixel = v33;
              v35 = "PKTextureLoader: declining to initialize - invalid number of channels (%zu) for monochrome color space.";
LABEL_70:
              _os_log_impl(&dword_21EEBD000, v34, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&buf, 0xCu);
              goto LABEL_71;
            }
            goto LABEL_71;
          }
        }
      }
      switch(BitsPerComponent)
      {
        case 8u:
          int v37 = 0;
          uint32_t v38 = 8;
          goto LABEL_46;
        case 0x20u:
          if ((BitmapInfo & 0x100) != 0) {
            int v37 = 4;
          }
          else {
            int v37 = 3;
          }
          uint32_t v38 = 32;
LABEL_46:
          *(void *)&buf.renderingIntent = 0;
          if (v29)
          {
            v43 = v29;
            size_t v44 = CGColorSpaceGetNumberOfComponents(v29);
            v29 = v43;
          }
          else
          {
            size_t v44 = 0;
          }
          if (v21 == 7) {
            size_t v45 = 0;
          }
          else {
            size_t v45 = v44;
          }
          if (v21) {
            BOOL v46 = 1;
          }
          else {
            BOOL v46 = v44 == 3;
          }
          int v47 = v46;
          if (v46) {
            ++v45;
          }
          int v48 = 0;
          switch(v37)
          {
            case 0:
              uint64_t v51 = v21 - 1;
              if ((v21 - 1) > 6)
              {
                int v50 = 0;
                int v52 = 6;
              }
              else
              {
                int v52 = dword_21EEE7BA8[v51];
                int v50 = dword_21EEE7BA8[(int)v51];
              }
              switch(v45)
              {
                case 4uLL:
                  int v48 = 0;
                  int v59 = 0x2000;
                  uint64_t v60 = 80;
                  int v50 = v52;
                  break;
                case 2uLL:
                  int v48 = 0;
                  int v59 = 4096;
                  uint64_t v60 = 30;
                  break;
                case 1uLL:
                  int v59 = 0;
                  int v48 = 0;
                  if (v47) {
                    uint64_t v60 = 1;
                  }
                  else {
                    uint64_t v60 = 10;
                  }
                  break;
                default:
                  goto LABEL_97;
              }
              goto LABEL_111;
            case 1:
            case 3:
              goto LABEL_62;
            case 2:
            case 4:
              int v48 = 1;
LABEL_62:
              switch((int)v21)
              {
                case 1:
                case 2:
                  int v49 = 0;
                  int v50 = 1;
                  break;
                case 3:
                case 4:
                  int v49 = 0;
                  int v50 = 3;
                  break;
                case 5:
                case 6:
                  int v49 = 0;
                  int v50 = 5;
                  break;
                case 7:
                  int v49 = 0;
                  int v50 = 7;
                  break;
                default:
                  int v50 = 0;
                  int v49 = 1;
                  break;
              }
              if ((v47 & v49) != 0) {
                int v50 = 5;
              }
              if ((v37 - 1) <= 1)
              {
                switch(v45)
                {
                  case 4uLL:
                    BOOL v53 = v48 == 0;
                    uint64_t v54 = 110;
                    uint64_t v55 = 115;
                    goto LABEL_101;
                  case 2uLL:
                    BOOL v53 = v48 == 0;
                    uint64_t v54 = 60;
                    uint64_t v55 = 65;
                    goto LABEL_101;
                  case 1uLL:
                    BOOL v53 = v48 == 0;
                    uint64_t v54 = 20;
                    uint64_t v55 = 25;
LABEL_101:
                    if (v53) {
                      uint64_t v60 = v54;
                    }
                    else {
                      uint64_t v60 = v55;
                    }
                    int v59 = 4096;
LABEL_111:
                    int v61 = v50 - 1;
                    if ((v50 - 1) < 4)
                    {
                      v62 = &unk_21EEE7BE0;
                      if (v81) {
                        v62 = &unk_21EEE7BD0;
                      }
                      int v50 = v62[v61];
                    }
                    buf.bitsPerComponent = v38;
                    buf.bitsPerPixel = v45 * v38;
                    CGBitmapInfo v63 = v50 | v59;
                    int v64 = v50 | v59 | 0x100;
                    if (v48) {
                      CGBitmapInfo v63 = v64;
                    }
                    v65 = v29;
                    buf.colorSpace = v29;
                    buf.bitmapInfo = v63;
                    buf.version = 0;
                    buf.decode = 0;
                    buf.renderingIntent = v82;
                    vImage_Error error = 0;
                    v66 = vImageConverter_CreateWithCGImageFormat(&srcFormat, &buf, 0, 0, &error);
                    if (v66)
                    {
                      v67 = v66;
                      unint64_t NumberOfSourceBuffers = vImageConverter_GetNumberOfSourceBuffers(v66);
                      unint64_t NumberOfDestinationBuffers = vImageConverter_GetNumberOfDestinationBuffers(v67);
                      unint64_t v70 = NumberOfDestinationBuffers;
                      if (NumberOfSourceBuffers == 1 && NumberOfDestinationBuffers == 1)
                      {
                        v83.receiver = v79;
                        v83.super_class = (Class)PKTextureLoader;
                        v71 = (id *)objc_msgSendSuper2(&v83, sel_init);
                        v72 = v71;
                        if (v71)
                        {
                          objc_storeStrong(v71 + 15, a2);
                          v72[16] = CGImageRetain(a3);
                          v72[17] = v67;
                          v73 = *(void **)&srcFormat.renderingIntent;
                          long long v74 = *(_OWORD *)&srcFormat.bitmapInfo;
                          *(_OWORD *)(v72 + 3) = *(_OWORD *)&srcFormat.bitsPerComponent;
                          *(_OWORD *)(v72 + 5) = v74;
                          v72[7] = v73;
                          v72[8] = CGColorSpaceRetain(ColorSpace);
                          v72[22] = (id)v60;
                          long long v75 = *(_OWORD *)&buf.bitmapInfo;
                          *(_OWORD *)(v72 + 9) = *(_OWORD *)&buf.bitsPerComponent;
                          *(_OWORD *)(v72 + 11) = v75;
                          v72[13] = *(id *)&buf.renderingIntent;
                          v72[14] = CGColorSpaceRetain(v65);
                          v72[2] = v80;
                        }
                        a1 = v72;
                        v16 = a1;
                      }
                      else
                      {
                        v77 = PKLogFacilityTypeGetObject();
                        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v86 = 134218240;
                          vImage_Error v87 = NumberOfSourceBuffers;
                          __int16 v88 = 2048;
                          unint64_t v89 = v70;
                          _os_log_impl(&dword_21EEBD000, v77, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: declining to initialize - invalid converter created with unexpected buffer counts %lu -> %lu.", v86, 0x16u);
                        }

                        vImageConverter_Release(v67);
                        v16 = 0;
                        a1 = v79;
                      }
                      goto LABEL_123;
                    }
                    v22 = PKLogFacilityTypeGetObject();
                    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_10;
                    }
                    *(_DWORD *)v86 = 134217984;
                    vImage_Error v87 = error;
                    v23 = "PKTextureLoader: declining to initialize - failed to create converter due to %zd.";
                    p_vImage_CGImageFormat buf = v86;
                    v25 = v22;
                    uint32_t v26 = 12;
                    goto LABEL_9;
                }
LABEL_97:
                v22 = PKLogFacilityTypeGetObject();
                if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_10;
                }
                *(_WORD *)v86 = 0;
                v23 = "PKTextureLoader: declining to initialize - invalid destination format.";
                p_vImage_CGImageFormat buf = v86;
                goto LABEL_8;
              }
              switch(v45)
              {
                case 4uLL:
                  BOOL v56 = v48 == 0;
                  uint64_t v57 = 123;
                  uint64_t v58 = 125;
                  break;
                case 2uLL:
                  BOOL v56 = v48 == 0;
                  uint64_t v57 = 103;
                  uint64_t v58 = 105;
                  break;
                case 1uLL:
                  BOOL v56 = v48 == 0;
                  uint64_t v57 = 53;
                  uint64_t v58 = 55;
                  break;
                default:
                  goto LABEL_97;
              }
              if (v56) {
                uint64_t v60 = v57;
              }
              else {
                uint64_t v60 = v58;
              }
              int v59 = 0x2000;
              goto LABEL_111;
            default:
              goto LABEL_97;
          }
        case 0x10u:
          if ((BitmapInfo & 0x100) != 0) {
            int v37 = 2;
          }
          else {
            int v37 = 1;
          }
          uint32_t v38 = 16;
          goto LABEL_46;
      }
      v39 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        buf.bitsPerComponent = 134217984;
        *(void *)&buf.bitsPerPixel = BitsPerComponent;
        v40 = "PKTextureLoader: declining to initialize - unexpected component size %zu.";
        v41 = v39;
        uint32_t v42 = 12;
        goto LABEL_66;
      }
      goto LABEL_67;
    }
    v36 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      buf.bitsPerComponent = 134218240;
      *(void *)&buf.bitsPerPixel = BitsPerPixel;
      WORD2(buf.colorSpace) = 2048;
      *(CGColorSpaceRef *)((char *)&buf.colorSpace + 6) = (CGColorSpaceRef)v28;
      _os_log_impl(&dword_21EEBD000, v36, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: declining to initialize - unexpected pixel size %zu for %zu components.", (uint8_t *)&buf, 0x16u);
    }

    v16 = 0;
    a1 = v79;
  }
LABEL_123:

  return v16;
}

- (PKTextureLoader)init
{
  return 0;
}

- (void)_decode:(uint64_t)a1
{
  kern_return_t v42;
  uint64_t v43;
  uint64_t v44;
  vImage_Error v45;
  vImage_Error v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  kern_return_t v50;
  NSObject *v51;
  NSObject *v52;
  vImage_Buffer v53;
  vImage_Buffer address;
  uint8_t buf[4];
  unint64_t v56;
  __int16 v57;
  size_t v58;
  uint8_t v59[40];
  uint64_t v60;

  uint64_t v60 = *MEMORY[0x263EF8340];
  if (a1)
  {
    objc_super v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = *(CGImage **)(a1 + 128);
    if (!v5)
    {
LABEL_59:
      os_unfair_lock_unlock(v4);
      return;
    }
    if (a2) {
      vImage_Flags v6 = 0;
    }
    else {
      vImage_Flags v6 = 16;
    }
    if (*(void *)(a1 + 176) && *(void *)(a1 + 120) && *(void *)(a1 + 136))
    {
      int v7 = 1;
    }
    else
    {
      int v49 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v59 = 134217984;
        *(void *)&v59[4] = a1;
        _os_log_impl(&dword_21EEBD000, v49, OS_LOG_TYPE_DEFAULT, "PKTextureLoader (%p): decode preconditions violated.", v59, 0xCu);
      }

      int v7 = 0;
      v5 = *(CGImage **)(a1 + 128);
    }
    vImagePixelCount Width = CGImageGetWidth(v5);
    vImagePixelCount Height = CGImageGetHeight(*(CGImageRef *)(a1 + 128));
    address.data = 0;
    address.height = Height;
    address.width = Width;
    address.rowBytes = 0;
    v53.data = 0;
    v53.height = Height;
    v53.width = Width;
    v53.rowBytes = 0;
    v10 = (vm_map_t *)MEMORY[0x263EF8960];
    if (!v7)
    {
      vm_size_t v26 = 0;
      vm_size_t v41 = 0;
      goto LABEL_45;
    }
    unint64_t v11 = Height;
    memset(v59, 0, 32);
    uint64_t v12 = MEMORY[0x223C3DA80](v59, Height, Width, *(unsigned int *)(a1 + 28), 512);
    if (v12 < 0)
    {
      uint64_t v16 = v12;
      v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)vImage_CGImageFormat buf = 134217984;
        BOOL v56 = v16;
        _os_log_impl(&dword_21EEBD000, v17, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: failed to populate buffer rowBytes field - %zd.", buf, 0xCu);
      }

      size_t v13 = 0;
      goto LABEL_25;
    }
    size_t v13 = *(void *)&v59[24];
    if (!*(void *)&v59[24])
    {
LABEL_25:
      vm_size_t v41 = 0;
LABEL_26:
      address.rowBytes = v13;
      memset(v59, 0, 32);
      uint64_t v19 = MEMORY[0x223C3DA80](v59, v11, Width, *(unsigned int *)(a1 + 76), 512);
      if (v19 < 0)
      {
        uint64_t v23 = v19;
        uint64_t v21 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)vImage_CGImageFormat buf = 134217984;
          BOOL v56 = v23;
          _os_log_impl(&dword_21EEBD000, v21, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: failed to populate buffer rowBytes field - %zd.", buf, 0xCu);
        }
        size_t v20 = 0;
        goto LABEL_39;
      }
      size_t v20 = *(void *)&v59[24];
      if (!*(void *)&v59[24])
      {
LABEL_40:
        vm_size_t v26 = 0;
        v53.rowBytes = v20;
LABEL_41:
        v27 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_44:

LABEL_45:
          CFRelease(*(CFTypeRef *)(a1 + 128));
          *(void *)(a1 + 128) = 0;
          goto LABEL_46;
        }
        *(_DWORD *)int v59 = 134218496;
        *(void *)&v59[4] = a1;
        *(_WORD *)&v59[12] = 2048;
        *(void *)&v59[14] = v41;
        *(_WORD *)&v59[22] = 2048;
        *(void *)&v59[24] = v26;
        size_t v28 = "PKTextureLoader (%p): invalid buffer sizes - %zu, %zu.";
        v29 = v27;
        uint32_t v30 = 32;
LABEL_43:
        _os_log_impl(&dword_21EEBD000, v29, OS_LOG_TYPE_DEFAULT, v28, v59, v30);
        goto LABEL_44;
      }
      if (!is_mul_ok(v11, *(unint64_t *)&v59[24]))
      {
        uint64_t v21 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)vImage_CGImageFormat buf = 134218240;
          BOOL v56 = v11;
          uint64_t v57 = 2048;
          uint64_t v58 = v20;
          v22 = "PKTextureLoader: image size computation overflowed - %zu x %zu.";
LABEL_38:
          _os_log_impl(&dword_21EEBD000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
          goto LABEL_39;
        }
        goto LABEL_39;
      }
      unint64_t v24 = v11 * *(void *)&v59[24];
      uint64_t v25 = *MEMORY[0x263EF8AF8] - 1;
      if (__CFADD__(v24, v25))
      {
        uint64_t v21 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)vImage_CGImageFormat buf = 134218240;
          BOOL v56 = v24;
          uint64_t v57 = 2048;
          uint64_t v58 = v25;
          v22 = "PKTextureLoader: buffer allocation size computation overflowed - %zu + %zu.";
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      vm_size_t v26 = (v24 + v25) & -*MEMORY[0x263EF8AF8];
      v53.rowBytes = *(void *)&v59[24];
      if (!v41 || !v26) {
        goto LABEL_41;
      }
      uint32_t v42 = vm_allocate(*v10, (vm_address_t *)&address, v41, 1);
      if (v42)
      {
        int v50 = v42;
        v27 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)int v59 = 134218240;
        *(void *)&v59[4] = a1;
        *(_WORD *)&v59[12] = 1024;
        *(_DWORD *)&v59[14] = v50;
        size_t v28 = "PKTextureLoader (%p): could not create source allocation - %d.";
        v29 = v27;
        uint32_t v30 = 18;
        goto LABEL_43;
      }
      v43 = MEMORY[0x223C3DA90](&address, a1 + 24, 0, *(void *)(a1 + 128), v6 | 0x200);
      if (v43)
      {
        size_t v44 = v43;
        v27 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)int v59 = 134218240;
        *(void *)&v59[4] = a1;
        *(_WORD *)&v59[12] = 2048;
        *(void *)&v59[14] = v44;
        size_t v28 = "PKTextureLoader (%p): could not fill source buffer - %zd.";
        v29 = v27;
        uint32_t v30 = 22;
        goto LABEL_43;
      }
      CFRelease(*(CFTypeRef *)(a1 + 128));
      *(void *)(a1 + 128) = 0;
      if (v26 == v41
        && (v53.data = address.data,
            vImageConverter_MustOperateOutOfPlace(*(const vImageConverterRef *)(a1 + 136), &address, &v53, v6)))
      {
        v53.data = 0;
      }
      else if (v53.data)
      {
        goto LABEL_72;
      }
      if (vm_allocate(*v10, (vm_address_t *)&v53, v26, 1))
      {
        int v52 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v59 = 134218240;
          *(void *)&v59[4] = a1;
          *(_WORD *)&v59[12] = 2048;
          *(void *)&v59[14] = 0;
          _os_log_impl(&dword_21EEBD000, v52, OS_LOG_TYPE_DEFAULT, "PKTextureLoader (%p): could not create destination allocation - %zd.", v59, 0x16u);
        }

LABEL_46:
        if (address.data) {
          MEMORY[0x223C3DB10](*v10, address.data, v41);
        }
        if (v53.data) {
          MEMORY[0x223C3DB10](*v10, v53.data, v26);
        }
        v31 = *(vImageConverter **)(a1 + 136);
        if (v31)
        {
          vImageConverter_Release(v31);
          *(void *)(a1 + 136) = 0;
        }
        size_t v32 = *(void **)(a1 + 120);
        *(void *)(a1 + 120) = 0;

        size_t v33 = *(void **)(a1 + 144);
        if (v33)
        {
          uint64_t v34 = *(void *)(a1 + 160);
          uint64_t v35 = *(void *)(a1 + 168);
          v36 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = [v33 length];
            *(_DWORD *)int v59 = 134218496;
            *(void *)&v59[4] = a1;
            *(_WORD *)&v59[12] = 2048;
            *(void *)&v59[14] = v35 * v34;
            *(_WORD *)&v59[22] = 2048;
            *(void *)&v59[24] = v37 - v35 * v34;
            uint32_t v38 = "PKTextureLoader (%p): decoded %zu + %zu bytes.";
            v39 = v36;
            uint32_t v40 = 32;
LABEL_57:
            _os_log_impl(&dword_21EEBD000, v39, OS_LOG_TYPE_DEFAULT, v38, v59, v40);
          }
        }
        else
        {
          v36 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int v59 = 134217984;
            *(void *)&v59[4] = a1;
            uint32_t v38 = "PKTextureLoader (%p): failed to decode bytes.";
            v39 = v36;
            uint32_t v40 = 12;
            goto LABEL_57;
          }
        }

        goto LABEL_59;
      }
LABEL_72:
      size_t v45 = vImageConvert_AnyToAny(*(const vImageConverterRef *)(a1 + 136), &address, &v53, 0, v6);
      BOOL v46 = v45;
      if (address.data == v53.data) {
        address.data = 0;
      }
      if (v45)
      {
        uint64_t v51 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v59 = 134218240;
          *(void *)&v59[4] = a1;
          *(_WORD *)&v59[12] = 2048;
          *(void *)&v59[14] = v46;
          _os_log_impl(&dword_21EEBD000, v51, OS_LOG_TYPE_DEFAULT, "PKTextureLoader (%p): could not convert to destination format - %zd.", v59, 0x16u);
        }
      }
      else
      {
        *(void *)(a1 + 168) = v53.rowBytes;
        *(int8x16_t *)(a1 + 152) = vextq_s8(*(int8x16_t *)&v53.height, *(int8x16_t *)&v53.height, 8uLL);
        int v47 = objc_msgSend(*(id *)(a1 + 120), "newBufferWithBytesNoCopy:length:options:deallocator:");
        int v48 = *(void **)(a1 + 144);
        *(void *)(a1 + 144) = v47;

        if (*(void *)(a1 + 144)) {
          v53.data = 0;
        }
      }
      goto LABEL_46;
    }
    if (is_mul_ok(v11, *(unint64_t *)&v59[24]))
    {
      uint64_t v18 = *MEMORY[0x263EF8AF8] - 1;
      if (!__CFADD__(v11 * *(void *)&v59[24], v18))
      {
        vm_size_t v41 = (v11 * *(void *)&v59[24] + v18) & -*MEMORY[0x263EF8AF8];
        goto LABEL_26;
      }
      id v14 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)vImage_CGImageFormat buf = 134218240;
      BOOL v56 = v11 * v13;
      uint64_t v57 = 2048;
      uint64_t v58 = v18;
      v15 = "PKTextureLoader: buffer allocation size computation overflowed - %zu + %zu.";
    }
    else
    {
      id v14 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

        goto LABEL_25;
      }
      *(_DWORD *)vImage_CGImageFormat buf = 134218240;
      BOOL v56 = v11;
      uint64_t v57 = 2048;
      uint64_t v58 = v13;
      v15 = "PKTextureLoader: image size computation overflowed - %zu x %zu.";
    }
    _os_log_impl(&dword_21EEBD000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
    goto LABEL_24;
  }
}

void __27__PKTextureLoader__decode___block_invoke()
{
}

- (void)decode
{
}

- (void)_tiling:(void *)a3 read:
{
  v5 = a3;
  if (a1)
  {
    -[PKTextureLoader _decode:](a1, a2);
    uint64_t v6 = *(void *)(a1 + 144);
    if (v6)
    {
      uint64_t v7 = 0;
      int v8 = *(_DWORD *)(a1 + 88) & 0x1F;
      uint64_t v14 = 0;
      uint64_t v10 = v6;
      long long v9 = *(_OWORD *)(a1 + 168);
      long long v11 = *(_OWORD *)(a1 + 152);
      long long v12 = v9;
      if (v8 != 7) {
        uint64_t v7 = *(void *)(a1 + 112);
      }
      uint64_t v13 = v7;
      LODWORD(v14) = v8;
      v5[2](v5, &v10);
    }
    else
    {
      v5[2](v5, 0);
    }
  }
}

- (void)tiling:(BOOL)a3 read:(id)a4
{
}

- (unint64_t)format
{
  return self->_format;
}

@end