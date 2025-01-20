@interface EXOfficeArtClient
- (BOOL)autoChartFillIsHollow;
- (BOOL)autoChartStrokeIsHollow;
- (BOOL)chartAutoFillIsHollow;
- (BOOL)chartAutoStrokeIsHollow;
- (void)readClientDataFromNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5;
- (void)setAutoChartFillIsHollow:(BOOL)a3;
- (void)setAutoChartStrokeIsHollow:(BOOL)a3;
@end

@implementation EXOfficeArtClient

- (void)readClientDataFromNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v29 = a4;
  id v7 = a5;
  objc_opt_class();
  v8 = [v7 excelState];
  v9 = objc_alloc_init(EDOfficeArtClient);
  [v29 setClientData:v9];
  v10 = [v8 currentSheet];
  [(EDOfficeArtClient *)v9 setSheet:v10];

  v11 = [v7 OAXMainNamespace];
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "xfrm");

  if (v12)
  {
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    v17 = [v7 OAXMainNamespace];
    uint64_t v18 = OCXFindChild(v12, v17, "off");

    if (v18)
    {
      +[OAXBaseTypes readPoint2DFromXmlNode:v18];
      double v13 = v19;
      double v14 = v20;
    }
    v21 = [v7 OAXMainNamespace];
    uint64_t v22 = OCXFindChild(v12, v21, "ext");

    if (v22)
    {
      +[OAXBaseTypes readSize2DFromXmlNode:v22];
      double v15 = v23;
      double v16 = v24;
    }
    -[EDOfficeArtClient setBounds:](v9, "setBounds:", v13, v14, v15, v16);
  }
  else
  {
    v25 = [v29 drawableProperties];
    int v26 = [v25 hasOrientedBounds];

    if (v26)
    {
      v27 = [v29 drawableProperties];
      v28 = [v27 orientedBounds];

      [v28 bounds];
      -[EDOfficeArtClient setBounds:](v9, "setBounds:");
    }
  }
}

- (BOOL)chartAutoFillIsHollow
{
  return self->mAutoChartFillIsHollow;
}

- (BOOL)chartAutoStrokeIsHollow
{
  return self->mAutoChartStrokeIsHollow;
}

- (BOOL)autoChartFillIsHollow
{
  return self->mAutoChartFillIsHollow;
}

- (void)setAutoChartFillIsHollow:(BOOL)a3
{
  self->mAutoChartFillIsHollow = a3;
}

- (BOOL)autoChartStrokeIsHollow
{
  return self->mAutoChartStrokeIsHollow;
}

- (void)setAutoChartStrokeIsHollow:(BOOL)a3
{
  self->mAutoChartStrokeIsHollow = a3;
}

@end