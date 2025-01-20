@interface SearchByNameTest
- (BOOL)animate;
- (BOOL)prepareForTestWithOptions:(id)a3;
- (NSArray)allSearchQueries;
- (NSMutableDictionary)extraResults;
- (double)lastSearchBeginTime;
- (unint64_t)currentDirectoryIndex;
- (unint64_t)currentQueryIndex;
- (void)setAllSearchQueries:(id)a3;
- (void)setAnimate:(BOOL)a3;
- (void)setCurrentDirectoryIndex:(unint64_t)a3;
- (void)setCurrentQueryIndex:(unint64_t)a3;
- (void)setExtraResults:(id)a3;
- (void)setLastSearchBeginTime:(double)a3;
- (void)startSearchQuery;
@end

@implementation SearchByNameTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SearchByNameTest;
  BOOL v5 = [(ContactsTest *)&v13 prepareForTestWithOptions:v4];
  if (v5)
  {
    v6 = +[NSMutableDictionary dictionary];
    [(SearchByNameTest *)self setExtraResults:v6];

    v7 = [v4 objectForKey:@"animate"];
    -[SearchByNameTest setAnimate:](self, "setAnimate:", [v7 BOOLValue]);

    v8 = [v4 objectForKey:@"searchQueries"];
    v9 = [v8 componentsSeparatedByString:@"%"];
    [(SearchByNameTest *)self setAllSearchQueries:v9];
    [(SearchByNameTest *)self setCurrentQueryIndex:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007614;
    v12[3] = &unk_10001C488;
    v12[4] = self;
    v10 = objc_retainBlock(v12);
    [(ContactsTest *)self showContactListWithCompletionBlock:v10];
  }
  return v5;
}

- (void)startSearchQuery
{
  v3 = [(SearchByNameTest *)self allSearchQueries];
  id v4 = [v3 objectAtIndex:[self currentQueryIndex]];

  [(SearchByNameTest *)self setLastSearchBeginTime:CFAbsoluteTimeGetCurrent()];
  kdebug_trace();
  BOOL v5 = [(ContactsTest *)self contactNavigationController];
  v6 = [v5 contactListViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007760;
  v7[3] = &unk_10001C488;
  v7[4] = self;
  [v6 searchForString:v4 animated:[self animate] completionBlock:v7];
}

- (NSMutableDictionary)extraResults
{
  return self->_extraResults;
}

- (void)setExtraResults:(id)a3
{
}

- (unint64_t)currentDirectoryIndex
{
  return self->_currentDirectoryIndex;
}

- (void)setCurrentDirectoryIndex:(unint64_t)a3
{
  self->_currentDirectoryIndex = a3;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (NSArray)allSearchQueries
{
  return self->_allSearchQueries;
}

- (void)setAllSearchQueries:(id)a3
{
}

- (unint64_t)currentQueryIndex
{
  return self->_currentQueryIndex;
}

- (void)setCurrentQueryIndex:(unint64_t)a3
{
  self->_currentQueryIndex = a3;
}

- (double)lastSearchBeginTime
{
  return self->_lastSearchBeginTime;
}

- (void)setLastSearchBeginTime:(double)a3
{
  self->_lastSearchBeginTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSearchQueries, 0);

  objc_storeStrong((id *)&self->_extraResults, 0);
}

@end