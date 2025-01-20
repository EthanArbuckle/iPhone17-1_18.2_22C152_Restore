@interface NSError(UVObjCAdditions)
+ (id)uv_errorWithDescription:()UVObjCAdditions;
+ (id)uv_errorWithFormat:()UVObjCAdditions;
+ (id)uv_errorWithUserInfo:()UVObjCAdditions;
@end

@implementation NSError(UVObjCAdditions)

+ (id)uv_errorWithUserInfo:()UVObjCAdditions
{
  id v4 = a3;
  v5 = (void *)[[a1 alloc] initWithDomain:@"com.apple.Previews" code:-1 userInfo:v4];

  return v5;
}

+ (id)uv_errorWithDescription:()UVObjCAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = a3;
  id v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = objc_msgSend(a1, "uv_errorWithUserInfo:", v6);

  return v7;
}

+ (id)uv_errorWithFormat:()UVObjCAdditions
{
  v10 = (objc_class *)NSString;
  id v11 = a3;
  v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  v13 = objc_msgSend(a1, "uv_errorWithDescription:", v12);

  return v13;
}

@end