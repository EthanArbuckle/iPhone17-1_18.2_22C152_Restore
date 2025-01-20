@interface PXImageTitleSubtitleSpec
- (BOOL)isEqual:(id)a3;
- (PXImageViewSpec)imageSpec;
- (PXTitleSubtitleLabelSpec)titleSubtitleSpec;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setImageSpec:(id)a3;
- (void)setTitleSubtitleSpec:(id)a3;
@end

@implementation PXImageTitleSubtitleSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSpec, 0);
  objc_storeStrong((id *)&self->_titleSubtitleSpec, 0);
}

- (void)setImageSpec:(id)a3
{
}

- (PXImageViewSpec)imageSpec
{
  return self->_imageSpec;
}

- (void)setTitleSubtitleSpec:(id)a3
{
}

- (PXTitleSubtitleLabelSpec)titleSubtitleSpec
{
  return self->_titleSubtitleSpec;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXImageTitleSubtitleSpec;
  v5 = -[PXViewSpec copyWithZone:](&v11, sel_copyWithZone_);
  uint64_t v6 = [(PXTitleSubtitleLabelSpec *)self->_titleSubtitleSpec copyWithZone:a3];
  v7 = (void *)v5[12];
  v5[12] = v6;

  id v8 = [(PXImageViewSpec *)self->_imageSpec copyWithZone:a3];
  v9 = (void *)v5[13];
  v5[13] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXImageTitleSubtitleSpec;
  unsigned int v5 = [(PXViewSpec *)&v16 isEqual:v4];
  id v6 = v4;
  v7 = v6;
  if (!v5) {
    goto LABEL_4;
  }
  id v8 = [v6 titleSubtitleSpec];
  id v9 = [(PXImageTitleSubtitleSpec *)self titleSubtitleSpec];
  if (v8 == v9)
  {
  }
  else
  {
    v10 = v9;
    char v11 = [v8 isEqual:v9];

    if ((v11 & 1) == 0)
    {
LABEL_4:
      char v12 = 0;
      goto LABEL_10;
    }
  }
  v13 = [v7 imageSpec];
  v14 = [(PXImageTitleSubtitleSpec *)self imageSpec];
  if (v13 == v14) {
    char v12 = 1;
  }
  else {
    char v12 = [v13 isEqual:v14];
  }

LABEL_10:
  return v12;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)PXImageTitleSubtitleSpec;
  unint64_t v3 = [(PXViewSpec *)&v9 hash];
  id v4 = [(PXImageTitleSubtitleSpec *)self titleSubtitleSpec];
  uint64_t v5 = [v4 hash];

  id v6 = [(PXImageTitleSubtitleSpec *)self imageSpec];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

@end