@interface NSError(PKSharing)
+ (id)pkSharingError:()PKSharing debugDescription:;
+ (uint64_t)pkSharingError:()PKSharing;
@end

@implementation NSError(PKSharing)

+ (uint64_t)pkSharingError:()PKSharing
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSharingErrorDomain" code:a3 userInfo:0];
}

+ (id)pkSharingError:()PKSharing debugDescription:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"PKSharingErrorDomain" code:a3 userInfo:v8];

  return v9;
}

@end