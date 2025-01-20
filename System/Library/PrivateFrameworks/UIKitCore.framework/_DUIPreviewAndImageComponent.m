@interface _DUIPreviewAndImageComponent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_DUIImageComponent)imageComponent;
- (_DUIPreview)preview;
- (_DUIPreviewAndImageComponent)initWithCoder:(id)a3;
- (_DUIPreviewAndImageComponent)initWithPreviewAndImageComponent:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setImageComponent:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setPreview:(id)a3;
@end

@implementation _DUIPreviewAndImageComponent

- (_DUIPreviewAndImageComponent)initWithPreviewAndImageComponent:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_DUIPreviewAndImageComponent;
  v3 = [(_DUIPreviewAndImageComponent *)&v12 init];
  v4 = v3;
  if (v3)
  {
    v3->_index = [(_DUIPreviewAndImageComponent *)v3 index];
    v5 = [(_DUIPreviewAndImageComponent *)v4 imageComponent];
    uint64_t v6 = [v5 copy];
    imageComponent = v4->_imageComponent;
    v4->_imageComponent = (_DUIImageComponent *)v6;

    v8 = [(_DUIPreviewAndImageComponent *)v4 preview];
    uint64_t v9 = [v8 copy];
    preview = v4->_preview;
    v4->_preview = (_DUIPreview *)v9;
  }
  return v4;
}

- (_DUIPreviewAndImageComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DUIPreviewAndImageComponent;
  v5 = [(_DUIPreviewAndImageComponent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preview"];
    preview = v5->_preview;
    v5->_preview = (_DUIPreview *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageComponent"];
    imageComponent = v5->_imageComponent;
    v5->_imageComponent = (_DUIImageComponent *)v8;

    v5->_index = [v4 decodeIntegerForKey:@"index"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(_DUIPreviewAndImageComponent *)self preview];
  [v6 encodeObject:v4 forKey:@"preview"];

  v5 = [(_DUIPreviewAndImageComponent *)self imageComponent];
  [v6 encodeObject:v5 forKey:@"imageComponent"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[_DUIPreviewAndImageComponent index](self, "index"), @"index");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    id v6 = v5;
    if (self->_index != v5[3])
    {
      LOBYTE(v11) = 0;
LABEL_17:

      goto LABEL_18;
    }
    v7 = (void *)v5[1];
    uint64_t v8 = self->_preview;
    uint64_t v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      LOBYTE(v11) = 0;
      if (!v8 || !v9)
      {
LABEL_16:

        goto LABEL_17;
      }
      BOOL v11 = [(_DUIPreview *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_17;
      }
    }
    imageComponent = self->_imageComponent;
    v13 = (void *)v6[2];
    uint64_t v8 = imageComponent;
    v14 = v13;
    if (v8 == v14)
    {
      LOBYTE(v11) = 1;
      v10 = v8;
    }
    else
    {
      v10 = v14;
      LOBYTE(v11) = 0;
      if (v8 && v14) {
        LOBYTE(v11) = [(_DUIPreview *)v8 isEqual:v14];
      }
    }
    goto LABEL_16;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  unint64_t index = self->_index;
  uint64_t v4 = [(_DUIPreview *)self->_preview hash] ^ index;
  return v4 ^ [(_DUIImageComponent *)self->_imageComponent hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithPreviewAndImageComponent:self];
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_unint64_t index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong((id *)&self->_preview, 0);
}

@end