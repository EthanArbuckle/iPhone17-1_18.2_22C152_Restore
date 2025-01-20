@interface SKDiskOperations
- (BOOL)isEqual:(id)a3;
- (NSDictionary)wholeDiskOperation;
- (NSMutableArray)childrenOperations;
- (SKDiskOperations)initWithWholeDiskOperation:(id)a3;
- (void)setWholeDiskOperation:(id)a3;
@end

@implementation SKDiskOperations

- (SKDiskOperations)initWithWholeDiskOperation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKDiskOperations;
  v5 = [(SKDiskOperations *)&v11 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    wholeDiskOperation = v5->_wholeDiskOperation;
    v5->_wholeDiskOperation = v6;

    uint64_t v8 = +[NSMutableArray array];
    childrenOperations = v5->_childrenOperations;
    v5->_childrenOperations = (NSMutableArray *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(SKDiskOperations *)self wholeDiskOperation];
  v6 = [v5 objectForKeyedSubscript:off_100055A60];
  unsigned __int8 v7 = [v4 isEqual:v6];

  return v7;
}

- (NSDictionary)wholeDiskOperation
{
  return self->_wholeDiskOperation;
}

- (void)setWholeDiskOperation:(id)a3
{
}

- (NSMutableArray)childrenOperations
{
  return self->_childrenOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenOperations, 0);

  objc_storeStrong((id *)&self->_wholeDiskOperation, 0);
}

@end