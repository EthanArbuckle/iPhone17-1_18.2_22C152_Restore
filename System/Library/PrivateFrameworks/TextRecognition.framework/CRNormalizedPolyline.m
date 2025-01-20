@interface CRNormalizedPolyline
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGPath)path;
- (CGSize)normalizationSize;
- (CRImageSpacePolyline)denormalizedPolyline;
- (CRNormalizedPolyline)init;
- (CRNormalizedPolyline)initWithCRCodableDataRepresentation:(id)a3;
- (CRNormalizedPolyline)initWithCoder:(id)a3;
- (CRNormalizedPolyline)initWithDenormalizedPolyline:(id)a3 size:(CGSize)a4;
- (CRNormalizedPolyline)initWithNormalizedPointValues:(id)a3 size:(CGSize)a4;
- (CRNormalizedPolyline)initWithNormalizedPoints:(CGPoint *)a3 count:(unint64_t)a4 size:(CGSize)a5;
- (CRNormalizedPolyline)initWithPolyline:(id)a3;
- (NSArray)pointValues;
- (NSString)description;
- (ObjectRef<const)_pathRef;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crCodableDataRepresentation;
- (id)polylineByAppendingPoint:(CGPoint)a3;
- (id)polylineByAppendingPolyline:(id)a3;
- (id)rotated180;
- (id)simplified;
- (unint64_t)pointCount;
- (void)appendPoint:(CGPoint)a3;
- (void)appendPolyline:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePoints:(id)a3;
- (void)setDenormalizedPolyline:(id)a3;
- (void)setNormalizationSize:(CGSize)a3;
- (void)set_pathRef:(ObjectRef<const CGPath *>)a3;
@end

@implementation CRNormalizedPolyline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRNormalizedPolyline)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRPolylineData"];
  v6 = uncompressDataOfSize(v5, [v4 decodeIntegerForKey:@"CRPolylineUncompressedDataSize"]);
  v7 = [(CRNormalizedPolyline *)self initWithCRCodableDataRepresentation:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(CRNormalizedPolyline *)self crCodableDataRepresentation];
  v5 = compressData(v4);
  [v6 encodeObject:v5 forKey:@"CRPolylineData"];
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v4, "length"), @"CRPolylineUncompressedDataSize");
}

- (CRNormalizedPolyline)initWithNormalizedPoints:(CGPoint *)a3 count:(unint64_t)a4 size:(CGSize)a5
{
  CGFloat width = a5.width;
  double height = a5.height;
  unint64_t v5 = a4;
  std::vector<CGPoint>::vector(__p, a4);
  if (v5)
  {
    v8 = (float64x2_t *)__p[0];
    v9.f64[0] = width;
    v9.f64[1] = height;
    do
    {
      float64x2_t v10 = *(float64x2_t *)a3++;
      *v8++ = vmulq_f64(v9, v10);
      --v5;
    }
    while (v5);
  }
  v11 = [(CRNormalizedPolyline *)self init];
  if (v11)
  {
    id v12 = -[CRImageSpacePolyline initWithPoints:]([CRImageSpacePolyline alloc], (uint64_t)__p);
    [(CRNormalizedPolyline *)v11 setDenormalizedPolyline:v12];

    -[CRNormalizedPolyline setNormalizationSize:](v11, "setNormalizationSize:", v15, height);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v11;
}

- (CRNormalizedPolyline)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRNormalizedPolyline;
  v2 = [(CRNormalizedPolyline *)&v6 init];
  v3 = v2;
  if (v2)
  {
    mCFObject = v2->__pathRef.mCFObject;
    v3->__pathRef.mCFObject = 0;
    if (mCFObject) {
      CFRelease(mCFObject);
    }
  }
  return v3;
}

- (CRNormalizedPolyline)initWithPolyline:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRNormalizedPolyline *)self init];
  if (v5)
  {
    objc_super v6 = [v4 denormalizedPolyline];
    [(CRNormalizedPolyline *)v5 setDenormalizedPolyline:v6];

    [v4 normalizationSize];
    -[CRNormalizedPolyline setNormalizationSize:](v5, "setNormalizationSize:");
  }

  return v5;
}

