@interface PXMagazineLayoutCoordinator
- (BOOL)stop;
- (BOOL)stopIfAnyGoodLayout;
- (BOOL)validateCurrentLayout;
- (NSArray)paddingInputs;
- (NSMutableArray)qualifiedLayouts;
- (PXMagazineLayoutCoordinator)initWithPaddingInputs:(id)a3 tileAspectRatio:(double)a4 stopIfAnyGoodLayout:(BOOL)a5;
- (PXMagazineRectArray)currentLayout;
- (double)scoreOfLayout:(id)a3;
- (double)tileAspectRatio;
- (id)currentBestLayout;
- (unint64_t)currentIndex;
- (unint64_t)currentLayoutsCount;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setQualifiedLayouts:(id)a3;
- (void)setStop:(BOOL)a3;
- (void)validateCurrentLayoutAsFallback;
@end

@implementation PXMagazineLayoutCoordinator

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

- (PXMagazineRectArray)currentLayout
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

- (id)currentBestLayout
{
  v3 = [(PXMagazineLayoutCoordinator *)self qualifiedLayouts];
  [v3 sortUsingComparator:&__block_literal_global_213543];
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

uint64_t __48__PXMagazineLayoutCoordinator_currentBestLayout__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v3 = [(PXMagazineLayoutCoordinator *)self qualifiedLayouts];
  unint64_t v4 = [v3 count];

  if (!v4) {
    return self->_fallbackLayout != 0;
  }
  return v4;
}

- (double)scoreOfLayout:(id)a3
{
  id v5 = a3;
  double v6 = [(PXMagazineLayoutCoordinator *)self paddingInputs];
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXMagazineLayoutCoordinator.m" lineNumber:78 description:@"Output frames and inputs should be the same"];
  }
  [(PXMagazineLayoutCoordinator *)self tileAspectRatio];
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
  id v5 = [(PXMagazineLayoutCoordinator *)self currentLayout];
  v3 = (PXMagazineRectArray *)[v5 copy];
  fallbackLayout = self->_fallbackLayout;
  self->_fallbackLayout = v3;
}

- (BOOL)validateCurrentLayout
{
  v3 = [(PXMagazineLayoutCoordinator *)self qualifiedLayouts];
  unint64_t v4 = [(PXMagazineLayoutCoordinator *)self currentLayout];
  [(PXMagazineLayoutCoordinator *)self scoreOfLayout:v4];
  double v6 = v5;
  BOOL v7 = v5 < 0.12;
  if (v5 < 0.12)
  {
    fallbackLayout = self->_fallbackLayout;
    self->_fallbackLayout = 0;

    double v9 = (void *)[v4 copy];
    [v9 setScore:v6];
    [v3 addObject:v9];
    if ([v3 count]) {
      [(PXMagazineLayoutCoordinator *)self setStop:1];
    }
  }
  else
  {
    double v9 = 0;
  }
  if (![v3 count] && v6 < self->_currentBestScore)
  {
    self->_currentBestScore = v6;
    if (v9) {
      v10 = v9;
    }
    else {
      v10 = (PXMagazineRectArray *)[v4 copy];
    }
    v11 = self->_fallbackLayout;
    self->_fallbackLayout = v10;

    BOOL v7 = 1;
  }
  if ([(PXMagazineLayoutCoordinator *)self stopIfAnyGoodLayout]) {
    [(PXMagazineLayoutCoordinator *)self setStop:1];
  }

  return v7;
}

- (PXMagazineLayoutCoordinator)initWithPaddingInputs:(id)a3 tileAspectRatio:(double)a4 stopIfAnyGoodLayout:(BOOL)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXMagazineLayoutCoordinator;
  v10 = [(PXMagazineLayoutCoordinator *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_paddingInputs, a3);
    v11->_tileAspectRatio = a4;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    qualifiedLayouts = v11->_qualifiedLayouts;
    v11->_qualifiedLayouts = (NSMutableArray *)v12;

    v14 = -[PXMagazineRectArray initWithSize:]([PXMagazineRectArray alloc], "initWithSize:", [v9 count]);
    currentLayout = v11->_currentLayout;
    v11->_currentLayout = v14;

    v11->_stopIfAnyGoodLayout = a5;
    v11->_currentBestScore = 10000.0;
  }

  return v11;
}

@end