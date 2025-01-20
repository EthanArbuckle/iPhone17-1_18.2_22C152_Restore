@interface NSError(TRICloudKit)
+ (id)triCloudKitErrorWithMessage:()TRICloudKit;
+ (id)triCloudKitErrorWithMessage:()TRICloudKit code:;
@end

@implementation NSError(TRICloudKit)

+ (id)triCloudKitErrorWithMessage:()TRICloudKit code:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F28568];
  v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a3;
  v7 = [v5 mainBundle];
  v8 = [v7 localizedStringForKey:@"CloudKit error" value:&stru_1F3455898 table:0];
  v15[0] = v8;
  v14[1] = *MEMORY[0x1E4F28588];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 localizedStringForKey:v6 value:&stru_1F3455898 table:0];

  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.trial.cloudkit" code:a4 userInfo:v11];

  return v12;
}

+ (id)triCloudKitErrorWithMessage:()TRICloudKit
{
  v9 = (objc_class *)NSString;
  id v10 = a3;
  v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  v12 = [MEMORY[0x1E4F28C58] triCloudKitErrorWithMessage:v11 code:1];

  return v12;
}

@end