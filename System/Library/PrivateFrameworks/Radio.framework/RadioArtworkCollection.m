@interface RadioArtworkCollection
- (BOOL)isEqual:(id)a3;
- (NSArray)artworks;
- (RadioArtworkCollection)initWithArtworkVariants:(id)a3;
- (RadioArtworkCollection)initWithArtworks:(id)a3;
- (id)_artworksBySortingArtworks:(id)a3;
- (id)bestArtworkForPixelSize:(CGSize)a3;
- (id)bestArtworkForPointSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation RadioArtworkCollection

- (void).cxx_destruct
{
}

- (NSArray)artworks
{
  return self->_artworks;
}

- (id)_artworksBySortingArtworks:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_512];
}

uint64_t __53__RadioArtworkCollection__artworksBySortingArtworks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 pixelSize];
  double v6 = v5;
  double v8 = v7;
  [v4 pixelSize];
  uint64_t v11 = v8 < v10 || v6 < v9;
  BOOL v12 = v8 <= v10 && v6 <= v9;
  uint64_t v13 = v11 << 63 >> 63;
  if (v12) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 1;
  }

  return v14;
}

- (id)bestArtworkForPointSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  GSMainScreenScaleFactor();
  double v7 = v6;
  double v8 = width * v6;
  double v9 = height * v7;
  return -[RadioArtworkCollection bestArtworkForPixelSize:](self, "bestArtworkForPixelSize:", v8, v9);
}

- (id)bestArtworkForPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  float v6 = self->_artworks;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "pixelSize", (void)v17);
      if (v13 >= width || v12 >= height) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v15 = v11;

    if (v15) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_13:
  }
  id v15 = [(NSArray *)self->_artworks lastObject];
LABEL_16:
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RadioArtworkCollection *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v6 = 0;
      goto LABEL_7;
    }
    artworks = self->_artworks;
    if ((unint64_t)artworks | (unint64_t)v4->_artworks)
    {
      char v6 = -[NSArray isEqual:](artworks, "isEqual:");
      goto LABEL_7;
    }
  }
  char v6 = 1;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return ~[(NSArray *)self->_artworks hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p artworks: %@>", objc_opt_class(), self, self->_artworks];
}

- (RadioArtworkCollection)initWithArtworkVariants:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v12 = [[RadioArtwork alloc] initWithArtworkDictionary:v11];
          if (v12) {
            [v5 addObject:v12];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v19.receiver = self;
    v19.super_class = (Class)RadioArtworkCollection;
    double v13 = [(RadioArtworkCollection *)&v19 init];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [(RadioArtworkCollection *)v13 _artworksBySortingArtworks:v5];
      artworks = v14->_artworks;
      v14->_artworks = (NSArray *)v15;
    }
    self = v14;
    long long v17 = self;
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (RadioArtworkCollection)initWithArtworks:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RadioArtworkCollection;
  double v5 = [(RadioArtworkCollection *)&v11 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(RadioArtworkCollection *)v5 _artworksBySortingArtworks:v4];
    uint64_t v8 = [v7 copy];
    artworks = v6->_artworks;
    v6->_artworks = (NSArray *)v8;
  }
  return v6;
}

@end