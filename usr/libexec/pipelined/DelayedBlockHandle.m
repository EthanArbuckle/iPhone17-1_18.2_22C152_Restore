@interface DelayedBlockHandle
+ (id)dispatch_after:(duration<long)long block:()std:(1000000000>>)a3 :(id)a4 ratio<1;
+ (id)dispatch_after:(duration<long)long block:()std:(1000000000>>)a3 :(id)a4 ratio<1 onQueue:(id)a5;
- (BOOL)cancelled;
- (id)init:(id)a3;
- (void)setCancelled:(BOOL)a3;
@end

@implementation DelayedBlockHandle

+ (id)dispatch_after:(duration<long)long block:()std:(1000000000>>)a3 :(id)a4 ratio<1
{
  v4 = [a1 dispatch_after:a3.__rep_ block:a4 onQueue:_dispatch_main_q];

  return v4;
}

+ (id)dispatch_after:(duration<long)long block:()std:(1000000000>>)a3 :(id)a4 ratio<1 onQueue:(id)a5
{
  id v7 = a4;
  v8 = a5;
  id v9 = [[DelayedBlockHandle alloc] init:v7];
  dispatch_time_t v10 = dispatch_time(0, a3.__rep_);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028B600;
  block[3] = &unk_1004527B8;
  id v11 = v9;
  id v14 = v11;
  dispatch_after(v10, v8, block);

  return v11;
}

- (id)init:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DelayedBlockHandle;
  v5 = [(DelayedBlockHandle *)&v10 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id cb = v5->_cb;
    v5->_id cb = v6;

    v8 = v5;
  }

  return v5;
}

- (void)setCancelled:(BOOL)a3
{
  if (a3)
  {
    id cb = self->_cb;
    self->_id cb = 0;
  }
}

- (BOOL)cancelled
{
  return self->_cb == 0;
}

- (void).cxx_destruct
{
}

@end