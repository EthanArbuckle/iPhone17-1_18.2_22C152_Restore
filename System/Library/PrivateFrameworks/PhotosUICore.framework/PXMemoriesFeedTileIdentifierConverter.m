@interface PXMemoriesFeedTileIdentifierConverter
- (BOOL)_shouldConvertIdentifierFromMemory:(id)a3 toMemory:(id)a4;
- (BOOL)_shouldConvertIdentifierFromMemoryInfo:(id)a3 toMemoryInfo:(id)a4;
- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3;
- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4;
@end

@implementation PXMemoriesFeedTileIdentifierConverter

- (BOOL)_shouldConvertIdentifierFromMemoryInfo:(id)a3 toMemoryInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 assetCollection];
  v9 = [v6 assetCollection];
  v10 = [v6 primaryAsset];

  v11 = [v7 primaryAsset];

  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

LABEL_11:
      BOOL v16 = 0;
      goto LABEL_12;
    }
    uint64_t v15 = [v12 isContentEqualTo:v13];
    if (!v15) {
      uint64_t v15 = [v14 isContentEqualTo:v12];
    }

    if (v15 != 2) {
      goto LABEL_11;
    }
  }
  BOOL v16 = [(PXMemoriesFeedTileIdentifierConverter *)self _shouldConvertIdentifierFromMemory:v8 toMemory:v9];
LABEL_12:

  return v16;
}

