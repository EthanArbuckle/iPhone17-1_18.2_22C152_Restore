@interface SKUIItemArtworkContext
+ (id)lockupContextWithSize:(int64_t)a3;
+ (id)roomContext;
+ (id)wishlistContext;
+ (void)roomContext;
+ (void)wishlistContext;
- (CGSize)imageSizeForItem:(id)a3;
- (CGSize)largestImageSizeForItems:(id)a3;
- (CGSize)largestImageSizeForLockups:(id)a3;
- (SKUIColorScheme)colorScheme;
- (SKUIProductImageDataConsumer)generalConsumer;
- (SKUIProductImageDataConsumer)letterboxConsumer;
- (SKUIProductImageDataConsumer)posterConsumer;
- (SKUIStyledImageDataConsumer)iconConsumer;
- (SKUIStyledImageDataConsumer)messagesIconConsumer;
- (SKUIStyledImageDataConsumer)newsstandConsumer;
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

@implementation SKUIItemArtworkContext

+ (id)lockupContextWithSize:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIItemArtworkContext lockupContextWithSize:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  id v12 = objc_alloc_init((Class)objc_opt_class());
  v13 = +[SKUIProductImageDataConsumer lockupConsumerWithSize:a3 itemKind:12];
  [v12 setGeneralConsumer:v13];

  v14 = +[SKUIStyledImageDataConsumer lockupIconConsumerWithSize:a3];
  [v12 setIconConsumer:v14];

  v15 = +[SKUIStyledImageDataConsumer lockupProductImageConsumerWithSize:a3];
  [v12 setNewsstandConsumer:v15];

  return v12;
}

+ (id)roomContext
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIItemArtworkContext roomContext];
      }
    }
  }
  id v10 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v11 = +[SKUIProductImageDataConsumer gridConsumer];
  [v10 setGeneralConsumer:v11];

  id v12 = +[SKUIStyledImageDataConsumer roomIconConsumer];
  [v10 setIconConsumer:v12];

  v13 = +[SKUIStyledImageDataConsumer roomProductImageConsumer];
  [v10 setNewsstandConsumer:v13];

  return v10;
}

+ (id)wishlistContext
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIItemArtworkContext wishlistContext];
      }
    }
  }
  id v10 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v11 = +[SKUIProductImageDataConsumer wishlistConsumer];
  [v10 setGeneralConsumer:v11];

  id v12 = +[SKUIStyledImageDataConsumer wishlistIconConsumer];
  [v10 setIconConsumer:v12];

  v13 = +[SKUIStyledImageDataConsumer wishlistProductImageConsumer];
  [v10 setNewsstandConsumer:v13];

  return v10;
}

