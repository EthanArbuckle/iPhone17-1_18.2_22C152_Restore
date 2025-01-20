@interface SUUIItemArtworkContext
+ (id)lockupContextWithSize:(int64_t)a3;
+ (id)roomContext;
+ (id)wishlistContext;
- (CGSize)imageSizeForItem:(id)a3;
- (CGSize)largestImageSizeForItems:(id)a3;
- (CGSize)largestImageSizeForLockups:(id)a3;
- (SUUIColorScheme)colorScheme;
- (SUUIProductImageDataConsumer)generalConsumer;
- (SUUIProductImageDataConsumer)letterboxConsumer;
- (SUUIProductImageDataConsumer)posterConsumer;
- (SUUIStyledImageDataConsumer)iconConsumer;
- (SUUIStyledImageDataConsumer)messagesIconConsumer;
- (SUUIStyledImageDataConsumer)newsstandConsumer;
- (UIColor)backgroundColor;
- (id)URLForItem:(id)a3;
- (id)artworkForItem:(id)a3;
- (id)dataConsumerForItem:(id)a3;
- (id)placeholderImageForItem:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setGeneralConsumer:(id)a3;
- (void)setIconConsumer:(id)a3;
- (void)setLetterboxConsumer:(id)a3;
- (void)setMessagesIconConsumer:(id)a3;
- (void)setNewsstandConsumer:(id)a3;
- (void)setPosterConsumer:(id)a3;
@end

@implementation SUUIItemArtworkContext

+ (id)lockupContextWithSize:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = +[SUUIProductImageDataConsumer lockupConsumerWithSize:a3 itemKind:12];
  [v4 setGeneralConsumer:v5];

  v6 = +[SUUIStyledImageDataConsumer lockupIconConsumerWithSize:a3];
  [v4 setIconConsumer:v6];

  v7 = +[SUUIStyledImageDataConsumer lockupProductImageConsumerWithSize:a3];
  [v4 setNewsstandConsumer:v7];

  return v4;
}

+ (id)roomContext
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = +[SUUIProductImageDataConsumer gridConsumer];
  [v2 setGeneralConsumer:v3];

  id v4 = +[SUUIStyledImageDataConsumer roomIconConsumer];
  [v2 setIconConsumer:v4];

  v5 = +[SUUIStyledImageDataConsumer roomProductImageConsumer];
  [v2 setNewsstandConsumer:v5];

  return v2;
}

+ (id)wishlistContext
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = +[SUUIProductImageDataConsumer wishlistConsumer];
  [v2 setGeneralConsumer:v3];

  id v4 = +[SUUIStyledImageDataConsumer wishlistIconConsumer];
  [v2 setIconConsumer:v4];

  v5 = +[SUUIStyledImageDataConsumer wishlistProductImageConsumer];
  [v2 setNewsstandConsumer:v5];

  return v2;
}

- (void)setColorScheme:(id)a3
{
  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_colorScheme, a3);
    [(SUUIProductImageDataConsumer *)self->_generalImageConsumer setColorScheme:self->_colorScheme];
    [(SUUIProductImageDataConsumer *)self->_letterboxConsumer setColorScheme:self->_colorScheme];
    [(SUUIProductImageDataConsumer *)self->_posterConsumer setColorScheme:self->_colorScheme];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_colorScheme, v5);
}

- (void)setBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_backgroundColor = &self->_backgroundColor;
  if (self->_backgroundColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_backgroundColor, a3);
    [(SUUIProductImageDataConsumer *)self->_generalImageConsumer setBackgroundColor:self->_backgroundColor];
    [(SUUIStyledImageDataConsumer *)self->_iconConsumer setBackgroundColor:self->_backgroundColor];
    [(SUUIProductImageDataConsumer *)self->_letterboxConsumer setBackgroundColor:self->_backgroundColor];
    [(SUUIStyledImageDataConsumer *)self->_newsstandConsumer setBackgroundColor:self->_backgroundColor];
    [(SUUIProductImageDataConsumer *)self->_posterConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_backgroundColor, v5);
}

- (void)setGeneralConsumer:(id)a3
{
  v5 = (SUUIProductImageDataConsumer *)a3;
  p_generalImageConsumer = &self->_generalImageConsumer;
  if (self->_generalImageConsumer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_generalImageConsumer, a3);
    [(SUUIProductImageDataConsumer *)self->_generalImageConsumer setColorScheme:self->_colorScheme];
    [(SUUIProductImageDataConsumer *)self->_generalImageConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_generalImageConsumer, v5);
}

- (void)setIconConsumer:(id)a3
{
  v5 = (SUUIStyledImageDataConsumer *)a3;
  p_iconConsumer = &self->_iconConsumer;
  if (self->_iconConsumer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_iconConsumer, a3);
    [(SUUIStyledImageDataConsumer *)self->_iconConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_iconConsumer, v5);
}

