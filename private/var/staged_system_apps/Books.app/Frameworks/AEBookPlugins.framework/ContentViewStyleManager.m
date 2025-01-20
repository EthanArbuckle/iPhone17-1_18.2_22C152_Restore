@interface ContentViewStyleManager
+ (id)_templateCompatibleThemesForTraitCollection:(id)a3;
+ (id)getInlineStyleSheetForConfiguration:(id)a3 bookInfo:(id)a4 contentLayoutSize:(CGSize)a5 webkit2:(BOOL)a6;
+ (id)getPictureBookUserStyleSheetWithLegacyBook:(BOOL)a3;
+ (id)registeredThemes;
+ (id)templateSet;
+ (void)initialize;
+ (void)registerTheme:(id)a3;
@end

@implementation ContentViewStyleManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v3 = qword_22B5F0;
    qword_22B5F0 = (uint64_t)v2;
    _objc_release_x1(v2, v3);
  }
}

+ (id)templateSet
{
  if (qword_22B600 != -1) {
    dispatch_once(&qword_22B600, &stru_1DD0F0);
  }
  id v2 = (void *)qword_22B5F8;

  return v2;
}

+ (id)getPictureBookUserStyleSheetWithLegacyBook:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [a1 templateSet];
  CFStringRef v19 = @"legacyBook";
  v5 = +[NSNumber numberWithBool:v3];
  v20 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v12 = 0;
  v7 = [v4 evaluateTemplateWithName:@"picturebook" withData:v6 error:&v12];
  v8 = (char *)v12;

  if (!v7)
  {
    v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "+[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:]";
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Utilities/StyleManager/ContentViewStyleManager.m";
      __int16 v17 = 1024;
      int v18 = 76;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "@\"Error evaluating user_stylesheet_picturebook.css.tmpl: %@\"", buf, 0xCu);
    }

    v7 = &stru_1DF0D8;
  }

  return v7;
}

+ (void)registerTheme:(id)a3
{
}

+ (id)registeredThemes
{
  return (id)qword_22B5F0;
}

+ (id)_templateCompatibleThemesForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableArray);
  id v5 = [v4 initWithCapacity:[qword_22B5F0 count]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)qword_22B5F0;
  v6 = (char *)[obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        v10 = BUDynamicCast();
        id v11 = objc_alloc_init((Class)NSMutableDictionary);
        id v12 = [v10 stableIdentifier];
        [v11 setObject:v12 forKeyedSubscript:@"identifier"];

        v13 = [v10 gaijiImageFilter];
        [v11 setObject:v13 forKeyedSubscript:@"gaijiImageFilter"];

        v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 shouldInvertContent]);
        [v11 setObject:v14 forKeyedSubscript:@"shouldInvertContent"];

        __int16 v15 = [v10 backgroundsByLevel];
        [v11 setObject:v15 forKeyedSubscript:@"backgroundsByLevel"];

        v16 = [v10 contentTextColor];
        [v11 setObject:v16 forKeyedSubscript:@"contentTextColor"];

        __int16 v17 = [v10 linkActiveColor];
        [v11 setObject:v17 forKeyedSubscript:@"linkActiveColor"];

        int v18 = [v10 linkColor];
        [v11 setObject:v18 forKeyedSubscript:@"linkColor"];

        CFStringRef v19 = [v10 linkVisitedColor];
        [v11 setObject:v19 forKeyedSubscript:@"linkVisitedColor"];

        v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 overlayContentBackgroundColor]);
        [v11 setObject:v20 forKeyedSubscript:@"overlayContentBackgroundColor"];

        v21 = [v10 backgroundColorForTraitCollection:v3];
        [v11 setObject:v21 forKeyedSubscript:@"contentBackgroundColor"];

        [v5 addObject:v11];
      }
      v7 = (char *)[obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)getInlineStyleSheetForConfiguration:(id)a3 bookInfo:(id)a4 contentLayoutSize:(CGSize)a5 webkit2:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (!v10)
  {
    long long v25 = 0;
    goto LABEL_41;
  }
  BOOL v76 = v6;
  uint64_t v13 = [v11 language];
  v14 = (void *)v13;
  __int16 v15 = (void *)BEiBooksDefaultLanguage;
  if (v13) {
    __int16 v15 = (void *)v13;
  }
  id v16 = v15;

  double v17 = width;
  if (isPad())
  {
    if (isPortrait()) {
      double v17 = width;
    }
    else {
      double v17 = width * 1.39999998;
    }
  }
  unsigned int v74 = [v10 isScroll];
  int v18 = (char *)[v10 layout];
  CFStringRef v19 = [v12 respectImageSizeClass];
  id v20 = [v19 length];

  v77 = v12;
  if (v20)
  {
    unsigned int v21 = [v12 respectImageSizeClassIsPrefix];
    uint64_t v22 = [v12 respectImageSizeClass];
    v23 = (void *)v22;
    if (v21) {
      CFStringRef v24 = @"[class|=%@]";
    }
    else {
      CFStringRef v24 = @"[class~=%@]";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v22);
    v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v81 = &stru_1DF0D8;
  }
  long long v26 = [v10 style];
  id v78 = v10;
  long long v27 = [v10 environment];
  v28 = [v27 traitCollection];
  v80 = +[ContentViewStyleManager _templateCompatibleThemesForTraitCollection:v28];

  [v26 lineHeight];
  if (v29 == 1.0)
  {
    v30 = +[NSUserDefaults standardUserDefaults];
    id v31 = [v30 BOOLForKey:@"BKUseOldFontStepsAndSpacing"];
  }
  else
  {
    id v31 = &dword_0 + 1;
  }
  id v32 = v16;
  v33 = +[NSMutableDictionary dictionary];
  v34 = +[BKStyleManager styleManagerWithLanguage:v32];

  v35 = [v34 fontFaceMappings];
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_B0DE4;
  v84 = &unk_1DD138;
  id v75 = v33;
  id v85 = v75;
  [v35 enumerateKeysAndObjectsUsingBlock:buf];

  v73 = +[NSNumber numberWithBool:v31];
  v72 = +[NSNumber numberWithDouble:width];
  v71 = +[NSNumber numberWithDouble:height];
  id v36 = v26;
  v37 = [v36 fontFamily];
  if (![v37 length])
  {

    goto LABEL_22;
  }
  unsigned __int8 v38 = [v36 justification];

  if ((v38 & 1) == 0)
  {
LABEL_22:
    CFStringRef v39 = @"-webkit-auto";
    goto LABEL_23;
  }
  CFStringRef v39 = @"justify";
