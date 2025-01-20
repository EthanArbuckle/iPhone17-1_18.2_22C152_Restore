@interface TUIWPBox
+ (id)textModelBuilderWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 alignment:(int64_t)a6 writingDirection:(int64_t)a7 language:(id)a8 shouldHyphenate:(BOOL)a9 service:(id)a10;
- (BOOL)allowHangingPunctuation;
- (BOOL)allowShrinkToFit;
- (BOOL)axStaticText;
- (BOOL)hideEllipses;
- (Class)layoutClass;
- (NSAttributedString)placeholderString;
- (NSString)blendMode;
- (NSString)string;
- (TUITextModel)textModel;
- (TUIWPBox)init;
- (TUIWPBox)initWithTextModel:(id)a3;
- (TUIWPStorage)storage;
- (unint64_t)maxLines;
- (void)setAllowHangingPunctuation:(BOOL)a3;
- (void)setAllowShrinkToFit:(BOOL)a3;
- (void)setBlendMode:(id)a3;
- (void)setHideEllipses:(BOOL)a3;
- (void)setMaxLines:(unint64_t)a3;
- (void)setPlaceholderString:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTextModel:(id)a3;
@end

@implementation TUIWPBox

+ (id)textModelBuilderWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 alignment:(int64_t)a6 writingDirection:(int64_t)a7 language:(id)a8 shouldHyphenate:(BOOL)a9 service:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a10;
  LOBYTE(v21) = a9;
  v19 = [[TUIWPBuilder alloc] initWithFontSpec:v15 style:a4 color:v16 alignment:a6 writingDirection:a7 language:v17 shouldHyphenate:v21 service:v18];

  return v19;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (TUIWPBox)initWithTextModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIWPBox;
  v6 = [(TUIBox *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->super.super._storage._data = TUIWPBoxStorageDataset | 1;
    objc_storeStrong((id *)&v6->_wpStorage, a3);
    [(TUIBox *)v7 setAXElement:1];
  }

  return v7;
}

- (TUIWPBox)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUIWPBox;
  v2 = [(TUIBox *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->super.super._storage._data = TUIWPBoxStorageDataset | 1;
    [(TUIBox *)v2 setAXElement:1];
  }
  return v3;
}

- (TUITextModel)textModel
{
  return (TUITextModel *)self->_wpStorage;
}

- (void)setTextModel:(id)a3
{
}

- (NSString)string
{
  if (self->_wpStorage)
  {
    v2 = [(TUIWPStorage *)self->_wpStorage string];
    id v3 = [v2 copy];
  }
  else
  {
    v2 = [(TUIWPBox *)self placeholderString];
    v4 = [v2 string];
    id v3 = [v4 copy];
  }

  return (NSString *)v3;
}

- (void)setMaxLines:(unint64_t)a3
{
  p_storage = &self->super.super._storage;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    int v4 = 0x7FFFFFFF;
  }
  else {
    int v4 = a3;
  }
  if (!v4)
  {
    uint64_t v6 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xDu);
    if (!v6) {
      return;
    }
    DataForKey = (_DWORD *)v6;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0xDu);
    goto LABEL_9;
  }
  DataForKey = (_DWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0xDu, 4uLL, 1);
  if (DataForKey) {
LABEL_9:
  }
    _DWORD *DataForKey = v4;
}

- (unint64_t)maxLines
{
  unint64_t result = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xDu);
  if (result)
  {
    if (*(_DWORD *)result == 0x7FFFFFFF) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return *(int *)result;
    }
  }
  return result;
}

- (void)setAllowHangingPunctuation:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)allowHangingPunctuation
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 6) & 1;
}

- (void)setAllowShrinkToFit:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)allowShrinkToFit
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 7) & 1;
}

- (void)setHideEllipses:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  uint64_t v4 = 0x10000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)hideEllipses
{
  return *((unsigned char *)&self->super.super._flags + 5) & 1;
}

- (void)setBlendMode:(id)a3
{
}

- (NSString)blendMode
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 1u);

  return (NSString *)ObjectForKey;
}

- (void)setPlaceholderString:(id)a3
{
}

- (NSAttributedString)placeholderString
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x24u);

  return (NSAttributedString *)ObjectForKey;
}

- (BOOL)axStaticText
{
  return 1;
}

- (TUIWPStorage)storage
{
  return self->_wpStorage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end