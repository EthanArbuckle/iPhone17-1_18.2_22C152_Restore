@interface PSICollectionResult
- (NSDate)sortDate;
- (NSString)keyAssetUUIDPrivate;
- (NSString)keyAssetUUIDShared;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uuid;
- (PSICollectionResult)initWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 subtitle:(id)a7 keyAssetUUIDPrivate:(id)a8 keyAssetUUIDShared:(id)a9 type:(unint64_t)a10 assetsCountPrivate:(unint64_t)a11 assetsCountShared:(unint64_t)a12 sortDate:(id)a13;
- (PSIDate)endDate;
- (PSIDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)assetsCountPrivate;
- (unint64_t)assetsCountShared;
- (unint64_t)type;
@end

@implementation PSICollectionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetUUIDShared, 0);
  objc_storeStrong((id *)&self->_keyAssetUUIDPrivate, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)keyAssetUUIDShared
{
  return self->_keyAssetUUIDShared;
}

- (NSString)keyAssetUUIDPrivate
{
  return self->_keyAssetUUIDPrivate;
}

- (unint64_t)assetsCountShared
{
  return self->_assetsCountShared;
}

- (unint64_t)assetsCountPrivate
{
  return self->_assetsCountPrivate;
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (PSIDate)endDate
{
  return self->_endDate;
}

- (PSIDate)startDate
{
  return self->_startDate;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_uuid copy];
  v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  objc_storeStrong((id *)(v4 + 16), self->_startDate);
  objc_storeStrong((id *)(v4 + 24), self->_endDate);
  uint64_t v7 = [(NSString *)self->_title copy];
  v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_subtitle copy];
  v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  *(void *)(v4 + 48) = self->_type;
  *(void *)(v4 + 64) = self->_assetsCountPrivate;
  *(void *)(v4 + 72) = self->_assetsCountShared;
  uint64_t v11 = [(NSString *)self->_keyAssetUUIDPrivate copy];
  v12 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v11;

  uint64_t v13 = [(NSString *)self->_keyAssetUUIDShared copy];
  v14 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v13;

  uint64_t v15 = [(NSDate *)self->_sortDate copy];
  v16 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v15;

  return (id)v4;
}

- (PSICollectionResult)initWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 subtitle:(id)a7 keyAssetUUIDPrivate:(id)a8 keyAssetUUIDShared:(id)a9 type:(unint64_t)a10 assetsCountPrivate:(unint64_t)a11 assetsCountShared:(unint64_t)a12 sortDate:(id)a13
{
  id v40 = a3;
  id v19 = a4;
  id v20 = a5;
  id v39 = a6;
  id v38 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a13;
  v41.receiver = self;
  v41.super_class = (Class)PSICollectionResult;
  v24 = [(PSICollectionResult *)&v41 init];
  if (v24)
  {
    uint64_t v25 = [v40 copy];
    uuid = v24->_uuid;
    v24->_uuid = (NSString *)v25;

    objc_storeStrong((id *)&v24->_startDate, a4);
    objc_storeStrong((id *)&v24->_endDate, a5);
    uint64_t v27 = [v39 copy];
    title = v24->_title;
    v24->_title = (NSString *)v27;

    uint64_t v29 = [v38 copy];
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v29;

    v24->_type = a10;
    v24->_assetsCountPrivate = a11;
    v24->_assetsCountShared = a12;
    uint64_t v31 = [v21 copy];
    keyAssetUUIDPrivate = v24->_keyAssetUUIDPrivate;
    v24->_keyAssetUUIDPrivate = (NSString *)v31;

    uint64_t v33 = [v22 copy];
    keyAssetUUIDShared = v24->_keyAssetUUIDShared;
    v24->_keyAssetUUIDShared = (NSString *)v33;

    uint64_t v35 = [v23 copy];
    sortDate = v24->_sortDate;
    v24->_sortDate = (NSDate *)v35;
  }
  return v24;
}

@end