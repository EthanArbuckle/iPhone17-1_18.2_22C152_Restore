@interface PPTWaitForMigrationTest
- (void)iterationCheck;
- (void)startTest;
@end

@implementation PPTWaitForMigrationTest

- (void)iterationCheck
{
  if ([(PPTBasicTest *)self running])
  {
    v3 = [(PPTBasicTest *)self asset];

    if (v3)
    {
      [(PPTBasicTest *)self finishPPTTestWithResult:0];
    }
    else
    {
      v4 = sub_10020FC30();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Migrated asset not found. Rechecking after 3s", buf, 2u);
      }

      dispatch_time_t v5 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C95A8;
      block[3] = &unk_100A43D60;
      block[4] = self;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)startTest
{
  [(PPTBasicTest *)self setTestTimeout:120];
  [(PPTBasicTest *)self setRunning:1];

  [(PPTWaitForMigrationTest *)self iterationCheck];
}

@end