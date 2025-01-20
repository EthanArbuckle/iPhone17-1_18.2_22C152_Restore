@interface UIInputViewSetPlacementUndocked
+ (BOOL)supportsSecureCoding;
+ (CGPoint)computeOffsetForOffset:(CGPoint)a3 withSize:(CGSize)a4 chromeBuffer:(UIEdgeInsets)a5 onScreenSize:(CGSize)a6;
+ (id)infoWithPoint:(CGPoint)a3;
+ (id)placementWithUndockedOffset:(CGPoint)a3 chromeBuffer:(UIEdgeInsets)a4;
- (BOOL)inputViewWillAppear;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUndocked;
- (CGPoint)normalizedOffset;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
- (UIEdgeInsets)chromeBuffer;
- (UIInputViewSetPlacementUndocked)initWithCoder:(id)a3;
- (double)heightOfInputViews:(id)a3;
- (id)applicatorInfoForOwner:(id)a3;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setChromeBuffer:(UIEdgeInsets)a3;
- (void)setNormalizedOffset:(CGPoint)a3;
- (void)setOffset:(CGPoint)a3;
@end

@implementation UIInputViewSetPlacementUndocked

+ (id)infoWithPoint:(CGPoint)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"Origin";
  v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", a3.x, a3.y);
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)applicatorInfoForOwner:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  v24.receiver = self;
  v24.super_class = (Class)UIInputViewSetPlacementUndocked;
  id v5 = a3;
  v6 = [(UIInputViewSetPlacement *)&v24 applicatorInfoForOwner:v5];
  v7 = [v4 dictionaryWithDictionary:v6];

  v8 = [v5 inputViewSet];
  [(UIInputViewSetPlacementUndocked *)self heightOfInputViews:v8];
  double v10 = v9;

  v11 = [v5 containerView];

  [v11 bounds];
  double v13 = v12;

  double v14 = 0.0;
  if (v13 != 0.0)
  {
    [(UIInputViewSetPlacementUndocked *)self chromeBuffer];
    double v16 = v10 + v15;
    [(UIInputViewSetPlacement *)self extendedHeight];
    *(float *)&double v17 = v17 + v16;
    float v18 = v13;
    double v14 = fminf(*(float *)&v17, v18) / v13;
  }
  [(UIInputViewSetPlacementUndocked *)self normalizedOffset];
  double v20 = 1.0 - v14;
  if (v19 < 1.0 - v14) {
    double v20 = v19;
  }
  v23[0] = 0;
  *(double *)&v23[1] = -(v20 * v13);
  v21 = [MEMORY[0x1E4F29238] valueWithBytes:v23 objCType:"{CGPoint=dd}"];
  [v7 setValue:v21 forKey:@"Origin"];

  return v7;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placementWithUndockedOffset:(CGPoint)a3 chromeBuffer:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double y = a3.y;
  double x = a3.x;
  id v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setChromeBuffer:", top, left, bottom, right);
  objc_msgSend(v10, "setOffset:", x, y);
  return v10;
}

- (UIInputViewSetPlacementUndocked)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIInputViewSetPlacementUndocked;
  id v5 = [(UIInputViewSetPlacement *)&v17 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    p_normalizedOffset = &v5->_normalizedOffset;
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Offset"];
    [v8 CGPointValue];
    *(void *)&p_normalizedOffset->double x = v9;
    v6->_normalizedOffset.double y = v10;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Chrome"];
    [v11 UIEdgeInsetsValue];
    v6->_chromeBuffer.double top = v12;
    v6->_chromeBuffer.double left = v13;
    v6->_chromeBuffer.double bottom = v14;
    v6->_chromeBuffer.double right = v15;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementUndocked;
  id v4 = a3;
  [(UIInputViewSetPlacement *)&v7 encodeWithCoder:v4];
  id v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_normalizedOffset.x, self->_normalizedOffset.y, v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"Offset"];

  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", self->_chromeBuffer.top, self->_chromeBuffer.left, self->_chromeBuffer.bottom, self->_chromeBuffer.right);
  [v4 encodeObject:v6 forKey:@"Chrome"];
}

- (void)setOffset:(CGPoint)a3
{
  double v3 = fmax(fabs(a3.x), 0.0);
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  double v4 = fmax(fabs(a3.y), 0.0);
  if (v4 > 1.0) {
    double v4 = 1.0;
  }
  -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v3, v4);
}

+ (CGPoint)computeOffsetForOffset:(CGPoint)a3 withSize:(CGSize)a4 chromeBuffer:(UIEdgeInsets)a5 onScreenSize:(CGSize)a6
{
  double v6 = 0.0;
  if (v12 != 0.0)
  {
    float v7 = a4.height + a5.top;
    float v8 = v12;
    double v6 = fminf(v7, v8) / v12;
  }
  double v9 = 1.0 - v6;
  if (a3.y >= v9) {
    a3.double y = v9;
  }
  double v10 = -(a3.y * v12);
  double v11 = 0.0;
  result.double y = v10;
  result.double x = v11;
  return result;
}

- (double)heightOfInputViews:(id)a3
{
  id v3 = a3;
  [v3 inputViewBounds];
  double v5 = v4;
  [v3 inputAssistantViewBounds];
  double v7 = v5 + v6;
  [v3 inputAccessoryViewBounds];
  double v9 = v8;

  return v7 + v9;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8 = a5;
  if (a4)
  {
    id v9 = a4;
    [(UIInputViewSetPlacementUndocked *)self heightOfInputViews:a3];
    double v11 = v10;
    [v8 bounds];
    double v13 = v12;
    double v14 = 0.0;
    if (v12 != 0.0)
    {
      [(UIInputViewSetPlacementUndocked *)self chromeBuffer];
      double v16 = v11 + v15;
      [(UIInputViewSetPlacement *)self extendedHeight];
      *(float *)&double v17 = v17 + v16;
      float v18 = v13;
      double v14 = fminf(*(float *)&v17, v18) / v13;
    }
    [(UIInputViewSetPlacementUndocked *)self normalizedOffset];
    double v20 = 1.0 - v14;
    if (v19 < 1.0 - v14) {
      double v20 = v19;
    }
    v21 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:-(v20 * v13)];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIInputViewSetPlacementUndocked;
  if ([(UIInputViewSetPlacement *)&v13 isEqual:v4])
  {
    [(UIInputViewSetPlacementUndocked *)self normalizedOffset];
    double v6 = v5;
    double v8 = v7;
    [v4 normalizedOffset];
    BOOL v11 = v8 == v10 && v6 == v9;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)inputViewWillAppear
{
  return 1;
}

- (BOOL)isUndocked
{
  return 1;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementUndocked;
  [(UIInputViewSetPlacement *)&v8 remoteIntrinsicContentSizeForInputViewInSet:a3 includingIAV:a4];
  double v7 = 1.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v7;
  result.origin.double x = v4;
  return result;
}

- (UIEdgeInsets)chromeBuffer
{
  double top = self->_chromeBuffer.top;
  double left = self->_chromeBuffer.left;
  double bottom = self->_chromeBuffer.bottom;
  double right = self->_chromeBuffer.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setChromeBuffer:(UIEdgeInsets)a3
{
  self->_chromeBuffer = a3;
}

- (CGPoint)normalizedOffset
{
  double x = self->_normalizedOffset.x;
  double y = self->_normalizedOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNormalizedOffset:(CGPoint)a3
{
  self->_normalizedOffset = a3;
}

@end