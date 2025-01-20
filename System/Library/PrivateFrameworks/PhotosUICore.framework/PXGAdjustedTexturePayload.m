@interface PXGAdjustedTexturePayload
- (BOOL)isEqual:(id)a3;
- (BOOL)mipmaps;
- (PXGAdjustedTexturePayload)init;
- (PXGAdjustedTexturePayload)initWithTexture:(id)a3 adjustment:(id)a4 mipmaps:(BOOL)a5;
- (PXGDisplayAssetAdjustment)adjustment;
- (PXGImageTexture)texture;
- (unint64_t)hash;
@end

@implementation PXGAdjustedTexturePayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

- (BOOL)mipmaps
{
  return self->_mipmaps;
}

- (PXGDisplayAssetAdjustment)adjustment
{
  return self->_adjustment;
}

- (PXGImageTexture)texture
{
  return self->_texture;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 texture];
    v8 = [(PXGAdjustedTexturePayload *)self texture];
    char v9 = [v7 isEqual:v8];

    char v10 = [v6 mipmaps];
    BOOL v11 = [(PXGAdjustedTexturePayload *)self mipmaps];
    v12 = [v6 adjustment];
    if (v12
      || ([(PXGAdjustedTexturePayload *)self adjustment],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [v6 adjustment];
      v14 = [(PXGAdjustedTexturePayload *)self adjustment];
      char v15 = [v13 isEqual:v14];

      if (v12)
      {
LABEL_9:

        char v16 = v9 & v15 & (v10 ^ v11 ^ 1);
        goto LABEL_10;
      }
    }
    else
    {
      char v15 = 1;
    }

    goto LABEL_9;
  }
  char v16 = 0;
LABEL_10:

  return v16;
}

- (unint64_t)hash
{
  v3 = [(PXGAdjustedTexturePayload *)self texture];
  uint64_t v4 = [v3 hash];
  id v5 = [(PXGAdjustedTexturePayload *)self adjustment];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = (v6 ^ v4) + [(PXGAdjustedTexturePayload *)self mipmaps];

  return v7;
}

- (PXGAdjustedTexturePayload)initWithTexture:(id)a3 adjustment:(id)a4 mipmaps:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGAdjustedTexturePayload;
  BOOL v11 = [(PXGAdjustedTexturePayload *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_texture, a3);
    objc_storeStrong((id *)&v12->_adjustment, a4);
    v12->_mipmaps = a5;
  }

  return v12;
}

- (PXGAdjustedTexturePayload)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGTextureManager.mm", 1935, @"%s is not available as initializer", "-[PXGAdjustedTexturePayload init]");

  abort();
}

@end