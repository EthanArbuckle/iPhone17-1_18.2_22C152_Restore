@interface PPTEpubGoToScrolledTest
- (NSString)targetLayout;
- (PPTEpubGoToScrolledTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (void)setTargetLayout:(id)a3;
- (void)startTest;
@end

@implementation PPTEpubGoToScrolledTest

- (PPTEpubGoToScrolledTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PPTEpubGoToScrolledTest;
  v6 = [(PPTBasicTest *)&v9 initWithName:a3 options:a4 testDefinition:a5 isMainTest:a6];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_targetLayout, kBETestDriverEpubLayoutVerticalScroll);
  }
  return v7;
}

- (void)startTest
{
  [(PPTBasicTest *)self setRunning:1];
  v3 = [(PPTBasicTest *)self bookController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(PPTBasicTest *)self bookController];
    uint64_t v6 = +[AETestDriver getBookControllerLayout:v5];
LABEL_5:
    objc_super v9 = (__CFString *)v6;

    goto LABEL_7;
  }
  v7 = [(PPTBasicTest *)self bookController];
  unsigned int v8 = +[RETestDriver isValidWithViewController:v7];

  if (v8)
  {
    v5 = [(PPTBasicTest *)self bookController];
    uint64_t v6 = +[RETestDriver getBookControllerLayoutWithViewController:v5];
    goto LABEL_5;
  }
  objc_super v9 = &stru_100A70340;
LABEL_7:
  if ([(__CFString *)v9 isEqualToString:self->_targetLayout])
  {
    [(PPTBasicTest *)self startPPTTest];
    [(PPTBasicTest *)self finishPPTTestWithResult:0];
  }
  else
  {
    v10 = sub_10020FC30();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "We do not have the correct layout, changing it", buf, 2u);
    }

    [(PPTBasicTest *)self subscribeToStartNotification:kBETestDriverPagedToScrolledAnimationStart endNotification:kBETestDriverPagedToScrolledAnimationEnd];
    v11 = [(PPTBasicTest *)self bookController];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      v13 = [(PPTBasicTest *)self bookController];
      +[AETestDriver setBookController:v13 layout:self->_targetLayout];
    }
    else
    {
      v14 = [(PPTBasicTest *)self bookController];
      unsigned int v15 = +[RETestDriver isValidWithViewController:v14];

      if (v15)
      {
        targetLayout = self->_targetLayout;
        v17 = [(PPTBasicTest *)self bookController];
        +[RETestDriver setBookControllerLayout:targetLayout viewController:v17];
      }
      else
      {
        v17 = sub_10020FC30();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "bookController is not the correct class", v18, 2u);
        }
      }
    }
  }
}

- (NSString)targetLayout
{
  return self->_targetLayout;
}

- (void)setTargetLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end