- (CRNormalizedPolyline)initWithDenormalizedPolyline:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [(CRNormalizedPolyline *)self init];
  float64x2_t v9 = v8;
  if (v8)
  {
    [(CRNormalizedPolyline *)v8 setDenormalizedPolyline:v7];
    -[CRNormalizedPolyline setNormalizationSize:](v9, "setNormalizationSize:", width, height);
  }

  return v9;
}

- (CRNormalizedPolyline)initWithNormalizedPointValues:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "pointValue", (void)v19);
        double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", width * v13, height * v14);
        [v8 addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v16 = [[CRImageSpacePolyline alloc] initWithPointValues:v8];
  v17 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](self, "initWithDenormalizedPolyline:size:", v16, width, height);

  return v17;
}

- (id)polylineByAppendingPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v5 = (void *)[(CRNormalizedPolyline *)self copy];
  objc_msgSend(v5, "appendPoint:", x, y);
  return v5;
}

- (id)polylineByAppendingPolyline:(id)a3
{
  id v4 = a3;
  [(CRNormalizedPolyline *)self normalizationSize];
  double v6 = v5;
  double v8 = v7;
  [v4 normalizationSize];
  if (v6 == v10 && v8 == v9)
  {
    uint64_t v12 = (void *)[(CRNormalizedPolyline *)self copy];
    [v12 appendPolyline:v4];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  [(CRNormalizedPolyline *)self normalizationSize];
  id v4 = NSStringFromSize(v11);
  double v5 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  double v6 = [v5 description];
  double v7 = [v3 stringWithFormat:@"Size: %@\nDenormalized Polyline: %@", v4, v6];

  double v8 = [NSString stringWithString:v7];

  return (NSString *)v8;
}

- (CGPath)path
{
  [(CRNormalizedPolyline *)self _pathRef];
  if (v8)
  {
    CFRelease(v8);
  }
  else
  {
    v3 = [(CRNormalizedPolyline *)self denormalizedPolyline];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__CRNormalizedPolyline_path__block_invoke;
    v6[3] = &unk_1E6CDB780;
    v6[4] = self;
    [(CRImageSpacePolyline *)&v7 createPathWithTransformer:v6];
    [(CRNormalizedPolyline *)self set_pathRef:&v7];
    if (v7) {
      CFRelease(v7);
    }
  }
  [(CRNormalizedPolyline *)self _pathRef];
  id v4 = (CGPath *)v8;
  if (v8) {
    CFRelease(v8);
  }
  return v4;
}

double __28__CRNormalizedPolyline_path__block_invoke(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) normalizationSize];
  if (v4 != 0.0 && v3 != 0.0) {
    return a2 / v3;
  }
  return a2;
}

- (unint64_t)pointCount
{
  v2 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  unint64_t v3 = [v2 pointCount];

  return v3;
}

- (NSArray)pointValues
{
  unint64_t v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CRNormalizedPolyline_pointValues__block_invoke;
  v7[3] = &unk_1E6CDB6B8;
  id v4 = v3;
  id v8 = v4;
  [(CRNormalizedPolyline *)self enumeratePoints:v7];
  double v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return (NSArray *)v5;
}

void __35__CRNormalizedPolyline_pointValues__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");
}

- (void)enumeratePoints:(id)a3
{
  id v4 = a3;
  double v5 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CRNormalizedPolyline_enumeratePoints___block_invoke;
  v6[3] = &unk_1E6CDB780;
  v6[4] = self;
  -[CRImageSpacePolyline enumeratePointsWithTransformer:block:]((uint64_t)v5, v6, v4);
}

double __40__CRNormalizedPolyline_enumeratePoints___block_invoke(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) normalizationSize];
  if (v4 != 0.0 && v3 != 0.0) {
    return a2 / v3;
  }
  return a2;
}

