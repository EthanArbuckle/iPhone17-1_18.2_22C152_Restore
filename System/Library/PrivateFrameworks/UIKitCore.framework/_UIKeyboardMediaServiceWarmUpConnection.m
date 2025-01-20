@interface _UIKeyboardMediaServiceWarmUpConnection
+ (id)sharedConnection;
+ (void)warmUp;
- (void)warmUp;
@end

@implementation _UIKeyboardMediaServiceWarmUpConnection

+ (void)warmUp
{
  id v2 = +[_UIKeyboardMediaServiceWarmUpConnection sharedConnection];
  [v2 warmUp];
}

+ (id)sharedConnection
{
  if (qword_1EB2645A8 != -1) {
    dispatch_once(&qword_1EB2645A8, &__block_literal_global_535);
  }
  id v2 = (void *)_MergedGlobals_1252;
  return v2;
}

- (void)warmUp
{
  queue = self->_queue;
  if (!queue)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.UIKeyboardMediaServiceWarmUpQueue", v4);
    v6 = self->_queue;
    self->_queue = v5;

    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___UIKeyboardMediaServiceWarmUpConnection_warmUp__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end