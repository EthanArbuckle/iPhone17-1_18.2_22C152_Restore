@interface STPropVariant
- (_SsrwPropVariant)propVariant;
- (id)asDataOfType:(int *)a3;
- (void)dealloc;
- (void)setBlobValue:(id)a3;
- (void)setLongValue:(int)a3;
- (void)setShortValue:(signed __int16)a3;
- (void)setStringValue:(id)a3;
@end

@implementation STPropVariant

- (void)setShortValue:(signed __int16)a3
{
  self->mProp.vt = 2;
  self->mProp.v.iVal = a3;
}

- (void)setLongValue:(int)a3
{
  self->mProp.vt = 3;
  self->mProp.v.lVal = a3;
}

- (void)setStringValue:(id)a3
{
  v4[2] = 0;
  v4[0] = 30;
  v4[1] = [a3 UTF8String];
  propVariantCopyContents((unsigned __int16 *)v4, (uint64_t)&self->mProp);
}

- (void)setBlobValue:(id)a3
{
  v7[0] = 65;
  id v4 = a3;
  v7[1] = [v4 length];
  id v5 = v4;
  uint64_t v6 = [v5 bytes];

  v7[2] = v6;
  propVariantCopyContents((unsigned __int16 *)v7, (uint64_t)&self->mProp);
}

- (_SsrwPropVariant)propVariant
{
  return &self->mProp;
}

- (id)asDataOfType:(int *)a3
{
  id v4 = 0;
  unsigned int vt = self->mProp.vt;
  if (vt <= 0x3F)
  {
    switch(vt)
    {
      case 2u:
        *a3 = 0;
        v8 = (void *)MEMORY[0x263EFF8F8];
        p_v = &self->mProp.v;
        size_t cbSize = 2;
        break;
      case 3u:
        *a3 = 1;
        v8 = (void *)MEMORY[0x263EFF8F8];
        p_v = &self->mProp.v;
        size_t cbSize = 4;
        break;
      case 0x1Eu:
        *a3 = 2;
        bstrVal = self->mProp.v.bstrVal;
        size_t cbSize = strlen((const char *)bstrVal) + 1;
        v8 = (void *)MEMORY[0x263EFF8F8];
        p_v = ($7BD1F95CDF8DF2E91110A12B66875B48 *)bstrVal;
        break;
      default:
        goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (vt == 64)
  {
    *a3 = 3;
    v16 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
    if (v16)
    {
      v12 = v16;
      if (!time_tFromWinFileTime(&self->mProp.v.blob.cbSize, v16))
      {
        v13 = (void *)MEMORY[0x263EFF8F8];
        v15 = v12;
        uint64_t v14 = 8;
        goto LABEL_24;
      }
      free(v12);
    }
LABEL_17:
    id v4 = 0;
    goto LABEL_20;
  }
  if (vt == 65)
  {
    *a3 = 5;
    v8 = (void *)MEMORY[0x263EFF8F8];
    p_v = ($7BD1F95CDF8DF2E91110A12B66875B48 *)self->mProp.v.blob.pData;
    size_t cbSize = self->mProp.v.blob.cbSize;
LABEL_19:
    id v4 = [v8 dataWithBytes:p_v length:cbSize];
    goto LABEL_20;
  }
  if (vt != 71) {
    goto LABEL_20;
  }
  *a3 = 4;
  uint64_t v10 = *(unsigned int *)self->mProp.v.bstrVal;
  if (v10 > 0xFFFFFFFB) {
    goto LABEL_17;
  }
  v11 = malloc_type_malloc(v10 + 4, 0x6F2CDB48uLL);
  if (!v11) {
    goto LABEL_17;
  }
  v12 = v11;
  CsLeWriteUInt32(*(unsigned int *)self->mProp.v.bstrVal, v11);
  CsLeWriteUInt32(*((unsigned int *)self->mProp.v.bstrVal + 1), v12 + 1);
  memcpy(v12 + 2, *((const void **)self->mProp.v.bstrVal + 1), *(unsigned int *)self->mProp.v.bstrVal - 4);
  v13 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v14 = (*(_DWORD *)self->mProp.v.bstrVal + 4);
  v15 = v12;
LABEL_24:
  id v4 = [v13 dataWithBytes:v15 length:v14];
  free(v12);
LABEL_20:
  return v4;
}

- (void)dealloc
{
  propVariantCleanup((uint64_t)&self->mProp);
  v3.receiver = self;
  v3.super_class = (Class)STPropVariant;
  [(STPropVariant *)&v3 dealloc];
}

@end