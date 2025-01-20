@interface QLAppearance
+ (BOOL)supportsSecureCoding;
- (QLAppearance)initWithCoder:(id)a3;
- (QLAppearance)initWithTopInset:(double)a3 bottomInset:(double)a4 presentationMode:(unint64_t)a5 peripheryInsets:(UIEdgeInsets)a6;
- (UIEdgeInsets)peripheryInsets;
- (double)bottomInset;
- (double)topInset;
- (id)description;
- (unint64_t)presentationMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation QLAppearance

- (QLAppearance)initWithTopInset:(double)a3 bottomInset:(double)a4 presentationMode:(unint64_t)a5 peripheryInsets:(UIEdgeInsets)a6
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  v17.receiver = self;
  v17.super_class = (Class)QLAppearance;
  v13 = [(QLAppearance *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_topInset = a3;
    v13->_bottomInset = a4;
    v13->_presentationMode = a5;
    v13->_peripheryInsets.CGFloat top = top;
    v13->_peripheryInsets.CGFloat left = left;
    v13->_peripheryInsets.CGFloat bottom = bottom;
    v13->_peripheryInsets.CGFloat right = right;
    v15 = v13;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float topInset = self->_topInset;
  id v7 = a3;
  *(float *)&double v5 = topInset;
  [v7 encodeFloat:@"topInset" forKey:v5];
  double bottomInset = self->_bottomInset;
  *(float *)&double bottomInset = bottomInset;
  [v7 encodeFloat:@"bottomInset" forKey:bottomInset];
  [v7 encodeInteger:self->_presentationMode forKey:@"presentationMode"];
  objc_msgSend(v7, "encodeUIEdgeInsets:forKey:", @"peripheryInsets", self->_peripheryInsets.top, self->_peripheryInsets.left, self->_peripheryInsets.bottom, self->_peripheryInsets.right);
}

- (QLAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLAppearance;
  double v5 = [(QLAppearance *)&v14 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"topInset"];
    v5->_float topInset = v6;
    [v4 decodeFloatForKey:@"bottomInset"];
    v5->_double bottomInset = v7;
    v5->_presentationMode = [v4 decodeIntegerForKey:@"presentationMode"];
    [v4 decodeUIEdgeInsetsForKey:@"peripheryInsets"];
    v5->_peripheryInsets.CGFloat top = v8;
    v5->_peripheryInsets.CGFloat left = v9;
    v5->_peripheryInsets.CGFloat bottom = v10;
    v5->_peripheryInsets.CGFloat right = v11;
    v12 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)QLAppearance;
  id v4 = [(QLAppearance *)&v10 description];
  [(QLAppearance *)self topInset];
  uint64_t v6 = v5;
  [(QLAppearance *)self bottomInset];
  objc_msgSend(v3, "stringWithFormat:", @"%@ - topInset: %f; bottomInset: %f; presentationMode: %lu",
    v4,
    v6,
    v7,
  CGFloat v8 = [(QLAppearance *)self presentationMode]);

  return v8;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (UIEdgeInsets)peripheryInsets
{
  objc_copyStruct(v6, &self->_peripheryInsets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.CGFloat right = v5;
  result.CGFloat bottom = v4;
  result.CGFloat left = v3;
  result.CGFloat top = v2;
  return result;
}

@end