@interface AEAnnotationTheme
+ (double)highlightOpacityForPageTheme:(int64_t)a3;
+ (id)blueTheme:(int64_t)a3;
+ (id)colorForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int64_t)a5;
+ (id)colorForThemeItem:(id)a3 pageTheme:(int64_t)a4;
+ (id)greenTheme:(int64_t)a3;
+ (id)highlightTextColor:(int64_t)a3;
+ (id)objectForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int64_t)a5;
+ (id)objectForThemeItem:(id)a3 pageTheme:(int64_t)a4;
+ (id)pinkTheme:(int64_t)a3;
+ (id)purpleTheme:(int64_t)a3;
+ (id)theme:(int64_t)a3;
+ (id)themeDescriptions;
+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int64_t)a4;
+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int64_t)a4 isUnderline:(BOOL)a5;
+ (id)themeItemForAnnotationStyle:(int)a3 propertyName:(id)a4;
+ (id)underlineTheme:(int64_t)a3;
+ (id)yellowTheme:(int64_t)a3;
- (BOOL)isUnderline;
- (BOOL)noteHasBorder;
- (BOOL)noteMarkerHasBorder;
- (CGSize)noteShadowOffset;
- (UIColor)highlightColor;
- (UIColor)noteBorderColor;
- (UIColor)noteColorPickerBorderColor;
- (UIColor)noteColorPickerFillColor;
- (UIColor)noteFillColor;
- (UIColor)noteMarkerBorderColor;
- (UIColor)noteMarkerFillColor;
- (UIColor)noteMarkerStrikethroughColor;
- (UIColor)noteShadowColor;
- (UIColor)noteTextColor;
- (UIColor)notesSidebarBarColor;
- (UIColor)notesSidebarTextColor;
- (UIFont)noteTextFont;
- (UIFont)noteTextFontInTable;
- (double)noteShadowOpacity;
- (double)noteShadowRadius;
- (int)annotationStyle;
- (int64_t)pageTheme;
- (void)setPageTheme:(int64_t)a3;
@end

@implementation AEAnnotationTheme

+ (id)themeDescriptions
{
  if (qword_345D78 != -1) {
    dispatch_once(&qword_345D78, &stru_2C9268);
  }
  v2 = (void *)qword_345D80;

  return v2;
}

+ (id)themeItemForAnnotationStyle:(int)a3 propertyName:(id)a4
{
  id v6 = a4;
  v7 = 0;
  if (v6 && a3 <= 6)
  {
    v8 = off_2C93A8[a3];
    v9 = [a1 themeDescriptions];
    v10 = [v9 objectForKey:@"themes"];

    v11 = [v10 objectForKey:v8];
    v7 = [v11 objectForKey:v6];
  }

  return v7;
}

+ (id)objectForThemeItem:(id)a3 pageTheme:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if ((unint64_t)a4 > 0x10)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 objectForKey:off_2C93E0[a4]];
  }
  if (a4 != 4 && !v7)
  {
    v7 = [v6 objectForKey:@"default"];
  }

  return v7;
}

+ (id)colorForThemeItem:(id)a3 pageTheme:(int64_t)a4
{
  v4 = [a1 objectForThemeItem:a3 pageTheme:a4];
  if (v4)
  {
    id v5 = +[UIColor bc_colorWithSRGBDescription:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)objectForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int64_t)a5
{
  v7 = [a1 themeItemForAnnotationStyle:*(void *)&a3 propertyName:a4];
  if (v7)
  {
    v8 = [a1 objectForThemeItem:v7 pageTheme:a5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int64_t)a5
{
  id v5 = [a1 objectForAnnotationStyle:*(void *)&a3 propertyName:a4 pageTheme:a5];
  if (v5)
  {
    id v6 = +[UIColor bc_colorWithSRGBDescription:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UIColor)noteFillColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 532, (uint64_t)"-[AEAnnotationTheme noteFillColor]", (uint64_t)"NO", @"Abstract method noteFillColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)noteBorderColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 533, (uint64_t)"-[AEAnnotationTheme noteBorderColor]", (uint64_t)"NO", @"Abstract method noteBorderColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)noteTextColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 534, (uint64_t)"-[AEAnnotationTheme noteTextColor]", (uint64_t)"NO", @"Abstract method noteTextColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)highlightColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 535, (uint64_t)"-[AEAnnotationTheme highlightColor]", (uint64_t)"NO", @"Abstract method highlightColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)noteMarkerFillColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 536, (uint64_t)"-[AEAnnotationTheme noteMarkerFillColor]", (uint64_t)"NO", @"Abstract method noteMarkerFillColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)noteMarkerBorderColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 537, (uint64_t)"-[AEAnnotationTheme noteMarkerBorderColor]", (uint64_t)"NO", @"Abstract method noteMarkerBorderColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)notesSidebarBarColor
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 538, (uint64_t)"-[AEAnnotationTheme notesSidebarBarColor]", (uint64_t)"NO", @"Abstract method notesSidebarBarColor: was called!", v2, v3, v4, vars0);

  return +[UIColor blackColor];
}

