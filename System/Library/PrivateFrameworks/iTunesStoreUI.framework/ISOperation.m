@interface ISOperation
@end

@implementation ISOperation

void __52__ISOperation_SUScriptPost__sendCompletionCallback___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) success];
  v5 = (void *)MEMORY[0x263EFFB40];
  if (!v4) {
    v5 = (void *)MEMORY[0x263EFFB38];
  }
  id v6 = (id)objc_msgSend(v2, "initWithObjects:", v3, *v5, 0);
  [*(id *)(a1 + 32) callWebScriptMethod:@"call" withArguments:v6];
}

@end