@interface PXGTitleSubtitleViewConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (PXTitleSubtitleLabelSpec)spec;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXGTitleSubtitleViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setSpec:(id)a3
{
}

- (PXTitleSubtitleLabelSpec)spec
{
  return self->_spec;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(PXGTitleSubtitleViewConfiguration *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(PXGTitleSubtitleViewConfiguration *)self subtitle];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);
  v7 = [(PXGTitleSubtitleViewConfiguration *)self spec];
  unint64_t v8 = v6 ^ (4 * [v7 hash]);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXGTitleSubtitleViewConfiguration *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXGTitleSubtitleViewConfiguration *)self title];
      id v7 = [(PXGTitleSubtitleViewConfiguration *)v5 title];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqualToString:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      id v10 = [(PXGTitleSubtitleViewConfiguration *)self subtitle];
      id v11 = [(PXGTitleSubtitleViewConfiguration *)v5 subtitle];
      if (v10 == v11)
      {
      }
      else
      {
        int v12 = [v10 isEqualToString:v11];

        if (!v12)
        {
          char v9 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v13 = [(PXGTitleSubtitleViewConfiguration *)self spec];
      v14 = [(PXGTitleSubtitleViewConfiguration *)v5 spec];
      if (v13 == v14) {
        char v9 = 1;
      }
      else {
        char v9 = [v13 isEqual:v14];
      }

      goto LABEL_17;
    }
    char v9 = 0;
  }
LABEL_19:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXGTitleSubtitleViewConfiguration *)self title];
  [v4 setTitle:v5];

  id v6 = [(PXGTitleSubtitleViewConfiguration *)self subtitle];
  [v4 setSubtitle:v6];

  id v7 = [(PXGTitleSubtitleViewConfiguration *)self spec];
  [v4 setSpec:v7];

  return v4;
}

@end