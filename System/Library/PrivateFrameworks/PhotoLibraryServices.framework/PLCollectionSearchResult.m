@interface PLCollectionSearchResult
- (NSDate)sortDate;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uuid;
- (PLCollectionSearchResult)initWithCollectionResult:(id)a3 libraryScope:(unint64_t)a4;
- (PLCollectionSearchResult)initWithGroupResult:(id)a3 collectionResult:(id)a4 libraryScope:(unint64_t)a5;
- (PSICollectionResult)collectionResult;
- (PSIDate)endDate;
- (PSIDate)startDate;
- (id)keyAssetUUID;
- (unint64_t)assetCount;
- (unint64_t)collectionType;
- (unint64_t)libraryScope;
- (unint64_t)type;
- (void)setLibraryScope:(unint64_t)a3;
@end

@implementation PLCollectionSearchResult

- (void).cxx_destruct
{
}

- (void)setLibraryScope:(unint64_t)a3
{
  self->_libraryScope = a3;
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (PSICollectionResult)collectionResult
{
  return self->_collectionResult;
}

- (unint64_t)collectionType
{
  return [(PSICollectionResult *)self->_collectionResult type];
}

- (PSIDate)endDate
{
  return [(PSICollectionResult *)self->_collectionResult endDate];
}

- (PSIDate)startDate
{
  return [(PSICollectionResult *)self->_collectionResult startDate];
}

- (NSDate)sortDate
{
  return [(PSICollectionResult *)self->_collectionResult sortDate];
}

- (NSString)subtitle
{
  return [(PSICollectionResult *)self->_collectionResult subtitle];
}

- (NSString)title
{
  return [(PSICollectionResult *)self->_collectionResult title];
}

- (NSString)uuid
{
  return [(PSICollectionResult *)self->_collectionResult uuid];
}

- (unint64_t)assetCount
{
  unint64_t v4 = [(PLCollectionSearchResult *)self libraryScope];
  switch(v4)
  {
    case 0uLL:
      v5 = [(PLCollectionSearchResult *)self collectionResult];
      uint64_t v7 = [v5 assetsCountPrivate];
      v8 = [(PLCollectionSearchResult *)self collectionResult];
      unint64_t v2 = [v8 assetsCountShared] + v7;

LABEL_8:
      return v2;
    case 2uLL:
      v5 = [(PLCollectionSearchResult *)self collectionResult];
      uint64_t v6 = [v5 assetsCountShared];
      goto LABEL_7;
    case 1uLL:
      v5 = [(PLCollectionSearchResult *)self collectionResult];
      uint64_t v6 = [v5 assetsCountPrivate];
LABEL_7:
      unint64_t v2 = v6;
      goto LABEL_8;
  }
  return v2;
}

- (id)keyAssetUUID
{
  unint64_t v4 = [(PLCollectionSearchResult *)self libraryScope];
  if (v4)
  {
    if (v4 == 2)
    {
      v5 = [(PLCollectionSearchResult *)self collectionResult];
      uint64_t v6 = [v5 keyAssetUUIDShared];
    }
    else
    {
      if (v4 != 1) {
        goto LABEL_12;
      }
      v5 = [(PLCollectionSearchResult *)self collectionResult];
      uint64_t v6 = [v5 keyAssetUUIDPrivate];
    }
    id v2 = (id)v6;
  }
  else
  {
    v5 = [(PLCollectionSearchResult *)self collectionResult];
    uint64_t v7 = [v5 keyAssetUUIDPrivate];
    v8 = v7;
    if (v7)
    {
      id v2 = v7;
    }
    else
    {
      v9 = [(PLCollectionSearchResult *)self collectionResult];
      id v2 = [v9 keyAssetUUIDShared];
    }
  }

LABEL_12:
  return v2;
}

- (PLCollectionSearchResult)initWithCollectionResult:(id)a3 libraryScope:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLCollectionSearchResult;
  v8 = [(PLCollectionSearchResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_collectionResult, a3);
    v9->_libraryScope = a4;
  }

  return v9;
}

- (PLCollectionSearchResult)initWithGroupResult:(id)a3 collectionResult:(id)a4 libraryScope:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCollectionSearchResult;
  v10 = [(PLSearchResult *)&v13 initWithGroupResult:a3];
  objc_super v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_collectionResult, a4);
    v11->_libraryScope = a5;
  }

  return v11;
}

- (unint64_t)type
{
  return 2;
}

@end