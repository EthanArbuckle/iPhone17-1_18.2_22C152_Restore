@interface NUHistogramCalculator
- ($6DEFAE59D8B0B490C28D581BBA01C329)colorMatrix;
- ($F24F406B2B787EFB06265DBA3D28CBD5)range;
- (NUHistogramCalculator)init;
- (id)_computeHistogramForBufferBGRA8:(id)a3 error:(id *)a4;
- (id)_computeHistogramForBufferRGBAhHLG:(id)a3 error:(id *)a4;
- (id)computeHistogramFromBuffer:(id)a3 error:(id *)a4;
- (id)computeHistogramFromMatte:(id)a3;
- (id)computeHistogramFromMatteBuffer:(id)a3;
- (int64_t)binCount;
- (void)setBinCount:(int64_t)a3;
- (void)setColorMatrix:(id *)a3;
- (void)setRange:(id)a3;
@end

@implementation NUHistogramCalculator

- (void)setColorMatrix:(id *)a3
{
  $43F634250C0E94E2A09AB0840E4770D1 var0 = ($43F634250C0E94E2A09AB0840E4770D1)a3->var0;
  $43F634250C0E94E2A09AB0840E4770D1 var1 = ($43F634250C0E94E2A09AB0840E4770D1)a3->var1;
  $43F634250C0E94E2A09AB0840E4770D1 var3 = ($43F634250C0E94E2A09AB0840E4770D1)a3->var3;
  self->_colorMatrix.b = ($43F634250C0E94E2A09AB0840E4770D1)a3->var2;
  self->_colorMatrix.a = var3;
  self->_colorMatrix.r = var0;
  self->_colorMatrix.g = var1;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)colorMatrix
{
  $C28CD4A45FD07A4F97CC9D5F91F25271 var3 = self->var3;
  retstr->$43F634250C0E94E2A09AB0840E4770D1 var0 = self->var2;
  retstr->$C28CD4A45FD07A4F97CC9D5F91F25271 var1 = var3;
  $C28CD4A45FD07A4F97CC9D5F91F25271 var1 = self[1].var1;
  retstr->var2 = self[1].var0;
  retstr->$C28CD4A45FD07A4F97CC9D5F91F25271 var3 = var1;
  return self;
}

- (void)setRange:(id)a3
{
  self->_range = ($7B59B1D66D8657D7171CFE400C1A1779)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  double min = self->_range.min;
  double max = self->_range.max;
  result.$C28CD4A45FD07A4F97CC9D5F91F25271 var1 = max;
  result.$43F634250C0E94E2A09AB0840E4770D1 var0 = min;
  return result;
}

- (void)setBinCount:(int64_t)a3
{
  self->_binCount = a3;
}

- (int64_t)binCount
{
  return self->_binCount;
}

