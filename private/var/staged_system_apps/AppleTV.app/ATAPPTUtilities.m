@interface ATAPPTUtilities
+ (BOOL)_selectButtonWithTitle:(id)a3 inView:(id)a4;
+ (BOOL)performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 tabBarController:(id)a6 scrollViewBlock:(id)a7;
+ (BOOL)selectButtonWithTitle:(id)a3 inShelf:(id)a4 inTabBarController:(id)a5;
+ (BOOL)selectButtonWithTitle:(id)a3 inTabBarController:(id)a4;
+ (BOOL)selectFirstShelfWithButtonTitle:(id)a3 inTabBarController:(id)a4;
+ (BOOL)selectTabWithTitle:(id)a3 inTabBarController:(id)a4;
+ (id)_cellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5;
+ (id)_findCollectionViewInView:(id)a3;
+ (id)_findLabelInView:(id)a3;
+ (id)_findLabelWithTitle:(id)a3 inView:(id)a4;
+ (id)_findScrollViewInViewController:(id)a3;
+ (id)_findShelfViewControllerInViewController:(id)a3 withShelfRow:(unint64_t)a4;
+ (id)_findShelfViewControllerInViewController:(id)a3 withTitle:(id)a4;
+ (id)_findTVButtonWithTitle:(id)a3 inView:(id)a4;
+ (id)_findUIButtonWithTitle:(id)a3 inView:(id)a4;
+ (id)_findVUIRoundButtonWithTitle:(id)a3 inView:(id)a4;
+ (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5;
+ (id)_topViewControllerInTabBarController:(id)a3;
+ (id)findScrollViewByIndexInStackCollectionView:(id)a3 index:(unint64_t)a4;
+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4;
+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(int)a5;
+ (id)prepareForPPT;
+ (id)testLog;
+ (id)testOperationQueue;
+ (id)topMostController;
+ (void)resetNumScrollViewFound;
+ (void)waitForNotificiation:(id)a3;
+ (void)waitForTabWithTitleToLoad:(id)a3 inTabBarController:(id)a4 totalChildren:(unint64_t)a5;
- (ATAPPTUtilities)init;
@end

@implementation ATAPPTUtilities

- (ATAPPTUtilities)init
{
  return 0;
}

+ (id)testLog
{
  if (qword_10001E528 != -1) {
    dispatch_once(&qword_10001E528, &stru_100018BE0);
  }
  v2 = (void *)qword_10001E520;

  return v2;
}

+ (id)testOperationQueue
{
  if (qword_10001E538 != -1) {
    dispatch_once(&qword_10001E538, &stru_100018C00);
  }
  v2 = (void *)qword_10001E530;

  return v2;
}

+ (BOOL)performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 tabBarController:(id)a6 scrollViewBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = +[ATAPPTUtilities testLog];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Running scrollview test '%@'", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v61 = 0x3032000000;
  v62 = sub_100008F10;
  v63 = sub_100008F20;
  id v64 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008F28;
  block[3] = &unk_100018C28;
  p_long long buf = &buf;
  id v59 = a1;
  id v17 = v14;
  id v57 = v17;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  usleep(0xF4240u);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_100008F10;
  v54 = sub_100008F20;
  id v55 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100008FB8;
  v45[3] = &unk_100018C50;
  id v18 = v15;
  id v46 = v18;
  v47 = &v50;
  v48 = &buf;
  id v49 = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v45);

  if (v51[5])
  {
    v19 = [v12 lowercaseString];
    unsigned int v20 = [v19 containsString:@"landscape"];

    if (v20)
    {
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      v22 = +[UIScreen mainScreen];
      [v22 bounds];
      double Height = CGRectGetHeight(v65);

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100009034;
      v38[3] = &unk_100018CE0;
      v41 = &v50;
      int v43 = 30;
      int v44 = (int)(Height * 5.0);
      unint64_t v42 = a5;
      id v39 = v12;
      dispatch_semaphore_t v40 = v21;
      v24 = v21;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v38);

      dispatch_time_t v25 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v24, v25);

LABEL_8:
      BOOL v26 = 1;
      goto LABEL_12;
    }
    if ([sub_10000910C() isRecapAvailable])
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000091F0;
      v34[3] = &unk_100018C28;
      v36 = &v50;
      unint64_t v37 = a5;
      v35 = v12;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v34);

      v24 = v35;
      goto LABEL_8;
    }
  }
  v24 = +[ATAPPTUtilities testLog];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_100011B48((uint64_t)v12, v24, v27, v28, v29, v30, v31, v32);
  }
  BOOL v26 = 0;
LABEL_12:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&buf, 8);

  return v26;
}