- (BOOL)_shouldConvertIdentifierFromMemory:(id)a3 toMemory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 localizedTitle];
  id v8 = [v6 localizedTitle];
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    char v10 = [v7 isEqualToString:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v11 = [v5 subtitle];
  id v12 = [v6 subtitle];
  if (v11 == v12)
  {
  }
  else
  {
    id v13 = v12;
    char v14 = [v11 isEqualToString:v12];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  BOOL v16 = [v5 titleFontName];
  v17 = [v6 titleFontName];
  if (v16 == v17) {
    char v15 = 1;
  }
  else {
    char v15 = [v16 isEqualToString:v17];
  }

LABEL_13:
  return v15;
}

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t length = a3->length;
  unint64_t v3 = a3->index[0];
  unint64_t v5 = a3->index[1];
  unint64_t v6 = a3->index[2];
  unint64_t v7 = a3->index[3];
  unint64_t v8 = a3->index[4];
  long long v9 = *(_OWORD *)&a3->index[7];
  long long v34 = *(_OWORD *)&a3->index[5];
  long long v35 = v9;
  unint64_t v36 = a3->index[9];
  if (length - 3 > 1) {
    return 0;
  }
  unint64_t v28 = v3;
  id v12 = [(PXSectionedTileIdentifierConverter *)self fromDataSource];
  id v13 = [(PXSectionedTileIdentifierConverter *)self toDataSource];
  char v14 = [v12 isEqual:v13];

  if (v14)
  {
LABEL_3:
    a3->unint64_t length = length;
    a3->index[0] = v28;
    a3->index[1] = v5;
    a3->index[2] = v6;
    a3->index[3] = v7;
    a3->index[4] = v8;
    long long v15 = v35;
    *(_OWORD *)&a3->index[5] = v34;
    *(_OWORD *)&a3->index[7] = v15;
    BOOL result = 1;
    a3->index[9] = v36;
    return result;
  }
  v17 = [(PXSectionedTileIdentifierConverter *)self changeDetails];
  v18 = [v17 lastObject];

  if (v5 == [v18 toDataSourceIdentifier])
  {
    char v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    v19 = [(PXSectionedTileIdentifierConverter *)self changeDetails];
    *(void *)&long long v29 = v5;
    *((void *)&v29 + 1) = v6;
    *(void *)&long long v30 = v7;
    *((void *)&v30 + 1) = v8;
    [off_1E5DA8488 indexPathAfterRevertingChanges:v19 fromIndexPath:&v29 hasIncrementalChanges:0 objectChanged:&v33];

    unint64_t v20 = v31;
    uint64_t v21 = *(void *)off_1E5DAAED8;
    if ((void)v31 != *(void *)off_1E5DAAED8
      && (void)v32 != 0x7FFFFFFFFFFFFFFFLL
      && *((void *)&v32 + 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v33)
      {
        v22 = [(PXSectionedTileIdentifierConverter *)self fromDataSource];
        long long v29 = v31;
        long long v30 = v32;
        v27 = [v22 objectAtIndexPath:&v29];

        v23 = [(PXSectionedTileIdentifierConverter *)self toDataSource];
        *(void *)&long long v29 = v5;
        *((void *)&v29 + 1) = v6;
        *(void *)&long long v30 = v7;
        *((void *)&v30 + 1) = v8;
        v24 = [v23 objectAtIndexPath:&v29];

        char v33 = ![(PXMemoriesFeedTileIdentifierConverter *)self _shouldConvertIdentifierFromMemoryInfo:v27 toMemoryInfo:v24];
        unint64_t v20 = v31;
      }
    }
    if (v20 != v21)
    {
      if (v33)
      {
        v25 = [(PXSectionedTileIdentifierConverter *)self reloadedTileKindsOnObjectChanged];
        char v26 = [v25 containsIndex:v28];

        if (v26) {
          goto LABEL_13;
        }
        unint64_t v20 = v31;
      }
      unint64_t v6 = *((void *)&v31 + 1);
      unint64_t v8 = *((void *)&v32 + 1);
      unint64_t v7 = v32;

      unint64_t v5 = v20;
      goto LABEL_3;
    }
  }
LABEL_13:

  return 0;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  BOOL result = 0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t length = a3->length;
  unint64_t v6 = a3->index[0];
  unint64_t v8 = a3->index[1];
  unint64_t v9 = a3->index[2];
  unint64_t v11 = a3->index[3];
  unint64_t v10 = a3->index[4];
  long long v12 = *(_OWORD *)&a3->index[7];
  long long v37 = *(_OWORD *)&a3->index[5];
  long long v38 = v12;
  unint64_t v39 = a3->index[9];
  if (length - 6 >= 0xFFFFFFFFFFFFFFFDLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v31 = v6;
    unint64_t v29 = *a4;
    char v14 = [(PXSectionedTileIdentifierConverter *)self fromDataSource];
    long long v15 = [(PXSectionedTileIdentifierConverter *)self toDataSource];
    char v16 = [v14 isEqual:v15];

    if (v16)
    {
LABEL_4:
      a3->unint64_t length = length;
      a3->index[0] = v31;
      a3->index[1] = v8;
      a3->index[2] = v9;
      a3->index[3] = v11;
      a3->index[4] = v10;
      long long v17 = v38;
      *(_OWORD *)&a3->index[5] = v37;
      *(_OWORD *)&a3->index[7] = v17;
      a3->index[9] = v39;
      BOOL result = 1;
      *a4 = v29;
      return result;
    }
    v18 = [(PXSectionedTileIdentifierConverter *)self changeDetails];
    v19 = [v18 firstObject];

    if (v8 != [v19 fromDataSourceIdentifier]) {
      goto LABEL_17;
    }
    char v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    unint64_t v20 = [(PXSectionedTileIdentifierConverter *)self changeDetails];
    *(void *)&long long v32 = v8;
    *((void *)&v32 + 1) = v9;
    *(void *)&long long v33 = v11;
    *((void *)&v33 + 1) = v10;
    [off_1E5DA8488 indexPathAfterApplyingChanges:v20 toIndexPath:&v32 hasIncrementalChanges:0 objectChanged:&v36];

    unint64_t v21 = v34;
    uint64_t v22 = *(void *)off_1E5DAAED8;
    if ((void)v34 != *(void *)off_1E5DAAED8
      && (void)v35 != 0x7FFFFFFFFFFFFFFFLL
      && *((void *)&v35 + 1) == 0x7FFFFFFFFFFFFFFFLL
      && v8 != v22
      && v11 != 0x7FFFFFFFFFFFFFFFLL
      && v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v36)
      {
        v23 = [(PXSectionedTileIdentifierConverter *)self fromDataSource];
        *(void *)&long long v32 = v8;
        *((void *)&v32 + 1) = v9;
        *(void *)&long long v33 = v11;
        *((void *)&v33 + 1) = 0x7FFFFFFFFFFFFFFFLL;
        v24 = [v23 objectAtIndexPath:&v32];

        v25 = [(PXSectionedTileIdentifierConverter *)self toDataSource];
        long long v32 = v34;
        long long v33 = v35;
        char v26 = [v25 objectAtIndexPath:&v32];

        char v36 = ![(PXMemoriesFeedTileIdentifierConverter *)self _shouldConvertIdentifierFromMemoryInfo:v24 toMemoryInfo:v26];
        unint64_t v21 = v34;
      }
    }
    if (v21 == v22) {
      goto LABEL_17;
    }
    if (v36)
    {
      v27 = [(PXSectionedTileIdentifierConverter *)self reloadedTileKindsOnObjectChanged];
      char v28 = [v27 containsIndex:v31];

      if (v28)
      {
LABEL_17:

        return 0;
      }
      unint64_t v21 = v34;
    }
    unint64_t v9 = *((void *)&v34 + 1);
    unint64_t v10 = *((void *)&v35 + 1);
    unint64_t v11 = v35;

    unint64_t v8 = v21;
    goto LABEL_4;
  }
  return result;
}

@end