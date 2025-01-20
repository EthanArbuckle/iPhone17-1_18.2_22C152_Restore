@interface PPTPageScrollerForwardPageTurnTest
- (void)turnPage;
@end

@implementation PPTPageScrollerForwardPageTurnTest

- (void)turnPage
{
  objc_opt_class();
  v3 = [(PPTBasicTest *)self bookController];
  v4 = BUDynamicCast();

  if (v4)
  {
    if ([v4 turnPages:1 animated:1]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v5 = [(PPTBasicTest *)self bookController];
  unsigned int v6 = +[RETestDriver isValidWithViewController:v5];

  if (!v6) {
    goto LABEL_8;
  }
  v7 = sub_10020FC30();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Asking RETestDriver to turn page", v10, 2u);
  }

  v8 = [(PPTBasicTest *)self bookController];
  unsigned __int8 v9 = +[RETestDriver turnPageWithViewController:v8 forward:1];

  if ((v9 & 1) == 0) {
LABEL_8:
  }
    [(PPTBasicTest *)self finishPPTTestWithResult:1];
LABEL_9:
}

@end