- (void)setLetterboxConsumer:(id)a3
{
  v5 = (SUUIProductImageDataConsumer *)a3;
  p_letterboxConsumer = &self->_letterboxConsumer;
  if (self->_letterboxConsumer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_letterboxConsumer, a3);
    [(SUUIProductImageDataConsumer *)self->_letterboxConsumer setColorScheme:self->_colorScheme];
    [(SUUIProductImageDataConsumer *)self->_letterboxConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_letterboxConsumer, v5);
}

- (void)setNewsstandConsumer:(id)a3
{
  v5 = (SUUIStyledImageDataConsumer *)a3;
  p_newsstandConsumer = &self->_newsstandConsumer;
  if (self->_newsstandConsumer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_newsstandConsumer, a3);
    [(SUUIStyledImageDataConsumer *)self->_newsstandConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_newsstandConsumer, v5);
}

- (void)setPosterConsumer:(id)a3
{
  v5 = (SUUIProductImageDataConsumer *)a3;
  p_posterConsumer = &self->_posterConsumer;
  if (self->_posterConsumer != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_posterConsumer, a3);
    [(SUUIProductImageDataConsumer *)self->_posterConsumer setColorScheme:self->_colorScheme];
    [(SUUIProductImageDataConsumer *)self->_posterConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_posterConsumer, v5);
}

- (id)dataConsumerForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 itemKind];
  uint64_t v6 = 64;
  switch(v5)
  {
    case 2:
    case 6:
      goto LABEL_12;
    case 3:
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
      goto LABEL_11;
    case 5:
    case 12:
      goto LABEL_4;
    case 8:
      uint64_t v6 = 40;
      goto LABEL_12;
    default:
      if (v5 == 17)
      {
LABEL_4:
        if ([v4 isNewsstandApp]
          && ([v4 newsstandArtworks],
              v7 = objc_claimAutoreleasedReturnValue(),
              v7,
              v7))
        {
          uint64_t v6 = 48;
        }
        else if ([v4 isHiddenFromSpringBoard] {
               && ([v4 hasMessagesExtension] & 1) != 0)
        }
        {
          uint64_t v6 = 72;
        }
        else
        {
          uint64_t v6 = 32;
        }
      }
      else
      {
LABEL_11:
        uint64_t v6 = 24;
      }
LABEL_12:
      id v8 = *(id *)((char *)&self->super.isa + v6);
      if (!v8)
      {
        generalImageConsumer = self->_generalImageConsumer;
        if (!generalImageConsumer) {
          generalImageConsumer = self->_iconConsumer;
        }
        id v8 = generalImageConsumer;
      }

      return v8;
  }
}

