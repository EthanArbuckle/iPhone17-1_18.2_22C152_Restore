@interface PXPhotosResultRecord
- (BOOL)ensureKeyAssetAtBeginning;
- (BOOL)isCurated;
- (BOOL)reverseSortOrder;
- (BOOL)wantsCuration;
- (PHFetchResult)exposedFetchResultBeforeFiltering;
- (id)curatedFetchResult;
- (id)curatedOids;
- (id)curatedRefetchCondition;
- (id)description;
- (id)excludedOids;
- (id)exposedFetchResult;
- (id)fetchResult;
- (id)filteredFetchResult;
- (id)includedOids;
- (id)inclusionPredicate;
- (id)keyAssetsFetchResult;
- (id)manualOrderUUIDs;
- (int64_t)curationLength;
- (int64_t)keyAssetIndex;
@end

@implementation PXPhotosResultRecord

- (id)description
{
  id v16 = (id)NSString;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosResultRecord;
  v15 = [(PXPhotosResultRecord *)&v18 description];
  v3 = [(PXPhotosResultRecord *)self fetchResult];
  v4 = [(PXPhotosResultRecord *)self curatedFetchResult];
  v5 = [(PXPhotosResultRecord *)self keyAssetsFetchResult];
  v6 = [(PXPhotosResultRecord *)self includedOids];
  v7 = [(PXPhotosResultRecord *)self excludedOids];
  if ([(PXPhotosResultRecord *)self wantsCuration]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  if ([(PXPhotosResultRecord *)self reverseSortOrder]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = v10;
  v12 = [(PXPhotosResultRecord *)self filteredFetchResult];
  v13 = [(PXPhotosResultRecord *)self exposedFetchResult];
  id v17 = [v16 stringWithFormat:@"<%@ fetchResult:%@ curatedFetchResult:%@ keyAssetsFetchResult:%@ includedOids:%@ excludedOids:%@ wantsCuration:%@ reverseSortOrder:%@ filteredFetchResult:%@ exposedFetchResult:%@>", v15, v3, v4, v5, v6, v7, v9, v11, v12, v13];

  return v17;
}

- (PHFetchResult)exposedFetchResultBeforeFiltering
{
  return 0;
}

- (id)inclusionPredicate
{
  return 0;
}

- (id)filteredFetchResult
{
  return 0;
}

- (BOOL)ensureKeyAssetAtBeginning
{
  return 0;
}

- (BOOL)reverseSortOrder
{
  return 0;
}

- (BOOL)isCurated
{
  return 0;
}

- (int64_t)curationLength
{
  return 0;
}

- (BOOL)wantsCuration
{
  return 0;
}

- (int64_t)keyAssetIndex
{
  return -1;
}

- (id)keyAssetsFetchResult
{
  return 0;
}

- (id)curatedFetchResult
{
  return 0;
}

- (id)fetchResult
{
  return 0;
}

- (id)curatedRefetchCondition
{
  return 0;
}

- (id)exposedFetchResult
{
  return 0;
}

- (id)manualOrderUUIDs
{
  return 0;
}

- (id)curatedOids
{
  return 0;
}

- (id)excludedOids
{
  return 0;
}

- (id)includedOids
{
  return 0;
}

@end