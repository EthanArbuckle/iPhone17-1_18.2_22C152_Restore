@interface PKDynamicProvisioningPageContent
- (BOOL)isEmptyPage;
- (NSString)altPrimaryActionTitle;
- (NSString)altSubtitle;
- (NSString)body;
- (NSString)disclosureTitle;
- (NSString)footnote;
- (NSString)footnoteDisclosure;
- (NSString)heroImageURL;
- (NSString)identifier;
- (NSString)primaryActionIdentifier;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionIdentifier;
- (NSString)secondaryActionTitle;
- (NSString)subtitle;
- (NSString)title;
- (PKApplyActionContent)actionContent;
- (PKApplyFooterContent)footerContent;
- (PKDynamicProvisioningPageContent)initWithDictonary:(id)a3;
- (PKDynamicProvisioningPageContent)loadingPageContent;
- (PKDynamicProvisioningPageLearnMoreContent)learnMore;
- (PKDynamicProvisioningPageLearnMoreContent)secondaryActionItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)altSubtitleTimeInterval;
- (unint64_t)layout;
- (unint64_t)pageNumber;
- (unsigned)contentAlignment;
- (void)setActionContent:(id)a3;
- (void)setAltPrimaryActionTitle:(id)a3;
- (void)setAltSubtitle:(id)a3;
- (void)setAltSubtitleTimeInterval:(unint64_t)a3;
- (void)setBody:(id)a3;
- (void)setContentAlignment:(unsigned __int8)a3;
- (void)setDisclosureTitle:(id)a3;
- (void)setFooterContent:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteDisclosure:(id)a3;
- (void)setHeroImageURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setLearnMore:(id)a3;
- (void)setLoadingPageContent:(id)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setPrimaryActionIdentifier:(id)a3;
- (void)setPrimaryActionTitle:(id)a3;
- (void)setSecondaryActionIdentifier:(id)a3;
- (void)setSecondaryActionItem:(id)a3;
- (void)setSecondaryActionTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKDynamicProvisioningPageContent

