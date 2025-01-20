@interface RTMapsSupportManagerQueryContentsDidChangeNotification
- (RTMapsSupportManagerQueryContentsDidChangeNotification)init;
- (RTMapsSupportManagerQueryContentsDidChangeNotification)initWithQueryType:(int64_t)a3;
- (int64_t)queryType;
@end

@implementation RTMapsSupportManagerQueryContentsDidChangeNotification

- (RTMapsSupportManagerQueryContentsDidChangeNotification)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueryType_);
}

- (RTMapsSupportManagerQueryContentsDidChangeNotification)initWithQueryType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTMapsSupportManagerQueryContentsDidChangeNotification;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_queryType = a3;
  }
  return result;
}

- (int64_t)queryType
{
  return self->_queryType;
}

@end