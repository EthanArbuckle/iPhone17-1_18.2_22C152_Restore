@interface TUIRatingsBox
+ (CGSize)imageSizeForSize:(unint64_t)a3;
+ (CGSize)starSizeForSize:(unint64_t)a3;
+ (CGSize)starSizeForSize:(unint64_t)a3 layoutSize:(CGSize)a4;
+ (double)spacingForSize:(unint64_t)a3;
+ (double)spacingForSize:(unint64_t)a3 layoutSize:(CGSize)a4;
+ (id)foregroundImageName;
+ (id)starRatingImage:(unint64_t)a3 size:(unint64_t)a4 fromCache:(id)a5 withScale:(double)a6;
+ (id)starRatingImageNameFromKind:(unint64_t)a3;
+ (unint64_t)backgroundKindFromString:(id)a3;
+ (unint64_t)sizeFromWidth:(id *)a3;
- (Class)layoutClass;
- (TUIRatingsBox)init;
- (double)rating;
- (unint64_t)size;
- (void)setRating:(double)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation TUIRatingsBox

- (TUIRatingsBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIRatingsBox;
  result = [(TUIStatefulElementBox *)&v3 init];
  if (result) {
    result->super.super.super._storage._data = TUIRatingsBoxStorageDataset | 1;
  }
  return result;
}

- (void)setRating:(double)a3
{
  p_storage = &self->super.super.super._storage;
  float v4 = a3;
  if (v4 == 0.0)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super.super._storage, 0x25u);
    if (!v5) {
      return;
    }
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x25u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super.super._storage, 0x25u, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = v4;
}

- (double)rating
{
  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super.super._storage, 0x25u);
  if (v2) {
    return *v2;
  }
  else {
    return 0.0;
  }
}

- (void)setSize:(unint64_t)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super._flags + 6);
  unint64_t v4 = (*(_DWORD *)&self->super.super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super.super._flags
                                                                         + 2) | (v3 << 16)) << 32)) & 0xFFFFFFF3FFFFFFFFLL | ((a3 & 3) << 34);
  *(_DWORD *)&self->super.super.super._flags = self->super.super.super._flags;
  *((unsigned char *)&self->super.super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super.super._flags + 2) = WORD2(v4);
}

- (unint64_t)size
{
  return ((unint64_t)*((unsigned __int16 *)&self->super.super.super._flags + 2) >> 2) & 3;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)sizeFromWidth:(id *)a3
{
  double v3 = *(float *)&a3;
  +[TUIRatingsBox imageSizeForSize:0];
  unint64_t result = 0;
  if (v5 < v3)
  {
    +[TUIRatingsBox imageSizeForSize:1];
    if (v6 >= v3) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

+ (double)spacingForSize:(unint64_t)a3
{
  double result = 4.0;
  if (a3 == 1) {
    double result = 9.0;
  }
  if (a3 == 2) {
    return 13.0;
  }
  return result;
}

+ (CGSize)starSizeForSize:(unint64_t)a3
{
  double v3 = 12.0;
  if (a3 == 1) {
    double v3 = 24.0;
  }
  if (a3 == 2) {
    double v3 = 36.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)imageSizeForSize:(unint64_t)a3
{
  +[TUIRatingsBox starSizeForSize:](TUIRatingsBox, "starSizeForSize:");
  double v5 = v4;
  double v7 = v6 * 5.0;
  +[TUIRatingsBox spacingForSize:a3];
  double v9 = v7 + v8 * 4.0;
  double v10 = v5;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (double)spacingForSize:(unint64_t)a3 layoutSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [a1 spacingForSize:];
  double v9 = v8;
  [a1 imageSizeForSize:a3];
  double v11 = width / v10;
  double v13 = height / v12;
  if (v11 >= v13) {
    double v11 = v13;
  }
  return v9 * v11;
}

+ (CGSize)starSizeForSize:(unint64_t)a3 layoutSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [a1 starSizeForSize:];
  double v9 = v8;
  double v11 = v10;
  [a1 imageSizeForSize:a3];
  double v13 = width / v12;
  double v15 = height / v14;
  if (v13 < v15) {
    double v15 = v13;
  }
  double v16 = v9 * v15;
  double v17 = v11 * v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

+ (id)foregroundImageName
{
  return [a1 starRatingImageNameFromKind:2];
}

+ (id)starRatingImageNameFromKind:(unint64_t)a3
{
  if (a3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:off_252938[a3]];
  }
  return v4;
}

+ (id)starRatingImage:(unint64_t)a3 size:(unint64_t)a4 fromCache:(id)a5 withScale:(double)a6
{
  id v9 = a5;
  double v10 = [(id)objc_opt_class() starRatingImageNameFromKind:a3];
  [(id)objc_opt_class() starSizeForSize:a4];
  double v12 = v11;
  if (UIAccessibilityIsBoldTextEnabled()) {
    uint64_t v13 = 7;
  }
  else {
    uint64_t v13 = 0;
  }
  LOBYTE(v17) = 1;
  double v14 = [v9 symbolImageWithName:v10 compatibleWithFontSize:v13 weight:0 scale:0 renderingMode:0 colors:v12 style:v17 contentsScale:0 layoutDirection:UIEdgeInsetsZero.top insets:UIEdgeInsetsZero.left baseline:UIEdgeInsetsZero.bottom];
  id v15 = [v14 newImageWithoutContentInsets];

  return v15;
}

+ (unint64_t)backgroundKindFromString:(id)a3
{
  if ([a3 isEqualToString:@"solid"]) {
    return 2;
  }
  else {
    return 0;
  }
}

@end