@interface TSWPLineSpacing
+ (id)lineSpacing;
- (BOOL)isEqual:(id)a3;
- (TSWPLineSpacing)init;
- (TSWPLineSpacing)initWithMode:(int)a3 amount:(double)a4;
- (TSWPLineSpacing)initWithMode:(int)a3 amount:(double)a4 baselineRule:(double)a5;
- (double)amount;
- (double)baselineRule;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)mode;
@end

@implementation TSWPLineSpacing

- (int)mode
{
  return self->_mode;
}

- (double)baselineRule
{
  return self->_baselineRule;
}

- (double)amount
{
  return self->_amount;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4) {
    LOBYTE(v4) = self->_mode == *(_DWORD *)(v4 + 8)
  }
              && self->_amount == *(double *)(v4 + 16)
              && self->_baselineRule == *(double *)(v4 + 24);
  return v4;
}

+ (id)lineSpacing
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (TSWPLineSpacing)initWithMode:(int)a3 amount:(double)a4 baselineRule:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPLineSpacing;
  result = [(TSWPLineSpacing *)&v9 init];
  if (result)
  {
    result->_mode = a3;
    result->_amount = a4;
    result->_baselineRule = a5;
  }
  return result;
}

- (TSWPLineSpacing)initWithMode:(int)a3 amount:(double)a4
{
  return [(TSWPLineSpacing *)self initWithMode:*(void *)&a3 amount:a4 baselineRule:0.800000012];
}

- (TSWPLineSpacing)init
{
  return [(TSWPLineSpacing *)self initWithMode:0 amount:1.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t mode = self->_mode;
  double amount = self->_amount;
  double baselineRule = self->_baselineRule;

  return (id)[v4 initWithMode:mode amount:amount baselineRule:baselineRule];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: mode=%d; amount=%f; baselineRule=%f>",
               NSStringFromClass(v4),
               self->_mode,
               *(void *)&self->_amount,
               *(void *)&self->_baselineRule);
}

@end