- (void)setColorScheme:(id)a3
{
  uint64_t v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIItemArtworkContext setColorScheme:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    [(SKUIProductImageDataConsumer *)self->_generalImageConsumer setColorScheme:self->_colorScheme];
    [(SKUIProductImageDataConsumer *)self->_letterboxConsumer setColorScheme:self->_colorScheme];
    [(SKUIProductImageDataConsumer *)self->_posterConsumer setColorScheme:self->_colorScheme];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIItemArtworkContext setBackgroundColor:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_backgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    [(SKUIProductImageDataConsumer *)self->_generalImageConsumer setBackgroundColor:self->_backgroundColor];
    [(SKUIStyledImageDataConsumer *)self->_iconConsumer setBackgroundColor:self->_backgroundColor];
    [(SKUIProductImageDataConsumer *)self->_letterboxConsumer setBackgroundColor:self->_backgroundColor];
    [(SKUIStyledImageDataConsumer *)self->_newsstandConsumer setBackgroundColor:self->_backgroundColor];
    [(SKUIProductImageDataConsumer *)self->_posterConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (void)setGeneralConsumer:(id)a3
{
  uint64_t v5 = (SKUIProductImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIItemArtworkContext setGeneralConsumer:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_generalImageConsumer != v5)
  {
    objc_storeStrong((id *)&self->_generalImageConsumer, a3);
    [(SKUIProductImageDataConsumer *)self->_generalImageConsumer setColorScheme:self->_colorScheme];
    [(SKUIProductImageDataConsumer *)self->_generalImageConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (void)setIconConsumer:(id)a3
{
  uint64_t v5 = (SKUIStyledImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIItemArtworkContext setIconConsumer:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_iconConsumer != v5)
  {
    objc_storeStrong((id *)&self->_iconConsumer, a3);
    [(SKUIStyledImageDataConsumer *)self->_iconConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (void)setLetterboxConsumer:(id)a3
{
  uint64_t v5 = (SKUIProductImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIItemArtworkContext setLetterboxConsumer:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_letterboxConsumer != v5)
  {
    objc_storeStrong((id *)&self->_letterboxConsumer, a3);
    [(SKUIProductImageDataConsumer *)self->_letterboxConsumer setColorScheme:self->_colorScheme];
    [(SKUIProductImageDataConsumer *)self->_letterboxConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (void)setNewsstandConsumer:(id)a3
{
  uint64_t v5 = (SKUIStyledImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIItemArtworkContext setNewsstandConsumer:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_newsstandConsumer != v5)
  {
    objc_storeStrong((id *)&self->_newsstandConsumer, a3);
    [(SKUIStyledImageDataConsumer *)self->_newsstandConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (void)setPosterConsumer:(id)a3
{
  uint64_t v5 = (SKUIProductImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIItemArtworkContext setPosterConsumer:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_posterConsumer != v5)
  {
    objc_storeStrong((id *)&self->_posterConsumer, a3);
    [(SKUIProductImageDataConsumer *)self->_posterConsumer setColorScheme:self->_colorScheme];
    [(SKUIProductImageDataConsumer *)self->_posterConsumer setBackgroundColor:self->_backgroundColor];
    placeholders = self->_placeholders;
    self->_placeholders = 0;
  }
}

- (id)dataConsumerForItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIItemArtworkContext dataConsumerForItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 itemKind];
  uint64_t v14 = 64;
  switch(v13)
  {
    case 2:
    case 6:
      goto LABEL_16;
    case 3:
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
      goto LABEL_15;
    case 5:
    case 12:
      goto LABEL_8;
    case 8:
      uint64_t v14 = 40;
      goto LABEL_16;
    default:
      if (v13 == 17)
      {
LABEL_8:
        if ([v4 isNewsstandApp]
          && ([v4 newsstandArtworks],
              v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          uint64_t v14 = 48;
        }
        else if ([v4 isHiddenFromSpringBoard] {
               && ([v4 hasMessagesExtension] & 1) != 0)
        }
        {
          uint64_t v14 = 72;
        }
        else
        {
          uint64_t v14 = 32;
        }
      }
      else
      {
LABEL_15:
        uint64_t v14 = 24;
      }
LABEL_16:
      id v16 = *(id *)((char *)&self->super.isa + v14);
      if (!v16)
      {
        generalImageConsumer = self->_generalImageConsumer;
        if (!generalImageConsumer) {
          generalImageConsumer = self->_iconConsumer;
        }
        id v16 = generalImageConsumer;
      }

      return v16;
  }
}

- (CGSize)imageSizeForItem:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)))
  {
    -[SKUIItemArtworkContext imageSizeForItem:](v5, v6, v7, v8, v9, v10, v11, v12);
    if (v4)
    {
LABEL_5:
      unint64_t v13 = [v4 itemKind];
      char v14 = 0;
      if (v13 <= 0x11 && ((1 << v13) & 0x21020) != 0) {
        char v14 = [v4 isNewsstandApp] ^ 1;
      }
      v15 = [(SKUIItemArtworkContext *)self dataConsumerForItem:v4];
      [v15 imageSize];
      double v17 = v16;
      double v19 = v18;

      if ((v14 & 1) == 0)
      {
        v20 = [v4 artworksProvider];
        v21 = v20;
        if (v20)
        {
          v22 = objc_msgSend(v20, "bestArtworkForScaledSize:", v17, v19);
          [v22 size];
          double v24 = v23;
          double v26 = v25;

          double v27 = v17 / v24;
          if (v17 / v24 >= v19 / v26) {
            double v27 = v19 / v26;
          }
          double v17 = ceil(v24 * v27);
          double v19 = ceil(v26 * v27);
        }
      }
      goto LABEL_24;
    }
  }
  else if (v4)
  {
    goto LABEL_5;
  }
  double v17 = *MEMORY[0x1E4F1DB30];
  double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v36 = self->_iconConsumer;
  v37 = self->_newsstandConsumer;
  v38 = self->_generalImageConsumer;
  v39 = self->_letterboxConsumer;
  v28 = self->_posterConsumer;
  uint64_t v29 = 0;
  v40 = v28;
  do
  {
    v30 = *(SKUIStyledImageDataConsumer **)((char *)&v36 + v29);
    if (v30)
    {
      objc_msgSend(v30, "imageSize", v36, v37, v38, v39, v40, v41);
      if (v17 < v31) {
        double v17 = v31;
      }
      if (v19 < v32) {
        double v19 = v32;
      }
    }
    v29 += 8;
  }
  while (v29 != 40);
  for (uint64_t i = 32; i != -8; i -= 8)

LABEL_24:
  double v34 = v17;
  double v35 = v19;
  result.height = v35;
  result.width = v34;
  return result;
}

- (CGSize)largestImageSizeForItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemArtworkContext largestImageSizeForItems:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ([v4 count])
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          -[SKUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", *(void *)(*((void *)&v26 + 1) + 8 * v19), (void)v26);
          if (v14 < v21) {
            double v14 = v21;
          }
          if (v13 < v20) {
            double v13 = v20;
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }
  }
  else
  {
    [(SKUIItemArtworkContext *)self imageSizeForItem:0];
    double v13 = v22;
    double v14 = v23;
  }

  double v24 = v13;
  double v25 = v14;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)largestImageSizeForLockups:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemArtworkContext largestImageSizeForLockups:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  double v17 = v14;
  double v18 = v13;
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v31;
    double v17 = v14;
    double v18 = v13;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v15);
        }
        double v22 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v21), "item", (void)v30);
        if (v22)
        {
          [(SKUIItemArtworkContext *)self imageSizeForItem:v22];
          if (v17 < v24) {
            double v17 = v24;
          }
          if (v18 < v23) {
            double v18 = v23;
          }
        }

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }

  if (v18 == v13 && v17 == v14)
  {
    [(SKUIItemArtworkContext *)self imageSizeForItem:0];
    double v18 = v26;
    double v17 = v27;
  }

  double v28 = v18;
  double v29 = v17;
  result.height = v29;
  result.width = v28;
  return result;
}

- (id)placeholderImageForItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIItemArtworkContext placeholderImageForItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIItemArtworkContext *)self imageSizeForItem:v4];
  double v14 = v13;
  double v16 = v15;
  double v17 = [(SKUIItemArtworkContext *)self dataConsumerForItem:v4];

  if (v17 == (SKUIProductImageDataConsumer *)self->_iconConsumer)
  {
    int v22 = 1;
    double v23 = @"application";
  }
  else if (v17 == (SKUIProductImageDataConsumer *)self->_messagesIconConsumer)
  {
    int v22 = 1;
    double v23 = @"messages";
  }
  else
  {
    if (v17 == (SKUIProductImageDataConsumer *)self->_newsstandConsumer)
    {
      double v24 = NSString;
      v33.width = v14;
      v33.height = v16;
      uint64_t v21 = NSStringFromCGSize(v33);
      [v24 stringWithFormat:@"newsstand: %@", v21];
    }
    else if (v17 == self->_posterConsumer)
    {
      double v25 = NSString;
      v34.width = v14;
      v34.height = v16;
      uint64_t v21 = NSStringFromCGSize(v34);
      [v25 stringWithFormat:@"poster: %@", v21];
    }
    else
    {
      letterboxConsumer = self->_letterboxConsumer;
      uint64_t v19 = NSString;
      v32.width = v14;
      v32.height = v16;
      uint64_t v20 = NSStringFromCGSize(v32);
      uint64_t v21 = (void *)v20;
      if (v17 == letterboxConsumer) {
        [v19 stringWithFormat:@"letterbox: %@", v20];
      }
      else {
        [v19 stringWithFormat:@"general: %@", v20];
      }
    }
    double v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int v22 = 0;
  }
  placeholders = self->_placeholders;
  if (!placeholders)
  {
    double v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v28 = self->_placeholders;
    self->_placeholders = v27;

    placeholders = self->_placeholders;
  }
  double v29 = [(NSMutableDictionary *)placeholders objectForKey:v23];
  if (!v29)
  {
    if (v22) {
      [(SKUIProductImageDataConsumer *)v17 imageForColor:0];
    }
    else {
    double v29 = -[SKUIProductImageDataConsumer imageForColor:size:](v17, "imageForColor:size:", 0, v14, v16);
    }
    if (v29) {
      [(NSMutableDictionary *)self->_placeholders setObject:v29 forKey:v23];
    }
  }

  return v29;
}

