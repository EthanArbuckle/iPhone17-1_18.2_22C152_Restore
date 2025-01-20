@interface SNTestContext
- (NSMutableDictionary)objects;
- (NSString)testName;
- (SNTestContext)initWithApplication:(id)a3 testName:(id)a4;
- (UIApplication)application;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SNTestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (SNTestContext)initWithApplication:(id)a3 testName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SNTestContext;
  v9 = [(SNTestContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_application, a3);
    objc_storeStrong((id *)&v10->_testName, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objects = v10->_objects;
    v10->_objects = v11;
  }
  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SNTestContext *)self objects];
  [v8 setObject:v7 forKey:v6];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(SNTestContext *)self objects];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (UIApplication)application
{
  return self->_application;
}

- (NSString)testName
{
  return self->_testName;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

@end