- (id)computeHistogramFromMatte:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1E040] areaHistogramFilter];
    [v5 setInputImage:v4];
    [v4 extent];
    objc_msgSend(v5, "setExtent:");
    objc_msgSend(v5, "setCount:", -[NUHistogramCalculator binCount](self, "binCount"));
    LODWORD(v6) = 1.0;
    [v5 setScale:v6];
    uint64_t v7 = [v5 outputImage];
    if (!v7)
    {
      v22 = NUAssertLogger_1902();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = [NSString stringWithFormat:@"Failed to produce histogram for matte image"];
        *(_DWORD *)buf = 138543362;
        v41 = v23;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v25 = NUAssertLogger_1902();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v30 = (void *)MEMORY[0x1E4F29060];
          id v31 = v29;
          v32 = [v30 callStackSymbols];
          v33 = [v32 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v41 = v29;
          __int16 v42 = 2114;
          v43 = v33;
          _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v26)
      {
        v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator computeHistogramFromMatte:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 269, @"Failed to produce histogram for matte image", v34, v35, v36, v37, v38);
    }
    v8 = (void *)v7;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", 4 * -[NUHistogramCalculator binCount](self, "binCount"));
    v10 = [MEMORY[0x1E4F1E018] context];
    id v11 = v9;
    uint64_t v12 = [v11 mutableBytes];
    uint64_t v13 = [v11 length];
    [v8 extent];
    objc_msgSend(v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v8, v12, v13, *MEMORY[0x1E4F1E310], 0);
    id v14 = v11;
    uint64_t v15 = [v14 bytes];
    [v4 extent];
    double v18 = v16 * v17;
    int64_t v19 = [(NUHistogramCalculator *)self binCount];
    v20 = -[NUHistogram initWithBinCount:range:]([NUMutableHistogram alloc], "initWithBinCount:range:", v19, 0.0, 1.0);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __51__NUHistogramCalculator_computeHistogramFromMatte___block_invoke;
    v39[3] = &__block_descriptor_56_e12_q24__0_q8q16l;
    v39[4] = v19;
    v39[5] = v15;
    *(double *)&v39[6] = v18;
    [(NUMutableHistogram *)v20 write:v39];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __51__NUHistogramCalculator_computeHistogramFromMatte___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(uint64_t *)(a1 + 32) < 1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  do
  {
    double v6 = v5 * *(float *)(v4 + 4 * v2);
    *(void *)(a2 + 8 * v2) = (uint64_t)v6;
    v3 += (uint64_t)v6;
    ++v2;
  }
  while (v2 < *(void *)(a1 + 32));
  return v3;
}

