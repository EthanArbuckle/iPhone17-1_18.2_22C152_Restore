@interface OBPrivacyCombinedFooterComponents
+ (NSString)linkPlaceholder;
- (NSString)linkText;
- (NSString)linkURLString;
- (NSString)text;
- (void)setLinkText:(id)a3;
- (void)setLinkURLString:(id)a3;
- (void)setText:(id)a3;
@end

@implementation OBPrivacyCombinedFooterComponents

+ (NSString)linkPlaceholder
{
  return (NSString *)@"%@";
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
}

- (NSString)linkURLString
{
  return self->_linkURLString;
}

- (void)setLinkURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURLString, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end