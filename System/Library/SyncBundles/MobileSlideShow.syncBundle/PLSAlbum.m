@interface PLSAlbum
+ (BOOL)supportsSecureCoding;
+ (id)album;
+ (id)albumWithUUID:(id)a3;
- (BOOL)isEqualToAlbum:(id)a3;
- (NSArray)assetUUIDs;
- (NSNumber)albumKeyAssetFaceIndex;
- (NSNumber)albumSubclass;
- (NSString)keyAssetUUID;
- (NSString)name;
- (NSString)parentUUID;
- (PLSAlbum)init;
- (PLSAlbum)initWithCoder:(id)a3;
- (PLSAlbum)initWithUUID:(id)a3;
- (id)_itemType;
- (id)description;
- (id)initFromPropertyList:(id)a3;
- (id)propertyList;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumKeyAssetFaceIndex:(id)a3;
- (void)setAlbumSubclass:(id)a3;
- (void)setAssetUUIDs:(id)a3;
- (void)setKeyAssetUUID:(id)a3;
- (void)setName:(id)a3;
- (void)setParentUUID:(id)a3;
@end

@implementation PLSAlbum

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_albumKeyAssetFaceIndex, 0);
  objc_storeStrong((id *)&self->_albumSubclass, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setKeyAssetUUID:(id)a3
{
}

- (NSString)keyAssetUUID
{
  return self->_keyAssetUUID;
}

- (void)setAlbumKeyAssetFaceIndex:(id)a3
{
}

- (NSNumber)albumKeyAssetFaceIndex
{
  return self->_albumKeyAssetFaceIndex;
}

- (void)setAlbumSubclass:(id)a3
{
}

- (NSNumber)albumSubclass
{
  return self->_albumSubclass;
}

- (void)setParentUUID:(id)a3
{
}

- (NSString)parentUUID
{
  return self->_parentUUID;
}

- (void)setAssetUUIDs:(id)a3
{
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqualToAlbum:(id)a3
{
  v4 = (PLSAlbum *)a3;
  if (!v4) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"otherAlbum isn't an album"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_29;
  }
  if (v4 == self)
  {
    char v25 = 1;
    goto LABEL_31;
  }
  v5 = [(PLSAlbum *)self name];
  v6 = [(PLSAlbum *)v4 name];
  unsigned __int8 v7 = +[PLSLibraryChangeSnapshot string:v5 equalsString:v6];

  if ((v7 & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"album name not equal"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_29;
  }
  v8 = [(PLSAlbum *)self albumSubclass];
  v9 = [(PLSAlbum *)v4 albumSubclass];
  unsigned __int8 v10 = +[PLSLibraryChangeSnapshot number:v8 equalsNumber:v9];

  if ((v10 & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"album albumSubclass not equal"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_29;
  }
  v11 = [(PLSAlbum *)self albumKeyAssetFaceIndex];
  v12 = [(PLSAlbum *)v4 albumKeyAssetFaceIndex];
  unsigned __int8 v13 = +[PLSLibraryChangeSnapshot number:v11 equalsNumber:v12];

  if ((v13 & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"album albumKeyAssetFaceIndex not equal"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_29;
  }
  v14 = [(PLSAlbum *)self parentUUID];
  v15 = [(PLSAlbum *)v4 parentUUID];
  unsigned __int8 v16 = +[PLSLibraryChangeSnapshot string:v14 equalsString:v15];

  if ((v16 & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"album parentUUID not equal"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_29;
  }
  v17 = [(PLSAlbum *)self keyAssetUUID];
  v18 = [(PLSAlbum *)v4 keyAssetUUID];
  unsigned __int8 v19 = +[PLSLibraryChangeSnapshot string:v17 equalsString:v18];

  if ((v19 & 1) == 0)
  {
    v27 = +[NSString stringWithFormat:@"album keyAssetUUID not equal"];
    v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
LABEL_29:

LABEL_30:
    char v25 = 0;
    goto LABEL_31;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  v21 = [(PLSAlbum *)v4 assetUUIDs];
  v22 = [(PLSAlbum *)self assetUUIDs];
  id v23 = [v22 count];
  LOBYTE(v23) = v23 == [v21 count];

  if (v23)
  {
    v24 = [(PLSAlbum *)self assetUUIDs];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_4A88;
    v31[3] = &unk_24B98;
    id v32 = v21;
    p_long long buf = &buf;
    [v24 enumerateObjectsUsingBlock:v31];

    char v25 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    v26 = v32;
  }
  else
  {
    v26 = +[NSString stringWithFormat:@"album assetUUIDs count not equal"];
    v30 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = v26;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "%@", v34, 0xCu);
    }

    char v25 = 0;
  }

  _Block_object_dispose(&buf, 8);
LABEL_31:

  return v25;
}

- (id)_itemType
{
  return kPLSTransportAlbumItemType;
}

- (id)propertyList
{
  v12.receiver = self;
  v12.super_class = (Class)PLSAlbum;
  v3 = [(PLSItem *)&v12 propertyList];
  v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:kPLSAlbumNameKey];
  }
  assetUUIDs = self->_assetUUIDs;
  if (assetUUIDs) {
    [v4 setObject:assetUUIDs forKey:kPLSAlbumAssetUUIDsKey];
  }
  parentUUID = self->_parentUUID;
  if (parentUUID) {
    [v4 setObject:parentUUID forKey:kPLSAlbumParentUUIDKey];
  }
  albumSubclass = self->_albumSubclass;
  if (albumSubclass) {
    [v4 setObject:albumSubclass forKey:kPLSAlbumSubclassKey];
  }
  albumKeyAssetFaceIndex = self->_albumKeyAssetFaceIndex;
  if (albumKeyAssetFaceIndex) {
    [v4 setObject:albumKeyAssetFaceIndex forKey:kPLSAlbumKeyAssetFaceIndexKey];
  }
  keyAssetUUID = self->_keyAssetUUID;
  if (keyAssetUUID) {
    [v4 setObject:keyAssetUUID forKey:kPLSKeyAssetUUIDKey];
  }

  return v4;
}

- (id)initFromPropertyList:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLSAlbum;
  v5 = [(PLSItem *)&v19 initFromPropertyList:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:kPLSAlbumNameKey];
    unsigned __int8 v7 = (void *)v5[4];
    v5[4] = v6;

    uint64_t v8 = [v4 objectForKey:kPLSAlbumAssetUUIDsKey];
    v9 = (void *)v5[5];
    v5[5] = v8;

    uint64_t v10 = [v4 objectForKey:kPLSAlbumParentUUIDKey];
    v11 = (void *)v5[6];
    v5[6] = v10;

    uint64_t v12 = [v4 objectForKey:kPLSAlbumSubclassKey];
    unsigned __int8 v13 = (void *)v5[7];
    v5[7] = v12;

    uint64_t v14 = [v4 objectForKey:kPLSAlbumKeyAssetFaceIndexKey];
    v15 = (void *)v5[8];
    v5[8] = v14;

    uint64_t v16 = [v4 objectForKey:kPLSKeyAssetUUIDKey];
    v17 = (void *)v5[9];
    v5[9] = v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLSAlbum *)self name];
  [v4 encodeObject:v5 forKey:kPLSAlbumNameKey];

  uint64_t v6 = [(PLSAlbum *)self assetUUIDs];
  [v4 encodeObject:v6 forKey:kPLSAlbumAssetUUIDsKey];

  unsigned __int8 v7 = [(PLSAlbum *)self parentUUID];
  [v4 encodeObject:v7 forKey:kPLSAlbumParentUUIDKey];

  uint64_t v8 = [(PLSAlbum *)self albumSubclass];
  [v4 encodeObject:v8 forKey:kPLSAlbumSubclassKey];

  v9 = [(PLSAlbum *)self albumKeyAssetFaceIndex];
  [v4 encodeObject:v9 forKey:kPLSAlbumKeyAssetFaceIndexKey];

  uint64_t v10 = [(PLSAlbum *)self keyAssetUUID];
  [v4 encodeObject:v10 forKey:kPLSKeyAssetUUIDKey];

  v11.receiver = self;
  v11.super_class = (Class)PLSAlbum;
  [(PLSItem *)&v11 encodeWithCoder:v4];
}

