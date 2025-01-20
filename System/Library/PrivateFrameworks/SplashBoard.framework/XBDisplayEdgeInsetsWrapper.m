@interface XBDisplayEdgeInsetsWrapper
+ (BOOL)supportsSecureCoding;
+ (id)makeWithEdgeInsets:(UIEdgeInsets)a3;
- (BOOL)hasZeroInsets;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (UIEdgeInsets)edgeInsets;
- (XBDisplayEdgeInsetsWrapper)initWithCoder:(id)a3;
- (XBDisplayEdgeInsetsWrapper)initWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6;
- (XBDisplayEdgeInsetsWrapper)initWithXPCDictionary:(id)a3;
- (double)bottomInset;
- (double)leftInset;
- (double)rightInset;
- (double)topInset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation XBDisplayEdgeInsetsWrapper

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"XBApplicationLaunchCompatibilityInfo.m", 1035, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
  }
  id v10 = [NSString stringWithUTF8String:"topInset"];
  [(XBDisplayEdgeInsetsWrapper *)self topInset];
  objc_msgSend(v5, "encodeDouble:forKey:", v10);
  v6 = [NSString stringWithUTF8String:"leftInset"];
  [(XBDisplayEdgeInsetsWrapper *)self leftInset];
  objc_msgSend(v5, "encodeDouble:forKey:", v6);
  v7 = [NSString stringWithUTF8String:"bottomInset"];
  [(XBDisplayEdgeInsetsWrapper *)self bottomInset];
  objc_msgSend(v5, "encodeDouble:forKey:", v7);
  v8 = [NSString stringWithUTF8String:"rightInset"];
  [(XBDisplayEdgeInsetsWrapper *)self rightInset];
  objc_msgSend(v5, "encodeDouble:forKey:", v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    id v7 = v4;
    [v7 topInset];
    [(XBDisplayEdgeInsetsWrapper *)self topInset];
    if (BSFloatEqualToFloat()
      && ([v7 leftInset],
          [(XBDisplayEdgeInsetsWrapper *)self leftInset],
          BSFloatEqualToFloat())
      && ([v7 bottomInset],
          [(XBDisplayEdgeInsetsWrapper *)self bottomInset],
          BSFloatEqualToFloat()))
    {
      [v7 rightInset];
      [(XBDisplayEdgeInsetsWrapper *)self rightInset];
      char v6 = BSFloatEqualToFloat();
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XBDisplayEdgeInsetsWrapper)initWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)XBDisplayEdgeInsetsWrapper;
  result = [(XBDisplayEdgeInsetsWrapper *)&v11 init];
  if (result)
  {
    result->_topInset = a3;
    result->_leftInset = a4;
    result->_bottomInset = a5;
    result->_rightInset = a6;
  }
  return result;
}

+ (id)makeWithEdgeInsets:(UIEdgeInsets)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithTop:a3.top left:a3.left bottom:a3.bottom right:a3.right];
  return v3;
}

- (BOOL)hasZeroInsets
{
  [(XBDisplayEdgeInsetsWrapper *)self topInset];
  if (!BSFloatIsZero()) {
    return 0;
  }
  [(XBDisplayEdgeInsetsWrapper *)self leftInset];
  if (!BSFloatIsZero()) {
    return 0;
  }
  [(XBDisplayEdgeInsetsWrapper *)self bottomInset];
  if (!BSFloatIsZero()) {
    return 0;
  }
  [(XBDisplayEdgeInsetsWrapper *)self rightInset];
  return BSFloatIsZero();
}

- (NSString)description
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  [(XBDisplayEdgeInsetsWrapper *)self topInset];
  id v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"topInset", 1);
  [(XBDisplayEdgeInsetsWrapper *)self leftInset];
  id v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"leftInset", 1);
  [(XBDisplayEdgeInsetsWrapper *)self bottomInset];
  id v6 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"bottomInset", 1);
  [(XBDisplayEdgeInsetsWrapper *)self rightInset];
  id v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"rightInset", 1);
  v8 = [v3 build];

  return (NSString *)v8;
}

- (UIEdgeInsets)edgeInsets
{
  [(XBDisplayEdgeInsetsWrapper *)self topInset];
  double v4 = v3;
  [(XBDisplayEdgeInsetsWrapper *)self leftInset];
  double v6 = v5;
  [(XBDisplayEdgeInsetsWrapper *)self bottomInset];
  double v8 = v7;
  [(XBDisplayEdgeInsetsWrapper *)self rightInset];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[XBDisplayEdgeInsetsWrapper allocWithZone:a3];
  double topInset = self->_topInset;
  double leftInset = self->_leftInset;
  double bottomInset = self->_bottomInset;
  double rightInset = self->_rightInset;
  return [(XBDisplayEdgeInsetsWrapper *)v4 initWithTop:topInset left:leftInset bottom:bottomInset right:rightInset];
}

- (XBDisplayEdgeInsetsWrapper)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  double v5 = MEMORY[0x223CB2630]();
  double v6 = MEMORY[0x223CB2630](v4, "leftInset");
  double v7 = MEMORY[0x223CB2630](v4, "bottomInset");
  double v8 = MEMORY[0x223CB2630](v4, "rightInset");

  return [(XBDisplayEdgeInsetsWrapper *)self initWithTop:v5 left:v6 bottom:v7 right:v8];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  [(XBDisplayEdgeInsetsWrapper *)self topInset];
  MEMORY[0x223CB2770](v4, "topInset");
  [(XBDisplayEdgeInsetsWrapper *)self leftInset];
  MEMORY[0x223CB2770](v4, "leftInset");
  [(XBDisplayEdgeInsetsWrapper *)self bottomInset];
  MEMORY[0x223CB2770](v4, "bottomInset");
  [(XBDisplayEdgeInsetsWrapper *)self rightInset];
  MEMORY[0x223CB2770](v4, "rightInset");
}

- (XBDisplayEdgeInsetsWrapper)initWithCoder:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)XBDisplayEdgeInsetsWrapper;
  double v6 = [(XBDisplayEdgeInsetsWrapper *)&v20 init];
  if (v6)
  {
    if (([v5 allowsKeyedCoding] & 1) == 0)
    {
      v19 = [MEMORY[0x263F08690] currentHandler];
      [v19 handleFailureInMethod:a2, v6, @"XBApplicationLaunchCompatibilityInfo.m", 1019, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
    }
    double v7 = [NSString stringWithUTF8String:"topInset"];
    [v5 decodeDoubleForKey:v7];
    double v9 = v8;
    double v10 = [NSString stringWithUTF8String:"leftInset"];
    [v5 decodeDoubleForKey:v10];
    double v12 = v11;
    double v13 = [NSString stringWithUTF8String:"bottomInset"];
    [v5 decodeDoubleForKey:v13];
    double v15 = v14;
    v16 = [NSString stringWithUTF8String:"rightInset"];
    [v5 decodeDoubleForKey:v16];
    double v6 = [(XBDisplayEdgeInsetsWrapper *)v6 initWithTop:v9 left:v12 bottom:v15 right:v17];
  }
  return v6;
}

@end