@interface SKUIArtworkList
+ (BOOL)canHandleArtworkFormat:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)artworkForSize:(int64_t)a3 artworkDictionaries:(id)a4;
- (BOOL)hasArtwork;
- (BOOL)isEqual:(id)a3;
- (NSArray)_lookupArray;
- (NSArray)artworks;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)description;
- (SKUIArtwork)largestArtwork;
- (SKUIArtwork)smallestArtwork;
- (SKUIArtworkList)initWithArtworkListArray:(id)a3;
- (SKUIArtworkList)initWithCacheRepresentation:(id)a3;
- (SKUIArtworkList)initWithCoder:(id)a3;
- (SKUIArtworkList)initWithLookupArray:(id)a3;
- (id)artworkForSize:(int64_t)a3;
- (id)artworkURLForSize:(int64_t)a3;
- (id)artworkWithWidth:(int64_t)a3;
- (id)bestArtworkForScaledSize:(CGSize)a3;
- (id)bestArtworkForSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)preferredExactArtworkForSize:(CGSize)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworks:(id)a3;
@end

@implementation SKUIArtworkList

- (SKUIArtworkList)initWithArtworkListArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIArtworkList initWithArtworkListArray:]();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIArtworkList;
  v5 = [(SKUIArtworkList *)&v23 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    artworks = v5->_artworks;
    v5->_artworks = v6;

    if ([v4 count] == 1)
    {
      v8 = [v4 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [v4 firstObject];

        id v4 = (id)v10;
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = v4;
    uint64_t v11 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v4);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [SKUIArtwork alloc];
            v17 = -[SKUIArtwork initWithArtworkDictionary:](v16, "initWithArtworkDictionary:", v15, (void)v19);
            if (v17) {
              [(NSMutableArray *)v5->_artworks addObject:v17];
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    [(NSMutableArray *)v5->_artworks sortUsingComparator:&__block_literal_global_2];
  }

  return v5;
}

uint64_t __44__SKUIArtworkList_initWithArtworkListArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 width];
  if (v6 <= [v5 width])
  {
    uint64_t v8 = [v4 width];
    if (v8 >= [v5 width]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (SKUIArtworkList)initWithLookupArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIArtworkList initWithLookupArray:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIArtworkList;
  id v5 = [(SKUIArtworkList *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    artworks = v5->_artworks;
    v5->_artworks = v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = [SKUIArtwork alloc];
            uint64_t v15 = -[SKUIArtwork initWithArtworkDictionary:](v14, "initWithArtworkDictionary:", v13, (void)v17);
            if (v15) {
              [(NSMutableArray *)v5->_artworks addObject:v15];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)v5->_artworks sortUsingComparator:&__block_literal_global_8];
  }

  return v5;
}

uint64_t __39__SKUIArtworkList_initWithLookupArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 width];
  if (v6 <= [v5 width])
  {
    uint64_t v8 = [v4 width];
    if (v8 >= [v5 width]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)artworkForSize:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_artworks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v5)
  {
    id v13 = 0;
    goto LABEL_25;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v19;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      uint64_t v12 = objc_msgSend(v11, "width", (void)v18) - a3;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = v11;

        uint64_t v7 = v13;
        uint64_t v9 = v12;
        if (!v12) {
          goto LABEL_25;
        }
      }
      else
      {
        if (!v12)
        {
          id v13 = v11;

          goto LABEL_25;
        }
        if (v9 < 0)
        {
          if (v12 > v9) {
            goto LABEL_16;
          }
        }
        else if (v12 >= 1 && v12 < v9)
        {
LABEL_16:
          id v15 = v11;

          uint64_t v7 = v15;
          uint64_t v9 = v12;
        }
      }
      ++v10;
    }
    while (v6 != v10);
    uint64_t v16 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    uint64_t v6 = v16;
    id v13 = v7;
  }
  while (v16);
LABEL_25:

  return v13;
}

- (id)artworkURLForSize:(int64_t)a3
{
  v3 = [(SKUIArtworkList *)self artworkForSize:a3];
  id v4 = [v3 URL];

  return v4;
}

- (id)artworkWithWidth:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_artworks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        if (objc_msgSend(v9, "width", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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

- (id)bestArtworkForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_artworks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      if (width <= (double)objc_msgSend(v11, "width", (void)v14) || height <= (double)objc_msgSend(v11, "height")) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v12 = v11;

    if (v12) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_10:
  }
  if ([(NSMutableArray *)self->_artworks count])
  {
    id v12 = [(NSMutableArray *)self->_artworks lastObject];
  }
  else
  {
    id v12 = 0;
  }
LABEL_15:

  return v12;
}

- (id)bestArtworkForScaledSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  double v8 = v7;

  double v9 = ceil(width * v8);
  double v10 = ceil(height * v8);

  return -[SKUIArtworkList bestArtworkForSize:](self, "bestArtworkForSize:", v9, v10);
}

