@interface NRAnalytics
- (NRAnalytics)init;
@end

@implementation NRAnalytics

- (void).cxx_destruct
{
}

- (NRAnalytics)init
{
  v11.receiver = self;
  v11.super_class = (Class)NRAnalytics;
  v2 = [(NRAnalytics *)&v11 init];
  if (!v2)
  {
    id v7 = sub_10012D02C();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v9 = sub_10012D02C();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136446210;
    *(void *)(v10 + 4) = "-[NRAnalytics init]";
    sub_10012D02C();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  eventDictionary = v3->_eventDictionary;
  v3->_eventDictionary = v4;

  return v3;
}

@end