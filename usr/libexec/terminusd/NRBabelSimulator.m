@interface NRBabelSimulator
- (NRBabelSimulator)init;
- (NSMutableArray)fakeInstances;
- (NSMutableArray)fakeLinks;
- (void)setFakeInstances:(id)a3;
- (void)setFakeLinks:(id)a3;
@end

@implementation NRBabelSimulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeLinks, 0);

  objc_storeStrong((id *)&self->_fakeInstances, 0);
}

- (void)setFakeLinks:(id)a3
{
}

- (NSMutableArray)fakeLinks
{
  return self->_fakeLinks;
}

- (void)setFakeInstances:(id)a3
{
}

- (NSMutableArray)fakeInstances
{
  return self->_fakeInstances;
}

- (NRBabelSimulator)init
{
  v18.receiver = self;
  v18.super_class = (Class)NRBabelSimulator;
  v2 = [(NRBabelSimulator *)&v18 init];
  if (!v2)
  {
    id v14 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v16 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136446210;
    *(void *)(v17 + 4) = "-[NRBabelSimulator init]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fakeInstances = v3->_fakeInstances;
  v3->_fakeInstances = v4;

  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fakeLinks = v3->_fakeLinks;
  v3->_fakeLinks = v6;

  v8 = [[NRBabelLinkFake alloc] initWithName:@"fake1"];
  v9 = [[NRBabelLinkFake alloc] initWithName:@"fake2"];
  [(NSMutableArray *)v3->_fakeLinks addObject:v8];
  [(NSMutableArray *)v3->_fakeLinks addObject:v9];
  v10 = [[NRBabelInstanceFake alloc] initWithName:@"A"];
  v11 = [[NRBabelInstanceFake alloc] initWithName:@"B"];
  v12 = [[NRBabelInstanceFake alloc] initWithName:@"C"];
  [(NSMutableArray *)v3->_fakeInstances addObject:v10];
  [(NSMutableArray *)v3->_fakeInstances addObject:v11];
  [(NSMutableArray *)v3->_fakeInstances addObject:v12];

  return v3;
}

@end