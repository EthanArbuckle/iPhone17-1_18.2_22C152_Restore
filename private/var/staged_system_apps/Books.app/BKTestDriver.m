@interface BKTestDriver
+ (BOOL)createPath:(id)a3 errorLabel:(id)a4;
+ (id)shared;
+ (void)prewarm;
- (BKBookReader)machine;
- (BKBookViewController)bookController;
- (BKTestDriver)init;
- (BKTestDriverEventDispatcher)eventDispatcher;
- (BOOL)bookDidAppear;
- (BOOL)createFile:(id)a3 content:(id)a4 errorLabel:(id)a5;
- (BOOL)createJsonFile:(id)a3 content:(id)a4 errorLabel:(id)a5;
- (BOOL)hasPendingBook;
- (BOOL)isInLibrary;
- (BOOL)isLooping;
- (BOOL)loop;
- (BOOL)paginationDidEnd;
- (BOOL)paginationEnded;
- (NSArray)bookList;
- (NSMutableDictionary)bookMap;
- (NSString)booksTestRoot;
- (OS_dispatch_queue)queue;
- (UIViewController)libraryController;
- (id)createBookDirectory:(id)a3;
- (id)createResultsJsonFile;
- (id)getBookInfo:(id)a3 errorLabel:(id)a4;
- (id)getJsonFrom:(id)a3 errorLabel:(id)a4;
- (id)getValueForKey:(id)a3 from:(id)a4 errorLabel:(id)a5;
- (int)idSeq;
- (int64_t)currentBook;
- (int64_t)firstPage;
- (void)bookViewDidAppear:(id)a3;
- (void)bookViewWillDisappear:(id)a3;
- (void)clear;
- (void)deleteFile:(id)a3;
- (void)dispatchInQueue:(id)a3 async:(id)a4;
- (void)goToFirstPage;
- (void)goToLibrary;
- (void)goToNextPage;
- (void)libraryViewDidAppear:(id)a3;
- (void)libraryViewWillDisappear:(id)a3;
- (void)openNextBook;
- (void)paginationControllerFinishedBookPagination:(id)a3;
- (void)paginationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5;
- (void)presentationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5;
- (void)processPageTurnResult:(BOOL)a3;
- (void)recordPaginationInfo:(id)a3 info:(id)a4 renderTree:(id)a5 pageCount:(unint64_t)a6 errorLabel:(id)a7;
- (void)setBookController:(id)a3;
- (void)setBookList:(id)a3;
- (void)setBookMap:(id)a3;
- (void)setBooksTestRoot:(id)a3;
- (void)setCurrentBook:(int64_t)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setFirstPage:(int64_t)a3;
- (void)setIdSeq:(int)a3;
- (void)setLibraryController:(id)a3;
- (void)setLibraryViewController:(id)a3;
- (void)setLoop:(BOOL)a3;
- (void)setMachine:(id)a3;
- (void)setPaginationEnded:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)takeSnapshot;
- (void)terminateBookTest;
- (void)terminateTest;
@end

@implementation BKTestDriver

+ (void)prewarm
{
  if (qword_100B4A630 != -1) {
    dispatch_once(&qword_100B4A630, &stru_100A4B3C0);
  }
}

+ (id)shared
{
  return (id)qword_100B4A628;
}

- (void)setEventDispatcher:(id)a3
{
}

