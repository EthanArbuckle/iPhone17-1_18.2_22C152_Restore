@interface UIObjectPerCanvas
@end

@implementation UIObjectPerCanvas

void __76___UIObjectPerCanvas_objectOfClass_forCanvas_withOptions_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  v3 = (void *)qword_1EB264C18;
  qword_1EB264C18 = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
  v5 = (void *)qword_1EB264C28;
  qword_1EB264C28 = v4;

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel_canvasDisconnected_ name:@"UISceneDidDisconnectNotification" object:0];
}

@end