@interface SecureElementManager
+ (id)getInstance;
- (SecureElementManager)init;
- (id)getNFManager;
- (void)injectNFManager:(id)a3;
@end

@implementation SecureElementManager

+ (id)getInstance
{
  if (qword_10045CD88 != -1) {
    dispatch_once(&qword_10045CD88, &stru_10040DB20);
  }
  v2 = (void *)qword_10045CD80;

  return v2;
}

- (SecureElementManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SecureElementManager;
  v2 = [(SecureElementManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.seserviced.secureelement", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    +[SecureElement setQueueKey:v2->_queue];
  }
  return v2;
}

- (id)getNFManager
{
  nfManager = self->_nfManager;
  if (!nfManager)
  {
    sub_1000580C0((uint64_t)NearFieldManager, self->_queue);
    v4 = (NFManagerProtocol *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = self->_nfManager;
    self->_nfManager = v4;

    nfManager = self->_nfManager;
  }

  return nfManager;
}

- (void)injectNFManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nfManager, 0);
}

@end