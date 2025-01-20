@interface AutocompleteContext
- (AutocompleteContext)init;
- (AutocompleteContext)initWithQueryString:(id)a3;
- (AutocompleteContextDelegate)delegate;
- (AutocompleteQueryString)query;
- (BOOL)isCJK;
- (NSString)queryString;
- (id)matchInfoForObject:(id)a3;
- (void)autocompleteMatchInfoDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMatchInfo:(id)a3 forObject:(id)a4;
@end

@implementation AutocompleteContext

- (AutocompleteContext)init
{
  return 0;
}

- (AutocompleteContext)initWithQueryString:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AutocompleteContext;
  v6 = [(AutocompleteContext *)&v17 init];
  if (v6)
  {
    id v7 = +[NSString stringWithFormat:@"%@ %p", objc_opt_class(), v6];
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[NSMapTable strongToStrongObjectsMapTable];
    matchInfos = v6->_matchInfos;
    v6->_matchInfos = (NSMapTable *)v12;

    objc_storeStrong((id *)&v6->_queryString, a3);
    v14 = [[AutocompleteQueryString alloc] initWithQuery:v5];
    query = v6->_query;
    v6->_query = v14;

    v6->_isCJK = [v5 _navigation_isCJK];
  }

  return v6;
}

- (id)matchInfoForObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100103F78;
  objc_super v17 = sub_100104848;
  id v18 = 0;
  if (v4)
  {
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007C20A8;
    block[3] = &unk_1012ECFC0;
    uint64_t v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(lock, block);

    id v7 = (void *)v14[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setMatchInfo:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007C21C4;
    block[3] = &unk_1012E66E0;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_sync(lock, block);
  }
}

- (void)autocompleteMatchInfoDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(AutocompleteContext *)self delegate];
  [v5 autocompleteContext:self didUpdateMatchInfo:v4];
}

- (NSString)queryString
{
  return self->_queryString;
}

- (AutocompleteQueryString)query
{
  return self->_query;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (AutocompleteContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AutocompleteContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_matchInfos, 0);
}

@end