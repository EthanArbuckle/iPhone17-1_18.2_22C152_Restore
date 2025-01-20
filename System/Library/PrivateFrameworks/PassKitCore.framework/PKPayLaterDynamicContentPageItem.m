@interface PKPayLaterDynamicContentPageItem
- (NSArray)sections;
- (NSArray)systemImageColors;
- (NSString)altContentSubtitle;
- (NSString)contentDetailLeading;
- (NSString)contentDetailSubtitleLeading;
- (NSString)contentDetailTrailing;
- (NSString)contentSubtitle;
- (NSString)contentTitle;
- (NSString)errorTitle;
- (NSString)identifier;
- (NSString)linkText;
- (NSString)systemImageName;
- (NSURL)linkURL;
- (PKApplyFooterContent)altFooterContent;
- (PKApplyFooterContent)footerContent;
- (PKPayLaterDynamicContentPageItem)initWithDictionary:(id)a3;
- (id)description;
- (void)setAltContentSubtitle:(id)a3;
- (void)setAltFooterContent:(id)a3;
- (void)setContentDetailLeading:(id)a3;
- (void)setContentDetailSubtitleLeading:(id)a3;
- (void)setContentDetailTrailing:(id)a3;
- (void)setContentSubtitle:(id)a3;
- (void)setContentTitle:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setFooterContent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLinkText:(id)a3;
- (void)setLinkURL:(id)a3;
- (void)setSections:(id)a3;
- (void)setSystemImageColors:(id)a3;
- (void)setSystemImageName:(id)a3;
@end

@implementation PKPayLaterDynamicContentPageItem

- (PKPayLaterDynamicContentPageItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 PKStringForKey:@"identifier"];
  id v27 = [v4 PKStringForKey:@"contentTitle"];
  id v26 = [v4 PKStringForKey:@"contentSubtitle"];
  id v25 = [v4 PKStringForKey:@"contentDetailLeading"];
  id v24 = [v4 PKStringForKey:@"contentDetailSubtitleLeading"];
  id v23 = [v4 PKStringForKey:@"contentDetailTrailing"];
  id v22 = [v4 PKStringForKey:@"systemImage"];
  id v18 = [v4 PKArrayContaining:objc_opt_class() forKey:@"systemImageColors"];
  id v21 = [v4 PKStringForKey:@"linkText"];
  id v20 = [v4 PKURLForKey:@"linkURL"];
  v17 = [v4 PKArrayContaining:objc_opt_class() forKey:@"sections"];
  v6 = objc_msgSend(v17, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_357);
  v7 = [v4 PKStringForKey:@"errorTitle"];
  v8 = [v4 PKStringForKey:@"altContentSubtitle"];
  v9 = [v4 PKDictionaryForKey:@"footerContent"];
  if ([v9 count]) {
    v10 = [[PKApplyFooterContent alloc] initWithDictionary:v9];
  }
  else {
    v10 = 0;
  }
  v11 = [v4 PKDictionaryForKey:@"altFooterContent"];
  if ([v11 count]) {
    v12 = [[PKApplyFooterContent alloc] initWithDictionary:v11];
  }
  else {
    v12 = 0;
  }
  id obj = (id)v5;
  if (v5 || v27 || v26 || v25 || v24 || v23 || v22 || v21 || v20 || [v6 count] || v7 || v8 || v10 || v12)
  {
    v28.receiver = self;
    v28.super_class = (Class)PKPayLaterDynamicContentPageItem;
    v14 = [(PKPayLaterDynamicContentPageItem *)&v28 init];
    p_isa = (id *)&v14->super.isa;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_identifier, obj);
      objc_storeStrong(p_isa + 2, v27);
      objc_storeStrong(p_isa + 3, v26);
      objc_storeStrong(p_isa + 4, v25);
      objc_storeStrong(p_isa + 5, v24);
      objc_storeStrong(p_isa + 6, v23);
      objc_storeStrong(p_isa + 9, v22);
      objc_storeStrong(p_isa + 10, v18);
      objc_storeStrong(p_isa + 7, v21);
      objc_storeStrong(p_isa + 8, v20);
      objc_storeStrong(p_isa + 11, v6);
      objc_storeStrong(p_isa + 12, v7);
      objc_storeStrong(p_isa + 13, v8);
      objc_storeStrong(p_isa + 14, v10);
      objc_storeStrong(p_isa + 15, v12);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

