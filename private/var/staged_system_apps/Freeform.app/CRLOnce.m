@interface CRLOnce
- (CRLOnce)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)performBlockOnce:(id)a3;
@end

@implementation CRLOnce

- (CRLOnce)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLOnce;
  v2 = [(CRLOnce *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.freeform.CRLOnce", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CRLOnce);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D5D1C;
  v9[3] = &unk_1014CBE78;
  objc_super v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(queue, v9);
  v7 = v6;

  return v7;
}

- (void)performBlockOnce:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D5DC4;
  v7[3] = &unk_1014D0AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void).cxx_destruct
{
}

@end