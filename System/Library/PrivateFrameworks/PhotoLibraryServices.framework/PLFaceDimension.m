@interface PLFaceDimension
- (BOOL)photosFaceRepresentationHasSmile;
- (BOOL)photosFaceRepresentationIsLeftEyeClosed;
- (BOOL)photosFaceRepresentationIsRightEyeClosed;
- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 bodyCenterX:(double)a5 bodyCenterY:(double)a6 bodyWidth:(double)a7 bodyHeight:(double)a8;
- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 centerX:(double)a5 centerY:(double)a6 size:(double)a7;
- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 centerX:(double)a5 centerY:(double)a6 size:(double)a7 bodyCenterX:(double)a8 bodyCenterY:(double)a9 bodyWidth:(double)a10 bodyHeight:(double)a11;
- (double)photosFaceRepresentationBlurScore;
- (double)photosFaceRepresentationBodyCenterX;
- (double)photosFaceRepresentationBodyCenterY;
- (double)photosFaceRepresentationBodyHeight;
- (double)photosFaceRepresentationBodyWidth;
- (double)photosFaceRepresentationCenterX;
- (double)photosFaceRepresentationCenterY;
- (double)photosFaceRepresentationQuality;
- (double)photosFaceRepresentationRoll;
- (double)photosFaceRepresentationSize;
- (id)description;
- (id)photosFaceRepresentationLocalIdentifier;
- (int64_t)photosFaceRepresentationClusterSequenceNumber;
- (int64_t)photosFaceRepresentationQualityMeasure;
- (int64_t)photosFaceRepresentationSourceHeight;
- (int64_t)photosFaceRepresentationSourceWidth;
@end

@implementation PLFaceDimension

- (double)photosFaceRepresentationQuality
{
  return -1.0;
}

- (double)photosFaceRepresentationRoll
{
  return 0.0;
}

- (id)photosFaceRepresentationLocalIdentifier
{
  return 0;
}

- (int64_t)photosFaceRepresentationClusterSequenceNumber
{
  return 0;
}

- (int64_t)photosFaceRepresentationQualityMeasure
{
  return 0;
}

- (BOOL)photosFaceRepresentationIsRightEyeClosed
{
  return 0;
}

- (BOOL)photosFaceRepresentationIsLeftEyeClosed
{
  return 0;
}

- (BOOL)photosFaceRepresentationHasSmile
{
  return 0;
}

- (double)photosFaceRepresentationBlurScore
{
  return 0.0;
}

- (double)photosFaceRepresentationBodyWidth
{
  return self->_bodyWidth;
}

- (double)photosFaceRepresentationBodyHeight
{
  return self->_bodyHeight;
}

- (double)photosFaceRepresentationBodyCenterY
{
  return self->_bodyCenterY;
}

- (double)photosFaceRepresentationBodyCenterX
{
  return self->_bodyCenterX;
}

- (double)photosFaceRepresentationSize
{
  return self->_size;
}

- (double)photosFaceRepresentationCenterY
{
  return self->_centerY;
}

- (double)photosFaceRepresentationCenterX
{
  return self->_centerX;
}

- (int64_t)photosFaceRepresentationSourceHeight
{
  return self->_sourceHeight;
}

- (int64_t)photosFaceRepresentationSourceWidth
{
  return self->_sourceWidth;
}

- (id)description
{
  if (self->_centerX == 0.0)
  {
    double bodyCenterX = self->_bodyCenterX;
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v5 = (void *)v9;
    if (bodyCenterX == 0.0) {
      [v7 stringWithFormat:@"<%@: %p> zero", v9, self, v12, v13, v14, v15, v16, v17];
    }
    else {
      [v7 stringWithFormat:@"<%@: %p> body center: (%f, %f), body size: (%f, %f), width: %ld, height: %ld", v9, self, *(void *)&self->_bodyCenterX, *(void *)&self->_bodyCenterY, *(void *)&self->_bodyWidth, *(void *)&self->_bodyHeight, self->_sourceWidth, self->_sourceHeight];
    }
  }
  else
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [v3 stringWithFormat:@"<%@: %p> center: (%f, %f), size: %f, width: %ld, height: %ld", v5, self, *(void *)&self->_centerX, *(void *)&self->_centerY, *(void *)&self->_size, self->_sourceWidth, self->_sourceHeight, v17];
  v10 = };

  return v10;
}

- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 centerX:(double)a5 centerY:(double)a6 size:(double)a7 bodyCenterX:(double)a8 bodyCenterY:(double)a9 bodyWidth:(double)a10 bodyHeight:(double)a11
{
  v21.receiver = self;
  v21.super_class = (Class)PLFaceDimension;
  result = [(PLFaceDimension *)&v21 init];
  if (result)
  {
    result->_sourceWidth = a3;
    result->_sourceHeight = a4;
    result->_centerX = a5;
    result->_centerY = a6;
    result->_size = a7;
    result->_double bodyCenterX = a8;
    result->_bodyCenterY = a9;
    result->_bodyWidth = a10;
    result->_bodyHeight = a11;
  }
  return result;
}

- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 bodyCenterX:(double)a5 bodyCenterY:(double)a6 bodyWidth:(double)a7 bodyHeight:(double)a8
{
  return [(PLFaceDimension *)self initWithSourceWidth:a3 sourceHeight:a4 centerX:0.0 centerY:0.0 size:0.0 bodyCenterX:a5 bodyCenterY:a6 bodyWidth:a7 bodyHeight:a8];
}

- (PLFaceDimension)initWithSourceWidth:(int64_t)a3 sourceHeight:(int64_t)a4 centerX:(double)a5 centerY:(double)a6 size:(double)a7
{
  return [(PLFaceDimension *)self initWithSourceWidth:a3 sourceHeight:a4 centerX:a5 centerY:a6 size:a7 bodyCenterX:0.0 bodyCenterY:0.0 bodyWidth:0.0 bodyHeight:0.0];
}

@end