PKPayLaterDynamicContentSection *__55__PKPayLaterDynamicContentPageItem_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPayLaterDynamicContentSection alloc] initWithDictionary:v2];

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_identifier) {
    [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  }
  if (self->_contentTitle) {
    [v4 appendFormat:@"contentTitle: '%@'; ", self->_contentTitle];
  }
  if (self->_contentSubtitle) {
    [v4 appendFormat:@"contentSubtitle: '%@'; ", self->_contentSubtitle];
  }
  if (self->_contentDetailLeading) {
    [v4 appendFormat:@"contentDetailLeading: '%@'; ", self->_contentDetailLeading];
  }
  if (self->_contentDetailSubtitleLeading) {
    objc_msgSend(v4, "appendFormat:", @"contentDetailSubtitleLeading: '%@'; ",
  }
      self->_contentDetailSubtitleLeading);
  if (self->_contentDetailTrailing) {
    [v4 appendFormat:@"contentDetailTrailing: '%@'; ", self->_contentDetailTrailing];
  }
  if (self->_systemImageName) {
    [v4 appendFormat:@"systemImage: '%@'; ", self->_systemImageName];
  }
  if (self->_systemImageColors) {
    [v4 appendFormat:@"systemImageColors: '%@'; ", self->_systemImageColors];
  }
  if (self->_linkText) {
    [v4 appendFormat:@"linkText: '%@'; ", self->_linkText];
  }
  if (self->_linkURL) {
    [v4 appendFormat:@"linkURL: '%@'; ", self->_linkURL];
  }
  if (self->_sections) {
    [v4 appendFormat:@"sections: '%@'; ", self->_sections];
  }
  if (self->_errorTitle) {
    [v4 appendFormat:@"errorTitle: '%@'; ", self->_errorTitle];
  }
  if (self->_altContentSubtitle) {
    [v4 appendFormat:@"altContentSubtitle: '%@'; ", self->_altContentSubtitle];
  }
  if (self->_footerContent) {
    [v4 appendFormat:@"footerContent: '%@'; ", self->_footerContent];
  }
  if (self->_altFooterContent) {
    [v4 appendFormat:@"altFooterContent: '%@'; ", self->_altFooterContent];
  }
  [v4 appendFormat:@">"];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
}

- (NSString)contentSubtitle
{
  return self->_contentSubtitle;
}

- (void)setContentSubtitle:(id)a3
{
}

- (NSString)contentDetailLeading
{
  return self->_contentDetailLeading;
}

- (void)setContentDetailLeading:(id)a3
{
}

- (NSString)contentDetailSubtitleLeading
{
  return self->_contentDetailSubtitleLeading;
}

- (void)setContentDetailSubtitleLeading:(id)a3
{
}

- (NSString)contentDetailTrailing
{
  return self->_contentDetailTrailing;
}

- (void)setContentDetailTrailing:(id)a3
{
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSArray)systemImageColors
{
  return self->_systemImageColors;
}

- (void)setSystemImageColors:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
}

- (NSString)altContentSubtitle
{
  return self->_altContentSubtitle;
}

- (void)setAltContentSubtitle:(id)a3
{
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
}

- (PKApplyFooterContent)altFooterContent
{
  return self->_altFooterContent;
}

- (void)setAltFooterContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altFooterContent, 0);
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_altContentSubtitle, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_systemImageColors, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_contentDetailTrailing, 0);
  objc_storeStrong((id *)&self->_contentDetailSubtitleLeading, 0);
  objc_storeStrong((id *)&self->_contentDetailLeading, 0);
  objc_storeStrong((id *)&self->_contentSubtitle, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end