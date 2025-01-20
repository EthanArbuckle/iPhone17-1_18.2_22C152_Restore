@interface UILabel
+ (void)crlaxTurnOnButtonShapeUnderlines:(id)a3;
- (void)crl_setTextAllowingHyphenation:(id)a3;
@end

@implementation UILabel

+ (void)crlaxTurnOnButtonShapeUnderlines:(id)a3
{
}

- (void)crl_setTextAllowingHyphenation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    LODWORD(v6) = 1036831949;
    [v5 setHyphenationFactor:v6];
    [v5 setAlignment:[self textAlignment]];
    [v5 setAllowsDefaultTighteningForTruncation:[self allowsDefaultTighteningForTruncation]];
    [v5 setLineBreakMode:[self lineBreakMode]];
    id v7 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v10 = NSParagraphStyleAttributeName;
    id v11 = v5;
    v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v9 = [v7 initWithString:v4 attributes:v8];
  }
  else
  {
    id v9 = 0;
  }
  [(UILabel *)self setAttributedText:v9];
}

@end