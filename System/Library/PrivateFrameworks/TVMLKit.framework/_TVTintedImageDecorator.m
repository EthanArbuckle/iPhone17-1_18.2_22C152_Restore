@interface _TVTintedImageDecorator
- (IKColor)tintColor;
- (_TVTintedImageDecorator)initWithTintColor:(id)a3;
- (id)decoratorIdentifier;
- (void)drawInContext:(id)a3 imageRect:(CGRect)a4;
@end

@implementation _TVTintedImageDecorator

- (_TVTintedImageDecorator)initWithTintColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVTintedImageDecorator;
  v6 = [(TVImageScaleDecorator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tintColor, a3);
  }

  return v7;
}

- (id)decoratorIdentifier
{
  v3 = [(_TVTintedImageDecorator *)self tintColor];
  v39.receiver = self;
  v39.super_class = (Class)_TVTintedImageDecorator;
  v4 = [(TVImageScaleDecorator *)&v39 decoratorIdentifier];
  id v5 = (void *)[v4 mutableCopy];

  v6 = [v3 color];
  if (v6 || [v3 colorType] != 3)
  {
    id v9 = v6;
  }
  else
  {
    v7 = [v3 gradientColors];
    if ([v7 count] == 1)
    {
      v8 = [v3 gradientColors];
      id v9 = [v8 firstObject];
    }
    else
    {
      id v9 = 0;
    }
  }
  if (v9)
  {
    double v37 = 0.0;
    double v38 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    [v9 getRed:&v38 green:&v37 blue:&v36 alpha:&v35];
    [v5 appendFormat:@"_t"];
    v10 = &off_230C37000;
    LODWORD(v10) = vcvtad_u64_f64(v38 * 255.0);
    LODWORD(v11) = vcvtad_u64_f64(v37 * 255.0);
    LODWORD(v12) = vcvtad_u64_f64(v36 * 255.0);
    float v13 = v35;
    objc_msgSend(v5, "appendFormat:", @"%02X%02X%02X%.1f", v10, v11, v12, v13);
  }
  else if ([v3 colorType] == 3)
  {
    v14 = [v3 gradientColors];
    unint64_t v15 = [v14 count];

    if (v15 >= 2)
    {
      [v5 appendFormat:@"_t"];
      v16 = [v3 gradientColors];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        unint64_t v18 = 0;
        do
        {
          v19 = [v3 gradientPoints];
          v20 = [v19 objectAtIndex:v18];
          [v20 floatValue];
          double v22 = v21;

          v23 = [v3 gradientColors];
          v24 = [v23 objectAtIndex:v18];

          double v37 = 0.0;
          double v38 = 0.0;
          double v35 = 0.0;
          double v36 = 0.0;
          [v24 getRed:&v38 green:&v37 blue:&v36 alpha:&v35];
          LODWORD(v25) = vcvtad_u64_f64(v38 * 255.0);
          LODWORD(v26) = vcvtad_u64_f64(v37 * 255.0);
          LODWORD(v27) = vcvtad_u64_f64(v36 * 255.0);
          float v28 = v35;
          [v5 appendFormat:@"%.2f:%02X%02X%02X%.1f", *(void *)&v22, v25, v26, v27, v28];
          v29 = [v3 gradientColors];
          unint64_t v30 = [v29 count] - 1;

          if (v18 < v30) {
            [v5 appendString:@","];
          }

          ++v18;
          v31 = [v3 gradientColors];
          unint64_t v32 = [v31 count];
        }
        while (v18 < v32);
      }
    }
  }
  v33 = (void *)[v5 copy];

  return v33;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [(_TVTintedImageDecorator *)self tintColor];
  if (v8)
  {
    id v9 = (CGContext *)[v7 CGContext];
    CGContextSaveGState(v9);
    CGContextTranslateCTM(v9, 0.0, height);
    CGContextScaleCTM(v9, 1.0, -1.0);
    v10 = [v8 color];
    if (v10 || [v8 colorType] != 3)
    {
      id v13 = v10;
    }
    else
    {
      uint64_t v11 = [v8 gradientColors];
      if ([v11 count] == 1)
      {
        uint64_t v12 = [v8 gradientColors];
        id v13 = [v12 firstObject];
      }
      else
      {
        id v13 = 0;
      }
    }
    if (v13)
    {
      id v14 = [v8 color];
      CGContextSetFillColorWithColor(v9, (CGColorRef)[v14 CGColor]);

      v47.origin.x = 0.0;
      v47.origin.y = 0.0;
      v47.size.double width = width;
      v47.size.double height = height;
      CGContextFillRect(v9, v47);
    }
    else if ([v8 colorType] == 3)
    {
      unint64_t v15 = [v8 gradientColors];
      unint64_t v16 = [v15 count];

      if (v16 >= 2)
      {
        uint64_t v17 = [v8 gradientPoints];
        uint64_t v18 = [v17 count];

        v19 = (CGFloat *)malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
        if (v19)
        {
          v20 = v19;
          float v21 = [v8 gradientPoints];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __51___TVTintedImageDecorator_drawInContext_imageRect___block_invoke;
          v44[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
          locations = v20;
          v44[4] = v20;
          [v21 enumerateObjectsUsingBlock:v44];

          double v22 = [MEMORY[0x263EFF980] arrayWithCapacity:v18];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v23 = [v8 gradientColors];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v41 != v26) {
                  objc_enumerationMutation(v23);
                }
                objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "CGColor"));
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v45 count:16];
            }
            while (v25);
          }

          float v28 = CGGradientCreateWithColors(0, (CFArrayRef)v22, locations);
          v29 = (double *)MEMORY[0x263F00148];
          uint64_t v30 = [v8 gradientDirectionType];
          double v31 = *locations;
          if (v30 == 1)
          {
            double v32 = *v29;
            double v33 = height * (1.0 - v31);
            double v34 = height * (1.0 - locations[v18 - 1]);
            double v35 = v34 - v33;
            double v36 = *v29;
          }
          else
          {
            double v33 = v29[1];
            double v32 = width * v31;
            double v36 = width * locations[v18 - 1];
            double v35 = v36 - width * v31;
            double v34 = v33;
            double height = width;
          }
          if (v18)
          {
            double v37 = fabs(v35);
            double v38 = locations;
            do
            {
              *double v38 = height * (*v38 - v31) / v37;
              ++v38;
              --v18;
            }
            while (v18);
          }
          if (v28)
          {
            CGContextDrawLinearGradient(v9, v28, *(CGPoint *)&v32, *(CGPoint *)&v36, 0);
            CGGradientRelease(v28);
          }
          free(locations);
        }
      }
    }
    CGContextRestoreGState(v9);
  }
}

- (IKColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
}

@end