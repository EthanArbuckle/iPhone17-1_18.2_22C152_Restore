@interface PXGSpriteMetadataStore
- (PXGSpriteMetadataStore)init;
- (const)resizableCapInsets;
- (unsigned)_indexOfResizableCapInsets:(id)a3;
- (unsigned)addResizableCapInsets:(id)a3;
- (unsigned)numberOfResizableCapInsets;
- (void)dealloc;
@end

@implementation PXGSpriteMetadataStore

- (const)resizableCapInsets
{
  return self->_resizableCapInsets;
}

- (unsigned)numberOfResizableCapInsets
{
  return self->_numberOfResizableCapInsets;
}

- (PXGSpriteMetadataStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXGSpriteMetadataStore;
  v2 = [(PXGSpriteMetadataStore *)&v9 init];
  v7 = v2;
  if (v2)
  {
    LODWORD(v3) = *(_DWORD *)off_1E5DAAF58;
    LODWORD(v4) = *((_DWORD *)off_1E5DAAF58 + 1);
    LODWORD(v5) = *((_DWORD *)off_1E5DAAF58 + 2);
    LODWORD(v6) = *((_DWORD *)off_1E5DAAF58 + 3);
    -[PXGSpriteMetadataStore addResizableCapInsets:](v2, "addResizableCapInsets:", v3, v4, v5, v6);
  }
  return v7;
}

- (unsigned)addResizableCapInsets:(id)a3
{
  float var3 = a3.var3;
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  LODWORD(numberOfResizableCapInsets) = -[PXGSpriteMetadataStore _indexOfResizableCapInsets:](self, "_indexOfResizableCapInsets:");
  if (numberOfResizableCapInsets == 0xFFFF)
  {
    uint64_t numberOfResizableCapInsets = self->_numberOfResizableCapInsets;
    self->_uint64_t numberOfResizableCapInsets = numberOfResizableCapInsets + 1;
    unsigned int resizableCapInsetsCapacity = self->_resizableCapInsetsCapacity;
    if (resizableCapInsetsCapacity < (unsigned __int16)(numberOfResizableCapInsets + 1))
    {
      if (self->_resizableCapInsetsCapacity)
      {
        do
          LOWORD(resizableCapInsetsCapacity) = 2 * resizableCapInsetsCapacity;
        while ((resizableCapInsetsCapacity & 0xFFFE) < (unsigned __int16)(numberOfResizableCapInsets + 1));
      }
      else
      {
        LOWORD(resizableCapInsetsCapacity) = numberOfResizableCapInsets + 1;
      }
      self->_unsigned int resizableCapInsetsCapacity = resizableCapInsetsCapacity;
      _PXGArrayResize();
    }
    v10 = &self->_resizableCapInsets[numberOfResizableCapInsets];
    v10->float var0 = var0;
    v10->float var1 = var1;
    v10->float var2 = var2;
    v10->float var3 = var3;
  }
  return numberOfResizableCapInsets;
}

- (unsigned)_indexOfResizableCapInsets:(id)a3
{
  if (self->_numberOfResizableCapInsets)
  {
    uint64_t v3 = 0;
    p_float var2 = &self->_resizableCapInsets->var2;
    while (1)
    {
      BOOL v5 = a3.var0 == *(p_var2 - 2) && a3.var1 == *(p_var2 - 1);
      BOOL v6 = v5 && a3.var2 == *p_var2;
      if (v6 && a3.var3 == p_var2[1]) {
        break;
      }
      ++v3;
      p_var2 += 4;
      if (self->_numberOfResizableCapInsets == v3) {
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    LOWORD(v3) = -1;
  }
  return v3;
}

- (void)dealloc
{
  free(self->_resizableCapInsets);
  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteMetadataStore;
  [(PXGSpriteMetadataStore *)&v3 dealloc];
}

@end