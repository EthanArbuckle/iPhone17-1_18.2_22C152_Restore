@interface PXGMetalRenderTextureStore
- (PXGMetalRenderTextureStore)init;
- (void)_sortIfNeeded;
- (void)addTexture:(id *)a3;
- (void)dealloc;
- (void)drawWithOrder:(unint64_t)a3 enumerationBlock:(id)a4;
- (void)prepareForRender;
- (void)removeAllTextures;
@end

@implementation PXGMetalRenderTextureStore

void __43__PXGMetalRenderTextureStore__sortIfNeeded__block_invoke()
{
}

- (void)drawWithOrder:(unint64_t)a3 enumerationBlock:(id)a4
{
  id v11 = a4;
  [(PXGMetalRenderTextureStore *)self _sortIfNeeded];
  textures = self->_textures;
  int64_t count = self->_count;
  if (a3 == 1)
  {
    v8 = (void (**)(void, void))v11;
    if (count >= 1)
    {
      do
      {
        ((void (**)(id, $F298369A05749CD5593AC9B8ACBB2975 *))v8)[2](v11, textures);
        v8 = (void (**)(void, void))v11;
        textures = ($F298369A05749CD5593AC9B8ACBB2975 *)((char *)textures + 64);
        --count;
      }
      while (count);
    }
  }
  else
  {
    v8 = (void (**)(void, void))v11;
    if (count >= 1)
    {
      unint64_t v9 = count + 1;
      uint64_t v10 = (uint64_t)&textures[-1] + 64 * count - 16;
      do
      {
        ((void (**)(id, uint64_t))v8)[2](v11, v10);
        v8 = (void (**)(void, void))v11;
        --v9;
        v10 -= 64;
      }
      while (v9 > 1);
    }
  }
}

- (void)_sortIfNeeded
{
  if (!self->_sorted)
  {
    self->_sorted = 1;
    qsort_b(self->_textures, self->_count, 0x40uLL, &__block_literal_global_293951);
  }
}

- (void)addTexture:(id *)a3
{
  int64_t count = self->_count;
  int64_t capacity = self->_capacity;
  if (count >= capacity)
  {
    if (capacity) {
      int64_t v5 = 2 * capacity;
    }
    else {
      int64_t v5 = 16;
    }
    self->_int64_t capacity = v5;
    _PXGArrayResize();
  }
  v6 = (_OWORD *)((char *)self->_textures + 64 * count);
  long long v7 = *(_OWORD *)&a3->var0;
  _NSRange var2 = a3->var2;
  long long v9 = *(_OWORD *)&a3[1].var0;
  v6[2] = *(_OWORD *)&a3->var3;
  v6[3] = v9;
  _OWORD *v6 = v7;
  v6[1] = var2;
  self->_int64_t count = count + 1;
  self->_sorted = 0;
}

- (void)removeAllTextures
{
  self->_int64_t count = 0;
  self->_sorted = 0;
}

- (PXGMetalRenderTextureStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderTextureStore;
  return [(PXGMetalRenderTextureStore *)&v3 init];
}

- (void)prepareForRender
{
  int64_t count = self->_count;
  if (count >= 1)
  {
    objc_super v3 = (char *)&self->_textures[1].var1 + 6;
    do
    {
      *objc_super v3 = 0;
      v3 += 64;
      --count;
    }
    while (count);
  }
}

- (void)dealloc
{
  free(self->_textures);
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderTextureStore;
  [(PXGMetalRenderTextureStore *)&v3 dealloc];
}

@end