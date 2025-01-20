@interface TUIImageBox
- ($881BB7C90C7D0DFCC1492E3DC022A30F)intrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)intrinsicWidth;
- (BOOL)continuousCorners;
- (BOOL)crossfadesContents;
- (BOOL)hflipForRTL;
- (BOOL)shouldRasterize;
- (Class)layoutClass;
- (NSString)blendMode;
- (NSString)contentsGravity;
- (NSString)filter;
- (NSString)resourceKind;
- (NSString)urlString;
- (NSURL)baseURL;
- (TUIImageBox)init;
- (UIColor)fallbackColor;
- (UIColor)maskColor;
- (double)cornerRadius;
- (double)maxAspectRatio;
- (double)opacity;
- (id)resourceInstance;
- (id)resourceOptions;
- (unint64_t)load;
- (void)setBaseURL:(id)a3;
- (void)setBlendMode:(id)a3;
- (void)setContentsGravity:(id)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCrossfadesContents:(BOOL)a3;
- (void)setFallbackColor:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHflipForRTL:(BOOL)a3;
- (void)setIntrinsicHeight:(id *)a3;
- (void)setIntrinsicWidth:(id *)a3;
- (void)setLoad:(unint64_t)a3;
- (void)setMaskColor:(id)a3;
- (void)setMaxAspectRatio:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setResourceInstance:(id)a3;
- (void)setResourceKind:(id)a3;
- (void)setResourceOptions:(id)a3;
- (void)setShouldRasterize:(BOOL)a3;
- (void)setUrlString:(id)a3;
@end

@implementation TUIImageBox

- (TUIImageBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIImageBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    result->super._storage._data = TUIImageBoxStorageDataset | 1;
  }
  return result;
}

- (void)setLoad:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super._flags + 2);
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xFCFFFFFF | ((a3 & 3) << 24);
  *((unsigned char *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (unint64_t)load
{
  return *(_DWORD *)((char *)&self->super._flags + 3) & 3;
}

- (void)setHflipForRTL:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super._flags + 2);
  int v5 = 0x4000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xFBFFFFFF | v5;
  *((unsigned char *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)hflipForRTL
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 26) & 1;
}

- (void)setCrossfadesContents:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super._flags + 2);
  int v5 = 0x8000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xF7FFFFFF | v5;
  *((unsigned char *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)crossfadesContents
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 27) & 1;
}

- (void)setContinuousCorners:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super._flags + 2);
  int v5 = 0x10000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xEFFFFFFF | v5;
  *((unsigned char *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)continuousCorners
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 28) & 1;
}

- (void)setShouldRasterize:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super._flags + 2);
  int v5 = 0x20000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xDFFFFFFF | v5;
  *((unsigned char *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)shouldRasterize
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 29) & 1;
}

- (void)setIntrinsicWidth:(id *)a3
{
  uint64_t v4 = v3;
  p_storage = &self->super._storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 6u);
    if (!v7) {
      return;
    }
    DataForKey = (void *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 6u);
  }
  else
  {
    DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 6u, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  void *DataForKey = a3;
  DataForKey[1] = v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)intrinsicWidth
{
  uint64_t v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 6u);
  uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3) {
    uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  }
  return *v4;
}

- (void)setIntrinsicHeight:(id *)a3
{
  uint64_t v4 = v3;
  p_storage = &self->super._storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 5u);
    if (!v7) {
      return;
    }
    DataForKey = (void *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 5u);
  }
  else
  {
    DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 5u, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  void *DataForKey = a3;
  DataForKey[1] = v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)intrinsicHeight
{
  uint64_t v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 5u);
  uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3) {
    uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  }
  return *v4;
}

- (void)setResourceKind:(id)a3
{
}

- (NSString)resourceKind
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x19u);

  return (NSString *)ObjectForKey;
}

- (void)setResourceInstance:(id)a3
{
}

- (id)resourceInstance
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x18u);

  return ObjectForKey;
}

- (void)setResourceOptions:(id)a3
{
}

- (id)resourceOptions
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x29u);

  return ObjectForKey;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)urlString
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 4u);

  return (NSString *)ObjectForKey;
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)baseURL
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 3u);

  return (NSURL *)ObjectForKey;
}

- (void)setMaskColor:(id)a3
{
}

- (UIColor)maskColor
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0xCu);

  return (UIColor *)ObjectForKey;
}

- (void)setFallbackColor:(id)a3
{
}

- (UIColor)fallbackColor
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0xFu);

  return (UIColor *)ObjectForKey;
}

- (void)setContentsGravity:(id)a3
{
}

- (NSString)contentsGravity
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 2u);

  return (NSString *)ObjectForKey;
}

- (void)setFilter:(id)a3
{
}

- (NSString)filter
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x10u);

  return (NSString *)ObjectForKey;
}

- (void)setBlendMode:(id)a3
{
}

- (NSString)blendMode
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 1u);

  return (NSString *)ObjectForKey;
}

- (void)setCornerRadius:(double)a3
{
  p_storage = &self->super._storage;
  float v4 = a3;
  if (v4 == 0.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x14u);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x14u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x14u, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)cornerRadius
{
  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x14u);
  if (v2) {
    return *v2;
  }
  else {
    return 0.0;
  }
}

- (void)setOpacity:(double)a3
{
  p_storage = &self->super._storage;
  float v4 = a3;
  if (v4 == 1.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x2Du);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x2Du);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x2Du, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)opacity
{
  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x2Du);
  if (v2) {
    return *v2;
  }
  else {
    return 1.0;
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

@end