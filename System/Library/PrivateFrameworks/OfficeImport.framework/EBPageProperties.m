@interface EBPageProperties
+ (int)convertEDPageOrientationEnumToXl:(int)a3;
+ (int)convertXlPageOrientationEnumToED:(int)a3;
+ (void)readWithState:(id)a3;
@end

@implementation EBPageProperties

+ (void)readWithState:(id)a3
{
  id v4 = a3;
  XlPageProperties::XlPageProperties((XlPageProperties *)&v20);
  uint64_t v5 = [v4 xlReader];
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v5 + 512))(v5, &v20);
  v6 = objc_alloc_init(EDHeaderFooter);
  v7 = [NSString stringWithOcText:XlPageProperties::getHeaderString((XlPageProperties *)&v20)];
  v8 = v7;
  if (v7 && [v7 length]) {
    [(EDHeaderFooter *)v6 setHeaderString:v8];
  }
  v9 = [NSString stringWithOcText:XlPageProperties::getFooterString((XlPageProperties *)&v20)];
  v10 = v9;
  if (v9 && [v9 length]) {
    [(EDHeaderFooter *)v6 setFooterString:v10];
  }
  v11 = [v4 edSheet];
  [v11 setHeaderFooter:v6];

  v12 = +[EDPageSetup pageSetup];
  objc_msgSend(v12, "setOrientation:", objc_msgSend(a1, "convertXlPageOrientationEnumToED:", v30));
  [v12 setOrder:v29];
  [v12 setFirstPageNumber:v26];
  [v12 setCustomFirstPageNumber:v32];
  [v12 setFitToHeight:v28];
  [v12 setFitToWidth:v27];
  HIDWORD(v13) = HIDWORD(v23);
  *(float *)&double v13 = v23;
  [v12 setLeftMargin:v13];
  HIDWORD(v14) = HIDWORD(v24);
  *(float *)&double v14 = v24;
  [v12 setRightMargin:v14];
  HIDWORD(v15) = HIDWORD(v22);
  *(float *)&double v15 = v22;
  [v12 setTopMargin:v15];
  HIDWORD(v16) = HIDWORD(v21);
  *(float *)&double v16 = v21;
  [v12 setBottomMargin:v16];
  HIDWORD(v17) = HIDWORD(v33);
  *(float *)&double v17 = v33;
  [v12 setHeaderMargin:v17];
  HIDWORD(v18) = HIDWORD(v34);
  *(float *)&double v18 = v34;
  [v12 setFooterMargin:v18];
  if (!v31 && v25) {
    objc_msgSend(v12, "setScale:");
  }
  v19 = [v4 edSheet];
  [v19 setPageSetup:v12];

  XlPageProperties::~XlPageProperties((XlPageProperties *)&v20);
}

+ (int)convertXlPageOrientationEnumToED:(int)a3
{
  return a3 == 1;
}

+ (int)convertEDPageOrientationEnumToXl:(int)a3
{
  return a3 == 1;
}

@end