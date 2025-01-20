@interface WFApertureSymbolConfiguration
+ (id)configurationWithPointSize:(double)a3 weight:(int64_t)a4;
- (WFApertureSymbolConfiguration)initWithPointSize:(double)a3 weight:(int64_t)a4;
- (double)pointSize;
- (int64_t)weight;
@end

@implementation WFApertureSymbolConfiguration

- (double)pointSize
{
  return self->_pointSize;
}

- (int64_t)weight
{
  return self->_weight;
}

- (WFApertureSymbolConfiguration)initWithPointSize:(double)a3 weight:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WFApertureSymbolConfiguration;
  v6 = [(WFApertureSymbolConfiguration *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_pointSize = a3;
    v6->_weight = a4;
    v8 = v6;
  }

  return v7;
}

+ (id)configurationWithPointSize:(double)a3 weight:(int64_t)a4
{
  v4 = [[WFApertureSymbolConfiguration alloc] initWithPointSize:a4 weight:a3];
  return v4;
}

@end