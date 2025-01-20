@interface PXSectionedTileIdentifierConverter
- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3;
- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4;
- (NSArray)changeDetails;
- (NSIndexSet)reloadedTileKindsOnObjectChanged;
- (PXSectionedDataSource)fromDataSource;
- (PXSectionedDataSource)toDataSource;
- (PXSectionedTileIdentifierConverter)init;
- (PXSectionedTileIdentifierConverter)initWithFromDataSource:(id)a3 toDataSource:(id)a4 changeDetails:(id)a5;
- (void)setReloadedTileKindsOnObjectChanged:(id)a3;
@end

@implementation PXSectionedTileIdentifierConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadedTileKindsOnObjectChanged, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_toDataSource, 0);
  objc_storeStrong((id *)&self->_fromDataSource, 0);
}

- (void)setReloadedTileKindsOnObjectChanged:(id)a3
{
}

- (NSIndexSet)reloadedTileKindsOnObjectChanged
{
  return self->_reloadedTileKindsOnObjectChanged;
}

- (NSArray)changeDetails
{
  return self->_changeDetails;
}

- (PXSectionedDataSource)toDataSource
{
  return self->_toDataSource;
}

- (PXSectionedDataSource)fromDataSource
{
  return self->_fromDataSource;
}

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t length = a3->length;
  unint64_t v3 = a3->index[0];
  unint64_t v5 = a3->index[1];
  unint64_t v6 = a3->index[2];
  unint64_t v7 = a3->index[3];
  unint64_t v8 = a3->index[4];
  long long v9 = *(_OWORD *)&a3->index[7];
  long long v22 = *(_OWORD *)&a3->index[5];
  long long v23 = v9;
  unint64_t v24 = a3->index[9];
  if (length - 3 > 1) {
    return 0;
  }
  if ([(PXSectionedDataSource *)self->_fromDataSource isEqual:self->_toDataSource])
  {
LABEL_3:
    a3->unint64_t length = length;
    a3->index[0] = v3;
    a3->index[1] = v5;
    a3->index[2] = v6;
    a3->index[3] = v7;
    a3->index[4] = v8;
    long long v12 = v23;
    *(_OWORD *)&a3->index[5] = v22;
    *(_OWORD *)&a3->index[7] = v12;
    BOOL result = 1;
    a3->index[9] = v24;
    return result;
  }
  v14 = [(NSArray *)self->_changeDetails lastObject];
  if (v5 == [v14 toDataSourceIdentifier])
  {
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    changeDetails = self->_changeDetails;
    v18[0] = v5;
    v18[1] = v6;
    v18[2] = v7;
    v18[3] = v8;
    [off_1E5DA8488 indexPathAfterRevertingChanges:changeDetails fromIndexPath:v18 hasIncrementalChanges:0 objectChanged:&v21];
    unint64_t v5 = v19;
    if ((void)v19 != *(void *)off_1E5DAAED8)
    {
      if (v21)
      {
        v16 = [(PXSectionedTileIdentifierConverter *)self reloadedTileKindsOnObjectChanged];
        char v17 = [v16 containsIndex:v3];

        if (v17) {
          goto LABEL_8;
        }
        unint64_t v5 = v19;
      }
      unint64_t v6 = *((void *)&v19 + 1);
      unint64_t v8 = *((void *)&v20 + 1);
      unint64_t v7 = v20;

      goto LABEL_3;
    }
  }
LABEL_8:

  return 0;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  BOOL result = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t length = a3->length;
  unint64_t v6 = a3->index[0];
  unint64_t v8 = a3->index[1];
  unint64_t v9 = a3->index[2];
  unint64_t v11 = a3->index[3];
  unint64_t v10 = a3->index[4];
  long long v12 = *(_OWORD *)&a3->index[7];
  long long v26 = *(_OWORD *)&a3->index[5];
  long long v27 = v12;
  unint64_t v28 = a3->index[9];
  if (length - 6 >= 0xFFFFFFFFFFFFFFFDLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v15 = *a4;
    if ([(PXSectionedDataSource *)self->_fromDataSource isEqual:self->_toDataSource])
    {
LABEL_4:
      a3->unint64_t length = length;
      a3->index[0] = v6;
      a3->index[1] = v8;
      a3->index[2] = v9;
      a3->index[3] = v11;
      a3->index[4] = v10;
      long long v16 = v27;
      *(_OWORD *)&a3->index[5] = v26;
      *(_OWORD *)&a3->index[7] = v16;
      a3->index[9] = v28;
      BOOL result = 1;
      *a4 = v15;
      return result;
    }
    unint64_t v21 = v15;
    char v17 = [(NSArray *)self->_changeDetails firstObject];
    if (v8 != [v17 fromDataSourceIdentifier]) {
      goto LABEL_9;
    }
    char v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    changeDetails = self->_changeDetails;
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v10;
    [off_1E5DA8488 indexPathAfterApplyingChanges:changeDetails toIndexPath:v22 hasIncrementalChanges:0 objectChanged:&v25];
    unint64_t v8 = v23;
    if ((void)v23 == *(void *)off_1E5DAAED8) {
      goto LABEL_9;
    }
    if (v25)
    {
      long long v19 = [(PXSectionedTileIdentifierConverter *)self reloadedTileKindsOnObjectChanged];
      char v20 = [v19 containsIndex:v6];

      if (v20)
      {
LABEL_9:

        return 0;
      }
      unint64_t v8 = v23;
    }
    unint64_t v9 = *((void *)&v23 + 1);
    unint64_t v10 = *((void *)&v24 + 1);
    unint64_t v11 = v24;

    unint64_t v15 = v21;
    goto LABEL_4;
  }
  return result;
}

- (PXSectionedTileIdentifierConverter)initWithFromDataSource:(id)a3 toDataSource:(id)a4 changeDetails:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSectionedTileIdentifierConverter;
  long long v12 = [(PXSectionedTileIdentifierConverter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fromDataSource, a3);
    objc_storeStrong((id *)&v13->_toDataSource, a4);
    objc_storeStrong((id *)&v13->_changeDetails, a5);
  }

  return v13;
}

- (PXSectionedTileIdentifierConverter)init
{
  return 0;
}

@end