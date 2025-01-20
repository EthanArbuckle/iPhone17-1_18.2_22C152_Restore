@interface NTPBPurchaseLookupRecord
+ (Class)bundleChannelTagIDsType;
+ (Class)channelTagIDsType;
- (BOOL)hasAppAdamID;
- (BOOL)hasBase;
- (BOOL)hasBundleChannelTagIDsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bundleChannelTagIDs;
- (NSMutableArray)channelTagIDs;
- (NSString)appAdamID;
- (NSString)bundleChannelTagIDsVersion;
- (NTPBRecordBase)base;
- (id)bundleChannelTagIDsAtIndex:(unint64_t)a3;
- (id)channelTagIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bundleChannelTagIDsCount;
- (unint64_t)channelTagIDsCount;
- (unint64_t)hash;
- (void)addBundleChannelTagIDs:(id)a3;
- (void)addChannelTagIDs:(id)a3;
- (void)clearBundleChannelTagIDs;
- (void)clearChannelTagIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppAdamID:(id)a3;
- (void)setBase:(id)a3;
- (void)setBundleChannelTagIDs:(id)a3;
- (void)setBundleChannelTagIDsVersion:(id)a3;
- (void)setChannelTagIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPurchaseLookupRecord

- (void)dealloc
{
  [(NTPBPurchaseLookupRecord *)self setBase:0];
  [(NTPBPurchaseLookupRecord *)self setAppAdamID:0];
  [(NTPBPurchaseLookupRecord *)self setChannelTagIDs:0];
  [(NTPBPurchaseLookupRecord *)self setBundleChannelTagIDs:0];
  [(NTPBPurchaseLookupRecord *)self setBundleChannelTagIDsVersion:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseLookupRecord;
  [(NTPBPurchaseLookupRecord *)&v3 dealloc];
}

- (void)setChannelTagIDs:(id)a3
{
}

- (void)setBundleChannelTagIDsVersion:(id)a3
{
}

- (void)setBundleChannelTagIDs:(id)a3
{
}

- (void)setBase:(id)a3
{
}

- (void)setAppAdamID:(id)a3
{
}

- (void)addBundleChannelTagIDs:(id)a3
{
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  if (!bundleChannelTagIDs)
  {
    bundleChannelTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_bundleChannelTagIDs = bundleChannelTagIDs;
  }

  [(NSMutableArray *)bundleChannelTagIDs addObject:a3];
}

- (void)addChannelTagIDs:(id)a3
{
  channelTagIDs = self->_channelTagIDs;
  if (!channelTagIDs)
  {
    channelTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_channelTagIDs = channelTagIDs;
  }

  [(NSMutableArray *)channelTagIDs addObject:a3];
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (NSMutableArray)channelTagIDs
{
  return self->_channelTagIDs;
}

- (NSMutableArray)bundleChannelTagIDs
{
  return self->_bundleChannelTagIDs;
}

- (NSString)bundleChannelTagIDsVersion
{
  return self->_bundleChannelTagIDsVersion;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPurchaseLookupRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasAppAdamID
{
  return self->_appAdamID != 0;
}

- (void)clearChannelTagIDs
{
}

- (unint64_t)channelTagIDsCount
{
  return [(NSMutableArray *)self->_channelTagIDs count];
}

- (id)channelTagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelTagIDs objectAtIndex:a3];
}

+ (Class)channelTagIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearBundleChannelTagIDs
{
}

- (unint64_t)bundleChannelTagIDsCount
{
  return [(NSMutableArray *)self->_bundleChannelTagIDs count];
}

- (id)bundleChannelTagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bundleChannelTagIDs objectAtIndex:a3];
}

+ (Class)bundleChannelTagIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBundleChannelTagIDsVersion
{
  return self->_bundleChannelTagIDsVersion != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseLookupRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPurchaseLookupRecord description](&v3, sel_description), -[NTPBPurchaseLookupRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  appAdamID = self->_appAdamID;
  if (appAdamID) {
    [v3 setObject:appAdamID forKey:@"app_adam_ID"];
  }
  channelTagIDs = self->_channelTagIDs;
  if (channelTagIDs) {
    [v3 setObject:channelTagIDs forKey:@"channel_tag_IDs"];
  }
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  if (bundleChannelTagIDs) {
    [v3 setObject:bundleChannelTagIDs forKey:@"bundle_channel_tag_IDs"];
  }
  bundleChannelTagIDsVersion = self->_bundleChannelTagIDsVersion;
  if (bundleChannelTagIDsVersion) {
    [v3 setObject:bundleChannelTagIDsVersion forKey:@"bundle_channel_tag_IDs_version"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appAdamID) {
    PBDataWriterWriteStringField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  channelTagIDs = self->_channelTagIDs;
  uint64_t v5 = [(NSMutableArray *)channelTagIDs countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(channelTagIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)channelTagIDs countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  uint64_t v10 = [(NSMutableArray *)bundleChannelTagIDs countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(bundleChannelTagIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)bundleChannelTagIDs countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  if (self->_bundleChannelTagIDsVersion) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  v5[1] = (id)[(NSString *)self->_appAdamID copyWithZone:a3];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  channelTagIDs = self->_channelTagIDs;
  uint64_t v7 = [(NSMutableArray *)channelTagIDs countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(channelTagIDs);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addChannelTagIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)channelTagIDs countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  uint64_t v13 = [(NSMutableArray *)bundleChannelTagIDs countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(bundleChannelTagIDs);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [v5 addBundleChannelTagIDs:v17];
      }
      uint64_t v14 = [(NSMutableArray *)bundleChannelTagIDs countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  v5[4] = (id)[(NSString *)self->_bundleChannelTagIDsVersion copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 2)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      appAdamID = self->_appAdamID;
      if (!((unint64_t)appAdamID | *((void *)a3 + 1))
        || (int v5 = -[NSString isEqual:](appAdamID, "isEqual:")) != 0)
      {
        channelTagIDs = self->_channelTagIDs;
        if (!((unint64_t)channelTagIDs | *((void *)a3 + 5))
          || (int v5 = -[NSMutableArray isEqual:](channelTagIDs, "isEqual:")) != 0)
        {
          bundleChannelTagIDs = self->_bundleChannelTagIDs;
          if (!((unint64_t)bundleChannelTagIDs | *((void *)a3 + 3))
            || (int v5 = -[NSMutableArray isEqual:](bundleChannelTagIDs, "isEqual:")) != 0)
          {
            bundleChannelTagIDsVersion = self->_bundleChannelTagIDsVersion;
            if ((unint64_t)bundleChannelTagIDsVersion | *((void *)a3 + 4))
            {
              LOBYTE(v5) = -[NSString isEqual:](bundleChannelTagIDsVersion, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_appAdamID hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_channelTagIDs hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_bundleChannelTagIDs hash];
  return v6 ^ [(NSString *)self->_bundleChannelTagIDsVersion hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 2);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBPurchaseLookupRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 1)) {
    -[NTPBPurchaseLookupRecord setAppAdamID:](self, "setAppAdamID:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBPurchaseLookupRecord *)self addChannelTagIDs:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBPurchaseLookupRecord *)self addBundleChannelTagIDs:*(void *)(*((void *)&v17 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
  if (*((void *)a3 + 4)) {
    -[NTPBPurchaseLookupRecord setBundleChannelTagIDsVersion:](self, "setBundleChannelTagIDsVersion:");
  }
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

@end