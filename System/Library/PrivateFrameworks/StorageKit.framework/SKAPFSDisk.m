@interface SKAPFSDisk
- (BOOL)defaultEffaceable;
- (BOOL)hasVolumeSiblings;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDictionary:(id)a3;
- (NSString)apfsRole;
- (NSString)apfsVolumeGroupUUID;
- (id)container;
- (id)dictionaryRepresentation;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (id)wholeDiskIdentifier;
- (unint64_t)quotaSpace;
- (unint64_t)reserveSpace;
- (unint64_t)usedSpace;
- (void)setApfsRole:(id)a3;
- (void)setApfsVolumeGroupUUID:(id)a3;
- (void)setDefaultEffaceable:(BOOL)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setQuotaSpace:(unint64_t)a3;
- (void)setReserveSpace:(unint64_t)a3;
- (void)setUsedSpace:(unint64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSDisk

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13.receiver = v5;
  v13.super_class = (Class)SKAPFSDisk;
  [(SKDisk *)&v13 updateWithDictionary:v4];
  v6 = [v4 objectForKey:@"isEncrypted"];
  -[SKAPFSDisk setIsEncrypted:](v5, "setIsEncrypted:", [v6 BOOLValue]);

  v7 = [v4 objectForKey:@"defaultEffaceable"];
  -[SKAPFSDisk setDefaultEffaceable:](v5, "setDefaultEffaceable:", [v7 BOOLValue]);

  v8 = [v4 objectForKey:@"usedSpace"];
  -[SKAPFSDisk setUsedSpace:](v5, "setUsedSpace:", [v8 unsignedLongLongValue]);

  v9 = [v4 objectForKey:@"reserveSpace"];
  -[SKAPFSDisk setReserveSpace:](v5, "setReserveSpace:", [v9 unsignedLongLongValue]);

  v10 = [v4 objectForKey:@"quotaSpace"];
  -[SKAPFSDisk setQuotaSpace:](v5, "setQuotaSpace:", [v10 unsignedLongLongValue]);

  v11 = [v4 objectForKey:@"apfsRole"];
  [(SKAPFSDisk *)v5 setApfsRole:v11];

  v12 = [v4 objectForKey:@"apfsVolumeGroupUUID"];
  [(SKAPFSDisk *)v5 setApfsVolumeGroupUUID:v12];

  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v14.receiver = v2;
  v14.super_class = (Class)SKAPFSDisk;
  v3 = [(SKDisk *)&v14 dictionaryRepresentation];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKAPFSDisk usedSpace](v2, "usedSpace"));
  [v3 setObject:v4 forKey:@"usedSpace"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKAPFSDisk quotaSpace](v2, "quotaSpace"));
  [v3 setObject:v5 forKey:@"quotaSpace"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKAPFSDisk reserveSpace](v2, "reserveSpace"));
  [v3 setObject:v6 forKey:@"reserveSpace"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SKAPFSDisk isEncrypted](v2, "isEncrypted"));
  [v3 setObject:v7 forKey:@"isEncrypted"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SKAPFSDisk defaultEffaceable](v2, "defaultEffaceable"));
  [v3 setObject:v8 forKey:@"defaultEffaceable"];

  v9 = [(SKAPFSDisk *)v2 apfsVolumeGroupUUID];

  if (v9)
  {
    v10 = [(SKAPFSDisk *)v2 apfsVolumeGroupUUID];
    [v3 setObject:v10 forKey:@"apfsVolumeGroupUUID"];
  }
  v11 = [(SKAPFSDisk *)v2 apfsRole];

  if (v11)
  {
    v12 = [(SKAPFSDisk *)v2 apfsRole];
    [v3 setObject:v12 forKey:@"apfsRole"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  id v4 = NSString;
  v5 = [(SKAPFSDisk *)self apfsUUID];
  if (v5)
  {
    v6 = [(SKAPFSDisk *)self apfsUUID];
  }
  else
  {
    v6 = @"--";
  }
  BOOL v7 = [(SKAPFSDisk *)self isEncrypted];
  v8 = @"No";
  if (v7) {
    v8 = @"Yes";
  }
  v9 = [v4 stringWithFormat:@"APFS UUID: %@, Encrypted: %@", v6, v8];
  if (v5) {

  }
  return v9;
}

- (id)container
{
  v2 = [(SKDisk *)self cachedWholeDiskByIdentifier];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)wholeDiskIdentifier
{
  if ([(SKDisk *)self isLiveFSAPFSDisk])
  {
    id v3 = objc_alloc(NSURL);
    id v4 = [(SKDisk *)self diskIdentifier];
    v5 = (void *)[v3 initWithString:v4];

    v6 = NSString;
    BOOL v7 = [v5 host];
    v8 = [v6 stringWithFormat:@"apfs://%@", v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKAPFSDisk;
    v8 = [(SKDisk *)&v10 wholeDiskIdentifier];
  }

  return v8;
}

- (BOOL)matchesDictionary:(id)a3
{
  id v4 = a3;
  if ([(SKDisk *)self isIOMediaDisk])
  {
    v12.receiver = self;
    v12.super_class = (Class)SKAPFSDisk;
    unsigned __int8 v5 = [(SKDisk *)&v12 matchesDictionary:v4];
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    v8 = [v4 objectForKey:@"**ClassName**"];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(SKDisk *)self mountPoint];
      objc_super v10 = [v4 objectForKey:@"mountPoint"];
      unsigned __int8 v5 = [v9 isEqual:v10];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v6.receiver = v2;
  v6.super_class = (Class)SKAPFSDisk;
  id v3 = [(SKDisk *)&v6 minimalDictionaryRepresentation];
  if (![(SKDisk *)v2 isIOMediaDisk])
  {
    id v4 = [(SKDisk *)v2 mountPoint];
    [v3 setValue:v4 forKey:@"mountPoint"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([(SKDisk *)self isIOMediaDisk])
  {
    v10.receiver = self;
    v10.super_class = (Class)SKAPFSDisk;
    unsigned __int8 v5 = [(SKDisk *)&v10 isEqual:v4];
  }
  else if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v6 = v4;
    BOOL v7 = [(SKDisk *)self mountPoint];
    v8 = [v6 mountPoint];

    unsigned __int8 v5 = [v7 isEqual:v8];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)hasVolumeSiblings
{
  id v3 = [(SKAPFSDisk *)self container];
  if (v3)
  {
    id v4 = [(SKAPFSDisk *)self container];
    unsigned __int8 v5 = [v4 volumes];
    if (v5)
    {
      id v6 = [(SKAPFSDisk *)self container];
      BOOL v7 = [v6 volumes];
      BOOL v8 = (unint64_t)[v7 count] > 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)usedSpace
{
  return self->_usedSpace;
}

- (void)setUsedSpace:(unint64_t)a3
{
  self->_usedSpace = a3;
}

- (unint64_t)reserveSpace
{
  return self->_reserveSpace;
}

- (void)setReserveSpace:(unint64_t)a3
{
  self->_reserveSpace = a3;
}

- (unint64_t)quotaSpace
{
  return self->_quotaSpace;
}

- (void)setQuotaSpace:(unint64_t)a3
{
  self->_quotaSpace = a3;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)defaultEffaceable
{
  return self->_defaultEffaceable;
}

- (void)setDefaultEffaceable:(BOOL)a3
{
  self->_defaultEffaceable = a3;
}

- (NSString)apfsVolumeGroupUUID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setApfsVolumeGroupUUID:(id)a3
{
}

- (NSString)apfsRole
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setApfsRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apfsRole, 0);

  objc_storeStrong((id *)&self->_apfsVolumeGroupUUID, 0);
}

@end