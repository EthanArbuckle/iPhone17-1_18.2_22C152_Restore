@interface VUIMPMediaEntityImageLoadParams
- (BOOL)calculatedIdentifier;
- (BOOL)isEqual:(id)a3;
- (MPArtworkCatalog)artworkCatalog;
- (MPMediaItem)mediaItem;
- (NSString)description;
- (NSString)imageIdentifier;
- (VUIMPMediaEntityImageLoadParams)init;
- (VUIMPMediaEntityImageLoadParams)initWithMediaItem:(id)a3 andImageType:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)imageType;
- (void)setArtworkCatalog:(id)a3;
- (void)setCalculatedIdentifier:(BOOL)a3;
- (void)setMediaItem:(id)a3;
@end

@implementation VUIMPMediaEntityImageLoadParams

- (VUIMPMediaEntityImageLoadParams)initWithMediaItem:(id)a3 andImageType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaItem" format];
  }
  v11.receiver = self;
  v11.super_class = (Class)VUIMPMediaEntityImageLoadParams;
  v8 = [(VUIMPMediaEntityImageLoadParams *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaItem, a3);
    v9->_imageType = a4;
  }

  return v9;
}

- (VUIMPMediaEntityImageLoadParams)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (MPArtworkCatalog)artworkCatalog
{
  artworkCatalog = self->_artworkCatalog;
  if (!artworkCatalog)
  {
    uint64_t v4 = [(VUIMPMediaEntityImageLoadParams *)self mediaItem];
    objc_msgSend(v4, "vui_artworkCatalogWithImageType:", -[VUIMPMediaEntityImageLoadParams imageType](self, "imageType"));
    v5 = (MPArtworkCatalog *)objc_claimAutoreleasedReturnValue();
    v6 = self->_artworkCatalog;
    self->_artworkCatalog = v5;

    artworkCatalog = self->_artworkCatalog;
  }
  return artworkCatalog;
}

- (NSString)imageIdentifier
{
  if (!self->_calculatedIdentifier)
  {
    v3 = [(VUIMPMediaEntityImageLoadParams *)self mediaItem];
    objc_msgSend(v3, "vui_imageIdentifierWithImageType:", -[VUIMPMediaEntityImageLoadParams imageType](self, "imageType"));
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    imageIdentifier = self->_imageIdentifier;
    self->_imageIdentifier = v4;

    self->_calculatedIdentifier = 1;
  }
  v6 = self->_imageIdentifier;
  return v6;
}

- (unint64_t)hash
{
  v2 = [(VUIMPMediaEntityImageLoadParams *)self imageIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMPMediaEntityImageLoadParams *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unint64_t v7 = [(VUIMPMediaEntityImageLoadParams *)self imageType];
    if (v7 == [(VUIMPMediaEntityImageLoadParams *)v6 imageType])
    {
      v8 = [(VUIMPMediaEntityImageLoadParams *)self imageIdentifier];
      v9 = [(VUIMPMediaEntityImageLoadParams *)v6 imageIdentifier];
      id v10 = v8;
      id v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
        if (v10 && v11) {
          char v13 = [v10 isEqual:v11];
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMPMediaEntityImageLoadParams;
  uint64_t v4 = [(VUIMPMediaEntityImageLoadParams *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(VUIMPMediaEntityImageLoadParams *)self imageIdentifier];
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"imageIdentifier", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = VUIImageTypeString([(VUIMPMediaEntityImageLoadParams *)self imageType]);
  id v10 = [v8 stringWithFormat:@"%@=%@", @"imageType", v9];
  [v3 addObject:v10];

  id v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  char v13 = [v11 stringWithFormat:@"<%@>", v12];

  return (NSString *)v13;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void)setArtworkCatalog:(id)a3
{
}

- (BOOL)calculatedIdentifier
{
  return self->_calculatedIdentifier;
}

- (void)setCalculatedIdentifier:(BOOL)a3
{
  self->_calculatedIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end