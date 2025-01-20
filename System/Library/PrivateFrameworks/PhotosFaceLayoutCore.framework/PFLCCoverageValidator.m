@interface PFLCCoverageValidator
- (PFLCCoverageValidator)initWithMaskImage:(CGImage *)a3 orientation:(unsigned int)a4;
- (double)coverageOfTimeLabel:(CGRect)a3;
- (void)dealloc;
@end

@implementation PFLCCoverageValidator

- (PFLCCoverageValidator)initWithMaskImage:(CGImage *)a3 orientation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)PFLCCoverageValidator;
  v6 = [(PFLCCoverageValidator *)&v49 init];
  if (v6)
  {
    size_t Width = CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    context = (void *)MEMORY[0x25A2DC870]();
    memset(&v48, 0, sizeof(v48));
    makePresentationTransform(v4, Width, Height, (uint64_t)&v48);
    CGAffineTransform buf = v48;
    uint64_t v9 = (uint64_t)rint(makePresentationSize((float64x2_t *)&buf, (double)Width, (double)Height) * 0.25);
    uint64_t v11 = (uint64_t)rint(v10 * 0.25);
    v6->_width = v9;
    v6->_height = v11;
    v46 = v6;
    CGAffineTransform v47 = v48;
    v12 = pflc_layout_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(void *)((char *)&buf.a + 4) = v9;
      WORD2(buf.b) = 2048;
      *(void *)((char *)&buf.b + 6) = v11;
      _os_log_impl(&dword_259343000, v12, OS_LOG_TYPE_DEFAULT, "createScaledInputData: scale input data to == %ldx%ld", (uint8_t *)&buf, 0x16u);
    }

    uint64_t v13 = (v11 + 1) * (v9 + 1);
    v14 = [MEMORY[0x263EFF990] dataWithLength:v13];
    v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002B8]);
    id v16 = v14;
    size_t v17 = CGColorSpaceGetNumberOfComponents(v15) & 0x1FFFFFFFFFFFFFFFLL;
    id v18 = v16;
    v19 = (void *)[v18 mutableBytes];

    v20 = CGBitmapContextCreate(v19, v9 + 1, v11 + 1, 8uLL, v17 * (v9 + 1), v15, 0);
    CGColorSpaceRelease(v15);
    memset(&buf, 0, sizeof(buf));
    CGAffineTransform v51 = v47;
    uprightCTM(a3, &v51, (uint64_t)&buf);
    CGAffineTransform transform = buf;
    memset(&v51, 0, sizeof(v51));
    CGAffineTransformInvert(&v51, &transform);
    CGAffineTransform transform = buf;
    CGContextConcatCTM(v20, &transform);
    CGAffineTransform transform = v51;
    v54.origin.x = 1.0;
    v54.origin.y = 0.0;
    v54.size.width = (double)(unint64_t)v9;
    v54.size.height = (double)(unint64_t)v11;
    CGRect v55 = CGRectApplyAffineTransform(v54, &transform);
    CGContextDrawImage(v20, v55, a3);
    CGContextRelease(v20);
    id v21 = v18;
    for (i = (unsigned __int8 *)[v21 mutableBytes]; v13; --v13)
    {
      unsigned int v23 = *i;
      if (v23 <= 0xC8) {
        LOBYTE(v23) = 0;
      }
      *i++ = v23;
    }
    unint64_t v24 = v46->_width;
    unint64_t v25 = v46->_height;
    id v26 = v21;
    unint64_t v27 = v24 + 1;
    v28 = (char *)malloc_type_malloc(4 * (v24 + 1) * (v25 + 1), 0x690C6C07uLL);
    id v29 = v26;
    uint64_t v30 = [v29 bytes];
    uint64_t v31 = 4 * v24;
    if (v24 != -1) {
      bzero(v28, v31 + 4);
    }
    v6 = v46;
    if (v25 != -1)
    {
      uint64_t v32 = -1;
      v33 = v28;
      do
      {
        _DWORD *v33 = 0;
        ++v32;
        v33 = (_DWORD *)((char *)v33 + v31 + 4);
      }
      while (v25 != v32);
      if (v25 + 1 >= 2)
      {
        v34 = &v28[4 * v27];
        v35 = (unsigned __int8 *)(v30 + v24 + 2);
        uint64_t v36 = 1;
        v37 = v28;
        v38 = v28;
        v39 = &v28[4 * v24 + 8];
        do
        {
          v38 += 4;
          if (v27 >= 2)
          {
            uint64_t v40 = 0;
            unint64_t v41 = v24;
            do
            {
              int v42 = *v35++;
              *(_DWORD *)&v39[v40] = *(_DWORD *)&v34[v40] + v42 + *(_DWORD *)&v38[v40] - *(_DWORD *)&v37[v40];
              v40 += 4;
              --v41;
            }
            while (v41);
            v38 += v40;
            v37 += v40;
            v34 += v40;
            v39 += v40;
          }
          ++v35;
          v39 += 4;
          v34 += 4;
          v37 += 4;
        }
        while (v36++ != v25);
      }
    }

    v46->_cumulativeData = (unsigned int *)v28;
  }
  return v6;
}

- (void)dealloc
{
  cumulativeData = self->_cumulativeData;
  if (cumulativeData) {
    free(cumulativeData);
  }
  v4.receiver = self;
  v4.super_class = (Class)PFLCCoverageValidator;
  [(PFLCCoverageValidator *)&v4 dealloc];
}

- (double)coverageOfTimeLabel:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  IsEmptCGFloat y = CGRectIsEmpty(a3);
  double result = 0.0;
  if (!IsEmpty)
  {
    unint64_t v10 = self->_width;
    double v11 = (double)v10;
    double v12 = (double)self->_height;
    CGAffineTransformMakeScale(&v18, (double)v10, v12);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v20 = CGRectApplyAffineTransform(v19, &v18);
    if (v20.origin.x < 0.0) {
      v20.origin.CGFloat x = 0.0;
    }
    if (v20.origin.y < 0.0) {
      v20.origin.CGFloat y = 0.0;
    }
    if (v20.size.width > v11 - v20.origin.x) {
      v20.size.CGFloat width = v11 - v20.origin.x;
    }
    uint64_t v13 = (uint64_t)rint(v20.origin.x + 1.0);
    if (v20.size.height > v12 - v20.origin.y) {
      v20.size.CGFloat height = v12 - v20.origin.y;
    }
    uint64_t v14 = (uint64_t)rint(v20.origin.x + v20.size.width + -1.0 + 1.0);
    uint64_t v15 = (uint64_t)rint(v20.origin.y + 1.0);
    double v16 = rint(v20.origin.y + v20.size.height + -1.0 + 1.0);
    cumulativeData = self->_cumulativeData;
    return (double)(cumulativeData[(uint64_t)v16 * (v10 + 1) + v14]
                  - (cumulativeData[(uint64_t)v16 * (v10 + 1) - 1 + v13]
                   + cumulativeData[v14 + (v15 - 1) * (v10 + 1)])
                  + cumulativeData[(v15 - 1) * (v10 + 1) - 1 + v13])
         / (v20.size.width
          * v20.size.height
          * 255.0);
  }
  return result;
}

@end