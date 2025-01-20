@interface WBSWebExtensionInjectedContentData
+ (id)supportedInjectedContentFeatures;
@end

@implementation WBSWebExtensionInjectedContentData

+ (id)supportedInjectedContentFeatures
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"css";
  v10[1] = @"js";
  v11[0] = @"14.0";
  v11[1] = @"14.0";
  v10[2] = @"matches";
  v8 = @"<all_urls>";
  v9 = @"14.0";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[2] = v2;
  v10[3] = @"exclude_matches";
  v6 = @"<all_urls>";
  v7 = @"14.0";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v11[3] = v3;
  v11[4] = @"14.0";
  v10[4] = @"run_at";
  v10[5] = @"all_frames";
  v11[5] = @"14.0";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v4;
}

- (void).cxx_destruct
{
}

@end