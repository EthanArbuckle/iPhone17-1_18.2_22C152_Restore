@interface PNWallpaperCropResult
+ (id)cropScoreSortDescriptorForOrientation:(int64_t)a3;
- (PNWallpaperCrop)landscapeCrop;
- (PNWallpaperCrop)portraitCrop;
- (PNWallpaperCropResult)initWithAsset:(id)a3 classification:(unint64_t)a4;
- (id)cropForOrientation:(int64_t)a3;
- (id)dictionaryRepresentation;
@end

@implementation PNWallpaperCropResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeCrop, 0);
  objc_storeStrong((id *)&self->_portraitCrop, 0);
}

- (PNWallpaperCrop)landscapeCrop
{
  return self->_landscapeCrop;
}

- (PNWallpaperCrop)portraitCrop
{
  return self->_portraitCrop;
}

- (id)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"portraitCrop";
  v3 = [(PNWallpaperCropResult *)self portraitCrop];
  v4 = [v3 description];
  v9[1] = @"landscapeCrop";
  v10[0] = v4;
  v5 = [(PNWallpaperCropResult *)self landscapeCrop];
  v6 = [v5 description];
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)cropForOrientation:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(PNWallpaperCropResult *)self landscapeCrop];
  }
  else if (a3 == 1)
  {
    v3 = [(PNWallpaperCropResult *)self portraitCrop];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (PNWallpaperCropResult)initWithAsset:(id)a3 classification:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PNWallpaperCropResult;
  v7 = [(PNWallpaperCropResult *)&v13 init];
  if (v7)
  {
    v8 = [[PNWallpaperCrop alloc] initWithAsset:v6 orientation:1 classification:a4];
    portraitCrop = v7->_portraitCrop;
    v7->_portraitCrop = v8;

    v10 = [[PNWallpaperCrop alloc] initWithAsset:v6 orientation:2 classification:a4];
    landscapeCrop = v7->_landscapeCrop;
    v7->_landscapeCrop = v10;
  }
  return v7;
}

+ (id)cropScoreSortDescriptorForOrientation:(int64_t)a3
{
  if (a3 == 1)
  {
    v5 = @"cropResult.portraitCrop.cropScore";
LABEL_5:
    id v6 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:", v5, 0, v3);
    return v6;
  }
  if (a3 == 2)
  {
    v5 = @"cropResult.landscapeCrop.cropScore";
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

@end