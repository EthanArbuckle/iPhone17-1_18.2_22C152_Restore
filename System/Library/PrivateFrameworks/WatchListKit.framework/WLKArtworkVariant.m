@interface WLKArtworkVariant
+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 cropCode:(id)a5 format:(id)a6;
+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 format:(id)a5;
- (BOOL)hasAlpha;
- (BOOL)supportsLayeredImage;
- (CGSize)artworkSize;
- (NSString)artworkURLString;
- (NSString)format;
- (NSURL)artworkURL;
- (WLKArtworkVariant)initWithDictionary:(id)a3;
- (id)_sizeDescription:(CGSize)a3;
- (id)artworkSizeTemplateURL;
- (id)artworkURLForSize:(CGSize)a3;
- (id)artworkURLForSize:(CGSize)a3 cropCode:(id)a4 format:(id)a5;
- (id)artworkURLForSize:(CGSize)a3 format:(id)a4;
- (id)description;
- (int64_t)artworkType;
- (void)setAlpha:(BOOL)a3;
- (void)setSupportsLayeredImage:(BOOL)a3;
@end

@implementation WLKArtworkVariant

- (WLKArtworkVariant)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    v35.receiver = self;
    v35.super_class = (Class)WLKArtworkVariant;
    v5 = [(WLKArtworkVariant *)&v35 init];
    if (!v5)
    {
LABEL_69:
      self = v5;
      v11 = self;
      goto LABEL_70;
    }
    v6 = [v4 allKeys];
    v7 = [v6 firstObject];

    id v8 = v7;
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_60:
      v12 = [v4 objectForKey:v8];

      v13 = [v12 objectForKey:@"width"];
      [v13 floatValue];
      CGFloat v15 = v14;
      v16 = [v12 objectForKey:@"height"];
      [v16 floatValue];
      v5->_artworkSize.width = v15;
      v5->_artworkSize.height = v17;

      v18 = [v12 objectForKey:@"url"];
      uint64_t v19 = [v18 copy];
      artworkURLString = v5->_artworkURLString;
      v5->_artworkURLString = (NSString *)v19;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 hasPrefix:@"bundle://"])
      {
        uint64_t v21 = [v18 rangeOfString:@"bundle://"];
        v23 = [v18 substringFromIndex:v21 + v22];
        v24 = [MEMORY[0x1E4F28B50] mainBundle];
        v25 = [v24 resourcePath];
        v26 = [v25 stringByAppendingPathComponent:v23];
        uint64_t v27 = [v26 copy];
        artworkURLTemplate = v5->_artworkURLTemplate;
        v5->_artworkURLTemplate = (NSString *)v27;
      }
      else
      {
        uint64_t v29 = [v18 copy];
        v23 = v5->_artworkURLTemplate;
        v5->_artworkURLTemplate = (NSString *)v29;
      }

      v30 = [v12 objectForKey:@"format"];
      uint64_t v31 = [v30 copy];
      format = v5->_format;
      v5->_format = (NSString *)v31;

      if ([(NSString *)v5->_format compare:@"lsr" options:1] == NSOrderedSame)
      {
        v33 = v5->_format;
        v5->_format = (NSString *)@"lcr";
      }
      v5->_supportsLayeredImage = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", @"supportsLayeredImage", 0);
      v5->_alpha = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", @"hasAlpha", 0);
      if (!v5->_format)
      {
        v5->_format = (NSString *)@"jpg";
      }
      id v4 = v12;
      goto LABEL_69;
    }
    v9 = [v8 lowercaseString];

    if ([v9 isEqualToString:@"banner"])
    {
      uint64_t v10 = 1;
    }
    else
    {
      if (![v9 isEqualToString:@"other"])
      {
        if ([v9 isEqualToString:@"coverart"])
        {
          uint64_t v10 = 2;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"previewframe"])
        {
          uint64_t v10 = 4;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"showlogo"])
        {
          uint64_t v10 = 5;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"castincharacter"])
        {
          uint64_t v10 = 3;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"fullscreenbackground"])
        {
          uint64_t v10 = 6;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"contentlogo"])
        {
          uint64_t v10 = 8;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"fullcolorcontentlogo"])
        {
          uint64_t v10 = 21;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"singlecolorcontentlogo"])
        {
          uint64_t v10 = 22;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"flowcaseimage"])
        {
          uint64_t v10 = 7;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"logoglyph"])
        {
          uint64_t v10 = 9;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"appicon"])
        {
          uint64_t v10 = 10;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"heroimage"])
        {
          uint64_t v10 = 11;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"masterlockupimage"])
        {
          uint64_t v10 = 12;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"evodfeaturing"])
        {
          uint64_t v10 = 13;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"actioncoverart"])
        {
          uint64_t v10 = 14;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"upnextbackground"])
        {
          uint64_t v10 = 15;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"keyframe"])
        {
          uint64_t v10 = 16;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"coverart16x9"])
        {
          uint64_t v10 = 17;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"whitelogo"])
        {
          uint64_t v10 = 18;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"centeredfullscreenbackgroundimage"])
        {
          uint64_t v10 = 20;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"shelfimagebackground"])
        {
          uint64_t v10 = 23;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"posterart"])
        {
          uint64_t v10 = 24;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"showposterart"])
        {
          uint64_t v10 = 25;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"shelfimage"])
        {
          uint64_t v10 = 26;
          goto LABEL_59;
        }
        if ([v9 isEqualToString:@"keyframeimage"])
        {
          uint64_t v10 = 27;
          goto LABEL_59;
        }
      }
      uint64_t v10 = 19;
    }
