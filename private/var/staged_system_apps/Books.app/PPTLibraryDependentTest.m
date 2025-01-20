@interface PPTLibraryDependentTest
- (BOOL)hasHandler;
- (PPTLibraryDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (int)handlerTimeout;
- (unint64_t)mode;
- (void)setMode:(unint64_t)a3;
@end

@implementation PPTLibraryDependentTest

- (PPTLibraryDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PPTLibraryDependentTest;
  v11 = [(PPTBasicTest *)&v16 initWithName:a3 options:a4 testDefinition:v10 isMainTest:v6];
  if (v11)
  {
    v12 = [v10 objectForKeyedSubscript:@"library-type"];
    unsigned int v13 = [v12 isEqualToString:@"list"];
    uint64_t v14 = 1;
    if (v13) {
      uint64_t v14 = 2;
    }
    v11->_mode = v14;
  }
  return v11;
}

- (int)handlerTimeout
{
  return 3;
}

- (BOOL)hasHandler
{
  v3 = [(PPTBasicTest *)self bookshelf];
  [v3 changeViewModeTo:self->_mode];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000920C4;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  return 0;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

@end