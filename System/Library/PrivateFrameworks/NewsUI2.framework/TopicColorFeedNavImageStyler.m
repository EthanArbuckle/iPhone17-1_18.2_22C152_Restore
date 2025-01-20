@interface TopicColorFeedNavImageStyler
- (UIFont)tagTitleFont;
- (double)cornerRadius;
- (double)padding;
- (id)tagColorFor:(id)a3;
@end

@implementation TopicColorFeedNavImageStyler

- (UIFont)tagTitleFont
{
  id v2 = objc_msgSend(*(id *)self->feedNavImageStyler, sel_tagTitleFont);
  return (UIFont *)v2;
}

- (id)tagColorFor:(id)a3
{
  return *(id *)self->tagColor;
}

- (double)cornerRadius
{
  objc_msgSend(*(id *)self->feedNavImageStyler, sel_cornerRadius);
  return result;
}

- (double)padding
{
  objc_msgSend(*(id *)self->feedNavImageStyler, sel_padding);
  return result;
}

@end