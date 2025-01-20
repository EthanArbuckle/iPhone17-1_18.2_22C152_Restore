@interface CRFormContourBasedDetector
- (CRFormAnalyzerConfiguration)configuration;
- (CRFormContourBasedDetector)initWithConfiguration:(id)a3 error:(id *)a4;
- (id)detectFormFieldsInImage:(id)a3;
@end

@implementation CRFormContourBasedDetector

- (CRFormContourBasedDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRFormContourBasedDetector;
  v7 = [(CRFormContourBasedDetector *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_configuration, a3);
  }

  return v8;
}

- (id)detectFormFieldsInImage:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 width];
  unint64_t v5 = [v3 height];
  double v6 = fmin((double)(unint64_t)[v3 width], (double)(unint64_t)objc_msgSend(v3, "height"));
  if (v6 > 1224.0)
  {
    uint64_t v7 = objc_msgSend(v3, "imageByScalingToWidth:height:", (unint64_t)(1224.0 / v6 * (double)(unint64_t)objc_msgSend(v3, "width")), (unint64_t)(1224.0 / v6 * (double)(unint64_t)objc_msgSend(v3, "height")));

    id v3 = (id)v7;
  }
  v8 = [v3 imageByConvertingToColorSpace:0 forceDataCopy:1];
  [v8 size];
  double v10 = v9;
  double v12 = v11;
  v13 = [v3 url];
  v75 = v8;
  v14 = [v13 URLByDeletingPathExtension];
  v15 = [v14 lastPathComponent];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"null%lu", objc_msgSend(v3, "hash"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  if (v8)
  {
    [v8 vImage];
    uint64_t v19 = *((void *)&v96 + 1);
    long long v102 = 0u;
    long long v103 = 0u;
    [v8 vImage];
  }
  else
  {
    uint64_t v19 = 0;
    long long v102 = 0u;
    long long v103 = 0u;
  }
  *(void *)&long long v100 = malloc_type_malloc(v19 * (unint64_t)v12, 0xA9050F13uLL);
  *((void *)&v100 + 1) = (unint64_t)v12;
  *(void *)&long long v101 = (unint64_t)v10;
  *((void *)&v101 + 1) = v19;
  CRLogger = CRLogger::getCRLogger((CRLogger *)v100);
  if (*CRLogger && (CRLogger[8] & 0x10) != 0)
  {
    v21 = [NSString stringWithFormat:@"/tmp/form_%@_contours_1_src.png", v18];
    long long v95 = v102;
    long long v96 = v103;
    writeBufferWithMetadata((uint64_t)&v95, v21, 0);
  }
  if ((unint64_t)v103 < 0x33 || *((void *)&v102 + 1) < 0x33uLL)
  {
    free((void *)v100);
    v62 = (int32x2_t *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v99[0] = v102;
    v99[1] = v103;
    adaptiveThresholdIntegralImage((uint64_t)v99, (uint64_t *)&v100, 50, 10);
    v23 = CRLogger::getCRLogger(v22);
    if (*v23 && (v23[8] & 0x10) != 0)
    {
      v24 = [NSString stringWithFormat:@"/tmp/form_%@_contours_2_img.png", v18];
      long long v95 = v100;
      long long v96 = v101;
      writeBufferWithMetadata((uint64_t)&v95, v24, 0);
    }
    uint64_t v97 = 0x340200000;
    int v98 = 1080033280;
    RectangleFinder::traceAllContoursWithoutFiltering((RectangleFinder *)&v100, (const vImage_Buffer *)0xFF, &v93);
    v73 = v18;
    v74 = v3;
    RectangleFinder::identifyRectangleContours(&v93, (uint64_t *)&v91);
    v26 = CRLogger::getCRLogger(v25);
    if (*v26 && (v26[8] & 0x10) != 0)
    {
      memset(v90, 0, sizeof(v90));
      std::vector<std::vector<PixelPosition>>::__init_with_size[abi:ne180100]<std::vector<PixelPosition>*,std::vector<PixelPosition>*>(v90, v93, v94, 0xAAAAAAAAAAAAAAABLL * ((v94 - v93) >> 3));
      v89[0] = v100;
      v89[1] = v101;
      ImageFromContour = createImageFromContour(v90, (uint64_t)v89);
      v84 = (void **)v90;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v84);
      v28 = [NSString stringWithFormat:@"/tmp/form_%@_contours_3_lines.png", v18];
      writeCGImageWithMetadata(ImageFromContour, v28, 0);
      CGImageRelease(ImageFromContour);
      memset(v88, 0, sizeof(v88));
      std::vector<std::vector<PixelPosition>>::__init_with_size[abi:ne180100]<std::vector<PixelPosition>*,std::vector<PixelPosition>*>(v88, (uint64_t)v91, (uint64_t)v92, 0xAAAAAAAAAAAAAAABLL * (v92 - v91));
      v87[0] = v100;
      v87[1] = v101;
      v29 = createImageFromContour(v88, (uint64_t)v87);
      v84 = (void **)v88;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v84);
      v30 = [NSString stringWithFormat:@"/tmp/form_%@_contours_3_rects.png", v18];
      writeCGImageWithMetadata(v29, v30, 0);
      CGImageRelease(v29);
    }
    v84 = 0;
    v85 = 0;
    unint64_t v86 = 0;
    v31 = [MEMORY[0x1E4F1CA48] array];
    v32 = v31;
    double v76 = (double)v4;
    double v33 = (double)v5;
    uint64_t v34 = v93;
    if (v94 != v93)
    {
      uint64_t v35 = 0;
      unint64_t v36 = 0;
      do
      {
        __p = 0;
        v82 = 0;
        uint64_t v83 = 0;
        std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(&__p, *(const void **)(v34 + v35), *(void *)(v34 + v35 + 8), (uint64_t)(*(void *)(v34 + v35 + 8) - *(void *)(v34 + v35)) >> 3);
        v31 = (int32x2_t *)__p;
        if ((unint64_t)((char *)v82 - (unsigned char *)__p) >= 0x58)
        {
          *(void *)&v105.origin.double x = *(_OWORD *)&boxForContour((int32x2_t *)__p, v82);
          double x = v105.origin.x;
          double y = v105.origin.y;
          double width = v105.size.width;
          CGFloat height = v105.size.height;
          if (CGRectGetWidth(v105) > 20.0)
          {
            v106.origin.double x = x;
            v106.origin.double y = y;
            v106.size.double width = width;
            v106.size.CGFloat height = height;
            if (CGRectGetHeight(v106) < 6.0 && y > 30.0)
            {
              v42 = v85;
              if ((unint64_t)v85 >= v86)
              {
                v43 = (void *)std::vector<std::vector<PixelPosition>>::__push_back_slow_path<std::vector<PixelPosition> const&>((uint64_t *)&v84, (uint64_t)&__p);
              }
              else
              {
                void *v85 = 0;
                v42[1] = 0;
                v42[2] = 0;
                std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(v42, __p, (uint64_t)v82, ((char *)v82 - (unsigned char *)__p) >> 3);
                v43 = v42 + 3;
              }
              v85 = v43;
              v44 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", x / v10, fmax(y + -30.0, 0.0) / v12, width / v10, 30.0 / v12, v76, v33);
              v45 = [[CRFormField alloc] initWithQuad:v44 type:1 source:2 value:0 contentType:0 maxCharacterCount:0x7FFFFFFFFFFFFFFFLL];
              [(CRFormField *)v45 setHasBoundedWidth:1];
              [(CRFormField *)v45 setHasBoundedHeight:0];
              [(int32x2_t *)v32 addObject:v45];
            }
          }
          v31 = (int32x2_t *)__p;
        }
        if (v31)
        {
          v82 = v31;
          operator delete(v31);
        }
        ++v36;
        uint64_t v34 = v93;
        v35 += 24;
      }
      while (v36 < 0xAAAAAAAAAAAAAAABLL * ((v94 - v93) >> 3));
    }
    v46 = v91;
    if (v92 != v91)
    {
      uint64_t v47 = 0;
      unint64_t v48 = 0;
      do
      {
        __p = 0;
        v82 = 0;
        uint64_t v83 = 0;
        std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(&__p, v46[v47], (uint64_t)v46[v47 + 1], ((unsigned char *)v46[v47 + 1] - (unsigned char *)v46[v47]) >> 3);
        *(void *)&double v49 = *(_OWORD *)&boxForContour((int32x2_t *)__p, v82);
        double v51 = v50;
        double v53 = v52;
        double v55 = v54;
        v56 = v85;
        if ((unint64_t)v85 >= v86)
        {
          v57 = (void *)std::vector<std::vector<PixelPosition>>::__push_back_slow_path<std::vector<PixelPosition> const&>((uint64_t *)&v84, (uint64_t)&__p);
        }
        else
        {
          void *v85 = 0;
          v56[1] = 0;
          v56[2] = 0;
          std::vector<PixelPosition>::__init_with_size[abi:ne180100]<PixelPosition*,PixelPosition*>(v56, __p, (uint64_t)v82, ((char *)v82 - (unsigned char *)__p) >> 3);
          v57 = v56 + 3;
        }
        v85 = v57;
        v58 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", v49 / v10, v51 / v12, v53 / v10, v55 / v12, v76, v33);
        v59 = [[CRFormField alloc] initWithQuad:v58 type:1 source:2 value:0 contentType:0 maxCharacterCount:0x7FFFFFFFFFFFFFFFLL];
        [(CRFormField *)v59 setHasBoundedWidth:1];
        [(CRFormField *)v59 setHasBoundedHeight:1];
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __54__CRFormContourBasedDetector_detectFormFieldsInImage___block_invoke;
        v79[3] = &unk_1E6CDAD28;
        v60 = v58;
        v80 = v60;
        if ([(int32x2_t *)v32 indexOfObjectPassingTest:v79] == 0x7FFFFFFFFFFFFFFFLL) {
          [(int32x2_t *)v32 addObject:v59];
        }

        v31 = (int32x2_t *)__p;
        if (__p)
        {
          v82 = (int32x2_t *)__p;
          operator delete(__p);
        }
        ++v48;
        v46 = v91;
        v47 += 3;
      }
      while (v48 < 0xAAAAAAAAAAAAAAABLL * (v92 - v91));
    }
    v61 = CRLogger::getCRLogger((CRLogger *)v31);
    v18 = v73;
    id v3 = v74;
    v8 = v75;
    v62 = v32;
    if (*v61 && (v61[8] & 0x10) != 0)
    {
      memset(v78, 0, sizeof(v78));
      std::vector<std::vector<PixelPosition>>::__init_with_size[abi:ne180100]<std::vector<PixelPosition>*,std::vector<PixelPosition>*>(v78, (uint64_t)v84, (uint64_t)v85, 0xAAAAAAAAAAAAAAABLL * ((void **)v85 - v84));
      v77[0] = v100;
      v77[1] = v101;
      CGImageRef v63 = createImageFromContour(v78, (uint64_t)v77);
      __p = v78;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      v64 = [v74 url];
      v65 = [v64 URLByDeletingPathExtension];
      v66 = v63;
      v67 = [v65 lastPathComponent];
      v68 = v67;
      if (v67)
      {
        id v69 = v67;
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"null%lu", objc_msgSend(v74, "hash"));
        id v69 = (id)objc_claimAutoreleasedReturnValue();
      }
      v70 = v69;

      v71 = [NSString stringWithFormat:@"/tmp/form_%@_contours_4_final.png", v70];
      writeCGImageWithMetadata(v66, v71, 0);
      CGImageRelease(v66);
    }
    free((void *)v100);
    __p = &v84;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    v84 = (void **)&v91;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v84);
    v91 = (void **)&v93;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v91);
  }

  return v62;
}

uint64_t __54__CRFormContourBasedDetector_detectFormFieldsInImage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v6 = [a2 boundingQuad];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return (CRFormAnalyzerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end