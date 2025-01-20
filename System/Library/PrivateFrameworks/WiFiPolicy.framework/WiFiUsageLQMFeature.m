@interface WiFiUsageLQMFeature
- (BOOL)isEqual:(id)a3;
- (BOOL)isPerSecond;
- (NSNumber)median;
- (NSString)fieldName;
- (WiFiUsageLQMFeature)initWithField:(id)a3 andPerSecond:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFieldName:(id)a3;
- (void)setIsPerSecond:(BOOL)a3;
- (void)setMedian:(id)a3;
@end

@implementation WiFiUsageLQMFeature

- (NSNumber)median
{
  return self->_median;
}

- (void)setMedian:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (BOOL)isPerSecond
{
  return self->_isPerSecond;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    fieldName = self->_fieldName;
    v6 = [v4 fieldName];
    char v7 = [(NSString *)fieldName isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (WiFiUsageLQMFeature)initWithField:(id)a3 andPerSecond:(BOOL)a4
{
  v6 = (NSString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageLQMFeature;
  char v7 = [(WiFiUsageLQMFeature *)&v10 init];
  fieldName = v7->_fieldName;
  v7->_fieldName = v6;

  v7->_isPerSecond = a4;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  [v4 setFieldName:self->_fieldName];
  [v4 setIsPerSecond:self->_isPerSecond];
  [v4 setMedian:self->_median];
  return v4;
}

- (id)description
{
  if (self->_isPerSecond) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"fieldName:%@ isPerSecond:%@ median:%@", self->_fieldName, v2, self->_median];
}

- (void)setFieldName:(id)a3
{
}

- (void)setIsPerSecond:(BOOL)a3
{
  self->_isPerSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_median, 0);

  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end