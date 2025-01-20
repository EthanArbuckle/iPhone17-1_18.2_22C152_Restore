@interface MBBackgroundRestoreInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)airTrafficDidFinishRestore;
- (BOOL)appDataDidFinishRestore;
- (MBBackgroundRestoreInfo)initWithCoder:(id)a3;
- (NSArray)failedDomains;
- (NSMutableDictionary)perClassItemsRemaining;
- (NSMutableDictionary)recentATCErrors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)dataClassesRemaining;
- (unint64_t)bytesRemaining;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAirTrafficDidFinishRestore:(BOOL)a3;
- (void)setAppDataDidFinishRestore:(BOOL)a3;
- (void)setBytesRemaining:(unint64_t)a3;
- (void)setDataClassesRemaining:(int)a3;
- (void)setFailedDomains:(id)a3;
- (void)setPerClassItemsRemaining:(id)a3;
- (void)setRecentATCErrors:(id)a3;
@end

@implementation MBBackgroundRestoreInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MBBackgroundRestoreInfo);
  [(MBBackgroundRestoreInfo *)v4 setBytesRemaining:self->_bytesRemaining];
  [(MBBackgroundRestoreInfo *)v4 setDataClassesRemaining:self->_dataClassesRemaining];
  [(MBBackgroundRestoreInfo *)v4 setFailedDomains:self->_failedDomains];
  return v4;
}

- (MBBackgroundRestoreInfo)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MBBackgroundRestoreInfo;
  v4 = [(MBBackgroundRestoreInfo *)&v8 init];
  if (v4)
  {
    v4->_bytesRemaining = [a3 decodeInt64ForKey:@"bytesRemaining"];
    v4->_dataClassesRemaining = [a3 decodeInt32ForKey:@"dataClassesRemaining"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_failedDomains = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"failedDomains");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_bytesRemaining forKey:@"bytesRemaining"];
  [a3 encodeInt64:self->_dataClassesRemaining forKey:@"dataClassesRemaining"];
  failedDomains = self->_failedDomains;
  [a3 encodeObject:failedDomains forKey:@"failedDomains"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBBackgroundRestoreInfo;
  [(MBBackgroundRestoreInfo *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"bytesRemaining:%llu, dataClassesRemaining:0x%x, failedDomains:%@", self->_bytesRemaining, self->_dataClassesRemaining, self->_failedDomains];
}

- (int)dataClassesRemaining
{
  return self->_dataClassesRemaining;
}

- (void)setDataClassesRemaining:(int)a3
{
  self->_dataClassesRemaining = a3;
}

- (unint64_t)bytesRemaining
{
  return self->_bytesRemaining;
}

- (void)setBytesRemaining:(unint64_t)a3
{
  self->_bytesRemaining = a3;
}

- (NSArray)failedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFailedDomains:(id)a3
{
}

- (NSMutableDictionary)recentATCErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecentATCErrors:(id)a3
{
}

- (NSMutableDictionary)perClassItemsRemaining
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPerClassItemsRemaining:(id)a3
{
}

- (BOOL)airTrafficDidFinishRestore
{
  return self->_airTrafficDidFinishRestore;
}

- (void)setAirTrafficDidFinishRestore:(BOOL)a3
{
  self->_airTrafficDidFinishRestore = a3;
}

- (BOOL)appDataDidFinishRestore
{
  return self->_appDataDidFinishRestore;
}

- (void)setAppDataDidFinishRestore:(BOOL)a3
{
  self->_appDataDidFinishRestore = a3;
}

@end