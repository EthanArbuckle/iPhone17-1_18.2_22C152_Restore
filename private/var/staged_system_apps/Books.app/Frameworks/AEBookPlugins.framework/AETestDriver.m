@interface AETestDriver
+ (id)getBookControllerLayout:(id)a3;
+ (id)getBookKeyWithBook:(id)a3 style:(id)a4 geometry:(id)a5;
+ (id)getBookKeyWithBookController:(id)a3;
+ (id)getContentViewChildren:(id)a3;
+ (id)getSnapshotsWithBookController:(id)a3;
+ (id)getViewSnapshot:(id)a3 parent:(id)a4;
+ (id)shared;
+ (void)getWebViews:(id)a3 result:(id)a4;
- (AELayoutTestDelegate)layoutDelegate;
- (AETestDriver)init;
- (AETestDriverDelegate)delegate;
- (AETestDriverEventDispatcher)eventDispatcher;
- (BOOL)reading;
- (BOOL)testingLayout;
- (void)bookViewDidAppear:(id)a3;
- (void)bookViewWillDisappear:(id)a3;
- (void)paginationControllerFinishedBookPagination:(id)a3;
- (void)paginationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5;
- (void)postEvent:(id)a3 sender:(id)a4;
- (void)presentationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation AETestDriver

+ (id)shared
{
  if (qword_22B7D0 != -1) {
    dispatch_once(&qword_22B7D0, &stru_1DDCE8);
  }
  v2 = (void *)qword_22B7C8;

  return v2;
}

- (AETestDriver)init
{
  v7.receiver = self;
  v7.super_class = (Class)AETestDriver;
  v2 = [(AETestDriver *)&v7 init];
  v3 = v2;
  if (v2)
  {
    delegate = v2->_delegate;
    v2->_delegate = 0;

    layoutDelegate = v3->_layoutDelegate;
    v3->_layoutDelegate = 0;
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setEventDispatcher:(id)a3
{
}

- (void)setLayoutDelegate:(id)a3
{
}

- (void)postEvent:(id)a3 sender:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_super v7 = [(AETestDriver *)self testStateProvider];
  unsigned int v8 = [v7 testIsRunning];

  if (v8)
  {
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:v10 object:v6];
  }
}

