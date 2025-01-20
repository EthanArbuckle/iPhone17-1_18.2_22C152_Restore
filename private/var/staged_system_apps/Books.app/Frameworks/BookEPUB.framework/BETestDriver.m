@interface BETestDriver
+ (id)shared;
- (BETestDriverTestStateProvider)testStateProvider;
- (void)postEvent:(id)a3 sender:(id)a4;
- (void)setTestStateProvider:(id)a3;
@end

@implementation BETestDriver

+ (id)shared
{
  if (qword_409AB8 != -1) {
    dispatch_once(&qword_409AB8, &stru_3C0240);
  }
  v2 = (void *)qword_409AB0;

  return v2;
}

- (void)postEvent:(id)a3 sender:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(BETestDriver *)self testStateProvider];
  unsigned int v8 = [v7 testIsRunning];

  if (v8)
  {
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:v10 object:v6];
  }
}

- (BETestDriverTestStateProvider)testStateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testStateProvider);

  return (BETestDriverTestStateProvider *)WeakRetained;
}

- (void)setTestStateProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end