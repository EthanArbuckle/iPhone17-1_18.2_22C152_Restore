@interface FLFollowUpController(ICQUI)
+ (void)icq_dismissFollowUpWithIdentifier:()ICQUI;
@end

@implementation FLFollowUpController(ICQUI)

+ (void)icq_dismissFollowUpWithIdentifier:()ICQUI
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.icloud.quota"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__FLFollowUpController_ICQUI__icq_dismissFollowUpWithIdentifier___block_invoke;
  v7[3] = &unk_1E6A53618;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  [v5 pendingFollowUpItemsWithCompletion:v7];
}

@end