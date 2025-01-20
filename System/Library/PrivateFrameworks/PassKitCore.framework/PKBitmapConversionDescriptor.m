@interface PKBitmapConversionDescriptor
+ (id)create;
+ (id)create16Float;
+ (id)create32Float;
+ (id)create8Uint;
- (BOOL)convertContext:(id)a3;
- (BOOL)floatingComponents;
- (CGColorSpace)colorSpace;
- (PKBitmapConversionDescriptor)init;
- (id)alphaInfoTransform;
- (id)colorTransformPolicy;
- (id)convertFromContext:(id)a3;
- (id)convertImage:(CGImage *)a3;
- (uint64_t)_convertContext:(uint64_t)a1;
- (unsigned)bitsPerComponent;
- (unsigned)byteOrder;
- (void)dealloc;
- (void)setAlphaInfoTransform:(id)a3;
- (void)setBitsPerComponent:(unsigned __int8)a3 withByteOrder:(unsigned int)a4;
- (void)setColorSpace:(CGColorSpace *)a3 withPolicy:(id)a4;
- (void)setFloatingComponents:(BOOL)a3;
@end

@implementation PKBitmapConversionDescriptor

+ (id)create
{
  id result = [PKBitmapConversionDescriptor alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PKBitmapConversionDescriptor;
    id result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      *((_WORD *)result + 4) = 0;
      *((_DWORD *)result + 3) = 0;
    }
  }
  return result;
}

+ (id)create8Uint
{
  v2 = [PKBitmapConversionDescriptor alloc];
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)PKBitmapConversionDescriptor;
    id v3 = objc_msgSendSuper2(&v6, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_WORD *)v3 + 4) = 0;
      *((_DWORD *)v3 + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  [v4 setFloatingComponents:0];
  [v4 setBitsPerComponent:8 withByteOrder:0x2000];
  [v4 setAlphaInfoTransform:&__block_literal_global_44];
  return v4;
}

uint64_t __43__PKBitmapConversionDescriptor_create8Uint__block_invoke(uint64_t a1, unsigned int a2)
{
  if (a2 < 8) {
    return dword_191673BF8[a2];
  }
  __break(1u);
  return result;
}

+ (id)create16Float
{
  v2 = [PKBitmapConversionDescriptor alloc];
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)PKBitmapConversionDescriptor;
    id v3 = objc_msgSendSuper2(&v6, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_WORD *)v3 + 4) = 0;
      *((_DWORD *)v3 + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  [v4 setFloatingComponents:1];
  [v4 setBitsPerComponent:16 withByteOrder:4096];
  [v4 setAlphaInfoTransform:&__block_literal_global_41];
  return v4;
}

uint64_t __45__PKBitmapConversionDescriptor_create16Float__block_invoke(uint64_t a1, unsigned int a2)
{
  if (a2 < 8) {
    return dword_191673C18[a2];
  }
  __break(1u);
  return result;
}

+ (id)create32Float
{
  v2 = [PKBitmapConversionDescriptor alloc];
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)PKBitmapConversionDescriptor;
    id v3 = objc_msgSendSuper2(&v6, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_WORD *)v3 + 4) = 0;
      *((_DWORD *)v3 + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  [v4 setFloatingComponents:1];
  [v4 setBitsPerComponent:32 withByteOrder:0x2000];
  [v4 setAlphaInfoTransform:&__block_literal_global_43];
  return v4;
}

uint64_t __45__PKBitmapConversionDescriptor_create32Float__block_invoke(uint64_t a1, unsigned int a2)
{
  if (a2 < 8) {
    return dword_191673C18[a2];
  }
  __break(1u);
  return result;
}

- (PKBitmapConversionDescriptor)init
{
  return 0;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PKBitmapConversionDescriptor;
  [(PKBitmapConversionDescriptor *)&v3 dealloc];
}

- (BOOL)convertContext:(id)a3
{
  return -[PKBitmapConversionDescriptor _convertContext:]((uint64_t)self, a3);
}

