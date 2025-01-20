@interface UIPhysicalButtonMutableConfigurationSet
@end

@implementation UIPhysicalButtonMutableConfigurationSet

void __87___UIPhysicalButtonMutableConfigurationSet__unionWithConfigurationSet_acceptanceBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) _configurationForButton:a2];
  v4 = [*(id *)(a1 + 40) _configurationForButton:a2];
  if (v7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    [*(id *)(a1 + 32) _setConfiguration:v4 forButton:a2];
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
    }
  }
}

@end