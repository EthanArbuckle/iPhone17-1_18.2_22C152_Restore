@interface IMOrientationConfigurationPredicate
+ (id)landscapePredicate;
+ (id)portraitPredicate;
- (BOOL)evaluateWithContext:(id)a3;
- (IMOrientationConfigurationPredicate)initWithType:(unint64_t)a3;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation IMOrientationConfigurationPredicate

+ (id)portraitPredicate
{
  id v2 = [objc_alloc((Class)a1) initWithType:0];

  return v2;
}

+ (id)landscapePredicate
{
  id v2 = [objc_alloc((Class)a1) initWithType:1];

  return v2;
}

- (IMOrientationConfigurationPredicate)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMOrientationConfigurationPredicate;
  result = [(IMConfigurationPredicate *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (BOOL)evaluateWithContext:(id)a3
{
  [a3 im_frameEnvironmentBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  unint64_t v12 = [(IMOrientationConfigurationPredicate *)self type];
  if (v12 == 1)
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    double Width = CGRectGetWidth(v18);
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    double Height = CGRectGetHeight(v19);
    return Width > Height;
  }
  if (!v12)
  {
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    double Width = CGRectGetHeight(v16);
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    double Height = CGRectGetWidth(v17);
    return Width > Height;
  }
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end