@interface WBSForYouLinkRecommendation
- (BOOL)prefersLeadImage;
- (CNContact)contact;
- (NSDate)lastSeenDate;
- (NSNumber)cachedScore;
- (NSSet)originalQueries;
- (NSString)badgeBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)footnote;
- (NSString)originalQueriesString;
- (NSString)secondarySourceIdentifier;
- (NSString)simplifiedURLString;
- (NSString)title;
- (NSURL)imageURL;
- (NSURL)pageURL;
- (NSUUID)uniqueIdentifier;
- (UIImage)appIcon;
- (UIImage)contactImage;
- (UIImage)image;
- (UIImage)sourceIcon;
- (WBSForYouLinkRecommendation)initWithTitle:(id)a3 url:(id)a4 lastSeenDate:(id)a5 source:(unint64_t)a6 topicSource:(unint64_t)a7;
- (id)sourceID;
- (unint64_t)source;
- (unint64_t)topicSource;
- (void)addOriginalQueries:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCachedScore:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactImage:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setSecondarySourceIdentifier:(id)a3;
- (void)setSourceID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicSource:(unint64_t)a3;
@end

@implementation WBSForYouLinkRecommendation

- (WBSForYouLinkRecommendation)initWithTitle:(id)a3 url:(id)a4 lastSeenDate:(id)a5 source:(unint64_t)a6 topicSource:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WBSForYouLinkRecommendation;
  v15 = [(WBSForYouLinkRecommendation *)&v24 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    title = v15->_title;
    v15->_title = (NSString *)v16;

    objc_storeStrong((id *)&v15->_pageURL, a4);
    uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_lastSeenDate, a5);
    v15->_source = a6;
    v15->_topicSource = a7;
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    originalQueries = v15->_originalQueries;
    v15->_originalQueries = (NSMutableSet *)v20;

    v22 = v15;
  }

  return v15;
}

- (NSString)simplifiedURLString
{
  simplifiedURLString = self->_simplifiedURLString;
  if (!simplifiedURLString)
  {
    v4 = [(NSURL *)self->_pageURL safari_simplifiedURLStringForDeduping];
    v5 = self->_simplifiedURLString;
    self->_simplifiedURLString = v4;

    simplifiedURLString = self->_simplifiedURLString;
  }
  return simplifiedURLString;
}

- (BOOL)prefersLeadImage
{
  unint64_t v2 = [(WBSForYouLinkRecommendation *)self source];
  return v2 == 2 || (v2 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (UIImage)appIcon
{
  appIcon = self->_appIcon;
  if (!appIcon)
  {
    v4 = [(WBSForYouLinkRecommendation *)self badgeBundleIdentifier];
    if ([v4 length])
    {
      v5 = (void *)MEMORY[0x1E4F42A80];
      v6 = [MEMORY[0x1E4F42D90] mainScreen];
      [v6 scale];
      objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 5);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v8 = self->_appIcon;
    self->_appIcon = v7;

    appIcon = self->_appIcon;
  }
  v9 = appIcon;
  return v9;
}

- (UIImage)sourceIcon
{
  contactImage = self->_contactImage;
  if (contactImage)
  {
    self = contactImage;
  }
  else
  {
    switch(self->_source)
    {
      case 0uLL:
        v3 = (void *)MEMORY[0x1E4F42A80];
        v4 = @"book";
        goto LABEL_9;
      case 1uLL:
        v3 = (void *)MEMORY[0x1E4F42A80];
        v4 = @"eyeglasses";
        goto LABEL_9;
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        v3 = (void *)MEMORY[0x1E4F42A80];
        v4 = @"clock";
        goto LABEL_9;
      case 3uLL:
        self = +[WBSImageUtilities handoffIconForDeviceType:self->_secondarySourceIdentifier];
        break;
      case 4uLL:
        v3 = (void *)MEMORY[0x1E4F42A80];
        v4 = @"icloud";
LABEL_9:
        self = [v3 systemImageNamed:v4];
        break;
      default:
        break;
    }
  }
  return (UIImage *)self;
}

- (NSString)badgeBundleIdentifier
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__WBSForYouLinkRecommendation_badgeBundleIdentifier__block_invoke;
  v5[3] = &unk_1E5E428E8;
  v5[4] = self;
  unint64_t v2 = (unsigned int (**)(void, void))MEMORY[0x1AD115160](v5, a2);
  if (((uint64_t (*)(void, __CFString *))v2[2])(v2, @"apple.news"))
  {
    v3 = @"com.apple.news";
  }
  else if (((unsigned int (**)(void, __CFString *))v2)[2](v2, @"maps.apple.com"))
  {
    v3 = @"com.apple.Maps";
  }
  else
  {
    v3 = 0;
  }

  return &v3->isa;
}

uint64_t __52__WBSForYouLinkRecommendation_badgeBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = a2;
  v4 = [v2 host];
  v5 = objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");
  v6 = [v5 lowercaseString];
  uint64_t v7 = [v6 isEqualToString:v3];

  return v7;
}

- (NSSet)originalQueries
{
  unint64_t v2 = (void *)[(NSMutableSet *)self->_originalQueries copy];
  return (NSSet *)v2;
}

- (NSString)originalQueriesString
{
  unint64_t v2 = [(NSMutableSet *)self->_originalQueries allObjects];
  id v3 = [v2 componentsJoinedByString:@", "];

  return (NSString *)v3;
}

- (void)addOriginalQueries:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (UIImage)contactImage
{
  return self->_contactImage;
}

- (void)setContactImage:(id)a3
{
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (id)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)secondarySourceIdentifier
{
  return self->_secondarySourceIdentifier;
}

- (void)setSecondarySourceIdentifier:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (unint64_t)topicSource
{
  return self->_topicSource;
}

- (void)setTopicSource:(unint64_t)a3
{
  self->_topicSource = a3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSNumber)cachedScore
{
  return self->_cachedScore;
}

- (void)setCachedScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScore, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_secondarySourceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_simplifiedURLString, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_originalQueries, 0);
}

@end