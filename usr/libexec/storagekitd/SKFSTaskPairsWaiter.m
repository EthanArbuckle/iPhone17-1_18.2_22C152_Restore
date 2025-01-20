@interface SKFSTaskPairsWaiter
- (BOOL)waitWithError:(id *)a3;
- (NSArray)taskPairs;
- (SKFSTaskPairsWaiter)initWithTaskPairs:(id)a3;
- (void)setTaskPairs:(id)a3;
@end

@implementation SKFSTaskPairsWaiter

- (SKFSTaskPairsWaiter)initWithTaskPairs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKFSTaskPairsWaiter;
  v6 = [(SKFSTaskPairsWaiter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskPairs, a3);
  }

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  v4 = [(SKFSTaskPairsWaiter *)self taskPairs];
  id v5 = [v4 mutableCopy];
  while (1)
  {

    if (![v5 count]) {
      break;
    }
    v4 = [v5 objectAtIndexedSubscript:0];
    [v5 removeObjectAtIndex:0];
    v6 = [v4 msgHandler];
    v7 = [v6 group];
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    intptr_t v9 = dispatch_group_wait(v7, v8);

    if (v9) {
      [v5 addObject:v4];
    }
    v10 = [v4 msgHandler];
    v11 = [v10 error];

    if (v11)
    {
      v12 = [v4 msgHandler];
      v13 = [v12 error];
      unsigned __int8 v14 = +[SKError failWithError:v13 error:a3];

      goto LABEL_8;
    }
  }
  unsigned __int8 v14 = 1;
LABEL_8:

  return v14;
}

- (NSArray)taskPairs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTaskPairs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end