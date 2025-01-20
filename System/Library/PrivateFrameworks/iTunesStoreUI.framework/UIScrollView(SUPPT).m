@interface UIScrollView(SUPPT)
- (uint64_t)_testingScrollStep;
- (uint64_t)runScrollTest:()SUPPT withDelta:forIterations:;
- (uint64_t)scrollBy:()SUPPT forIterations:;
@end

@implementation UIScrollView(SUPPT)

- (uint64_t)_testingScrollStep
{
  [a1 contentOffset];
  double v5 = v4;
  LODWORD(v6) = __TestingScrollYDelta;
  if (*(float *)&__TestingScrollYDelta > 0.0
    && (objc_msgSend(a1, "bounds", v6),
        double v8 = v5 + v7 + *(float *)&__TestingScrollYDelta,
        [a1 contentSize],
        LODWORD(v6) = __TestingScrollYDelta,
        v8 > v9)
    || *(float *)&v6 < 0.0 && v5 + *(float *)&v6 < 0.0)
  {
    *(float *)&double v6 = -*(float *)&v6;
    __TestingScrollYDelta = LODWORD(v6);
    --__TestingScrollIterationsLeft;
  }
  objc_msgSend(a1, "setContentOffset:animated:", 0, 0.0, v5 + *(float *)&v6);
  if (__TestingScrollIterationsLeft)
  {
    return [a1 performSelector:a2 withObject:0 afterDelay:0.0];
  }
  else
  {
    v11 = (void *)[MEMORY[0x263F1C408] sharedApplication];
    return [v11 endCurrentPPT];
  }
}

- (uint64_t)scrollBy:()SUPPT forIterations:
{
  __TestingScrollYDelta = LODWORD(a4);
  __TestingScrollIterationsLeft = a3;
  return [a1 _testingScrollStep];
}

- (uint64_t)runScrollTest:()SUPPT withDelta:forIterations:
{
  double v9 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  [v9 beginPPTWithName:a4];
  [v9 startedTest:__CurrentTestName];
  *(float *)&double v10 = a2;

  return [a1 scrollBy:a5 forIterations:v10];
}

@end