@interface UILabel
- (void)applyParagraphStyle:(id)a3;
@end

@implementation UILabel

- (void)applyParagraphStyle:(id)a3
{
  if (a3)
  {
    if ([a3 definesProperty:86])
    {
      unsigned int v5 = [a3 intValueForProperty:86];
      if (v5 == 1) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = v5 == 2;
      }
      [(UILabel *)self setTextAlignment:v6];
    }
    -[UILabel setTextColor:](self, "setTextColor:", objc_msgSend(objc_msgSend(a3, "valueForProperty:", 18), "UIColor"));
    FontForStyle = (const void *)TSWPFastCreateFontForStyle();
    [(UILabel *)self setFont:TSWPUIFontForCTFont()];
    CFRelease(FontForStyle);
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UILabel(THAdditions) applyParagraphStyle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/UILabel-THAdditions.m") lineNumber:20 description:@"invalid nil value for '%s'", "paragraphStyle"];
  }
}

@end