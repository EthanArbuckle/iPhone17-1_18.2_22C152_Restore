@interface MailActionRecategorizationHeaderCell
+ (id)reusableIdentifier;
- (void)setCardAction:(id)a3;
@end

@implementation MailActionRecategorizationHeaderCell

+ (id)reusableIdentifier
{
  return @"MailActionRecategorizationHeaderCell";
}

- (void)setCardAction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailActionRecategorizationHeaderCell;
  [(MailActionCell *)&v8 setCardAction:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isExpanded]) {
      +[UIImage systemImageNamed:MFImageGlyphDownArrow];
    }
    else {
    v6 = +[UIImage systemImageNamed:MFImageGlyphSeeMore];
    }
    v7 = [(MailActionCell *)self imageView];
    [v7 setImage:v6];
  }
}

@end