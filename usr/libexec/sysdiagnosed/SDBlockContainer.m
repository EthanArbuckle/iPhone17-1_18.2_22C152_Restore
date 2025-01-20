@interface SDBlockContainer
+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6;
+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6 withCompletionBlock:(id)a7;
- (BOOL)_execute;
- (BOOL)finished;
- (BOOL)flattenReturnedDirectoryPaths;
- (NSMutableArray)paths;
- (id)block;
- (id)completionBlock;
- (id)logBlock;
- (void)end;
- (void)setBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3;
- (void)setLogBlock:(id)a3;
- (void)setPaths:(id)a3;
- (void)startTimeout;
@end

@implementation SDBlockContainer

+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    v12 = [(SDContainer *)[SDBlockContainer alloc] initWithName:v9 andDestination:0 withDelegate:v11];
    v13 = v12;
    if (v12)
    {
      [(SDBlockContainer *)v12 setBlock:v10];
      [(SDTaskContainer *)v13 setTimeout:a5];
      v14 = +[NSMutableArray array];
      [(SDBlockContainer *)v13 setPaths:v14];

      [(SDBlockContainer *)v13 setFlattenReturnedDirectoryPaths:1];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100064D28();
    }
    v15 = +[SDResourceManager sharedResourceManager];
    [v15 stderrWrite:@"Can't create a block container with nil block %@, block : %@", v9, 0];

    v16 = +[SDResourceManager sharedResourceManager];
    [v16 log:@"Can't create a block container with nil block %@, block : %@", v9, 0];

    v13 = 0;
  }

  return v13;
}

+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6 withCompletionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(id)objc_opt_class() containerWithName:v14 forBlock:v13 withTimeout:v12 withDelegate:a5];

  if (v15) {
    [v15 setCompletionBlock:v11];
  }

  return v15;
}

- (void)end
{
  if (![(SDBlockContainer *)self finished])
  {
    [(SDBlockContainer *)self setFinished:1];
    v3 = [(SDTaskContainer *)self timeoutSource];
    dispatch_source_cancel(v3);

    id v4 = +[SDTaskDepot sharedTaskDepot];
    [v4 recordBlockTaskEnd];
  }
}

- (void)startTimeout
{
  [(SDTaskContainer *)self timeout];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100046534;
  v3[3] = &unk_10009CFE0;
  v3[4] = self;
  -[SDTaskContainer startTimeout:withHandler:](self, "startTimeout:withHandler:", v3);
}

- (BOOL)_execute
{
  v3 = +[SDTaskDepot sharedTaskDepot];
  [v3 recordBlockTaskStart];

  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046698;
  block[3] = &unk_10009CFE0;
  block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (NSMutableArray)paths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPaths:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setBlock:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)logBlock
{
  return self->_logBlock;
}

- (void)setLogBlock:(id)a3
{
}

- (BOOL)flattenReturnedDirectoryPaths
{
  return self->_flattenReturnedDirectoryPaths;
}

- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3
{
  self->_flattenReturnedDirectoryPaths = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_paths, 0);
}

@end