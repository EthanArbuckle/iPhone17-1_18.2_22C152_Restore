@interface UIView(SBUIAdditions)
- (void)sbui_drawEagerly;
@end

@implementation UIView(SBUIAdditions)

- (void)sbui_drawEagerly
{
  v2 = objc_getAssociatedObject(a1, "hasDrawn");

  if (!v2)
  {
    objc_setAssociatedObject(a1, "hasDrawn", (id)*MEMORY[0x263EFFB40], 0);
    Current = CFRunLoopGetCurrent();
    v4 = (const void *)*MEMORY[0x263EFFE88];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__UIView_SBUIAdditions__sbui_drawEagerly__block_invoke;
    block[3] = &unk_2645D3CD0;
    block[4] = a1;
    CFRunLoopPerformBlock(Current, v4, block);
  }
}

@end