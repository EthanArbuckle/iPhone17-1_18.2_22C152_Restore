@interface PXGViewPayload
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSeparateViewLayers;
- (Class)viewClass;
- (PXGViewPayload)initWithViewClass:(Class)a3 userData:(id)a4;
- (PXGViewUserData)userData;
- (unint64_t)hash;
@end

@implementation PXGViewPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_viewClass, 0);
}

- (PXGViewUserData)userData
{
  return self->_userData;
}

- (Class)viewClass
{
  return self->_viewClass;
}

- (BOOL)shouldSeparateViewLayers
{
  return 0;
}

- (unint64_t)hash
{
  v3 = [(PXGViewPayload *)self userData];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(objc_class *)[(PXGViewPayload *)self viewClass] hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXGViewPayload *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = [(PXGViewPayload *)v5 viewClass];
      if (v6 == [(PXGViewPayload *)self viewClass])
      {
        v8 = [(PXGViewPayload *)v5 userData];
        v9 = [(PXGViewPayload *)self userData];
        if (v8 == v9) {
          char v7 = 1;
        }
        else {
          char v7 = [v8 isEqual:v9];
        }
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (PXGViewPayload)initWithViewClass:(Class)a3 userData:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGViewPayload;
  char v7 = [(PXGViewPayload *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewClass, a3);
    uint64_t v9 = [v6 copyWithZone:0];
    userData = v8->_userData;
    v8->_userData = (PXGViewUserData *)v9;
  }
  return v8;
}

@end