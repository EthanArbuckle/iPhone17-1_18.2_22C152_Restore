@interface PKBitmapContext
+ (id)create16FloatExtendedWithSize:(id)a3 configuration:(id)a4;
+ (id)create16FloatWithSize:(id)a3 configuration:(id)a4;
+ (id)create32FloatWithSize:(id)a3 configuration:(id)a4;
+ (id)create8UintWithSize:(id)a3 configuration:(id)a4;
+ (id)createWithCGBitmapContext:(CGContext *)a3;
+ (id)createWithSize:(id)a3 origin:(char)a4 format:(const vImage_CGImageFormat *)a5;
- (PKBitmapContext)init;
- (char)_initWithSize:(uint64_t)a3 origin:(int)a4 format:(char *)a5;
- (unint64_t)_initWithBitmapContext:(unint64_t)result;
- (void)_accessContext:(uint64_t)a1;
- (void)accessContext:(id)a3;
- (void)accessData:(id)a3;
- (void)dealloc;
@end

@implementation PKBitmapContext

+ (id)createWithSize:(id)a3 origin:(char)a4 format:(const vImage_CGImageFormat *)a5
{
  int v6 = a4;
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v9 = [PKBitmapContext alloc];
  return [(PKBitmapContext *)v9 _initWithSize:var1 origin:v6 format:(char *)a5];
}

- (char)_initWithSize:(uint64_t)a3 origin:(int)a4 format:(char *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_50;
  }
  if (!a5) {
    goto LABEL_49;
  }
  v40.receiver = a1;
  v40.super_class = (Class)PKBitmapContext;
  v9 = (char *)objc_msgSendSuper2(&v40, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v9 + 16 == a5) {
      goto LABEL_22;
    }
    v11 = CGColorSpaceRetain(*((CGColorSpaceRef *)a5 + 1));
    v12 = v11;
    if (*((void *)a5 + 3))
    {
      int v13 = *((_DWORD *)a5 + 4) & 0x1F;
      if (!v11 || v13 == 7)
      {
        if (v13)
        {
          LOBYTE(NumberOfComponents) = 1;
          goto LABEL_15;
        }
      }
      else
      {
        size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v11);
        if (NumberOfComponents >= 0x100) {
          goto LABEL_49;
        }
        if (v13)
        {
          if (NumberOfComponents == 255) {
            goto LABEL_49;
          }
          LOBYTE(NumberOfComponents) = NumberOfComponents + 1;
          goto LABEL_15;
        }
        if ((_BYTE)NumberOfComponents)
        {
LABEL_15:
          size_t v15 = 16 * NumberOfComponents;
          v16 = malloc_type_aligned_alloc(8uLL, v15, 0x84BB333AuLL);
          memcpy(v16, *((const void **)a5 + 3), v15);
LABEL_17:
          v17 = (const void *)*((void *)v10 + 3);
          if (v17)
          {
            CFRelease(v17);
            *((void *)v10 + 3) = 0;
          }
          v18 = (void *)*((void *)v10 + 5);
          if (v18) {
            free(v18);
          }
          int v20 = *(_DWORD *)a5;
          int v19 = *((_DWORD *)a5 + 1);
          int v21 = *((_DWORD *)a5 + 8);
          *((void *)v10 + 3) = v12;
          uint64_t v22 = *((void *)a5 + 2);
          *((_DWORD *)v10 + 4) = v20;
          *((_DWORD *)v10 + 5) = v19;
          *((void *)v10 + 4) = v22;
          *((void *)v10 + 5) = v16;
          *((_DWORD *)v10 + 12) = v21;
LABEL_22:
          v23 = v10 + 56;
          uint64_t v24 = MEMORY[0x192FDD2F0](v10 + 56, a3, a2);
          if ((v24 & 0x8000000000000000) == 0 && !*v23)
          {
            unint64_t v25 = *((void *)v10 + 8);
            unint64_t v26 = *((void *)v10 + 10);
            if (!is_mul_ok(v25, v26))
            {
              v27 = PKLogFacilityTypeGetObject(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                unint64_t v42 = v25;
                __int16 v43 = 2048;
                unint64_t v44 = v26;
                v28 = "PKBitmapContext: image length computation overflowed - %zu x %zu.";
LABEL_32:
                _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
                goto LABEL_33;
              }
              goto LABEL_33;
            }
            vm_size_t v29 = v25 * v26;
            if (!v29) {
              goto LABEL_34;
            }
            uint64_t v30 = *MEMORY[0x1E4F14B00] - 1;
            if (__CFADD__(v29, v30))
            {
              v27 = PKLogFacilityTypeGetObject(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                unint64_t v42 = v29;
                __int16 v43 = 2048;
                unint64_t v44 = v30;
                v28 = "PKBitmapContext: buffer length computation overflowed - %zu + %zu.";
                goto LABEL_32;
              }
LABEL_33:

              goto LABEL_34;
            }
            vm_size_t v36 = (v29 + v30) & -*MEMORY[0x1E4F14B00];
            if (v29 > v36) {
              goto LABEL_49;
            }
            unint64_t v37 = v24;
            if (vm_allocate(*MEMORY[0x1E4F14960], (vm_address_t *)v10 + 7, v36, 1))
            {
              v38 = PKLogFacilityTypeGetObject(0);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                unint64_t v42 = v36;
                _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "PKBitmapContext: could not create allocation of size %zu.", buf, 0xCu);
              }

              goto LABEL_34;
            }
            if (!*v23)
            {
LABEL_34:
              uint64_t v31 = 0;
LABEL_35:
              v32 = (void *)*((void *)v10 + 11);
              *((void *)v10 + 11) = v31;

              v33 = (void *)*((void *)v10 + 11);
              if (v33)
              {
                v34 = _PKCreateBitmapContext((CGColorSpaceRef *)v10 + 2, (uint64_t)(v10 + 56), v33, a4);
                *((void *)v10 + 12) = v34;
                if (v34) {
                  goto LABEL_37;
                }
              }
LABEL_51:
              v35 = 0;
              goto LABEL_52;
            }
            if (!v37 || !os_variant_has_internal_ui() || !(*v23 % v37))
            {
              uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*v23 length:v36 deallocator:&__block_literal_global_103];
              goto LABEL_35;
            }
          }
