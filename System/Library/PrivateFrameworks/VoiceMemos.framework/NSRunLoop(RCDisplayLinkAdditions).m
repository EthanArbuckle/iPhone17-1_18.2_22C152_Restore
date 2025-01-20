@interface NSRunLoop(RCDisplayLinkAdditions)
- (uint64_t)rc_runUntilNextDisplayLinkEventWithTimeout:()RCDisplayLinkAdditions;
@end

@implementation NSRunLoop(RCDisplayLinkAdditions)

- (uint64_t)rc_runUntilNextDisplayLinkEventWithTimeout:()RCDisplayLinkAdditions
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NSRunLoop_RCDisplayLinkAdditions__rc_runUntilNextDisplayLinkEventWithTimeout___block_invoke;
  v9[3] = &unk_1E6497968;
  v9[4] = &v10;
  id v4 = (id)objc_msgSend(MEMORY[0x1E4F39B68], "rc_displayWithFramesPerSecond:handlerBlock:", 0, v9);
  [v4 addToRunLoop:a1 forMode:*MEMORY[0x1E4F1C4B0]];
  double Current = CFAbsoluteTimeGetCurrent();
  do
  {
    objc_msgSend(a1, "runUntilDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 0.05));
    if (*((unsigned char *)v11 + 24)) {
      break;
    }
    double v6 = CFAbsoluteTimeGetCurrent();
  }
  while (a2 < 0.0 || v6 - Current <= a2);
  [v4 invalidate];

  uint64_t v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

@end