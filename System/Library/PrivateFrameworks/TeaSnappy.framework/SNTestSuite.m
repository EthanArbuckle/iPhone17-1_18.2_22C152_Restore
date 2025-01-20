@interface SNTestSuite
- (NSMutableArray)subTestSuites;
- (NSMutableDictionary)testCases;
- (SNTestSuite)init;
- (SNTestSuite)parentTestSuite;
- (id)testRunForTestName:(id)a3;
- (id)testSetupList;
- (void)addSubTestSuite:(id)a3;
- (void)addTestCase:(id)a3;
- (void)setParentTestSuite:(id)a3;
@end

@implementation SNTestSuite

- (void)addTestCase:(id)a3
{
  id v4 = a3;
  id v6 = [(SNTestSuite *)self testCases];
  v5 = [v4 testName];
  [v6 setObject:v4 forKey:v5];
}

- (NSMutableDictionary)testCases
{
  return self->_testCases;
}

- (SNTestSuite)init
{
  v8.receiver = self;
  v8.super_class = (Class)SNTestSuite;
  v2 = [(SNTestSuite *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    testCases = v2->_testCases;
    v2->_testCases = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subTestSuites = v2->_subTestSuites;
    v2->_subTestSuites = v5;
  }
  return v2;
}

- (void)addSubTestSuite:(id)a3
{
  if (a3 != self)
  {
    id v5 = a3;
    [v5 setParentTestSuite:self];
    id v6 = [(SNTestSuite *)self subTestSuites];
    [v6 addObject:v5];
  }
}

- (NSMutableArray)subTestSuites
{
  return self->_subTestSuites;
}

- (void)setParentTestSuite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTestSuite);
  objc_storeStrong((id *)&self->_subTestSuites, 0);
  objc_storeStrong((id *)&self->_testCases, 0);
}

- (id)testRunForTestName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SNTestSuite *)self testCases];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [[SNTestRun alloc] initWithTestCase:v6 testSuite:self];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v8 = [(SNTestSuite *)self subTestSuites];
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

- (id)testSetupList
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(SNTestSuite *)self conformsToProtocol:&unk_1F39F91E0]) {
    [v3 addObject:self];
  }
  uint64_t v4 = [(SNTestSuite *)self parentTestSuite];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      if ([v5 conformsToProtocol:&unk_1F39F91E0]) {
        [v3 insertObject:v5 atIndex:0];
      }
      uint64_t v6 = [v5 parentTestSuite];

      id v5 = (void *)v6;
    }
    while (v6);
  }
  return v3;
}

- (SNTestSuite)parentTestSuite
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTestSuite);
  return (SNTestSuite *)WeakRetained;
}

@end