- (id)computeHistogramFromMatteBuffer:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithNUImageBuffer:");
    double v5 = [(NUHistogramCalculator *)self computeHistogramFromMatte:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_computeHistogramForBufferRGBAhHLG:(id)a3 error:(id *)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v38 = NUAssertLogger_1902();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      float matrix = 5.8381e-34;
      v85 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&matrix, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v41 = NUAssertLogger_1902();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        v55 = [v53 callStackSymbols];
        v56 = [v55 componentsJoinedByString:@"\n"];
        float matrix = 5.8382e-34;
        v85 = v52;
        *(_WORD *)v86 = 2114;
        *(void *)&v86[2] = v56;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&matrix, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
      float matrix = 5.8381e-34;
      v85 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&matrix, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferRGBAhHLG:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 169, @"Invalid parameter not satisfying: %s", v57, v58, v59, v60, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    v45 = NUAssertLogger_1902();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      float matrix = 5.8381e-34;
      v85 = v46;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&matrix, 0xCu);
    }
    v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v48 = NUAssertLogger_1902();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (v49)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E4F29060];
        id v63 = v61;
        v64 = [v62 callStackSymbols];
        v65 = [v64 componentsJoinedByString:@"\n"];
        float matrix = 5.8382e-34;
        v85 = v61;
        *(_WORD *)v86 = 2114;
        *(void *)&v86[2] = v65;
        _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&matrix, 0x16u);
      }
    }
    else if (v49)
    {
      v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      v51 = [v50 componentsJoinedByString:@"\n"];
      float matrix = 5.8381e-34;
      v85 = v51;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&matrix, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferRGBAhHLG:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 170, @"Invalid parameter not satisfying: %s", v66, v67, v68, v69, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  double min = self->_range.min;
  double max = self->_range.max;
  v10 = -[NUImageHistogram initWithBinCount:range:]([NUMutableImageHistogram alloc], "initWithBinCount:range:", self->_binCount, min, max);
  src.datfloat a = (void *)[v7 bytes];
  [v7 size];
  src.height = v11;
  src.width = 4 * [v7 size];
  src.rowBytes = [v7 rowBytes];
  id v12 = objc_alloc(MEMORY[0x1E4F1CA58]);
  [v7 size];
  id v14 = objc_msgSend(v12, "initWithLength:", 16 * v13 * objc_msgSend(v7, "size"));
  dest.datfloat a = (void *)[v14 mutableBytes];
  [v7 size];
  dest.height = v15;
  dest.width = 4 * [v7 size];
  dest.rowBytes = 16 * [v7 size];
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  vImage_Error v81 = 0;
  vImage_Error v81 = vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  if (v79[3])
  {
    double v16 = objc_msgSend(NSNumber, "numberWithLong:");
    *a4 = +[NUError failureError:@"vImageConvert_Planar16FtoPlanarF failed" object:v16];

    double v17 = 0;
  }
  else
  {
    id v18 = v14;
    v77.datfloat a = (void *)[v18 mutableBytes];
    [v7 size];
    v77.height = v19;
    LODWORD(v77.width) = [v7 size];
    v77.width = LODWORD(v77.width);
    v77.rowBytes = 16 * [v7 size];
    v76.datfloat a = (void *)[v18 mutableBytes];
    [v7 size];
    v76.height = v20;
    LODWORD(v76.width) = [v7 size];
    v76.width = LODWORD(v76.width);
    uint64_t v21 = [v7 size];
    float g = self->_colorMatrix.a.g;
    float r = self->_colorMatrix.r.r;
    float v24 = self->_colorMatrix.r.g;
    float matrix = self->_colorMatrix.a.r;
    *(float *)&v85 = r;
    float v25 = self->_colorMatrix.g.g;
    float v26 = self->_colorMatrix.b.r;
    float v27 = self->_colorMatrix.b.g;
    HIDWORD(v85) = LODWORD(self->_colorMatrix.g.r);
    *(float *)v86 = v26;
    *(float *)&v86[4] = g;
    *(float *)&v86[8] = v24;
    float v87 = v25;
    float v88 = v27;
    float a = self->_colorMatrix.a.a;
    float b = self->_colorMatrix.r.b;
    float v30 = self->_colorMatrix.r.a;
    float v89 = self->_colorMatrix.a.b;
    float v90 = b;
    float v31 = self->_colorMatrix.g.a;
    float v32 = self->_colorMatrix.b.b;
    float v33 = self->_colorMatrix.b.a;
    float v91 = self->_colorMatrix.g.b;
    float v92 = v32;
    float v93 = a;
    float v94 = v30;
    v76.rowBytes = 16 * v21;
    float v95 = v31;
    float v96 = v33;
    vImage_Error v34 = vImageMatrixMultiply_ARGBFFFF(&v77, &v76, &matrix, 0, 0, 0);
    v79[3] = v34;
    if (v34)
    {
      uint64_t v35 = [NSNumber numberWithLong:v34];
      +[NUError failureError:@"vImageMatrixMultiply_ARGBFFFF failed" object:v35];
      double v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __66__NUHistogramCalculator__computeHistogramForBufferRGBAhHLG_error___block_invoke;
      v70[3] = &unk_1E5D93F88;
      v72 = &v78;
      vImage_Buffer v73 = v76;
      double v74 = min;
      double v75 = max;
      id v71 = v7;
      [(NUMutableImageHistogram *)v10 write:v70];
      if (v79[3])
      {
        uint64_t v36 = objc_msgSend(NSNumber, "numberWithLong:");
        *a4 = +[NUError failureError:@"vImageHistogramCalculation_ARGBFFFF failed" object:v36];

        double v17 = 0;
      }
      else
      {
        double v17 = v10;
      }
      uint64_t v35 = v71;
    }
  }
  _Block_object_dispose(&v78, 8);

  return v17;
}

uint64_t __66__NUHistogramCalculator__computeHistogramForBufferRGBAhHLG_error___block_invoke(uint64_t a1, vImagePixelCount *a2, vImagePixelCount *a3, vImagePixelCount *a4, vImagePixelCount *a5, unsigned int histogram_entries)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  histogram[0] = a5;
  histogram[1] = a2;
  histogram[2] = a3;
  histogram[3] = a4;
  Pixel_F v7 = *(double *)(a1 + 80);
  Pixel_F v8 = *(double *)(a1 + 88);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = vImageHistogramCalculation_ARGBFFFF((const vImage_Buffer *)(a1 + 48), histogram, histogram_entries, v7, v8, 0);
  [*(id *)(a1 + 32) size];
  return [*(id *)(a1 + 32) size] * v9;
}