LABEL_59:
    v5->_artworkType = v10;
    goto LABEL_60;
  }
  v11 = 0;
LABEL_70:

  return v11;
}

- (NSURL)artworkURL
{
  v2 = -[WLKArtworkVariant artworkURLForSize:](self, "artworkURLForSize:", self->_artworkSize.width, self->_artworkSize.height);
  v3 = (void *)[v2 copy];

  return (NSURL *)v3;
}

- (id)artworkURLForSize:(CGSize)a3
{
  return -[WLKArtworkVariant artworkURLForSize:format:](self, "artworkURLForSize:format:", 0, a3.width, a3.height);
}

- (id)artworkURLForSize:(CGSize)a3 format:(id)a4
{
  return -[WLKArtworkVariant artworkURLForSize:cropCode:format:](self, "artworkURLForSize:cropCode:format:", 0, a4, a3.width, a3.height);
}

- (id)artworkURLForSize:(CGSize)a3 cropCode:(id)a4 format:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  format = a5;
  if (!a5) {
    format = self->_format;
  }
  id v11 = format;
  id v12 = a5;
  id v13 = a4;
  float v14 = objc_msgSend((id)objc_opt_class(), "artworkURLFromTemplate:forSize:cropCode:format:", self->_artworkURLTemplate, v13, v11, width, height);

  return v14;
}

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 format:(id)a5
{
  return (id)objc_msgSend(a1, "artworkURLFromTemplate:forSize:cropCode:format:", a3, 0, a5, a4.width, a4.height);
}

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 cropCode:(id)a5 format:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = (__CFString *)a5;
  id v11 = a6;
  id v12 = (void *)[a3 mutableCopy];
  uint64_t v13 = [v12 rangeOfString:@"{w}"];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    float v17 = objc_msgSend(NSString, "stringWithFormat:", @"%0.0f", *(void *)&width);
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v15, v16, v17);
  }
  uint64_t v18 = [v12 rangeOfString:@"{h}"];
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v20 = v18;
    uint64_t v21 = v19;
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%0.0f", *(void *)&height);
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v20, v21, v22);
  }
  uint64_t v23 = [v12 rangeOfString:@"{c}"];
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v25 = v23;
    uint64_t v26 = v24;
    if ([(__CFString *)v10 length]) {
      uint64_t v27 = v10;
    }
    else {
      uint64_t v27 = &stru_1F13BCF18;
    }
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v25, v26, v27);
  }
  uint64_t v28 = [v12 rangeOfString:@"{f}"];
  if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v28, v29, v11);
  }
  v30 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  uint64_t v31 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v30];
  v32 = (void *)[v31 mutableCopy];

  v33 = [MEMORY[0x1E4F1CB10] URLWithString:v32];

  return v33;
}

- (id)artworkSizeTemplateURL
{
  v3 = (void *)[(NSString *)self->_artworkURLTemplate mutableCopy];
  uint64_t v4 = [v3 rangeOfString:@"{f}"];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, v5, self->_format);
  }
  v6 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v7 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v6];
  id v8 = (void *)[v7 mutableCopy];

  v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)WLKArtworkVariant;
  uint64_t v4 = [(WLKArtworkVariant *)&v11 description];
  int64_t artworkType = self->_artworkType;
  [(WLKArtworkVariant *)self artworkSize];
  v6 = -[WLKArtworkVariant _sizeDescription:](self, "_sizeDescription:");
  v7 = [(WLKArtworkVariant *)self artworkURL];
  id v8 = [v7 absoluteString];
  v9 = [v3 stringWithFormat:@"%@ type: %ld, size: %@, url: %@", v4, artworkType, v6, v8];

  return v9;
}

- (id)_sizeDescription:(CGSize)a3
{
  return (id)[NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a3.width, 17, *(void *)&a3.height];
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (CGSize)artworkSize
{
  double width = self->_artworkSize.width;
  double height = self->_artworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (NSString)format
{
  return self->_format;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (void)setSupportsLayeredImage:(BOOL)a3
{
  self->_supportsLayeredImage = a3;
}

- (BOOL)hasAlpha
{
  return self->_alpha;
}

- (void)setAlpha:(BOOL)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);

  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
}

@end