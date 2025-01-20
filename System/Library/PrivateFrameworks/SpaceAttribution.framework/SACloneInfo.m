@interface SACloneInfo
+ (id)newWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5 dirStatKey:(unint64_t)a6 attributionTag:(unint64_t)a7 clonePath:(id)a8;
- (NSString)clonePath;
- (SACloneInfo)initWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5 dirStatKey:(unint64_t)a6 attributionTag:(unint64_t)a7 clonePath:(id)a8;
- (id)generateDictionary;
- (int64_t)attributionTagID;
- (int64_t)cloneSize;
- (int64_t)dataSize;
- (int64_t)dirStatKey;
- (int64_t)purgeableSize;
- (void)setAttributionTagID:(int64_t)a3;
- (void)setClonePath:(id)a3;
- (void)setCloneSize:(int64_t)a3;
- (void)setDataSize:(int64_t)a3;
- (void)setDirStatKey:(int64_t)a3;
- (void)setPurgeableSize:(int64_t)a3;
@end

@implementation SACloneInfo

- (SACloneInfo)initWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5 dirStatKey:(unint64_t)a6 attributionTag:(unint64_t)a7 clonePath:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SACloneInfo;
  v16 = [(SACloneInfo *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_dataSize = a3;
    v16->_cloneSize = a4;
    v16->_purgeableSize = a5;
    objc_storeStrong((id *)&v16->_clonePath, a8);
    v17->_dirStatKey = a6;
    v17->_attributionTagID = a7;
  }

  return v17;
}

+ (id)newWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5 dirStatKey:(unint64_t)a6 attributionTag:(unint64_t)a7 clonePath:(id)a8
{
  id v14 = a8;
  id v15 = [objc_alloc((Class)a1) initWithDataSize:a3 cloneSize:a4 purgeableSize:a5 dirStatKey:a6 attributionTag:a7 clonePath:v14];

  return v15;
}

- (id)generateDictionary
{
  v11[0] = @"dataSize";
  v3 = +[NSNumber numberWithLongLong:self->_dataSize];
  v12[0] = v3;
  v11[1] = @"cloneSize";
  v4 = +[NSNumber numberWithLongLong:self->_cloneSize];
  v12[1] = v4;
  v11[2] = @"purgeableSize";
  v5 = +[NSNumber numberWithLongLong:self->_purgeableSize];
  v12[2] = v5;
  v11[3] = @"dirStatsKey";
  v6 = +[NSNumber numberWithLongLong:self->_dirStatKey];
  v12[3] = v6;
  v11[4] = @"attributionTag";
  v7 = +[NSNumber numberWithLongLong:self->_attributionTagID];
  v11[5] = @"clonePath";
  clonePath = self->_clonePath;
  v12[4] = v7;
  v12[5] = clonePath;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_dataSize = a3;
}

- (int64_t)cloneSize
{
  return self->_cloneSize;
}

- (void)setCloneSize:(int64_t)a3
{
  self->_cloneSize = a3;
}

- (int64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(int64_t)a3
{
  self->_purgeableSize = a3;
}

- (int64_t)dirStatKey
{
  return self->_dirStatKey;
}

- (void)setDirStatKey:(int64_t)a3
{
  self->_dirStatKey = a3;
}

- (int64_t)attributionTagID
{
  return self->_attributionTagID;
}

- (void)setAttributionTagID:(int64_t)a3
{
  self->_attributionTagID = a3;
}

- (NSString)clonePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClonePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end