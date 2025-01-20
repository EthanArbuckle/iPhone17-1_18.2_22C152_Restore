@interface STUIStatusBarThermalItem
- (id)_colorForThermalColor:(int64_t)a3 imageTintColor:(id)a4;
- (id)imageForUpdate:(id)a3;
- (id)indicatorEntryKey;
@end

@implementation STUIStatusBarThermalItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97F8];
}

- (id)imageForUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 data];
  v6 = [v5 thermalEntry];

  uint64_t v7 = [v6 color];
  v8 = [v4 styleAttributes];
  uint64_t v9 = [v8 imageTintColor];
  v10 = [(STUIStatusBarThermalItem *)self _colorForThermalColor:v7 imageTintColor:v9];

  v11 = [v4 styleAttributes];
  v12 = [v11 imageNamePrefixes];
  LOBYTE(v9) = [v12 containsObject:@"SystemUpdate_"];

  double v13 = 15.0;
  if ((v9 & 1) == 0)
  {
    v14 = [v4 styleAttributes];
    v15 = [v14 imageNamePrefixes];
    int v16 = [v15 containsObject:@"Large_"];

    if (v16) {
      double v13 = 12.0;
    }
    else {
      double v13 = 10.0;
    }
  }
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v13, v13);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __43__STUIStatusBarThermalItem_imageForUpdate___block_invoke;
  v22[3] = &unk_1E6AA4A58;
  id v23 = v10;
  id v24 = v6;
  id v18 = v6;
  id v19 = v10;
  v20 = [v17 imageWithActions:v22];

  return v20;
}

void __43__STUIStatusBarThermalItem_imageForUpdate___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 set];
  if ([*(id *)(a1 + 40) sunlightMode])
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(CurrentContext, 3.0);
    id v6 = [v4 format];
    [v6 bounds];
    objc_msgSend(v4, "strokeRect:");
  }
  else
  {
    id v6 = [v4 format];
    [v6 bounds];
    objc_msgSend(v4, "fillRect:");
  }
}

- (id)_colorForThermalColor:(int64_t)a3 imageTintColor:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v6 = [MEMORY[0x1E4FB1618] yellowColor];
      goto LABEL_9;
    case 1:
      uint64_t v6 = [MEMORY[0x1E4FB1618] orangeColor];
      goto LABEL_9;
    case 2:
      uint64_t v6 = [MEMORY[0x1E4FB1618] redColor];
      goto LABEL_9;
    case 3:
      uint64_t v6 = [MEMORY[0x1E4FB1618] purpleColor];
      goto LABEL_9;
    case 4:
      uint64_t v6 = [MEMORY[0x1E4FB1618] blueColor];
      goto LABEL_9;
    case 5:
      uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_9:
      uint64_t v7 = (void *)v6;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  v8 = [v5 colorWithAlphaComponent:0.15];
  uint64_t v9 = [v7 _colorBlendedWithColor:v8 compositingFilter:*MEMORY[0x1E4F3A320]];

  return v9;
}

@end