- (uint64_t)_convertContext:(uint64_t)a1
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3) {
      goto LABEL_122;
    }
    v5 = (char *)v3;
    uint64_t v6 = *((_DWORD *)v5 + 8) & 0x1F;
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7)
    {
      LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
      if (v6 >= 0x20) {
        goto LABEL_122;
      }
    }
    v8 = (vImage_CGImageFormat *)(v5 + 16);
    int v9 = *(unsigned __int8 *)(a1 + 8) << 8;
    int v10 = *(unsigned __int8 *)(a1 + 9);
    v11 = (_DWORD *)(a1 + 12);
    if (!*(unsigned char *)(a1 + 9)) {
      v11 = v5 + 32;
    }
    int v12 = *v11 & 0x7000;
    memset(&space, 0, sizeof(space));
    if (&space != v8)
    {
      long long v13 = *((_OWORD *)v5 + 2);
      *(_OWORD *)&space.bitsPerComponent = *(_OWORD *)&v8->bitsPerComponent;
      *(_OWORD *)&space.CGBitmapInfo bitmapInfo = v13;
      *(void *)&space.CGColorRenderingIntent renderingIntent = *((void *)v5 + 6);
    }
    space.CGBitmapInfo bitmapInfo = v9 | v12 | v6;
    if (v6 == 7)
    {
      v14 = 0;
    }
    else
    {
      v14 = *(CGColorSpace **)(a1 + 24);
      if (!v14) {
        v14 = (CGColorSpace *)*((void *)v5 + 3);
      }
    }
    space.colorSpace = v14;
    if (v10)
    {
      if (v6 == 7 || !v14)
      {
        size_t NumberOfComponents = v6 != 0;
      }
      else
      {
        size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v14);
        if (NumberOfComponents >= 0x100) {
          goto LABEL_122;
        }
        if (v6)
        {
          if (NumberOfComponents == 255) {
            goto LABEL_122;
          }
          ++NumberOfComponents;
        }
      }
      uint64_t v16 = *(unsigned __int8 *)(a1 + 9);
      space.bitsPerComponent = *(unsigned __int8 *)(a1 + 9);
      unint64_t v17 = NumberOfComponents * v16;
      if (v17 >= 0x100) {
        goto LABEL_122;
      }
      space.bitsPerPixel = v17;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      CGColorRenderingIntent v19 = (*(unsigned int (**)(uint64_t, void, CGColorSpaceRef))(v18 + 16))(v18, *((void *)v5 + 3), space.colorSpace);
    }
    else {
      CGColorRenderingIntent v19 = kCGRenderingIntentPerceptual;
    }
    space.CGColorRenderingIntent renderingIntent = v19;
    if (v5[8]) {
LABEL_123:
    }
      __break(1u);
    if (*((void *)v5 + 2) == *(void *)&space.bitsPerComponent)
    {
      v20 = (CGColorSpace *)*((void *)v5 + 3);
      if (v20 == space.colorSpace) {
        goto LABEL_36;
      }
      if (v20)
      {
        if (space.colorSpace)
        {
          CFStringRef Name = CGColorSpaceGetName(v20);
          CFStringRef v22 = CGColorSpaceGetName(space.colorSpace);
          if (Name == v22 || Name && v22 && CFEqual(Name, v22))
          {
            size_t v23 = CGColorSpaceGetNumberOfComponents(*((CGColorSpaceRef *)v5 + 3));
            if (v23 != CGColorSpaceGetNumberOfComponents(space.colorSpace)) {
              goto LABEL_122;
            }
LABEL_36:
            if (*((_DWORD *)v5 + 9) == space.version && *((_DWORD *)v5 + 8) == space.bitmapInfo)
            {
              v24 = (const CGFloat *)*((void *)v5 + 5);
              if (v24 == space.decode) {
                goto LABEL_94;
              }
              if (v24 && space.decode)
              {
                int v25 = *((_DWORD *)v5 + 8) & 0x1F;
                if (v25 == 7 || !space.colorSpace)
                {
                  LOBYTE(v26) = v25 != 0;
                }
                else
                {
                  size_t v26 = CGColorSpaceGetNumberOfComponents(space.colorSpace);
                  if (v26 >= 0x100) {
                    goto LABEL_122;
                  }
                  if (v25)
                  {
                    if (v26 == 255) {
                      goto LABEL_122;
                    }
                    LOBYTE(v26) = v26 + 1;
                  }
                }
                if (!memcmp(*((const void **)v5 + 5), space.decode, 16 * v26))
                {
LABEL_94:
                  uint64_t v47 = 1;
                  goto LABEL_112;
                }
              }
            }
          }
        }
      }
    }
    vImage_Error error = 0;
    v27 = vImageConverter_CreateWithCGImageFormat((const vImage_CGImageFormat *)(v5 + 16), &space, 0, 0, &error);
    if (v27)
    {
      v28 = v27;
      vImage_Error error = 0;
      unint64_t NumberOfSourceBuffers = vImageConverter_GetNumberOfSourceBuffers(v27);
      unint64_t NumberOfDestinationBuffers = vImageConverter_GetNumberOfDestinationBuffers(v28);
      unint64_t v31 = NumberOfDestinationBuffers;
      if (NumberOfSourceBuffers == 1 && NumberOfDestinationBuffers == 1)
      {
        memset(&dests, 0, sizeof(dests));
        uint64_t v32 = MEMORY[0x192FDD2F0](&dests, *((void *)v5 + 8), *((void *)v5 + 9), space.bitsPerPixel, 512);
        if (v32 < 0) {
          goto LABEL_122;
        }
        if (!is_mul_ok(dests.height, dests.rowBytes))
        {
          v38 = 0;
          goto LABEL_90;
        }
        unint64_t v33 = v32;
        v34 = (void **)(v5 + 56);
        v35 = (void *)*((void *)v5 + 11);
        if (v35)
        {
          vImagePixelCount v36 = dests.height * dests.rowBytes;
          if (v36 <= [v35 length] && (!v33 || !((unint64_t)*v34 % v33)))
          {
            dests.data = *v34;
            v37 = *((id *)v5 + 11);
            if (!vImageConverter_MustOperateOutOfPlace(v28, (const vImage_Buffer *)(v5 + 56), &dests, 0x10u)) {
              goto LABEL_61;
            }
            dests.data = 0;
          }
        }
        v37 = 0;
LABEL_61:
        if (dests.data)
        {
          v38 = v37;
LABEL_63:
          vImage_Error v39 = vImageConvert_AnyToAny(v28, (const vImage_Buffer *)(v5 + 56), &dests, 0, 0x10u);
          vImage_Error error = v39;
          if (!v39)
          {
            vImageConverter_Release(v28);
            v40 = _PKCreateBitmapContext((CGColorSpaceRef *)&space, (uint64_t)&dests, v38, 1);
            if (v40)
            {
              v41 = v40;
              CGContextGetBaseCTM();
              CGContextSetBaseCTM();
              if (&space == v8)
              {
LABEL_110:
                long long v66 = *(_OWORD *)&dests.width;
                *(_OWORD *)v34 = *(_OWORD *)&dests.data;
                *(_OWORD *)(v5 + 72) = v66;
                objc_storeStrong((id *)v5 + 11, v38);
                CGContextRelease(*((CGContextRef *)v5 + 12));
                *((void *)v5 + 12) = v41;
                char v56 = 1;
                goto LABEL_111;
              }
              v42 = CGColorSpaceRetain(space.colorSpace);
              v43 = v42;
              if (!space.decode) {
                goto LABEL_104;
              }
              int v44 = space.bitmapInfo & 0x1F;
              if (!v42 || v44 == 7)
              {
                if ((space.bitmapInfo & 0x1F) != 0)
                {
                  LOBYTE(v45) = 1;
                  goto LABEL_103;
                }
                goto LABEL_104;
              }
              size_t v45 = CGColorSpaceGetNumberOfComponents(v42);
              if (v45 < 0x100)
              {
                if (v44)
                {
                  if (v45 != 255)
                  {
                    LOBYTE(v45) = v45 + 1;
LABEL_103:
                    size_t v59 = 16 * v45;
                    v60 = malloc_type_aligned_alloc(8uLL, v59, 0x84BB333AuLL);
                    memcpy(v60, space.decode, v59);
LABEL_105:
                    v61 = (const void *)*((void *)v5 + 3);
                    if (v61)
                    {
                      CFRelease(v61);
                      *((void *)v5 + 3) = 0;
                    }
                    v62 = (void *)*((void *)v5 + 5);
                    if (v62) {
                      free(v62);
                    }
                    CGBitmapInfo bitmapInfo = space.bitmapInfo;
                    uint32_t version = space.version;
                    CGColorRenderingIntent renderingIntent = space.renderingIntent;
                    *((void *)v5 + 2) = *(void *)&space.bitsPerComponent;
                    *((void *)v5 + 3) = v43;
                    *((_DWORD *)v5 + 8) = bitmapInfo;
                    *((_DWORD *)v5 + 9) = version;
                    *((void *)v5 + 5) = v60;
                    *((_DWORD *)v5 + 12) = renderingIntent;
                    goto LABEL_110;
                  }
                  goto LABEL_122;
                }
                if ((_BYTE)v45) {
                  goto LABEL_103;
                }
LABEL_104:
                v60 = 0;
                goto LABEL_105;
              }
LABEL_122:
              __break(1u);
              goto LABEL_123;
            }
LABEL_91:
            char v56 = 0;
LABEL_111:
            unsigned __int8 v73 = v56;

            uint64_t v47 = v73;
            goto LABEL_112;
          }
          vImage_Error v69 = v39;
          v37 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v75 = v5;
            __int16 v76 = 2048;
            vImage_Error v77 = v69;
            _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): could not convert to destination format - %zd.", buf, 0x16u);
          }
          goto LABEL_89;
        }
        vImagePixelCount height = dests.height;
        size_t rowBytes = dests.rowBytes;
        if (!is_mul_ok(dests.height, dests.rowBytes))
        {
          v50 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v75 = (char *)height;
            __int16 v76 = 2048;
            vImage_Error v77 = rowBytes;
            v51 = "PKBitmapContext: image length computation overflowed - %zu x %zu.";
LABEL_85:
            v54 = v50;
            uint32_t v55 = 22;
LABEL_86:
            _os_log_impl(&dword_190E10000, v54, OS_LOG_TYPE_DEFAULT, v51, buf, v55);
            goto LABEL_87;
          }
          goto LABEL_87;
        }
        vImagePixelCount v52 = dests.height * dests.rowBytes;
        if (dests.height * dests.rowBytes)
        {
          uint64_t v53 = *MEMORY[0x1E4F14B00] - 1;
          if (__CFADD__(v52, v53))
          {
            v50 = PKLogFacilityTypeGetObject(0);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v75 = (char *)v52;
              __int16 v76 = 2048;
              vImage_Error v77 = v53;
              v51 = "PKBitmapContext: buffer length computation overflowed - %zu + %zu.";
              goto LABEL_85;
            }
LABEL_87:

            goto LABEL_88;
          }
          vm_size_t v57 = (v52 + v53) & -*MEMORY[0x1E4F14B00];
          if (v52 > v57) {
            goto LABEL_122;
          }
          if (vm_allocate(*MEMORY[0x1E4F14960], (vm_address_t *)&dests, v57, 1))
          {
            v50 = PKLogFacilityTypeGetObject(0);
            if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_87;
            }
            *(_DWORD *)buf = 134217984;
            v75 = (char *)v57;
            v51 = "PKBitmapContext: could not create allocation of size %zu.";
            v54 = v50;
            uint32_t v55 = 12;
            goto LABEL_86;
          }
          if (dests.data)
          {
            if (v33 && os_variant_has_internal_ui() && (unint64_t)dests.data % v33) {
              goto LABEL_122;
            }
            id v58 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            v38 = [v58 initWithBytesNoCopy:dests.data length:v57 deallocator:&__block_literal_global_103];

            if (!v38) {
              goto LABEL_90;
            }
            goto LABEL_63;
          }
        }
