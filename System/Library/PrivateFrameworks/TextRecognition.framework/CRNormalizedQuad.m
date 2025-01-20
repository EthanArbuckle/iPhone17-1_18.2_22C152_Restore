@interface CRNormalizedQuad
+ (BOOL)supportsSecureCoding;
- (BOOL)containsDenormalizedPoint:(CGPoint)a3;
- (BOOL)containsNormalizedPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)overlapsDenormalizedQuad:(id)a3;
- (BOOL)overlapsNormalizedQuad:(id)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)midPoint;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (CGSize)normalizationSize;
- (CGSize)size;
- (CRImageSpaceQuad)denormalizedQuad;
- (CRNormalizedQuad)initWithCRCodableDataRepresentation:(id)a3;
- (CRNormalizedQuad)initWithCoder:(id)a3;
- (CRNormalizedQuad)initWithDenormalizedQuad:(id)a3 size:(CGSize)a4;
- (CRNormalizedQuad)initWithNormalizedBoundingBox:(CGRect)a3 size:(CGSize)a4;
- (CRNormalizedQuad)initWithNormalizedTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 size:(CGSize)a7;
- (NSString)description;
- (double)area;
- (double)aspectRatio;
- (double)baselineAngle;
- (double)boundingBoxClippedIOUWithQuad:(id)a3;
- (double)boundingBoxIOUWithQuad:(id)a3;
- (double)shortestDistanceFromDenormalizedPoint:(CGPoint)a3;
- (double)shortestDistanceFromNormalizedPoint:(CGPoint)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crCodableDataRepresentation;
- (id)rotated180;
- (id)rotatedAroundDenormalizedPoint:(CGPoint)a3 angle:(float)a4;
- (id)rotatedAroundNormalizedPoint:(CGPoint)a3 angle:(float)a4;
- (id)scaledBy:(CGPoint)a3 normalizedOffset:(CGPoint)a4;
- (id)unionWithNormalizedQuad:(id)a3 baselineAngle:(float)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRNormalizedQuad

- (double)boundingBoxIOUWithQuad:(id)a3
{
  id v4 = a3;
  [(CRNormalizedQuad *)self boundingBox];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 boundingBox];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.double width = v10;
  v24.size.double height = v12;
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  CGRect v25 = CGRectUnion(v24, v27);
  double height = v25.size.height;
  double width = v25.size.width;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.double width = v10;
  v25.size.double height = v12;
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  CGRect v26 = CGRectIntersection(v25, v28);
  return v26.size.width * v26.size.height / (width * height + 1.0e-23);
}

- (double)boundingBoxClippedIOUWithQuad:(id)a3
{
  id v4 = a3;
  [(CRNormalizedQuad *)self boundingBox];
  v34.origin.CGFloat x = v5;
  v34.origin.CGFloat y = v6;
  v34.size.CGFloat width = v7;
  v34.size.CGFloat height = v8;
  v28.origin.CGFloat x = 0.0;
  v28.origin.CGFloat y = 0.0;
  v28.size.CGFloat width = 1.0;
  v28.size.CGFloat height = 1.0;
  CGRect v29 = CGRectIntersection(v28, v34);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  [v4 boundingBox];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v30.origin.CGFloat x = 0.0;
  v30.origin.CGFloat y = 0.0;
  v30.size.CGFloat width = 1.0;
  v30.size.CGFloat height = 1.0;
  v35.origin.CGFloat x = v14;
  v35.origin.CGFloat y = v16;
  v35.size.CGFloat width = v18;
  v35.size.CGFloat height = v20;
  CGRect v31 = CGRectIntersection(v30, v35);
  CGFloat v21 = v31.origin.x;
  CGFloat v22 = v31.origin.y;
  CGFloat v23 = v31.size.width;
  CGFloat v24 = v31.size.height;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  v36.origin.CGFloat x = v21;
  v36.origin.CGFloat y = v22;
  v36.size.CGFloat width = v23;
  v36.size.CGFloat height = v24;
  CGRect v32 = CGRectUnion(v31, v36);
  double v26 = v32.size.height;
  double v27 = v32.size.width;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  v37.origin.CGFloat x = v21;
  v37.origin.CGFloat y = v22;
  v37.size.CGFloat width = v23;
  v37.size.CGFloat height = v24;
  CGRect v33 = CGRectIntersection(v32, v37);
  return v33.size.width * v33.size.height / (v27 * v26 + 1.0e-23);
}

- (CRNormalizedQuad)initWithNormalizedTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 size:(CGSize)a7
{
  CGFloat v8 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", a3.x * v11, a3.y * v12, a4.x * v11, a4.y * v12, a5.x * v11, a5.y * v12, a6.x * v11, a6.y * v12);
  double v9 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](self, "initWithDenormalizedQuad:size:", v8, v11, v12);

  return v9;
}

