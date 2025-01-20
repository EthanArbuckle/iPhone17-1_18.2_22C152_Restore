@interface __NSTextLayoutFragmentForGap
- (BOOL)_isEnumerationGap;
- (unint64_t)state;
- (void)setLayoutFragmentFrame:(CGRect)a3;
@end

@implementation __NSTextLayoutFragmentForGap

- (BOOL)_isEnumerationGap
{
  return 1;
}

- (unint64_t)state
{
  return 3;
}

- (void)setLayoutFragmentFrame:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v5.receiver = self;
  v5.super_class = (Class)__NSTextLayoutFragmentForGap;
  -[NSTextLayoutFragment setLayoutFragmentFrame:](&v5, sel_setLayoutFragmentFrame_, a3.origin.x, a3.origin.y, v3, v4);
}

@end