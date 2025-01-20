@interface _PXPlacesImageCacheKey
- (BOOL)isEqual:(id)a3;
- (_PXPlacesImageCacheKey)initWithGeotaggable:(id)a3 andKey:(id)a4;
- (id)geotaggable;
- (id)key;
- (unint64_t)hash;
@end

@implementation _PXPlacesImageCacheKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_geotaggable, 0);
}

- (unint64_t)hash
{
  key = self->_key;
  unint64_t v4 = [(PXPlacesGeotaggable *)self->_geotaggable hash];
  if (key) {
    v4 ^= [(NSString *)self->_key hash];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_PXPlacesImageCacheKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v6 = v4;
    geotaggable = self->_geotaggable;
    key = self->_key;
    v9 = [(_PXPlacesImageCacheKey *)v6 geotaggable];
    int v10 = [(PXPlacesGeotaggable *)geotaggable isEqual:v9];
    if (key) {
      char v11 = 0;
    }
    else {
      char v11 = v10;
    }
    if (key && v10)
    {
      v12 = self->_key;
      v13 = [(_PXPlacesImageCacheKey *)v6 key];
      char v11 = [(NSString *)v12 isEqual:v13];
    }
  }

  return v11;
}

- (id)key
{
  return self->_key;
}

- (id)geotaggable
{
  return self->_geotaggable;
}

- (_PXPlacesImageCacheKey)initWithGeotaggable:(id)a3 andKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXPlacesImageCacheKey;
  v9 = [(_PXPlacesImageCacheKey *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_geotaggable, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

@end