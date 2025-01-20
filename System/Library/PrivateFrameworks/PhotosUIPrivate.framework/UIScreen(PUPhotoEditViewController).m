@interface UIScreen(PUPhotoEditViewController)
- (double)pu_workImageSize;
@end

@implementation UIScreen(PUPhotoEditViewController)

- (double)pu_workImageSize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a1 bounds];
  double v3 = v2;
  double v5 = v4;
  [a1 scale];
  double v7 = v3 * v6;
  double v8 = v5 * v6;
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  if (v9 <= 0.0)
  {
    v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16.width = v9;
      v16.height = v9;
      v11 = NSStringFromCGSize(v16);
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Invalid work image size for photo editor: %@. Using default size.", (uint8_t *)&v13, 0xCu);
    }
    return 1200.0;
  }
  return v9;
}

@end