- (UIColor)noteMarkerStrikethroughColor
{
  if (qword_348A88 != -1) {
    dispatch_once(&qword_348A88, &stru_2C9288);
  }
  uint64_t v2 = (void *)qword_348A90;

  return (UIColor *)v2;
}

- (UIColor)notesSidebarTextColor
{
  if (qword_348A98 != -1) {
    dispatch_once(&qword_348A98, &stru_2C92A8);
  }
  uint64_t v2 = (void *)qword_348AA0;

  return (UIColor *)v2;
}

+ (id)greenTheme:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_115C28;
      v24[3] = &unk_2C3BB8;
      v24[4] = 0;
      if (qword_348AA8 != -1) {
        dispatch_once(&qword_348AA8, v24);
      }
      id v5 = &qword_348AB0;
      goto LABEL_56;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_115C7C;
      v23[3] = &unk_2C3BB8;
      v23[4] = 1;
      if (qword_348AB8 != -1) {
        dispatch_once(&qword_348AB8, v23);
      }
      id v5 = &qword_348AC0;
      goto LABEL_56;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_115CD0;
      v22[3] = &unk_2C3BB8;
      v22[4] = 2;
      if (qword_348AC8 != -1) {
        dispatch_once(&qword_348AC8, v22);
      }
      id v5 = &qword_348AD0;
      goto LABEL_56;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_115D24;
      v21[3] = &unk_2C3BB8;
      v21[4] = 3;
      if (qword_348AD8 != -1) {
        dispatch_once(&qword_348AD8, v21);
      }
      id v5 = &qword_348AE0;
      goto LABEL_56;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_115D78;
      v20[3] = &unk_2C3BB8;
      v20[4] = 4;
      if (qword_348AE8 != -1) {
        dispatch_once(&qword_348AE8, v20);
      }
      id v5 = &qword_348AF0;
      goto LABEL_56;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_115DCC;
      v19[3] = &unk_2C3BB8;
      v19[4] = 5;
      if (qword_348AF8 != -1) {
        dispatch_once(&qword_348AF8, v19);
      }
      id v5 = &qword_348B00;
      goto LABEL_56;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_115E20;
      block[3] = &unk_2C3BB8;
      block[4] = 6;
      if (qword_348B08 != -1) {
        dispatch_once(&qword_348B08, block);
      }
      id v5 = &qword_348B10;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_115E74;
      v17[3] = &unk_2C3BB8;
      v17[4] = 7;
      if (qword_348B18 != -1) {
        dispatch_once(&qword_348B18, v17);
      }
      id v5 = &qword_348B20;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_115EC8;
      v16[3] = &unk_2C3BB8;
      v16[4] = 8;
      if (qword_348B28 != -1) {
        dispatch_once(&qword_348B28, v16);
      }
      id v5 = &qword_348B30;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_115F1C;
      v15[3] = &unk_2C3BB8;
      v15[4] = 9;
      if (qword_348B38 != -1) {
        dispatch_once(&qword_348B38, v15);
      }
      id v5 = &qword_348B40;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_115F70;
      v14[3] = &unk_2C3BB8;
      v14[4] = 10;
      if (qword_348B48 != -1) {
        dispatch_once(&qword_348B48, v14);
      }
      id v5 = &qword_348B50;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_115FC4;
      v13[3] = &unk_2C3BB8;
      v13[4] = 11;
      if (qword_348B58 != -1) {
        dispatch_once(&qword_348B58, v13);
      }
      id v5 = &qword_348B60;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_116018;
      v12[3] = &unk_2C3BB8;
      v12[4] = 12;
      if (qword_348B68 != -1) {
        dispatch_once(&qword_348B68, v12);
      }
      id v5 = &qword_348B70;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_11606C;
      v11[3] = &unk_2C3BB8;
      v11[4] = 13;
      if (qword_348B78 != -1) {
        dispatch_once(&qword_348B78, v11);
      }
      id v5 = &qword_348B80;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1160C0;
      v10[3] = &unk_2C3BB8;
      v10[4] = 14;
      if (qword_348B88 != -1) {
        dispatch_once(&qword_348B88, v10);
      }
      id v5 = &qword_348B90;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_116114;
      v9[3] = &unk_2C3BB8;
      v9[4] = 15;
      if (qword_348B98 != -1) {
        dispatch_once(&qword_348B98, v9);
      }
      id v5 = &qword_348BA0;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_116168;
      v8[3] = &unk_2C3BB8;
      v8[4] = 16;
      if (qword_348BA8 != -1) {
        dispatch_once(&qword_348BA8, v8);
      }
      id v5 = &qword_348BB0;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)blueTheme:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_116AB0;
      v24[3] = &unk_2C3BB8;
      v24[4] = 0;
      if (qword_348BB8 != -1) {
        dispatch_once(&qword_348BB8, v24);
      }
      id v5 = &qword_348BC0;
      goto LABEL_56;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_116B04;
      v23[3] = &unk_2C3BB8;
      v23[4] = 1;
      if (qword_348BC8 != -1) {
        dispatch_once(&qword_348BC8, v23);
      }
      id v5 = &qword_348BD0;
      goto LABEL_56;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_116B58;
      v22[3] = &unk_2C3BB8;
      v22[4] = 2;
      if (qword_348BD8 != -1) {
        dispatch_once(&qword_348BD8, v22);
      }
      id v5 = &qword_348BE0;
      goto LABEL_56;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_116BAC;
      v21[3] = &unk_2C3BB8;
      v21[4] = 3;
      if (qword_348BE8 != -1) {
        dispatch_once(&qword_348BE8, v21);
      }
      id v5 = &qword_348BF0;
      goto LABEL_56;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_116C00;
      v20[3] = &unk_2C3BB8;
      v20[4] = 4;
      if (qword_348BF8 != -1) {
        dispatch_once(&qword_348BF8, v20);
      }
      id v5 = &qword_348C00;
      goto LABEL_56;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_116C54;
      v19[3] = &unk_2C3BB8;
      v19[4] = 5;
      if (qword_348C08 != -1) {
        dispatch_once(&qword_348C08, v19);
      }
      id v5 = &qword_348C10;
      goto LABEL_56;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_116CA8;
      block[3] = &unk_2C3BB8;
      block[4] = 6;
      if (qword_348C18 != -1) {
        dispatch_once(&qword_348C18, block);
      }
      id v5 = &qword_348C20;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_116CFC;
      v17[3] = &unk_2C3BB8;
      v17[4] = 7;
      if (qword_348C28 != -1) {
        dispatch_once(&qword_348C28, v17);
      }
      id v5 = &qword_348C30;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_116D50;
      v16[3] = &unk_2C3BB8;
      v16[4] = 8;
      if (qword_348C38 != -1) {
        dispatch_once(&qword_348C38, v16);
      }
      id v5 = &qword_348C40;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_116DA4;
      v15[3] = &unk_2C3BB8;
      v15[4] = 9;
      if (qword_348C48 != -1) {
        dispatch_once(&qword_348C48, v15);
      }
      id v5 = &qword_348C50;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_116DF8;
      v14[3] = &unk_2C3BB8;
      v14[4] = 10;
      if (qword_348C58 != -1) {
        dispatch_once(&qword_348C58, v14);
      }
      id v5 = &qword_348C60;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_116E4C;
      v13[3] = &unk_2C3BB8;
      v13[4] = 11;
      if (qword_348C68 != -1) {
        dispatch_once(&qword_348C68, v13);
      }
      id v5 = &qword_348C70;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_116EA0;
      v12[3] = &unk_2C3BB8;
      v12[4] = 12;
      if (qword_348C78 != -1) {
        dispatch_once(&qword_348C78, v12);
      }
      id v5 = &qword_348C80;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_116EF4;
      v11[3] = &unk_2C3BB8;
      v11[4] = 13;
      if (qword_348C88 != -1) {
        dispatch_once(&qword_348C88, v11);
      }
      id v5 = &qword_348C90;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_116F48;
      v10[3] = &unk_2C3BB8;
      v10[4] = 14;
      if (qword_348C98 != -1) {
        dispatch_once(&qword_348C98, v10);
      }
      id v5 = &qword_348CA0;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_116F9C;
      v9[3] = &unk_2C3BB8;
      v9[4] = 15;
      if (qword_348CA8 != -1) {
        dispatch_once(&qword_348CA8, v9);
      }
      id v5 = &qword_348CB0;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_116FF0;
      v8[3] = &unk_2C3BB8;
      v8[4] = 16;
      if (qword_348CB8 != -1) {
        dispatch_once(&qword_348CB8, v8);
      }
      id v5 = &qword_348CC0;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)yellowTheme:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_117938;
      v24[3] = &unk_2C3BB8;
      v24[4] = 0;
      if (qword_348CC8 != -1) {
        dispatch_once(&qword_348CC8, v24);
      }
      id v5 = &qword_348CD0;
      goto LABEL_56;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_11798C;
      v23[3] = &unk_2C3BB8;
      v23[4] = 1;
      if (qword_348CD8 != -1) {
        dispatch_once(&qword_348CD8, v23);
      }
      id v5 = &qword_348CE0;
      goto LABEL_56;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1179E0;
      v22[3] = &unk_2C3BB8;
      v22[4] = 2;
      if (qword_348CE8 != -1) {
        dispatch_once(&qword_348CE8, v22);
      }
      id v5 = &qword_348CF0;
      goto LABEL_56;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_117A34;
      v21[3] = &unk_2C3BB8;
      v21[4] = 3;
      if (qword_348CF8 != -1) {
        dispatch_once(&qword_348CF8, v21);
      }
      id v5 = &qword_348D00;
      goto LABEL_56;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_117A88;
      v20[3] = &unk_2C3BB8;
      v20[4] = 4;
      if (qword_348D08 != -1) {
        dispatch_once(&qword_348D08, v20);
      }
      id v5 = &qword_348D10;
      goto LABEL_56;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_117ADC;
      v19[3] = &unk_2C3BB8;
      v19[4] = 5;
      if (qword_348D18 != -1) {
        dispatch_once(&qword_348D18, v19);
      }
      id v5 = &qword_348D20;
      goto LABEL_56;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_117B30;
      block[3] = &unk_2C3BB8;
      block[4] = 6;
      if (qword_348D28 != -1) {
        dispatch_once(&qword_348D28, block);
      }
      id v5 = &qword_348D30;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_117B84;
      v17[3] = &unk_2C3BB8;
      v17[4] = 7;
      if (qword_348D38 != -1) {
        dispatch_once(&qword_348D38, v17);
      }
      id v5 = &qword_348D40;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_117BD8;
      v16[3] = &unk_2C3BB8;
      v16[4] = 8;
      if (qword_348D48 != -1) {
        dispatch_once(&qword_348D48, v16);
      }
      id v5 = &qword_348D50;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_117C2C;
      v15[3] = &unk_2C3BB8;
      v15[4] = 9;
      if (qword_348D58 != -1) {
        dispatch_once(&qword_348D58, v15);
      }
      id v5 = &qword_348D60;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_117C80;
      v14[3] = &unk_2C3BB8;
      v14[4] = 10;
      if (qword_348D68 != -1) {
        dispatch_once(&qword_348D68, v14);
      }
      id v5 = &qword_348D70;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_117CD4;
      v13[3] = &unk_2C3BB8;
      v13[4] = 11;
      if (qword_348D78 != -1) {
        dispatch_once(&qword_348D78, v13);
      }
      id v5 = &qword_348D80;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_117D28;
      v12[3] = &unk_2C3BB8;
      v12[4] = 12;
      if (qword_348D88 != -1) {
        dispatch_once(&qword_348D88, v12);
      }
      id v5 = &qword_348D90;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_117D7C;
      v11[3] = &unk_2C3BB8;
      v11[4] = 13;
      if (qword_348D98 != -1) {
        dispatch_once(&qword_348D98, v11);
      }
      id v5 = &qword_348DA0;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_117DD0;
      v10[3] = &unk_2C3BB8;
      v10[4] = 14;
      if (qword_348DA8 != -1) {
        dispatch_once(&qword_348DA8, v10);
      }
      id v5 = &qword_348DB0;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_117E24;
      v9[3] = &unk_2C3BB8;
      v9[4] = 15;
      if (qword_348DB8 != -1) {
        dispatch_once(&qword_348DB8, v9);
      }
      id v5 = &qword_348DC0;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_117E78;
      v8[3] = &unk_2C3BB8;
      v8[4] = 16;
      if (qword_348DC8 != -1) {
        dispatch_once(&qword_348DC8, v8);
      }
      id v5 = &qword_348DD0;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)pinkTheme:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1187C0;
      v24[3] = &unk_2C3BB8;
      v24[4] = 0;
      if (qword_348DD8 != -1) {
        dispatch_once(&qword_348DD8, v24);
      }
      id v5 = &qword_348DE0;
      goto LABEL_56;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_118814;
      v23[3] = &unk_2C3BB8;
      v23[4] = 1;
      if (qword_348DE8 != -1) {
        dispatch_once(&qword_348DE8, v23);
      }
      id v5 = &qword_348DF0;
      goto LABEL_56;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_118868;
      v22[3] = &unk_2C3BB8;
      v22[4] = 2;
      if (qword_348DF8 != -1) {
        dispatch_once(&qword_348DF8, v22);
      }
      id v5 = &qword_348E00;
      goto LABEL_56;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1188BC;
      v21[3] = &unk_2C3BB8;
      v21[4] = 3;
      if (qword_348E08 != -1) {
        dispatch_once(&qword_348E08, v21);
      }
      id v5 = &qword_348E10;
      goto LABEL_56;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_118910;
      v20[3] = &unk_2C3BB8;
      v20[4] = 4;
      if (qword_348E18 != -1) {
        dispatch_once(&qword_348E18, v20);
      }
      id v5 = &qword_348E20;
      goto LABEL_56;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_118964;
      v19[3] = &unk_2C3BB8;
      v19[4] = 5;
      if (qword_348E28 != -1) {
        dispatch_once(&qword_348E28, v19);
      }
      id v5 = &qword_348E30;
      goto LABEL_56;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1189B8;
      block[3] = &unk_2C3BB8;
      block[4] = 6;
      if (qword_348E38 != -1) {
        dispatch_once(&qword_348E38, block);
      }
      id v5 = &qword_348E40;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_118A0C;
      v17[3] = &unk_2C3BB8;
      v17[4] = 7;
      if (qword_348E48 != -1) {
        dispatch_once(&qword_348E48, v17);
      }
      id v5 = &qword_348E50;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_118A60;
      v16[3] = &unk_2C3BB8;
      v16[4] = 8;
      if (qword_348E58 != -1) {
        dispatch_once(&qword_348E58, v16);
      }
      id v5 = &qword_348E60;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_118AB4;
      v15[3] = &unk_2C3BB8;
      v15[4] = 9;
      if (qword_348E68 != -1) {
        dispatch_once(&qword_348E68, v15);
      }
      id v5 = &qword_348E70;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_118B08;
      v14[3] = &unk_2C3BB8;
      v14[4] = 10;
      if (qword_348E78 != -1) {
        dispatch_once(&qword_348E78, v14);
      }
      id v5 = &qword_348E80;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_118B5C;
      v13[3] = &unk_2C3BB8;
      v13[4] = 11;
      if (qword_348E88 != -1) {
        dispatch_once(&qword_348E88, v13);
      }
      id v5 = &qword_348E90;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_118BB0;
      v12[3] = &unk_2C3BB8;
      v12[4] = 12;
      if (qword_348E98 != -1) {
        dispatch_once(&qword_348E98, v12);
      }
      id v5 = &qword_348EA0;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_118C04;
      v11[3] = &unk_2C3BB8;
      v11[4] = 13;
      if (qword_348EA8 != -1) {
        dispatch_once(&qword_348EA8, v11);
      }
      id v5 = &qword_348EB0;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_118C58;
      v10[3] = &unk_2C3BB8;
      v10[4] = 14;
      if (qword_348EB8 != -1) {
        dispatch_once(&qword_348EB8, v10);
      }
      id v5 = &qword_348EC0;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_118CAC;
      v9[3] = &unk_2C3BB8;
      v9[4] = 15;
      if (qword_348EC8 != -1) {
        dispatch_once(&qword_348EC8, v9);
      }
      id v5 = &qword_348ED0;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_118D00;
      v8[3] = &unk_2C3BB8;
      v8[4] = 16;
      if (qword_348ED8 != -1) {
        dispatch_once(&qword_348ED8, v8);
      }
      id v5 = &qword_348EE0;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)purpleTheme:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_119648;
      v24[3] = &unk_2C3BB8;
      v24[4] = 0;
      if (qword_348EE8 != -1) {
        dispatch_once(&qword_348EE8, v24);
      }
      id v5 = &qword_348EF0;
      goto LABEL_56;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_11969C;
      v23[3] = &unk_2C3BB8;
      v23[4] = 1;
      if (qword_348EF8 != -1) {
        dispatch_once(&qword_348EF8, v23);
      }
      id v5 = &qword_348F00;
      goto LABEL_56;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1196F0;
      v22[3] = &unk_2C3BB8;
      v22[4] = 2;
      if (qword_348F08 != -1) {
        dispatch_once(&qword_348F08, v22);
      }
      id v5 = &qword_348F10;
      goto LABEL_56;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_119744;
      v21[3] = &unk_2C3BB8;
      v21[4] = 3;
      if (qword_348F18 != -1) {
        dispatch_once(&qword_348F18, v21);
      }
      id v5 = &qword_348F20;
      goto LABEL_56;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_119798;
      v20[3] = &unk_2C3BB8;
      v20[4] = 4;
      if (qword_348F28 != -1) {
        dispatch_once(&qword_348F28, v20);
      }
      id v5 = &qword_348F30;
      goto LABEL_56;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1197EC;
      v19[3] = &unk_2C3BB8;
      v19[4] = 5;
      if (qword_348F38 != -1) {
        dispatch_once(&qword_348F38, v19);
      }
      id v5 = &qword_348F40;
      goto LABEL_56;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_119840;
      block[3] = &unk_2C3BB8;
      block[4] = 6;
      if (qword_348F48 != -1) {
        dispatch_once(&qword_348F48, block);
      }
      id v5 = &qword_348F50;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_119894;
      v17[3] = &unk_2C3BB8;
      v17[4] = 7;
      if (qword_348F58 != -1) {
        dispatch_once(&qword_348F58, v17);
      }
      id v5 = &qword_348F60;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1198E8;
      v16[3] = &unk_2C3BB8;
      v16[4] = 8;
      if (qword_348F68 != -1) {
        dispatch_once(&qword_348F68, v16);
      }
      id v5 = &qword_348F70;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_11993C;
      v15[3] = &unk_2C3BB8;
      v15[4] = 9;
      if (qword_348F78 != -1) {
        dispatch_once(&qword_348F78, v15);
      }
      id v5 = &qword_348F80;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_119990;
      v14[3] = &unk_2C3BB8;
      v14[4] = 10;
      if (qword_348F88 != -1) {
        dispatch_once(&qword_348F88, v14);
      }
      id v5 = &qword_348F90;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1199E4;
      v13[3] = &unk_2C3BB8;
      v13[4] = 11;
      if (qword_348F98 != -1) {
        dispatch_once(&qword_348F98, v13);
      }
      id v5 = &qword_348FA0;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_119A38;
      v12[3] = &unk_2C3BB8;
      v12[4] = 12;
      if (qword_348FA8 != -1) {
        dispatch_once(&qword_348FA8, v12);
      }
      id v5 = &qword_348FB0;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_119A8C;
      v11[3] = &unk_2C3BB8;
      v11[4] = 13;
      if (qword_348FB8 != -1) {
        dispatch_once(&qword_348FB8, v11);
      }
      id v5 = &qword_348FC0;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_119AE0;
      v10[3] = &unk_2C3BB8;
      v10[4] = 14;
      if (qword_348FC8 != -1) {
        dispatch_once(&qword_348FC8, v10);
      }
      id v5 = &qword_348FD0;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_119B34;
      v9[3] = &unk_2C3BB8;
      v9[4] = 15;
      if (qword_348FD8 != -1) {
        dispatch_once(&qword_348FD8, v9);
      }
      id v5 = &qword_348FE0;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_119B88;
      v8[3] = &unk_2C3BB8;
      v8[4] = 16;
      if (qword_348FE8 != -1) {
        dispatch_once(&qword_348FE8, v8);
      }
      id v5 = &qword_348FF0;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)underlineTheme:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_11A4D0;
      v24[3] = &unk_2C3BB8;
      v24[4] = 0;
      if (qword_348FF8 != -1) {
        dispatch_once(&qword_348FF8, v24);
      }
      id v5 = &qword_349000;
      goto LABEL_56;
    case 1:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_11A524;
      v23[3] = &unk_2C3BB8;
      v23[4] = 1;
      if (qword_349008 != -1) {
        dispatch_once(&qword_349008, v23);
      }
      id v5 = &qword_349010;
      goto LABEL_56;
    case 2:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_11A578;
      v22[3] = &unk_2C3BB8;
      v22[4] = 2;
      if (qword_349018 != -1) {
        dispatch_once(&qword_349018, v22);
      }
      id v5 = &qword_349020;
      goto LABEL_56;
    case 3:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_11A5CC;
      v21[3] = &unk_2C3BB8;
      v21[4] = 3;
      if (qword_349028 != -1) {
        dispatch_once(&qword_349028, v21);
      }
      id v5 = &qword_349030;
      goto LABEL_56;
    case 4:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_11A620;
      v20[3] = &unk_2C3BB8;
      v20[4] = 4;
      if (qword_349038 != -1) {
        dispatch_once(&qword_349038, v20);
      }
      id v5 = &qword_349040;
      goto LABEL_56;
    case 5:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_11A674;
      v19[3] = &unk_2C3BB8;
      v19[4] = 5;
      if (qword_349048 != -1) {
        dispatch_once(&qword_349048, v19);
      }
      id v5 = &qword_349050;
      goto LABEL_56;
    case 6:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_11A6C8;
      block[3] = &unk_2C3BB8;
      block[4] = 6;
      if (qword_349058 != -1) {
        dispatch_once(&qword_349058, block);
      }
      id v5 = &qword_349060;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_11A71C;
      v17[3] = &unk_2C3BB8;
      v17[4] = 7;
      if (qword_349068 != -1) {
        dispatch_once(&qword_349068, v17);
      }
      id v5 = &qword_349070;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_11A770;
      v16[3] = &unk_2C3BB8;
      v16[4] = 8;
      if (qword_349078 != -1) {
        dispatch_once(&qword_349078, v16);
      }
      id v5 = &qword_349080;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_11A7C4;
      v15[3] = &unk_2C3BB8;
      v15[4] = 9;
      if (qword_349088 != -1) {
        dispatch_once(&qword_349088, v15);
      }
      id v5 = &qword_349090;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_11A818;
      v14[3] = &unk_2C3BB8;
      v14[4] = 10;
      if (qword_349098 != -1) {
        dispatch_once(&qword_349098, v14);
      }
      id v5 = &qword_3490A0;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_11A86C;
      v13[3] = &unk_2C3BB8;
      v13[4] = 11;
      if (qword_3490A8 != -1) {
        dispatch_once(&qword_3490A8, v13);
      }
      id v5 = &qword_3490B0;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_11A8C0;
      v12[3] = &unk_2C3BB8;
      v12[4] = 12;
      if (qword_3490B8 != -1) {
        dispatch_once(&qword_3490B8, v12);
      }
      id v5 = &qword_3490C0;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_11A914;
      v11[3] = &unk_2C3BB8;
      v11[4] = 13;
      if (qword_3490C8 != -1) {
        dispatch_once(&qword_3490C8, v11);
      }
      id v5 = &qword_3490D0;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_11A968;
      v10[3] = &unk_2C3BB8;
      v10[4] = 14;
      if (qword_3490D8 != -1) {
        dispatch_once(&qword_3490D8, v10);
      }
      id v5 = &qword_3490E0;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_11A9BC;
      v9[3] = &unk_2C3BB8;
      v9[4] = 15;
      if (qword_3490E8 != -1) {
        dispatch_once(&qword_3490E8, v9);
      }
      id v5 = &qword_3490F0;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_11AA10;
      v8[3] = &unk_2C3BB8;
      v8[4] = 16;
      if (qword_3490F8 != -1) {
        dispatch_once(&qword_3490F8, v8);
      }
      id v5 = &qword_349100;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)theme:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setPageTheme:a3];

  return v4;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int64_t)a4
{
  switch(a3)
  {
    case 1:
      id v6 = +[AEAnnotationTheme greenTheme:](AEAnnotationTheme, "greenTheme:", a4, v4);
      goto LABEL_10;
    case 2:
      id v6 = +[AEAnnotationTheme blueTheme:](AEAnnotationTheme, "blueTheme:", a4, v4);
      goto LABEL_10;
    case 3:
      id v6 = +[AEAnnotationTheme yellowTheme:](AEAnnotationTheme, "yellowTheme:", a4, v4);
      goto LABEL_10;
    case 4:
      id v6 = +[AEAnnotationTheme pinkTheme:](AEAnnotationTheme, "pinkTheme:", a4, v4);
      goto LABEL_10;
    case 5:
      id v6 = +[AEAnnotationTheme purpleTheme:](AEAnnotationTheme, "purpleTheme:", a4, v4);
LABEL_10:
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int64_t)a4 isUnderline:(BOOL)a5
{
  v7 = [a1 themeForAnnotationStyle:a3 pageTheme:nil];
  v8 = v7;
  if (v7 || !a5)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[AEAnnotationTheme underlineTheme:a4];
  }
  v10 = v9;

  return v10;
}

