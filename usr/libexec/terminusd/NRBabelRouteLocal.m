@interface NRBabelRouteLocal
- (NRBabelRouteLocal)initWithPrefix:(id)a3 instance:(id)a4;
- (unsigned)metric;
- (unsigned)seqno;
@end

@implementation NRBabelRouteLocal

- (NRBabelRouteLocal)initWithPrefix:(id)a3 instance:(id)a4
{
  v11[0] = 0;
  v11[1] = 0;
  id v6 = a4;
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRBabelRouteLocal;
  v8 = -[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:](&v10, "initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:", v7, 0, [v6 routerID], objc_msgSend(v6, "nodeSeqno"), 0xFFFFLL, 0, v11, v6);

  return v8;
}

- (unsigned)metric
{
  return 0;
}

- (unsigned)seqno
{
  v2 = [(NRBabelRoute *)self instance];
  unsigned __int16 v3 = (unsigned __int16)[v2 nodeSeqno];

  return v3;
}

@end