LABEL_88:
        v38 = 0;
LABEL_89:

LABEL_90:
        vImageConverter_Release(v28);
        goto LABEL_91;
      }
      v68 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v75 = v5;
        __int16 v76 = 2048;
        vImage_Error v77 = NumberOfSourceBuffers;
        __int16 v78 = 2048;
        unint64_t v79 = v31;
        _os_log_impl(&dword_190E10000, v68, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): converter requires an unexpected number of buffers - %lu -> %lu.", buf, 0x20u);
      }

      vImageConverter_Release(v28);
    }
    else
    {
      v46 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v75 = v5;
        __int16 v76 = 2048;
        vImage_Error v77 = error;
        _os_log_impl(&dword_190E10000, v46, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): cannot create converter - %zd.", buf, 0x16u);
      }
    }
  }
  uint64_t v47 = 0;
LABEL_112:

  return v47;
}

- (id)convertFromContext:(id)a3
{
  id result = a3;
  if (result)
  {
    id v5 = result;
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x3032000000;
    int v12 = __Block_byref_object_copy__16;
    long long v13 = __Block_byref_object_dispose__16;
    id v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__PKBitmapConversionDescriptor_convertFromContext___block_invoke;
    v8[3] = &unk_1E56E04E8;
    v8[4] = &v9;
    -[PKBitmapContext _accessContext:]((uint64_t)result, v8);
    if (-[PKBitmapConversionDescriptor _convertContext:]((uint64_t)self, (void *)v10[5])) {
      uint64_t v6 = (void *)v10[5];
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    _Block_object_dispose(&v9, 8);

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void __51__PKBitmapConversionDescriptor_convertFromContext___block_invoke(uint64_t a1, CGContext *a2)
{
  unint64_t v3 = -[PKBitmapContext _initWithBitmapContext:]((unint64_t)[PKBitmapContext alloc], a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)convertImage:(CGImage *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_60;
  }
  id v5 = [PKBitmapContext alloc];
  if (!v5)
  {
LABEL_61:
    uint64_t v6 = 0;
    goto LABEL_40;
  }
  v46.receiver = v5;
  v46.super_class = (Class)PKBitmapContext;
  uint64_t v6 = [(PKBitmapConversionDescriptor *)&v46 init];
  if (!v6)
  {
LABEL_41:
    v37 = 0;
    goto LABEL_42;
  }
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  if (HIDWORD(BitsPerComponent)) {
    goto LABEL_60;
  }
  int v8 = BitsPerComponent;
  size_t v45 = self;
  size_t BitsPerPixel = CGImageGetBitsPerPixel(a3);
  if (HIDWORD(BitsPerPixel)) {
    goto LABEL_60;
  }
  int v10 = BitsPerPixel;
  ColorSpace = CGImageGetColorSpace(a3);
  CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(a3);
  Decode = CGImageGetDecode(a3);
  CGColorRenderingIntent RenderingIntent = CGImageGetRenderingIntent(a3);
  v15 = CGColorSpaceRetain(ColorSpace);
  uint64_t v16 = v15;
  if (!Decode) {
    goto LABEL_17;
  }
  if ((BitmapInfo & 0x1F) == 7 || !v15)
  {
    if ((BitmapInfo & 0x1F) != 0)
    {
      LOBYTE(NumberOfComponents) = 1;
      goto LABEL_16;
    }
LABEL_17:
    CGColorRenderingIntent v19 = 0;
    goto LABEL_18;
  }
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v15);
  if (NumberOfComponents >= 0x100) {
    goto LABEL_60;
  }
  if ((BitmapInfo & 0x1F) != 0)
  {
    if (NumberOfComponents == 255) {
      goto LABEL_60;
    }
    LOBYTE(NumberOfComponents) = NumberOfComponents + 1;
    goto LABEL_16;
  }
  if (!(_BYTE)NumberOfComponents) {
    goto LABEL_17;
  }
LABEL_16:
  size_t v18 = 16 * NumberOfComponents;
  CGColorRenderingIntent v19 = malloc_type_aligned_alloc(8uLL, v18, 0x84BB333AuLL);
  memcpy(v19, Decode, v18);
LABEL_18:
  v20 = (const void *)*((void *)v6 + 3);
  if (v20)
  {
    CFRelease(v20);
    *((void *)v6 + 3) = 0;
  }
  v21 = (void *)*((void *)v6 + 5);
  if (v21) {
    free(v21);
  }
  *((_DWORD *)v6 + 4) = v8;
  *((_DWORD *)v6 + 5) = v10;
  *((void *)v6 + 3) = v16;
  *((_DWORD *)v6 + 8) = BitmapInfo;
  *((_DWORD *)v6 + 9) = 0;
  *((void *)v6 + 5) = v19;
  *((_DWORD *)v6 + 12) = RenderingIntent;
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  v24 = v6 + 56;
  uint64_t v25 = MEMORY[0x192FDD2F0](v6 + 56, Height, Width, *((unsigned int *)v6 + 5), 512);
  if (v25 < 0 || *v24) {
    goto LABEL_60;
  }
  unint64_t v26 = *((void *)v6 + 8);
  unint64_t v27 = *((void *)v6 + 10);
  if (!is_mul_ok(v26, v27))
  {
    v28 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = (char *)v26;
      __int16 v49 = 2048;
      unint64_t v50 = v27;
      v29 = "PKBitmapContext: image length computation overflowed - %zu x %zu.";
LABEL_32:
      _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  vm_size_t v30 = v26 * v27;
  if (!v30) {
    goto LABEL_34;
  }
  uint64_t v31 = *MEMORY[0x1E4F14B00] - 1;
  if (__CFADD__(v30, v31))
  {
    v28 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = (char *)v30;
      __int16 v49 = 2048;
      unint64_t v50 = v31;
      v29 = "PKBitmapContext: buffer length computation overflowed - %zu + %zu.";
      goto LABEL_32;
    }
LABEL_33:

    goto LABEL_34;
  }
  vm_size_t v42 = (v30 + v31) & -*MEMORY[0x1E4F14B00];
  if (v30 > v42) {
    goto LABEL_60;
  }
  unint64_t v43 = v25;
  if (vm_allocate(*MEMORY[0x1E4F14960], (vm_address_t *)v6 + 7, v42, 1))
  {
    int v44 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v48 = (char *)v42;
      _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "PKBitmapContext: could not create allocation of size %zu.", buf, 0xCu);
    }

    goto LABEL_34;
  }
  if (!*v24)
  {
LABEL_34:
    uint64_t v32 = 0;
    goto LABEL_35;
  }
  if (v43 && os_variant_has_internal_ui() && *v24 % v43)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*v24 length:v42 deallocator:&__block_literal_global_103];
