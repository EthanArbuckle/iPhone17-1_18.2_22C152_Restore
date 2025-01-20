@interface SLUEStatisticsCohortTypeEncoding
- (NSDictionary)rawValueEncoded;
- (SLUEStatisticsCohortTypeEncoding)initWithDefaults;
- (void)setRawValueEncoded:(id)a3;
@end

@implementation SLUEStatisticsCohortTypeEncoding

- (void).cxx_destruct
{
}

- (void)setRawValueEncoded:(id)a3
{
}

- (NSDictionary)rawValueEncoded
{
  return self->_rawValueEncoded;
}

- (SLUEStatisticsCohortTypeEncoding)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)SLUEStatisticsCohortTypeEncoding;
  v2 = [(SLUEStatisticsCohortTypeEncoding *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SLUEStatisticsCohortTypeEncoding *)v2 setRawValueEncoded:&unk_26D0A2528];
  }
  return v3;
}

@end