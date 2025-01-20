@interface ISProcessPropertyListOperation
- (ISProcessPropertyListOperation)initWithPropertyList:(id)a3;
- (ISPropertyListProvider)dataProvider;
- (void)dealloc;
- (void)run;
- (void)setDataProvider:(id)a3;
@end

@implementation ISProcessPropertyListOperation

- (ISProcessPropertyListOperation)initWithPropertyList:(id)a3
{
  __ISRecordSPIClassUsage(self);
  v5 = [(ISOperation *)self init];
  if (v5)
  {
    v5->_dataProvider = objc_alloc_init(ISPropertyListProvider);
    v5->_propertyList = (NSDictionary *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_dataProvider = 0;
  self->_propertyList = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISProcessPropertyListOperation;
  [(ISProcessPropertyListOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v3 = 0;
  [(ISOperation *)self setSuccess:[(ISPropertyListProvider *)[(ISProcessPropertyListOperation *)self dataProvider] processPropertyList:self->_propertyList returningError:&v3]];
  [(ISOperation *)self setError:v3];
}

- (ISPropertyListProvider)dataProvider
{
  return (ISPropertyListProvider *)objc_getProperty(self, a2, 336, 1);
}

- (void)setDataProvider:(id)a3
{
}

@end