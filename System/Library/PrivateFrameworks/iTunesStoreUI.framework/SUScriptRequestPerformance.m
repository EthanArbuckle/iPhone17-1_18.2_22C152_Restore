@interface SUScriptRequestPerformance
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSString)JSONHeaders;
- (SUScriptRequestPerformance)initWithRequestPerformance:(id)a3;
- (double)finishInterval;
- (double)receivedResponseInterval;
- (double)renderBeginInterval;
- (double)renderEndInterval;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptRequestPerformance

- (SUScriptRequestPerformance)initWithRequestPerformance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptRequestPerformance;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_performance = (ISURLRequestPerformance *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptRequestPerformance;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesRequestPerformance";
}

- (double)finishInterval
{
  [(ISURLRequestPerformance *)self->_performance finishInterval];
  return result;
}

- (NSString)JSONHeaders
{
  v2 = objc_msgSend((id)-[ISURLRequestPerformance URLResponse](self->_performance, "URLResponse"), "allHeaderFields");
  objc_super v3 = (void *)[v2 count];
  if (v3)
  {
    objc_super v3 = (void *)[MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
    if (v3) {
      objc_super v3 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    }
  }

  return (NSString *)v3;
}

- (double)receivedResponseInterval
{
  [(ISURLRequestPerformance *)self->_performance receivedResponseInterval];
  return result;
}

- (double)renderBeginInterval
{
  [(ISURLRequestPerformance *)self->_performance renderBeginInterval];
  return result;
}

- (double)renderEndInterval
{
  [(ISURLRequestPerformance *)self->_performance renderEndInterval];
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_78, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptRequestPerformance;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptRequestPerformance;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_78 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_78 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"headers", @"JSONHeaders", @"requestBeginInterval", @"receivedResponseInterval", @"requestEndInterval", @"finishInterval", @"renderBeginInterval", @"renderBeginInterval", @"renderEndInterval", @"renderEndInterval", 0);
  }
}

@end