- (CRNormalizedQuad)initWithNormalizedBoundingBox:(CGRect)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v7 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", a3.origin.x * width, a3.origin.y * height, a3.size.width * width, a3.size.height * height);
  CGFloat v8 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](self, "initWithDenormalizedQuad:size:", v7, width, height);

  return v8;
}

- (CRNormalizedQuad)initWithDenormalizedQuad:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRNormalizedQuad;
  double v9 = [(CRNormalizedQuad *)&v12 init];
  CGFloat v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_denormalizedQuad, a3);
    v10->_normalizationSize.CGFloat width = width;
    v10->_normalizationSize.CGFloat height = height;
  }

  return v10;
}

- (CGPoint)topLeft
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad topLeft];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
    }
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)topRight
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad topRight];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
    }
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)bottomRight
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad bottomRight];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
    }
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)bottomLeft
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad bottomLeft];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
    }
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)midPoint
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad midPoint];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
    }
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGRect)boundingBox
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad boundingBox];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
      double v5 = v5 / width;
      double v6 = v6 / height;
    }
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGSize)size
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad size];
  double height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    double width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      double v3 = v3 / width;
      double v4 = v4 / height;
    }
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)aspectRatio
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad aspectRatio];
  return result;
}

- (double)baselineAngle
{
  [(CRImageSpaceQuad *)self->_denormalizedQuad baselineAngle];
  return result;
}

- (BOOL)containsDenormalizedPoint:(CGPoint)a3
{
  return -[CRImageSpaceQuad containsPoint:](self->_denormalizedQuad, "containsPoint:", a3.x, a3.y);
}

- (id)rotated180
{
  id v3 = objc_alloc((Class)objc_opt_class());
  double v4 = [(CRImageSpaceQuad *)self->_denormalizedQuad rotated180];
  double v5 = objc_msgSend(v3, "initWithDenormalizedQuad:size:", v4, self->_normalizationSize.width, self->_normalizationSize.height);

  return v5;
}

- (BOOL)containsNormalizedPoint:(CGPoint)a3
{
  return -[CRNormalizedQuad containsDenormalizedPoint:](self, "containsDenormalizedPoint:", a3.x * self->_normalizationSize.width, a3.y * self->_normalizationSize.height);
}

- (BOOL)overlapsDenormalizedQuad:(id)a3
{
  return [(CRImageSpaceQuad *)self->_denormalizedQuad overlapsQuad:a3];
}

- (BOOL)overlapsNormalizedQuad:(id)a3
{
  double v4 = [a3 denormalizedQuad];
  LOBYTE(self) = [(CRNormalizedQuad *)self overlapsDenormalizedQuad:v4];

  return (char)self;
}

- (double)shortestDistanceFromDenormalizedPoint:(CGPoint)a3
{
  -[CRImageSpaceQuad shortestDistanceFromPoint:](self->_denormalizedQuad, "shortestDistanceFromPoint:", a3.x, a3.y);
  return result;
}

- (double)shortestDistanceFromNormalizedPoint:(CGPoint)a3
{
  -[CRNormalizedQuad shortestDistanceFromDenormalizedPoint:](self, "shortestDistanceFromDenormalizedPoint:", a3.x * self->_normalizationSize.width, a3.y * self->_normalizationSize.height);
  return result;
}

- (id)rotatedAroundDenormalizedPoint:(CGPoint)a3 angle:(float)a4
{
  double v5 = [(CRImageSpaceQuad *)self->_denormalizedQuad rotatedAroundPoint:a3.x angle:a3.y];
  double v6 = objc_msgSend(v5, "normalizedQuadForImageSize:", self->_normalizationSize.width, self->_normalizationSize.height);

  return v6;
}

- (id)rotatedAroundNormalizedPoint:(CGPoint)a3 angle:(float)a4
{
  return [(CRNormalizedQuad *)self rotatedAroundDenormalizedPoint:a3.x * self->_normalizationSize.width angle:a3.y * self->_normalizationSize.height];
}

- (id)scaledBy:(CGPoint)a3 normalizedOffset:(CGPoint)a4
{
  double v5 = -[CRImageSpaceQuad scaledBy:offset:](self->_denormalizedQuad, "scaledBy:offset:", a3.x, a3.y, a4.x * self->_normalizationSize.width, a4.y * self->_normalizationSize.height);
  double v6 = objc_msgSend(v5, "normalizedQuadForImageSize:", self->_normalizationSize.width, self->_normalizationSize.height);

  return v6;
}

