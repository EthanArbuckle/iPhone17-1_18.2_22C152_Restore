@interface SXDebugComponentSizer
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXDebugComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  [(SXComponentSizer *)self suggestedSize];
  return v4;
}

@end