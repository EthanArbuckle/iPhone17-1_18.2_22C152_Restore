@interface PXStoryExportAspectRatio
+ (NSArray)standardAspects;
+ (id)defaultAspectRatioWithFullSizePlayerAspect:(id)a3 orientation:(id)a4;
+ (id)pickableAspectRatiosForOrientation:(id)a3 fullSizePlayerAspect:(id)a4;
+ (id)standardAspectRatioForSize:(CGSize)a3;
+ (void)setDefaultAspectRatio:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)sizeWithMinDimension:(double)a3;
- (CGSize)sizeWithMinDimension:(double)a3 orientation:(id)a4;
- (NSString)localizedTitle;
- (PXStoryExportAspectRatio)initWithAspectType:(int64_t)a3;
- (PXStoryExportAspectRatio)initWithAspectType:(int64_t)a3 ratio:(double)a4;
- (PXStoryExportOrientation)orientation;
- (double)ratio;
- (id)_userDefaultIdentifier;
- (id)adjustedForOrientation:(id)a3;
- (int64_t)type;
@end

@implementation PXStoryExportAspectRatio

- (void).cxx_destruct
{
}

- (PXStoryExportOrientation)orientation
{
  return self->_orientation;
}

- (double)ratio
{
  return self->_ratio;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryExportAspectRatio *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(PXStoryExportAspectRatio *)self type];
      uint64_t v7 = [(PXStoryExportAspectRatio *)v5 type];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)localizedTitle
{
  unint64_t v4 = [(PXStoryExportAspectRatio *)self type];
  if (v4 >= 5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXStoryExportAspectRatio.m" lineNumber:209 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v5 = off_1E5DC1AE8[v4];
  return (NSString *)PXLocalizedStringFromTable(v5, @"PhotosUICore");
}

- (id)adjustedForOrientation:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(PXStoryExportAspectRatio *)self orientation];
  int v7 = [v6 isEqual:v5];

  if (v7)
  {
    BOOL v8 = self;
  }
  else
  {
    unint64_t v9 = [(PXStoryExportAspectRatio *)self type];
    if (v9 >= 4)
    {
      if (v9 != 4)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"PXStoryExportAspectRatio.m" lineNumber:183 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      BOOL v8 = -[PXStoryExportAspectRatio initWithAspectType:]([PXStoryExportAspectRatio alloc], "initWithAspectType:", [v5 type] != 0);
    }
    else
    {
      [(PXStoryExportAspectRatio *)self sizeWithMinDimension:v5 orientation:1080.0];
      objc_msgSend((id)objc_opt_class(), "standardAspectRatioForSize:", v10, v11);
      BOOL v8 = (PXStoryExportAspectRatio *)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = v8;

  return v12;
}

- (CGSize)sizeWithMinDimension:(double)a3
{
  id v5 = [(PXStoryExportAspectRatio *)self orientation];
  [(PXStoryExportAspectRatio *)self sizeWithMinDimension:v5 orientation:a3];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeWithMinDimension:(double)a3 orientation:(id)a4
{
  id v5 = a4;
  [(PXStoryExportAspectRatio *)self ratio];
  [v5 type];

  PXSizeRound();
}

- (PXStoryExportAspectRatio)initWithAspectType:(int64_t)a3 ratio:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryExportAspectRatio;
  double v6 = [(PXStoryExportAspectRatio *)&v8 init];
  if (v6)
  {
    v6->_type = a3;
    v6->_ratio = a4;
    PXFloatApproximatelyEqualToFloat();
  }
  return 0;
}

- (PXStoryExportAspectRatio)initWithAspectType:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXStoryExportAspectRatio.m" lineNumber:110 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v3 = dbl_1AB35B4D0[a3];
  return -[PXStoryExportAspectRatio initWithAspectType:ratio:](self, "initWithAspectType:ratio:", v3);
}

+ (NSArray)standardAspects
{
}

PXStoryExportAspectRatio *__43__PXStoryExportAspectRatio_standardAspects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [PXStoryExportAspectRatio alloc];
  uint64_t v4 = [v2 integerValue];

  id v5 = [(PXStoryExportAspectRatio *)v3 initWithAspectType:v4];
  return v5;
}

+ (id)pickableAspectRatiosForOrientation:(id)a3 fullSizePlayerAspect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [a1 standardAspects];
  objc_claimAutoreleasedReturnValue();
  v6;
  PXFilter();
}

uint64_t __84__PXStoryExportAspectRatio_pickableAspectRatiosForOrientation_fullSizePlayerAspect___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 orientation];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (id)standardAspectRatioForSize:(CGSize)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  double v3 = objc_msgSend(a1, "standardAspects", 0);
  if ([v3 countByEnumeratingWithState:v5 objects:v6 count:16])
  {
    [**((id **)&v5[0] + 1) ratio];
    PXFloatApproximatelyEqualToFloat();
  }

  return 0;
}

- (id)_userDefaultIdentifier
{
  unint64_t v2 = [(PXStoryExportAspectRatio *)self type];
  if (v2 > 5) {
    return 0;
  }
  else {
    return off_1E5DC1B10[v2];
  }
}

+ (id)defaultAspectRatioWithFullSizePlayerAspect:(id)a3 orientation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_super v8 = [v7 stringForKey:@"StoryExportAspectRatio"];

  if (v8)
  {
    [(id)objc_opt_class() standardAspects];
    objc_claimAutoreleasedReturnValue();
    v8;
    PXFind();
  }
  double v9 = [[PXStoryExportAspectRatio alloc] initWithAspectType:0];
  double v10 = [(PXStoryExportAspectRatio *)v9 adjustedForOrientation:v6];

  return v10;
}

uint64_t __96__PXStoryExportAspectRatio_UserDefault__defaultAspectRatioWithFullSizePlayerAspect_orientation___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 _userDefaultIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (void)setDefaultAspectRatio:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = [v3 standardUserDefaults];
  id v5 = [v4 _userDefaultIdentifier];

  [v6 setObject:v5 forKey:@"StoryExportAspectRatio"];
}

@end