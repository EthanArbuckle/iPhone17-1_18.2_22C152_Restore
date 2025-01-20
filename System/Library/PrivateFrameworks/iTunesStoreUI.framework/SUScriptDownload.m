@interface SUScriptDownload
+ (id)phaseStringForDownload:(id)a3;
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSNumber)adamID;
- (NSString)phase;
- (SUScriptDownload)initWithISUDownload:(id)a3;
- (SUScriptDownload)initWithSSDownload:(id)a3;
- (float)progress;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptDownload

- (SUScriptDownload)initWithISUDownload:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptDownload;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_download = (ISUDownload *)a3;
  }
  return v4;
}

- (SUScriptDownload)initWithSSDownload:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptDownload;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_download = [[ISUDownload alloc] initWithManagedDownload:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDownload;
  [(SUScriptObject *)&v3 dealloc];
}

+ (id)phaseStringForDownload:(id)a3
{
  objc_super v3 = (void *)[a3 phaseIdentifier];
  if ([v3 isEqualToString:*MEMORY[0x263F7B5C8]]) {
    return @"failed";
  }
  if ([v3 isEqualToString:*MEMORY[0x263F7B5E0]]) {
    return @"paused";
  }
  if ([v3 isEqualToString:*MEMORY[0x263F7B5D8]]) {
    return @"installing";
  }
  if ([v3 isEqualToString:*MEMORY[0x263F7B5E8]]) {
    return @"waiting";
  }
  return @"downloading";
}

- (NSNumber)adamID
{
  return [(ISUDownload *)self->_download storeItemIdentifier];
}

- (id)_className
{
  return @"iTunesDownload";
}

- (NSString)phase
{
  objc_super v3 = objc_opt_class();
  download = self->_download;

  return (NSString *)[v3 phaseStringForDownload:download];
}

- (float)progress
{
  [(ISUDownload *)self->_download percentComplete];
  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_16, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownload;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDownload;
  double v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_16 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_16 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"adamID", @"phase", @"phase", @"progress", @"progress", 0);
  }
}

@end