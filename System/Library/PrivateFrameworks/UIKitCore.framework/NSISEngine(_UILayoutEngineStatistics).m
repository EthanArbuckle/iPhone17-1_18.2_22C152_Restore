@interface NSISEngine(_UILayoutEngineStatistics)
- (BOOL)_UIKitEngineTrackingOn;
- (uint64_t)_UIKitRowCount;
- (void)_setUIKitEngineTrackingOn:()_UILayoutEngineStatistics;
@end

@implementation NSISEngine(_UILayoutEngineStatistics)

- (void)_setUIKitEngineTrackingOn:()_UILayoutEngineStatistics
{
  int v5 = [a1 _UIKitEngineTrackingOn];
  if (!a3 || (v5 & 1) != 0)
  {
    if (a3 & 1) != 0 || ((v5 ^ 1)) {
      return;
    }
    v7 = a1;
    v6 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC38];
    v7 = a1;
  }
  objc_setAssociatedObject(v7, &_UIKitEngineTrackingKey, v6, 0);
}

- (BOOL)_UIKitEngineTrackingOn
{
  return objc_getAssociatedObject(a1, &_UIKitEngineTrackingKey) != 0;
}

- (uint64_t)_UIKitRowCount
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NSISEngine__UILayoutEngineStatistics___UIKitRowCount__block_invoke;
  block[3] = &unk_1E52DC580;
  block[4] = a1;
  if (qword_1EB25A648 != -1) {
    dispatch_once(&qword_1EB25A648, block);
  }
  if (byte_1EB25A5B1) {
    return [a1 rowCount];
  }
  else {
    return 0;
  }
}

@end