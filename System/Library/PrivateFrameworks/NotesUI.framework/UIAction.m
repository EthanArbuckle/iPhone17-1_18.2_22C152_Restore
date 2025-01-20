@interface UIAction
@end

@implementation UIAction

id __73__UIAction_IC__ic_centerWindowActionWithAppURL_activationRequestOptions___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.notes.open.object"];
  v3 = [*(id *)(a1 + 32) absoluteString];
  [v2 setTargetContentIdentifier:v3];

  [v2 setUserInfo:&unk_1F09A46C0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1F68]) initWithUserActivity:v2];
  [v4 setOptions:*(void *)(a1 + 40)];

  return v4;
}

@end