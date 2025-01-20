@interface THTestDriver
+ (BOOL)closeBookWithBookController:(id)a3;
+ (BOOL)goToFirstChapterWithController:(id)a3;
+ (BOOL)turnPageWithBookController:(id)a3 direction:(int)a4;
+ (id)validateController:(id)a3;
@end

@implementation THTestDriver

+ (id)validateController:(id)a3
{
  objc_opt_class();

  return (id)BUDynamicCast();
}

+ (BOOL)turnPageWithBookController:(id)a3 direction:(int)a4
{
  id v5 = [a1 validateController:a3];
  if (v5)
  {
    v6 = v5;
    id v5 = [v5 documentViewController];
    if (v5)
    {
      id v5 = [[v6 documentViewController] interactiveCanvasController];
      if (v5)
      {
        if (a4 < 0)
        {
          v7 = block;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          v8 = sub_5D39C;
        }
        else
        {
          v7 = v10;
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v8 = sub_5D3CC;
        }
        v7[2] = v8;
        v7[3] = &unk_456DE0;
        v7[4] = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
        LOBYTE(v5) = 1;
      }
    }
  }
  return (char)v5;
}

+ (BOOL)closeBookWithBookController:(id)a3
{
  id v3 = [a1 validateController:a3];
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5D48C;
    block[3] = &unk_456DE0;
    block[4] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v4 != 0;
}

+ (BOOL)goToFirstChapterWithController:(id)a3
{
  id v3 = [a1 validateController:a3];
  if (v3)
  {
    id v4 = v3;
    if ([v3 chapterBrowserController])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_5D528;
      block[3] = &unk_456DE0;
      block[4] = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  return 0;
}

@end