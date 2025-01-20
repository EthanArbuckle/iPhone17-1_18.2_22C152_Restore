@interface SAItemSizeInfo
- (BOOL)enabledDirStat;
- (BOOL)failedDirStat;
- (BOOL)isFileCloned;
- (BOOL)isFilePurgeable;
- (BOOL)skippedDirStat;
- (BOOL)usedDirStat;
- (NSString)volumePath;
- (SAItemSizeInfo)init;
- (SAItemSizeInfo)initWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5;
- (id)generateDictionary:(id)a3;
- (int64_t)cloneSize;
- (int64_t)dataSize;
- (int64_t)physicalSize;
- (int64_t)purgeableSize;
- (unint64_t)dirstatsID;
- (void)setCloneSize:(int64_t)a3;
- (void)setDataSize:(int64_t)a3;
- (void)setDirstatsID:(unint64_t)a3;
- (void)setEnabledDirStat:(BOOL)a3;
- (void)setFailedDirStat:(BOOL)a3;
- (void)setIsFileCloned:(BOOL)a3;
- (void)setIsFilePurgeable:(BOOL)a3;
- (void)setPhysicalSize:(int64_t)a3;
- (void)setPurgeableSize:(int64_t)a3;
- (void)setSkippedDirStat:(BOOL)a3;
- (void)setUsedDirStat:(BOOL)a3;
- (void)setVolumePath:(id)a3;
- (void)updateWithSizeInfo:(id)a3;
@end

@implementation SAItemSizeInfo

- (SAItemSizeInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)SAItemSizeInfo;
  v2 = [(SAItemSizeInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_failedDirStat = 0;
    *(_DWORD *)&v2->_isFileCloned = 0;
    *(_OWORD *)&v2->_physicalSize = 0u;
    *(_OWORD *)&v2->_cloneSize = 0u;
    volumePath = v2->_volumePath;
    v2->_dirstatsID = 0;
    v2->_volumePath = 0;
  }
  return v3;
}

- (SAItemSizeInfo)initWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SAItemSizeInfo;
  v8 = [(SAItemSizeInfo *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_cloneSize = a4;
    v8->_dataSize = a3;
    v8->_purgeableSize = a5;
    v10 = v8;
  }

  return v9;
}

- (void)updateWithSizeInfo:(id)a3
{
  id v4 = a3;
  -[SAItemSizeInfo setDataSize:](self, "setDataSize:", (char *)[v4 dataSize] + -[SAItemSizeInfo dataSize](self, "dataSize"));
  -[SAItemSizeInfo setCloneSize:](self, "setCloneSize:", (char *)[v4 cloneSize] + -[SAItemSizeInfo cloneSize](self, "cloneSize"));
  -[SAItemSizeInfo setPhysicalSize:](self, "setPhysicalSize:", (char *)[v4 physicalSize] + -[SAItemSizeInfo physicalSize](self, "physicalSize"));
  v5 = (char *)[v4 purgeableSize];

  objc_super v6 = &v5[[(SAItemSizeInfo *)self purgeableSize]];
  [(SAItemSizeInfo *)self setPurgeableSize:v6];
}

- (id)generateDictionary:(id)a3
{
  int64_t dataSize = self->_dataSize;
  id v16 = a3;
  v17 = +[NSNumber numberWithLongLong:dataSize];
  v18 = +[NSNumber numberWithLongLong:self->_cloneSize];
  v15 = +[NSNumber numberWithLongLong:self->_purgeableSize];
  v14 = +[NSNumber numberWithLongLong:self->_physicalSize];
  v5 = +[NSNumber numberWithUnsignedLongLong:self->_dirstatsID];
  objc_super v6 = +[NSNumber numberWithBool:self->_usedDirStat];
  v7 = +[NSNumber numberWithBool:self->_enabledDirStat];
  v8 = +[NSNumber numberWithBool:self->_failedDirStat];
  v9 = +[NSNumber numberWithBool:self->_skippedDirStat];
  v10 = +[NSNumber numberWithBool:self->_isFileCloned];
  v11 = +[NSNumber numberWithBool:self->_isFilePurgeable];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v16, @"bundles", v17, @"dataSize", v18, @"cloneSize", v15, @"purgeableSize", v14, @"physicalSize", v5, @"dirstatsID", v6, @"usedDirStat", v7, @"enabledDirStat", v8,
    @"failedDirStat",
    v9,
    @"skippedDirStat",
    v10,
    @"isFileCloned",
    v11,
    @"isFilePurgeable",
  objc_super v12 = 0);

  return v12;
}

- (int64_t)physicalSize
{
  return self->_physicalSize;
}

- (void)setPhysicalSize:(int64_t)a3
{
  self->_physicalSize = a3;
}

- (int64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(int64_t)a3
{
  self->_purgeableSize = a3;
}

- (int64_t)cloneSize
{
  return self->_cloneSize;
}

- (void)setCloneSize:(int64_t)a3
{
  self->_cloneSize = a3;
}

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_int64_t dataSize = a3;
}

- (unint64_t)dirstatsID
{
  return self->_dirstatsID;
}

- (void)setDirstatsID:(unint64_t)a3
{
  self->_dirstatsID = a3;
}

- (BOOL)isFileCloned
{
  return self->_isFileCloned;
}

- (void)setIsFileCloned:(BOOL)a3
{
  self->_isFileCloned = a3;
}

- (BOOL)isFilePurgeable
{
  return self->_isFilePurgeable;
}

- (void)setIsFilePurgeable:(BOOL)a3
{
  self->_isFilePurgeable = a3;
}

- (BOOL)usedDirStat
{
  return self->_usedDirStat;
}

- (void)setUsedDirStat:(BOOL)a3
{
  self->_usedDirStat = a3;
}

- (BOOL)enabledDirStat
{
  return self->_enabledDirStat;
}

- (void)setEnabledDirStat:(BOOL)a3
{
  self->_enabledDirStat = a3;
}

- (BOOL)failedDirStat
{
  return self->_failedDirStat;
}

- (void)setFailedDirStat:(BOOL)a3
{
  self->_failedDirStat = a3;
}

- (BOOL)skippedDirStat
{
  return self->_skippedDirStat;
}

- (void)setSkippedDirStat:(BOOL)a3
{
  self->_skippedDirStat = a3;
}

- (NSString)volumePath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVolumePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end