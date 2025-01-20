@interface ICAbstractAttachmentViewController
- (BOOL)forManualRendering;
- (BOOL)isInResponderChain;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (UIColor)highlightColor;
- (double)foregroundAlpha;
- (void)setForegroundAlpha:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
@end

@implementation ICAbstractAttachmentViewController

- (BOOL)isInResponderChain
{
  return self->_isInResponderChain;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);

  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end