- (PKDynamicProvisioningPageContent)initWithDictonary:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)PKDynamicProvisioningPageContent;
  v5 = [(PKDynamicProvisioningPageContent *)&v99 init];
  if (!v5) {
    goto LABEL_73;
  }
  v6 = [v4 PKStringForKey:@"identifier"];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = [v4 PKStringForKey:@"contextIdentifier"];
  }
  p_identifier = &v5->_identifier;
  identifier = v5->_identifier;
  v5->_identifier = v8;

  uint64_t v11 = [v4 PKStringForKey:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v11;

  if (!v5->_title)
  {
    uint64_t v13 = [v4 PKStringForKey:@"contextLocalizedTitle"];
    v14 = v5->_title;
    v5->_title = (NSString *)v13;

    if (!v5->_title)
    {
      uint64_t v15 = [v4 PKStringForKey:@"localizedTitle"];
      v16 = v5->_title;
      v5->_title = (NSString *)v15;
    }
  }
  uint64_t v17 = [v4 PKStringForKey:@"description"];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v17;

  if (!v5->_subtitle)
  {
    uint64_t v19 = [v4 PKStringForKey:@"contextLocalizedDescription"];
    v20 = v5->_subtitle;
    v5->_subtitle = (NSString *)v19;

    if (!v5->_subtitle)
    {
      uint64_t v21 = [v4 PKStringForKey:@"localizedDescription"];
      v22 = v5->_subtitle;
      v5->_subtitle = (NSString *)v21;
    }
  }
  uint64_t v23 = [v4 PKStringForKey:@"altDescription"];
  altSubtitle = v5->_altSubtitle;
  v5->_altSubtitle = (NSString *)v23;

  if (!v5->_altSubtitle)
  {
    uint64_t v25 = [v4 PKStringForKey:@"contextLocalizedAltDescription"];
    v26 = v5->_altSubtitle;
    v5->_altSubtitle = (NSString *)v25;

    if (!v5->_altSubtitle)
    {
      uint64_t v27 = [v4 PKStringForKey:@"localizedAltDescription"];
      v28 = v5->_altSubtitle;
      v5->_altSubtitle = (NSString *)v27;
    }
  }
  v5->_altSubtitleTimeInterval = [v4 PKIntegerForKey:@"contextAltDescriptionTimeInterval"];
  v29 = [v4 PKStringForKey:@"contentAlingment"];
  if ([v29 isEqualToString:@"natual"]) {
    char v30 = 4;
  }
  else {
    char v30 = 2;
  }
  v5->_contentAlignment = v30;
  v31 = [v4 PKStringForKey:@"body"];
  v32 = v31;
  if (v31)
  {
    v33 = v31;
  }
  else
  {
    v33 = [v4 PKStringForKey:@"contextLocalizedBody"];
  }
  body = v5->_body;
  v5->_body = v33;

  v35 = [v4 PKStringForKey:@"footnote"];
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    v37 = [v4 PKStringForKey:@"contextLocalizedFootnote"];
  }
  footnote = v5->_footnote;
  v5->_footnote = v37;

  v39 = [v4 PKStringForKey:@"footnoteDisclosure"];
  v40 = v39;
  if (v39)
  {
    v41 = v39;
  }
  else
  {
    v41 = [v4 PKStringForKey:@"contextLocalizedFootnoteDisclosure"];
  }
  footnoteDisclosure = v5->_footnoteDisclosure;
  v5->_footnoteDisclosure = v41;

  v43 = [v4 PKStringForKey:@"primaryActionTitle"];
  v44 = v43;
  if (v43)
  {
    v45 = v43;
  }
  else
  {
    v45 = [v4 PKStringForKey:@"contextLocalizedPrimaryActionTitle"];
  }
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = v45;

  v47 = [v4 PKStringForKey:@"altPrimaryActionTitle"];
  v48 = v47;
  if (v47)
  {
    v49 = v47;
  }
  else
  {
    v49 = [v4 PKStringForKey:@"contextLocalizedAltPrimaryActionTitle"];
  }
  altPrimaryActionTitle = v5->_altPrimaryActionTitle;
  v5->_altPrimaryActionTitle = v49;

  v51 = [v4 PKStringForKey:@"primaryActionIdentifier"];
  v52 = v51;
  if (v51)
  {
    v53 = v51;
  }
  else
  {
    v53 = [v4 PKStringForKey:@"contextPrimaryActionIdentifier"];
  }
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = v53;

  v55 = [v4 PKStringForKey:@"secondaryActionTitle"];
  v56 = v55;
  if (v55)
  {
    v57 = v55;
  }
  else
  {
    v57 = [v4 PKStringForKey:@"contextLocalizedSecondaryActionTitle"];
  }
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = v57;

  v59 = [v4 PKStringForKey:@"secondaryActionIdentifier"];
  v60 = v59;
  if (v59)
  {
    v61 = v59;
  }
  else
  {
    v61 = [v4 PKStringForKey:@"contextSecondaryActionIdentifier"];
  }
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = v61;

  v63 = [v4 PKStringForKey:@"disclosureTitle"];
  v64 = v63;
  if (v63)
  {
    v65 = v63;
  }
  else
  {
    v65 = [v4 PKStringForKey:@"contextDisclosureTitle"];
  }
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = v65;

  v67 = [v4 PKStringForKey:@"layout"];
  v68 = v67;
  if (v67 == @"default") {
    goto LABEL_47;
  }
  if (!v67) {
    goto LABEL_51;
  }
  char v69 = [(__CFString *)v67 isEqualToString:@"default"];

  if (v69)
  {
LABEL_47:
    uint64_t v70 = 1;
    goto LABEL_52;
  }
  v71 = v68;
  if (v71 == @"compact"
    || (v72 = v71,
        int v73 = [(__CFString *)v71 isEqualToString:@"compact"],
        v72,
        v73))
  {
    uint64_t v70 = 2;
  }
  else
  {
LABEL_51:
    uint64_t v70 = 0;
  }
