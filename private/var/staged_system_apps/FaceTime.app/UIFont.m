@interface UIFont
+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3;
+ (id)phPreferredBoldFontForTextStyle:(id)a3;
+ (id)phPreferredFontForTextStyle:(id)a3;
+ (id)phPreferredItalicFontForTextStyle:(id)a3;
+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3;
+ (id)preferredBoldFontWithTextStyle:(id)a3;
+ (id)preferredCaption1BoldFont;
+ (id)preferredCaption1Font;
+ (id)preferredFontWithTextStyle:(id)a3;
+ (id)preferredItalicFontWithTextStyle:(id)a3;
+ (id)preferredSubheadline1Font;
+ (id)preferredTightLeadingWithForTextStyle:(id)a3;
- (UIFont)withCaseSensitiveAttribute;
@end

@implementation UIFont

- (UIFont)withCaseSensitiveAttribute
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_1000A5F88;
  v11[1] = &off_1000A5FA0;
  v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v12 = v3;
  v4 = +[NSArray arrayWithObjects:&v12 count:1];
  v14 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  v6 = [(UIFont *)self fontDescriptor];
  v7 = [v6 fontDescriptorByAddingAttributes:v5];

  v8 = +[UIFont fontWithDescriptor:v7 size:0.0];

  return (UIFont *)v8;
}

+ (id)preferredCaption1Font
{
  return _[a1 preferredFontWithTextStyle:UIFontTextStyleCaption1];
}

+ (id)preferredCaption1BoldFont
{
  return _[a1 preferredBoldFontWithTextStyle:UIFontTextStyleCaption1];
}

+ (id)preferredSubheadline1Font
{
  return _[a1 preferredFontWithTextStyle:UIFontTextStyleSubheadline1];
}

+ (id)preferredFontWithTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)preferredBoldFontWithTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:2 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)preferredItalicFontWithTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:1 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)preferredTightLeadingWithForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0x8000 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredBoldFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:2];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredItalicFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:0x8000];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3
{
  v3 = +[UIFont _thinSystemFontOfSize:a3];
  v4 = [v3 withCaseSensitiveAttribute];

  return v4;
}

@end