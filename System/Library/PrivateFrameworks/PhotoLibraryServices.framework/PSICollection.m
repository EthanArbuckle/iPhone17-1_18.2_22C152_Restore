@interface PSICollection
- (NSDate)sortDate;
- (NSString)subtitle;
- (NSString)title;
- (PSIAsset)keyAssetPrivate;
- (PSIAsset)keyAssetShared;
- (PSICollection)initWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 subtitle:(id)a7 keyAssetPrivate:(id)a8 keyAssetShared:(id)a9 type:(unint64_t)a10 assetsCountPrivate:(unint64_t)a11 assetsCountShared:(unint64_t)a12 sortDate:(id)a13;
- (PSIDate)endDate;
- (PSIDate)startDate;
- (id)_initForCopy:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)assetsCountPrivate;
- (unint64_t)assetsCountShared;
- (unint64_t)objectType;
- (unint64_t)type;
- (void)setKeyAssetPrivate:(id)a3;
- (void)setKeyAssetShared:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PSICollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setKeyAssetShared:(id)a3
{
}

- (PSIAsset)keyAssetShared
{
  return self->_keyAssetShared;
}

- (void)setKeyAssetPrivate:(id)a3
{
}

- (PSIAsset)keyAssetPrivate
{
  return self->_keyAssetPrivate;
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
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (PSIDate)endDate
{
  return (PSIDate *)objc_getProperty(self, a2, 48, 1);
}

- (PSIDate)startDate
{
  return (PSIDate *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)objectType
{
  return 1;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = [(PSIObject *)self uuid];
  [v3 appendFormat:@"UUID: %@, ", v4];

  [v3 appendFormat:@"Title: %@, ", self->_title];
  [v3 appendFormat:@"subtitle: %@, ", self->_subtitle];
  v5 = [(PSIObject *)self->_keyAssetPrivate uuid];
  [v3 appendFormat:@"keyAssetUUIDPrivate: %@, ", v5];

  v6 = [(PSIObject *)self->_keyAssetShared uuid];
  [v3 appendFormat:@"keyAssetUUIDShared: %@, ", v6];

  [v3 appendFormat:@"assetsCountPrivate: %lu, ", self->_assetsCountPrivate];
  [v3 appendFormat:@"assetsCountShared: %lu, ", self->_assetsCountShared];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PSICollection;
  v4 = [(PSIObject *)&v14 copyWithZone:a3];
  objc_storeStrong(v4 + 5, self->_startDate);
  objc_storeStrong(v4 + 6, self->_endDate);
  uint64_t v5 = [(NSString *)self->_title copy];
  id v6 = v4[7];
  v4[7] = (id)v5;

  uint64_t v7 = [(NSString *)self->_subtitle copy];
  id v8 = v4[8];
  v4[8] = (id)v7;

  v4[9] = self->_type;
  uint64_t v9 = [(PSIAsset *)self->_keyAssetPrivate copy];
  id v10 = v4[13];
  v4[13] = (id)v9;

  uint64_t v11 = [(PSIAsset *)self->_keyAssetShared copy];
  id v12 = v4[14];
  v4[14] = (id)v11;

  v4[11] = self->_assetsCountPrivate;
  v4[12] = self->_assetsCountShared;
  objc_storeStrong(v4 + 10, self->_sortDate);
  return v4;
}

- (id)_initForCopy:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PSICollection;
  v4 = -[PSIObject _initForCopy:](&v8, sel__initForCopy_);
  if (v4 && !a3)
  {
    id v5 = objc_alloc_init(NSString);
    id v6 = (void *)v4[7];
    v4[7] = v5;
  }
  return v4;
}

- (PSICollection)initWithUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 subtitle:(id)a7 keyAssetPrivate:(id)a8 keyAssetShared:(id)a9 type:(unint64_t)a10 assetsCountPrivate:(unint64_t)a11 assetsCountShared:(unint64_t)a12 sortDate:(id)a13
{
  id v35 = a4;
  id v20 = a5;
  id v37 = a6;
  id v36 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a13;
  v38.receiver = self;
  v38.super_class = (Class)PSICollection;
  v24 = [(PSIObject *)&v38 initWithUUID:a3];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_startDate, a4);
    objc_storeStrong((id *)&v25->_endDate, a5);
    uint64_t v26 = [v37 copy];
    title = v25->_title;
    v25->_title = (NSString *)v26;

    uint64_t v28 = [v36 copy];
    subtitle = v25->_subtitle;
    v25->_subtitle = (NSString *)v28;

    v25->_type = a10;
    v25->_assetsCountPrivate = a11;
    v25->_assetsCountShared = a12;
    uint64_t v30 = [v21 copy];
    keyAssetPrivate = v25->_keyAssetPrivate;
    v25->_keyAssetPrivate = (PSIAsset *)v30;

    uint64_t v32 = [v22 copy];
    keyAssetShared = v25->_keyAssetShared;
    v25->_keyAssetShared = (PSIAsset *)v32;

    objc_storeStrong((id *)&v25->_sortDate, a13);
  }

  return v25;
}

@end