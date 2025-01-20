@interface BCLazyValue
+ (id)objectAsyncProducer:(id)a3;
+ (id)objectSyncProducer:(id)a3;
- (BCLazyValue)init;
- (id)asyncProducer;
- (id)syncProducer;
- (id)value;
- (void)setAsyncProducer:(id)a3;
- (void)setSyncProducer:(id)a3;
@end

@implementation BCLazyValue

- (BCLazyValue)init
{
  v3.receiver = self;
  v3.super_class = (Class)BCLazyValue;
  result = [(BCLazyValue *)&v3 init];
  if (result)
  {
    result->_onceToken = 0;
    result->_flags = 0;
  }
  __dmb(0xBu);
  return result;
}

+ (id)objectSyncProducer:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(BCLazyValue);
    [(BCLazyValue *)v4 setSyncProducer:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objectAsyncProducer:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(BCLazyValue);
    [(BCLazyValue *)v4 setAsyncProducer:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)value
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1676D4;
  v22 = sub_1676E4;
  id v23 = 0;
  int64_t onceToken = self->_onceToken;
  p_int64_t onceToken = &self->_onceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1676EC;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (onceToken != -1) {
    dispatch_once(p_onceToken, block);
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_167738;
  v15 = sub_167764;
  id v16 = 0;
  sync = self->_sync;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_16776C;
  v10[3] = &unk_2C75A8;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v11;
  dispatch_sync(sync, v10);
  id v6 = objc_retainBlock((id)v12[5]);
  v7 = v6;
  if (v6) {
    (*((void (**)(id))v6 + 2))(v6);
  }

  id v8 = (id)v19[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)syncProducer
{
  return self->_syncProducer;
}

- (void)setSyncProducer:(id)a3
{
}

- (id)asyncProducer
{
  return self->_asyncProducer;
}

- (void)setAsyncProducer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_asyncProducer, 0);
  objc_storeStrong(&self->_syncProducer, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_sync, 0);
}

@end