- (void)appendPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  [(CRNormalizedPolyline *)self normalizationSize];
  [(CRImageSpacePolyline *)(uint64_t)v6 appendPoint:y * v8];

  CFTypeRef cf = 0;
  [(CRNormalizedPolyline *)self set_pathRef:&cf];
  if (cf) {
    CFRelease(cf);
  }
}

- (void)appendPolyline:(id)a3
{
  id v4 = a3;
  double v5 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  double v6 = [v4 denormalizedPolyline];
  -[CRImageSpacePolyline appendPolyline:]((uint64_t)v5, v6);

  CFTypeRef cf = 0;
  [(CRNormalizedPolyline *)self set_pathRef:&cf];
  if (cf) {
    CFRelease(cf);
  }
}

- (id)simplified
{
  double v3 = [CRNormalizedPolyline alloc];
  id v4 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  double v5 = [v4 simplified];
  [(CRNormalizedPolyline *)self normalizationSize];
  double v6 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](v3, "initWithDenormalizedPolyline:size:", v5);

  return v6;
}

- (id)rotated180
{
  double v3 = [CRNormalizedPolyline alloc];
  id v4 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  double v5 = [v4 rotated180];
  [(CRNormalizedPolyline *)self normalizationSize];
  double v6 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](v3, "initWithDenormalizedPolyline:size:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRNormalizedPolyline *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(CRNormalizedPolyline *)self normalizationSize];
      double v7 = v6;
      double v9 = v8;
      [(CRNormalizedPolyline *)v5 normalizationSize];
      char v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        double v13 = [(CRNormalizedPolyline *)self denormalizedPolyline];
        double v14 = [(CRNormalizedPolyline *)v5 denormalizedPolyline];
        char v11 = [v13 isEqual:v14];
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRNormalizedPolyline allocWithZone:a3];
  double v5 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  double v6 = (void *)[v5 copy];
  [(CRNormalizedPolyline *)self normalizationSize];
  double v7 = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](v4, "initWithDenormalizedPolyline:size:", v6);

  return v7;
}

- (id)crCodableDataRepresentation
{
  double v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:1 toData:v3];
  id v4 = [(CRNormalizedPolyline *)self denormalizedPolyline];
  +[CRCodingUtilities appendCodable:v4 toData:v3];

  [(CRNormalizedPolyline *)self normalizationSize];
  +[CRCodingUtilities appendSize:toData:](CRCodingUtilities, "appendSize:toData:", v3);
  return v3;
}

- (CRNormalizedPolyline)initWithCRCodableDataRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:v4 offset:&v10] == 1)
  {
    double v5 = [CRImageSpacePolyline alloc];
    double v6 = +[CRCodingUtilities objectDataFromEncodingData:v4 offset:&v10];
    double v7 = [(CRImageSpacePolyline *)v5 initWithCRCodableDataRepresentation:v6];

    +[CRCodingUtilities sizeFromEncodingData:v4 offset:&v10];
    self = -[CRNormalizedPolyline initWithDenormalizedPolyline:size:](self, "initWithDenormalizedPolyline:size:", v7);

    double v8 = self;
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (CGSize)normalizationSize
{
  objc_copyStruct(v4, &self->_normalizationSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setNormalizationSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_normalizationSize, &v3, 16, 1, 0);
}

- (CRImageSpacePolyline)denormalizedPolyline
{
  return (CRImageSpacePolyline *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDenormalizedPolyline:(id)a3
{
}

- (ObjectRef<const)_pathRef
{
  objc_copyCppObjectAtomic(v2, &self->__pathRef, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__127);
  return v3;
}

- (void)set_pathRef:(ObjectRef<const CGPath *>)a3
{
}

- (void).cxx_destruct
{
  mCFObject = self->__pathRef.mCFObject;
  if (mCFObject) {
    CFRelease(mCFObject);
  }
  objc_storeStrong((id *)&self->_denormalizedPolyline, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end