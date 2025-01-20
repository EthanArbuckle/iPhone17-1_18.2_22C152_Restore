@interface TLKIcon
- (TLKImage)image;
- (unint64_t)_itemType;
- (void)setImage:(id)a3;
@end

@implementation TLKIcon

- (void)setImage:(id)a3
{
  v10 = (TLKImage *)a3;
  if (self->_image != v10)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (unint64_t)_itemType
{
  return 3;
}

- (TLKImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end