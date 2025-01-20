@interface PUIColorBoxes
+ (BOOL)supportsSecureCoding;
+ (id)colorBoxesForImage:(id)a3;
- (PUIColorBoxes)initWithCoder:(id)a3;
- (double)contrast;
- (double)imageSize;
- (double)rectForColorBoxAtRow:(uint64_t)a3 col:;
- (id)description;
- (id)initWithColorBoxes:(uint64_t)a3 size:(uint64_t)a4 rowCount:(uint64_t)a5 columnCount:(char)a6 totalContrast8:(uint64_t)a7 imageSize:(uint64_t)a8 downsampledBoxSize:(double)a9 effectiveDownsampleFactor:(double)a10 pixelHeight:(uint64_t)a11 pixelWidth:(uint64_t)a12;
- (uint64_t)colorBoxAtRow:(uint64_t)a3 col:;
- (uint64_t)colorBoxesRowMajor;
- (uint64_t)columnCount;
- (uint64_t)downsampledBoxSize;
- (uint64_t)effectiveDownsampleFactor;
- (uint64_t)pixelHeight;
- (uint64_t)pixelWidth;
- (uint64_t)rowCount;
- (uint64_t)size;
- (uint64_t)totalContrast8;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIColorBoxes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)colorBoxesForImage:(id)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 size];
  double v6 = v4;
  double v7 = v5;
  BOOL v8 = v4 == *MEMORY[0x263F001B0] && v5 == *(double *)(MEMORY[0x263F001B0] + 8);
  if (v8
    || (v4 <= 4.0 || v5 <= 4.0 ? (unint64_t v9 = 1) : (unint64_t v9 = 4),
        (size_t v10 = vcvtpd_u64_f64(v4 / (double)v9), v4 <= 4.0 || v5 <= 4.0) ? (v11 = 16) : (v11 = 4),
        (size_t v12 = vcvtpd_u64_f64(v5 / (double)v9), v10) ? (v13 = v12 == 0) : (v13 = 1),
        v13))
  {
    v14 = 0;
    goto LABEL_64;
  }
  if (v4 > 4.0 && v5 > 4.0) {
    char v15 = 2;
  }
  else {
    char v15 = 4;
  }
  if (((v11 - 1) & v12) != 0) {
    unint64_t v16 = (v12 >> v15) + 1;
  }
  else {
    unint64_t v16 = v12 >> v15;
  }
  char v85 = v15;
  if (((v11 - 1) & v10) != 0) {
    unint64_t v17 = (v10 >> v15) + 1;
  }
  else {
    unint64_t v17 = v10 >> v15;
  }
  if (is_mul_ok(v16, v17))
  {
    unint64_t v87 = v16 * v17;
    v82 = (char *)malloc_type_calloc(v16 * v17, 4uLL, 0x100004052888210uLL);
    if (v82)
    {
      uint64_t v84 = v11;
      unint64_t v72 = v9;
      [v3 scale];
      double v20 = (double)v10 / v19;
      [v3 scale];
      double v22 = (double)v12 / v21;
      v23 = objc_msgSend(v3, "pui_wrappedIOSurface");
      id v76 = v3;
      v24 = objc_msgSend(v3, "pui_cropImageWithRect:outputSize:canUseIOSurface:", v23 != 0, 0.0, 0.0, v6, v7, v20, v22);

      size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
      size_t v81 = v10;
      size_t v78 = v12;
      space = CGColorSpaceCreateDeviceRGB();
      v26 = CGBitmapContextCreate(0, v10, v12, 8uLL, AlignedBytesPerRow, space, 0x4001u);
      CGContextSetInterpolationQuality(v26, kCGInterpolationLow);
      v75 = v24;
      id v27 = [v24 pui_CGImageBackedImage];
      v28 = (CGImage *)[v27 CGImage];
      v98.origin.x = 0.0;
      v98.origin.y = 0.0;
      v98.size.width = (double)v10;
      v98.size.height = (double)v12;
      CGContextDrawImage(v26, v98, v28);

      c = v26;
      Data = (char *)CGBitmapContextGetData(v26);
      unint64_t v79 = v16;
      if (v16)
      {
        uint64_t v80 = 0;
        unint64_t v30 = 0;
        unint64_t v31 = 0;
        unint64_t v32 = 0;
        unint64_t v33 = 0;
        unint64_t v16 = 0;
        unint64_t v34 = 0;
        unint64_t v35 = 0;
        v77 = Data + 1;
        size_t v86 = AlignedBytesPerRow;
        do
        {
          if (v17)
          {
            uint64_t v36 = 0;
            unint64_t v37 = v80 << v85;
            if ((v80 << v85) + v84 >= v78) {
              uint64_t v38 = v78 - (v80 << v85);
            }
            else {
              uint64_t v38 = v84;
            }
            unint64_t v90 = v38 + v37;
            unint64_t v88 = v80 * v17;
            v83 = &v77[AlignedBytesPerRow * v37];
            do
            {
              uint64_t v89 = v36;
              if (v37 >= v90)
              {
                unint64_t v46 = 0;
                unint64_t v45 = 0;
                unint64_t v44 = 0;
                unint64_t v43 = 0;
                unint64_t v42 = 0;
                unint64_t v41 = 0;
                unint64_t v40 = 0;
              }
              else
              {
                unint64_t v39 = v37;
                unint64_t v40 = 0;
                unint64_t v41 = 0;
                unint64_t v42 = 0;
                unint64_t v43 = 0;
                unint64_t v44 = 0;
                unint64_t v45 = 0;
                unint64_t v46 = 0;
                unint64_t v47 = v36 << v85;
                if ((v36 << v85) + v84 >= v81) {
                  uint64_t v48 = v81 - v47;
                }
                else {
                  uint64_t v48 = v84;
                }
                v49 = (unsigned __int8 *)&v83[4 * v47];
                unint64_t v50 = v39;
                do
                {
                  if (v47 < v48 + v47)
                  {
                    v40 += v48;
                    v51 = v49;
                    uint64_t v52 = v48;
                    do
                    {
                      uint64_t v53 = *(v51 - 1);
                      v46 += v53;
                      uint64_t v54 = *v51;
                      v45 += v54;
                      uint64_t v55 = v51[1];
                      v44 += v55;
                      uint64_t v56 = (v53 * v53);
                      v43 += v56;
                      uint64_t v57 = (v54 * v54);
                      v42 += v57;
                      uint64_t v58 = (v55 * v55);
                      v41 += v58;
                      v35 += v53;
                      v34 += v54;
                      v16 += v55;
                      v33 += v56;
                      v32 += v57;
                      v31 += v58;
                      v51 += 4;
                      --v52;
                    }
                    while (v52);
                    v30 += v48;
                  }
                  ++v50;
                  v49 += AlignedBytesPerRow;
                }
                while (v50 != v90);
              }
              double v59 = 1.0 / (double)v40;
              unint64_t v60 = llround(v59 * (double)v46);
              if (v60 >= 0x100) {
                +[PUIColorBoxes colorBoxesForImage:]();
              }
              unint64_t v61 = llround(v59 * (double)v45);
              if (v61 >= 0x100) {
                +[PUIColorBoxes colorBoxesForImage:]();
              }
              unint64_t v62 = v17;
              unint64_t v63 = llround(v59 * (double)v44);
              if (v63 >= 0x100) {
                +[PUIColorBoxes colorBoxesForImage:]();
              }
              char v64 = contrast(v40, (double)v46, (double)v45, (double)v44, (double)v43, (double)v42, (double)v41);
              uint64_t v65 = v89;
              if (v89 + v88 >= v87)
              {
                v67 = PUILogCommon();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218752;
                  *(void *)&buf[4] = v89 + v88;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v80;
                  __int16 v92 = 2048;
                  uint64_t v93 = v89;
                  __int16 v94 = 2048;
                  unint64_t v95 = v62;
                  _os_log_error_impl(&dword_25A0AF000, v67, OS_LOG_TYPE_ERROR, "Bad box index '%lu' from row %lu column %lu and column count %lu", buf, 0x2Au);
                }

                size_t AlignedBytesPerRow = v86;
                uint64_t v65 = v89;
                unint64_t v17 = v62;
              }
              else
              {
                v66 = &v82[4 * v89 + 4 * v88];
                char *v66 = v60;
                v66[1] = v61;
                v66[2] = v63;
                v66[3] = v64;
                unint64_t v17 = v62;
                size_t AlignedBytesPerRow = v86;
              }
              uint64_t v36 = v65 + 1;
              unint64_t v37 = v80 << v85;
            }
            while (v36 != v17);
          }
          ++v80;
        }
        while (v80 != v79);
      }
      else
      {
        unint64_t v35 = 0;
        unint64_t v34 = 0;
        unint64_t v33 = 0;
        unint64_t v32 = 0;
        unint64_t v31 = 0;
        unint64_t v30 = 0;
      }
      char v69 = contrast(v30, (double)v35, (double)v34, (double)v16, (double)v33, (double)v32, (double)v31);
      CGContextRelease(c);
      CGColorSpaceRelease(space);
      v70 = [PUIColorBoxes alloc];
      if (v70)
      {
        *(void *)buf = v70;
        *(void *)&buf[8] = PUIColorBoxes;
        id v71 = objc_msgSendSuper2((objc_super *)buf, sel_init);
        v14 = v71;
        v18 = v75;
        id v3 = v76;
        if (v71)
        {
          *((void *)v71 + 8) = v82;
          *((void *)v71 + 9) = v79;
          *((void *)v71 + 10) = v17;
          *((void *)v71 + 11) = 16;
          *((unsigned char *)v71 + 24) = v69;
          *((double *)v71 + 1) = v6;
          *((double *)v71 + 2) = v7;
          *((void *)v71 + 4) = v84;
          *((void *)v71 + 5) = v72;
          *((void *)v71 + 6) = v78;
          *((void *)v71 + 7) = v81;
        }
      }
      else
      {
        v14 = 0;
        v18 = v75;
        id v3 = v76;
      }
      goto LABEL_63;
    }
    v18 = PUILogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[PUIColorBoxes colorBoxesForImage:]();
    }
  }
  else
  {
    v18 = PUILogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[PUIColorBoxes colorBoxesForImage:]();
    }
  }
  v14 = 0;
