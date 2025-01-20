@interface EMChartsheetMapper
- (EMChartsheetMapper)initWithChartSheet:(id)a3 parent:(id)a4;
- (int)preprocessHeightWithState:(id)a3;
- (int)preprocessWidthWithState:(id)a3;
- (int)width;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation EMChartsheetMapper

- (EMChartsheetMapper)initWithChartSheet:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CMMapper *)self initWithParent:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mChartSheet, a3);
    if ([v7 areBoundsSet])
    {
      [v7 bounds];
      v10->mBox.origin.x = v11;
      v10->mBox.origin.y = v12;
      v10->mBox.size.width = v13;
      v10->mBox.size.height = v14;
    }
  }

  return v10;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [(EDChartSheet *)self->mChartSheet mainChart];
  if (v7)
  {
    [(EDChartSheet *)self->mChartSheet bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = v8;
    if (v13 == 0.0 && v8 == 0.0)
    {
      v16 = [v7 clientData];
      v17 = [v16 anchor];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v17 position];
        double v10 = v18;
        double v12 = v19;
        [v17 size];
        double v14 = v20;
        double v15 = v21;
      }
    }
    v22 = -[EMDrawableMapper initWithChartDrawable:box:parent:]([EMDrawableMapper alloc], "initWithChartDrawable:box:parent:", v7, self, v10, v12, v14, v15);
    [(EMDrawableMapper *)v22 mapAt:v23 withState:v6];
  }
}

- (int)width
{
  return (int)self->mBox.size.width;
}

- (int)preprocessWidthWithState:(id)a3
{
  double width = self->mBox.size.width;
  if (width <= 0.0) {
    return (int)980.0;
  }
  return (int)width;
}

- (int)preprocessHeightWithState:(id)a3
{
  double height = self->mBox.size.height;
  if (height <= 0.0) {
    return (int)600.0;
  }
  return (int)height;
}

- (void).cxx_destruct
{
}

@end