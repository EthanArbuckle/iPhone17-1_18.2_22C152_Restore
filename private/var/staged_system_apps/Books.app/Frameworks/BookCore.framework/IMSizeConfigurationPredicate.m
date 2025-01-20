@interface IMSizeConfigurationPredicate
+ (id)predicateForDisplayClassSize:(CGSize)a3;
+ (id)predicateForExactSize:(CGSize)a3;
+ (id)predicateForHeight:(double)a3;
+ (id)predicateForLargerThan:(CGSize)a3;
+ (id)predicateForSize:(CGSize)a3;
+ (id)predicateForWidth:(double)a3;
- (BOOL)evaluateWithContext:(id)a3;
- (BOOL)evaluateWithFrameEnvironmentContext:(id)a3;
- (BOOL)exactSize;
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)isDisplayClassSize;
- (BOOL)largerThan;
- (CGSize)size;
- (IMSizeConfigurationPredicate)init;
- (IMSizeConfigurationPredicate)initWithSize:(CGSize)a3 hasWidth:(BOOL)a4 hasHeight:(BOOL)a5 exactSize:(BOOL)a6;
- (void)setExactSize:(BOOL)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setIsDisplayClassSize:(BOOL)a3;
- (void)setLargerThan:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation IMSizeConfigurationPredicate

+ (id)predicateForSize:(CGSize)a3
{
  id v3 = [objc_alloc((Class)a1) initWithSize:1 hasWidth:1 hasHeight:0 exactSize:a3.width, a3.height];

  return v3;
}

+ (id)predicateForExactSize:(CGSize)a3
{
  id v3 = [objc_alloc((Class)a1) initWithSize:1 hasWidth:1 hasHeight:1 exactSize:a3.width, a3.height];

  return v3;
}

+ (id)predicateForWidth:(double)a3
{
  id v3 = [objc_alloc((Class)a1) initWithSize:1 hasWidth:0 hasHeight:0 exactSize:a3];

  return v3;
}

+ (id)predicateForHeight:(double)a3
{
  id v3 = [objc_alloc((Class)a1) initWithSize:0 hasWidth:1 hasHeight:0 exactSize:0.0 a3];

  return v3;
}

+ (id)predicateForDisplayClassSize:(CGSize)a3
{
  id v3 = [objc_alloc((Class)a1) initWithSize:1 hasWidth:1 hasHeight:0 exactSize:a3.width, a3.height];
  [v3 setIsDisplayClassSize:1];

  return v3;
}

+ (id)predicateForLargerThan:(CGSize)a3
{
  id v3 = [objc_alloc((Class)a1) initWithSize:1 hasWidth:1 hasHeight:0 exactSize:a3.width height:a3.height];
  [v3 setLargerThan:1];

  return v3;
}

- (IMSizeConfigurationPredicate)initWithSize:(CGSize)a3 hasWidth:(BOOL)a4 hasHeight:(BOOL)a5 exactSize:(BOOL)a6
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)IMSizeConfigurationPredicate;
  v11 = [(IMConfigurationPredicate *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_size.double width = width;
    v11->_size.double height = height;
    v11->_hasWidth = a4;
    v11->_hasHeight = a5;
    v11->_exactSize = a6;
    if (a6)
    {
      uint64_t v13 = 1000000000;
LABEL_7:
      [(IMConfigurationPredicate *)v11 setScore:v13];
      return v12;
    }
    if (width > 0.0 && height > 0.0)
    {
      uint64_t v13 = (uint64_t)(1000000000.0 - width * height);
      goto LABEL_7;
    }
  }
  return v12;
}

- (IMSizeConfigurationPredicate)init
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromSelector("initWithSize:hasWidth:hasHeight:exactSize:");
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"Please use the designated initializer -[%@ %@]", v4, v5);

  return 0;
}

- (BOOL)evaluateWithContext:(id)a3
{
  return [(IMSizeConfigurationPredicate *)self evaluateWithFrameEnvironmentContext:a3];
}

- (BOOL)evaluateWithFrameEnvironmentContext:(id)a3
{
  [a3 im_frameEnvironmentBounds];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  double v8 = CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v23);
  if (![(IMSizeConfigurationPredicate *)self exactSize])
  {
    if ([(IMSizeConfigurationPredicate *)self largerThan])
    {
      [(IMSizeConfigurationPredicate *)self size];
      if (v8 > v13)
      {
        [(IMSizeConfigurationPredicate *)self size];
        return v9 > v14;
      }
      return 0;
    }
    if ([(IMSizeConfigurationPredicate *)self isDisplayClassSize])
    {
      [(IMSizeConfigurationPredicate *)self size];
      if (v8 > v9)
      {
        if (v8 <= v16) {
          return 1;
        }
        [(IMSizeConfigurationPredicate *)self size];
        BOOL v18 = v9 > v17;
        return !v18;
      }
      if (v8 <= v15) {
        return 1;
      }
    }
    else if ([(IMSizeConfigurationPredicate *)self hasHeight] {
           && [(IMSizeConfigurationPredicate *)self hasWidth])
    }
    {
      [(IMSizeConfigurationPredicate *)self size];
      if (v8 > v19) {
        return 0;
      }
    }
    else if (![(IMSizeConfigurationPredicate *)self hasHeight])
    {
      if (![(IMSizeConfigurationPredicate *)self hasWidth]) {
        return 1;
      }
      [(IMSizeConfigurationPredicate *)self size];
      BOOL v18 = v8 > v20;
      return !v18;
    }
    [(IMSizeConfigurationPredicate *)self size];
    BOOL v18 = v9 > v21;
    return !v18;
  }
  [(IMSizeConfigurationPredicate *)self size];
  if (v8 != v10 && vabdd_f64(v8, v10) >= fabs(v10 * 0.000000999999997)) {
    return 0;
  }
  [(IMSizeConfigurationPredicate *)self size];
  if (v9 == v11) {
    return 1;
  }
  return vabdd_f64(v9, v11) < fabs(v11 * 0.000000999999997);
}

- (BOOL)hasWidth
{
  return self->_hasWidth;
}

- (void)setHasWidth:(BOOL)a3
{
  self->_hasWidth = a3;
}

- (BOOL)hasHeight
{
  return self->_hasHeight;
}

- (void)setHasHeight:(BOOL)a3
{
  self->_hasHeight = a3;
}

- (BOOL)isDisplayClassSize
{
  return self->_isDisplayClassSize;
}

- (void)setIsDisplayClassSize:(BOOL)a3
{
  self->_isDisplayClassSize = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)exactSize
{
  return self->_exactSize;
}

- (void)setExactSize:(BOOL)a3
{
  self->_exactSize = a3;
}

- (BOOL)largerThan
{
  return self->_largerThan;
}

- (void)setLargerThan:(BOOL)a3
{
  self->_largerThan = a3;
}

@end