LABEL_63:

LABEL_64:
  return v14;
}

- (id)initWithColorBoxes:(uint64_t)a3 size:(uint64_t)a4 rowCount:(uint64_t)a5 columnCount:(char)a6 totalContrast8:(uint64_t)a7 imageSize:(uint64_t)a8 downsampledBoxSize:(double)a9 effectiveDownsampleFactor:(double)a10 pixelHeight:(uint64_t)a11 pixelWidth:(uint64_t)a12
{
  if (result)
  {
    v21.receiver = result;
    v21.super_class = (Class)PUIColorBoxes;
    result = objc_msgSendSuper2(&v21, sel_init);
    if (result)
    {
      *((void *)result + 8) = a2;
      *((void *)result + 9) = a4;
      *((void *)result + 10) = a5;
      *((void *)result + 11) = a3;
      *((unsigned char *)result + 24) = a6;
      *((double *)result + 1) = a9;
      *((double *)result + 2) = a10;
      *((void *)result + 4) = a7;
      *((void *)result + 5) = a8;
      *((void *)result + 6) = a11;
      *((void *)result + 7) = a12;
    }
  }
  return result;
}

- (double)contrast
{
  LOBYTE(v2) = self->_totalContrast8;
  return (double)v2 / 255.0;
}

- (double)rectForColorBoxAtRow:(uint64_t)a3 col:
{
  if (a1) {
    return (double)(unint64_t)(*(void *)(a1 + 40) * *(void *)(a1 + 32) * a3);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)colorBoxAtRow:(uint64_t)a3 col:
{
  if (result) {
    return *(void *)(result + 64) + 4 * (a3 + *(void *)(result + 80) * a2);
  }
  return result;
}

- (PUIColorBoxes)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUIColorBoxes;
  double v5 = [(PUIColorBoxes *)&v12 init];
  if (v5)
  {
    [v4 decodeCGSizeForKey:@"imageSize"];
    v5->_imageSize.width = v6;
    v5->_imageSize.height = v7;
    v5->_downsampledBoxSize = [v4 decodeIntegerForKey:@"downsampledBoxSize"];
    v5->_effectiveDownsampleFactor = [v4 decodeIntegerForKey:@"effectiveDownsampleFactor"];
    v5->_pixelHeight = [v4 decodeIntegerForKey:@"pixelHeight"];
    v5->_pixelWidth = [v4 decodeIntegerForKey:@"pixelWidth"];
    v5->_rowCount = [v4 decodeIntegerForKey:@"rowCount"];
    v5->_columnCount = [v4 decodeIntegerForKey:@"columnCount"];
    v5->_size_t size = [v4 decodeIntegerForKey:@"size"];
    v5->_totalContrast8 = [v4 decodeIntForKey:@"totalContrast8"];
    size_t size = 0;
    BOOL v8 = (const void *)[v4 decodeBytesForKey:@"colorBoxesRowMajor" returnedLength:&size];
    unint64_t v9 = ($14D77461FF5D83CAEC4252578BA76F85 *)malloc_type_malloc(size, 0x41E7BD32uLL);
    memcpy(v9, v8, size);
    v5->_colorBoxesRowMajor = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  id v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", @"imageSize", width, height);
  [v6 encodeInteger:self->_downsampledBoxSize forKey:@"downsampledBoxSize"];
  [v6 encodeInteger:self->_effectiveDownsampleFactor forKey:@"effectiveDownsampleFactor"];
  [v6 encodeInteger:self->_pixelHeight forKey:@"pixelHeight"];
  [v6 encodeInteger:self->_pixelWidth forKey:@"pixelWidth"];
  [v6 encodeInteger:self->_rowCount forKey:@"rowCount"];
  [v6 encodeInteger:self->_columnCount forKey:@"columnCount"];
  [v6 encodeInteger:self->_size forKey:@"size"];
  [v6 encodeInt:self->_totalContrast8 forKey:@"totalContrast8"];
  [v6 encodeBytes:self->_colorBoxesRowMajor length:4 * self->_rowCount * self->_columnCount forKey:@"colorBoxesRowMajor"];
}

- (void)dealloc
{
  free(self->_colorBoxesRowMajor);
  v3.receiver = self;
  v3.super_class = (Class)PUIColorBoxes;
  [(PUIColorBoxes *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendPointer:self->_colorBoxesRowMajor withName:@"Color boxes"];
  id v5 = (id)[v3 appendInteger:self->_size withName:@"Size"];
  id v6 = (id)[v3 appendInteger:self->_rowCount withName:@"Rows"];
  id v7 = (id)[v3 appendInteger:self->_columnCount withName:@"Columns"];
  id v8 = (id)[v3 appendInteger:self->_totalContrast8 withName:@"Contrast"];
  unint64_t v9 = [v3 build];

  return v9;
}

- (double)imageSize
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)downsampledBoxSize
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)effectiveDownsampleFactor
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)pixelHeight
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)pixelWidth
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)totalContrast8
{
  if (result) {
    return *(unsigned __int8 *)(result + 24);
  }
  return result;
}

- (uint64_t)colorBoxesRowMajor
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)rowCount
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)columnCount
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)size
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

+ (void)colorBoxesForImage:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5(&dword_25A0AF000, v0, v1, "Detected overflow trying to multiply row count %lu with column count %lu", v2, v3);
}

+ (void)colorBoxesForImage:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5(&dword_25A0AF000, v0, v1, "Failed to allocate color box buffer with row count %lu column count %lu", v2, v3);
}

+ (void)colorBoxesForImage:.cold.3()
{
  __assert_rtn("round_to_uint8", "PUIColorBoxes.m", 48, "0 <= lx && lx <= 255");
}

@end