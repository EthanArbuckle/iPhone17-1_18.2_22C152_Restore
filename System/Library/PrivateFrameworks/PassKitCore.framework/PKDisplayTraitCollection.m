@interface PKDisplayTraitCollection
+ (BOOL)supportsSecureCoding;
- (CGSize)canvasSize;
- (PKDisplayTraitCollection)init;
- (PKDisplayTraitCollection)initWithCoder:(id)a3;
- (PKDisplayTraitCollection)initWithDefaultTraits;
- (double)canvasScale;
- (void)encodeWithCoder:(id)a3;
- (void)setCanvasScale:(double)a3;
- (void)setCanvasSize:(CGSize)a3;
@end

@implementation PKDisplayTraitCollection

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (void)setCanvasScale:(double)a3
{
  self->_canvasScale = a3;
}

- (PKDisplayTraitCollection)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKDisplayTraitCollection;
  return [(PKDisplayTraitCollection *)&v3 init];
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)canvasScale
{
  return self->_canvasScale;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDisplayTraitCollection)initWithDefaultTraits
{
  v2 = [(PKDisplayTraitCollection *)self init];
  if (v2)
  {
    v2->_canvasSize.double width = PKScreenSize();
    v2->_canvasSize.double height = v3;
    v2->_canvasScale = PKScreenScale();
  }
  return v2;
}

- (PKDisplayTraitCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKDisplayTraitCollection *)self init];
  if (v5)
  {
    [v4 decodeSizeForKey:@"size"];
    v5->_canvasSize.double width = v6;
    v5->_canvasSize.double height = v7;
    [v4 decodeDoubleForKey:@"scale"];
    v5->_canvasScale = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  id v6 = a3;
  objc_msgSend(v6, "encodeSize:forKey:", @"size", width, height);
  [v6 encodeDouble:@"scale" forKey:self->_canvasScale];
}

@end