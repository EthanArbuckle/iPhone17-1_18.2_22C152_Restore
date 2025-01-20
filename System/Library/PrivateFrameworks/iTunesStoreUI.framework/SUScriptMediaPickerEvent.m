@interface SUScriptMediaPickerEvent
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (SUScriptMediaItemCollection)collection;
- (SUScriptMediaPickerEvent)initWithCollection:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptMediaPickerEvent

- (SUScriptMediaPickerEvent)initWithCollection:(id)a3
{
  v4 = [(SUScriptObject *)self init];
  v5 = v4;
  if (a3 && v4)
  {
    v6 = (SUScriptMediaItemCollection *)a3;
    v5->_collection = v6;
    [(SUScriptObject *)v5 checkInScriptObject:v6];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPickerEvent;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)_className
{
  return @"iTunesMediaPickerEvent";
}

- (SUScriptMediaItemCollection)collection
{
  collection = self->_collection;
  if (collection)
  {
    objc_super v3 = collection;
    return v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFF9D0];
    return (SUScriptMediaItemCollection *)[v5 null];
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_39, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPickerEvent;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPickerEvent;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_39 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_39 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"collection", 0);
  }
}

@end