@interface RCEditingProgressItem
- (BOOL)hasMetTimeThreshold;
- (NSString)UUID;
- (RCEditingProgressDelegate)delegate;
- (RCEditingProgressItem)init;
- (float)progress;
- (void)setDelegate:(id)a3;
- (void)setHasMetTimeThreshold:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setUUID:(id)a3;
@end

@implementation RCEditingProgressItem

- (RCEditingProgressItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)RCEditingProgressItem;
  v2 = [(RCEditingProgressItem *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    dispatch_time_t v3 = dispatch_time(0, 350000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A31B8;
    v5[3] = &unk_1002214F8;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)hasMetTimeThreshold
{
  return self->_hasMetTimeThreshold;
}

- (void)setHasMetTimeThreshold:(BOOL)a3
{
  self->_hasMetTimeThreshold = a3;
}

- (RCEditingProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCEditingProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end