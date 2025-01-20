@interface TXRDataConverter
+ (id)newImageFromSourceImage:(id)a3 newPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 gammaDegamma:(BOOL)a6 error:(id *)a7;
+ (id)newImageFromSourceImage:(id)a3 newPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 multiplyAlpha:(BOOL)a6 gammaDegamma:(BOOL)a7 error:(id *)a8;
+ (id)newPixelFormatSetForCGImage:(CGImage *)a3 displayGamut:(unint64_t)a4 options:(id)a5;
@end

@implementation TXRDataConverter

+ (id)newImageFromSourceImage:(id)a3 newPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 multiplyAlpha:(BOOL)a6 gammaDegamma:(BOOL)a7 error:(id *)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v12 = a3;
  id v13 = a5;
  if (v9)
  {
    uint64_t v14 = [v12 pixelFormat];
    BOOL v9 = 1;
    if (v14 > 129)
    {
      if (((unint64_t)(v14 - 130) > 0x35 || ((1 << (v14 + 126)) & 0x30003C00C0003FLL) == 0)
        && (unint64_t)(v14 - 552) >= 2)
      {
        goto LABEL_94;
      }
    }
    else if (((unint64_t)(v14 - 65) > 0x3C || ((1 << (v14 - 65)) & 0x1C07A000060183E1) == 0) {
           && ((unint64_t)v14 > 0x2B || ((1 << v14) & 0xE0000000002) == 0))
    }
    {
LABEL_94:
      BOOL v9 = 0;
    }
  }
  if (a4 - 130 < 0xE && ((0x3C3Fu >> (a4 + 126)) & 1) != 0)
  {
    int v15 = 1;
  }
  else
  {
    int v15 = 1;
    if (a4 - 150 >= 4 && (a4 & 0xFFFFFFFFFFFFFFF8) != 0xA0)
    {
      if (a4 - 170 >= 0x31) {
        int v15 = 0;
      }
      else {
        int v15 = (0x1FF7C7FDF3F55uLL >> (a4 + 86)) & 1;
      }
    }
  }
  uint64_t v16 = [v12 pixelFormat];
  id v110 = v13;
  unint64_t v111 = a4;
  v113 = v12;
  int v97 = v9;
  int v98 = v8;
  int v99 = v15;
  if (((unint64_t)(v16 - 130) > 0xD || ((1 << (v16 + 126)) & 0x3C3F) == 0)
    && (unint64_t)(v16 - 150) >= 4
    && (v16 & 0xFFFFFFFFFFFFFFF8) != 0xA0
    && ((unint64_t)(v16 - 170) > 0x30 || ((1 << (v16 + 86)) & 0x1FF7C7FDF3F55) == 0))
  {
    v18 = (TXRImageIndependent *)v12;
    goto LABEL_36;
  }
  v17 = (TXRImageIndependent *)v12;
  v18 = v17;
  unint64_t v19 = a4 & 0xFFFFFFFFFFFFFFFELL;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0x46)
  {
    at_texel_format_t v20 = at_texel_format_rgba8_unorm;
    goto LABEL_28;
  }
  switch(v19)
  {
    case 0x50uLL:
      at_texel_format_t v20 = at_texel_format_bgra8_unorm;
LABEL_28:
      unint64_t v21 = a4;
      goto LABEL_29;
    case 0xAuLL:
      at_texel_format_t v20 = at_texel_format_l8_unorm;
      goto LABEL_28;
    case 0x1EuLL:
      at_texel_format_t v20 = at_texel_format_la8_unorm;
      goto LABEL_28;
  }
  if (isGammaEncoded([(TXRImageIndependent *)v17 pixelFormat])) {
    unint64_t v21 = 71;
  }
  else {
    unint64_t v21 = 70;
  }
  at_texel_format_t v20 = at_texel_format_rgba8_unorm;
