@interface WFPencilActionConfigurationMetricsCacheKey
- (BOOL)isEqual:(id)a3;
- (CGSize)screenSize;
- (WFPencilActionConfigurationMetricsCacheKey)initWithInterfaceOrientation:(int64_t)a3 screenSize:(CGSize)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)interfaceOrientation;
- (unint64_t)hash;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setScreenSize:(CGSize)a3;
@end

@implementation WFPencilActionConfigurationMetricsCacheKey

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [WFPencilActionConfigurationMetricsCacheKey alloc];
  int64_t v5 = [(WFPencilActionConfigurationMetricsCacheKey *)self interfaceOrientation];
  [(WFPencilActionConfigurationMetricsCacheKey *)self screenSize];
  return -[WFPencilActionConfigurationMetricsCacheKey initWithInterfaceOrientation:screenSize:](v4, "initWithInterfaceOrientation:screenSize:", v5);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v5 = v4;
    }
    else {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
  id v6 = v5;
  [(WFPencilActionConfigurationMetricsCacheKey *)self screenSize];
  double v8 = v7;
  double v10 = v9;
  [v6 screenSize];
  if (v8 == v12 && v10 == v11)
  {
    int64_t v15 = [(WFPencilActionConfigurationMetricsCacheKey *)self interfaceOrientation];
    BOOL v14 = v15 == [v6 interfaceOrientation];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(WFPencilActionConfigurationMetricsCacheKey *)self screenSize];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];
  id v6 = NSNumber;
  [(WFPencilActionConfigurationMetricsCacheKey *)self screenSize];
  double v8 = [v6 numberWithDouble:v7];
  uint64_t v9 = [v8 hash] ^ v5;
  unint64_t v10 = v9 ^ [(WFPencilActionConfigurationMetricsCacheKey *)self interfaceOrientation];

  return v10;
}

- (WFPencilActionConfigurationMetricsCacheKey)initWithInterfaceOrientation:(int64_t)a3 screenSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v11.receiver = self;
  v11.super_class = (Class)WFPencilActionConfigurationMetricsCacheKey;
  double v7 = [(WFPencilActionConfigurationMetricsCacheKey *)&v11 init];
  double v8 = v7;
  if (v7)
  {
    v7->_screenSize.CGFloat width = width;
    v7->_screenSize.CGFloat height = height;
    v7->_interfaceOrientation = a3;
    uint64_t v9 = v7;
  }

  return v8;
}

@end