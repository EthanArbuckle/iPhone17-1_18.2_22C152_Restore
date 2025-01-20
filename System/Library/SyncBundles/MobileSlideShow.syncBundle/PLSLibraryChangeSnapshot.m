@interface PLSLibraryChangeSnapshot
+ (BOOL)number:(id)a3 equalsNumber:(id)a4;
+ (BOOL)string:(id)a3 equalsString:(id)a4;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)librarySnapshot;
- (BOOL)hasChangedObjects;
- (BOOL)isEqualToSnapshot:(id)a3;
- (BOOL)isFolderSync;
- (NSArray)orderedAlbums;
- (NSDictionary)albumsAndEventsByUUID;
- (NSDictionary)deletes;
- (NSDictionary)updates;
- (NSMutableDictionary)assetsByUUID;
- (NSString)libraryKind;
- (NSString)libraryUUID;
- (PLSLibraryChangeSnapshot)init;
- (PLSLibraryChangeSnapshot)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumsAndEventsByUUID:(id)a3;
- (void)setAssetsByUUID:(id)a3;
- (void)setDeletes:(id)a3;
- (void)setIsFolderSync:(BOOL)a3;
- (void)setLibraryKind:(id)a3;
- (void)setLibraryUUID:(id)a3;
- (void)setOrderedAlbums:(id)a3;
- (void)setUpdates:(id)a3;
@end

@implementation PLSLibraryChangeSnapshot

+ (BOOL)number:(id)a3 equalsNumber:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqualToNumber:a4];
  }
  else {
    return 1;
  }
}

+ (BOOL)string:(id)a3 equalsString:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqualToString:a4];
  }
  else {
    return 1;
  }
}

+ (id)librarySnapshot
{
  v2 = objc_alloc_init(PLSLibraryChangeSnapshot);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsByUUID, 0);
  objc_storeStrong((id *)&self->_albumsAndEventsByUUID, 0);
  objc_storeStrong((id *)&self->_orderedAlbums, 0);
  objc_storeStrong((id *)&self->_libraryKind, 0);
  objc_storeStrong((id *)&self->_libraryUUID, 0);
  objc_storeStrong((id *)&self->_deletes, 0);

  objc_storeStrong((id *)&self->_updates, 0);
}

- (void)setIsFolderSync:(BOOL)a3
{
  self->_isFolderSync = a3;
}

- (BOOL)isFolderSync
{
  return self->_isFolderSync;
}

- (void)setAssetsByUUID:(id)a3
{
}

- (NSMutableDictionary)assetsByUUID
{
  return self->_assetsByUUID;
}

- (void)setAlbumsAndEventsByUUID:(id)a3
{
}

- (NSDictionary)albumsAndEventsByUUID
{
  return self->_albumsAndEventsByUUID;
}

- (void)setOrderedAlbums:(id)a3
{
}

- (NSArray)orderedAlbums
{
  return self->_orderedAlbums;
}

- (void)setLibraryKind:(id)a3
{
}

- (NSString)libraryKind
{
  return self->_libraryKind;
}

- (void)setLibraryUUID:(id)a3
{
}

- (NSString)libraryUUID
{
  return self->_libraryUUID;
}

- (void)setDeletes:(id)a3
{
}

- (NSDictionary)deletes
{
  return self->_deletes;
}

- (void)setUpdates:(id)a3
{
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  v4 = (PLSLibraryChangeSnapshot *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  if (v4 == self)
  {
    char v23 = 1;
    goto LABEL_20;
  }
  v6 = [(PLSLibraryChangeSnapshot *)self libraryKind];
  v7 = [(PLSLibraryChangeSnapshot *)v5 libraryKind];
  unsigned __int8 v8 = +[PLSLibraryChangeSnapshot string:v6 equalsString:v7];

  if ((v8 & 1) == 0)
  {
    v25 = +[NSString stringWithFormat:@"snapshot libraryKind not equal"];
    v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_12;
  }
  v9 = [(PLSLibraryChangeSnapshot *)self libraryUUID];
  v10 = [(PLSLibraryChangeSnapshot *)v5 libraryUUID];
  unsigned __int8 v11 = +[PLSLibraryChangeSnapshot string:v9 equalsString:v10];

  if ((v11 & 1) == 0)
  {
    v25 = +[NSString stringWithFormat:@"snapshot libraryUUID not equal"];
    v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
LABEL_12:

    goto LABEL_19;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  v13 = [(PLSLibraryChangeSnapshot *)v5 orderedAlbums];
  v14 = [(PLSLibraryChangeSnapshot *)self orderedAlbums];
  id v15 = [v14 count];
  LOBYTE(v15) = v15 == [v13 count];

  if ((v15 & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"snapshot orderedAlbums count not equal"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v37 = 138412290;
      v38 = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%@", v37, 0xCu);
    }

    _Block_object_dispose(&buf, 8);
    goto LABEL_19;
  }
  uint64_t v16 = [(PLSLibraryChangeSnapshot *)self orderedAlbums];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_7078;
  v34[3] = &unk_24B98;
  id v17 = v13;
  id v35 = v17;
  p_long long buf = &buf;
  [(id)v16 enumerateObjectsUsingBlock:v34];

  LOBYTE(v16) = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;
  _Block_object_dispose(&buf, 8);
  if (v16)
  {
LABEL_19:
    char v23 = 0;
    goto LABEL_20;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  v19 = [(PLSLibraryChangeSnapshot *)v5 assetsByUUID];
  v20 = [(PLSLibraryChangeSnapshot *)self assetsByUUID];
  id v21 = [v20 count];
  LOBYTE(v21) = v21 == [v19 count];

  if (v21)
  {
    v22 = [(PLSLibraryChangeSnapshot *)self assetsByUUID];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_7200;
    v31[3] = &unk_24698;
    id v32 = v19;
    v33 = &buf;
    [v22 enumerateKeysAndObjectsUsingBlock:v31];

    char v23 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    v24 = v32;
  }
  else
  {
    v24 = +[NSString stringWithFormat:@"snapshot assetsByUUID count not equal"];
    v30 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v37 = 138412290;
      v38 = v24;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "%@", v37, 0xCu);
    }

    char v23 = 0;
  }

  _Block_object_dispose(&buf, 8);
LABEL_20:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLSLibraryChangeSnapshot *)self updates];
  [v4 encodeObject:v5 forKey:@"PLSLibrarySnapshotUpdatesKey"];

  v6 = [(PLSLibraryChangeSnapshot *)self deletes];
  [v4 encodeObject:v6 forKey:@"PLSLibrarySnapshotDeletesKey"];

  v7 = [(PLSLibraryChangeSnapshot *)self libraryUUID];
  [v4 encodeObject:v7 forKey:@"PLSLibraryChangeSnapshotLibraryUUIDKey"];

  id v8 = [(PLSLibraryChangeSnapshot *)self libraryKind];
  [v4 encodeObject:v8 forKey:@"PLSLibraryChangeSnapshotLibraryKindKey"];
}

