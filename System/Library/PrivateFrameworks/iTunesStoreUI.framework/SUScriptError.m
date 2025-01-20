@interface SUScriptError
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSString)domain;
- (NSString)localizedDescription;
- (NSString)localizedFailureReason;
- (NSString)localizedRecoverySuggestion;
- (SUScriptError)initWithError:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (int64_t)code;
- (void)dealloc;
@end

@implementation SUScriptError

- (SUScriptError)initWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptError;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_error = (NSError *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptError;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesError";
}

- (int64_t)code
{
  return [(NSError *)self->_error code];
}

- (NSString)domain
{
  return [(NSError *)self->_error domain];
}

- (NSString)localizedDescription
{
  return [(NSError *)self->_error localizedDescription];
}

- (NSString)localizedFailureReason
{
  return [(NSError *)self->_error localizedFailureReason];
}

- (NSString)localizedRecoverySuggestion
{
  return [(NSError *)self->_error localizedRecoverySuggestion];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_63, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptError;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptError;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_63 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_63 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"code", @"domain", @"domain", @"localizedDescription", @"localizedDescription", @"localizedFailureReason", @"localizedFailureReason", @"localizedRecoverySuggestion", @"localizedRecoverySuggestion", 0);
  }
}

@end