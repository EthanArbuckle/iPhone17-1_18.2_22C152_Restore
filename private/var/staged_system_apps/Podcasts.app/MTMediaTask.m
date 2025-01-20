@interface MTMediaTask
- (AMSMediaTask)mediaTask;
- (BOOL)charts;
- (MTMediaTask)initWithType:(int64_t)a3;
- (NSArray)identifiers;
- (void)perform:(id)a3;
- (void)setCharts:(BOOL)a3;
- (void)setIdentifiers:(id)a3;
- (void)setMediaTask:(id)a3;
@end

@implementation MTMediaTask

- (MTMediaTask)initWithType:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MTMediaTask;
  v4 = [(MTMediaTask *)&v13 init];
  if (v4)
  {
    if (a3) {
      uint64_t v5 = 301;
    }
    else {
      uint64_t v5 = 300;
    }
    id v6 = objc_alloc((Class)AMSMediaTask);
    v7 = +[PFClientUtil mediaApiClientIdentifier];
    v8 = +[PFClientUtil mediaApiClientVersion];
    v9 = +[IMURLBag sharedInstance];
    v10 = (AMSMediaTask *)[v6 initWithType:v5 clientIdentifier:v7 clientVersion:v8 bag:v9];
    mediaTask = v4->_mediaTask;
    v4->_mediaTask = v10;

    if (a3) {
      [(AMSMediaTask *)v4->_mediaTask setIncludedResultKeys:&off_10057ADE0];
    }
  }
  return v4;
}

- (void)setIdentifiers:(id)a3
{
}

- (void)setCharts:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    mediaTask = self->_mediaTask;
    [(AMSMediaTask *)mediaTask setCharts:v3];
  }
}

- (NSArray)identifiers
{
  return (NSArray *)[(AMSMediaTask *)self->_mediaTask itemIdentifiers];
}

- (void)perform:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSMediaTask *)self->_mediaTask perform];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D3574;
  v7[3] = &unk_1005509D8;
  id v8 = v4;
  id v6 = v4;
  [v5 addFinishBlock:v7];
}

- (BOOL)charts
{
  return self->_charts;
}

- (AMSMediaTask)mediaTask
{
  return self->_mediaTask;
}

- (void)setMediaTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end