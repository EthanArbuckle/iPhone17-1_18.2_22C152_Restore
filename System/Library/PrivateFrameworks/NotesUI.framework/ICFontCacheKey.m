@interface ICFontCacheKey
- (BOOL)isEqual:(id)a3;
- (ICFontCacheKey)initWithFont:(id)a3;
- (NSString)fontName;
- (UIFontDescriptor)fontDescriptor;
- (double)pointSize;
- (int)traits;
- (unint64_t)hash;
@end

@implementation ICFontCacheKey

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fontName hash] ^ self->_traits;
  return v3 ^ [(UIFontDescriptor *)self->_fontDescriptor hash] ^ vcvtmd_u64_f64(self->_pointSize * 100.0);
}

- (ICFontCacheKey)initWithFont:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICFontCacheKey;
  v5 = [(ICFontCacheKey *)&v14 init];
  if (v5)
  {
    v6 = [v4 fontName];
    uint64_t v7 = [v6 copy];
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v7;

    v5->_traits = [v4 traits];
    [v4 pointSize];
    v5->_pointSize = v9;
    v10 = [v4 fontDescriptor];
    uint64_t v11 = [v10 copy];
    fontDescriptor = v5->_fontDescriptor;
    v5->_fontDescriptor = (UIFontDescriptor *)v11;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(ICFontCacheKey *)self hash];
  if (v6 == [v5 hash])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      fontName = self->_fontName;
      v8 = [v5 fontName];
      if (fontName == v8
        || (double v9 = self->_fontName,
            [v5 fontName],
            NSUInteger v3 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v9 isEqualToString:v3]))
      {
        int traits = self->_traits;
        if (traits == [v5 traits]
          && (double pointSize = self->_pointSize, [v5 pointSize], vabdd_f64(pointSize, v13) < 0.00000011920929))
        {
          fontDescriptor = self->_fontDescriptor;
          uint64_t v15 = [v5 fontDescriptor];
          if (fontDescriptor == (UIFontDescriptor *)v15)
          {

            char v10 = 1;
          }
          else
          {
            v16 = (void *)v15;
            v17 = self->_fontDescriptor;
            v18 = [v5 fontDescriptor];
            char v10 = [(UIFontDescriptor *)v17 isEqual:v18];
          }
        }
        else
        {
          char v10 = 0;
        }
        if (fontName == v8) {
          goto LABEL_14;
        }
      }
      else
      {
        char v10 = 0;
      }

LABEL_14:
      goto LABEL_15;
    }
  }
  char v10 = 0;
LABEL_15:

  return v10;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (int)traits
{
  return self->_traits;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end