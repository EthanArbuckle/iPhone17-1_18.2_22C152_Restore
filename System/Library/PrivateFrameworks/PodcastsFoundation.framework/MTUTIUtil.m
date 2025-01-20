@interface MTUTIUtil
+ (BOOL)isAudio:(id)a3;
+ (BOOL)isVideo:(id)a3;
+ (id)convertUti:(id)a3;
@end

@implementation MTUTIUtil

+ (id)convertUti:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F22720]])
  {
    id v4 = (id)*MEMORY[0x1E4F22660];

    id v3 = v4;
  }
  return v3;
}

+ (BOOL)isVideo:(id)a3
{
  id v3 = [a1 convertUti:a3];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F22660]];

  return v4;
}

+ (BOOL)isAudio:(id)a3
{
  id v3 = [a1 convertUti:a3];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F22538]];

  return v4;
}

@end