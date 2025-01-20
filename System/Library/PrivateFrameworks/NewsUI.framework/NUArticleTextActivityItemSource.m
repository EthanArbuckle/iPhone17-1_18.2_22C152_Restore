@interface NUArticleTextActivityItemSource
- (NSString)itemTitle;
- (NUArticleTextActivityItemSource)initWithHeadline:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
@end

@implementation NUArticleTextActivityItemSource

- (NUArticleTextActivityItemSource)initWithHeadline:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUArticleTextActivityItemSource;
  v5 = [(NUArticleActivityItemSource *)&v18 initWithHeadline:v4];
  if (v5)
  {
    uint64_t v6 = [v4 title];
    if (v6
      && (v7 = (void *)v6,
          [v4 sourceName],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      v9 = NSString;
      v10 = [v4 title];
      v11 = [v4 sourceName];
      uint64_t v12 = [v9 stringWithFormat:@"%@ - %@", v10, v11];
      itemTitle = v5->_itemTitle;
      v5->_itemTitle = (NSString *)v12;
    }
    else
    {
      v14 = [v4 title];

      if (v14)
      {
        uint64_t v15 = [v4 title];
      }
      else
      {
        v16 = [v4 sourceName];

        if (!v16)
        {
          v10 = v5->_itemTitle;
          v5->_itemTitle = (NSString *)&stru_26D495918;
          goto LABEL_10;
        }
        uint64_t v15 = [v4 sourceName];
      }
      v10 = v5->_itemTitle;
      v5->_itemTitle = (NSString *)v15;
    }
LABEL_10:
  }
  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:*MEMORY[0x263F1CFC8]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x263F1CFB0]] & 1) != 0)
  {
    uint64_t v6 = 0;
  }
  else if (([v5 isEqualToString:*MEMORY[0x263F1CFD8]] & 1) != 0 {
         || ([v5 isEqualToString:*MEMORY[0x263F1CFB8]] & 1) != 0)
  }
  {
    uint64_t v6 = &stru_26D495918;
  }
  else if ([v5 isEqualToString:@"com.apple.mobilenotes.SharingExtension"])
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    v9 = [(NUArticleTextActivityItemSource *)self itemTitle];

    if (v9)
    {
      v10 = [(NUArticleTextActivityItemSource *)self itemTitle];
      [v8 setObject:v10 forKeyedSubscript:@"article-title"];
    }
    v11 = [(NUArticleActivityItemSource *)self headline];
    uint64_t v12 = [v11 shortExcerpt];

    if (v12)
    {
      v13 = [(NUArticleActivityItemSource *)self headline];
      v14 = [v13 shortExcerpt];
      [v8 setObject:v14 forKeyedSubscript:@"article-summary"];
    }
    uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v6 = [(NUArticleTextActivityItemSource *)self itemTitle];
  }

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if ([a4 isEqualToString:@"com.apple.mobilenotes.SharingExtension"]) {
    return @"com.apple.news.notes-metadata";
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NUArticleTextActivityItemSource activityViewController:dataTypeIdentifierForActivityType:]();
  }
  return &stru_26D495918;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(NUArticleTextActivityItemSource *)self itemTitle];
  int v7 = [v5 isEqualToString:*MEMORY[0x263F1CFB8]];

  if (v7)
  {
    v8 = [(NUArticleActivityItemSource *)self headline];
    uint64_t v9 = [v8 title];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [(NUArticleActivityItemSource *)self headline];
      uint64_t v12 = [v11 sourceName];

      if (!v12) {
        goto LABEL_6;
      }
      v13 = NSString;
      v8 = [(NUArticleActivityItemSource *)self headline];
      v14 = [v8 sourceName];
      uint64_t v15 = [(NUArticleActivityItemSource *)self headline];
      v16 = [v15 title];
      uint64_t v17 = [v13 stringWithFormat:@"%@: %@", v14, v16];

      uint64_t v6 = (void *)v17;
    }
  }
LABEL_6:

  return v6;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void).cxx_destruct
{
}

- (void)activityViewController:dataTypeIdentifierForActivityType:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"case not implemented"];
  int v1 = 136315906;
  v2 = "-[NUArticleTextActivityItemSource activityViewController:dataTypeIdentifierForActivityType:]";
  __int16 v3 = 2080;
  id v4 = "NUArticleTextActivityItemSource.m";
  __int16 v5 = 1024;
  int v6 = 86;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2221C5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end