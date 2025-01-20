@interface PPTTurnToFirstPageTest
- (void)startTest;
@end

@implementation PPTTurnToFirstPageTest

- (void)startTest
{
  objc_opt_class();
  v3 = [(PPTBasicTest *)self bookController];
  v4 = BUDynamicCast();

  if (v4)
  {
    [v4 turnToInitialPage:0];
    v5 = self;
    uint64_t v6 = 0;
LABEL_7:
    [(PPTBasicTest *)v5 setResult:v6];
    v12 = [(PPTBasicTest *)self onTestFinished];
    v12[2]();

    goto LABEL_8;
  }
  v7 = [(PPTBasicTest *)self bookController];
  unsigned int v8 = +[RETestDriver isValidWithViewController:v7];

  if (v8)
  {
    v9 = sub_10020FC30();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Asking RETestDriver to turn to initial page", v13, 2u);
    }

    v10 = [(PPTBasicTest *)self bookController];
    unsigned int v11 = +[RETestDriver turnToInitialPageWithViewController:v10];

    uint64_t v6 = v11 ^ 1;
    v5 = self;
    goto LABEL_7;
  }
LABEL_8:
}

@end