+ (id)prepareForPPT
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100008F10;
  v9 = sub_100008F20;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009438;
  block[3] = &unk_100018D08;
  void block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  usleep(0xC350u);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (BOOL)selectButtonWithTitle:(id)a3 inTabBarController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _topViewControllerInTabBarController:a4];
  v8 = [v7 view];
  if ([a1 _selectButtonWithTitle:v6 inView:v8])
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    id v10 = [v7 navigationController];
    v11 = [v10 navigationBar];

    if (v11)
    {
      id v12 = [v7 navigationController];
      id v13 = [v12 navigationBar];
      unsigned __int8 v9 = [a1 _selectButtonWithTitle:v6 inView:v13];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)selectButtonWithTitle:(id)a3 inShelf:(id)a4 inTabBarController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 _topViewControllerInTabBarController:a5];
  v11 = [a1 _findShelfViewControllerInViewController:v10 withTitle:v9];

  if (v11)
  {
    id v12 = [v11 view];
    unsigned __int8 v13 = [a1 _selectButtonWithTitle:v8 inView:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (BOOL)selectFirstShelfWithButtonTitle:(id)a3 inTabBarController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _topViewControllerInTabBarController:a4];
  id v8 = [v7 childViewControllers];
  id v9 = [v8 count];

  id v10 = 0;
  if (v9)
  {
    unint64_t v11 = 0;
    while (1)
    {
      id v12 = v10;
      id v10 = [a1 _findShelfViewControllerInViewController:v7 withShelfRow:v11];

      if (v10)
      {
        unsigned __int8 v13 = [v10 view];
        unsigned __int8 v14 = [a1 _selectButtonWithTitle:v6 inView:v13];

        if (v14) {
          break;
        }
      }
      ++v11;
      id v15 = [v7 childViewControllers];
      id v16 = [v15 count];

      if (v11 >= (unint64_t)v16) {
        goto LABEL_6;
      }
    }
    dispatch_time_t v25 = [v10 view];
    unsigned __int8 v24 = [a1 _selectButtonWithTitle:v6 inView:v25];
  }
  else
  {
LABEL_6:
    id v17 = +[ATAPPTUtilities testLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100011BB4((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
    }

    unsigned __int8 v24 = 0;
  }

  return v24;
}

+ (BOOL)selectTabWithTitle:(id)a3 inTabBarController:(id)a4
{
  id v6 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100009934;
  unsigned __int8 v13 = &unk_100018D30;
  id v7 = a4;
  id v14 = v7;
  id v8 = v6;
  id v15 = v8;
  id v16 = v18;
  id v17 = v20;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &v10);
  LOBYTE(a1) = [a1 _blockExecutionInTabBarController:v7 documentRef:v8 totalChildren:1 v10 v11 v12 v13];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  return (char)a1;
}

+ (void)waitForNotificiation:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = +[NSNotificationCenter defaultCenter];
  id v7 = [a1 testOperationQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009CA4;
  v11[3] = &unk_100018D58;
  dispatch_semaphore_t v12 = v5;
  id v8 = v5;
  id v9 = [v6 addObserverForName:v4 object:0 queue:v7 usingBlock:v11];

  dispatch_time_t v10 = dispatch_time(0, 180000000000);
  dispatch_semaphore_wait(v8, v10);
}

+ (void)waitForTabWithTitleToLoad:(id)a3 inTabBarController:(id)a4 totalChildren:(unint64_t)a5
{
}

+ (void)resetNumScrollViewFound
{
  dword_10001E540 = 0;
}

+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() findScrollViewInView:v5 desiredScrollViewClass:a4 numScrollViewsToSkip:0];

  return v6;
}

+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  if (v8)
  {
    if (!a4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:
        id v9 = v8;
        goto LABEL_20;
      }
      objc_opt_class();
    }
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    dispatch_time_t v10 = [v8 subviews];
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [a1 findScrollViewInView:*(void *)(*((void *)&v18 + 1) + 8 * i) desiredScrollViewClass:a4 numScrollViewsToSkip:v5];
          id v9 = v15;
          int v16 = dword_10001E540;
          if (v15) {
            int v16 = ++dword_10001E540;
          }
          if (v16 > (int)v5)
          {

            goto LABEL_20;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  id v9 = 0;
LABEL_20:

  return v9;
}

