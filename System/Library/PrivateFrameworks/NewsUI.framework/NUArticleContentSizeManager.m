@interface NUArticleContentSizeManager
- (FCTagSettings)tagSettings;
- (NUArticleContentSizeManager)initWithTagSettings:(id)a3;
- (id)contentSizeCategoryForArticle:(id)a3;
- (id)contentSizeCategoryForSize:(int64_t)a3;
- (int64_t)contentScaleForArticle:(id)a3;
- (int64_t)textSizeForContentSizeCategory:(id)a3;
- (void)updateContentScale:(int64_t)a3 forArticle:(id)a4;
- (void)updateContentSizeCategory:(id)a3 forArticle:(id)a4;
@end

@implementation NUArticleContentSizeManager

- (NUArticleContentSizeManager)initWithTagSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUArticleContentSizeManager;
  v6 = [(NUArticleContentSizeManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tagSettings, a3);
  }

  return v7;
}

- (id)contentSizeCategoryForArticle:(id)a3
{
  id v4 = a3;
  if ([v4 role] == 2)
  {
    id v5 = 0;
  }
  else
  {
    v6 = [v4 sourceChannel];
    if (v6)
    {
      v7 = [(NUArticleContentSizeManager *)self tagSettings];
      v8 = [v6 identifier];
      objc_super v9 = [v7 fontSizeForTagID:v8];

      if (v9)
      {
        id v5 = -[NUArticleContentSizeManager contentSizeCategoryForSize:](self, "contentSizeCategoryForSize:", [v9 integerValue]);
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)updateContentSizeCategory:(id)a3 forArticle:(id)a4
{
  id v13 = a3;
  v6 = [a4 sourceChannel];
  if (v6)
  {
    int64_t v7 = [(NUArticleContentSizeManager *)self textSizeForContentSizeCategory:v13];
    v8 = [(NUArticleContentSizeManager *)self tagSettings];
    objc_super v9 = [v6 identifier];
    v10 = [NSNumber numberWithInteger:v7];
    [v8 setFontSizeForTagID:v9 fontSize:v10];

    v11 = [(NUArticleContentSizeManager *)self tagSettings];
    v12 = [v6 identifier];
    [v11 syncForTagID:v12];
  }
}

- (int64_t)contentScaleForArticle:(id)a3
{
  id v4 = a3;
  if ([v4 role] == 2)
  {
    int64_t v5 = 0;
  }
  else
  {
    v6 = [v4 sourceChannel];
    if (v6)
    {
      int64_t v7 = [(NUArticleContentSizeManager *)self tagSettings];
      v8 = [v6 identifier];
      objc_super v9 = [v7 contentScaleForTagID:v8];
      int64_t v5 = [v9 unsignedIntegerValue];
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  return v5;
}

- (void)updateContentScale:(int64_t)a3 forArticle:(id)a4
{
  id v11 = [a4 sourceChannel];
  if (v11)
  {
    v6 = [(NUArticleContentSizeManager *)self tagSettings];
    int64_t v7 = [v11 identifier];
    v8 = [NSNumber numberWithInteger:a3];
    [v6 setContentScaleForTagID:v7 contentScale:v8];

    objc_super v9 = [(NUArticleContentSizeManager *)self tagSettings];
    v10 = [v11 identifier];
    [v9 syncForTagID:v10];
  }
}

- (id)contentSizeCategoryForSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB) {
    v3 = (id *)MEMORY[0x263F1D180];
  }
  else {
    v3 = (id *)qword_2645FF738[a3 - 1];
  }
  return *v3;
}

- (int64_t)textSizeForContentSizeCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F1D178]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D198]])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D188]])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D180]])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D170]])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D168]])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D160]])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D150]])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D148]])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D140]])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D138]])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F1D130]])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 4;
  }

  return v4;
}

- (FCTagSettings)tagSettings
{
  return self->_tagSettings;
}

- (void).cxx_destruct
{
}

@end