+ (id)getBookKeyWithBook:(id)a3 style:(id)a4 geometry:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[UIScreen mainScreen];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  v93[0] = @"style";
  v17 = &objc_release_x26_ptr;
  if (v10)
  {
    v91[0] = @"fontFamily";
    uint64_t v18 = [v10 fontFamily];
    BOOL v82 = v18 != 0;
    v74 = (void *)v18;
    if (v18)
    {
      CFStringRef v19 = [v10 fontFamily];
    }
    else
    {
      CFStringRef v19 = &stru_1DF0D8;
    }
    v53 = (__CFString *)v19;
    v92[0] = v19;
    v91[1] = @"lineHeight";
    [v10 lineHeight];
    v73 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v92[1] = v73;
    v91[2] = @"fontSize";
    [v10 fontSize];
    v72 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v92[2] = v72;
    v91[3] = @"autoHyphenate";
    v71 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 autoHyphenate]);
    v92[3] = v71;
    v91[4] = @"optimizeLegibility";
    v70 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 optimizeLegibility]);
    v92[4] = v70;
    v91[5] = @"justification";
    v69 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 justification]);
    v92[5] = v69;
    v20 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:6];
  }
  else
  {
    BOOL v82 = 0;
    v20 = &__NSDictionary0__struct;
  }
  v76 = v20;
  v94[0] = v20;
  v93[1] = @"geometry";
  if (v11)
  {
    v89[0] = @"webViewSize";
    a5 = @"width";
    v87[0] = @"width";
    [v11 layoutSize];
    v68 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v87[1] = @"height";
    v88[0] = v68;
    [v11 layoutSize];
    v67 = +[NSNumber numberWithDouble:v21];
    v88[1] = v67;
    v66 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
    v90[0] = v66;
    v89[1] = @"windowSize";
    v85[0] = @"width";
    v65 = +[NSNumber numberWithDouble:v14];
    v85[1] = @"height";
    v86[0] = v65;
    v64 = +[NSNumber numberWithDouble:v16];
    v86[1] = v64;
    v63 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
    v90[1] = v63;
    v89[2] = @"isLandscape";
    [v11 layoutSize];
    double v23 = v22;
    [v11 layoutSize];
    v62 = +[NSNumber numberWithInt:v23 > v24];
    v90[2] = v62;
    v89[3] = @"hasSpreadPages";
    v61 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 hasSpreadPages]);
    v90[3] = v61;
    v89[4] = @"gutterWidth";
    [v11 gutterWidth];
    v60 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[4] = v60;
    v25 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:5];
  }
  else
  {
    v25 = &__NSDictionary0__struct;
  }
  v75 = v25;
  v94[1] = v25;
  v93[2] = @"info";
  if (v9)
  {
    v83[0] = @"bookEpubId";
    uint64_t v26 = [v9 bookEpubId];
    BOOL v81 = v26 != 0;
    v59 = (void *)v26;
    if (v26)
    {
      CFStringRef v27 = [v9 bookEpubId];
    }
    else
    {
      CFStringRef v27 = &stru_1DF0D8;
    }
    v52 = (__CFString *)v27;
    v84[0] = v27;
    v83[1] = @"bookAuthor";
    uint64_t v31 = [v9 bookAuthor];
    HIDWORD(v80) = v31 != 0;
    v58 = (void *)v31;
    if (v31)
    {
      CFStringRef v32 = [v9 bookAuthor];
    }
    else
    {
      CFStringRef v32 = &stru_1DF0D8;
    }
    v51 = (__CFString *)v32;
    v84[1] = v32;
    v83[2] = @"bookTitle";
    uint64_t v33 = [v9 bookTitle];
    LODWORD(v80) = v33 != 0;
    v57 = (void *)v33;
    if (v33)
    {
      CFStringRef v34 = [v9 bookTitle];
    }
    else
    {
      CFStringRef v34 = &stru_1DF0D8;
    }
    v50 = (__CFString *)v34;
    v84[2] = v34;
    v83[3] = @"bookLanguage";
    uint64_t v35 = [v9 bookLanguage];
    HIDWORD(v79) = v35 != 0;
    v56 = (void *)v35;
    if (v35)
    {
      CFStringRef v36 = [v9 bookLanguage];
    }
    else
    {
      CFStringRef v36 = &stru_1DF0D8;
    }
    v49 = (__CFString *)v36;
    v84[3] = v36;
    v83[4] = @"shortBookTitle";
    uint64_t v37 = [v9 shortBookTitle];
    LODWORD(v79) = v37 != 0;
    v55 = (void *)v37;
    if (v37)
    {
      CFStringRef v38 = [v9 shortBookTitle];
    }
    else
    {
      CFStringRef v38 = &stru_1DF0D8;
    }
    v48 = (__CFString *)v38;
    v84[4] = v38;
    v83[5] = @"publisherName";
    uint64_t v39 = [v9 publisherName];
    HIDWORD(v78) = v39 != 0;
    v54 = (void *)v39;
    if (v39)
    {
      CFStringRef v40 = [v9 publisherName];
    }
    else
    {
      CFStringRef v40 = &stru_1DF0D8;
    }
    v47 = (__CFString *)v40;
    v84[5] = v40;
    v83[6] = @"publisherLocation";
    v5 = [v9 publisherLocation];
    LODWORD(v78) = v5 != 0;
    if (v5)
    {
      CFStringRef v41 = [v9 publisherLocation];
    }
    else
    {
      CFStringRef v41 = &stru_1DF0D8;
    }
    v46 = (__CFString *)v41;
    v84[6] = v41;
    v83[7] = @"publisherYear";
    id v6 = [v9 publisherYear];
    BOOL v77 = v6 != 0;
    if (v6)
    {
      CFStringRef v42 = [v9 publisherYear];
    }
    else
    {
      CFStringRef v42 = &stru_1DF0D8;
    }
    v45 = (__CFString *)v42;
    v84[7] = v42;
    v83[8] = @"url";
    v17 = [v9 bookBundlePath];
    BOOL v29 = v17 != 0;
    v28 = v11;
    if (v17)
    {
      a5 = [v9 bookBundlePath];
    }
    else
    {
      a5 = &stru_1DF0D8;
    }
    v84[8] = a5;
    v30 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:9];
  }
  else
  {
    v28 = v11;
    BOOL v81 = 0;
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v78 = 0;
    BOOL v77 = 0;
    BOOL v29 = 0;
    v30 = &__NSDictionary0__struct;
  }
  v94[2] = v30;
  v43 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
  if (v9) {

  }
  if (v29) {
  if (v9)
  }

  if (v77) {
  if (v9)
  }

  if (v78) {
  if (v9)
  }

  if (HIDWORD(v78)) {
  if (v9)
  }

  if (v79) {
  if (v9)
  }

  if (HIDWORD(v79)) {
  if (v9)
  }

  if (v80) {
  if (v9)
  }

  if (HIDWORD(v80)) {
  if (v9)
  }

  if (v81) {
  if (v9)
  }

  if (v28)
  {
  }
  if (v10)
  {
  }
  if (v82) {

  }
  if (v10) {

  }
  return v43;
}

