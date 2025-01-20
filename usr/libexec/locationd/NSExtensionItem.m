@interface NSExtensionItem
+ (id)extensionItemForDict:(id)a3 withName:(id)a4 withPayload:(id)a5;
@end

@implementation NSExtensionItem

+ (id)extensionItemForDict:(id)a3 withName:(id)a4 withPayload:(id)a5
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:a3 forKeyedSubscript:@"clientDictionary"];
  [v8 setObject:a4 forKeyedSubscript:@"clientName"];
  if (a5) {
    [v8 setObject:[+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a5, 1, 0) forKeyedSubscript:@"archivedPayload"];
  }
  id v9 = objc_alloc_init((Class)NSExtensionItem);
  [v9 setUserInfo:v8];
  return v9;
}

@end