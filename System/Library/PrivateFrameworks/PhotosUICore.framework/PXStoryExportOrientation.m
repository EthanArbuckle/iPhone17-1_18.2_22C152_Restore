@interface PXStoryExportOrientation
+ (NSArray)pickableOrientations;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedTitle;
- (PXStoryExportOrientation)initWithOrientationType:(int64_t)a3;
- (PXStoryExportOrientation)initWithUserInterfaceOrientation:(int64_t)a3;
- (int64_t)type;
@end

@implementation PXStoryExportOrientation

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryExportOrientation *)a3;
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
      int64_t v6 = [(PXStoryExportOrientation *)self type];
      uint64_t v7 = [(PXStoryExportOrientation *)v5 type];

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
  unint64_t v2 = [(PXStoryExportOrientation *)self type];
  if (v2 > 2) {
    v3 = 0;
  }
  else {
    v3 = off_1E5DC1AD0[v2];
  }
  return (NSString *)PXLocalizedStringFromTable(v3, @"PhotosUICore");
}

- (PXStoryExportOrientation)initWithUserInterfaceOrientation:(int64_t)a3
{
  if (a3) {
    uint64_t v3 = a3 == 1;
  }
  else {
    uint64_t v3 = 2;
  }
  return [(PXStoryExportOrientation *)self initWithOrientationType:v3];
}

- (PXStoryExportOrientation)initWithOrientationType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryExportOrientation;
  result = [(PXStoryExportOrientation *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (NSArray)pickableOrientations
{
}

PXStoryExportOrientation *__48__PXStoryExportOrientation_pickableOrientations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [PXStoryExportOrientation alloc];
  uint64_t v4 = [v2 integerValue];

  objc_super v5 = [(PXStoryExportOrientation *)v3 initWithOrientationType:v4];
  return v5;
}

@end