@interface TUIStyledBox
- (BOOL)allowsGroupBlending;
- (BOOL)clipsToBounds;
- (BOOL)continuousCorners;
- (CGSize)shadowOffset;
- (Class)layoutClass;
- (NSString)blendMode;
- (TUIStyledBox)init;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)shadowColor;
- (UIEdgeInsets)insets;
- (double)borderWidth;
- (double)cornerRadius;
- (double)shadowOpacity;
- (double)shadowRadius;
- (void)setAllowsGroupBlending:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBlendMode:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation TUIStyledBox

- (TUIStyledBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIStyledBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    result->super.super._storage._data = TUIStyledBoxStorageDataset | 1;
  }
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)setInsets:(UIEdgeInsets)a3
{
  float top = a3.top;
  p_storage = &self->super.super._storage;
  float left = a3.left;
  float bottom = a3.bottom;
  float right = a3.right;
  if (TUIInsets32Equal(top, left, bottom, right, 0.0, 0.0, 0.0, 0.0))
  {
    uint64_t v8 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Fu);
    if (!v8) {
      return;
    }
    DataForKey = (float *)v8;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Fu);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x1Fu, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = top;
  DataForKey[1] = left;
  DataForKey[2] = bottom;
  DataForKey[3] = right;
}

- (UIEdgeInsets)insets
{
  uint64_t v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Fu);
  objc_super v3 = (float *)&TUIInsets32Zero;
  if (v2) {
    objc_super v3 = (float *)v2;
  }
  double v4 = *v3;
  double v5 = v3[1];
  double v6 = v3[2];
  double v7 = v3[3];
  result.float right = v7;
  result.float bottom = v6;
  result.float left = v5;
  result.float top = v4;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x11u);

  return (UIColor *)ObjectForKey;
}

- (void)setCornerRadius:(double)a3
{
  p_storage = &self->super.super._storage;
  float v4 = a3;
  if (v4 == 0.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x14u);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x14u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x14u, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)cornerRadius
{
  uint64_t v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x14u);
  if (v2) {
    return *v2;
  }
  else {
    return 0.0;
  }
}

- (void)setShadowColor:(id)a3
{
}

- (UIColor)shadowColor
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Cu);

  return (UIColor *)ObjectForKey;
}

- (void)setShadowOffset:(CGSize)a3
{
  p_storage = &self->super.super._storage;
  float width = a3.width;
  float height = a3.height;
  if (TUISize32Equal(width, height, 0.0, 0.0))
  {
    uint64_t v6 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Bu);
    if (!v6) {
      return;
    }
    DataForKey = (float *)v6;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Bu);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x1Bu, 8uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = width;
  DataForKey[1] = height;
}

- (CGSize)shadowOffset
{
  uint64_t v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Bu);
  objc_super v3 = (float *)&TUISize32Zero;
  if (v2) {
    objc_super v3 = (float *)v2;
  }
  double v4 = *v3;
  double v5 = v3[1];
  result.float height = v5;
  result.float width = v4;
  return result;
}

- (void)setShadowOpacity:(double)a3
{
  p_storage = &self->super.super._storage;
  float v4 = a3;
  if (v4 == 1.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 7u);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 7u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 7u, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)shadowOpacity
{
  uint64_t v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 7u);
  if (v2) {
    return *v2;
  }
  else {
    return 1.0;
  }
}

- (void)setBorderColor:(id)a3
{
}

- (UIColor)borderColor
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x16u);

  return (UIColor *)ObjectForKey;
}

- (void)setBlendMode:(id)a3
{
}

- (NSString)blendMode
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 1u);

  return (NSString *)ObjectForKey;
}

- (void)setContinuousCorners:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super.super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super.super._flags + 2);
  int v5 = 0x10000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->super.super._flags = *(_DWORD *)&self->super.super._flags & 0xEFFFFFFF | v5;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = v4;
}

- (BOOL)continuousCorners
{
  return ((unint64_t)*(_DWORD *)&self->super.super._flags >> 28) & 1;
}

- (void)setClipsToBounds:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)clipsToBounds
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 4) & 1;
}

- (void)setAllowsGroupBlending:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)allowsGroupBlending
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 5) & 1;
}

- (void)setShadowRadius:(double)a3
{
  p_storage = &self->super.super._storage;
  float v4 = a3;
  if (v4 == 0.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Au);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Au);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x1Au, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)shadowRadius
{
  uint64_t v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x1Au);
  if (v2) {
    return *v2;
  }
  else {
    return 0.0;
  }
}

- (void)setBorderWidth:(double)a3
{
  p_storage = &self->super.super._storage;
  float v4 = a3;
  if (v4 == 0.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x15u);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x15u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x15u, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)borderWidth
{
  uint64_t v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x15u);
  if (v2) {
    return *v2;
  }
  else {
    return 0.0;
  }
}

@end