LABEL_35:
  unint64_t v33 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = v32;

  if (!*((void *)v6 + 11))
  {
LABEL_40:

    uint64_t v6 = 0;
    goto LABEL_41;
  }
  uint64_t v34 = MEMORY[0x192FDD300](v6 + 56, v6 + 16, 0, a3, 528);
  if (v34)
  {
    uint64_t v35 = v34;
    vImagePixelCount v36 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = v6;
      __int16 v49 = 2048;
      unint64_t v50 = v35;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): could not unpack image into buffer - %zd.", buf, 0x16u);
    }

    goto LABEL_40;
  }
  vImage_Error v39 = (void *)*((void *)v6 + 5);
  if (v39)
  {
    free(v39);
    *((void *)v6 + 5) = 0;
  }
  v40 = _PKCreateBitmapContext((CGColorSpaceRef *)v6 + 2, (uint64_t)(v6 + 56), *((void **)v6 + 11), 1);
  *((void *)v6 + 12) = v40;
  if (!v40) {
    goto LABEL_40;
  }
  uint64_t v6 = v6;

  if (-[PKBitmapConversionDescriptor _convertContext:]((uint64_t)v45, v6)) {
    v41 = v6;
  }
  else {
    v41 = 0;
  }
  v37 = v41;
LABEL_42:

  return v37;
}

