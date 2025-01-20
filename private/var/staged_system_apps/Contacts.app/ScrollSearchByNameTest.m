@interface ScrollSearchByNameTest
- (BOOL)animate;
- (BOOL)prepareForTestWithOptions:(id)a3;
- (NSMutableDictionary)extraResults;
- (NSString)queryString;
- (double)lastSearchBeginTime;
- (unint64_t)currentDirectoryIndex;
- (unint64_t)currentQueryIndex;
- (void)setAnimate:(BOOL)a3;
- (void)setCurrentDirectoryIndex:(unint64_t)a3;
- (void)setCurrentQueryIndex:(unint64_t)a3;
- (void)setExtraResults:(id)a3;
- (void)setLastSearchBeginTime:(double)a3;
- (void)setQueryString:(id)a3;
- (void)startSearchQueryWithOptions:(id)a3;
@end

@implementation ScrollSearchByNameTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ScrollSearchByNameTest;
  BOOL v5 = [(ContactsTest *)&v16 prepareForTestWithOptions:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"animate"];
    -[ScrollSearchByNameTest setAnimate:](self, "setAnimate:", [v6 BOOLValue]);

    v7 = [v4 objectForKey:@"searchQuery"];
    [(ScrollSearchByNameTest *)self setQueryString:v7];

    [(ScrollSearchByNameTest *)self setCurrentQueryIndex:0];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10000DE5C;
    v13 = &unk_10001C538;
    v14 = self;
    id v15 = v4;
    v8 = objc_retainBlock(&v10);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v8, v10, v11, v12, v13, v14);
  }
  return v5;
}

- (void)startSearchQueryWithOptions:(id)a3
{
  id v4 = [(ContactsTest *)self contactNavigationController];
  BOOL v5 = [v4 contactListViewController];
  v6 = [(ScrollSearchByNameTest *)self queryString];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DF30;
  v7[3] = &unk_10001C488;
  v7[4] = self;
  [v5 searchForString:v6 animated:[self animate] completionBlock:v7];
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

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
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
  objc_storeStrong((id *)&self->_queryString, 0);

  objc_storeStrong((id *)&self->_extraResults, 0);
}

@end