- (PLSLibraryChangeSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLSLibraryChangeSnapshot;
  v5 = [(PLSLibraryChangeSnapshot *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"PLSLibrarySnapshotUpdatesKey"];
    updates = v5->_updates;
    v5->_updates = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v10 forKey:@"PLSLibrarySnapshotDeletesKey"];
    deletes = v5->_deletes;
    v5->_deletes = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSLibraryChangeSnapshotLibraryUUIDKey"];
    libraryUUID = v5->_libraryUUID;
    v5->_libraryUUID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLSLibraryChangeSnapshotLibraryKindKey"];
    libraryKind = v5->_libraryKind;
    v5->_libraryKind = (NSString *)v17;
  }
  return v5;
}

- (BOOL)hasChangedObjects
{
  v3 = [(PLSLibraryChangeSnapshot *)self updates];
  if ([v3 count])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(PLSLibraryChangeSnapshot *)self deletes];
    char v4 = [v5 count] != 0;
  }
  return v4;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)PLSLibraryChangeSnapshot;
  v3 = [(PLSLibraryChangeSnapshot *)&v10 description];
  char v4 = [(PLSLibraryChangeSnapshot *)self libraryUUID];
  v5 = [(PLSLibraryChangeSnapshot *)self libraryKind];
  uint64_t v6 = [(PLSLibraryChangeSnapshot *)self updates];
  uint64_t v7 = [(PLSLibraryChangeSnapshot *)self deletes];
  uint64_t v8 = +[NSString stringWithFormat:@"%@, libraryUUID: %@ libraryKind:%@\nupdates: %@\ndeletes: %@", v3, v4, v5, v6, v7];

  return v8;
}

- (PLSLibraryChangeSnapshot)init
{
  v14.receiver = self;
  v14.super_class = (Class)PLSLibraryChangeSnapshot;
  v2 = [(PLSLibraryChangeSnapshot *)&v14 init];
  v3 = v2;
  if (v2)
  {
    updates = v2->_updates;
    v2->_updates = (NSDictionary *)&__NSDictionary0__struct;

    deletes = v3->_deletes;
    v3->_deletes = (NSDictionary *)&__NSDictionary0__struct;

    libraryUUID = v3->_libraryUUID;
    v3->_libraryUUID = (NSString *)&stru_24CC0;

    libraryKind = v3->_libraryKind;
    v3->_libraryKind = (NSString *)&stru_24CC0;

    orderedAlbums = v3->_orderedAlbums;
    v3->_orderedAlbums = (NSArray *)&__NSArray0__struct;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    albumsAndEventsByUUID = v3->_albumsAndEventsByUUID;
    v3->_albumsAndEventsByUUID = (NSDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    assetsByUUID = v3->_assetsByUUID;
    v3->_assetsByUUID = (NSMutableDictionary *)v11;
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLSLibraryChangeSnapshot;
  id v3 = a3;
  char v4 = objc_msgSendSuper2(&v9, "keyPathsForValuesAffectingValueForKey:", v3);
  unsigned int v5 = [v3 isEqualToString:@"hasChangedObjects"];

  if (v5)
  {
    uint64_t v6 = +[NSSet setWithObjects:@"updates", @"deletes", 0, v9.receiver, v9.super_class];
    uint64_t v7 = [v4 setByAddingObjectsFromSet:v6];

    char v4 = (void *)v7;
  }

  return v4;
}

@end