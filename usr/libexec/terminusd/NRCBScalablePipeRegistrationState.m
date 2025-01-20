@interface NRCBScalablePipeRegistrationState
- (NRCBScalablePipeRegistrationState)init;
@end

@implementation NRCBScalablePipeRegistrationState

- (void).cxx_destruct
{
}

- (NRCBScalablePipeRegistrationState)init
{
  v11.receiver = self;
  v11.super_class = (Class)NRCBScalablePipeRegistrationState;
  v2 = [(NRCBScalablePipeRegistrationState *)&v11 init];
  if (!v2)
  {
    id v7 = sub_1000286EC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v9 = sub_1000286EC();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136446210;
    *(void *)(v10 + 4) = "-[NRCBScalablePipeRegistrationState init]";
    sub_1000286EC();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  connectedPipes = v3->_connectedPipes;
  v3->_connectedPipes = v4;

  return v3;
}

@end