- (id)_computeHistogramForBufferBGRA8:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v18 = NUAssertLogger_1902();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_1902();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        float v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        float v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v32;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v24 = [v23 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 114, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    float v25 = NUAssertLogger_1902();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      float v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    float v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_1902();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v41;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v29)
    {
      float v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v31 = [v30 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator _computeHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 115, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  Pixel_F v7 = v6;
  Pixel_F v8 = objc_alloc_init(NUMutableImageHistogram);
  src.datfloat a = (void *)[v7 bytes];
  [v7 size];
  src.height = v9;
  LODWORD(src.width) = [v7 size];
  src.width = LODWORD(src.width);
  src.rowBytes = [v7 rowBytes];
  id v10 = objc_alloc(MEMORY[0x1E4F1CA58]);
  [v7 size];
  id v12 = objc_msgSend(v10, "initWithLength:", v11 * objc_msgSend(v7, "rowBytes"));
  dest.datfloat a = (void *)[v12 mutableBytes];
  [v7 size];
  dest.height = v13;
  LODWORD(dest.width) = [v7 size];
  dest.width = LODWORD(dest.width);
  dest.rowBytes = [v7 rowBytes];
  matrix[0] = (int)rintf(ldexpf(self->_colorMatrix.a.b, 10));
  matrix[1] = (int)rintf(ldexpf(self->_colorMatrix.r.b, 10));
  matrix[2] = (int)rintf(ldexpf(self->_colorMatrix.g.b, 10));
  matrix[3] = (int)rintf(ldexpf(self->_colorMatrix.b.b, 10));
  matrix[4] = (int)rintf(ldexpf(self->_colorMatrix.a.g, 10));
  matrix[5] = (int)rintf(ldexpf(self->_colorMatrix.r.g, 10));
  matrix[6] = (int)rintf(ldexpf(self->_colorMatrix.g.g, 10));
  matrix[7] = (int)rintf(ldexpf(self->_colorMatrix.b.g, 10));
  matrix[8] = (int)rintf(ldexpf(self->_colorMatrix.a.r, 10));
  matrix[9] = (int)rintf(ldexpf(self->_colorMatrix.r.r, 10));
  matrix[10] = (int)rintf(ldexpf(self->_colorMatrix.g.r, 10));
  matrix[11] = (int)rintf(ldexpf(self->_colorMatrix.b.r, 10));
  matrix[12] = (int)rintf(ldexpf(self->_colorMatrix.a.a, 10));
  matrix[13] = (int)rintf(ldexpf(self->_colorMatrix.r.a, 10));
  matrix[14] = (int)rintf(ldexpf(self->_colorMatrix.g.a, 10));
  matrix[15] = (int)rintf(ldexpf(self->_colorMatrix.b.a, 10));
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  vImage_Error v57 = 0;
  vImage_Error v57 = vImageMatrixMultiply_ARGB8888(&src, &dest, matrix, 1024, 0, 0, 0);
  if (v55[3])
  {
    id v14 = objc_msgSend(NSNumber, "numberWithLong:");
    +[NUError failureError:@"vImageMatrixMultiply_ARGB8888 failed" object:v14];
    unsigned int v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __63__NUHistogramCalculator__computeHistogramForBufferBGRA8_error___block_invoke;
    v50[3] = &unk_1E5D93F60;
    v52 = &v54;
    vImage_Buffer v53 = dest;
    id v51 = v7;
    [(NUMutableImageHistogram *)v8 write:v50];
    if (v55[3])
    {
      double v16 = objc_msgSend(NSNumber, "numberWithLong:");
      *a4 = +[NUError failureError:@"vImageHistogramCalculation_ARGB8888 failed" object:v16];

      unsigned int v15 = 0;
    }
    else
    {
      unsigned int v15 = v8;
    }
    id v14 = v51;
  }

  _Block_object_dispose(&v54, 8);

  return v15;
}

uint64_t __63__NUHistogramCalculator__computeHistogramForBufferBGRA8_error___block_invoke(uint64_t a1, vImagePixelCount *a2, vImagePixelCount *a3, vImagePixelCount *a4, vImagePixelCount *a5)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  histogram[0] = a5;
  histogram[1] = a2;
  histogram[2] = a3;
  histogram[3] = a4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = vImageHistogramCalculation_ARGB8888((const vImage_Buffer *)(a1 + 48), histogram, 0);
  [*(id *)(a1 + 32) size];
  return [*(id *)(a1 + 32) size] * v6;
}

