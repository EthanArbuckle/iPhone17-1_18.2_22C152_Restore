@interface PXGCornerMaskPathLibrary
+ (PXGCornerMaskPathLibrary)sharedLibrary;
- (PXGCornerMaskPathLibrary)init;
- (id)pathForCornerRadius:(double)a3 continuousCorners:(BOOL)a4 screenScale:(double)a5 maskColor:(id)a6;
@end

@implementation PXGCornerMaskPathLibrary

- (void).cxx_destruct
{
}

- (id)pathForCornerRadius:(double)a3 continuousCorners:(BOOL)a4 screenScale:(double)a5 maskColor:(id)a6
{
  BOOL v7 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  double v11 = a3 * a5;
  id v12 = objc_alloc((Class)off_1E5DA9660);
  v13 = [NSNumber numberWithDouble:a3 * a5];
  v27[0] = v13;
  v27[1] = v10;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v15 = (void *)[v12 initWithObjects:v14];

  v16 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v15];
  if (!v16)
  {
    double v17 = (double)(uint64_t)round((double)(uint64_t)ceil(a3 * 1.528665 + a3 * 1.528665) * a5) * 0.5;
    double v18 = (double)(uint64_t)round(v17);
    double v19 = (double)(uint64_t)(double)(uint64_t)(2 * llround(v17));
    v20 = objc_msgSend(MEMORY[0x1E4FB14C0], "px_bezierPathWithRoundedRect:cornerRadius:continuousCorners:", v7, 0.0, 0.0, v19, v19, (double)(uint64_t)v11);
    v21 = [v20 bezierPathByReversingPath];

    id v22 = v21;
    v23 = (const CGPath *)[v22 CGPath];
    CGRect BoundingBox = CGPathGetBoundingBox(v23);
    v24 = CGPathCreateWithRect(BoundingBox, 0);
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, v24);
    CGPathAddPath(Mutable, 0, v23);
    v16 = objc_msgSend(objc_alloc((Class)off_1E5DA6A70), "initWithBounds:CGPath:strokeColor:lineWidth:fillColor:drawingMode:", Mutable, 0, v10, 0, 0.0, 0.0, v18, v18, 0.0);
    [(NSMutableDictionary *)self->_cache setObject:v16 forKeyedSubscript:v15];
    CGPathRelease(Mutable);
    CGPathRelease(v24);
  }
  return v16;
}

- (PXGCornerMaskPathLibrary)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXGCornerMaskPathLibrary;
  v2 = [(PXGCornerMaskPathLibrary *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

+ (PXGCornerMaskPathLibrary)sharedLibrary
{
  if (sharedLibrary_onceToken != -1) {
    dispatch_once(&sharedLibrary_onceToken, &__block_literal_global_145_195902);
  }
  v2 = (void *)sharedLibrary_sharedLibrary;
  return (PXGCornerMaskPathLibrary *)v2;
}

void __41__PXGCornerMaskPathLibrary_sharedLibrary__block_invoke()
{
  v0 = objc_alloc_init(PXGCornerMaskPathLibrary);
  v1 = (void *)sharedLibrary_sharedLibrary;
  sharedLibrary_sharedLibrary = (uint64_t)v0;
}

@end