- (BKTestDriver)init
{
  v29.receiver = self;
  v29.super_class = (Class)BKTestDriver;
  v2 = [(BKTestDriver *)&v29 init];
  v3 = v2;
  if (v2)
  {
    v2->_idSeq = 0;
    v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 BOOLForKey:@"BKTestEPubLayout"];

    v6 = +[NSUserDefaults standardUserDefaults];
    unsigned int v7 = [v6 BOOLForKey:@"BKTestEPubPowerConsumption"];

    v8 = +[NSUserDefaults standardUserDefaults];
    v3->_loop = [v8 BOOLForKey:@"BKTestEPubLoopFirstBook"];

    v9 = +[NSUserDefaults standardUserDefaults];
    v3->_firstPage = (int64_t)[v9 integerForKey:@"BKTestEPubFirstPage"];

    if (v3->_firstPage <= 0) {
      v3->_firstPage = 1;
    }
    [(BKTestDriver *)v3 clear];
    if ((v5 | v7) == 1)
    {
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.iBooks.TestDriver", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v10;

      uint64_t v12 = +[NSMutableDictionary dictionary];
      bookMap = v3->_bookMap;
      v3->_bookMap = (NSMutableDictionary *)v12;

      v14 = +[NSURL bu_booksRepositoryURL];
      v15 = [v14 URLByAppendingPathComponent:@"Tests"];
      v16 = [v15 path];

      uint64_t v17 = [v16 stringByAppendingPathComponent:@"Books"];
      booksTestRoot = v3->_booksTestRoot;
      v3->_booksTestRoot = (NSString *)v17;

      v19 = [[BKBookReader alloc] initWithDelegate:v3];
      machine = v3->_machine;
      v3->_machine = v19;

      v21 = +[AETestDriver shared];
      [v21 setDelegate:v3];
    }
    else
    {
      v22 = v3->_queue;
      v3->_queue = 0;

      v23 = v3->_bookMap;
      v3->_bookMap = 0;

      v24 = v3->_booksTestRoot;
      v3->_booksTestRoot = 0;

      v16 = v3->_machine;
      v3->_machine = 0;
    }

    if (v5)
    {
      v25 = +[AETestDriver shared];
      [v25 setLayoutDelegate:v3];
    }
    v26 = [(BKTestDriver *)v3 machine];

    if (v26)
    {
      v27 = [(BKTestDriver *)v3 machine];
      [v27 start];
    }
  }
  return v3;
}

- (void)clear
{
  [(BKTestDriver *)self setCurrentBook:-1];
  [(BKTestDriver *)self setBookList:0];
  [(BKTestDriver *)self setLibraryController:0];
  [(BKTestDriver *)self setBookController:0];

  [(BKTestDriver *)self setPaginationEnded:0];
}

+ (BOOL)createPath:(id)a3 errorLabel:(id)a4
{
  id v4 = a3;
  unsigned int v5 = +[NSFileManager defaultManager];
  uint64_t v8 = 0;
  unsigned __int8 v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v8];

  return v6;
}

- (BOOL)createFile:(id)a3 content:(id)a4 errorLabel:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(BKTestDriver *)self booksTestRoot];
  dispatch_queue_t v10 = +[NSString stringWithFormat:@"%@/%@", v9, v8];

  v11 = [v10 stringByDeletingLastPathComponent];
  uint64_t v12 = +[NSFileManager defaultManager];
  uint64_t v15 = 0;
  LODWORD(v8) = [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v15];

  if (v8) {
    unsigned __int8 v13 = [v7 writeToFile:v10 atomically:1];
  }
  else {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)deleteFile:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKTestDriver *)self booksTestRoot];
  unsigned __int8 v6 = +[NSString stringWithFormat:@"%@/%@", v5, v4];

  id v7 = +[NSFileManager defaultManager];
  uint64_t v8 = 0;
  [v7 removeItemAtPath:v6 error:&v8];
}

- (id)getJsonFrom:(id)a3 errorLabel:(id)a4
{
  uint64_t v6 = 0;
  id v4 = +[NSJSONSerialization dataWithJSONObject:a3 options:1 error:&v6];

  return v4;
}