+ (id)getBookKeyWithBookController:(id)a3
{
  return 0;
}

+ (id)getBookControllerLayout:(id)a3
{
  return 0;
}

+ (void)getWebViews:(id)a3 result:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 subviews];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v11];
        }
        else {
          +[AETestDriver getWebViews:v11 result:v5];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (id)getContentViewChildren:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  +[AETestDriver getWebViews:v3 result:v4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_F96EC;
  v7[3] = &unk_1DDD10;
  id v8 = v3;
  id v5 = v3;
  [v4 sortUsingComparator:v7];

  return v4;
}

+ (id)getViewSnapshot:(id)a3 parent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 bounds];
  v18.width = v7;
  v18.height = v8;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v10 = [v6 layer];
  [v10 renderInContext:CurrentContext];

  [v5 bounds];
  [v6 convertPoint:v5 fromView:];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  CGContextTranslateCTM(CurrentContext, v12, v14);
  long long v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

+ (id)getSnapshotsWithBookController:(id)a3
{
  return 0;
}

- (void)paginationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  layoutDelegate = self->_layoutDelegate;
  if (layoutDelegate) {
    [(AELayoutTestDelegate *)layoutDelegate paginationControllerFinishedWebkitRendering:a3 renderTree:a4 pageCount:a5];
  }
}

- (void)paginationControllerFinishedBookPagination:(id)a3
{
  layoutDelegate = self->_layoutDelegate;
  if (layoutDelegate) {
    [(AELayoutTestDelegate *)layoutDelegate paginationControllerFinishedBookPagination:a3];
  }
}

- (void)presentationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  layoutDelegate = self->_layoutDelegate;
  if (layoutDelegate) {
    [(AELayoutTestDelegate *)layoutDelegate presentationControllerFinishedWebkitRendering:a3 renderTree:a4 pageCount:a5];
  }
}

- (void)bookViewDidAppear:(id)a3
{
  id v6 = a3;
  if (self->_delegate)
  {
    objc_opt_class();
    v4 = BUDynamicCast();
    [(AETestDriverDelegate *)self->_delegate bookViewDidAppear:v4];
  }
  eventDispatcher = self->_eventDispatcher;
  if (eventDispatcher) {
    [(AETestDriverEventDispatcher *)eventDispatcher notifyBookController:v6];
  }
}

- (void)bookViewWillDisappear:(id)a3
{
  id v6 = a3;
  if (self->_delegate)
  {
    objc_opt_class();
    v4 = BUDynamicCast();
    [(AETestDriverDelegate *)self->_delegate bookViewWillDisappear:v4];
  }
  eventDispatcher = self->_eventDispatcher;
  if (eventDispatcher) {
    [(AETestDriverEventDispatcher *)eventDispatcher notifyBookController:0];
  }
}

- (BOOL)reading
{
  return self->_delegate != 0;
}

- (BOOL)testingLayout
{
  return self->_layoutDelegate != 0;
}

- (AETestDriverDelegate)delegate
{
  return self->_delegate;
}

- (AELayoutTestDelegate)layoutDelegate
{
  return self->_layoutDelegate;
}

- (AETestDriverEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_layoutDelegate, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end