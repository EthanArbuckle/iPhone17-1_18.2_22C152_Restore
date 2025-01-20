@interface NotificationListener
- (NotificationListener)initWithCallback:(id)a3 onQueue:(id)a4;
- (OS_dispatch_queue)q;
- (id)cb;
- (void)notify;
- (void)setCb:(id)a3;
- (void)setQ:(id)a3;
@end

@implementation NotificationListener

- (NotificationListener)initWithCallback:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NotificationListener;
  v8 = [(NotificationListener *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(NotificationListener *)v8 setQ:v7];
    [(NotificationListener *)v9 setCb:v6];
    v10 = v9;
  }

  return v9;
}

- (void)notify
{
  queue = [(NotificationListener *)self q];
  v3 = [(NotificationListener *)self cb];
  dispatch_async(queue, v3);
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
}

- (id)cb
{
  return self->_cb;
}

- (void)setCb:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cb, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end