@interface PLRegionsAgglomerativeClusteringDataVector
- (PLRegionsAgglomerativeClusteringDataVector)initWithDataLength:(unint64_t)a3;
- (double)data;
- (id)userInfo;
- (unint64_t)length;
- (void)dealloc;
- (void)setUserInfo:(id)a3;
@end

@implementation PLRegionsAgglomerativeClusteringDataVector

- (void).cxx_destruct
{
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)length
{
  return self->_length;
}

- (double)data
{
  return self->_data;
}

- (void)dealloc
{
  data = self->_data;
  if (data)
  {
    free(data);
    self->_data = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLRegionsAgglomerativeClusteringDataVector;
  [(PLRegionsAgglomerativeClusteringDataVector *)&v4 dealloc];
}

- (PLRegionsAgglomerativeClusteringDataVector)initWithDataLength:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLRegionsAgglomerativeClusteringDataVector;
  objc_super v4 = [(PLRegionsAgglomerativeClusteringDataVector *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_length = a3;
    v4->_data = (double *)malloc_type_calloc(8 * a3, 1uLL, 0xAFC71C67uLL);
  }
  return v5;
}

@end