- (id)URLForItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemArtworkContext URLForItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [(SKUIItemArtworkContext *)self artworkForItem:v4];
  double v14 = [v13 URL];

  return v14;
}

- (id)artworkForItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemArtworkContext artworkForItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [(SKUIItemArtworkContext *)self dataConsumerForItem:v4];
  [v13 imageSize];
  double v15 = v14;
  double v17 = v16;

  double v18 = [v4 artworksProvider];

  uint64_t v19 = objc_msgSend(v18, "bestArtworkForScaledSize:", v15, v17);

  return v19;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SKUIProductImageDataConsumer)generalConsumer
{
  return self->_generalImageConsumer;
}

- (SKUIStyledImageDataConsumer)iconConsumer
{
  return self->_iconConsumer;
}

- (SKUIProductImageDataConsumer)letterboxConsumer
{
  return self->_letterboxConsumer;
}

- (SKUIStyledImageDataConsumer)newsstandConsumer
{
  return self->_newsstandConsumer;
}

- (SKUIProductImageDataConsumer)posterConsumer
{
  return self->_posterConsumer;
}

- (SKUIStyledImageDataConsumer)messagesIconConsumer
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

+ (void)lockupContextWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)roomContext
{
}

+ (void)wishlistContext
{
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setGeneralConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIconConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLetterboxConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setNewsstandConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPosterConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dataConsumerForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageSizeForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)largestImageSizeForItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)largestImageSizeForLockups:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)placeholderImageForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)URLForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)artworkForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end