@interface PTPCameraItem
+ (id)UTTypeWithFilenameExtension:(id)a3;
- (BOOL)isInLocalCache;
- (BOOL)locked;
- (NSMutableDictionary)metadata;
- (NSString)exifCreationDate;
- (NSString)exifCreationDateTime;
- (NSString)exifModificationDate;
- (NSString)exifModificationDateTime;
- (NSString)fingerprint;
- (NSString)mediaItemType;
- (NSString)name;
- (NSString)path;
- (PTPCameraItem)initWithStorageID:(unsigned int)a3 objHandle:(unsigned int)a4 parent:(id)a5 initiator:(id)a6;
- (PTPCameraStorage)storage;
- (PTPInitiator)initiator;
- (id)info;
- (id)parent;
- (unint64_t)parentIndex;
- (unint64_t)size;
- (unint64_t)type;
- (unint64_t)unsignedIntegerValue;
- (unsigned)objHandle;
- (unsigned)storageID;
- (void)setExifCreationDate:(id)a3;
- (void)setExifCreationDateTime:(id)a3;
- (void)setExifModificationDate:(id)a3;
- (void)setExifModificationDateTime:(id)a3;
- (void)setFingerprint:(id)a3;
- (void)setInfo:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setObjHandle:(unsigned int)a3;
- (void)setParent:(id)a3;
- (void)setPath:(id)a3;
- (void)setStorageID:(unsigned int)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PTPCameraItem

+ (id)UTTypeWithFilenameExtension:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_1000634C0 == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(&qword_1000634C0, &stru_10004CCF0);
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000634B8);
  v5 = [(id)qword_1000634B0 objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = +[UTType typeWithFilenameExtension:v4];
    if (v5) {
      [(id)qword_1000634B0 setObject:v5 forKeyedSubscript:v4];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000634B8);
LABEL_9:

  return v5;
}

- (NSString)name
{
  v2 = [(PTPCameraItem *)self info];
  id v3 = [v2 filename];

  return (NSString *)v3;
}

- (unint64_t)size
{
  v2 = [(PTPCameraItem *)self info];
  id v3 = [v2 objectCompressedSize64];

  return (unint64_t)v3;
}

- (PTPCameraItem)initWithStorageID:(unsigned int)a3 objHandle:(unsigned int)a4 parent:(id)a5 initiator:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PTPCameraItem;
  v12 = [(PTPCameraItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = 0;
    objc_storeWeak(&v12->_parent, v10);
    v13->_storageID = a3;
    v13->_objHandle = a4;
    objc_storeWeak((id *)&v13->_initiator, v11);
  }

  return v13;
}

- (BOOL)isInLocalCache
{
  return self->_storageID == 1819239276;
}

- (PTPCameraStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initiator);
  v4 = [WeakRetained storageForStorageID:self->_storageID];

  return (PTPCameraStorage *)v4;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_objHandle;
}

- (NSString)mediaItemType
{
  return (NSString *)@"item";
}

- (BOOL)locked
{
  id v3 = [(PTPCameraItem *)self storage];
  if ([v3 locked])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(PTPCameraItem *)self info];
    BOOL v4 = [v5 protectionStatus] == 1;
  }
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained(&self->_parent);

  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)objHandle
{
  return self->_objHandle;
}

- (void)setObjHandle:(unsigned int)a3
{
  self->_objHandle = a3;
}

- (id)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (PTPInitiator)initiator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initiator);

  return (PTPInitiator *)WeakRetained;
}

- (void)setInitiator:(id)a3
{
}

- (unint64_t)parentIndex
{
  return self->_parentIndex;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
}

- (NSString)exifCreationDateTime
{
  return self->_exifCreationDateTime;
}

- (void)setExifCreationDateTime:(id)a3
{
}

- (NSString)exifModificationDateTime
{
  return self->_exifModificationDateTime;
}

- (void)setExifModificationDateTime:(id)a3
{
}

- (NSString)exifModificationDate
{
  return self->_exifModificationDate;
}

- (void)setExifModificationDate:(id)a3
{
}

- (NSString)exifCreationDate
{
  return self->_exifCreationDate;
}

- (void)setExifCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exifCreationDate, 0);
  objc_storeStrong((id *)&self->_exifModificationDate, 0);
  objc_storeStrong((id *)&self->_exifModificationDateTime, 0);
  objc_storeStrong((id *)&self->_exifCreationDateTime, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_initiator);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_info, 0);

  objc_destroyWeak(&self->_parent);
}

@end