LABEL_52:

  v5->_layout = v70;
  v74 = [v4 PKDictionaryForKey:@"heroImage"];
  if (v74
    || ([v4 PKDictionaryForKey:@"contextHeroImage"],
        (v74 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v75 = PKScreenScale();
    v76 = @"2x";
    if (v75 > 2.0) {
      v76 = @"3x";
    }
    v77 = v76;
    uint64_t v78 = [v74 PKStringForKey:v77];
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSString *)v78;

    if (!v5->_heroImageURL)
    {
      v80 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = *p_identifier;
        *(_DWORD *)buf = 138412546;
        v101 = v81;
        __int16 v102 = 2112;
        v103 = v77;
        _os_log_impl(&dword_190E10000, v80, OS_LOG_TYPE_DEFAULT, "No valid imageURL found for identifier: %@ with scale: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v74 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v98 = *p_identifier;
      *(_DWORD *)buf = 138412290;
      v101 = v98;
      _os_log_impl(&dword_190E10000, v74, OS_LOG_TYPE_DEFAULT, "No imageURLs specified for identifier: %@", buf, 0xCu);
    }
  }

  v82 = [v4 PKDictionaryForKey:@"learnMore"];
  if (v82
    || ([v4 PKDictionaryForKey:@"contextLearnMore"],
        (v82 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v83 = [[PKDynamicProvisioningPageLearnMoreContent alloc] initWithDictionary:v82];
    learnMore = v5->_learnMore;
    v5->_learnMore = v83;
  }
  v85 = [v4 PKDictionaryForKey:@"secondaryActionItem"];
  if (v85)
  {
    v86 = [[PKDynamicProvisioningPageLearnMoreContent alloc] initWithDictionary:v85];
    secondaryActionItem = v5->_secondaryActionItem;
    v5->_secondaryActionItem = v86;
  }
  v88 = [v4 PKDictionaryForKey:@"contextLoading"];
  if (v88)
  {
    v89 = [[PKDynamicProvisioningPageContent alloc] initWithDictonary:v88];
    loadingPageContent = v5->_loadingPageContent;
    v5->_loadingPageContent = v89;
  }
  v91 = [v4 PKDictionaryForKey:@"actionContent"];
  if ([v91 count])
  {
    v92 = [[PKApplyActionContent alloc] initWithDictionary:v91];
    actionContent = v5->_actionContent;
    v5->_actionContent = v92;
  }
  v94 = [v4 PKDictionaryForKey:@"footerContent"];
  if ([v94 count])
  {
    v95 = [[PKApplyFooterContent alloc] initWithDictionary:v94];
    footerContent = v5->_footerContent;
    v5->_footerContent = v95;
  }
LABEL_73:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKDynamicProvisioningPageContent allocWithZone:](PKDynamicProvisioningPageContent, "allocWithZone:") init];
  v5->_pageNumber = self->_pageNumber;
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_altSubtitle copyWithZone:a3];
  altSubtitle = v5->_altSubtitle;
  v5->_altSubtitle = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_body copyWithZone:a3];
  body = v5->_body;
  v5->_body = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_footnote copyWithZone:a3];
  footnote = v5->_footnote;
  v5->_footnote = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_footnoteDisclosure copyWithZone:a3];
  footnoteDisclosure = v5->_footnoteDisclosure;
  v5->_footnoteDisclosure = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_primaryActionTitle copyWithZone:a3];
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_altPrimaryActionTitle copyWithZone:a3];
  altPrimaryActionTitle = v5->_altPrimaryActionTitle;
  v5->_altPrimaryActionTitle = (NSString *)v22;

  uint64_t v24 = [(NSString *)self->_primaryActionIdentifier copyWithZone:a3];
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = (NSString *)v24;

  uint64_t v26 = [(NSString *)self->_secondaryActionTitle copyWithZone:a3];
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v26;

  uint64_t v28 = [(NSString *)self->_secondaryActionIdentifier copyWithZone:a3];
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = (NSString *)v28;

  uint64_t v30 = [(NSString *)self->_disclosureTitle copyWithZone:a3];
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = (NSString *)v30;

  v32 = [(PKDynamicProvisioningPageLearnMoreContent *)self->_learnMore copyWithZone:a3];
  learnMore = v5->_learnMore;
  v5->_learnMore = v32;

  v34 = [(PKDynamicProvisioningPageLearnMoreContent *)self->_secondaryActionItem copyWithZone:a3];
  secondaryActionItem = v5->_secondaryActionItem;
  v5->_secondaryActionItem = v34;

  uint64_t v36 = [(NSString *)self->_heroImageURL copyWithZone:a3];
  heroImageURL = v5->_heroImageURL;
  v5->_heroImageURL = (NSString *)v36;

  v38 = [(PKApplyFooterContent *)self->_footerContent copyWithZone:a3];
  footerContent = v5->_footerContent;
  v5->_footerContent = v38;

  v40 = [(PKApplyActionContent *)self->_actionContent copyWithZone:a3];
  actionContent = v5->_actionContent;
  v5->_actionContent = v40;

  v42 = [(PKDynamicProvisioningPageContent *)self->_loadingPageContent copyWithZone:a3];
  loadingPageContent = v5->_loadingPageContent;
  v5->_loadingPageContent = v42;

  v5->_contentAlignment = self->_contentAlignment;
  v5->_layout = self->_layout;
  v5->_altSubtitleTimeInterval = self->_altSubtitleTimeInterval;
  return v5;
}

