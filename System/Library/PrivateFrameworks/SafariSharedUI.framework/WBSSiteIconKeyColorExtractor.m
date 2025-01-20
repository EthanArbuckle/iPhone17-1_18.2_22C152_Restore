@interface WBSSiteIconKeyColorExtractor
+ (char)_createRGBAPixelBufferFromImage:(CGImage *)a3;
+ (id)keyColorForIcon:(id)a3;
+ (id)keyColorForIcon:(id)a3 allowAllColors:(BOOL)a4 confidence:(double *)a5 nonTransparentConfidence:(double *)a6 insets:(UIEdgeInsets *)a7;
@end

@implementation WBSSiteIconKeyColorExtractor

+ (id)keyColorForIcon:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = [a1 keyColorForIcon:a3 allowAllColors:0 confidence:&v7 nonTransparentConfidence:&v6 insets:v5];
  return v3;
}

+ (id)keyColorForIcon:(id)a3 allowAllColors:(BOOL)a4 confidence:(double *)a5 nonTransparentConfidence:(double *)a6 insets:(UIEdgeInsets *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  v13 = v12;
  if (!v12)
  {
    v22 = 0;
    goto LABEL_40;
  }
  objc_getAssociatedObject(v12, &keyColorForIcon_allowAllColors_confidence_nonTransparentConfidence_insets__iconColorImageKey);
  v14 = (WBSSiteIconKeyColorExtractorCache *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10 && v14)
  {
    [(WBSSiteIconKeyColorExtractorCache *)v14 confidence];
    *(void *)a5 = v16;
    [(WBSSiteIconKeyColorExtractorCache *)v15 nonTransparentConfidence];
    *(void *)a6 = v17;
    [(WBSSiteIconKeyColorExtractorCache *)v15 insets];
    a7->top = v18;
    a7->left = v19;
    a7->bottom = v20;
    a7->right = v21;
    v22 = [(WBSSiteIconKeyColorExtractorCache *)v15 color];
  }
  else
  {
    id v71 = v13;
    v23 = (CGImage *)[v71 CGImage];
    size_t Height = CGImageGetHeight(v23);
    size_t Width = CGImageGetWidth(v23);
    if (Width * Height)
    {
      unint64_t v26 = Width;
      unint64_t v68 = Width * Height;
      v70 = a6;
      v27 = (char *)malloc_type_calloc(0x200uLL, 0x28uLL, 0x10000400A747E1EuLL);
      v28 = (unsigned char *)[a1 _createRGBAPixelBufferFromImage:v23];
      double v32 = (double)Height;
      unint64_t v33 = 0;
      if (Height)
      {
        unint64_t v34 = 0;
        double v35 = 0.0;
        double v36 = (double)Height;
        double v37 = (double)v26;
        double v38 = 0.0;
        v39 = v28;
        do
        {
          if (v26)
          {
            unint64_t v40 = 0;
            double v41 = (double)v34;
            do
            {
              unsigned int v42 = v39[3];
              if (v42 >= 0xA)
              {
                double v43 = (double)v40;
                if (v36 >= v41) {
                  double v36 = (double)v34;
                }
                if (v37 >= v43) {
                  double v37 = (double)v40;
                }
                if (v35 <= v41) {
                  double v35 = (double)v34;
                }
                double v44 = (double)v42;
                double v45 = 255.0 / (double)v42;
                LOBYTE(v29) = v39[2];
                double v46 = v45 * (double)*(unint64_t *)&v29;
                LOBYTE(v30) = v39[1];
                double v30 = v45 * (double)*(unint64_t *)&v30;
                LOBYTE(v31) = *v39;
                double v47 = v45 * (double)*(unint64_t *)&v31;
                if (v38 <= v43) {
                  double v38 = (double)v40;
                }
                v48 = (double *)&v27[40
                                   * (((int)v30 >> 2) & 0x38 | ((int)v46 >> 5 << 6) | ((int)v47 >> 5))];
                double v31 = v48[1];
                double v49 = v46 + *v48;
                ++*((void *)v48 + 4);
                double *v48 = v49;
                v48[1] = v30 + v31;
                double v29 = v48[3];
                v48[2] = v47 + v48[2];
                v48[3] = v29 + v44;
                ++v33;
              }
              v39 += 4;
              ++v40;
            }
            while (v26 != v40);
          }
          ++v34;
        }
        while (v34 != Height);
      }
      else
      {
        double v38 = 0.0;
        double v35 = 0.0;
        double v37 = (double)v26;
        double v36 = (double)0;
      }
      free(v28);
      unsigned int v50 = 0;
      uint64_t v51 = 0;
      v52 = v27;
      v53 = v27;
      do
      {
        if ((v10 || v51 && v51 != 511) && *((void *)v52 + 4) > (unint64_t)v50)
        {
          v53 = v52;
          unsigned int v50 = *((void *)v52 + 4);
        }
        ++v51;
        v52 += 40;
      }
      while (v51 != 512);
      if (v10 || v53 != v27)
      {
        unint64_t v54 = *((void *)v53 + 4);
        if (v54)
        {
          double v55 = (double)(255 * v54);
          double v56 = *(double *)v53;
          double v57 = *((double *)v53 + 1);
          double v58 = *((double *)v53 + 2);
          double v59 = *((double *)v53 + 3);
          *a5 = (double)v54 / (double)v68;
          double v60 = v56 / v55;
          double v67 = v57 / v55;
          double v69 = v58 / v55;
          double *v70 = (double)v54 / (double)v33;
          double v61 = v59 / v55;
          [v71 size];
          double v63 = v62 / (double)v26;
          [v71 size];
          a7->top = v36 * (v64 / v32);
          a7->left = v37 * v63;
          a7->bottom = v35 * (v64 / v32);
          a7->right = v38 * v63;
          free(v27);
          v22 = [MEMORY[0x1E4F428B8] colorWithRed:v60 * v61 green:v67 * v61 blue:v69 * v61 alpha:1.0];
          if (v10)
          {
            v65 = objc_alloc_init(WBSSiteIconKeyColorExtractorCache);

            [(WBSSiteIconKeyColorExtractorCache *)v65 setColor:v22];
            [(WBSSiteIconKeyColorExtractorCache *)v65 setConfidence:*a5];
            [(WBSSiteIconKeyColorExtractorCache *)v65 setNonTransparentConfidence:*v70];
            -[WBSSiteIconKeyColorExtractorCache setInsets:](v65, "setInsets:", a7->top, a7->left, a7->bottom, a7->right);
            objc_setAssociatedObject(v71, &keyColorForIcon_allowAllColors_confidence_nonTransparentConfidence_insets__iconColorImageKey, v65, (void *)1);
            v15 = v65;
          }
          goto LABEL_39;
        }
      }
      free(v27);
    }
    v22 = 0;
  }
LABEL_39:

LABEL_40:
  return v22;
}

+ (char)_createRGBAPixelBufferFromImage:(CGImage *)a3
{
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  uint64_t v6 = malloc_type_malloc(4 * Width * Height, 0x4C1D074DuLL);
  bzero(v6, 4 * Width * Height);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CGBitmapContextCreate(v6, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  v10.size.width = (double)Width;
  v10.size.height = (double)Height;
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  CGContextDrawImage(v8, v10, a3);
  CGContextRelease(v8);
  return (char *)v6;
}

@end