LABEL_49:
          __break(1u);
LABEL_50:
          v10 = 0;
          goto LABEL_51;
        }
      }
    }
    v16 = 0;
    goto LABEL_17;
  }
LABEL_37:
  v10 = v10;
  v35 = v10;
LABEL_52:

  return v35;
}

+ (id)create8UintWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4 = *(_WORD *)&a4.var0;
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0) {
    v7 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  }
  else {
    v7 = (CGColorSpace *)PKColorSpaceStandardRGB();
  }
  v8 = v7;
  if (v7)
  {
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      unint64_t v10 = (8 * (_WORD)NumberOfComponents + 8) & 0x7F8;
      if (v10 < 0x100) {
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  LOBYTE(v10) = 8;
LABEL_9:
  *(void *)&v17[4] = 0;
  if ((v4 & 0x100) != 0) {
    int v11 = 8198;
  }
  else {
    int v11 = 8194;
  }
  v13[0] = 8;
  v13[1] = v10 & 0xF8;
  v14 = v8;
  int v15 = v11;
  uint64_t v16 = 0;
  *(void *)v17 = 0;
  return [[PKBitmapContext alloc] _initWithSize:var1 origin:(char)v4 format:(char *)v13];
}

+ (id)create16FloatWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4 = *(_WORD *)&a4.var0;
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0) {
    v7 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  }
  else {
    v7 = (CGColorSpace *)PKColorSpaceStandardRGB();
  }
  v8 = v7;
  if (v7)
  {
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      unint64_t v10 = (16 * (_WORD)NumberOfComponents + 16) & 0xFF0;
      if (v10 < 0x100) {
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  LOBYTE(v10) = 16;
LABEL_9:
  *(void *)&v17[4] = 0;
  if ((v4 & 0x100) != 0) {
    int v11 = 4357;
  }
  else {
    int v11 = 4353;
  }
  v13[0] = 16;
  v13[1] = v10 & 0xF0;
  v14 = v8;
  int v15 = v11;
  uint64_t v16 = 0;
  *(void *)v17 = 0;
  return [[PKBitmapContext alloc] _initWithSize:var1 origin:(char)v4 format:(char *)v13];
}

+ (id)create16FloatExtendedWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4 = *(_WORD *)&a4.var0;
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0) {
    v7 = (CGColorSpace *)PKColorSpaceStandardExtendedLinearRGB();
  }
  else {
    v7 = (CGColorSpace *)PKColorSpaceStandardExtendedRGB();
  }
  v8 = v7;
  if (v7)
  {
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      unint64_t v10 = (16 * (_WORD)NumberOfComponents + 16) & 0xFF0;
      if (v10 < 0x100) {
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  LOBYTE(v10) = 16;
LABEL_9:
  *(void *)&v17[4] = 0;
  if ((v4 & 0x100) != 0) {
    int v11 = 4357;
  }
  else {
    int v11 = 4353;
  }
  v13[0] = 16;
  v13[1] = v10 & 0xF0;
  v14 = v8;
  int v15 = v11;
  uint64_t v16 = 0;
  *(void *)v17 = 0;
  return [[PKBitmapContext alloc] _initWithSize:var1 origin:(char)v4 format:(char *)v13];
}

+ (id)create32FloatWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4 = *(_WORD *)&a4.var0;
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0) {
    v7 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  }
  else {
    v7 = (CGColorSpace *)PKColorSpaceStandardRGB();
  }
  v8 = v7;
  if (v7)
  {
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      unint64_t v10 = (32 * (_WORD)NumberOfComponents + 32) & 0x1FE0;
      if (v10 < 0x100) {
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  LOBYTE(v10) = 32;
LABEL_9:
  *(void *)&v17[4] = 0;
  if ((v4 & 0x100) != 0) {
    int v11 = 8453;
  }
  else {
    int v11 = 8449;
  }
  v13[0] = 32;
  v13[1] = v10 & 0xE0;
  v14 = v8;
  int v15 = v11;
  uint64_t v16 = 0;
  *(void *)v17 = 0;
  return [[PKBitmapContext alloc] _initWithSize:var1 origin:(char)v4 format:(char *)v13];
}

+ (id)createWithCGBitmapContext:(CGContext *)a3
{
  __int16 v4 = [PKBitmapContext alloc];
  return (id)-[PKBitmapContext _initWithBitmapContext:]((unint64_t)v4, a3);
}

- (unint64_t)_initWithBitmapContext:(unint64_t)result
{
  v2 = (unint64_t *)result;
  if (!result) {
    return (unint64_t)v2;
  }
  if (!context) {
    goto LABEL_20;
  }
  result = (unint64_t)CGBitmapContextGetData(context);
  if (!result) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  v18.receiver = v2;
  v18.super_class = (Class)PKBitmapContext;
  v2 = (unint64_t *)objc_msgSendSuper2(&v18, sel_init);
  if (!v2) {
    return (unint64_t)v2;
  }
  result = CGBitmapContextGetBitsPerComponent(context);
  if (HIDWORD(result)) {
    goto LABEL_20;
  }
  int v5 = result;
  result = CGBitmapContextGetBitsPerPixel(context);
  if (HIDWORD(result)) {
    goto LABEL_20;
  }
  int v6 = result;
  ColorSpace = CGBitmapContextGetColorSpace(context);
  CGBitmapInfo BitmapInfo = CGBitmapContextGetBitmapInfo(context);
  int RenderingIntent = CGContextGetRenderingIntent();
  CGColorSpaceRef v10 = CGColorSpaceRetain(ColorSpace);
  int v11 = (const void *)v2[3];
  if (v11)
  {
    CFRelease(v11);
    v2[3] = 0;
  }
  v12 = (void *)v2[5];
  if (v12) {
    free(v12);
  }
  *((_DWORD *)v2 + 4) = v5;
  *((_DWORD *)v2 + 5) = v6;
  v2[3] = (unint64_t)v10;
  *((_DWORD *)v2 + 8) = BitmapInfo;
  *((_DWORD *)v2 + 9) = 0;
  v2[5] = 0;
  *((_DWORD *)v2 + 12) = RenderingIntent;
  size_t Width = CGBitmapContextGetWidth(context);
  size_t Height = CGBitmapContextGetHeight(context);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(context);
  uint64_t v16 = v2 + 7;
  result = MEMORY[0x192FDD2F0](v2 + 7, Height, Width, *((unsigned int *)v2 + 5), 512);
  if ((result & 0x8000000000000000) != 0) {
    goto LABEL_20;
  }
  unint64_t v17 = result;
  if (v2[10] == BytesPerRow)
  {
LABEL_13:
    unint64_t *v16 = v4;
    if (v17)
    {
      result = os_variant_has_internal_ui();
      if (result)
      {
        if (*v16 % v17) {
          goto LABEL_20;
        }
      }
    }
    v2[12] = (unint64_t)CFRetain(context);
    return (unint64_t)v2;
  }
  result = os_variant_has_internal_ui();
  if (!result)
  {
    v2[10] = BytesPerRow;
    goto LABEL_13;
  }
LABEL_20:
  __break(1u);
  return result;
}

- (PKBitmapContext)init
{
  return 0;
}

- (void)dealloc
{
  CGColorSpaceRef colorSpace = self->_format.colorSpace;
  if (colorSpace)
  {
    CFRelease(colorSpace);
    self->_format.CGColorSpaceRef colorSpace = 0;
  }
  decode = (CGFloat *)self->_format.decode;
  if (decode)
  {
    free(decode);
    self->_format.decode = 0;
  }
  context = self->_context;
  if (context) {
    CFRelease(context);
  }
  v6.receiver = self;
  v6.super_class = (Class)PKBitmapContext;
  [(PKBitmapContext *)&v6 dealloc];
}

- (void)accessContext:(id)a3
{
}

- (void)_accessContext:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      __break(1u);
      return;
    }
    int v5 = v3;
    unint64_t v4 = (void *)MEMORY[0x192FDC630]();
    v5[2](v5, *(void *)(a1 + 96));
    v3 = v5;
  }
}

- (void)accessData:(id)a3
{
  unint64_t v4 = (void (**)(id, vImage_CGImageFormat *, vImage_Buffer *))a3;
  if (self)
  {
    if (v4)
    {
      v9 = v4;
      uint64_t v5 = MEMORY[0x192FDC630]();
      __int16 v6 = ++self->_vImageAccessCounter;
      if ((v6 & 0x100) == 0)
      {
        v7 = (void *)v5;
        v9[2](v9, &self->_format, &self->_buffer);
        unsigned int v8 = --self->_vImageAccessCounter;
        if (v8 < 0x100)
        {
          unint64_t v4 = v9;
          goto LABEL_6;
        }
LABEL_11:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_6:
}

- (void).cxx_destruct
{
}

@end