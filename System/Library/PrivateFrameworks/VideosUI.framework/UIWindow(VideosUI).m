@interface UIWindow(VideosUI)
+ (double)_OSXNumColumnsForGridStyle:()VideosUI gridType:sizeClass:;
+ (double)_newNumColumnsForGridStyle:()VideosUI gridType:sizeClass:;
+ (double)_numColumnsForGridStyle:()VideosUI gridType:sizeClass:;
+ (double)_vui_interitemSpaceForSizeClass:()VideosUI gridType:;
+ (double)_vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:windowWidth:sizeClass:padding:;
+ (double)vui_collectionInteritemSpace:()VideosUI gridType:;
+ (double)vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:;
+ (double)vui_padding;
+ (id)vui_keyWindow;
+ (uint64_t)_vui_currentSizeClassForWindowWidth:()VideosUI safeArea:;
+ (uint64_t)vui_collectionInteritemSpace:()VideosUI gridType:windowWidth:;
+ (uint64_t)vui_currentSizeClass;
+ (uint64_t)vui_currentSizeClassForWindowWidth:()VideosUI;
+ (uint64_t)vui_interfaceOrientation;
+ (uint64_t)vui_itemWidthForGridStyle:()VideosUI gridType:;
+ (uint64_t)vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:windowWidth:;
+ (uint64_t)vui_numColumnsForGridStyle:()VideosUI gridType:sizeClass:;
+ (uint64_t)vui_paddingForSizeClass:()VideosUI;
+ (uint64_t)vui_paddingForWindowWidth:()VideosUI;
@end

@implementation UIWindow(VideosUI)

+ (id)vui_keyWindow
{
  v0 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
  if (!v0)
  {
    v1 = [MEMORY[0x1E4FB1438] sharedApplication];
    v2 = [v1 delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      v4 = [MEMORY[0x1E4FB1438] sharedApplication];
      v5 = [v4 delegate];
      v0 = [v5 window];
    }
    else
    {
      v0 = 0;
    }
  }
  return v0;
}

+ (double)vui_padding
{
  v2 = objc_opt_class();
  char v3 = objc_msgSend(a1, "vui_keyWindow");
  [v3 bounds];
  objc_msgSend(v2, "vui_paddingForWindowWidth:", CGRectGetWidth(v7));
  double v5 = v4;

  return v5;
}

+ (uint64_t)vui_paddingForWindowWidth:()VideosUI
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "vui_currentSizeClassForWindowWidth:", a1);
  [(id)objc_opt_class() _safeAreaInsetsForDeviceWithWindowWidth:a1];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = objc_opt_class();
  return objc_msgSend(v11, "_paddingForSizeClass:safeArea:", v2, v4, v6, v8, v10);
}

+ (uint64_t)vui_paddingForSizeClass:()VideosUI
{
  double v4 = objc_opt_class();
  double v5 = *MEMORY[0x1E4FB2848];
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  return objc_msgSend(v4, "_paddingForSizeClass:safeArea:", a3, v5, v6, v7, v8);
}

+ (uint64_t)vui_numColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  double v8 = objc_opt_class();
  return [v8 _newNumColumnsForGridStyle:a3 gridType:a4 sizeClass:a5];
}

+ (uint64_t)vui_itemWidthForGridStyle:()VideosUI gridType:
{
  double v6 = objc_opt_class();
  return objc_msgSend(v6, "vui_itemWidthForGridStyle:gridType:numGridColumns:", a3, a4, 1);
}

+ (double)vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:
{
  double v9 = objc_opt_class();
  double v10 = objc_msgSend(a1, "vui_keyWindow");
  [v10 bounds];
  objc_msgSend(v9, "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", a3, a4, a5, CGRectGetWidth(v14));
  double v12 = v11;

  return v12;
}

+ (uint64_t)vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:windowWidth:
{
  uint64_t v10 = objc_msgSend((id)objc_opt_class(), "vui_currentSizeClassForWindowWidth:", a1);
  if (a4 == 20)
  {
    double v11 = *MEMORY[0x1E4FB2848];
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "vui_paddingForWindowWidth:", a1);
    double v11 = v15;
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
  }
  v19 = objc_opt_class();
  return objc_msgSend(v19, "_vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:sizeClass:padding:", a4, a5, a6, v10, a1, v11, v12, v13, v14);
}

+ (double)_vui_itemWidthForGridStyle:()VideosUI gridType:numGridColumns:windowWidth:sizeClass:padding:
{
  objc_msgSend((id)objc_opt_class(), "_vui_interitemSpaceForSizeClass:gridType:", a11, a9);
  double v19 = v18;
  objc_msgSend((id)objc_opt_class(), "vui_numColumnsForGridStyle:gridType:sizeClass:", a8, a9, a11);
  double v21 = floor(v20 + 1.0);
  if (v20 - floor(v20) == 0.0) {
    double v22 = v20;
  }
  else {
    double v22 = v21;
  }
  return floor(v19 * (double)(a10 - 1) + (a1 - (a3 + a5) - (double)((unint64_t)v22 - 1) * v19)
                                       / v20
                                       * (double)a10);
}

