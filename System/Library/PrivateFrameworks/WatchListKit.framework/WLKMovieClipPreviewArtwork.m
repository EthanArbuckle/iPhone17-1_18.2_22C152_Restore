@interface WLKMovieClipPreviewArtwork
- (BOOL)supportsLayeredImage;
- (CGSize)artworkSize;
- (NSString)bgColor;
- (NSString)textColor1;
- (NSString)textColor2;
- (NSString)textColor3;
- (NSString)textColor4;
- (NSString)url;
- (WLKArtworkVariant)artworkVariant;
- (WLKMovieClipPreviewArtwork)init;
- (WLKMovieClipPreviewArtwork)initWithDictionary:(id)a3;
- (id)_init;
@end

@implementation WLKMovieClipPreviewArtwork

- (WLKMovieClipPreviewArtwork)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WLKMovieClipPreviewArtwork *)self _init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"bgColor");
      v7 = (void *)v5[2];
      v5[2] = v6;

      *((unsigned char *)v5 + 8) = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"supportsLayeredImage", 0);
      uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"textColor1");
      v9 = (void *)v5[3];
      v5[3] = v8;

      uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"textColor2");
      v11 = (void *)v5[4];
      v5[4] = v10;

      uint64_t v12 = objc_msgSend(v4, "wlk_stringForKey:", @"textColor3");
      v13 = (void *)v5[5];
      v5[5] = v12;

      uint64_t v14 = objc_msgSend(v4, "wlk_stringForKey:", @"textColor4");
      v15 = (void *)v5[5];
      v5[5] = v14;

      uint64_t v16 = objc_msgSend(v4, "wlk_stringForKey:", @"url");
      v17 = (void *)v5[7];
      v5[7] = v16;

      v18 = objc_msgSend(v4, "wlk_numberForKey:", @"height");
      v19 = objc_msgSend(v4, "wlk_numberForKey:", @"width");
      v20 = v19;
      if (v18 && v19)
      {
        [v19 doubleValue];
        uint64_t v22 = v21;
        [v18 doubleValue];
        v5[8] = v22;
        v5[9] = v23;
      }
    }
    self = v5;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKMovieClipPreviewArtwork;
  return [(WLKMovieClipPreviewArtwork *)&v3 init];
}

- (WLKMovieClipPreviewArtwork)init
{
  return 0;
}

- (WLKArtworkVariant)artworkVariant
{
  v10[4] = *MEMORY[0x1E4F143B8];
  if (!self->_url
    || (*MEMORY[0x1E4F1DB30] == self->_artworkSize.width
      ? (BOOL v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == self->_artworkSize.height)
      : (BOOL v3 = 0),
        v3))
  {
    v7 = 0;
  }
  else
  {
    v9[0] = @"width";
    id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    v10[0] = v4;
    v9[1] = @"height";
    v5 = [NSNumber numberWithDouble:self->_artworkSize.height];
    v10[1] = v5;
    v10[2] = @"jpg";
    v9[2] = @"format";
    v9[3] = @"url";
    v10[3] = self->_url;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

    v7 = [[WLKArtworkVariant alloc] initWithDictionary:v6];
  }

  return v7;
}

- (CGSize)artworkSize
{
  double width = self->_artworkSize.width;
  double height = self->_artworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (NSString)bgColor
{
  return self->_bgColor;
}

- (NSString)textColor1
{
  return self->_textColor1;
}

- (NSString)textColor2
{
  return self->_textColor2;
}

- (NSString)textColor3
{
  return self->_textColor3;
}

- (NSString)textColor4
{
  return self->_textColor4;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_textColor4, 0);
  objc_storeStrong((id *)&self->_textColor3, 0);
  objc_storeStrong((id *)&self->_textColor2, 0);
  objc_storeStrong((id *)&self->_textColor1, 0);

  objc_storeStrong((id *)&self->_bgColor, 0);
}

@end