- (BOOL)createJsonFile:(id)a3 content:(id)a4 errorLabel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = [(BKTestDriver *)self getJsonFrom:a4 errorLabel:v9];
  if (v10) {
    BOOL v11 = [(BKTestDriver *)self createFile:v8 content:v10 errorLabel:v9];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)createBookDirectory:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKTestDriver *)self booksTestRoot];
  unsigned int v6 = +[BKTestDriver createPath:v5 errorLabel:v4];

  if (v6)
  {
    do
    {
      id v7 = [(BKTestDriver *)self booksTestRoot];
      uint64_t v8 = [(BKTestDriver *)self idSeq] + 1;
      [(BKTestDriver *)self setIdSeq:v8];
      id v9 = +[NSString stringWithFormat:@"%@/%d", v7, v8];

      dispatch_queue_t v10 = +[NSFileManager defaultManager];
      LODWORD(v8) = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:0 error:0];

      BOOL v11 = 0;
      if (v8)
      {
        BOOL v11 = +[NSString stringWithFormat:@"%d", [(BKTestDriver *)self idSeq]];
      }
    }
    while (!v11);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)getBookInfo:(id)a3 errorLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKTestDriver *)self bookMap];
  id v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    id v9 = +[NSMutableDictionary dictionary];
    dispatch_queue_t v10 = [(BKTestDriver *)self createBookDirectory:v7];
    [v9 setObject:v10 forKey:@"path"];
    v20 = +[NSString stringWithFormat:@"%@/info.json", v10];
    [v9 setObject:v20 forKey:@"info-path"];
    [(BKTestDriver *)self createJsonFile:v20 content:v6 errorLabel:v7];
    [v9 setObject:v6 forKey:@"info"];
    v19 = +[NSString stringWithFormat:@"%@/pages", v10];
    [v9 setObject:v19 forKey:@"pages-path"];
    BOOL v11 = +[NSString stringWithFormat:@"%@/pagination", v10];
    [v9 setObject:v11 forKey:@"pagination-path"];
    uint64_t v12 = +[NSString stringWithFormat:@"%@/result.json", v11];
    [v9 setObject:v12 forKey:@"pagination-result-path"];
    unsigned __int8 v13 = +[NSString stringWithFormat:@"%@/presentation", v10];
    [v9 setObject:v13 forKey:@"presentation-path"];
    v14 = +[NSMutableArray array];
    [v9 setObject:v14 forKey:@"pagination-items"];

    uint64_t v15 = +[NSMutableArray array];
    [v9 setObject:v15 forKey:@"presentation-items"];

    v16 = +[NSMutableArray array];
    [v9 setObject:v16 forKey:@"pages"];

    uint64_t v17 = [(BKTestDriver *)self bookMap];
    [v17 setObject:v9 forKey:v6];
  }

  return v9;
}

- (id)getValueForKey:(id)a3 from:(id)a4 errorLabel:(id)a5
{
  return [a4 valueForKeyPath:a3];
}

- (void)recordPaginationInfo:(id)a3 info:(id)a4 renderTree:(id)a5 pageCount:(unint64_t)a6 errorLabel:(id)a7
{
  id v41 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [(BKTestDriver *)self getValueForKey:@"fail" from:v13 errorLabel:v15];
  uint64_t v17 = v16;
  if (v16 && ([v16 BOOLValue] & 1) == 0)
  {
    v18 = [(BKTestDriver *)self getValueForKey:@"book" from:v13 errorLabel:v15];
    if (v18)
    {
      v40 = [(BKTestDriver *)self getValueForKey:@"job.documentOrdinal" from:v13 errorLabel:v15];
      if (v40)
      {
        v19 = [(BKTestDriver *)self getBookInfo:v18 errorLabel:v15];
        if (v19)
        {
          v20 = v19;
          v21 = +[NSString stringWithFormat:@"%@-path", v41];
          id v39 = v20;
          v22 = [(BKTestDriver *)self getValueForKey:v21 from:v20 errorLabel:v15];

          v23 = +[NSString stringWithFormat:@"%@/result.json", v22];
          if (v23)
          {
            v37 = v23;
            [(BKTestDriver *)self deleteFile:v23];
            v38 = v22;
            uint64_t v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/rt_%d.txt", v22, [v40 intValue]);
            v25 = [v14 dataUsingEncoding:4];
            v26 = NSStringFromSelector(a2);
            unsigned int v27 = [(BKTestDriver *)self createFile:v24 content:v25 errorLabel:v26];

            if (v27)
            {
              uint64_t v28 = +[NSString stringWithFormat:@"%@-items", v41];

              v36 = (void *)v28;
              id v42 = [v39 objectForKey:v28];
              if ((int)[v42 count] >= 1
                && ([v42 lastObject],
                    objc_super v29 = objc_claimAutoreleasedReturnValue(),
                    [v29 objectForKeyedSubscript:@"path"],
                    v30 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v31 = [v30 isEqualToString:v24],
                    v30,
                    v29,
                    v31))
              {
                v32 = (void *)v24;
                v33 = +[NSNumber numberWithUnsignedLong:a6];
                v34 = [v42 lastObject];
                [v34 setObject:v33 forKeyedSubscript:@"page-count"];
              }
              else
              {
                v33 = +[NSMutableDictionary dictionary];
                v32 = (void *)v24;
                [v33 setObject:v24 forKeyedSubscript:@"path"];
                v35 = +[NSNumber numberWithUnsignedLong:a6];
                [v33 setObject:v35 forKeyedSubscript:@"page-count"];

                [v42 addObject:v33];
              }
              v23 = v37;
              v22 = v38;

              id v41 = v36;
            }
            else
            {
              v32 = (void *)v24;
              v23 = v37;
              v22 = v38;
            }
          }
          v19 = v39;
        }
      }
    }
  }
}

