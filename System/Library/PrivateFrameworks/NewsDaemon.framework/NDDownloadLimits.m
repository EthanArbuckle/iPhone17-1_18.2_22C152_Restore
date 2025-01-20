@interface NDDownloadLimits
+ (BOOL)supportsSecureCoding;
+ (NDDownloadLimits)defaultLimits;
- (BOOL)isEqual:(id)a3;
- (NDDownloadLimits)initWithCoder:(id)a3;
- (NDDownloadLimits)initWithMinDeviceStorage:(int64_t)a3 maxDownloadStorage:(int64_t)a4;
- (id)description;
- (int64_t)maxDownloadStorage;
- (int64_t)minDeviceStorage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NDDownloadLimits

+ (NDDownloadLimits)defaultLimits
{
  if (defaultLimits_onceToken != -1) {
    dispatch_once(&defaultLimits_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)defaultLimits_s_defaults;

  return (NDDownloadLimits *)v2;
}

uint64_t __33__NDDownloadLimits_defaultLimits__block_invoke()
{
  defaultLimits_s_defaults = [[NDDownloadLimits alloc] initWithMinDeviceStorage:2000000000 maxDownloadStorage:5000000000];

  return MEMORY[0x1F41817F8]();
}

- (NDDownloadLimits)initWithMinDeviceStorage:(int64_t)a3 maxDownloadStorage:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NDDownloadLimits;
  result = [(NDDownloadLimits *)&v7 init];
  if (result)
  {
    result->_minDeviceStorage = a3;
    result->_maxDownloadStorage = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5
    && (int64_t v6 = -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"), v6 == [v5 minDeviceStorage]))
  {
    int64_t v7 = [(NDDownloadLimits *)self maxDownloadStorage];
    BOOL v8 = v7 == [v5 maxDownloadStorage];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"));
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F7E390]) initWithObject:self];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"), 0);
  [v3 addField:@"minDeviceStorage" object:v4];

  v5 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage"), 0);
  [v3 addField:@"maxDownloadStorage" object:v5];

  unint64_t v6 = [v3 descriptionString];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDDownloadLimits)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minDeviceStorage"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxDownloadStorage"];

  int64_t v7 = -[NDDownloadLimits initWithMinDeviceStorage:maxDownloadStorage:](self, "initWithMinDeviceStorage:maxDownloadStorage:", [v5 unsignedLongLongValue], objc_msgSend(v6, "unsignedLongLongValue"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v4, "numberWithLongLong:", -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"));
  [v5 encodeObject:v6 forKey:@"minDeviceStorage"];

  objc_msgSend(NSNumber, "numberWithLongLong:", -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"maxDownloadStorage"];
}

- (int64_t)minDeviceStorage
{
  return self->_minDeviceStorage;
}

- (int64_t)maxDownloadStorage
{
  return self->_maxDownloadStorage;
}

@end