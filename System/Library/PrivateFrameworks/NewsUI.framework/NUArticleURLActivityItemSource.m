@interface NUArticleURLActivityItemSource
- (NSURL)articleURL;
- (NUArticleURLActivityItemSource)initWithHeadline:(id)a3 URLModifier:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)bodyStringForMailMessage;
@end

@implementation NUArticleURLActivityItemSource

- (NUArticleURLActivityItemSource)initWithHeadline:(id)a3 URLModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NUArticleURLActivityItemSource;
  v8 = [(NUArticleActivityItemSource *)&v23 initWithHeadline:v6];
  if (v8)
  {
    uint64_t v9 = [v6 articleID];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [v6 sourceChannel];
      int v12 = [v11 isPublic];

      if (v12)
      {
        v13 = NSURL;
        v14 = NSString;
        v15 = [v6 articleID];
        v16 = [v14 stringWithFormat:@"https://apple.news/%@", v15];
        v17 = [v13 URLWithString:v16];

        if (v7)
        {
          uint64_t v18 = [v7 modifyURL:v17];

          v17 = (NSURL *)v18;
        }
        articleURL = v8->_articleURL;
        v8->_articleURL = v17;
        goto LABEL_9;
      }
    }
    v20 = [v6 contentURL];

    if (v20)
    {
      uint64_t v21 = [v6 contentURL];
      articleURL = v8->_articleURL;
      v8->_articleURL = (NSURL *)v21;
LABEL_9:
    }
  }

  return v8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:*MEMORY[0x263F1CF98]] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.news.activity.OpenInSafari"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.news.activity.AddToSafariReadingList"])
  {
    id v6 = [(NUArticleActivityItemSource *)self headline];
    id v7 = [v6 contentURL];
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x263F1CFB8]]) {
      [(NUArticleURLActivityItemSource *)self bodyStringForMailMessage];
    }
    else {
    id v7 = [(NUArticleURLActivityItemSource *)self articleURL];
    }
  }

  return v7;
}

- (id)bodyStringForMailMessage
{
  v3 = objc_alloc_init(NUHTMLBuilder);
  v4 = [(NUArticleActivityItemSource *)self headline];
  id v5 = [v4 title];
  id v6 = [(NUHTMLBuilder *)v3 appendStrong:v5];

  id v7 = [(NUHTMLBuilder *)v3 appendBreak];
  v8 = [(NUArticleActivityItemSource *)self headline];
  uint64_t v9 = [v8 sourceName];
  id v10 = [(NUHTMLBuilder *)v3 appendText:v9];

  v11 = objc_alloc_init(NUHTMLBuilder);
  id v12 = [(NUHTMLBuilder *)v11 appendBreak];
  id v13 = [(NUHTMLBuilder *)v11 appendParagraph:v3];
  v14 = objc_alloc_init(NUHTMLBuilder);
  v15 = [(NUArticleActivityItemSource *)self headline];
  v16 = [v15 shortExcerpt];

  if (v16)
  {
    v17 = [(NUArticleActivityItemSource *)self headline];
    uint64_t v18 = [v17 shortExcerpt];
    id v19 = [(NUHTMLBuilder *)v14 appendText:v18];

    id v20 = [(NUHTMLBuilder *)v14 appendText:@" "];
  }
  uint64_t v21 = NUBundle();
  v22 = [v21 localizedStringForKey:@"Read the full story" value:&stru_26D495918 table:0];
  objc_super v23 = [(NUArticleURLActivityItemSource *)self articleURL];
  v24 = [v23 absoluteString];
  id v25 = [(NUHTMLBuilder *)v14 appendLink:v22 withURL:v24];

  id v26 = [(NUHTMLBuilder *)v11 appendParagraph:v14];
  v27 = [(NUArticleActivityItemSource *)self headline];
  v28 = [v27 sourceChannel];
  LODWORD(v22) = [v28 isPublic];

  if (v22)
  {
    v29 = objc_alloc_init(NUHTMLBuilder);
    v30 = objc_msgSend(NSURL, "nss_MarketingPageURL");
    v31 = [v30 absoluteString];

    id v32 = [(NUHTMLBuilder *)v29 appendBreak];
    v33 = NUBundle();
    v34 = [v33 localizedStringForKey:@"Shared from" value:&stru_26D495918 table:0];
    id v35 = [(NUHTMLBuilder *)v29 appendText:v34];

    id v36 = [(NUHTMLBuilder *)v29 appendText:@" "];
    v37 = NUBundle();
    v38 = [v37 localizedStringForKey:@"Apple News" value:&stru_26D495918 table:0];
    id v39 = [(NUHTMLBuilder *)v29 appendLink:v38 withURL:v31];

    id v40 = [(NUHTMLBuilder *)v11 appendParagraph:v29];
  }
  v41 = [(NUHTMLBuilder *)v11 fullHTML];

  return v41;
}

- (NSURL)articleURL
{
  return self->_articleURL;
}

- (void).cxx_destruct
{
}

@end