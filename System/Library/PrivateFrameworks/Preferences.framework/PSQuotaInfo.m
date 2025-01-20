@interface PSQuotaInfo
- (PSQuotaInfo)init;
- (unint64_t)storageInUseForMediaKind:(int64_t)a3;
- (unint64_t)totalStorage;
- (unint64_t)usedStorage;
- (void)setStorageInUse:(unint64_t)a3 forMediaKind:(int64_t)a4;
- (void)setTotalStorage:(unint64_t)a3;
- (void)setUsedStorage:(unint64_t)a3;
@end

@implementation PSQuotaInfo

- (PSQuotaInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSQuotaInfo;
  v2 = [(PSQuotaInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mediaKindDict = v2->_mediaKindDict;
    v2->_mediaKindDict = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setStorageInUse:(unint64_t)a3 forMediaKind:(int64_t)a4
{
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  mediaKindDict = self->_mediaKindDict;
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  [(NSMutableDictionary *)mediaKindDict setObject:v8 forKeyedSubscript:v7];
}

- (unint64_t)storageInUseForMediaKind:(int64_t)a3
{
  mediaKindDict = self->_mediaKindDict;
  v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)mediaKindDict objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (unint64_t)totalStorage
{
  return self->_totalStorage;
}

- (void)setTotalStorage:(unint64_t)a3
{
  self->_totalStorage = a3;
}

- (unint64_t)usedStorage
{
  return self->_usedStorage;
}

- (void)setUsedStorage:(unint64_t)a3
{
  self->_usedStorage = a3;
}

- (void).cxx_destruct
{
}

@end