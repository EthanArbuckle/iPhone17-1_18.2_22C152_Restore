@interface RMModelPayloadUtilities
+ (BOOL)_isCurrentVariantSupportedForDetails:(id)a3;
+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5 supportedOS:(id)a6;
+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 supportedOS:(id)a5;
@end

@implementation RMModelPayloadUtilities

+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 supportedOS:(id)a5
{
  v8 = NSNumber;
  id v9 = a5;
  v10 = [v8 numberWithInteger:a3];
  v11 = [v9 objectForKeyedSubscript:v10];

  if ([a1 _isCurrentVariantSupportedForDetails:v11])
  {
    v12 = [NSNumber numberWithInteger:a4];
    v13 = [v11 objectAtIndexedSubscript:0];
    char v14 = [v13 containsObject:v12];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5 supportedOS:(id)a6
{
  v10 = NSNumber;
  id v11 = a6;
  v12 = [v10 numberWithInteger:a3];
  v13 = [v11 objectForKeyedSubscript:v12];

  if ([a1 _isCurrentVariantSupportedForDetails:v13])
  {
    char v14 = [NSNumber numberWithInteger:a4];
    v15 = [NSNumber numberWithInteger:a5];
    v16 = [v13 objectAtIndexedSubscript:0];
    if ([v16 containsObject:v14])
    {
      v17 = [v13 objectAtIndexedSubscript:1];
      char v18 = [v17 containsObject:v15];
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

+ (BOOL)_isCurrentVariantSupportedForDetails:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x263F38B68] isAppleInternal];
  if ((unint64_t)[v3 count] < 3)
  {
    char v7 = 1;
  }
  else
  {
    v5 = [v3 objectAtIndexedSubscript:2];
    char v6 = [v5 containsObject:&unk_2708C2400];

    char v7 = v6 ^ 1;
  }
  char v8 = v4 | v7;

  return v8;
}

@end