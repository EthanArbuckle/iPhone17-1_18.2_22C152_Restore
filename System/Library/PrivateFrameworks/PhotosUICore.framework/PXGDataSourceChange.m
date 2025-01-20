@interface PXGDataSourceChange
- (NSArray)changeDetails;
- (PXGDataSourceChange)init;
- (PXGDataSourceChange)initWithChangeDetails:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5;
- (PXSectionedDataSource)dataSourceAfterChanges;
- (PXSectionedDataSource)dataSourceBeforeChanges;
@end

@implementation PXGDataSourceChange

- (PXGDataSourceChange)initWithChangeDetails:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PXGDataSourceChange;
  v12 = [(PXGDataSourceChange *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changeDetails, a3);
    objc_storeStrong((id *)&v13->_dataSourceBeforeChanges, a4);
    objc_storeStrong((id *)&v13->_dataSourceAfterChanges, a5);
    if ([v9 count])
    {
      v14 = [v9 lastObject];
      uint64_t v15 = [v14 toDataSourceIdentifier];
      if (v15 == [v11 identifier])
      {
        v16 = [v9 firstObject];
        uint64_t v17 = [v16 fromDataSourceIdentifier];
        uint64_t v18 = [v10 identifier];

        if (v17 == v18) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      PXAssertGetLog();
    }
  }
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceAfterChanges, 0);
  objc_storeStrong((id *)&self->_dataSourceBeforeChanges, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

- (PXSectionedDataSource)dataSourceAfterChanges
{
  return self->_dataSourceAfterChanges;
}

- (PXSectionedDataSource)dataSourceBeforeChanges
{
  return self->_dataSourceBeforeChanges;
}

- (NSArray)changeDetails
{
  return self->_changeDetails;
}

- (PXGDataSourceChange)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGDataSourceDrivenLayout.m", 253, @"%s is not available as initializer", "-[PXGDataSourceChange init]");

  abort();
}

@end