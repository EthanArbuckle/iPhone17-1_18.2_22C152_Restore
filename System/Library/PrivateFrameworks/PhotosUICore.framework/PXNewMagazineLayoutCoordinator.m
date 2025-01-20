@interface PXNewMagazineLayoutCoordinator
- (BOOL)stop;
- (BOOL)stopIfAnyGoodLayout;
- (BOOL)validateCurrentLayout;
- (NSArray)paddingInputs;
- (NSMutableArray)qualifiedLayouts;
- (PXNewMagazineLayoutCoordinator)initWithPaddingInputs:(id)a3 tileGrid:(id)a4 tileAspectRatio:(double)a5 stopIfAnyGoodLayout:(BOOL)a6;
- (PXNewMagazineRectArray)currentBestLayout;
- (PXNewMagazineRectArray)currentLayout;
- (double)scoreOfLayout:(id)a3;
- (double)tileAspectRatio;
- (unint64_t)currentIndex;
- (unint64_t)currentLayoutsCount;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setQualifiedLayouts:(id)a3;
- (void)setStop:(BOOL)a3;
- (void)validateCurrentLayoutAsFallback;
@end

@implementation PXNewMagazineLayoutCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_qualifiedLayouts, 0);
  objc_storeStrong((id *)&self->_paddingInputs, 0);
  objc_storeStrong((id *)&self->_fallbackLayout, 0);
}

- (void)setStop:(BOOL)a3
{
  self->_stop = a3;
}

- (BOOL)stop
{
  return self->_stop;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentLayout:(id)a3
{
}

- (PXNewMagazineRectArray)currentLayout
{
  return self->_currentLayout;
}

- (void)setQualifiedLayouts:(id)a3
{
}

- (NSMutableArray)qualifiedLayouts
{
  return self->_qualifiedLayouts;
}

- (BOOL)stopIfAnyGoodLayout
{
  return self->_stopIfAnyGoodLayout;
}

- (double)tileAspectRatio
{
  return self->_tileAspectRatio;
}

- (NSArray)paddingInputs
{
  return self->_paddingInputs;
}

- (PXNewMagazineRectArray)currentBestLayout
{
  v3 = [(PXNewMagazineLayoutCoordinator *)self qualifiedLayouts];
  [v3 sortUsingComparator:&__block_literal_global_33312];
  if ([v3 count])
  {
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v4 = self->_fallbackLayout;
  }
  v5 = v4;

  return v5;
}

uint64_t __51__PXNewMagazineLayoutCoordinator_currentBestLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 score];
  double v6 = v5;
  [v4 score];
  double v8 = v7;

  if (v6 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (unint64_t)currentLayoutsCount
{
  v3 = [(PXNewMagazineLayoutCoordinator *)self qualifiedLayouts];
  unint64_t v4 = [v3 count];

  if (!v4) {
    return self->_fallbackLayout != 0;
  }
  return v4;
}

- (double)scoreOfLayout:(id)a3
{
  id v5 = a3;
  double v6 = [(PXNewMagazineLayoutCoordinator *)self paddingInputs];
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXNewMagazineLayoutCoordinator.m" lineNumber:80 description:@"Output frames and inputs should be the same"];
  }
  [(PXNewMagazineLayoutCoordinator *)self tileAspectRatio];
  if ([v5 count])
  {
    double v8 = [v6 objectAtIndexedSubscript:0];
    [v8 size];

    if (v5) {
      objc_msgSend(v5, "rectAtIndex:", 0, (unsigned __int128)0);
    }
    PXSizeGetAspectRatio();
  }
  double v9 = 0.0 / (double)(unint64_t)[v5 count];

  return v9;
}

- (void)validateCurrentLayoutAsFallback
{
  id v5 = [(PXNewMagazineLayoutCoordinator *)self currentLayout];
  v3 = [v5 immutableCopyForCurrentRectsCount];
  fallbackLayout = self->_fallbackLayout;
  self->_fallbackLayout = v3;
}

- (BOOL)validateCurrentLayout
{
  v3 = [(PXNewMagazineLayoutCoordinator *)self qualifiedLayouts];
  unint64_t v4 = [(PXNewMagazineLayoutCoordinator *)self currentLayout];
  [(PXNewMagazineLayoutCoordinator *)self scoreOfLayout:v4];
  double v6 = v5;
  BOOL v7 = v5 < 0.12;
  if (v5 < 0.12)
  {
    fallbackLayout = self->_fallbackLayout;
    self->_fallbackLayout = 0;

    double v9 = [v4 immutableCopyForCurrentRectsCount];
    [v9 setScore:v6];
    [v3 addObject:v9];
    if ([v3 count]) {
      [(PXNewMagazineLayoutCoordinator *)self setStop:1];
    }
  }
  else
  {
    double v9 = 0;
  }
  if (![v3 count] && v6 < self->_currentBestScore)
  {
    self->_currentBestScore = v6;
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      v10 = [v4 immutableCopyForCurrentRectsCount];
    }
    v11 = self->_fallbackLayout;
    self->_fallbackLayout = v10;

    BOOL v7 = 1;
  }
  if ([(PXNewMagazineLayoutCoordinator *)self stopIfAnyGoodLayout]) {
    [(PXNewMagazineLayoutCoordinator *)self setStop:1];
  }

  return v7;
}

- (PXNewMagazineLayoutCoordinator)initWithPaddingInputs:(id)a3 tileGrid:(id)a4 tileAspectRatio:(double)a5 stopIfAnyGoodLayout:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXNewMagazineLayoutCoordinator;
  v13 = [(PXNewMagazineLayoutCoordinator *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_paddingInputs, a3);
    v14->_tileAspectRatio = a5;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    qualifiedLayouts = v14->_qualifiedLayouts;
    v14->_qualifiedLayouts = (NSMutableArray *)v15;

    v17 = -[PXNewMagazineRectArray initWithSize:tileGrid:]([PXNewMagazineRectArray alloc], "initWithSize:tileGrid:", [v11 count], v12);
    currentLayout = v14->_currentLayout;
    v14->_currentLayout = v17;

    v14->_stopIfAnyGoodLayout = a6;
    v14->_currentBestScore = 10000.0;
  }

  return v14;
}

@end