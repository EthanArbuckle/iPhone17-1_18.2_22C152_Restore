@interface SNTestStore
- (NSMutableArray)testSuites;
- (NSMutableDictionary)testCases;
- (SNTestCase)extendedLaunchTest;
- (SNTestRun)extendedLaunchTestRun;
- (SNTestStore)init;
- (id)testRunForTestName:(id)a3;
- (void)addTestCase:(id)a3;
- (void)addTestSuite:(id)a3;
- (void)setExtendedLaunchTest:(id)a3;
@end

@implementation SNTestStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCases, 0);
  objc_storeStrong((id *)&self->_testSuites, 0);
  objc_storeStrong((id *)&self->_extendedLaunchTest, 0);
}

- (void)addTestSuite:(id)a3
{
  id v4 = a3;
  id v5 = [(SNTestStore *)self testSuites];
  [v5 addObject:v4];
}

- (NSMutableArray)testSuites
{
  return self->_testSuites;
}

- (SNTestRun)extendedLaunchTestRun
{
  v3 = [(SNTestStore *)self extendedLaunchTest];

  if (v3)
  {
    id v4 = [SNTestRun alloc];
    id v5 = [(SNTestStore *)self extendedLaunchTest];
    v6 = [(SNTestRun *)v4 initWithTestCase:v5 testSuite:0];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (SNTestCase)extendedLaunchTest
{
  return self->_extendedLaunchTest;
}

- (void)setExtendedLaunchTest:(id)a3
{
}

- (SNTestStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SNTestStore;
  v2 = [(SNTestStore *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    testSuites = v2->_testSuites;
    v2->_testSuites = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    testCases = v2->_testCases;
    v2->_testCases = v5;
  }
  return v2;
}

- (void)addTestCase:(id)a3
{
  id v4 = a3;
  id v6 = [(SNTestStore *)self testCases];
  id v5 = [v4 testName];
  [v6 setObject:v4 forKey:v5];
}

- (id)testRunForTestName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SNTestStore *)self testCases];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [[SNTestRun alloc] initWithTestCase:v6 testSuite:0];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v8 = [(SNTestStore *)self testSuites];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) testRunForTestName:v4];
          if (v13)
          {
            v7 = (SNTestRun *)v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (NSMutableDictionary)testCases
{
  return self->_testCases;
}

@end