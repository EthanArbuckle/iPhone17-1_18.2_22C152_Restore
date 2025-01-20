@interface STSDownloadOperationInfo
- (NSArray)completionBlocks;
- (NSArray)progressBlocks;
- (NSOperation)operation;
- (STSDownloadOperationInfo)initWithOperation:(id)a3 begin:(id)a4 progress:(id)a5 completion:(id)a6;
- (id)beginBlocks;
- (void)addBegin:(id)a3;
- (void)addCompletion:(id)a3;
- (void)addProgress:(id)a3;
@end

@implementation STSDownloadOperationInfo

- (STSDownloadOperationInfo)initWithOperation:(id)a3 begin:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)STSDownloadOperationInfo;
  v15 = [(STSDownloadOperationInfo *)&v30 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_operation, a3);
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    beginBlocks = v16->_beginBlocks;
    v16->_beginBlocks = (NSMutableArray *)v17;

    if (v12)
    {
      v19 = v16->_beginBlocks;
      v20 = (void *)MEMORY[0x230FB7F40](v12);
      [(NSMutableArray *)v19 addObject:v20];
    }
    uint64_t v21 = [MEMORY[0x263EFF980] array];
    progressBlocks = v16->_progressBlocks;
    v16->_progressBlocks = (NSMutableArray *)v21;

    if (v13)
    {
      v23 = v16->_progressBlocks;
      v24 = (void *)MEMORY[0x230FB7F40](v13);
      [(NSMutableArray *)v23 addObject:v24];
    }
    uint64_t v25 = [MEMORY[0x263EFF980] array];
    completionBlocks = v16->_completionBlocks;
    v16->_completionBlocks = (NSMutableArray *)v25;

    if (v14)
    {
      v27 = v16->_completionBlocks;
      v28 = (void *)MEMORY[0x230FB7F40](v14);
      [(NSMutableArray *)v27 addObject:v28];
    }
  }

  return v16;
}

- (id)beginBlocks
{
  v2 = (void *)[(NSMutableArray *)self->_beginBlocks copy];

  return v2;
}

- (NSArray)progressBlocks
{
  v2 = (void *)[(NSMutableArray *)self->_progressBlocks copy];

  return (NSArray *)v2;
}

- (NSArray)completionBlocks
{
  v2 = (void *)[(NSMutableArray *)self->_completionBlocks copy];

  return (NSArray *)v2;
}

- (void)addBegin:(id)a3
{
  beginBlocks = self->_beginBlocks;
  id v4 = (id)MEMORY[0x230FB7F40](a3, a2);
  [(NSMutableArray *)beginBlocks addObject:v4];
}

- (void)addProgress:(id)a3
{
  progressBlocks = self->_progressBlocks;
  id v4 = (id)MEMORY[0x230FB7F40](a3, a2);
  [(NSMutableArray *)progressBlocks addObject:v4];
}

- (void)addCompletion:(id)a3
{
  completionBlocks = self->_completionBlocks;
  id v4 = (id)MEMORY[0x230FB7F40](a3, a2);
  [(NSMutableArray *)completionBlocks addObject:v4];
}

- (NSOperation)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_progressBlocks, 0);

  objc_storeStrong((id *)&self->_beginBlocks, 0);
}

@end