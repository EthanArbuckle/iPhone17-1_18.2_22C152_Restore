@interface KeyValueStore
+ (id)defaultKeyValueStore;
+ (void)getValuesWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)removeAccountWithMessage:(id)a3 connection:(id)a4;
+ (void)removeAllValuesWithMessage:(id)a3 connection:(id)a4;
+ (void)removeValuesWithMessage:(id)a3 connection:(id)a4;
+ (void)setValuesWithMessage:(id)a3 connection:(id)a4;
- (KeyValueStore)init;
- (id)valueForDomain:(id)a3 key:(id)a4;
- (void)_getValuesWithMessage:(id)a3 connection:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
- (void)_removeAccountWithMessage:(id)a3 connection:(id)a4;
- (void)_removeAllValuesWithMessage:(id)a3 connection:(id)a4;
- (void)_removeValuesWithMessage:(id)a3 connection:(id)a4;
- (void)_setValuesWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
@end

@implementation KeyValueStore

- (KeyValueStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)KeyValueStore;
  v2 = [(KeyValueStore *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.KeyValueStore", 0);
    v2->_keyValueStore = (SSKeyValueStore *)objc_alloc_init((Class)SSKeyValueStore);
  }
  return v2;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)KeyValueStore;
  [(KeyValueStore *)&v4 dealloc];
}

+ (id)defaultKeyValueStore
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001829F0;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401F98 != -1) {
    dispatch_once(&qword_100401F98, block);
  }
  return (id)qword_100401F90;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
}

- (id)valueForDomain:(id)a3 key:(id)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = sub_100182B50;
  v16 = sub_100182B60;
  uint64_t v17 = 0;
  v7 = dispatch_semaphore_create(0);
  keyValueStore = self->_keyValueStore;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100182B6C;
  v11[3] = &unk_1003A84E0;
  v11[4] = v7;
  v11[5] = &v12;
  [(SSKeyValueStore *)keyValueStore getValueForDomain:a3 key:a4 usingBlock:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

+ (void)getValuesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[KeyValueStore defaultKeyValueStore];
  if (sub_100182C44())
  {
    [v6 _getValuesWithMessage:a3 connection:a4];
  }
  else
  {
    [v6 _handleMessage:a3 connection:a4 withReplyBlock:0];
  }
}

+ (void)observeXPCServer:(id)a3
{
  [a3 addObserver:a1 selector:"getValuesWithMessage:connection:" forMessage:92];
  [a3 addObserver:a1 selector:"removeAccountWithMessage:connection:" forMessage:193];
  [a3 addObserver:a1 selector:"removeAllValuesWithMessage:connection:" forMessage:95];
  [a3 addObserver:a1 selector:"removeValuesWithMessage:connection:" forMessage:94];

  [a3 addObserver:a1 selector:"setValuesWithMessage:connection:" forMessage:93];
}

+ (void)removeAccountWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[KeyValueStore defaultKeyValueStore];

  [v6 _removeAccountWithMessage:a3 connection:a4];
}

+ (void)removeAllValuesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[KeyValueStore defaultKeyValueStore];

  [v6 _removeAllValuesWithMessage:a3 connection:a4];
}

+ (void)removeValuesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[KeyValueStore defaultKeyValueStore];

  [v6 _removeValuesWithMessage:a3 connection:a4];
}

+ (void)setValuesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = +[KeyValueStore defaultKeyValueStore];

  [v6 _setValuesWithMessage:a3 connection:a4];
}

- (void)_getValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100182EDC;
  v4[3] = &unk_1003A8558;
  v4[4] = a3;
  v4[5] = self;
  [(KeyValueStore *)self _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.KeyValueStore");
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001831B0;
  block[3] = &unk_1003A3438;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.KeyValueStore");
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001832D0;
  block[3] = &unk_1003A68C8;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_removeAccountWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001833CC;
  v4[3] = &unk_1003A3410;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  [(KeyValueStore *)self _handleMessage:a3 connection:a4 withBlock:v4];
}

- (void)_removeAllValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001834C8;
  v4[3] = &unk_1003A8558;
  v4[4] = a4;
  v4[5] = self;
  [(KeyValueStore *)self _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

- (void)_removeValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100183660;
  v4[3] = &unk_1003A7B38;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  [(KeyValueStore *)self _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

- (void)_setValuesWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100183830;
  v4[3] = &unk_1003A7B38;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = self;
  [(KeyValueStore *)self _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

@end