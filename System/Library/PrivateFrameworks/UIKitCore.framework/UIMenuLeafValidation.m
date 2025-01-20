@interface UIMenuLeafValidation
@end

@implementation UIMenuLeafValidation

uint64_t __76___UIMenuLeafValidation_validatedCommandForTarget_command_alternate_sender___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) validateCommand:*(void *)(*(void *)(a1 + 40) + 8)];
}

@end