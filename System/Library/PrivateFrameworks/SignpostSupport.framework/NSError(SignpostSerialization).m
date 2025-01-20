@interface NSError(SignpostSerialization)
+ (id)errorWithCode:()SignpostSerialization description:;
@end

@implementation NSError(SignpostSerialization)

+ (id)errorWithCode:()SignpostSerialization description:
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a4 forKey:*MEMORY[0x1E4F28568]];
  v7 = [v5 errorWithDomain:@"SignpostSupportDomain" code:a3 userInfo:v6];

  return v7;
}

@end