@interface NRBabelSourceLocal
- (BOOL)isNewDistanceFeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4;
- (NRBabelSourceLocal)initWithPrefix:(id)a3 instance:(id)a4;
- (id)description;
- (unsigned)seqno;
@end

@implementation NRBabelSourceLocal

- (BOOL)isNewDistanceFeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  return 0;
}

- (unsigned)seqno
{
  v2 = [(NRBabelSource *)self instance];
  unsigned __int16 v3 = (unsigned __int16)[v2 nodeSeqno];

  return v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(NRBabelSource *)self bPrefix];
  id v5 = [v3 initWithFormat:@"%@ (local)", v4];

  return v5;
}

- (NRBabelSourceLocal)initWithPrefix:(id)a3 instance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRBabelSourceLocal;
  v8 = -[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:](&v10, "initWithPrefix:routerID:seqno:metric:instance:", v7, [v6 routerID], [v6 nodeSeqno], 0, v6);

  return v8;
}

@end