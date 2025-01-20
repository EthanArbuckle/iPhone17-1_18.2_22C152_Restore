@interface WISXPCUtils
+ (id)dictionaryFromPrimitivesXPCDict:(dict)a3 error:(id *)a4;
+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5;
@end

@implementation WISXPCUtils

+ (id)dictionaryFromPrimitivesXPCDict:(dict)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v7 = *(void **)a3.var0.fObj;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10000BBB4;
  applier[3] = &unk_1001B8BD0;
  v13 = &v15;
  v14 = a4;
  id v8 = v6;
  id v12 = v8;
  xpc_dictionary_apply(v7, applier);
  if (*((unsigned char *)v16 + 24)) {
    id v9 = 0;
  }
  else {
    id v9 = [v8 copy];
  }

  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5
{
  id v7 = a5;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  *a3 = +[NSError errorWithDomain:@"WISXPCUtils" code:a4 userInfo:v8];
}

@end