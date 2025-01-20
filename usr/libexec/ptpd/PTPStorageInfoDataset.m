@interface PTPStorageInfoDataset
- (BOOL)dirty;
- (BOOL)readOnlyObject;
- (NSMutableData)content;
- (NSString)storageDescription;
- (NSString)volumeLabel;
- (PTPStorageInfoDataset)init;
- (PTPStorageInfoDataset)initWithData:(id)a3;
- (PTPStorageInfoDataset)initWithMutableData:(id)a3;
- (id)description;
- (unint64_t)freeSpaceInBytes;
- (unint64_t)maxCapacity;
- (unsigned)accessCapability;
- (unsigned)filesystemType;
- (unsigned)freeSpaceInImages;
- (unsigned)storageType;
- (void)setAccessCapability:(unsigned __int16)a3;
- (void)setContent:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setFilesystemType:(unsigned __int16)a3;
- (void)setFreeSpaceInBytes:(unint64_t)a3;
- (void)setFreeSpaceInImages:(unsigned int)a3;
- (void)setMaxCapacity:(unint64_t)a3;
- (void)setReadOnlyObject:(BOOL)a3;
- (void)setStorageDescription:(id)a3;
- (void)setStorageType:(unsigned __int16)a3;
- (void)setVolumeLabel:(id)a3;
- (void)updateContent;
@end

@implementation PTPStorageInfoDataset

- (PTPStorageInfoDataset)init
{
  v6.receiver = self;
  v6.super_class = (Class)PTPStorageInfoDataset;
  v2 = [(PTPStorageInfoDataset *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:28];
    content = v2->_content;
    v2->_content = v3;

    *(_WORD *)&v2->_dirty = 1;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
  id v5 = a3;
  id v6 = [(NSMutableData *)self->_content bytes];
  v7 = (char *)[(NSMutableData *)self->_content length] + (void)v6;
  v12 = v6;
  self->_storageType = sub_10001F0E0((unint64_t *)&v12, (unint64_t)v7);
  self->_filesystemType = sub_10001F0E0((unint64_t *)&v12, (unint64_t)v7);
  self->_accessCapability = sub_10001F0E0((unint64_t *)&v12, (unint64_t)v7);
  self->_maxCapacity = sub_10001F15C((unint64_t *)&v12, (unint64_t)v7);
  self->_freeSpaceInBytes = sub_10001F15C((unint64_t *)&v12, (unint64_t)v7);
  self->_freeSpaceInImages = sub_10001F108((unint64_t *)&v12, (unint64_t)v7);
  sub_10001F270(&v12, (unint64_t)v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  storageDescription = self->_storageDescription;
  self->_storageDescription = v8;

  sub_10001F270(&v12, (unint64_t)v7);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  volumeLabel = self->_volumeLabel;
  self->_volumeLabel = v10;
}

- (PTPStorageInfoDataset)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTPStorageInfoDataset;
  id v5 = [(PTPStorageInfoDataset *)&v8 init];
  if (v5)
  {
    if ((unint64_t)[v4 length] < 0x1C)
    {

      id v5 = 0;
    }
    else
    {
      id v6 = [v4 mutableCopy];
      [(PTPStorageInfoDataset *)v5 setContent:v6];

      v5->_readOnlyObject = 1;
    }
  }

  return v5;
}

- (PTPStorageInfoDataset)initWithMutableData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PTPStorageInfoDataset;
  id v5 = [(PTPStorageInfoDataset *)&v7 init];
  if (v5)
  {
    if ((unint64_t)[v4 length] < 0x1C)
    {

      id v5 = 0;
    }
    else
    {
      [(PTPStorageInfoDataset *)v5 setContent:v4];
      v5->_readOnlyObject = 0;
    }
  }

  return v5;
}