+ (double)vui_collectionInteritemSpace:()VideosUI gridType:
{
  double v7 = objc_opt_class();
  double v8 = objc_msgSend(a1, "vui_keyWindow");
  [v8 bounds];
  objc_msgSend(v7, "vui_collectionInteritemSpace:gridType:windowWidth:", a3, a4, CGRectGetWidth(v12));
  double v10 = v9;

  return v10;
}

+ (uint64_t)vui_collectionInteritemSpace:()VideosUI gridType:windowWidth:
{
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "vui_currentSizeClassForWindowWidth:", a1);
  double v7 = objc_opt_class();
  return objc_msgSend(v7, "_vui_interitemSpaceForSizeClass:gridType:", v6, a5);
}

+ (uint64_t)vui_currentSizeClass
{
  uint64_t v2 = objc_opt_class();
  double v3 = objc_msgSend(a1, "vui_keyWindow");
  [v3 bounds];
  uint64_t v4 = objc_msgSend(v2, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v6));

  return v4;
}

+ (uint64_t)vui_currentSizeClassForWindowWidth:()VideosUI
{
  [(id)objc_opt_class() _safeAreaInsetsForDeviceWithWindowWidth:a1];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = objc_opt_class();
  return objc_msgSend(v10, "_vui_currentSizeClassForWindowWidth:safeArea:", a1, v3, v5, v7, v9);
}

+ (uint64_t)_vui_currentSizeClassForWindowWidth:()VideosUI safeArea:
{
  if ([MEMORY[0x1E4FB3C90] isTV]) {
    return 7;
  }
  int v9 = [MEMORY[0x1E4FB3C90] isPad];
  uint64_t result = 0;
  BOOL v10 = v9 == 0;
  uint64_t v11 = 3;
  if (v10) {
    uint64_t v11 = 0;
  }
  double v12 = a1 - (a3 + a5);
  if (v12 > 374.0)
  {
    if (v12 < 375.0 || v12 > 460.0)
    {
      if (v12 < 461.0 || v12 > 726.0)
      {
        if (v12 < 727.0 || v12 > 981.0)
        {
          if (v12 < 982.0 || v12 > 1194.0)
          {
            uint64_t result = v11;
            if (v12 >= 1195.0) {
              return 5;
            }
          }
          else
          {
            return 4;
          }
        }
        else
        {
          return 3;
        }
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

+ (double)_vui_interitemSpaceForSizeClass:()VideosUI gridType:
{
  double result = 0.0;
  if (a3 <= 7) {
    return dbl_1E38FDDE8[a3];
  }
  return result;
}

+ (uint64_t)vui_interfaceOrientation
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  v1 = [v0 windows];
  double v2 = [v1 firstObject];
  double v3 = [v2 windowScene];
  uint64_t v4 = [v3 interfaceOrientation];

  return v4;
}

+ (double)_numColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  if (_numColumnsForGridStyle_gridType_sizeClass__onceToken != -1) {
    dispatch_once(&_numColumnsForGridStyle_gridType_sizeClass__onceToken, &__block_literal_global_67);
  }
  double v8 = (void *)_numColumnsForGridStyle_gridType_sizeClass__sGridSpec;
  int v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  BOOL v10 = [v8 objectForKeyedSubscript:v9];

  double v11 = 1.0;
  if ((unint64_t)(a3 - 21) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    double v13 = [v10 objectForKeyedSubscript:v12];
    double v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    double v15 = [v13 objectForKeyedSubscript:v14];
    [v15 floatValue];
    double v11 = v16;
  }
  return v11;
}

+ (double)_newNumColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  if (_newNumColumnsForGridStyle_gridType_sizeClass__onceToken != -1) {
    dispatch_once(&_newNumColumnsForGridStyle_gridType_sizeClass__onceToken, &__block_literal_global_49);
  }
  double v8 = (void *)_newNumColumnsForGridStyle_gridType_sizeClass__sGridSpec;
  int v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  BOOL v10 = [v8 objectForKeyedSubscript:v9];

  double v11 = 1.0;
  if ((unint64_t)(a3 - 21) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    double v13 = [v10 objectForKeyedSubscript:v12];
    double v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    double v15 = [v13 objectForKeyedSubscript:v14];
    [v15 floatValue];
    double v11 = v16;
  }
  return v11;
}

+ (double)_OSXNumColumnsForGridStyle:()VideosUI gridType:sizeClass:
{
  if (_OSXNumColumnsForGridStyle_gridType_sizeClass__onceToken != -1) {
    dispatch_once(&_OSXNumColumnsForGridStyle_gridType_sizeClass__onceToken, &__block_literal_global_57_0);
  }
  double v8 = (void *)_OSXNumColumnsForGridStyle_gridType_sizeClass__sGridSpec;
  int v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  BOOL v10 = [v8 objectForKeyedSubscript:v9];

  double v11 = 1.0;
  if ((unint64_t)(a3 - 21) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    double v13 = [v10 objectForKeyedSubscript:v12];
    double v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    double v15 = [v13 objectForKeyedSubscript:v14];
    [v15 floatValue];
    double v11 = v16;
  }
  return v11;
}

@end