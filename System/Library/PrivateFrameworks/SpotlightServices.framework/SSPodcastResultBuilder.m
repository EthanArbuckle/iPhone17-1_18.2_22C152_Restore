@interface SSPodcastResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (NSArray)authors;
- (NSDate)lastViewedDate;
- (NSString)name;
- (NSString)podcastDescription;
- (NSURL)imageURL;
- (SSPodcastResultBuilder)initWithResult:(id)a3;
- (id)buildCompactCardSection;
- (id)buildDescriptions;
- (id)buildInlineCardSection;
- (id)buildLastViewedString;
- (void)setAuthors:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setName:(id)a3;
- (void)setPodcastDescription:(id)a3;
@end

@implementation SSPodcastResultBuilder

+ (id)bundleId
{
  return @"com.apple.podcasts";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSPodcastResultBuilder;
  if (objc_msgSendSuper2(&v9, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 contentType];
    v7 = [a1 bundleId];
    char v5 = [v6 hasPrefix:v7];
  }
  return v5;
}

- (SSPodcastResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSPodcastResultBuilder;
  char v5 = [(SSResultBuilder *)&v12 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 lastUsedDate];
    [(SSPodcastResultBuilder *)v5 setLastViewedDate:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSPodcastResultBuilder *)v5 setName:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSPodcastResultBuilder *)v5 setPodcastDescription:v8];

    objc_super v9 = [v4 valueForAttribute:*MEMORY[0x1E4F22C70] withType:objc_opt_class()];
    [(SSPodcastResultBuilder *)v5 setImageURL:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22B30] withType:objc_opt_class()];
    [(SSPodcastResultBuilder *)v5 setAuthors:v10];
  }
  return v5;
}

- (id)buildLastViewedString
{
  v3 = [(SSPodcastResultBuilder *)self lastViewedDate];

  if (v3)
  {
    id v4 = +[SSDateFormatManager dateLastOpenedStringFormat];
    char v5 = NSString;
    v6 = [(SSPodcastResultBuilder *)self lastViewedDate];
    v7 = +[SSDateFormatManager dyanmicStringFromDate:v6];
    v8 = objc_msgSend(v5, "stringWithFormat:", v4, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)buildInlineCardSection
{
  v8.receiver = self;
  v8.super_class = (Class)SSPodcastResultBuilder;
  v3 = [(SSResultBuilder *)&v8 buildInlineCardSection];
  if ((SSSnippetModernizationEnabled() & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x1E4F9A378];
    char v5 = [(SSPodcastResultBuilder *)self buildLastViewedString];
    v6 = [v4 textWithString:v5];
    [v3 setFootnote:v6];
  }
  [v3 setPunchoutOptions:0];
  return v3;
}

- (id)buildCompactCardSection
{
  v10.receiver = self;
  v10.super_class = (Class)SSPodcastResultBuilder;
  v3 = [(SSResultBuilder *)&v10 buildCompactCardSection];
  id v4 = [v3 descriptions];
  char v5 = (void *)MEMORY[0x1E4F9A378];
  v6 = [(SSPodcastResultBuilder *)self buildLastViewedString];
  v7 = [v5 textWithString:v6];
  objc_super v8 = [v4 arrayByAddingObject:v7];
  [v3 setDescriptions:v8];

  return v3;
}

- (id)buildDescriptions
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSResultBuilder *)self result];
  id v4 = [v3 contentType];
  if ([v4 isEqualToString:@"com.apple.podcasts.show"]
    && ([(SSPodcastResultBuilder *)self authors], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    int v7 = SSSnippetModernizationEnabled();

    if (v7)
    {
      objc_super v8 = (void *)MEMORY[0x1E4F9A378];
      objc_super v9 = [(SSPodcastResultBuilder *)self authors];
      objc_super v10 = [v9 componentsJoinedByString:@", "];
      v11 = [v8 textWithString:v10];
      v15[0] = v11;
      objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

      goto LABEL_7;
    }
  }
  else
  {
  }
  v14.receiver = self;
  v14.super_class = (Class)SSPodcastResultBuilder;
  objc_super v12 = [(SSResultBuilder *)&v14 buildDescriptions];
LABEL_7:
  return v12;
}

- (NSDate)lastViewedDate
{
  return self->_lastViewedDate;
}

- (void)setLastViewedDate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)podcastDescription
{
  return self->_podcastDescription;
}

- (void)setPodcastDescription:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSArray)authors
{
  return self->_authors;
}

- (void)setAuthors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_podcastDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastViewedDate, 0);
}

@end