- (void)presentationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = [(BKTestDriver *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001F24FC;
  v14[3] = &unk_100A4B3E8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  unint64_t v17 = a5;
  SEL v18 = a2;
  id v12 = v10;
  id v13 = v9;
  [(BKTestDriver *)self dispatchInQueue:v11 async:v14];
}

- (void)paginationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = [(BKTestDriver *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001F2664;
  v14[3] = &unk_100A4B3E8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  unint64_t v17 = a5;
  SEL v18 = a2;
  id v12 = v10;
  id v13 = v9;
  [(BKTestDriver *)self dispatchInQueue:v11 async:v14];
}

- (void)paginationControllerFinishedBookPagination:(id)a3
{
  id v5 = a3;
  id v6 = [(BKTestDriver *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F279C;
  v8[3] = &unk_100A45688;
  v8[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [(BKTestDriver *)self dispatchInQueue:v6 async:v8];
}

- (void)bookViewDidAppear:(id)a3
{
  id v4 = a3;
  id v5 = [(BKTestDriver *)self queue];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  SEL v10 = sub_1001F29E4;
  BOOL v11 = &unk_100A43DD8;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  [(BKTestDriver *)self dispatchInQueue:v5 async:&v8];

  id v7 = [(BKTestDriver *)self machine];
  [v7 bookDidAppear];
}

- (void)bookViewWillDisappear:(id)a3
{
  id v4 = [(BKTestDriver *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001F2A7C;
  v5[3] = &unk_100A43D60;
  v5[4] = self;
  [(BKTestDriver *)self dispatchInQueue:v4 async:v5];
}

- (void)setLibraryViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKTestDriver *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F2B40;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BKTestDriver *)self dispatchInQueue:v5 async:v7];
}

- (void)libraryViewWillDisappear:(id)a3
{
  id v4 = [(BKTestDriver *)self machine];

  if (v4) {
    [(BKTestDriver *)self setLibraryViewController:0];
  }
  id v5 = [(BKTestDriver *)self eventDispatcher];

  if (v5)
  {
    id v6 = [(BKTestDriver *)self eventDispatcher];
    [v6 notifyLibraryController:0];
  }
}

- (void)libraryViewDidAppear:(id)a3
{
  id v8 = a3;
  id v4 = [(BKTestDriver *)self eventDispatcher];

  if (v4)
  {
    id v5 = [(BKTestDriver *)self eventDispatcher];
    [v5 notifyLibraryController:v8];
  }
  id v6 = [(BKTestDriver *)self machine];

  if (v6)
  {
    [(BKTestDriver *)self setLibraryViewController:v8];
    id v7 = [(BKTestDriver *)self machine];
    [v7 libraryDidAppear];
  }
}

- (void)dispatchInQueue:(id)a3 async:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F2E7C;
  block[3] = &unk_100A449F0;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)goToLibrary
{
}

- (void)openNextBook
{
  [(BKTestDriver *)self setCurrentBook:(char *)[(BKTestDriver *)self currentBook] + 1];
  [(BKTestDriver *)self setPaginationEnded:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001F3048;
  v3[3] = &unk_100A43D60;
  v3[4] = self;
  [(BKTestDriver *)self dispatchInQueue:&_dispatch_main_q async:v3];
}

- (void)processPageTurnResult:(BOOL)a3
{
  id v5 = [(BKTestDriver *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001F320C;
  v6[3] = &unk_100A44E60;
  BOOL v7 = a3;
  v6[4] = self;
  [(BKTestDriver *)self dispatchInQueue:v5 async:v6];
}

- (void)goToNextPage
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001F32DC;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  [(BKTestDriver *)self dispatchInQueue:&_dispatch_main_q async:v2];
}

- (void)goToFirstPage
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001F33E0;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  [(BKTestDriver *)self dispatchInQueue:&_dispatch_main_q async:v2];
}

- (void)takeSnapshot
{
  id v4 = +[AETestDriver shared];
  unsigned int v5 = [v4 testingLayout];

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001F35A0;
    v6[3] = &unk_100A45768;
    v6[4] = self;
    void v6[5] = a2;
    [(BKTestDriver *)self dispatchInQueue:&_dispatch_main_q async:v6];
  }
}

- (id)createResultsJsonFile
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableArray array];
  unsigned int v5 = [(BKTestDriver *)self bookMap];
  id v6 = [v5 allValues];

  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];
      [v4 addObject:v8];

      ++v7;
    }
    while ((unint64_t)[v6 count] > v7);
  }
  [v3 setObject:v4 forKey:@"info"];

  return v3;
}

