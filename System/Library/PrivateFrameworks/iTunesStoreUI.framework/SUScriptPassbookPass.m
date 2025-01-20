@interface SUScriptPassbookPass
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSString)passTypeIdentifier;
- (NSString)passURL;
- (NSString)serialNumber;
- (SUScriptPassbookPass)initWithPass:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptPassbookPass

- (SUScriptPassbookPass)initWithPass:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptPassbookPass;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_pass = (PKPass *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPassbookPass;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesPassbookPass";
}

- (NSString)passTypeIdentifier
{
  return [(PKPass *)self->_pass passTypeIdentifier];
}

- (NSString)passURL
{
  v2 = [(PKPass *)self->_pass passURL];

  return [(NSURL *)v2 absoluteString];
}

- (NSString)serialNumber
{
  return [(PKPass *)self->_pass serialNumber];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_45, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPassbookPass;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPassbookPass;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_45 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_45 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"passTypeIdentifier", @"passURL", @"passURL", @"serialNumber", @"serialNumber", 0);
  }
}

@end