- (id)preferredExactArtworkForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(SKUIArtworkList *)self artworks];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {
    double v8 = 0;
    goto LABEL_27;
  }
  uint64_t v7 = v6;
  double v8 = 0;
  uint64_t v9 = *(void *)v24;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v10;
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
      long long v14 = (void *)MEMORY[0x1C8749310](v6);
      uint64_t v15 = objc_msgSend(v13, "height", (void)v23);
      double v16 = (double)[v13 width];
      if (height == (double)v15 && width == v16)
      {
        id v21 = v13;

        double v8 = v21;
        goto LABEL_27;
      }
      uint64_t v18 = [v13 height];
      if (!v12)
      {
LABEL_19:
        uint64_t v10 = v12;
        goto LABEL_22;
      }
      uint64_t v10 = (uint64_t)((double)v18 - height);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL && v10)
      {
        if (v12 < 0)
        {
          if (v12 >= v10) {
            goto LABEL_19;
          }
        }
        else if (v10 < 1 || v12 <= v10)
        {
          goto LABEL_19;
        }
      }
      id v20 = v13;

      double v8 = v20;
LABEL_22:
      ++v11;
    }
    while (v7 != v11);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v7 = v6;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_27:

  return v8;
}

+ (id)artworkForSize:(int64_t)a3 artworkDictionaries:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v6)
  {
    double v8 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  double v8 = 0;
  uint64_t v9 = *(void *)v20;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v13 = [[SKUIArtwork alloc] initWithArtworkDictionary:v12];
        uint64_t v14 = [(SKUIArtwork *)v13 width];
        if (!v10) {
          goto LABEL_15;
        }
        uint64_t v15 = v14 - a3;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && v15)
        {
          if (v10 < 0)
          {
            if (v15 <= v10) {
              goto LABEL_15;
            }
          }
          else if (v15 < 1 || v15 >= v10)
          {
LABEL_15:
            uint64_t v15 = v10;
LABEL_18:

            uint64_t v10 = v15;
            continue;
          }
        }
        long long v17 = v13;

        double v8 = v17;
        goto LABEL_18;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v7);
LABEL_23:

  return v8;
}

- (BOOL)hasArtwork
{
  return [(NSMutableArray *)self->_artworks count] != 0;
}

+ (BOOL)canHandleArtworkFormat:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SKUIArtwork)largestArtwork
{
  id v3 = (void *)[(NSMutableArray *)self->_artworks count];
  if (v3)
  {
    id v3 = [(NSMutableArray *)self->_artworks lastObject];
  }

  return (SKUIArtwork *)v3;
}

- (void)setArtworks:(id)a3
{
  if (self->_artworks != a3)
  {
    id v4 = (NSMutableArray *)[a3 mutableCopy];
    artworks = self->_artworks;
    self->_artworks = v4;
    MEMORY[0x1F41817F8](v4, artworks);
  }
}

- (SKUIArtwork)smallestArtwork
{
  id v3 = (void *)[(NSMutableArray *)self->_artworks count];
  if (v3)
  {
    id v3 = [(NSMutableArray *)self->_artworks objectAtIndex:0];
  }

  return (SKUIArtwork *)v3;
}

- (NSArray)_lookupArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_artworks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_lookupDictionary", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    artworks = self->_artworks;
    uint64_t v6 = [v4 artworks];
    char v7 = [(NSMutableArray *)artworks isEqualToArray:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_artworks count];
  artworks = self->_artworks;
  if (v3)
  {
    uint64_t v5 = [(NSMutableArray *)artworks objectAtIndex:0];
    unint64_t v6 = [v5 hash];

    return v6;
  }
  else
  {
    return [(NSMutableArray *)artworks hash];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSMutableArray *)self->_artworks copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIArtworkList;
  id v4 = [(SKUIArtworkList *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: Artwork: %@", v4, self->_artworks];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIArtworkList)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIArtworkList;
  uint64_t v5 = [(SKUIArtworkList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"artworks"];
    artworks = v5->_artworks;
    v5->_artworks = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SKUIArtworkList)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUIArtworkList;
    uint64_t v5 = [(SKUIArtworkList *)&v11 init];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKey:@"array"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = SKUICacheCodingDecodeArray(v6, v7);
        artworks = v5->_artworks;
        v5->_artworks = (NSMutableArray *)v8;
      }
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = SKUICacheCodingEncodeArray(self->_artworks);
  [v3 setObject:v4 forKey:@"array"];

  return (NSMutableDictionary *)v3;
}

- (NSArray)artworks
{
  return &self->_artworks->super;
}

- (void).cxx_destruct
{
}

- (void)initWithArtworkListArray:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIArtworkList initWithArtworkListArray:]";
}

- (void)initWithLookupArray:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIArtworkList initWithLookupArray:]";
}

@end