@interface ACFHTTPMethod
+ (id)method;
+ (id)methodWithName:(id)a3 headerFields:(id)a4 body:(id)a5;
+ (id)methodWithName:(id)a3 headerFields:(id)a4 bodyPropertyList:(id)a5 error:(id *)a6;
- (ACFHTTPMethod)init;
- (ACFHTTPMethod)initWithName:(id)a3 headerFields:(id)a4 body:(id)a5;
- (NSData)body;
- (NSDictionary)headerFields;
- (NSString)name;
- (void)dealloc;
- (void)setBody:(id)a3;
- (void)setHeaderFields:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ACFHTTPMethod

+ (id)method
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)methodWithName:(id)a3 headerFields:(id)a4 body:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithName:a3 headerFields:a4 body:a5];

  return v5;
}

+ (id)methodWithName:(id)a3 headerFields:(id)a4 bodyPropertyList:(id)a5 error:(id *)a6
{
  id result = (id)[MEMORY[0x263F08AC0] dataWithPropertyList:a5 format:100 options:0 error:a6];
  if (result)
  {
    return (id)[a1 methodWithName:a3 headerFields:a4 body:result];
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethod;
  [(ACFHTTPMethod *)&v3 dealloc];
}

- (ACFHTTPMethod)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACFHTTPMethod;
  id v2 = [(ACFHTTPMethod *)&v4 init];
  if (v2) {
    v2->_name = (NSString *)@"POST";
  }
  return v2;
}

- (ACFHTTPMethod)initWithName:(id)a3 headerFields:(id)a4 body:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ACFHTTPMethod;
  v8 = [(ACFHTTPMethod *)&v10 init];
  if (v8)
  {
    v8->_name = (NSString *)a3;
    v8->_headerFields = (NSDictionary *)a4;
    v8->_body = (NSData *)a5;
  }
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHeaderFields:(id)a3
{
}

- (NSData)body
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBody:(id)a3
{
}

@end