@interface SVXRadarFiler
- (BOOL)supportsRadarFiling;
- (SVXRadarFiler)init;
- (void)fileRadar:(id)a3 processName:(id)a4 displayReason:(id)a5 completion:(id)a6;
@end

@implementation SVXRadarFiler

- (void).cxx_destruct
{
}

- (void)fileRadar:(id)a3 processName:(id)a4 displayReason:(id)a5 completion:(id)a6
{
}

- (BOOL)supportsRadarFiling
{
  return getTapToRadarServiceClass() != 0;
}

- (SVXRadarFiler)init
{
  v6.receiver = self;
  v6.super_class = (Class)SVXRadarFiler;
  v2 = [(SVXRadarFiler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [getTapToRadarServiceClass() shared];
    ttrService = v2->_ttrService;
    v2->_ttrService = (SVXTapToRadarService *)v3;
  }
  return v2;
}

@end