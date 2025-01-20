@interface PBUIColorWallpaperView
- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4;
- (PBUIColorWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (UIImage)cachedSnapshotImage;
- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5;
- (id)snapshotImage;
- (int64_t)wallpaperType;
- (void)setCachedSnapshotImage:(id)a3;
@end

@implementation PBUIColorWallpaperView

- (PBUIColorWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PBUIColorWallpaperView;
  v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v21, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  if (v18)
  {
    v19 = [v17 wallpaperColor];
    [(PBUIColorWallpaperView *)v18 setBackgroundColor:v19];
  }
  return v18;
}

- (int64_t)wallpaperType
{
  return 4;
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5 = a3;
  if ([v5 wallpaperType] == 4)
  {
    v6 = [v5 wallpaperColor];
    v7 = [(PBUIColorWallpaperView *)self wallpaperColor];
    char v8 = [v7 isEqual:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  if (a4) {
    *a4 = 0.0;
  }
  if (a5) {
    *a5 = 0.0;
  }
  return 0.0;
}

- (id)snapshotImage
{
  v3 = [(PBUIColorWallpaperView *)self cachedSnapshotImage];
  if (!v3)
  {
    v4 = [(PBUIColorWallpaperView *)self wallpaperColor];
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", 20.0, 20.0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__PBUIColorWallpaperView_snapshotImage__block_invoke;
    v8[3] = &unk_1E62B4638;
    id v9 = v4;
    id v6 = v4;
    v3 = [v5 imageWithActions:v8];
    [(PBUIColorWallpaperView *)self setCachedSnapshotImage:v3];
  }
  return v3;
}

void __39__PBUIColorWallpaperView_snapshotImage__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 set];
  objc_msgSend(v3, "fillRect:", 0.0, 0.0, 20.0, 20.0);
}

- (UIImage)cachedSnapshotImage
{
  return self->_cachedSnapshotImage;
}

- (void)setCachedSnapshotImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end