+ (double)highlightOpacityForPageTheme:(int64_t)a3
{
  double result = 1.0;
  if ((unint64_t)a3 <= 0x10) {
    return dbl_2A2510[a3];
  }
  return result;
}

+ (id)highlightTextColor:(int64_t)a3
{
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a3)
  {
    case 0:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_11B5DC;
      v23[3] = &unk_2C92C8;
      v23[4] = a1;
      void v23[5] = 0;
      if (qword_349118 != -1) {
        dispatch_once(&qword_349118, v23);
      }
      uint64_t v5 = &qword_349120;
      goto LABEL_56;
    case 1:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_11B690;
      v22[3] = &unk_2C92C8;
      v22[4] = a1;
      void v22[5] = 1;
      if (qword_349128 != -1) {
        dispatch_once(&qword_349128, v22);
      }
      uint64_t v5 = &qword_349130;
      goto LABEL_56;
    case 2:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_11B744;
      v21[3] = &unk_2C92C8;
      v21[4] = a1;
      void v21[5] = 2;
      if (qword_349138 != -1) {
        dispatch_once(&qword_349138, v21);
      }
      uint64_t v5 = &qword_349140;
      goto LABEL_56;
    case 3:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_11B7F8;
      v20[3] = &unk_2C92C8;
      v20[4] = a1;
      void v20[5] = 3;
      if (qword_349148 != -1) {
        dispatch_once(&qword_349148, v20);
      }
      uint64_t v5 = &qword_349150;
      goto LABEL_56;
    case 4:
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_11B528;
      v24[3] = &unk_2C92C8;
      v24[4] = a1;
      void v24[5] = 4;
      if (qword_349108 != -1) {
        dispatch_once(&qword_349108, v24);
      }
      uint64_t v5 = &qword_349110;
      goto LABEL_56;
    case 5:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_11B8AC;
      block[3] = &unk_2C92C8;
      block[4] = a1;
      void block[5] = 5;
      if (qword_349158 != -1) {
        dispatch_once(&qword_349158, block);
      }
      uint64_t v5 = &qword_349160;
      goto LABEL_56;
    case 6:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_11B960;
      v18[3] = &unk_2C92C8;
      v18[4] = a1;
      v18[5] = 6;
      if (qword_349168 != -1) {
        dispatch_once(&qword_349168, v18);
      }
      uint64_t v5 = &qword_349170;
      goto LABEL_56;
    case 7:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_11BA14;
      v17[3] = &unk_2C92C8;
      v17[4] = a1;
      void v17[5] = 7;
      if (qword_349178 != -1) {
        dispatch_once(&qword_349178, v17);
      }
      uint64_t v5 = &qword_349180;
      goto LABEL_56;
    case 8:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_11BAC8;
      v16[3] = &unk_2C92C8;
      v16[4] = a1;
      void v16[5] = 8;
      if (qword_349188 != -1) {
        dispatch_once(&qword_349188, v16);
      }
      uint64_t v5 = &qword_349190;
      goto LABEL_56;
    case 9:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_11BB7C;
      v15[3] = &unk_2C92C8;
      v15[4] = a1;
      void v15[5] = 9;
      if (qword_349198 != -1) {
        dispatch_once(&qword_349198, v15);
      }
      uint64_t v5 = &qword_3491A0;
      goto LABEL_56;
    case 10:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_11BC30;
      v14[3] = &unk_2C92C8;
      v14[4] = a1;
      void v14[5] = 10;
      if (qword_3491A8 != -1) {
        dispatch_once(&qword_3491A8, v14);
      }
      uint64_t v5 = &qword_3491B0;
      goto LABEL_56;
    case 11:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_11BCE4;
      v13[3] = &unk_2C92C8;
      v13[4] = a1;
      void v13[5] = 11;
      if (qword_3491B8 != -1) {
        dispatch_once(&qword_3491B8, v13);
      }
      uint64_t v5 = &qword_3491C0;
      goto LABEL_56;
    case 12:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_11BD98;
      v12[3] = &unk_2C92C8;
      v12[4] = a1;
      void v12[5] = 12;
      if (qword_3491C8 != -1) {
        dispatch_once(&qword_3491C8, v12);
      }
      uint64_t v5 = &qword_3491D0;
      goto LABEL_56;
    case 13:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_11BE4C;
      v11[3] = &unk_2C92C8;
      v11[4] = a1;
      void v11[5] = 13;
      if (qword_3491D8 != -1) {
        dispatch_once(&qword_3491D8, v11);
      }
      uint64_t v5 = &qword_3491E0;
      goto LABEL_56;
    case 14:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_11BF00;
      v10[3] = &unk_2C92C8;
      v10[4] = a1;
      void v10[5] = 14;
      if (qword_3491E8 != -1) {
        dispatch_once(&qword_3491E8, v10);
      }
      uint64_t v5 = &qword_3491F0;
      goto LABEL_56;
    case 15:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_11BFB4;
      v9[3] = &unk_2C92C8;
      v9[4] = a1;
      void v9[5] = 15;
      if (qword_3491F8 != -1) {
        dispatch_once(&qword_3491F8, v9);
      }
      uint64_t v5 = &qword_349200;
      goto LABEL_56;
    case 16:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_11C068;
      v8[3] = &unk_2C92C8;
      v8[4] = a1;
      void v8[5] = 16;
      if (qword_349208 != -1) {
        dispatch_once(&qword_349208, v8);
      }
      uint64_t v5 = &qword_349210;
LABEL_56:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

- (UIColor)noteColorPickerFillColor
{
  return +[UIColor blackColor];
}

- (UIColor)noteColorPickerBorderColor
{
  return +[UIColor blackColor];
}

- (double)noteShadowRadius
{
  if (qword_349218 != -1) {
    dispatch_once(&qword_349218, &stru_2C92E8);
  }
  return *(double *)&qword_349220;
}

- (double)noteShadowOpacity
{
  if (qword_349228 != -1) {
    dispatch_once(&qword_349228, &stru_2C9308);
  }
  return *(double *)&qword_349230;
}

- (UIColor)noteShadowColor
{
  if (qword_349238 != -1) {
    dispatch_once(&qword_349238, &stru_2C9328);
  }
  uint64_t v2 = (void *)qword_349240;

  return (UIColor *)v2;
}

- (CGSize)noteShadowOffset
{
  if (qword_349248 != -1) {
    dispatch_once(&qword_349248, &stru_2C9348);
  }
  double v2 = *(double *)&qword_349250;
  double v3 = *(double *)&qword_349258;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)noteTextFont
{
  if (qword_349260 != -1) {
    dispatch_once(&qword_349260, &stru_2C9368);
  }
  double v2 = (void *)qword_349268;

  return (UIFont *)v2;
}

- (UIFont)noteTextFontInTable
{
  if (qword_349270 != -1) {
    dispatch_once(&qword_349270, &stru_2C9388);
  }
  double v2 = (void *)qword_349278;

  return (UIFont *)v2;
}

- (BOOL)isUnderline
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 852, (uint64_t)"-[AEAnnotationTheme isUnderline]", (uint64_t)"NO", @"Abstract method isUnderline was called!", v2, v3, v4, vars0);
  return 0;
}

- (int)annotationStyle
{
  BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationTheme.m", 858, (uint64_t)"-[AEAnnotationTheme annotationStyle]", (uint64_t)"NO", @"Abstract method annotationStyle was called!", v2, v3, v4, vars0);
  return 1;
}

- (BOOL)noteHasBorder
{
  return (char *)[(AEAnnotationTheme *)self pageTheme] != (char *)&def_7D91C + 2
      && (char *)[(AEAnnotationTheme *)self pageTheme] != (char *)&def_7D91C + 3;
}

- (BOOL)noteMarkerHasBorder
{
  return [(AEAnnotationTheme *)self noteHasBorder];
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

@end