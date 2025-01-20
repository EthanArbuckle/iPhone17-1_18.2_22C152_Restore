@interface NSError(UsefulConstructors)
+ (id)errorWithDomain:()UsefulConstructors code:description:underlying:;
+ (uint64_t)errorWithDomain:()UsefulConstructors code:description:;
@end

@implementation NSError(UsefulConstructors)

+ (id)errorWithDomain:()UsefulConstructors code:description:underlying:
{
  v9 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  [v13 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v14 = [MEMORY[0x1E4F28C58] errorWithDomain:v12 code:a4 userInfo:v13];

  return v14;
}

+ (uint64_t)errorWithDomain:()UsefulConstructors code:description:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:a3 code:a4 description:a5 underlying:0];
}

@end