+ (id)findScrollViewByIndexInStackCollectionView:(id)a3 index:(unint64_t)a4
{
  uint64_t v5 = [a3 view];
  id v6 = +[ATAPPTUtilities findScrollViewInView:v5 desiredScrollViewClass:NSClassFromString(@"VideosUI.StackCollectionView")];

  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v6 subviews];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [v7 sortedArrayUsingComparator:&stru_100018D98];
  id v15 = v14;
  if (v14 && (unint64_t)[v14 count] > a4)
  {
    int v16 = [v15 objectAtIndexedSubscript:a4];
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

+ (id)_cellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v9 collectionView];
    if (!v10) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v11 = [v9 view];
    id v10 = [a1 _findCollectionViewInView:v11];

    if (!v10)
    {
LABEL_16:
      long long v18 = 0;
      goto LABEL_21;
    }
  }
  id v12 = [v10 visibleCells];
  id v26 = [v10 numberOfSections];
  if (!v26) {
    goto LABEL_16;
  }
  unsigned __int8 v24 = a5;
  id v25 = v9;
  uint64_t v13 = 0;
  while (1)
  {
    id v14 = [v10 numberOfItemsInSection:v13];
    if (v14) {
      break;
    }
LABEL_14:
    if ((id)++v13 == v26)
    {
      long long v18 = 0;
      goto LABEL_20;
    }
  }
  id v15 = v14;
  uint64_t v16 = 0;
  while (1)
  {
    id v17 = +[NSIndexPath indexPathForItem:v16 inSection:v13];
    long long v18 = [v10 cellForItemAtIndexPath:v17];

    if (v18) {
      break;
    }
LABEL_13:

    if (v15 == (id)++v16) {
      goto LABEL_14;
    }
  }
  long long v19 = [a1 _findLabelInView:v18];
  if ([v8 length])
  {
    [v19 text];
    v21 = id v20 = a1;
    unsigned int v22 = [v21 isEqualToString:v8];

    if (!v22)
    {
      a1 = v20;

      goto LABEL_13;
    }
  }
  if (v24) {
    id *v24 = v10;
  }

LABEL_20:
  id v9 = v25;
LABEL_21:

  return v18;
}

+ (id)_findCollectionViewInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _findViewOfType:objc_opt_class() inView:v4 withFilter:0];

  objc_opt_class();
  id v6 = 0;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }

  return v6;
}

+ (id)_findLabelInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _findViewOfType:objc_opt_class() inView:v4 withFilter:0];

  objc_opt_class();
  id v6 = 0;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }

  return v6;
}

+ (id)_findLabelWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A980;
  v13[3] = &unk_100018DE8;
  id v9 = v6;
  id v14 = v9;
  id v10 = [a1 _findViewOfType:v8 inView:v7 withFilter:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5
{
  id v8 = a4;
  id v9 = (uint64_t (**)(id, id))a5;
  if (v8)
  {
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      goto LABEL_19;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = [v8 subviews];
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          id v10 = [a1 _findViewOfType:a3 inView:*(void *)(*((void *)&v18 + 1) + 8 * i) withFilter:v9];
          char v16 = 1;
          if (v9 && v10) {
            char v16 = v9[2](v9, v10);
          }
          if (v10 && (v16 & 1) != 0)
          {

            goto LABEL_19;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  id v10 = 0;
LABEL_19:

  return v10;
}

+ (id)_findScrollViewInViewController:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v4 performSelector:"collectionView" withObject:0],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v4 performSelector:"tableView" withObject:0],
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v6 = [v4 view];
      uint64_t v5 = [a1 findScrollViewInView:v6 desiredScrollViewClass:0];
    }
  }

  return v5;
}

+ (id)_findShelfViewControllerInViewController:(id)a3 withTitle:(id)a4
{
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [a3 childViewControllers];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 view];
        uint64_t v14 = [a1 _findLabelWithTitle:v6 inView:v13];

        if (v14)
        {
          id v15 = v12;

          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

+ (id)_findShelfViewControllerInViewController:(id)a3 withShelfRow:(unint64_t)a4
{
  uint64_t v5 = [a3 childViewControllers];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

+ (BOOL)_selectButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _findTVButtonWithTitle:v6 inView:v7];
  if (v8
    || ([a1 _findUIButtonWithTitle:v6 inView:v7],
        (id v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([a1 _findVUIRoundButtonWithTitle:v6 inView:v7],
        (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AF5C;
    block[3] = &unk_100018B98;
    id v13 = v8;
    id v9 = v8;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)_findVUIRoundButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B148;
  v20[3] = &unk_100018E10;
  Class v22 = NSClassFromString(@"VUIRoundButton");
  id v8 = v6;
  id v21 = v8;
  id v9 = [a1 _findViewOfType:v22 inView:v7 withFilter:v20];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v10 = [v9 subviews];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

+ (id)_findTVButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Class v8 = NSClassFromString(@"TVButton");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B37C;
  v12[3] = &unk_100018DE8;
  id v13 = v6;
  id v9 = v6;
  BOOL v10 = [a1 _findViewOfType:v8 inView:v7 withFilter:v12];

  return v10;
}

+ (id)_findUIButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B53C;
  v12[3] = &unk_100018DE8;
  id v13 = v6;
  id v9 = v6;
  BOOL v10 = [a1 _findViewOfType:v8 inView:v7 withFilter:v12];

  return v10;
}

+ (id)_topViewControllerInTabBarController:(id)a3
{
  v3 = [a3 selectedViewController];
  id v4 = [v3 topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 templateViewController];

    id v4 = (void *)v5;
  }

  return v4;
}

+ (id)topMostController
{
  id v2 = +[UIWindow keyWindow];
  v3 = [v2 rootViewController];

  id v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      uint64_t v5 = [v3 presentedViewController];

      id v6 = [v5 presentedViewController];

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    uint64_t v5 = v3;
  }

  return v5;
}

@end