@interface WidgetServiceFactory
- (void)deleteCloudDataWithCompletion:(id)a3;
@end

@implementation WidgetServiceFactory

- (void)deleteCloudDataWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    v5 = (void (*)(const void *, uint64_t, void))*((void *)v3 + 2);
    swift_retain();
    v5(v4, 1, 0);
    _Block_release(v4);
    swift_release();
  }
}

@end