- (BOOL)isEmptyPage
{
  return !self->_title && !self->_subtitle && self->_body == 0;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)altSubtitle
{
  return self->_altSubtitle;
}

- (void)setAltSubtitle:(id)a3
{
}

- (unint64_t)altSubtitleTimeInterval
{
  return self->_altSubtitleTimeInterval;
}

- (void)setAltSubtitleTimeInterval:(unint64_t)a3
{
  self->_altSubtitleTimeInterval = a3;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (NSString)footnoteDisclosure
{
  return self->_footnoteDisclosure;
}

- (void)setFootnoteDisclosure:(id)a3
{
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionTitle:(id)a3
{
}

- (NSString)altPrimaryActionTitle
{
  return self->_altPrimaryActionTitle;
}

- (void)setAltPrimaryActionTitle:(id)a3
{
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (void)setPrimaryActionIdentifier:(id)a3
{
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionTitle:(id)a3
{
}

- (NSString)secondaryActionIdentifier
{
  return self->_secondaryActionIdentifier;
}

- (void)setSecondaryActionIdentifier:(id)a3
{
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (void)setDisclosureTitle:(id)a3
{
}

- (NSString)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
}

- (PKDynamicProvisioningPageLearnMoreContent)learnMore
{
  return self->_learnMore;
}

- (void)setLearnMore:(id)a3
{
}

- (PKDynamicProvisioningPageLearnMoreContent)secondaryActionItem
{
  return self->_secondaryActionItem;
}

- (void)setSecondaryActionItem:(id)a3
{
}

- (PKDynamicProvisioningPageContent)loadingPageContent
{
  return self->_loadingPageContent;
}

- (void)setLoadingPageContent:(id)a3
{
}

- (PKApplyActionContent)actionContent
{
  return self->_actionContent;
}

- (void)setActionContent:(id)a3
{
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (unsigned)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(unsigned __int8)a3
{
  self->_contentAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_actionContent, 0);
  objc_storeStrong((id *)&self->_loadingPageContent, 0);
  objc_storeStrong((id *)&self->_secondaryActionItem, 0);
  objc_storeStrong((id *)&self->_learnMore, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_storeStrong((id *)&self->_secondaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_altPrimaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_footnoteDisclosure, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_altSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end