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
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = [(SKTaskExecuter *)self tasks];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_166];

  v6 = [(SKTaskExecuter *)self tasks];
  v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_170];
  v8 = [v6 filteredArrayUsingPredicate:v7];

  if ([v8 count])
  {
    do
    {
      [v8 enumerateObjectsUsingBlock:&__block_literal_global_172];
      objc_super v9 = [(SKTaskExecuter *)self tasks];
      v10 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_174];
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
  [v12 enumerateObjectsUsingBlock:&__block_literal_global_176];

  v13 = [(SKTaskExecuter *)self tasks];
  [v13 enumerateObjectsUsingBlock:&__block_literal_global_178];

  v14 = [(SKTaskExecuter *)self tasks];
  v15 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_180];
  v16 = [v14 filteredArrayUsingPredicate:v15];

  uint64_t v17 = [v16 count];
  if (v17)
  {
    v18 = SKGetOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v16 count];
      v20 = [v16 objectAtIndexedSubscript:0];
      v21 = [v20 task];
      int v23 = 136315650;
      v24 = "-[SKTaskExecuter waitWithError:]";
      __int16 v25 = 2048;
      uint64_t v26 = v19;
      __int16 v27 = 1024;
      int v28 = [v21 terminationStatus];
      _os_log_impl(&dword_23F40C000, v18, OS_LOG_TYPE_ERROR, "%s: %lu tasks failed, first exit status %d", (uint8_t *)&v23, 0x1Cu);
    }
    if (a3)
    {
      *a3 = +[SKError errorWithCode:140 userInfo:0];
    }
  }

  return v17 == 0;
}

void __32__SKTaskExecuter_waitWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 task];
  [v2 launch];
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 task];
  uint64_t v3 = [v2 isRunning];

  return v3;
}

void __32__SKTaskExecuter_waitWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v2 = [v10 stdoutParser];

  if (v2)
  {
    uint64_t v3 = [v10 stdoutParser];
    v4 = [v10 stdoutHandle];
    id v5 = [v4 readDataUpToLength:4096 error:0];
    [v3 parseData:v5];
  }
  v6 = [v10 stderrParser];

  if (v6)
  {
    v7 = [v10 stderrParser];
    v8 = [v10 stderrHandle];
    objc_super v9 = [v8 readDataUpToLength:4096 error:0];
    [v7 parseData:v9];
  }
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 task];
  uint64_t v3 = [v2 isRunning];

  return v3;
}

void __32__SKTaskExecuter_waitWithError___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 task];
  [v2 waitUntilExit];
}

void __32__SKTaskExecuter_waitWithError___block_invoke_6(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v2 = [v10 stderrParser];

  if (v2)
  {
    uint64_t v3 = [v10 stdoutParser];
    v4 = [v10 stdoutHandle];
    id v5 = [v4 readDataToEndOfFile];
    [v3 parseData:v5];
  }
  v6 = [v10 stderrParser];

  if (v6)
  {
    v7 = [v10 stderrParser];
    v8 = [v10 stderrHandle];
    objc_super v9 = [v8 readDataToEndOfFile];
    [v7 parseData:v9];
  }
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 endedSuccessfully] ^ 1;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end