- (PLSAlbum)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLSAlbum;
  v5 = [(PLSItem *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAlbumNameKey];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodePropertyListForKey:kPLSAlbumAssetUUIDsKey];
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAlbumParentUUIDKey];
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAlbumSubclassKey];
    albumSubclass = v5->_albumSubclass;
    v5->_albumSubclass = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAlbumKeyAssetFaceIndexKey];
    albumKeyAssetFaceIndex = v5->_albumKeyAssetFaceIndex;
    v5->_albumKeyAssetFaceIndex = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSKeyAssetUUIDKey];
    keyAssetUUID = v5->_keyAssetUUID;
    v5->_keyAssetUUID = (NSString *)v16;
  }
  return v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLSAlbum;
  v3 = [(PLSItem *)&v8 description];
  id v4 = [(PLSAlbum *)self name];
  v5 = [(PLSAlbum *)self albumSubclass];
  uint64_t v6 = +[NSString stringWithFormat:@"Album - %@, name: %@ subclass type:(%@)", v3, v4, v5];

  return v6;
}

- (PLSAlbum)initWithUUID:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PLSAlbum;
  v3 = [(PLSItem *)&v12 initWithUUID:a3];
  id v4 = v3;
  if (v3)
  {
    name = v3->_name;
    v3->_name = (NSString *)&stru_24CC0;

    assetUUIDs = v4->_assetUUIDs;
    v4->_assetUUIDs = (NSArray *)&__NSArray0__struct;

    parentUUID = v4->_parentUUID;
    v4->_parentUUID = 0;

    albumSubclass = v4->_albumSubclass;
    v4->_albumSubclass = (NSNumber *)&off_25BE0;

    albumKeyAssetFaceIndex = v4->_albumKeyAssetFaceIndex;
    v4->_albumKeyAssetFaceIndex = 0;

    keyAssetUUID = v4->_keyAssetUUID;
    v4->_keyAssetUUID = 0;
  }
  return v4;
}

- (PLSAlbum)init
{
  v3 = +[PLSUUID generateUUIDAsString];
  id v4 = [(PLSAlbum *)self initWithUUID:v3];

  return v4;
}

+ (id)albumWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = [[PLSAlbum alloc] initWithUUID:v3];

  return v4;
}

+ (id)album
{
  v2 = objc_alloc_init(PLSAlbum);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end