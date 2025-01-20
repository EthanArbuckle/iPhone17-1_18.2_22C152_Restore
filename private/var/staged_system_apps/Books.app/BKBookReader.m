@interface BKBookReader
- (BKBookReader)initWithDelegate:(id)a3;
- (float)getFloatDefault:(id)a3 default:(float)a4;
- (void)bookDidAppear;
- (void)decideAboutOpeningTheNextBook;
- (void)doneSleepingBeforeNextBook;
- (void)doneSleepingBeforePagination;
- (void)doneSleepingBeforeSnapshot;
- (void)firstPageRequested;
- (void)libraryDidAppear;
- (void)newPageIsReady;
- (void)pageTurnFailed;
- (void)paginationDidEnd;
- (void)sleepBeforeNextBook;
- (void)sleepBeforePagination;
- (void)sleepBeforeSnapshot;
- (void)start;
@end

@implementation BKBookReader

- (float)getFloatDefault:(id)a3 default:(float)a4
{
  id v5 = a3;
  v6 = +[NSUserDefaults standardUserDefaults];
  [v6 floatForKey:v5];
  float v8 = v7;

  if (v8 <= 0.0) {
    return a4;
  }
  else {
    return v8;
  }
}

- (BKBookReader)initWithDelegate:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKBookReader;
  v6 = [(BKBookReader *)&v15 init];
  float v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_state = 0;
    LODWORD(v8) = 2.0;
    [(BKBookReader *)v7 getFloatDefault:@"BKBookReaderSleepBeforePagination" default:v8];
    v7->_sleepBeforePagination = v9;
    LODWORD(v10) = 1.0;
    [(BKBookReader *)v7 getFloatDefault:@"BKBookReaderSleepBeforeNextBook" default:v10];
    v7->_sleepBeforeNextBook = v11;
    LODWORD(v12) = 0.5;
    [(BKBookReader *)v7 getFloatDefault:@"BKBookReaderSleepBeforeSnapshot" default:v12];
    v7->_sleepBeforeSnapshot = v13;
  }

  return v7;
}

- (void)doneSleepingBeforeNextBook
{
  if (self->_state == 1)
  {
    [(BKBookReaderDelegate *)self->_delegate openNextBook];
    unsigned int v3 = [(BKBookReaderDelegate *)self->_delegate paginationDidEnd];
    unsigned int v4 = [(BKBookReaderDelegate *)self->_delegate bookDidAppear];
    if (v3)
    {
      if (v4)
      {
        [(BKBookReaderDelegate *)self->_delegate goToFirstPage];
        int v5 = 9;
      }
      else
      {
        int v5 = 4;
      }
    }
    else if (v4)
    {
      int v5 = 5;
    }
    else
    {
      int v5 = 6;
    }
    self->_state = v5;
  }
}

- (void)sleepBeforeNextBook
{
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(float)(self->_sleepBeforeNextBook * 1000000000.0));
  unsigned int v4 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4E10;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)doneSleepingBeforeSnapshot
{
  if (self->_state == 2)
  {
    [(BKBookReaderDelegate *)self->_delegate takeSnapshot];
    [(BKBookReaderDelegate *)self->_delegate goToNextPage];
    self->_state = 7;
  }
}

- (void)sleepBeforeSnapshot
{
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(float)(self->_sleepBeforeSnapshot * 1000000000.0));
  unsigned int v4 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4F18;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)doneSleepingBeforePagination
{
  if (self->_state == 3)
  {
    [(BKBookReader *)self sleepBeforeSnapshot];
    self->_state = 2;
  }
}

- (void)sleepBeforePagination
{
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(float)(self->_sleepBeforePagination * 1000000000.0));
  unsigned int v4 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A5014;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)decideAboutOpeningTheNextBook
{
  if ([(BKBookReaderDelegate *)self->_delegate hasPendingBook])
  {
    [(BKBookReader *)self sleepBeforeNextBook];
    int v3 = 1;
  }
  else
  {
    [(BKBookReaderDelegate *)self->_delegate terminateTest];
    int v3 = 0;
  }
  self->_state = v3;
}

- (void)start
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A50F4;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)paginationDidEnd
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A51F0;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)libraryDidAppear
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A52D0;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)bookDidAppear
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A5374;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)newPageIsReady
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A5454;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)pageTurnFailed
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A5520;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)firstPageRequested
{
  int v3 = [(BKBookReaderDelegate *)self->_delegate queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A561C;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void).cxx_destruct
{
}

@end