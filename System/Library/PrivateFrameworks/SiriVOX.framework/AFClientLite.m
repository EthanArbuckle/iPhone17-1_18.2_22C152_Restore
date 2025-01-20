@interface AFClientLite
@end

@implementation AFClientLite

uint64_t __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

uint64_t __62__AFClientLite_SVXAceCommandHandling__handleAceCommand_reply___block_invoke_3(uint64_t result, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0) {
    return [*(id *)(result + 32) invokeWithValue:0];
  }
  return result;
}

@end