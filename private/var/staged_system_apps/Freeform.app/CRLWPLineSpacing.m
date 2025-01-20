@interface CRLWPLineSpacing
+ (id)lineSpacing;
- (BOOL)isEqual:(id)a3;
- (CRLWPLineSpacing)init;
- (CRLWPLineSpacing)initWithMode:(int64_t)a3 amount:(double)a4;
- (CRLWPLineSpacing)initWithMode:(int64_t)a3 amount:(double)a4 baselineRule:(double)a5;
- (double)amount;
- (double)baselineRule;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mode;
- (unint64_t)hash;
@end

@implementation CRLWPLineSpacing

+ (id)lineSpacing
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (CRLWPLineSpacing)init
{
  return [(CRLWPLineSpacing *)self initWithMode:0 amount:1.0];
}

- (CRLWPLineSpacing)initWithMode:(int64_t)a3 amount:(double)a4 baselineRule:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CRLWPLineSpacing;
  result = [(CRLWPLineSpacing *)&v9 init];
  if (result)
  {
    result->_mode = a3;
    result->_amount = a4;
    result->_baselineRule = a5;
  }
  return result;
}

- (CRLWPLineSpacing)initWithMode:(int64_t)a3 amount:(double)a4
{
  return [(CRLWPLineSpacing *)self initWithMode:a3 amount:a4 baselineRule:0.800000012];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  int64_t mode = self->_mode;
  double amount = self->_amount;
  double baselineRule = self->_baselineRule;

  return _[v4 initWithMode:mode amount:amount baselineRule:baselineRule];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = sub_1002469D0(v5, v4);
  if (v6
    && self->_mode == *(void *)(v6 + 8)
    && ((double amount = self->_amount, v8 = *(double *)(v6 + 16), amount == v8)
     || vabdd_f64(amount, v8) < fabs(v8 * 0.000000999999997)))
  {
    double baselineRule = self->_baselineRule;
    double v10 = *(double *)(v6 + 24);
    BOOL v11 = baselineRule == v10 || vabdd_f64(baselineRule, v10) < fabs(v10 * 0.000000999999997);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_mode;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: mode=%lu; amount=%f; baselineRule=%f>",
    v4,
    self->_mode,
    *(void *)&self->_amount,
  uint64_t v5 = *(void *)&self->_baselineRule);

  return v5;
}

- (int64_t)mode
{
  return self->_mode;
}

- (double)amount
{
  return self->_amount;
}

- (double)baselineRule
{
  return self->_baselineRule;
}

@end