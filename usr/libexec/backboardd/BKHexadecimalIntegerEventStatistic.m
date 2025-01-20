@interface BKHexadecimalIntegerEventStatistic
+ (id)statisticWithLabel:(id)a3 hexFormatModifier:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)value;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)excludeBitNumber:(int64_t)a3;
- (void)excludeMask:(unint64_t)a3;
- (void)includeBitNumber:(int64_t)a3;
- (void)includeMask:(unint64_t)a3;
- (void)reset;
- (void)setValue:(unint64_t)a3;
@end

@implementation BKHexadecimalIntegerEventStatistic

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  unint64_t value = self->_value;
  if (value)
  {
    int64_t hexFormatModifier = self->_hexFormatModifier;
    v7 = [(BKEventStatistic *)self label];
    if (hexFormatModifier)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001AAE4;
      v10[3] = &unk_1000F8BE0;
      v10[4] = self;
      [v4 appendCustomFormatWithName:v7 block:v10];
    }
    else
    {
      id v8 = [v4 appendUnsignedInteger:value withName:v7 format:1];
    }

    v9.receiver = self;
    v9.super_class = (Class)BKHexadecimalIntegerEventStatistic;
    [(BKEventStatistic *)&v9 appendDescriptionToFormatter:v4];
  }
}

+ (id)statisticWithLabel:(id)a3 hexFormatModifier:(int64_t)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___BKHexadecimalIntegerEventStatistic;
  v5 = [super statisticWithLabel:a3];
  if (v5) {
    v5[5] = a4;
  }

  return v5;
}

- (void)excludeBitNumber:(int64_t)a3
{
}

- (void)setValue:(unint64_t)a3
{
  if (self->_value != a3)
  {
    self->_unint64_t value = a3;
    unsigned int v5 = ![(BKEventStatistic *)self automaticResetDisabled];
    if (a3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    [(BKEventStatistic *)self setNeedsLogging:v6];
  }
}

- (void)includeBitNumber:(int64_t)a3
{
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)BKHexadecimalIntegerEventStatistic;
  [(BKEventStatistic *)&v3 reset];
  self->_unint64_t value = 0;
}

- (unint64_t)value
{
  return self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKHexadecimalIntegerEventStatistic;
  id result = [(BKEventStatistic *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_value;
  return result;
}

- (void)excludeMask:(unint64_t)a3
{
}

- (void)includeMask:(unint64_t)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v7 = v6;
    }
    else {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 value];
  BOOL v10 = v9 == self->_value;

  return v10;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithUnsignedLongLong:self->_value];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end