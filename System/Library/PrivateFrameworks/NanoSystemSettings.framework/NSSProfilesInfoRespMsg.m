@interface NSSProfilesInfoRespMsg
+ (Class)configProfileType;
- (BOOL)hasManagedAppsData;
- (BOOL)hasMdmProfile;
- (BOOL)hasRmAccountData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)managedAppsData;
- (NSData)rmAccountData;
- (NSMutableArray)configProfiles;
- (NSSProfilesInfoRespMsgProfileInfo)mdmProfile;
- (id)configProfileAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)configProfilesCount;
- (unint64_t)hash;
- (void)addConfigProfile:(id)a3;
- (void)clearConfigProfiles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigProfiles:(id)a3;
- (void)setManagedAppsData:(id)a3;
- (void)setMdmProfile:(id)a3;
- (void)setRmAccountData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSProfilesInfoRespMsg

- (BOOL)hasMdmProfile
{
  return self->_mdmProfile != 0;
}

- (void)clearConfigProfiles
{
}

- (void)addConfigProfile:(id)a3
{
  id v4 = a3;
  configProfiles = self->_configProfiles;
  id v8 = v4;
  if (!configProfiles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_configProfiles;
    self->_configProfiles = v6;

    id v4 = v8;
    configProfiles = self->_configProfiles;
  }
  [(NSMutableArray *)configProfiles addObject:v4];
}

- (unint64_t)configProfilesCount
{
  return [(NSMutableArray *)self->_configProfiles count];
}

- (id)configProfileAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_configProfiles objectAtIndex:a3];
}

+ (Class)configProfileType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasManagedAppsData
{
  return self->_managedAppsData != 0;
}

- (BOOL)hasRmAccountData
{
  return self->_rmAccountData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSProfilesInfoRespMsg;
  id v4 = [(NSSProfilesInfoRespMsg *)&v8 description];
  v5 = [(NSSProfilesInfoRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  mdmProfile = self->_mdmProfile;
  if (mdmProfile)
  {
    v5 = [(NSSProfilesInfoRespMsgProfileInfo *)mdmProfile dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"mdmProfile"];
  }
  if ([(NSMutableArray *)self->_configProfiles count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_configProfiles, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_configProfiles;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"configProfile"];
  }
  managedAppsData = self->_managedAppsData;
  if (managedAppsData) {
    [v3 setObject:managedAppsData forKey:@"managedAppsData"];
  }
  rmAccountData = self->_rmAccountData;
  if (rmAccountData) {
    [v3 setObject:rmAccountData forKey:@"rmAccountData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSProfilesInfoRespMsgReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_mdmProfile) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_configProfiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_managedAppsData) {
    PBDataWriterWriteDataField();
  }
  if (self->_rmAccountData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_mdmProfile) {
    objc_msgSend(v9, "setMdmProfile:");
  }
  if ([(NSSProfilesInfoRespMsg *)self configProfilesCount])
  {
    [v9 clearConfigProfiles];
    unint64_t v4 = [(NSSProfilesInfoRespMsg *)self configProfilesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSSProfilesInfoRespMsg *)self configProfileAtIndex:i];
        [v9 addConfigProfile:v7];
      }
    }
  }
  if (self->_managedAppsData) {
    objc_msgSend(v9, "setManagedAppsData:");
  }
  uint64_t v8 = v9;
  if (self->_rmAccountData)
  {
    objc_msgSend(v9, "setRmAccountData:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSSProfilesInfoRespMsgProfileInfo *)self->_mdmProfile copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_configProfiles;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        [v5 addConfigProfile:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_managedAppsData copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  uint64_t v16 = [(NSData *)self->_rmAccountData copyWithZone:a3];
  long long v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((mdmProfile = self->_mdmProfile, !((unint64_t)mdmProfile | v4[3]))
     || -[NSSProfilesInfoRespMsgProfileInfo isEqual:](mdmProfile, "isEqual:"))
    && ((configProfiles = self->_configProfiles, !((unint64_t)configProfiles | v4[1]))
     || -[NSMutableArray isEqual:](configProfiles, "isEqual:"))
    && ((managedAppsData = self->_managedAppsData, !((unint64_t)managedAppsData | v4[2]))
     || -[NSData isEqual:](managedAppsData, "isEqual:")))
  {
    rmAccountData = self->_rmAccountData;
    if ((unint64_t)rmAccountData | v4[4]) {
      char v9 = -[NSData isEqual:](rmAccountData, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSSProfilesInfoRespMsgProfileInfo *)self->_mdmProfile hash];
  uint64_t v4 = [(NSMutableArray *)self->_configProfiles hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_managedAppsData hash];
  return v4 ^ v5 ^ [(NSData *)self->_rmAccountData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  mdmProfile = self->_mdmProfile;
  uint64_t v6 = *((void *)v4 + 3);
  if (mdmProfile)
  {
    if (v6) {
      -[NSSProfilesInfoRespMsgProfileInfo mergeFrom:](mdmProfile, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NSSProfilesInfoRespMsg setMdmProfile:](self, "setMdmProfile:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSSProfilesInfoRespMsg addConfigProfile:](self, "addConfigProfile:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 2)) {
    -[NSSProfilesInfoRespMsg setManagedAppsData:](self, "setManagedAppsData:");
  }
  if (*((void *)v4 + 4)) {
    -[NSSProfilesInfoRespMsg setRmAccountData:](self, "setRmAccountData:");
  }
}

- (NSSProfilesInfoRespMsgProfileInfo)mdmProfile
{
  return self->_mdmProfile;
}

- (void)setMdmProfile:(id)a3
{
}

- (NSMutableArray)configProfiles
{
  return self->_configProfiles;
}

- (void)setConfigProfiles:(id)a3
{
}

- (NSData)managedAppsData
{
  return self->_managedAppsData;
}

- (void)setManagedAppsData:(id)a3
{
}

- (NSData)rmAccountData
{
  return self->_rmAccountData;
}

- (void)setRmAccountData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmAccountData, 0);
  objc_storeStrong((id *)&self->_mdmProfile, 0);
  objc_storeStrong((id *)&self->_managedAppsData, 0);
  objc_storeStrong((id *)&self->_configProfiles, 0);
}

@end