- (void)updateContent
{
  NSUInteger v3 = [(NSString *)self->_storageDescription length];
  NSUInteger v4 = [(NSString *)self->_volumeLabel length];
  if (self->_dirty && !self->_readOnlyObject)
  {
    uint64_t v5 = 2 * v4 + 2;
    uint64_t v6 = 2 * v3 + 30;
    if (!v3) {
      uint64_t v6 = 28;
    }
    if (!v4) {
      uint64_t v5 = 0;
    }
    [(NSMutableData *)self->_content setLength:v5 + v6];
    objc_super v7 = [(NSMutableData *)self->_content mutableBytes];
    sub_10001F0B4(&v7, self->_storageType);
    sub_10001F0B4(&v7, self->_filesystemType);
    sub_10001F0B4(&v7, self->_accessCapability);
    sub_10001F184((void **)&v7, self->_maxCapacity);
    sub_10001F184((void **)&v7, self->_freeSpaceInBytes);
    sub_10001F130((_DWORD **)&v7, self->_freeSpaceInImages);
    sub_10001F2B8((unsigned char **)&v7, self->_storageDescription);
    sub_10001F2B8((unsigned char **)&v7, self->_volumeLabel);
  }
}

- (NSMutableData)content
{
  [(PTPStorageInfoDataset *)self updateContent];
  content = self->_content;

  return content;
}

- (id)description
{
  NSUInteger v3 = +[NSMutableString stringWithFormat:@"<PTPStorageInfoDataset %p>{\n  _storageType:        ", self];
  NSUInteger v4 = sub_100020B74(self->_storageType);
  [v3 appendFormat:@"%@\n  _filesystemType:     ", v4];

  uint64_t v5 = sub_100020BE0(self->_filesystemType);
  [v3 appendFormat:@"%@\n  _accessCapability:   ", v5];

  uint64_t v6 = sub_100020C88(self->_accessCapability);
  [v3 appendFormat:@"%@\n  _maxCapacity:        %llu\n  _freeSpaceInBytes:   %llu\n  _freeSpaceInImages:  %lu\n  _storageDescription: %@\n  _volumeLabel:        %@\n}", v6, self->_maxCapacity, self->_freeSpaceInBytes, self->_freeSpaceInImages, self->_storageDescription, self->_volumeLabel];

  return v3;
}

- (unsigned)storageType
{
  return self->_storageType;
}

- (void)setStorageType:(unsigned __int16)a3
{
  self->_storageType = a3;
  self->_dirty = 1;
}

- (unsigned)filesystemType
{
  return self->_filesystemType;
}

- (void)setFilesystemType:(unsigned __int16)a3
{
  self->_filesystemType = a3;
  self->_dirty = 1;
}

- (unsigned)accessCapability
{
  return self->_accessCapability;
}

- (void)setAccessCapability:(unsigned __int16)a3
{
  self->_accessCapability = a3;
  self->_dirty = 1;
}

- (unint64_t)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(unint64_t)a3
{
  self->_maxCapacity = a3;
  self->_dirty = 1;
}

- (unint64_t)freeSpaceInBytes
{
  return self->_freeSpaceInBytes;
}

- (void)setFreeSpaceInBytes:(unint64_t)a3
{
  self->_freeSpaceInBytes = a3;
  self->_dirty = 1;
}

- (unsigned)freeSpaceInImages
{
  return self->_freeSpaceInImages;
}

- (void)setFreeSpaceInImages:(unsigned int)a3
{
  self->_freeSpaceInImages = a3;
  self->_dirty = 1;
}

- (NSString)storageDescription
{
  return self->_storageDescription;
}

- (void)setStorageDescription:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_storageDescription = &self->_storageDescription;
  if (self->_storageDescription != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_storageDescription, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_storageDescription, v5);
}

- (NSString)volumeLabel
{
  return self->_volumeLabel;
}

- (void)setVolumeLabel:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_volumeLabel = &self->_volumeLabel;
  if (self->_volumeLabel != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_volumeLabel, a3);
    uint64_t v5 = v7;
    self->_dirty = 1;
  }

  _objc_release_x1(p_volumeLabel, v5);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)readOnlyObject
{
  return self->_readOnlyObject;
}

- (void)setReadOnlyObject:(BOOL)a3
{
  self->_readOnlyObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_volumeLabel, 0);

  objc_storeStrong((id *)&self->_storageDescription, 0);
}

@end