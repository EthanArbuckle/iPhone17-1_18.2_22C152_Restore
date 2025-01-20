@interface NPTOFirstUnlockTask
- (NPTOFirstUnlockTask)initWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation NPTOFirstUnlockTask

- (NPTOFirstUnlockTask)initWithBlock:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPTOFirstUnlockTask;
  v5 = [(NPTOFirstUnlockTask *)&v12 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id block = v5->_block;
    v5->_id block = v6;

    if (qword_1000A4EF8 != -1) {
      dispatch_once(&qword_1000A4EF8, &stru_100093A70);
    }
    id v8 = (id)qword_1000A4EE8;
    objc_sync_enter(v8);
    v9 = (void *)qword_1000A4EE8;
    id v10 = objc_retainBlock(v4);
    [v9 addObject:v10];

    objc_sync_exit(v8);
  }

  return v5;
}

- (void)dealloc
{
  id v3 = (id)qword_1000A4EE8;
  objc_sync_enter(v3);
  id v4 = (void *)qword_1000A4EE8;
  id v5 = objc_retainBlock(self->_block);
  [v4 removeObject:v5];

  objc_sync_exit(v3);
  v6.receiver = self;
  v6.super_class = (Class)NPTOFirstUnlockTask;
  [(NPTOFirstUnlockTask *)&v6 dealloc];
}

- (void).cxx_destruct
{
}

@end