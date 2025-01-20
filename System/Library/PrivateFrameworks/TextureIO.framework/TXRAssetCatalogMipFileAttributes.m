@interface TXRAssetCatalogMipFileAttributes
- (BOOL)doesSpecifyAllFaces;
- (TXRAssetCatalogMipFileAttributes)init;
- (unint64_t)face;
- (unint64_t)level;
- (void)setFace:(unint64_t)a3;
- (void)setLevel:(unint64_t)a3;
- (void)specifyAllFaces;
@end

@implementation TXRAssetCatalogMipFileAttributes

- (TXRAssetCatalogMipFileAttributes)init
{
  v5.receiver = self;
  v5.super_class = (Class)TXRAssetCatalogMipFileAttributes;
  v2 = [(TXRAssetCatalogFileAttributes *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TXRAssetCatalogMipFileAttributes *)v2 specifyAllFaces];
  }
  return v3;
}

- (void)setFace:(unint64_t)a3
{
  if (a3 <= 5) {
    unint64_t face = self->_face;
  }
  else {
    unint64_t face = 5;
  }
  self->_unint64_t face = face;
}

- (unint64_t)face
{
  return self->_face;
}

- (void)specifyAllFaces
{
  self->_unint64_t face = 0xFFFFFFFFLL;
}

- (BOOL)doesSpecifyAllFaces
{
  return self->_face > 5;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

@end