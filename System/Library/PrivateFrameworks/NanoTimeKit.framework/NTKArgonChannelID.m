@interface NTKArgonChannelID
+ (NSSet)allChannelIDs;
+ (NSString)currentChannelID;
@end

@implementation NTKArgonChannelID

+ (NSString)currentChannelID
{
  v2 = [@"fs_phone" dataUsingEncoding:4];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return (NSString *)v3;
}

+ (NSSet)allChannelIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v16[0] = @"facesupport";
  v16[1] = @"fs_phone";
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 2, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dataUsingEncoding:4];
        v9 = [v8 base64EncodedStringWithOptions:0];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v5);
  }

  v10 = (void *)[v2 copy];
  return (NSSet *)v10;
}

@end