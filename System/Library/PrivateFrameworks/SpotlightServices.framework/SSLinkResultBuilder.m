@interface SSLinkResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (NSArray)senderContactIdentifiers;
- (NSArray)senders;
- (NSString)websiteTitle;
- (NSURL)url;
- (SSLinkResultBuilder)initWithResult:(id)a3;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildThumbnail;
- (id)buildTitle;
- (id)subclassBuildHorizontallyScrollingCardSection;
- (unint64_t)syndicationStatus;
- (void)setSenderContactIdentifiers:(id)a3;
- (void)setSenders:(id)a3;
- (void)setSyndicationStatus:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setWebsiteTitle:(id)a3;
@end

@implementation SSLinkResultBuilder

+ (id)bundleId
{
  return @"com.apple.MobileSMS";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  v3 = [a3 sectionBundleIdentifier];
  char v4 = [v3 isEqual:@"com.apple.searchd.syndicatedLinks"];

  return v4;
}

- (SSLinkResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SSLinkResultBuilder;
  v5 = [(SSResultBuilder *)&v21 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22B30] withType:objc_opt_class()];
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22B10] withType:objc_opt_class()];
    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
    [(SSLinkResultBuilder *)v5 setWebsiteTitle:v8];

    v9 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v6;
    }
    else {
      v10 = 0;
    }
    [(SSLinkResultBuilder *)v5 setSenders:v10];

    v11 = [v7 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v7;
    }
    else {
      v12 = 0;
    }
    [(SSLinkResultBuilder *)v5 setSenderContactIdentifiers:v12];

    v13 = [v4 valueForAttribute:*MEMORY[0x1E4F235E8] withType:objc_opt_class()];
    -[SSLinkResultBuilder setSyndicationStatus:](v5, "setSyndicationStatus:", [v13 unsignedIntValue]);

    v14 = [v4 url];
    if (v14)
    {
      [(SSLinkResultBuilder *)v5 setUrl:v14];
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F1CB10];
      v16 = [v4 valueForAttribute:*MEMORY[0x1E4F23660] withType:objc_opt_class()];
      v17 = [v15 URLWithString:v16];
      [(SSLinkResultBuilder *)v5 setUrl:v17];
    }
    v18 = [(SSLinkResultBuilder *)v5 url];
    if (v18)
    {
      [(SSLinkResultBuilder *)v5 setUrl:v18];
    }
    else
    {
      v19 = [v4 valueForAttribute:*MEMORY[0x1E4F23660] withType:objc_opt_class()];
      [(SSLinkResultBuilder *)v5 setUrl:v19];
    }
  }

  return v5;
}

- (id)buildThumbnail
{
  v2 = objc_opt_new();
  [v2 setIconType:1];
  return v2;
}

- (id)buildTitle
{
  v2 = (void *)MEMORY[0x1E4F9A378];
  v3 = [(SSLinkResultBuilder *)self websiteTitle];
  id v4 = [v2 textWithString:v3];

  return v4;
}

- (id)buildDescriptions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"FROM_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
  v6 = [(SSLinkResultBuilder *)self senders];
  v7 = [v6 firstObject];
  v8 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);

  v9 = [MEMORY[0x1E4F9A378] textWithString:v8];
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

- (id)subclassBuildHorizontallyScrollingCardSection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(SSLinkResultBuilder *)self senderContactIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = objc_opt_new();
        [v10 setContactIdentifier:v9];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v11 = objc_opt_new();
  v12 = [(SSLinkResultBuilder *)self url];
  v13 = [v12 absoluteString];
  [v11 setUrl:v13];

  if ([v3 count]) {
    v14 = v3;
  }
  else {
    v14 = 0;
  }
  [v11 setPeopleToBadge:v14];
  v15 = [(SSResultBuilder *)self coreSpotlightId];
  [v11 setCoreSpotlightIdentifier:v15];

  objc_msgSend(v11, "setIsHighlighted:", -[SSLinkResultBuilder syndicationStatus](self, "syndicationStatus") == 2);
  return v11;
}

- (id)buildCommand
{
  v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x1E4F9A2F8];
  uint64_t v5 = [(SSLinkResultBuilder *)self url];
  uint64_t v6 = [v4 punchoutWithURL:v5];
  [v3 setPunchout:v6];

  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)websiteTitle
{
  return self->_websiteTitle;
}

- (void)setWebsiteTitle:(id)a3
{
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
}

- (NSArray)senderContactIdentifiers
{
  return self->_senderContactIdentifiers;
}

- (void)setSenderContactIdentifiers:(id)a3
{
}

- (unint64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (void)setSyndicationStatus:(unint64_t)a3
{
  self->_syndicationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_senders, 0);
  objc_storeStrong((id *)&self->_websiteTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end