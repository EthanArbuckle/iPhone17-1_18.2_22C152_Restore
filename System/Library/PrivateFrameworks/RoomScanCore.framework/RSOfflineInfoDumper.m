@interface RSOfflineInfoDumper
- (RSOfflineInfoDumper)init;
@end

@implementation RSOfflineInfoDumper

- (void).cxx_destruct
{
}

- (RSOfflineInfoDumper)init
{
  v6.receiver = self;
  v6.super_class = (Class)RSOfflineInfoDumper;
  v2 = [(RSOfflineInfoDumper *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.RoomScanCore.SaveOfflineLogFiles", 0);
    save_log_queue = v2->_save_log_queue;
    v2->_save_log_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end