@interface PXPhotosViewLens
+ (PXPhotosViewLens)grid;
+ (PXPhotosViewLens)zoomableGrid;
+ (id)lensForCurationLength:(int64_t)a3 isDefault:(BOOL)a4;
- (BOOL)allowsActionMenu;
- (BOOL)allowsActionType:(id)a3;
- (BOOL)allowsBlur;
- (BOOL)allowsFooter;
- (BOOL)allowsScrollSnap;
- (BOOL)ignoresTopSafeAreaInset;
- (BOOL)isDefaultCurationLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsCuration;
- (NSString)description;
- (NSString)identifier;
- (NSString)symbolName;
- (NSString)title;
- (PXPhotosViewLens)init;
- (PXPhotosViewLens)initWithTitle:(id)a3 symbolName:(id)a4 defaultSectionBodyStyle:(int64_t)a5;
- (int64_t)curationLength;
- (int64_t)defaultSectionBodyStyle;
- (unint64_t)hash;
@end

@implementation PXPhotosViewLens

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (int64_t)defaultSectionBodyStyle
{
  return self->_defaultSectionBodyStyle;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    BOOL v7 = [(NSString *)identifier isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; title:%@ symbolName:%@ sectionBodyStyle:%ld>",
    v5,
    self,
    self->_title,
    self->_symbolName,
  v6 = self->_defaultSectionBodyStyle);

  return (NSString *)v6;
}

- (BOOL)allowsFooter
{
  return 1;
}

- (BOOL)ignoresTopSafeAreaInset
{
  return 0;
}

- (BOOL)allowsActionType:(id)a3
{
  return 1;
}

- (BOOL)allowsScrollSnap
{
  if ([(PXPhotosViewLens *)self defaultSectionBodyStyle] == 3) {
    return 1;
  }
  v3 = +[PXPhotosGridSettings sharedInstance];
  char v4 = [v3 enableBlurAndScrollSnapInContiguousGrids];

  return v4;
}

- (BOOL)allowsBlur
{
  if ([(PXPhotosViewLens *)self defaultSectionBodyStyle] == 3) {
    return 1;
  }
  v3 = +[PXPhotosGridSettings sharedInstance];
  char v4 = [v3 enableBlurAndScrollSnapInContiguousGrids];

  return v4;
}

- (BOOL)allowsActionMenu
{
  return 1;
}

- (BOOL)isDefaultCurationLength
{
  return 1;
}

- (int64_t)curationLength
{
  return 0;
}

- (PXPhotosViewLens)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosViewLens.m", 132, @"%s is not available as initializer", "-[PXPhotosViewLens init]");

  abort();
}

- (PXPhotosViewLens)initWithTitle:(id)a3 symbolName:(id)a4 defaultSectionBodyStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosViewLens;
  v10 = [(PXPhotosViewLens *)&v19 init];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    uint64_t v14 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    symbolName = v10->_symbolName;
    v10->_symbolName = (NSString *)v16;

    v10->_defaultSectionBodyStyle = a5;
  }

  return v10;
}

+ (id)lensForCurationLength:(int64_t)a3 isDefault:(BOOL)a4
{
  BOOL v4 = a4;
  if (lensForCurationLength_isDefault__onceToken != -1) {
    dispatch_once(&lensForCurationLength_isDefault__onceToken, &__block_literal_global_200_154390);
  }
  uint64_t v6 = 1000;
  if (!v4) {
    uint64_t v6 = 1;
  }
  BOOL v7 = [NSNumber numberWithInteger:v6 * a3];
  id v8 = [(id)lensForCurationLength_isDefault__cachedLenses objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = [[_PXPhotosCurationLengthLens alloc] initWithCurationLength:a3 isDefault:v4];
    [(id)lensForCurationLength_isDefault__cachedLenses setObject:v8 forKeyedSubscript:v7];
  }

  return v8;
}

void __52__PXPhotosViewLens_lensForCurationLength_isDefault___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)lensForCurationLength_isDefault__cachedLenses;
  lensForCurationLength_isDefault__cachedLenses = (uint64_t)v0;
}

+ (PXPhotosViewLens)grid
{
  if (grid_onceToken != -1) {
    dispatch_once(&grid_onceToken, &__block_literal_global_198_154407);
  }
  v2 = (void *)grid_lens;
  return (PXPhotosViewLens *)v2;
}

void __24__PXPhotosViewLens_grid__block_invoke()
{
  id v0 = [PXPhotosViewLens alloc];
  PXLocalizedStringFromTable(@"PXPhotosGridLensAll", @"LemonadeLocalizable");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(PXPhotosViewLens *)v0 initWithTitle:v3 symbolName:@"square.grid.3x3.fill" defaultSectionBodyStyle:0];
  v2 = (void *)grid_lens;
  grid_lens = v1;
}

+ (PXPhotosViewLens)zoomableGrid
{
  if (zoomableGrid_onceToken != -1) {
    dispatch_once(&zoomableGrid_onceToken, &__block_literal_global_154415);
  }
  v2 = (void *)zoomableGrid_lens;
  return (PXPhotosViewLens *)v2;
}

void __32__PXPhotosViewLens_zoomableGrid__block_invoke()
{
  id v0 = [PXPhotosViewLens alloc];
  PXLocalizedStringFromTable(@"PXPhotosGridLensAll", @"LemonadeLocalizable");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(PXPhotosViewLens *)v0 initWithTitle:v3 symbolName:@"square.grid.3x3.fill" defaultSectionBodyStyle:1];
  v2 = (void *)zoomableGrid_lens;
  zoomableGrid_lens = v1;
}

@end