- (CGSize)imageSizeForItem:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 itemKind];
    char v7 = 0;
    if (v6 <= 0x11 && ((1 << v6) & 0x21020) != 0) {
      char v7 = [v5 isNewsstandApp] ^ 1;
    }
    id v8 = [(SUUIItemArtworkContext *)self dataConsumerForItem:v5];
    [v8 imageSize];
    double v10 = v9;
    double v12 = v11;

    if ((v7 & 1) == 0)
    {
      v13 = [v5 artworksProvider];
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v13, "bestArtworkForScaledSize:", v10, v12);
        [v15 size];
        double v17 = v16;
        double v19 = v18;

        double v20 = v10 / v17;
        if (v10 / v17 >= v12 / v19) {
          double v20 = v12 / v19;
        }
        double v10 = ceil(v17 * v20);
        double v12 = ceil(v19 * v20);
      }
    }
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
    v29 = self->_iconConsumer;
    v30 = self->_newsstandConsumer;
    v31 = self->_generalImageConsumer;
    v32 = self->_letterboxConsumer;
    v21 = self->_posterConsumer;
    uint64_t v22 = 0;
    v33 = v21;
    do
    {
      v23 = *(SUUIStyledImageDataConsumer **)((char *)&v29 + v22);
      if (v23)
      {
        objc_msgSend(v23, "imageSize", v29, v30, v31, v32, v33, v34);
        if (v10 < v24) {
          double v10 = v24;
        }
        if (v12 < v25) {
          double v12 = v25;
        }
      }
      v22 += 8;
    }
    while (v22 != 40);
    for (uint64_t i = 32; i != -8; i -= 8)
  }
  double v27 = v10;
  double v28 = v12;
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)largestImageSizeForItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = *MEMORY[0x263F001B0];
    double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          -[SUUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", *(void *)(*((void *)&v18 + 1) + 8 * v11), (void)v18);
          if (v6 < v13) {
            double v6 = v13;
          }
          if (v5 < v12) {
            double v5 = v12;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [(SUUIItemArtworkContext *)self imageSizeForItem:0];
    double v5 = v14;
    double v6 = v15;
  }

  double v16 = v5;
  double v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)largestImageSizeForLockups:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  double v8 = v6;
  double v9 = v5;
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v22;
    double v8 = v6;
    double v9 = v5;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v4);
        }
        double v13 = [*(id *)(*((void *)&v21 + 1) + 8 * v12) item];
        if (v13)
        {
          [(SUUIItemArtworkContext *)self imageSizeForItem:v13];
          if (v8 < v15) {
            double v8 = v15;
          }
          if (v9 < v14) {
            double v9 = v14;
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  if (v9 == v5 && v8 == v6)
  {
    [(SUUIItemArtworkContext *)self imageSizeForItem:0];
    double v9 = v17;
    double v8 = v18;
  }

  double v19 = v9;
  double v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)placeholderImageForItem:(id)a3
{
  id v4 = a3;
  [(SUUIItemArtworkContext *)self imageSizeForItem:v4];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(SUUIItemArtworkContext *)self dataConsumerForItem:v4];

  if (v9 == (SUUIProductImageDataConsumer *)self->_iconConsumer)
  {
    int v14 = 1;
    double v15 = @"application";
  }
  else if (v9 == (SUUIProductImageDataConsumer *)self->_messagesIconConsumer)
  {
    int v14 = 1;
    double v15 = @"messages";
  }
  else
  {
    if (v9 == (SUUIProductImageDataConsumer *)self->_newsstandConsumer)
    {
      double v16 = NSString;
      v25.width = v6;
      v25.height = v8;
      double v13 = NSStringFromCGSize(v25);
      [v16 stringWithFormat:@"newsstand: %@", v13];
    }
    else if (v9 == self->_posterConsumer)
    {
      double v17 = NSString;
      v26.width = v6;
      v26.height = v8;
      double v13 = NSStringFromCGSize(v26);
      [v17 stringWithFormat:@"poster: %@", v13];
    }
    else
    {
      letterboxConsumer = self->_letterboxConsumer;
      uint64_t v11 = NSString;
      v24.width = v6;
      v24.height = v8;
      uint64_t v12 = NSStringFromCGSize(v24);
      double v13 = (void *)v12;
      if (v9 == letterboxConsumer) {
        [v11 stringWithFormat:@"letterbox: %@", v12];
      }
      else {
        [v11 stringWithFormat:@"general: %@", v12];
      }
    }
    double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int v14 = 0;
  }
  placeholders = self->_placeholders;
  if (!placeholders)
  {
    double v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    double v20 = self->_placeholders;
    self->_placeholders = v19;

    placeholders = self->_placeholders;
  }
  long long v21 = [(NSMutableDictionary *)placeholders objectForKey:v15];
  if (!v21)
  {
    if (v14) {
      [(SUUIProductImageDataConsumer *)v9 imageForColor:0];
    }
    else {
    long long v21 = -[SUUIProductImageDataConsumer imageForColor:size:](v9, "imageForColor:size:", 0, v6, v8);
    }
    if (v21) {
      [(NSMutableDictionary *)self->_placeholders setObject:v21 forKey:v15];
    }
  }

  return v21;
}

- (id)URLForItem:(id)a3
{
  v3 = [(SUUIItemArtworkContext *)self artworkForItem:a3];
  id v4 = [v3 URL];

  return v4;
}

- (id)artworkForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIItemArtworkContext *)self dataConsumerForItem:v4];
  [v5 imageSize];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [v4 artworksProvider];

  uint64_t v11 = objc_msgSend(v10, "bestArtworkForScaledSize:", v7, v9);

  return v11;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIProductImageDataConsumer)generalConsumer
{
  return self->_generalImageConsumer;
}

- (SUUIStyledImageDataConsumer)iconConsumer
{
  return self->_iconConsumer;
}

- (SUUIProductImageDataConsumer)letterboxConsumer
{
  return self->_letterboxConsumer;
}

- (SUUIStyledImageDataConsumer)newsstandConsumer
{
  return self->_newsstandConsumer;
}

- (SUUIProductImageDataConsumer)posterConsumer
{
  return self->_posterConsumer;
}

- (SUUIStyledImageDataConsumer)messagesIconConsumer
{
  return self->_messagesIconConsumer;
}

- (void)setMessagesIconConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIconConsumer, 0);
  objc_storeStrong((id *)&self->_posterConsumer, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_storeStrong((id *)&self->_newsstandConsumer, 0);
  objc_storeStrong((id *)&self->_letterboxConsumer, 0);
  objc_storeStrong((id *)&self->_iconConsumer, 0);
  objc_storeStrong((id *)&self->_generalImageConsumer, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end