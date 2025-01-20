@interface SBSwitcherAppSuggestionContentView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityIdentifier;
@end

@implementation SBSwitcherAppSuggestionContentView

- (id)accessibilityIdentifier
{
  return @"handoff-banner";
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(SBSwitcherAppSuggestionContentView *)self subviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) frame];
        v17.CGFloat x = x;
        v17.CGFloat y = y;
        if (CGRectContainsPoint(v18, v17))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end