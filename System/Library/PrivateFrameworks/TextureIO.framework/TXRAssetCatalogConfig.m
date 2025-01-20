@interface TXRAssetCatalogConfig
- (NSSet)fileAttributesList;
- (TXRAssetCatalogConfig)initWithTexture:(id)a3;
- (TXRAssetCatalogFileAttributes)baseFileAttributes;
- (TXRTexture)texture;
- (unint64_t)displayColorSpace;
- (unint64_t)graphicsFeatureSet;
- (unint64_t)idiom;
- (unint64_t)memory;
- (unint64_t)mipmapOption;
- (unint64_t)pixelFormat;
- (unint64_t)scaleFactor;
- (void)addFileAttributesForLevel:(unint64_t)a3;
- (void)addFileAttributesForLevel:(unint64_t)a3 face:(unint64_t)a4;
- (void)addFileAttributesForLevel:(unint64_t)a3 face:(unint64_t)a4 fileFormat:(unint64_t)a5 colorSpace:(CGColorSpace *)a6 exifOrientation:(unsigned __int8)a7;
- (void)addFileAttributesForLevel:(unint64_t)a3 fileFormat:(unint64_t)a4 colorSpace:(CGColorSpace *)a5 exifOrientation:(unsigned __int8)a6;
- (void)setBaseFileAttributes:(id)a3;
- (void)setDisplayColorSpace:(unint64_t)a3;
- (void)setGraphicsFeatureSet:(unint64_t)a3;
- (void)setIdiom:(unint64_t)a3;
- (void)setMemory:(unint64_t)a3;
- (void)setMipmapOption:(unint64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setScaleFactor:(unint64_t)a3;
@end

@implementation TXRAssetCatalogConfig

- (TXRAssetCatalogConfig)initWithTexture:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TXRAssetCatalogConfig;
  v6 = [(TXRAssetCatalogConfig *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_texture, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    fileAttributesList = v7->_fileAttributesList;
    v7->_fileAttributesList = v8;

    v10 = objc_alloc_init(TXRAssetCatalogFileAttributes);
    baseFileAttributes = v7->_baseFileAttributes;
    v7->_baseFileAttributes = v10;
  }
  return v7;
}

- (void)addFileAttributesForLevel:(unint64_t)a3
{
  v9 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  [(TXRAssetCatalogMipFileAttributes *)v9 setLevel:a3];
  id v5 = [(NSMutableSet *)self->_fileAttributesList objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      if ([v7 level] == a3) {
        [(NSMutableSet *)self->_fileAttributesList removeObject:v7];
      }
      uint64_t v8 = [v5 nextObject];

      v7 = (void *)v8;
    }
    while (v8);
  }
  [(NSMutableSet *)self->_fileAttributesList addObject:v9];
}

- (void)addFileAttributesForLevel:(unint64_t)a3 face:(unint64_t)a4
{
  v11 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  [(TXRAssetCatalogMipFileAttributes *)v11 setLevel:a3];
  [(TXRAssetCatalogMipFileAttributes *)v11 setFace:a4];
  v7 = [(NSMutableSet *)self->_fileAttributesList objectEnumerator];
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      if ([v9 level] == a3
        && ([v9 face] == a4 || objc_msgSend(v9, "doesSpecifyAllFaces")))
      {
        [(NSMutableSet *)self->_fileAttributesList removeObject:v9];
      }
      uint64_t v10 = [v7 nextObject];

      v9 = (void *)v10;
    }
    while (v10);
  }
  [(NSMutableSet *)self->_fileAttributesList addObject:v11];
}

- (void)addFileAttributesForLevel:(unint64_t)a3 fileFormat:(unint64_t)a4 colorSpace:(CGColorSpace *)a5 exifOrientation:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  v15 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  [(TXRAssetCatalogMipFileAttributes *)v15 setLevel:a3];
  [(TXRAssetCatalogFileAttributes *)v15 setExifOrientation:v6];
  [(TXRAssetCatalogFileAttributes *)v15 setFileFormat:a4];
  [(TXRAssetCatalogFileAttributes *)v15 setColorSpace:a5];
  v11 = [(NSMutableSet *)self->_fileAttributesList objectEnumerator];
  uint64_t v12 = [v11 nextObject];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    do
    {
      if ([v13 level] == a3) {
        [(NSMutableSet *)self->_fileAttributesList removeObject:v13];
      }
      uint64_t v14 = [v11 nextObject];

      objc_super v13 = (void *)v14;
    }
    while (v14);
  }
  [(NSMutableSet *)self->_fileAttributesList addObject:v15];
}

- (void)addFileAttributesForLevel:(unint64_t)a3 face:(unint64_t)a4 fileFormat:(unint64_t)a5 colorSpace:(CGColorSpace *)a6 exifOrientation:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  v17 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  [(TXRAssetCatalogMipFileAttributes *)v17 setLevel:a3];
  [(TXRAssetCatalogMipFileAttributes *)v17 setFace:a4];
  [(TXRAssetCatalogFileAttributes *)v17 setExifOrientation:v7];
  [(TXRAssetCatalogFileAttributes *)v17 setFileFormat:a5];
  [(TXRAssetCatalogFileAttributes *)v17 setColorSpace:a6];
  objc_super v13 = [(NSMutableSet *)self->_fileAttributesList objectEnumerator];
  uint64_t v14 = [v13 nextObject];
  if (v14)
  {
    v15 = (void *)v14;
    do
    {
      if ([v15 level] == a3
        && ([v15 face] == a4 || objc_msgSend(v15, "doesSpecifyAllFaces")))
      {
        [(NSMutableSet *)self->_fileAttributesList removeObject:v15];
      }
      uint64_t v16 = [v13 nextObject];

      v15 = (void *)v16;
    }
    while (v16);
  }
  [(NSMutableSet *)self->_fileAttributesList addObject:v17];
}

- (TXRAssetCatalogFileAttributes)baseFileAttributes
{
  return self->_baseFileAttributes;
}

- (void)setBaseFileAttributes:(id)a3
{
}

- (NSSet)fileAttributesList
{
  return &self->_fileAttributesList->super;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)mipmapOption
{
  return self->_mipmapOption;
}

- (void)setMipmapOption:(unint64_t)a3
{
  self->_mipmapOption = a3;
}

- (TXRTexture)texture
{
  return self->_texture;
}

- (unint64_t)memory
{
  return self->_memory;
}

- (void)setMemory:(unint64_t)a3
{
  self->_memory = a3;
}

- (unint64_t)graphicsFeatureSet
{
  return self->_graphicsFeatureSet;
}

- (void)setGraphicsFeatureSet:(unint64_t)a3
{
  self->_graphicsFeatureSet = a3;
}

- (unint64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(unint64_t)a3
{
  self->_idiom = a3;
}

- (unint64_t)displayColorSpace
{
  return self->_displayColorSpace;
}

- (void)setDisplayColorSpace:(unint64_t)a3
{
  self->_displayColorSpace = a3;
}

- (unint64_t)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unint64_t)a3
{
  self->_scaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileAttributesList, 0);
  objc_storeStrong((id *)&self->_baseFileAttributes, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end