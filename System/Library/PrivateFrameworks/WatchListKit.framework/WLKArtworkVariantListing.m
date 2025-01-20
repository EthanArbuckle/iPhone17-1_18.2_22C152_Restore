@interface WLKArtworkVariantListing
- (NSArray)artworkVariants;
- (WLKArtworkVariantListing)initWithArtworkDictionary:(id)a3;
- (id)artworkVariantOfType:(int64_t)a3;
- (id)bestArtworkVariantOfType:(int64_t)a3 forSize:(CGSize)a4;
@end

@implementation WLKArtworkVariantListing

- (WLKArtworkVariantListing)initWithArtworkDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    v14.receiver = self;
    v14.super_class = (Class)WLKArtworkVariantListing;
    v5 = [(WLKArtworkVariantListing *)&v14 init];
    if (v5)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__WLKArtworkVariantListing_initWithArtworkDictionary___block_invoke;
      v12[3] = &unk_1E620A9C0;
      id v13 = v6;
      id v7 = v6;
      [v4 enumerateKeysAndObjectsUsingBlock:v12];
      uint64_t v8 = [v7 copy];
      artworkVariants = v5->_artworkVariants;
      v5->_artworkVariants = (NSArray *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __54__WLKArtworkVariantListing_initWithArtworkDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [WLKArtworkVariant alloc];
    id v10 = v5;
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v9 = [(WLKArtworkVariant *)v7 initWithDictionary:v8];

    if (v9) {
      [*(id *)(a1 + 32) addObject:v9];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

- (id)bestArtworkVariantOfType:(int64_t)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = self->_artworkVariants;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    v11 = 0;
    uint64_t v12 = *(void *)v34;
    double v13 = INFINITY;
    double v14 = INFINITY;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (!a3 || objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "artworkType", (void)v33) == a3)
        {
          objc_msgSend(v16, "artworkSize", (void)v33);
          double v19 = v18;
          double v20 = v17;
          BOOL v22 = vabdd_f64(v18, width) < 2.22044605e-16;
          double v21 = vabdd_f64(v17, height);
          BOOL v22 = v22 && v21 < 2.22044605e-16;
          if (v22)
          {
            id v31 = v16;

            v11 = v31;
            goto LABEL_34;
          }
          if (v19 >= width && v13 > v19 && v17 >= height && v14 > v17)
          {
            id v26 = v16;

            double v13 = v19;
            double v14 = v20;
            v11 = v26;
          }
          [v10 artworkSize];
          if (!v10 || (v27 >= v19 ? (BOOL v29 = v28 < v20) : (BOOL v29 = 1), v29))
          {
            id v30 = v16;

            id v10 = v30;
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
LABEL_34:

    if (v10 && !v11)
    {
      id v10 = v10;
      v11 = v10;
    }
  }
  else
  {

    id v10 = 0;
    v11 = 0;
  }

  return v11;
}

- (id)artworkVariantOfType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_artworkVariants;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "artworkType", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (NSArray)artworkVariants
{
  return self->_artworkVariants;
}

- (void).cxx_destruct
{
}

@end