@interface UIPrintPanelWindow
- (BOOL)_includeInDefaultImageSnapshot;
- (id)_roleHint;
@end

@implementation UIPrintPanelWindow

- (BOOL)_includeInDefaultImageSnapshot
{
  return 1;
}

- (id)_roleHint
{
  return (id)*MEMORY[0x1E4FB3350];
}

@end