- (void)setBitsPerComponent:(unsigned __int8)a3 withByteOrder:(unsigned int)a4
{
  self->_bitsPerComponent = a3;
  if ((a4 & 0xFFFF8FFF) != 0) {
    __break(1u);
  }
  else {
    self->_byteOrder = a4 & 0x7000;
  }
}

- (void)setColorSpace:(CGColorSpace *)a3 withPolicy:(id)a4
{
  colorSpace = self->_colorSpace;
  id v7 = a4;
  CGColorSpaceRelease(colorSpace);
  self->_colorSpace = CGColorSpaceRetain(a3);
  int v8 = _Block_copy(v7);

  id colorTransformPolicy = self->_colorTransformPolicy;
  self->_id colorTransformPolicy = v8;
}

- (id)alphaInfoTransform
{
  return self->_alphaInfoTransform;
}

- (void)setAlphaInfoTransform:(id)a3
{
}

- (BOOL)floatingComponents
{
  return self->_floatingComponents;
}

- (void)setFloatingComponents:(BOOL)a3
{
  self->_floatingComponents = a3;
}

- (unsigned)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (unsigned)byteOrder
{
  return self->_byteOrder;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (id)colorTransformPolicy
{
  return self->_colorTransformPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorTransformPolicy, 0);
  objc_storeStrong(&self->_alphaInfoTransform, 0);
}

@end