@interface VOSProfileCommand
@end

@implementation VOSProfileCommand

BOOL __53___VOSProfileCommand_secondaryCommandsForPressCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pressCount] == *(void *)(a1 + 32);
}

@end