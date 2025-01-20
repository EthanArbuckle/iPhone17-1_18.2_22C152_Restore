@interface ISUIVisibilityOffsetHelper
- (CGRect)boundsForView:(id)a3 inScrollView:(id)a4;
- (CGRect)visibleRectForScrollView:(id)a3;
@end

@implementation ISUIVisibilityOffsetHelper

- (CGRect)boundsForView:(id)a3 inScrollView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = v6;
    [v7 bounds];
    objc_msgSend(v8, "convertRect:fromView:", v7);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)visibleRectForScrollView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end