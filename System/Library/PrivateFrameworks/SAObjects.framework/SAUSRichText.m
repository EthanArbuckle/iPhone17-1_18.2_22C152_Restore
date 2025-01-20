@interface SAUSRichText
+ (id)richText;
- (NSArray)markupList;
- (NSArray)moreGlyphs;
- (NSNumber)starRating;
- (NSNumber)textMaxlines;
- (NSString)contentAdvisory;
- (NSString)formattedTextDelimiter;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentAdvisory:(id)a3;
- (void)setFormattedTextDelimiter:(id)a3;
- (void)setMarkupList:(id)a3;
- (void)setMoreGlyphs:(id)a3;
- (void)setStarRating:(id)a3;
- (void)setTextMaxlines:(id)a3;
@end

@implementation SAUSRichText

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
}

- (id)encodedClassName
{
  return @"RichText";
}

+ (id)richText
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentAdvisory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentAdvisory"];
}

- (void)setContentAdvisory:(id)a3
{
}

- (NSString)formattedTextDelimiter
{
  return (NSString *)[(AceObject *)self propertyForKey:@"formattedTextDelimiter"];
}

- (void)setFormattedTextDelimiter:(id)a3
{
}

- (NSArray)markupList
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"markupList", &unk_1EFD80498);
}

- (void)setMarkupList:(id)a3
{
}

- (NSArray)moreGlyphs
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"moreGlyphs", v3);
}

- (void)setMoreGlyphs:(id)a3
{
}

- (NSNumber)starRating
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"starRating"];
}

- (void)setStarRating:(id)a3
{
}

- (NSNumber)textMaxlines
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"textMaxlines"];
}

- (void)setTextMaxlines:(id)a3
{
}

@end