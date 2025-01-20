@interface PPTLibraryScrollToBookTest
- (void)startTest;
@end

@implementation PPTLibraryScrollToBookTest

- (void)startTest
{
  [(PPTBasicTest *)self setTestTimeout:120];
  [(PPTBasicTest *)self setRunning:1];
  [(PPTBasicTest *)self startPPTTest];
  v3 = [(PPTBasicTest *)self asset];

  if (v3)
  {
    v4 = [(PPTBasicTest *)self bookshelf];
    if (!v4)
    {
      v5 = sub_10020FC30();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Could not find the bookshelf", buf, 2u);
      }
    }
    v6 = [(PPTBasicTest *)self asset];
    v7 = [v6 assetID];
    [v4 scrollToMakeLibraryAssetIDVisible:v7];

    dispatch_time_t v8 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100092D34;
    block[3] = &unk_100A43D60;
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v9 = sub_10020FC30();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "We do not have a valid book asset", buf, 2u);
    }

    [(PPTBasicTest *)self finishPPTTestWithResult:1];
  }
}

@end