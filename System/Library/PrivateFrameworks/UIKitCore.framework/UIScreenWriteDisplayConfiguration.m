@interface UIScreenWriteDisplayConfiguration
@end

@implementation UIScreenWriteDisplayConfiguration

void ___UIScreenWriteDisplayConfiguration_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIScreen _evaluateCapturedStateForReason:](WeakRetained, @"initial");
}

@end