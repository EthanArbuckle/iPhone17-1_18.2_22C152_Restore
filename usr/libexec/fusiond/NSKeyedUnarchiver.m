@interface NSKeyedUnarchiver
+ (id)_unarchiveObjectFromVersion1XPCObject:(id)a3 allowedClasses:(id)a4;
+ (id)unarchiveDataToObject:(id)a3 allowedClasses:(id)a4;
+ (id)unarchiveXPCObject:(id)a3 allowedClasses:(id)a4;
@end

@implementation NSKeyedUnarchiver

+ (id)unarchiveDataToObject:(id)a3 allowedClasses:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  NSLog(@"%s: Data length : %lu", "+[NSKeyedUnarchiver(XPC) unarchiveDataToObject:allowedClasses:]", [v6 length]);
  uint64_t v10 = 0;
  id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v10];

  if (!v7) {
    NSLog(@"NSKeyedUnarchiver object - nil");
  }
  [v7 setDecodingFailurePolicy:0];
  NSLog(@"Allowed Classes : %@", v5);
  v8 = [v7 decodeObjectOfClasses:v5 forKey:NSKeyedArchiveRootObjectKey];

  if (v8) {
    NSLog(@"%s: Successfully Unarchived Object", "+[NSKeyedUnarchiver(XPC) unarchiveDataToObject:allowedClasses:]");
  }
  else {
    NSLog(@"%s: Failed to Unarchived Object", "+[NSKeyedUnarchiver(XPC) unarchiveDataToObject:allowedClasses:]");
  }

  return v8;
}

+ (id)_unarchiveObjectFromVersion1XPCObject:(id)a3 allowedClasses:(id)a4
{
  size_t length = 0;
  id v5 = a4;
  data = xpc_dictionary_get_data(a3, "SerializedObject", &length);
  id v7 = +[NSData dataWithBytes:data length:length];
  NSLog(@"%s: Data length : %lu", "+[NSKeyedUnarchiver(XPC) _unarchiveObjectFromVersion1XPCObject:allowedClasses:]", [v7 length]);
  id v12 = 0;
  id v8 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v7 error:&v12];
  id v9 = v12;
  NSLog(@"archiveError :%@", v9);
  NSLog(@"%s: Successfully Unarchived Object", "+[NSKeyedUnarchiver(XPC) _unarchiveObjectFromVersion1XPCObject:allowedClasses:]");
  uint64_t v10 = [v8 decodeObjectOfClasses:v5 forKey:NSKeyedArchiveRootObjectKey];

  if (!v10) {
    NSLog(@"Unable to unarchive data: %@", v9);
  }

  return v10;
}

+ (id)unarchiveXPCObject:(id)a3 allowedClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Version");
  NSLog(@"Version : %llu", uint64);
  if (uint64 == 1)
  {
    id v9 = [a1 _unarchiveObjectFromVersion1XPCObject:v6 allowedClasses:v7];
  }
  else
  {
    NSLog(@"%s: Unhandled Version: Error", "+[NSKeyedUnarchiver(XPC) unarchiveXPCObject:allowedClasses:]");
    id v9 = 0;
  }

  return v9;
}

@end