@interface NSKeyedArchiver
+ (id)archiveObject:(id)a3;
+ (id)archiveObjectToData:(id)a3;
+ (id)archiveObjectToDict:(id)a3;
+ (void)archiveObject:(id)a3 to:(id)a4;
@end

@implementation NSKeyedArchiver

+ (id)archiveObjectToData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:v3 forKey:NSKeyedArchiveRootObjectKey];
  v5 = [v4 encodedData];
  v6 = [v3 description];

  NSLog(@"Successfully archived Object : %@", v6);
  NSLog(@"%s: Data length : %lu", "+[NSKeyedArchiver(XPC) archiveObjectToData:]", [v5 length]);

  return v5;
}

+ (id)archiveObjectToDict:(id)a3
{
  id v3 = +[NSKeyedArchiver archiveObjectToData:a3];
  id v4 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_100011F68, @"Version", v3, @"SerializedObject", 0];

  return v4;
}

+ (id)archiveObject:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 encodeObject:v3 forKey:NSKeyedArchiveRootObjectKey];
  v6 = [v5 encodedData];
  xpc_dictionary_set_uint64(v4, "Version", 1uLL);
  id v7 = v6;
  xpc_dictionary_set_data(v4, "SerializedObject", [v7 bytes], (size_t)[v7 length]);
  v8 = [v3 description];

  NSLog(@"Successfully archived Object : %@", v8);
  NSLog(@"%s: Data length : %lu", "+[NSKeyedArchiver(XPC) archiveObject:]", [v7 length]);

  return v4;
}

+ (void)archiveObject:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v10 encodeObject:v6 forKey:NSKeyedArchiveRootObjectKey];
  id v7 = [v10 encodedData];
  xpc_dictionary_set_uint64(v5, "Version", 1uLL);
  id v8 = v7;
  xpc_dictionary_set_data(v5, "SerializedObject", [v8 bytes], (size_t)[v8 length]);

  v9 = [v6 description];

  NSLog(@"Successfully archived Object : %@", v9);
  NSLog(@"%s: Data length : %lu", "+[NSKeyedArchiver(XPC) archiveObject:to:]", [v8 length]);
}

@end