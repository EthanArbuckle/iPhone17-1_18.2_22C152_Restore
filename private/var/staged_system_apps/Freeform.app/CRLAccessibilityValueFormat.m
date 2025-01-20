@interface CRLAccessibilityValueFormat
- (CRLAccessibilityValueFormat)initWithNumberFormat:(id)a3 andUnitStringsDictKey:(id)a4;
- (NSString)numberFormat;
- (NSString)unitStringsDictKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setNumberFormat:(id)a3;
- (void)setUnitStringsDictKey:(id)a3;
@end

@implementation CRLAccessibilityValueFormat

- (CRLAccessibilityValueFormat)initWithNumberFormat:(id)a3 andUnitStringsDictKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLAccessibilityValueFormat;
  v8 = [(CRLAccessibilityValueFormat *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CRLAccessibilityValueFormat *)v8 setNumberFormat:v6];
    [(CRLAccessibilityValueFormat *)v9 setUnitStringsDictKey:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLAccessibilityValueFormat alloc];
  v5 = [(CRLAccessibilityValueFormat *)self numberFormat];
  id v6 = [v5 copy];
  id v7 = [(CRLAccessibilityValueFormat *)self unitStringsDictKey];
  id v8 = [v7 copy];
  v9 = [(CRLAccessibilityValueFormat *)v4 initWithNumberFormat:v6 andUnitStringsDictKey:v8];

  return v9;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(id)a3
{
}

- (NSString)unitStringsDictKey
{
  return self->_unitStringsDictKey;
}

- (void)setUnitStringsDictKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitStringsDictKey, 0);

  objc_storeStrong((id *)&self->_numberFormat, 0);
}

@end