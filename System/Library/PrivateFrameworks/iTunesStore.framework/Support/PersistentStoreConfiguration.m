@interface PersistentStoreConfiguration
- (NSArray)legacyModelVersionIdentifiers;
- (NSString)databaseFileName;
- (NSString)integrityCookieFileName;
- (NSString)modelFileName;
- (PersistentStoreConfiguration)initWithStoreType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)storeType;
- (void)dealloc;
- (void)setDatabaseFileName:(id)a3;
- (void)setLegacyModelVersionIdentifiers:(id)a3;
- (void)setModelFileName:(id)a3;
- (void)setStoreType:(int)a3;
@end

@implementation PersistentStoreConfiguration

- (PersistentStoreConfiguration)initWithStoreType:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PersistentStoreConfiguration;
  v4 = [(PersistentStoreConfiguration *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_storeType = a3;
    if (!a3)
    {
      v4->_databaseFileName = (NSString *)[objc_alloc((Class)NSString) initWithString:@"itunesstored2.sqlitedb"];
      v6 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"itunesstored", @"itunesstored.2.0", @"itunesstored.3.0", @"itunesstored.4.0", @"itunesstored.5", @"itunesstored.6", @"itunesstored.7", @"itunesstored.7.1", @"itunesstored.8", @"itunesstored.8.1", @"itunesstored.8.3", @"itunesstored.10.3", 0);
      CFStringRef v7 = @"itunesstored.momd";
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v4->_databaseFileName = (NSString *)[objc_alloc((Class)NSString) initWithString:@"itunesstored_private.sqlitedb"];
      v6 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"itunesstored_private", @"itunesstored_private.2.0", 0);
      CFStringRef v7 = @"itunesstored_private.momd";
LABEL_6:
      v5->_legacyModelVersionIdentifiers = v6;
      v5->_modelFileName = (NSString *)[objc_alloc((Class)NSString) initWithString:v7];
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PersistentStoreConfiguration;
  [(PersistentStoreConfiguration *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSString *)self->_databaseFileName copyWithZone:a3];
  v5[2] = [(NSArray *)self->_legacyModelVersionIdentifiers copyWithZone:a3];
  v5[3] = [(NSString *)self->_modelFileName copyWithZone:a3];
  *((_DWORD *)v5 + 8) = self->_storeType;
  return v5;
}

- (NSString)integrityCookieFileName
{
  return [(NSString *)self->_databaseFileName stringByAppendingPathExtension:@"cookie"];
}

- (NSString)databaseFileName
{
  return self->_databaseFileName;
}

- (void)setDatabaseFileName:(id)a3
{
}

- (NSArray)legacyModelVersionIdentifiers
{
  return self->_legacyModelVersionIdentifiers;
}

- (void)setLegacyModelVersionIdentifiers:(id)a3
{
}

- (NSString)modelFileName
{
  return self->_modelFileName;
}

- (void)setModelFileName:(id)a3
{
}

- (int)storeType
{
  return self->_storeType;
}

- (void)setStoreType:(int)a3
{
  self->_storeType = a3;
}

@end