@interface _UIRevealGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UIRevealGestureRecognizer

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIRevealGestureRecognizer;
    [(UIGestureRecognizer *)&v5 setDelegate:v4];
  }
  else if (dyld_program_sdk_at_least())
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You cannot change the delegate of the UIViewControllerPreviewing failure relationship gesture recognizer"];
  }
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 1 || (a3 & 0xFFFFFFFFFFFFFFFBLL) == 11;
}

@end