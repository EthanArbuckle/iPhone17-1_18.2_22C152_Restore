@interface _MRTelevisionControllerBlockCallback
- (OS_dispatch_queue)queue;
- (_MRTelevisionControllerBlockCallback)initWithCallbackBlock:(id)a3 queue:(id)a4;
- (id)callbackBlock;
@end

@implementation _MRTelevisionControllerBlockCallback

- (_MRTelevisionControllerBlockCallback)initWithCallbackBlock:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MRTelevisionControllerBlockCallback;
  v9 = [(_MRTelevisionControllerBlockCallback *)&v15 init];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        uint64_t v10 = [v7 copy];
        id callbackBlock = v9->_callbackBlock;
        v9->_id callbackBlock = (id)v10;

        objc_storeStrong((id *)&v9->_queue, a4);
        goto LABEL_5;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v9, @"MRTelevisionController.m", 31, @"Invalid parameter not satisfying: %@", @"callback" object file lineNumber description];

      if (v8) {
        goto LABEL_4;
      }
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, v9, @"MRTelevisionController.m", 32, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_callbackBlock, 0);
}

@end