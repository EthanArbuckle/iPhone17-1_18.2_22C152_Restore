@interface PUPhotoPickerResizeTaskDescriptor
+ (id)defaultActualSizeDescriptor;
+ (id)defaultLargeDescriptor;
+ (id)defaultMediumDescriptor;
+ (id)defaultSmallDescriptor;
+ (id)orderedDefaultDescriptors;
- (BOOL)appliesToAsset:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)targetSize;
- (NSString)localizedDescription;
- (PUPhotoPickerResizeTaskDescriptor)initWithLocalizedDescription:(id)a3 targetSize:(CGSize)a4;
- (id)formattedSizeForAssets:(id)a3;
- (id)localizedDescriptionForAssets:(id)a3;
- (unint64_t)estimatedSizeForAssets:(id)a3;
- (unint64_t)hash;
@end

@implementation PUPhotoPickerResizeTaskDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_cachedAssetsIdentifiersForEstimation, 0);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)hash
{
  return [(NSString *)self->_localizedDescription hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUPhotoPickerResizeTaskDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && (self->_targetSize.width == v4->_targetSize.width
        ? (BOOL v5 = self->_targetSize.height == v4->_targetSize.height)
        : (BOOL v5 = 0),
          v5)
      && [(NSString *)self->_localizedDescription isEqualToString:v4->_localizedDescription];
  }

  return v6;
}

- (BOOL)appliesToAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PUPhotoPickerScaledFileSizeEstimator alloc] initWithAsset:v4];

  LOBYTE(self) = [(PUPhotoPickerScaledFileSizeEstimator *)v5 wouldResizeAssetUsingResizeDescriptor:self];
  return (char)self;
}

- (unint64_t)estimatedSizeForAssets:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28BD0] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) localIdentifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  if (([(NSCountedSet *)self->_cachedAssetsIdentifiersForEstimation isEqualToSet:v5] & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = [[PUPhotoPickerScaledFileSizeEstimator alloc] initWithAsset:*(void *)(*((void *)&v21 + 1) + 8 * j)];
          v15 += [(PUPhotoPickerScaledFileSizeEstimator *)v18 estimatedSizeForResizeDescriptor:self];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }
    else
    {
      unint64_t v15 = 0;
    }

    self->_unint64_t cachedSizeEstimate = v15;
    objc_storeStrong((id *)&self->_cachedAssetsIdentifiersForEstimation, v5);
  }
  unint64_t cachedSizeEstimate = self->_cachedSizeEstimate;

  return cachedSizeEstimate;
}

- (id)formattedSizeForAssets:(id)a3
{
  unint64_t v3 = [(PUPhotoPickerResizeTaskDescriptor *)self estimatedSizeForAssets:a3];
  id v4 = (void *)MEMORY[0x1E4F28B68];
  return (id)[v4 stringFromByteCount:v3 countStyle:0];
}

- (id)localizedDescriptionForAssets:(id)a3
{
  unint64_t v3 = [(PUPhotoPickerResizeTaskDescriptor *)self formattedSizeForAssets:a3];
  id v4 = PULocalizedString(@"SIZE_PICKER_SIZE_(BYTES)");
  BOOL v5 = PUStringWithValidatedFormat();

  return v5;
}

- (PUPhotoPickerResizeTaskDescriptor)initWithLocalizedDescription:(id)a3 targetSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoPickerResizeTaskDescriptor;
  uint64_t v8 = [(PUPhotoPickerResizeTaskDescriptor *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    localizedDescription = v8->_localizedDescription;
    v8->_localizedDescription = (NSString *)v9;

    v8->_targetSize.CGFloat width = width;
    v8->_targetSize.CGFloat height = height;
  }

  return v8;
}

+ (id)orderedDefaultDescriptors
{
  if (orderedDefaultDescriptors_onceToken != -1) {
    dispatch_once(&orderedDefaultDescriptors_onceToken, &__block_literal_global_64945);
  }
  v2 = (void *)orderedDefaultDescriptors_orderedDefaultDescriptors;
  return v2;
}

void __62__PUPhotoPickerResizeTaskDescriptor_orderedDefaultDescriptors__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = +[PUPhotoPickerResizeTaskDescriptor defaultActualSizeDescriptor];
  v1 = +[PUPhotoPickerResizeTaskDescriptor defaultLargeDescriptor];
  v2 = +[PUPhotoPickerResizeTaskDescriptor defaultMediumDescriptor];
  unint64_t v3 = +[PUPhotoPickerResizeTaskDescriptor defaultSmallDescriptor];
  v6[0] = v0;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  BOOL v5 = (void *)orderedDefaultDescriptors_orderedDefaultDescriptors;
  orderedDefaultDescriptors_orderedDefaultDescriptors = v4;
}

+ (id)defaultActualSizeDescriptor
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = PULocalizedString(@"SIZE_PICKER_SIZE_ACTUAL");
  uint64_t v4 = objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, *MEMORY[0x1E4F396D8], *(double *)(MEMORY[0x1E4F396D8] + 8));

  return v4;
}

+ (id)defaultSmallDescriptor
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = PULocalizedString(@"SIZE_PICKER_SIZE_SMALL");
  uint64_t v4 = objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, 320.0, 240.0);

  return v4;
}

+ (id)defaultMediumDescriptor
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = PULocalizedString(@"SIZE_PICKER_SIZE_MEDIUM");
  uint64_t v4 = objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, 640.0, 480.0);

  return v4;
}

+ (id)defaultLargeDescriptor
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = PULocalizedString(@"SIZE_PICKER_SIZE_LARGE");
  uint64_t v4 = objc_msgSend(v2, "initWithLocalizedDescription:targetSize:", v3, 1280.0, 960.0);

  return v4;
}

@end