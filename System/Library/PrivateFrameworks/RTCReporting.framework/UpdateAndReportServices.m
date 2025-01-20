@interface UpdateAndReportServices
- (BOOL)report;
- (BOOL)update;
- (UpdateAndReportServices)initWithServices:(BOOL)a3 needToReport:(BOOL)a4 service:(id)a5;
- (id)block;
- (void)dealloc;
- (void)setBlock:(id)a3;
@end

@implementation UpdateAndReportServices

- (UpdateAndReportServices)initWithServices:(BOOL)a3 needToReport:(BOOL)a4 service:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)UpdateAndReportServices;
  v8 = [(UpdateAndReportServices *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_update = a3;
    v8->_report = a4;
    v8->_block = _Block_copy(a5);
  }
  return v9;
}

- (void)dealloc
{
  id block = self->_block;
  if (block) {

  }
  v4.receiver = self;
  v4.super_class = (Class)UpdateAndReportServices;
  [(UpdateAndReportServices *)&v4 dealloc];
}

- (BOOL)update
{
  return self->_update;
}

- (BOOL)report
{
  return self->_report;
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBlock:(id)a3
{
}

@end