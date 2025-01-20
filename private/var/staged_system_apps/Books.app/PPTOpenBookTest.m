@interface PPTOpenBookTest
- (void)startTest;
@end

@implementation PPTOpenBookTest

- (void)startTest
{
  v3 = [(PPTBasicTest *)self asset];

  if (!v3)
  {
    v17 = sub_10020FC30();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Open book test has no asset to open", buf, 2u);
    }

    goto LABEL_17;
  }
  v19.receiver = self;
  v19.super_class = (Class)PPTOpenBookTest;
  [(PPTSubtestBasedOpenTest *)&v19 startTest];
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 objectForKey:@"BKPageTurnStyle"];

  if (!v5) {
    [v4 setObject:@"slide" forKey:@"BKPageTurnStyle"];
  }
  v6 = [(PPTBasicTest *)self bookshelf];
  if (!v6)
  {
    v7 = sub_10020FC30();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Open book test could not find the bookshelf VC", buf, 2u);
    }
  }
  v8 = sub_10020FC30();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 dataSourceAdaptor];
    v10 = [v9 booksDataSource];
    id v11 = [v10 totalNumberOfItems];
    *(_DWORD *)buf = 134217984;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Bookshelf has %ld books", buf, 0xCu);
  }
  objc_opt_class();
  v12 = [(PPTBasicTest *)self asset];
  v13 = BUDynamicCast();

  v14 = [v6 dataSourceAdaptor];
  v15 = [v14 booksDataSource];
  v16 = [v15 indexPathForRepresentedObject:v13];

  if (v16)
  {
    [v6 bookTapped:v16 completion:0];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    v18 = sub_10020FC30();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Open book test could not find the book in the bookshelf", buf, 2u);
    }
  }
  if (!v16) {
LABEL_17:
  }
    [(PPTBasicTest *)self finishPPTTestWithResult:1];
}

@end