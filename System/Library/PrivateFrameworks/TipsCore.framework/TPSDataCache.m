@interface TPSDataCache
+ (BOOL)supportsSecureCoding;
- (BOOL)expired;
- (NSDate)updatedDate;
- (NSString)identifier;
- (NSString)languageCode;
- (NSString)lastModified;
- (TPSDataCache)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)maxAge;
- (unint64_t)cacheType;
- (unint64_t)fileSize;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheType:(unint64_t)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLastModified:(id)a3;
- (void)setMaxAge:(int64_t)a3;
- (void)setUpdatedDate:(id)a3;
@end

@implementation TPSDataCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TPSDataCache allocWithZone:a3];
  [(TPSDataCache *)v4 setCacheType:self->_cacheType];
  [(TPSDataCache *)v4 setMaxAge:self->_maxAge];
  [(TPSDataCache *)v4 setFileSize:self->_fileSize];
  [(TPSDataCache *)v4 setIdentifier:self->_identifier];
  [(TPSDataCache *)v4 setUpdatedDate:self->_updatedDate];
  [(TPSDataCache *)v4 setLastModified:self->_lastModified];
  [(TPSDataCache *)v4 setLanguageCode:self->_languageCode];
  return v4;
}

- (TPSDataCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSDataCache;
  v5 = [(TPSDataCache *)&v11 init];
  if (v5)
  {
    -[TPSDataCache setMaxAge:](v5, "setMaxAge:", [v4 decodeIntegerForKey:@"TPSDataCacheMaxAge"]);
    -[TPSDataCache setCacheType:](v5, "setCacheType:", [v4 decodeIntegerForKey:@"TPSDataCacheType"]);
    -[TPSDataCache setFileSize:](v5, "setFileSize:", [v4 decodeIntegerForKey:@"TPSDataCacheFileSize"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TPSDataCacheIdentifier"];
    [(TPSDataCache *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TPSDataCacheLastModified"];
    [(TPSDataCache *)v5 setLastModified:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TPSDataCacheLangaugeCode"];
    [(TPSDataCache *)v5 setLanguageCode:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TPSDataCacheUpdatedDate"];
    [(TPSDataCache *)v5 setUpdatedDate:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDataCache maxAge](self, "maxAge"), @"TPSDataCacheMaxAge");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDataCache cacheType](self, "cacheType"), @"TPSDataCacheType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDataCache fileSize](self, "fileSize"), @"TPSDataCacheFileSize");
  v5 = [(TPSDataCache *)self identifier];
  [v4 encodeObject:v5 forKey:@"TPSDataCacheIdentifier"];

  v6 = [(TPSDataCache *)self updatedDate];
  [v4 encodeObject:v6 forKey:@"TPSDataCacheUpdatedDate"];

  v7 = [(TPSDataCache *)self lastModified];
  [v4 encodeObject:v7 forKey:@"TPSDataCacheLastModified"];

  id v8 = [(TPSDataCache *)self languageCode];
  [v4 encodeObject:v8 forKey:@"TPSDataCacheLangaugeCode"];
}

- (BOOL)expired
{
  v3 = [(TPSDataCache *)self updatedDate];
  id v4 = [v3 dateByAddingTimeInterval:(double)self->_maxAge];

  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(TPSDataCache *)self updatedDate];
  if (v6) {
    BOOL v7 = [v4 compare:v5] == -1;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)debugDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", self];
  [v3 appendFormat:@" %@ = %@\n", @"TPSDataCacheIdentifier", self->_identifier];
  [v3 appendFormat:@" %@ = %zd\n", @"TPSDataCacheType", self->_cacheType];
  [v3 appendFormat:@" %@ = %zd\n", @"TPSDataCacheMaxAge", self->_maxAge];
  [v3 appendFormat:@" %@ = %zd\n", @"TPSDataCacheFileSize", self->_fileSize];
  [v3 appendFormat:@" %@ = %@\n", @"TPSDataCacheUpdatedDate", self->_updatedDate];
  [v3 appendFormat:@" %@ = %@\n", @"TPSDataCacheLastModified", self->_lastModified];
  [v3 appendFormat:@" %@ = %@\n", @"TPSDataCacheLangaugeCode", self->_languageCode];
  return v3;
}

- (unint64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(unint64_t)a3
{
  self->_cacheType = a3;
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(int64_t)a3
{
  self->_maxAge = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end