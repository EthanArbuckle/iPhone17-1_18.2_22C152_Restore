@interface PXPhotosResultRecordChangeDetails
+ (id)resultRecordChangeDetailsFor:(id)a3 withChange:(id)a4;
- (PHFetchResultChangeDetails)exposedFetchResultChangeDetails;
- (PHFetchResultChangeDetails)keyAssetsFetchResultChangeDetails;
- (PXPhotosResultRecord)resultRecordAfterChanges;
- (PXPhotosResultRecord)resultRecordBeforeChanges;
- (PXPhotosResultRecordChangeDetails)initWithResultRecordBeforeChanges:(id)a3 resultRecordAfterChanges:(id)a4 exposedFetchResultChangeDetails:(id)a5 keyAssetsFetchResultChangeDetails:(id)a6;
- (id)description;
@end

@implementation PXPhotosResultRecordChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetsFetchResultChangeDetails, 0);
  objc_storeStrong((id *)&self->_exposedFetchResultChangeDetails, 0);
  objc_storeStrong((id *)&self->_resultRecordAfterChanges, 0);
  objc_storeStrong((id *)&self->_resultRecordBeforeChanges, 0);
}

- (PHFetchResultChangeDetails)keyAssetsFetchResultChangeDetails
{
  return self->_keyAssetsFetchResultChangeDetails;
}

- (PHFetchResultChangeDetails)exposedFetchResultChangeDetails
{
  return self->_exposedFetchResultChangeDetails;
}

- (PXPhotosResultRecord)resultRecordAfterChanges
{
  return self->_resultRecordAfterChanges;
}

- (PXPhotosResultRecord)resultRecordBeforeChanges
{
  return self->_resultRecordBeforeChanges;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosResultRecordChangeDetails;
  v4 = [(PXPhotosResultRecordChangeDetails *)&v11 description];
  v5 = [(PXPhotosResultRecordChangeDetails *)self resultRecordBeforeChanges];
  v6 = [(PXPhotosResultRecordChangeDetails *)self resultRecordAfterChanges];
  v7 = [(PXPhotosResultRecordChangeDetails *)self exposedFetchResultChangeDetails];
  v8 = [(PXPhotosResultRecordChangeDetails *)self keyAssetsFetchResultChangeDetails];
  v9 = [v3 stringWithFormat:@"<%@ beforeChanges:%@ afterChanges:%@ exposedFetchResultChangeDetails:%@ keyAssetsFetchResultChangeDetails:%@>", v4, v5, v6, v7, v8];

  return v9;
}

- (PXPhotosResultRecordChangeDetails)initWithResultRecordBeforeChanges:(id)a3 resultRecordAfterChanges:(id)a4 exposedFetchResultChangeDetails:(id)a5 keyAssetsFetchResultChangeDetails:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosResultRecordChangeDetails;
  v15 = [(PXPhotosResultRecordChangeDetails *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resultRecordBeforeChanges, a3);
    objc_storeStrong((id *)&v16->_resultRecordAfterChanges, a4);
    objc_storeStrong((id *)&v16->_exposedFetchResultChangeDetails, a5);
    objc_storeStrong((id *)&v16->_keyAssetsFetchResultChangeDetails, a6);
  }

  return v16;
}

+ (id)resultRecordChangeDetailsFor:(id)a3 withChange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 fetchResult];
  v8 = [v6 changeDetailsForFetchResult:v7];

  v9 = [v8 fetchResultAfterChanges];
  v10 = [v5 keyAssetsFetchResult];
  id v11 = [v6 changeDetailsForFetchResult:v10];

  uint64_t v12 = [v11 fetchResultAfterChanges];
  char v46 = 0;
  id v13 = [v5 curatedRefetchCondition];

  if (v13
    && ([v5 curatedRefetchCondition],
        id v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
        ((void (**)(void, id, char *))v14)[2](v14, v6, &v46),
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    v16 = 0;
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    v17 = [v5 curatedFetchResult];
    v16 = [v6 changeDetailsForFetchResult:v17];

    uint64_t v15 = [v16 fetchResultAfterChanges];
    if (v9) {
      goto LABEL_9;
    }
  }
  if (!v15 && !v12 && !v46)
  {
LABEL_18:
    id v19 = v5;
    goto LABEL_19;
  }
LABEL_9:
  objc_super v18 = (void *)[v5 copy];
  id v19 = v18;
  if (v9) {
    objc_msgSend(v18, "setFetchResult:reverseSortOrder:", v9, objc_msgSend(v18, "reverseSortOrder"));
  }
  if (v15) {
    [v19 setCuratedFetchResult:v15];
  }
  if (v12) {
    [v19 setKeyAssetsFetchResult:v12];
  }
  if (v46) {
    [v19 setCuratedRefetchCondition:0];
  }
  if (!v19) {
    goto LABEL_18;
  }
LABEL_19:
  v44 = (void *)v12;
  v20 = [v5 exposedFetchResult];
  v21 = [v19 exposedFetchResult];

  v45 = v8;
  if (v20 == v21)
  {
    v24 = v11;
    v25 = (void *)v15;
    v26 = v16;
    v27 = 0;
    v28 = v44;
    goto LABEL_36;
  }
  id v42 = v6;
  v22 = [v5 exposedFetchResult];
  uint64_t v43 = [v19 exposedFetchResult];
  if (v8)
  {
    v23 = [v8 fetchResultBeforeChanges];
    if (v23 == v22)
    {
      v29 = [v8 fetchResultAfterChanges];

      if (v29 == (void *)v43)
      {
        v24 = v11;
        v25 = (void *)v15;
        v26 = v16;
        id v41 = v8;
        goto LABEL_41;
      }
    }
    else
    {
    }
  }
  if (!v16)
  {
LABEL_29:
    v24 = v11;
    v25 = (void *)v15;
    v26 = v16;
    v32 = [v8 changedObjects];
    v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      uint64_t v35 = [v26 changedObjects];
      v36 = (void *)v35;
      v37 = (void *)MEMORY[0x1E4F1CBF0];
      if (v35) {
        v37 = (void *)v35;
      }
      id v34 = v37;
    }
    v38 = (void *)v43;

    v27 = [MEMORY[0x1E4F390B8] changeDetailsFromFetchResult:v22 toFetchResult:v43 changedObjects:v34];

    v28 = v44;
    goto LABEL_35;
  }
  v30 = [v16 fetchResultBeforeChanges];
  if (v30 != v22)
  {

    goto LABEL_29;
  }
  v31 = [v16 fetchResultAfterChanges];

  if (v31 != (void *)v43) {
    goto LABEL_29;
  }
  v24 = v11;
  v25 = (void *)v15;
  v26 = v16;
  id v41 = v16;
LABEL_41:
  v27 = v41;
  v38 = (void *)v43;
  v28 = v44;
LABEL_35:

  id v6 = v42;
LABEL_36:
  v39 = [[PXPhotosResultRecordChangeDetails alloc] initWithResultRecordBeforeChanges:v5 resultRecordAfterChanges:v19 exposedFetchResultChangeDetails:v27 keyAssetsFetchResultChangeDetails:v24];

  return v39;
}

@end