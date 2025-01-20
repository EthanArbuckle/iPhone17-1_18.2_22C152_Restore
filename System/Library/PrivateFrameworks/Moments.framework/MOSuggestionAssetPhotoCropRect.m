@interface MOSuggestionAssetPhotoCropRect
+ (BOOL)supportsSecureCoding;
- (CGRect)cgRect;
- (MOSuggestionAssetPhotoCropRect)initWithCGRect:(CGRect)a3;
- (MOSuggestionAssetPhotoCropRect)initWithCoder:(id)a3;
- (double)aspectRatio;
- (double)height;
- (double)width;
- (double)x;
- (double)y;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionAssetPhotoCropRect

- (MOSuggestionAssetPhotoCropRect)initWithCGRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)MOSuggestionAssetPhotoCropRect;
  result = [(MOSuggestionAssetPhotoCropRect *)&v8 init];
  if (result)
  {
    result->_double x = x;
    result->_double y = y;
    result->_double width = width;
    result->_double height = height;
  }
  return result;
}

- (CGRect)cgRect
{
  double x = self->_x;
  double y = self->_y;
  double width = self->_width;
  double height = self->_height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)aspectRatio
{
  double height = self->_height;
  double result = 0.0;
  if (height > 0.0) {
    return self->_width / height;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_x;
  id v5 = a3;
  [v5 encodeDouble:@"kCoderKeyPhotoCropRectX" forKey:x];
  [v5 encodeDouble:@"kCoderKeyPhotoCropRectY" forKey:self->_y];
  [v5 encodeDouble:@"kCoderKeyPhotoCropRectWidth" forKey:self->_width];
  [v5 encodeDouble:@"kCoderKeyPhotoCropRectHeight" forKey:self->_height];
}

- (MOSuggestionAssetPhotoCropRect)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOSuggestionAssetPhotoCropRect;
  id v5 = [(MOSuggestionAssetPhotoCropRect *)&v11 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"kCoderKeyPhotoCropRectX"];
    v5->_double x = v6;
    [v4 decodeDoubleForKey:@"kCoderKeyPhotoCropRectY"];
    v5->_double y = v7;
    [v4 decodeDoubleForKey:@"kCoderKeyPhotoCropRectWidth"];
    v5->_double width = v8;
    [v4 decodeDoubleForKey:@"kCoderKeyPhotoCropRectHeight"];
    v5->_double height = v9;
  }

  return v5;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

@end