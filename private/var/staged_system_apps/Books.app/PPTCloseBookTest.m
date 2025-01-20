@interface PPTCloseBookTest
- (void)startTest;
@end

@implementation PPTCloseBookTest

- (void)startTest
{
  v16.receiver = self;
  v16.super_class = (Class)PPTCloseBookTest;
  [(PPTSubtestBasedOpenTest *)&v16 startTest];
  v3 = [(PPTBasicTest *)self bookController];

  if (!v3) {
    goto LABEL_15;
  }
  objc_opt_class();
  v4 = [(PPTBasicTest *)self bookController];
  v5 = BUDynamicCast();

  if (!v5)
  {
    v7 = [(PPTBasicTest *)self bookController];
    unsigned int v8 = +[RETestDriver isValidWithViewController:v7];

    if (v8)
    {
      v9 = sub_10020FC30();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Asking RETestDriver to close book", v15, 2u);
      }

      v10 = [(PPTBasicTest *)self bookController];
      unsigned __int8 v11 = +[RETestDriver closeBookWithViewController:v10];
      goto LABEL_14;
    }
    v12 = [(PPTBasicTest *)self bookController];

    if (v12)
    {
      v13 = sub_10020FC30();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Asking THTestDriver to close book", v15, 2u);
      }

      v10 = [(PPTBasicTest *)self bookController];
      unsigned __int8 v11 = +[THTestDriver closeBookWithBookController:v10];
LABEL_14:
      unsigned __int8 v14 = v11;

      if (v14) {
        return;
      }
    }
LABEL_15:
    [(PPTBasicTest *)self finishPPTTestWithResult:1];
    return;
  }
  v6 = sub_10020FC30();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Asking BKBookViewController to show the library", v15, 2u);
  }

  [v5 showLibrary:0];
}

@end