LABEL_23:
  CFStringRef v70 = v39;
  BOOL v40 = v18 == (unsigned char *)&dword_0 + 3;

  v79 = +[NSNumber numberWithBool:v20 != 0];
  unsigned int v41 = [v36 autoHyphenate];
  v42 = @"manual";
  if (v41) {
    v42 = @"auto";
  }
  v43 = v42;
  v62 = v43;
  unsigned int v44 = [v36 optimizeLegibility];
  v45 = @"optimizeLegibility";
  if (!v44) {
    v45 = @"auto";
  }
  v66 = v45;
  v65 = +[NSNumber numberWithDouble:v17];
  v69 = [v36 fontFamily];
  uint64_t v46 = [v69 imSanitizedFontFamilyName];
  v68 = (void *)v46;
  if (v46) {
    CFStringRef v47 = (const __CFString *)v46;
  }
  else {
    CFStringRef v47 = &stru_1DF0D8;
  }
  CFStringRef v64 = v47;
  v67 = [v36 fontFamily];
  v63 = sub_B00BC(v67, v32);
  v48 = +[NSNumber numberWithBool:isPhone()];
  v49 = +[NSNumber numberWithBool:v74];
  v50 = +[NSNumber numberWithBool:v40];
  v51 = +[NSNumber numberWithBool:sub_B0D10(v32, @"ja")];
  v52 = +[NSNumber numberWithBool:sub_B0D10(v32, @"zh")];
  if (+[BKStyleManager languageIsSimplifiedChinese:v32]) {
    CFStringRef v53 = @"'Songti SC', 'Songti TC'";
  }
  else {
    CFStringRef v53 = @"'Songti TC', 'Songti SC'";
  }
  v54 = +[NSNumber numberWithBool:v76];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v75, @"fonts", v73, @"useLineHeight", v72, @"pageWidth", v71, @"pageHeight", v70, @"justification", v32, @"language", v80, @"themes", v81, @"respectImageSizeSelector", v79,
    @"respectImageSizeSelectorIsGaiji",
    v43,
    @"hyphens",
    v66,
    @"textRendering",
    v65,
    @"tdClamp",
    v64,
    @"fontFamily",
    v63,
    @"fontFallbacks",
    v48,
    @"isPhone",
    &__kCFBooleanTrue,
    @"isIOS",
    v49,
    @"isScrollMode",
    v50,
    @"scrollModeIsHorizontal",
    v51,
    @"isJapanese",
    v52,
    @"isChinese",
    v53,
    @"defaultChineseFont",
    v54,
    @"isWKTwo",
    v36,
    @"style",
  v55 = 0);

  v56 = +[ContentViewStyleManager templateSet];
  id v82 = 0;
  v57 = [v56 evaluateTemplateWithName:@"flowable" withData:v55 error:&v82];
  id v58 = v82;

  if (v57)
  {
    long long v25 = v57;
    id v12 = v77;
  }
  else
  {
    v59 = BCIMLog();
    id v12 = v77;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[ContentViewStyleManager(StylesheetGeneration) getInlineStyleSheetForConfiguration:bookInfo:"
                           "contentLayoutSize:webkit2:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Utilities/StyleManager/"
                            "ContentViewStyleManager.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v84) = 353;
      _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v60 = BCIMLog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v58;
      _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "@\"Error evaluating user_stylesheet.css.tmpl: %@\"", buf, 0xCu);
    }

    long long v25 = &stru_1DF0D8;
  }

  id v10 = v78;
LABEL_41:

  return v25;
}

@end