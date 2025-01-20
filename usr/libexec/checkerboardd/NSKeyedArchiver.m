@interface NSKeyedArchiver
+ (void)archiveObject:(id)a3 toXPCObject:(id)a4;
@end

@implementation NSKeyedArchiver

+ (void)archiveObject:(id)a3 toXPCObject:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = (id)objc_opt_new();
  [v9 setRequiresSecureCoding:1];
  [v9 encodeObject:v6 forKey:NSKeyedArchiveRootObjectKey];

  v7 = [v9 encodedData];
  xpc_dictionary_set_uint64(v5, "Version", 1uLL);
  xpc_dictionary_set_string(v5, "Magic", "CBCo");
  id v8 = v7;
  xpc_dictionary_set_data(v5, "Data", [v8 bytes], (size_t)[v8 length]);
}

@end