- (id)unionWithNormalizedQuad:(id)a3 baselineAngle:(float)a4
{
  denormalizedQuad = self->_denormalizedQuad;
  CGFloat v7 = [a3 denormalizedQuad];
  *(float *)&double v8 = a4;
  double v9 = [(CRImageSpaceQuad *)denormalizedQuad unionWithQuad:v7 baselineAngle:v8];
  CGFloat v10 = objc_msgSend(v9, "normalizedQuadForImageSize:", self->_normalizationSize.width, self->_normalizationSize.height);

  return v10;
}

- (NSString)description
{
  id v3 = NSString;
  double v4 = NSStringFromSize(self->_normalizationSize);
  double v5 = [v3 stringWithFormat:@"Size: %@ | Quad: %@", v4, self->_denormalizedQuad];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CRNormalizedQuad *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(CRNormalizedQuad *)v5 normalizationSize];
      if (self->_normalizationSize.width == v7 && self->_normalizationSize.height == v6)
      {
        denormalizedQuad = self->_denormalizedQuad;
        double v11 = [(CRNormalizedQuad *)v5 denormalizedQuad];
        char v9 = [(CRImageSpaceQuad *)denormalizedQuad isEqual:v11];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRNormalizedQuad)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRQuadData"];
  int64_t v6 = [v4 decodeIntegerForKey:@"CRQuadUncompressedDataSize"];

  double v7 = uncompressDataOfSize(v5, v6);
  double v8 = [(CRNormalizedQuad *)self initWithCRCodableDataRepresentation:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(CRNormalizedQuad *)self crCodableDataRepresentation];
  double v5 = compressData(v6);
  [v4 encodeObject:v5 forKey:@"CRQuadData"];
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), @"CRQuadUncompressedDataSize");
}

- (id)crCodableDataRepresentation
{
  id v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:1 toData:v3];
  +[CRCodingUtilities appendCodable:self->_denormalizedQuad toData:v3];
  +[CRCodingUtilities appendSize:toData:](CRCodingUtilities, "appendSize:toData:", v3, self->_normalizationSize.width, self->_normalizationSize.height);
  return v3;
}

- (CRNormalizedQuad)initWithCRCodableDataRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:v4 offset:&v10] == 1)
  {
    double v5 = [CRImageSpaceQuad alloc];
    id v6 = +[CRCodingUtilities objectDataFromEncodingData:v4 offset:&v10];
    double v7 = [(CRImageSpaceQuad *)v5 initWithCRCodableDataRepresentation:v6];

    +[CRCodingUtilities sizeFromEncodingData:v4 offset:&v10];
    self = -[CRNormalizedQuad initWithDenormalizedQuad:size:](self, "initWithDenormalizedQuad:size:", v7);

    double v8 = self;
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CRNormalizedQuad allocWithZone:a3];
  double v5 = (void *)[(CRImageSpaceQuad *)self->_denormalizedQuad copy];
  id v6 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v4, "initWithDenormalizedQuad:size:", v5, self->_normalizationSize.width, self->_normalizationSize.height);

  return v6;
}

- (double)area
{
  [(CRNormalizedQuad *)self topRight];
  double v4 = v3;
  [(CRNormalizedQuad *)self topLeft];
  double v6 = v4 - v5;
  [(CRNormalizedQuad *)self topRight];
  double v8 = v7;
  [(CRNormalizedQuad *)self topLeft];
  double v10 = v8 - v9;
  [(CRNormalizedQuad *)self bottomLeft];
  double v12 = v11;
  [(CRNormalizedQuad *)self topLeft];
  double v14 = v12 - v13;
  [(CRNormalizedQuad *)self bottomLeft];
  double v16 = v15;
  [(CRNormalizedQuad *)self topLeft];
  double v18 = fabs(v6 * (v16 - v17) - v10 * v14) * 0.5;
  [(CRNormalizedQuad *)self topRight];
  double v20 = v19;
  [(CRNormalizedQuad *)self bottomRight];
  double v22 = v20 - v21;
  [(CRNormalizedQuad *)self topRight];
  double v24 = v23;
  [(CRNormalizedQuad *)self bottomRight];
  double v26 = v24 - v25;
  [(CRNormalizedQuad *)self bottomLeft];
  double v28 = v27;
  [(CRNormalizedQuad *)self bottomRight];
  double v30 = v28 - v29;
  [(CRNormalizedQuad *)self bottomLeft];
  double v32 = v31;
  [(CRNormalizedQuad *)self bottomRight];
  return v18 + fabs(v22 * (v32 - v33) - v26 * v30) * 0.5;
}

- (CRImageSpaceQuad)denormalizedQuad
{
  return self->_denormalizedQuad;
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

- (void).cxx_destruct
{
}

@end