- (void)terminateBookTest
{
  id v4 = [(BKTestDriver *)self bookController];

  if (v4)
  {
    unsigned int v5 = [(BKTestDriver *)self bookController];
    id v13 = +[AETestDriver getBookKeyWithBookController:v5];

    id v6 = v13;
    if (v13)
    {
      unint64_t v7 = NSStringFromSelector(a2);
      id v8 = [(BKTestDriver *)self getBookInfo:v13 errorLabel:v7];

      if (v8)
      {
        uint64_t v9 = NSStringFromSelector(a2);
        id v10 = [(BKTestDriver *)self getValueForKey:@"path" from:v8 errorLabel:v9];

        if (v10)
        {
          id v11 = +[NSString stringWithFormat:@"%@/read-info.json", v10];
          id v12 = NSStringFromSelector(a2);
          [(BKTestDriver *)self createJsonFile:v11 content:v8 errorLabel:v12];
        }
      }

      id v6 = v13;
    }
  }
}

- (void)terminateTest
{
  id v4 = [(BKTestDriver *)self createResultsJsonFile];
  unsigned int v5 = NSStringFromSelector(a2);
  [(BKTestDriver *)self createJsonFile:@"result.json" content:v4 errorLabel:v5];

  [(BKTestDriver *)self clear];
}

- (BOOL)isInLibrary
{
  v2 = [(BKTestDriver *)self libraryController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPendingBook
{
  bookList = self->_bookList;
  if (bookList)
  {
    int64_t currentBook = self->_currentBook;
    LOBYTE(bookList) = currentBook < (int)([(NSArray *)bookList count] - 1);
  }
  return (char)bookList;
}

- (BOOL)paginationDidEnd
{
  BOOL v3 = +[AETestDriver shared];
  if ([v3 testingLayout]) {
    BOOL v4 = [(BKTestDriver *)self paginationEnded];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)bookDidAppear
{
  v2 = [(BKTestDriver *)self bookController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isLooping
{
  return [(BKTestDriver *)self loop];
}

- (NSMutableDictionary)bookMap
{
  return self->_bookMap;
}

- (void)setBookMap:(id)a3
{
}

- (NSString)booksTestRoot
{
  return self->_booksTestRoot;
}

- (void)setBooksTestRoot:(id)a3
{
}

- (BKBookReader)machine
{
  return self->_machine;
}

- (void)setMachine:(id)a3
{
}

- (UIViewController)libraryController
{
  return self->_libraryController;
}

- (void)setLibraryController:(id)a3
{
}

- (BKBookViewController)bookController
{
  return self->_bookController;
}

- (void)setBookController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)bookList
{
  return self->_bookList;
}

- (void)setBookList:(id)a3
{
}

- (int)idSeq
{
  return self->_idSeq;
}

- (void)setIdSeq:(int)a3
{
  self->_idSeq = a3;
}

- (int64_t)currentBook
{
  return self->_currentBook;
}

- (void)setCurrentBook:(int64_t)a3
{
  self->_int64_t currentBook = a3;
}

- (BOOL)paginationEnded
{
  return self->_paginationEnded;
}

- (void)setPaginationEnded:(BOOL)a3
{
  self->_paginationEnded = a3;
}

- (BOOL)loop
{
  return self->_loop;
}

- (void)setLoop:(BOOL)a3
{
  self->_loop = a3;
}

- (int64_t)firstPage
{
  return self->_firstPage;
}

- (void)setFirstPage:(int64_t)a3
{
  self->_firstPage = a3;
}

- (BKTestDriverEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_bookList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bookController, 0);
  objc_storeStrong((id *)&self->_libraryController, 0);
  objc_storeStrong((id *)&self->_machine, 0);
  objc_storeStrong((id *)&self->_booksTestRoot, 0);

  objc_storeStrong((id *)&self->_bookMap, 0);
}

@end