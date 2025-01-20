@interface _PSMLArrayProvider
- (MLArrayBatchProvider)MLArrayProvider;
- (_PSMLArrayProvider)initWithProvider:(id)a3 clusteringCount:(int)a4 recencyCount:(int)a5;
- (int)clusteringCount;
- (int)recencyCount;
- (void)setClusteringCount:(int)a3;
- (void)setMLArrayProvider:(id)a3;
- (void)setRecencyCount:(int)a3;
@end

@implementation _PSMLArrayProvider

- (_PSMLArrayProvider)initWithProvider:(id)a3 clusteringCount:(int)a4 recencyCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSMLArrayProvider;
  v10 = [(_PSMLArrayProvider *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_MLArrayProvider, a3);
    [(_PSMLArrayProvider *)v11 setClusteringCount:v6];
    [(_PSMLArrayProvider *)v11 setRecencyCount:v5];
  }

  return v11;
}

- (MLArrayBatchProvider)MLArrayProvider
{
  return self->_MLArrayProvider;
}

- (void)setMLArrayProvider:(id)a3
{
}

- (int)clusteringCount
{
  return self->_clusteringCount;
}

- (void)setClusteringCount:(int)a3
{
  self->_clusteringCount = a3;
}

- (int)recencyCount
{
  return self->_recencyCount;
}

- (void)setRecencyCount:(int)a3
{
  self->_recencyCount = a3;
}

- (void).cxx_destruct
{
}

@end