- (id)computeHistogramFromBuffer:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    unsigned int v19 = NUAssertLogger_1902();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)buf = 138543362;
      v52 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v22 = NUAssertLogger_1902();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        float v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        uint64_t v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v33;
        __int16 v53 = 2114;
        uint64_t v54 = v37;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      float v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 58, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    float v26 = NUAssertLogger_1902();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      float v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v52 = v27;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v29 = NUAssertLogger_1902();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        BOOL v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v52 = v42;
        __int16 v53 = 2114;
        uint64_t v54 = v46;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      float v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      float v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v52 = v32;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 59, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  Pixel_F v7 = v6;
  Pixel_F v8 = [v6 format];
  uint64_t v9 = +[NUPixelFormat BGRA8];
  int v10 = [v8 isEqualToPixelFormat:v9];

  if (!v10)
  {
    id v12 = [v7 format];
    unsigned int v13 = +[NUPixelFormat RGBAh];
    int v14 = [v12 isEqualToPixelFormat:v13];

    if (!v14)
    {
      double v16 = [v7 format];
      *a4 = +[NUError unsupportedError:@"Unsupported pixel format" object:v16];

      double v17 = 0;
      goto LABEL_17;
    }
    if (self->_binCount >= 1)
    {
      if (self->_range.min >= 0.0 && self->_range.max <= 12.0)
      {
        uint64_t v11 = [(NUHistogramCalculator *)self _computeHistogramForBufferRGBAhHLG:v7 error:a4];
        goto LABEL_21;
      }
      unsigned int v15 = @"Unsupported histogram range for half float HDR image";
LABEL_16:
      +[NUError unsupportedError:v15 object:self];
      double v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_13:
    unsigned int v15 = @"Unsupported histogram bin count for 8-bit image";
    goto LABEL_16;
  }
  if (self->_binCount != 256) {
    goto LABEL_13;
  }
  if (self->_range.min != 0.0 || self->_range.max != 1.0)
  {
    unsigned int v15 = @"Unsupported histogram range for 8-bit image";
    goto LABEL_16;
  }
  uint64_t v11 = [(NUHistogramCalculator *)self _computeHistogramForBufferBGRA8:v7 error:a4];
LABEL_21:
  double v17 = (void *)v11;
LABEL_17:

  return v17;
}

- (NUHistogramCalculator)init
{
  v3.receivefloat r = self;
  v3.super_class = (Class)NUHistogramCalculator;
  $F24F406B2B787EFB06265DBA3D28CBD5 result = [(NUHistogramCalculator *)&v3 init];
  result->_range = ($7B59B1D66D8657D7171CFE400C1A1779)xmmword_1A9A72CB0;
  result->_colorMatrix.float r = ($43F634250C0E94E2A09AB0840E4770D1)NUStandardLuminanceColorMatrix;
  result->_colorMatrix.float g = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A9A746E0;
  result->_colorMatrix.float b = ($43F634250C0E94E2A09AB0840E4770D1)xmmword_1A9A746F0;
  result->_binCount = 256;
  result->_colorMatrix.float a = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A9A74700;
  return result;
}

@end