@interface PPTEpubForwardPageTurnTest
- (void)turnPage;
@end

@implementation PPTEpubForwardPageTurnTest

- (void)turnPage
{
  if ([(PPTTurnPageTest *)self glitchFree])
  {
    v3 = sub_10020FC30();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Using Recap to run GlitchFree test for turn page PPT", (uint8_t *)buf, 2u);
    }

    objc_opt_class();
    v4 = [(PPTBasicTest *)self bookController];
    v5 = BUDynamicCast();

    v6 = [v5 view];
    v7 = [v6 window];

    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(PPTBasicTest *)self testDefinition];
    v17 = [v16 objectForKeyedSubscript:@"book-type"];

    if (v17)
    {
      if ([v17 isEqualToString:@"epub-rtl"]) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 2;
      }
    }
    else
    {
      uint64_t v18 = 2;
    }
    objc_initWeak(buf, self);
    id v23 = objc_alloc((Class)RPTDirectionalSwipeTestParameters);
    v24 = [(PPTBasicTest *)self name];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100185438;
    v32[3] = &unk_100A43F68;
    objc_copyWeak(&v33, buf);
    id v25 = [v23 initWithTestName:v24 scrollingBounds:1 swipeCount:v18 direction:v32 completionHandler:v9 + 64.0 v11 + 64.0 v13 + -128.0 v15 + -128.0];

    v26 = +[RPTCoordinateSpaceConverter converterFromWindow:v7];
    [v25 setConversion:v26];

    +[RPTTestRunner runTestWithParameters:v25];
    objc_destroyWeak(&v33);
    objc_destroyWeak(buf);

    return;
  }
  objc_opt_class();
  v19 = [(PPTBasicTest *)self bookController];
  v20 = BUDynamicCast();

  if (v20)
  {
    v21 = sub_10020FC30();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Asking BKBookViewController to turn page", (uint8_t *)buf, 2u);
    }

    unsigned __int8 v22 = [v20 turnPages:1 animated:1];
    if (v22) {
      return;
    }
LABEL_19:
    [(PPTBasicTest *)self finishPPTTestWithResult:1];
    return;
  }
  v27 = [(PPTBasicTest *)self bookController];
  unsigned int v28 = +[RETestDriver isValidWithViewController:v27];

  if (!v28) {
    goto LABEL_19;
  }
  v29 = sub_10020FC30();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Asking RETestDriver to turn page", (uint8_t *)buf, 2u);
  }

  v30 = [(PPTBasicTest *)self bookController];
  unsigned __int8 v31 = +[RETestDriver turnPageWithViewController:v30 forward:1];

  if ((v31 & 1) == 0) {
    goto LABEL_19;
  }
}

@end