LABEL_29:
  if ([(TXRImageIndependent *)v18 pixelFormat] == 204
    || [(TXRImageIndependent *)v18 pixelFormat] == 186)
  {
    at_block_format_t v22 = at_block_format_astc_4x4_ldr;
  }
  else
  {
    if ([(TXRImageIndependent *)v18 pixelFormat] != 212
      && [(TXRImageIndependent *)v18 pixelFormat] != 194)
    {
      if (a8)
      {
        _newTXRErrorWithCodeAndErrorString(0, @"Cannot decompress from specified format");
        v39 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }
      goto LABEL_78;
    }
    at_block_format_t v22 = at_block_format_astc_8x8_ldr;
  }
  v100 = [(TXRImage *)v18 buffer];
  v23 = [v100 map];
  src.blocks = (void *)[v23 bytes];
  src.rowBytes = [(TXRImage *)v18 bytesPerRow];
  src.sliceBytes = [(TXRImage *)v18 bytesPerImage];
  [(TXRImageIndependent *)v18 dimensions];
  size_t MemoryLayout = getMemoryLayout(v21, v24);
  size_t v27 = v26;
  [(TXRImageIndependent *)v18 dimensions];
  unsigned int v107 = v28;
  [(TXRImageIndependent *)v18 dimensions];
  unsigned int v106 = v29;
  [(TXRImageIndependent *)v18 dimensions];
  uint32_t v103 = v30;
  [(TXRImageIndependent *)v18 dimensions];
  v32 = (void *)[v13 newBufferWithLength:v27 * v31];
  v33 = [v32 map];
  *((_DWORD *)&dest.validSize + 3) = 0;
  dest.texels = (void *)[v33 bytes];
  *(void *)&dest.validSize.x = __PAIR64__(v106, v107);
  dest.validSize.z = v103;
  dest.rowBytes = MemoryLayout;
  dest.sliceBytes = v27;
  v34 = at_encoder_create(v20, at_alpha_not_premultiplied, v22, at_alpha_not_premultiplied, 0);
  if (!v34) {
    +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:]();
  }
  v35 = v34;
  at_encoder_decompress_texels(v34, &src, &dest, at_flags_default);
  v36 = [TXRImageIndependent alloc];
  [(TXRImageIndependent *)v18 dimensions];
  v38 = [(TXRImageIndependent *)v36 initWithDimensions:v21 pixelFormat:[(TXRImageIndependent *)v18 alphaInfo] alphaInfo:MemoryLayout bytesPerRow:v27 bytesPerImage:v32 buffer:0 offset:v37];

  a4 = v111;
  if (v21 != v111)
  {

    v18 = v38;
    id v12 = v113;
    id v13 = v110;
    int v15 = v99;
LABEL_36:
    unint64_t v40 = a4;
    if (v15)
    {
      unint64_t v40 = a4;
      if ([(TXRImageIndependent *)v18 pixelFormat] != 70)
      {
        unint64_t v40 = a4;
        if ([(TXRImageIndependent *)v18 pixelFormat] != 80)
        {
          unint64_t v40 = a4;
          if ([(TXRImageIndependent *)v18 pixelFormat] != 30)
          {
            unint64_t v40 = a4;
            if ([(TXRImageIndependent *)v18 pixelFormat] != 10)
            {
              unint64_t v40 = a4;
              if ([(TXRImageIndependent *)v18 pixelFormat] != 71)
              {
                unint64_t v40 = a4;
                if ([(TXRImageIndependent *)v18 pixelFormat] != 81)
                {
                  unint64_t v40 = a4;
                  if ([(TXRImageIndependent *)v18 pixelFormat] != 31)
                  {
                    unint64_t v40 = a4;
                    if ([(TXRImageIndependent *)v18 pixelFormat] != 11)
                    {
                      if (isGammaEncoded(a4)) {
                        unint64_t v40 = 71;
                      }
                      else {
                        unint64_t v40 = 70;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    [v12 dimensions];
    unint64_t v42 = getMemoryLayout(v40, v41);
    uint64_t v44 = v43;
    [v12 dimensions];
    v46 = (void *)[v13 newBufferWithLength:v44 * v45];
    v47 = [TXRImageIndependent alloc];
    [v12 dimensions];
    v49 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:](v47, "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", v40, [v12 alphaInfo], v42, v44, v46, 0, v48);
    if (v40 == a4) {
      char v50 = v15;
    }
    else {
      char v50 = 0;
    }
    v105 = v46;
    if ((v50 & 1) == 0)
    {
      unint64_t v102 = v40;
      v101 = [v46 map];
      v51 = (void *)[v101 bytes];
      v52 = [(TXRImage *)v18 buffer];
      v53 = [v52 map];

      v95 = v53;
      v54 = (uint16x4_t *)[v53 bytes];
      v55 = v12;
      uint64_t v56 = (uint64_t)v51;
      [v55 dimensions];
      if ((fastConvert(v97, v98, [(TXRImageIndependent *)v49 pixelFormat], [(TXRImage *)v49 bytesPerRow], [(TXRImage *)v49 bytesPerImage], v51, [(TXRImageIndependent *)v18 pixelFormat], [(TXRImage *)v18 bytesPerRow], [(TXRImage *)v18 bytesPerImage], v54) & 1) == 0)
      {
        [v113 dimensions];
        __n128 v94 = v57;
        uint64_t v58 = [(TXRImageIndependent *)v49 pixelFormat];
        uint64_t v59 = [(TXRImage *)v49 bytesPerRow];
        uint64_t v60 = [(TXRImage *)v49 bytesPerImage];
        uint64_t v61 = [(TXRImageIndependent *)v18 pixelFormat];
        uint64_t v62 = [(TXRImage *)v18 bytesPerRow];
        uint64_t v63 = [(TXRImage *)v18 bytesPerImage];
        slowConvert(v97, v98, v58, v59, v60, v56, v61, v62, v94, v64, v65, v66, v63, v54);
      }

      id v12 = v113;
      id v13 = v110;
      a4 = v111;
      int v15 = v99;
      v46 = v105;
      unint64_t v40 = v102;
    }
    if (!v15)
    {
      v39 = v49;
LABEL_77:

      goto LABEL_78;
    }
    if (v40 == a4)
    {
      id v67 = v13;
      v68 = v49;
      v69 = v18;
    }
    else
    {
      [v12 dimensions];
      unint64_t v71 = getMemoryLayout(a4, v70);
      uint64_t v73 = v72;
      [v12 dimensions];
      id v67 = v13;
      v75 = v49;
      v76 = (void *)[v13 newBufferWithLength:v73 * v74];
      v77 = [TXRImageIndependent alloc];
      [v12 dimensions];
      double v108 = v78;
      uint64_t v79 = [v12 alphaInfo];
      v80 = v77;
      a4 = v111;
      v68 = [(TXRImageIndependent *)v80 initWithDimensions:v111 pixelFormat:v79 alphaInfo:v71 bytesPerRow:v73 bytesPerImage:v76 buffer:0 offset:v108];
      v69 = v75;

      v49 = v75;
    }
    if ([(TXRImageIndependent *)v69 pixelFormat] == 70
      || [(TXRImageIndependent *)v69 pixelFormat] == 71)
    {
      at_texel_format_t v81 = at_texel_format_rgba8_unorm;
    }
    else if ([(TXRImageIndependent *)v69 pixelFormat] == 80 {
           || [(TXRImageIndependent *)v69 pixelFormat] == 81)
    }
    {
      at_texel_format_t v81 = at_texel_format_bgra8_unorm;
    }
    else if ([(TXRImageIndependent *)v69 pixelFormat] == 30 {
           || [(TXRImageIndependent *)v69 pixelFormat] == 31)
    }
    {
      at_texel_format_t v81 = at_texel_format_la8_unorm;
    }
    else
    {
      if ([(TXRImageIndependent *)v69 pixelFormat] != 10
        && [(TXRImageIndependent *)v69 pixelFormat] != 11)
      {
        +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:]();
      }
      at_texel_format_t v81 = at_texel_format_l8_unorm;
    }
    at_block_format_t v82 = at_block_format_astc_4x4_ldr;
    if ((uint64_t)a4 > 203)
    {
      if (a4 == 204) {
        goto LABEL_74;
      }
      if (a4 != 212) {
        goto LABEL_69;
      }
    }
    else
    {
      if (a4 == 186) {
        goto LABEL_74;
      }
      if (a4 != 194)
      {
LABEL_69:
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0x98)
        {
          if (a8)
          {
            _newTXRErrorWithCodeAndErrorString(0, @"Cannot compress to specified format");
            v39 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = 0;
          }
LABEL_76:

          id v13 = v67;
          v46 = v105;
          goto LABEL_77;
        }
        at_block_format_t v82 = at_block_format_bc7;
LABEL_74:
        v83 = v49;
        at_encoder_t v84 = at_encoder_create(v81, at_alpha_not_premultiplied, v82, at_alpha_not_premultiplied, 0);
        if (!v84) {
          +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:]();
        }
        v85 = v84;
        v86 = [(TXRImage *)v69 buffer];
        v87 = [v86 map];

        [v12 dimensions];
        unsigned int v112 = v88;
        [v12 dimensions];
        unsigned int v109 = v89;
        [v12 dimensions];
        uint32_t v104 = v90;
        memset(&dest.validSize.z, 0, 24);
        dest.texels = (void *)[v87 bytes];
        *(void *)&dest.validSize.x = __PAIR64__(v109, v112);
        dest.validSize.z = v104;
        dest.rowBytes = [(TXRImage *)v69 bytesPerRow];
        dest.sliceBytes = [(TXRImage *)v69 bytesPerImage];
        v91 = [(TXRImage *)v68 buffer];
        v92 = [v91 map];

        src.blocks = (void *)[v92 bytes];
        src.rowBytes = [(TXRImage *)v68 bytesPerRow];
        src.sliceBytes = [(TXRImage *)v68 bytesPerImage];
        at_encoder_compress_texels(v85, &dest, &src, 2.0e-15, at_flags_default);
        v39 = v68;

        v49 = v83;
        goto LABEL_76;
      }
    }
    at_block_format_t v82 = at_block_format_astc_8x8_ldr;
    goto LABEL_74;
  }
  v18 = v38;

  v39 = v18;
  id v12 = v113;
  id v13 = v110;
LABEL_78:

  return v39;
}

+ (id)newImageFromSourceImage:(id)a3 newPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 gammaDegamma:(BOOL)a6 error:(id *)a7
{
  return +[TXRDataConverter newImageFromSourceImage:a3 newPixelFormat:a4 bufferAllocator:a5 multiplyAlpha:0 gammaDegamma:a6 error:a7];
}

+ (id)newPixelFormatSetForCGImage:(CGImage *)a3 displayGamut:(unint64_t)a4 options:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v8 = a5;
  id v9 = objc_alloc_init(v7);
  unsigned int v10 = +[TXRParserImageIO determineColorSpaceClass:a3 displayGamut:a4 options:v8];

  size_t BitsPerPixel = CGImageGetBitsPerPixel(a3);
  CGBitmapInfo v12 = CGImageGetBitmapInfo(a3) & 0x1F;
  if (v10 < 2)
  {
    v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:204];
    [v9 addObject:v17];

    v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:152];
    [v9 addObject:v18];

    if (BitsPerPixel != 8)
    {
      int v15 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v16 = 70;
      goto LABEL_15;
    }
    int v15 = (void *)MEMORY[0x1E4F28ED0];
    if (v12 != 7)
    {
      uint64_t v16 = 10;
LABEL_15:
      unint64_t v21 = [v15 numberWithUnsignedInteger:v16];
      [v9 addObject:v21];

      return v9;
    }
LABEL_12:
    uint64_t v16 = 1;
    goto LABEL_15;
  }
  if (v10 == 2)
  {
    unint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:186];
    [v9 addObject:v19];

    at_texel_format_t v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:153];
    [v9 addObject:v20];

    int v15 = (void *)MEMORY[0x1E4F28ED0];
    if (v12 != 7)
    {
      uint64_t v16 = 71;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (v10 == 3)
  {
    if (v12 == 7) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 555;
    }
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v13];
    [v9 addObject:v14];

    int v15 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v16 = 115;
    goto LABEL_15;
  }
  return v9;
}

+ (void)newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:.cold.1()
{
}

+ (void)newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:.cold.2()
{
}

+ (void)newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:.cold.3()
{
}

@end