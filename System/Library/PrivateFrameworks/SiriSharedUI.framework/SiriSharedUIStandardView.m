@interface SiriSharedUIStandardView
- (BOOL)isSemanticContentAttributeRightToLeft;
@end

@implementation SiriSharedUIStandardView

- (BOOL)isSemanticContentAttributeRightToLeft
{
  return [(SiriSharedUIStandardView *)self semanticContentAttribute] == 4;
}

@end