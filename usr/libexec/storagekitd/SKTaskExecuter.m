@interface SKTaskExecuter
- (BOOL)waitWithError:(id *)a3;
- (NSArray)tasks;
- (SKTaskExecuter)initWithTasks:(id)a3;
@end

@implementation SKTaskExecuter

- (SKTaskExecuter)initWithTasks:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKTaskExecuter;
  v6 = [(SKTaskExecuter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tasks, a3);
  }

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  id v5 = [(SKTaskExecuter *)self tasks];
  [v5 enumerateObjectsUsingBlock:&stru_100048D58];

  v6 = [(SKTaskExecuter *)self tasks];
  v7 = +[NSPredicate predicateWithBlock:&stru_100048D98];
  v8 = [v6 filteredArrayUsingPredicate:v7];

  if ([v8 count])
  {
    do
    {
      [v8 enumerateObjectsUsingBlock:&stru_100048DB8];
      objc_super v9 = [(SKTaskExecuter *)self tasks];
      v10 = +[NSPredicate predicateWithBlock:&stru_100048DD8];
      v11 = [v9 filteredArrayUsingPredicate:v10];

      v8 = v11;
    }
    while ([v11 count]);
  }
  else
  {
    v11 = v8;
  }
  v12 = [(SKTaskExecuter *)self tasks];
  [v12 enumerateObjectsUsingBlock:&stru_100048DF8];

  v13 = [(SKTaskExecuter *)self tasks];
  [v13 enumerateObjectsUsingBlock:&stru_100048E18];

  v14 = [(SKTaskExecuter *)self tasks];
  v15 = +[NSPredicate predicateWithBlock:&stru_100048E38];
  v16 = [v14 filteredArrayUsingPredicate:v15];

  id v17 = [v16 count];
  if (v17)
  {
    v18 = sub_10000DD48();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v16 count];
      v20 = [v16 objectAtIndexedSubscript:0];
      v21 = [v20 task];
      int v23 = 136315650;
      v24 = "-[SKTaskExecuter waitWithError:]";
      __int16 v25 = 2048;
      id v26 = v19;
      __int16 v27 = 1024;
      unsigned int v28 = [v21 terminationStatus];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: %lu tasks failed, first exit status %d", (uint8_t *)&v23, 0x1Cu);
    }
    if (a3)
    {
      *a3 = +[SKError errorWithCode:140 userInfo:0];
    }
  }

  return v17 == 0;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end