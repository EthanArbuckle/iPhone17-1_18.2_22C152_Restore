@interface NTPBAppConfigurationResource
- (BOOL)hasEtag;
- (BOOL)hasGzippedConfigurationData;
- (BOOL)hasLastFetchedDate;
- (BOOL)hasLastModifiedDate;
- (BOOL)hasLastModifiedString;
- (BOOL)hasMaxAge;
- (BOOL)hasResourceID;
- (BOOL)hasSourceURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)gzippedConfigurationData;
- (NSString)etag;
- (NSString)lastModifiedString;
- (NSString)resourceID;
- (NSString)sourceURL;
- (NTPBDate)lastFetchedDate;
- (NTPBDate)lastModifiedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)maxAge;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setGzippedConfigurationData:(id)a3;
- (void)setHasMaxAge:(BOOL)a3;
- (void)setLastFetchedDate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setLastModifiedString:(id)a3;
- (void)setMaxAge:(int64_t)a3;
- (void)setResourceID:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAppConfigurationResource

- (void)dealloc
{
  [(NTPBAppConfigurationResource *)self setGzippedConfigurationData:0];
  [(NTPBAppConfigurationResource *)self setSourceURL:0];
  [(NTPBAppConfigurationResource *)self setEtag:0];
  [(NTPBAppConfigurationResource *)self setLastFetchedDate:0];
  [(NTPBAppConfigurationResource *)self setLastModifiedDate:0];
  [(NTPBAppConfigurationResource *)self setLastModifiedString:0];
  [(NTPBAppConfigurationResource *)self setResourceID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAppConfigurationResource;
  [(NTPBAppConfigurationResource *)&v3 dealloc];
}

- (BOOL)hasGzippedConfigurationData
{
  return self->_gzippedConfigurationData != 0;
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasLastFetchedDate
{
  return self->_lastFetchedDate != 0;
}

- (BOOL)hasLastModifiedDate
{
  return self->_lastModifiedDate != 0;
}

- (BOOL)hasLastModifiedString
{
  return self->_lastModifiedString != 0;
}

- (void)setMaxAge:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxAge = a3;
}

- (void)setHasMaxAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasResourceID
{
  return self->_resourceID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAppConfigurationResource;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAppConfigurationResource description](&v3, sel_description), -[NTPBAppConfigurationResource dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  gzippedConfigurationData = self->_gzippedConfigurationData;
  if (gzippedConfigurationData) {
    [v3 setObject:gzippedConfigurationData forKey:@"gzipped_configuration_data"];
  }
  sourceURL = self->_sourceURL;
  if (sourceURL) {
    [v4 setObject:sourceURL forKey:@"source_URL"];
  }
  etag = self->_etag;
  if (etag) {
    [v4 setObject:etag forKey:@"etag"];
  }
  lastFetchedDate = self->_lastFetchedDate;
  if (lastFetchedDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastFetchedDate, "dictionaryRepresentation"), @"last_fetched_date");
  }
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastModifiedDate, "dictionaryRepresentation"), @"last_modified_date");
  }
  lastModifiedString = self->_lastModifiedString;
  if (lastModifiedString) {
    [v4 setObject:lastModifiedString forKey:@"last_modified_string"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_maxAge), @"max_age");
  }
  resourceID = self->_resourceID;
  if (resourceID) {
    [v4 setObject:resourceID forKey:@"resource_ID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppConfigurationResourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_gzippedConfigurationData) {
    PBDataWriterWriteDataField();
  }
  if (self->_sourceURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastFetchedDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastModifiedDate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lastModifiedString) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_resourceID)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 24) = [(NSData *)self->_gzippedConfigurationData copyWithZone:a3];
  *(void *)(v5 + 64) = [(NSString *)self->_sourceURL copyWithZone:a3];

  *(void *)(v5 + 16) = [(NSString *)self->_etag copyWithZone:a3];
  *(void *)(v5 + 32) = [(NTPBDate *)self->_lastFetchedDate copyWithZone:a3];

  *(void *)(v5 + 40) = [(NTPBDate *)self->_lastModifiedDate copyWithZone:a3];
  *(void *)(v5 + 48) = [(NSString *)self->_lastModifiedString copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_maxAge;
    *(unsigned char *)(v5 + 72) |= 1u;
  }

  *(void *)(v5 + 56) = [(NSString *)self->_resourceID copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    gzippedConfigurationData = self->_gzippedConfigurationData;
    if (!((unint64_t)gzippedConfigurationData | *((void *)a3 + 3))
      || (int v5 = -[NSData isEqual:](gzippedConfigurationData, "isEqual:")) != 0)
    {
      sourceURL = self->_sourceURL;
      if (!((unint64_t)sourceURL | *((void *)a3 + 8))
        || (int v5 = -[NSString isEqual:](sourceURL, "isEqual:")) != 0)
      {
        etag = self->_etag;
        if (!((unint64_t)etag | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](etag, "isEqual:")) != 0)
        {
          lastFetchedDate = self->_lastFetchedDate;
          if (!((unint64_t)lastFetchedDate | *((void *)a3 + 4))
            || (int v5 = -[NTPBDate isEqual:](lastFetchedDate, "isEqual:")) != 0)
          {
            lastModifiedDate = self->_lastModifiedDate;
            if (!((unint64_t)lastModifiedDate | *((void *)a3 + 5))
              || (int v5 = -[NTPBDate isEqual:](lastModifiedDate, "isEqual:")) != 0)
            {
              lastModifiedString = self->_lastModifiedString;
              if (!((unint64_t)lastModifiedString | *((void *)a3 + 6))
                || (int v5 = -[NSString isEqual:](lastModifiedString, "isEqual:")) != 0)
              {
                if (*(unsigned char *)&self->_has)
                {
                  if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_maxAge != *((void *)a3 + 1)) {
                    goto LABEL_21;
                  }
                }
                else if (*((unsigned char *)a3 + 72))
                {
LABEL_21:
                  LOBYTE(v5) = 0;
                  return v5;
                }
                resourceID = self->_resourceID;
                if ((unint64_t)resourceID | *((void *)a3 + 7))
                {
                  LOBYTE(v5) = -[NSString isEqual:](resourceID, "isEqual:");
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
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_gzippedConfigurationData hash];
  NSUInteger v4 = [(NSString *)self->_sourceURL hash];
  NSUInteger v5 = [(NSString *)self->_etag hash];
  unint64_t v6 = [(NTPBDate *)self->_lastFetchedDate hash];
  unint64_t v7 = [(NTPBDate *)self->_lastModifiedDate hash];
  NSUInteger v8 = [(NSString *)self->_lastModifiedString hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_maxAge;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_resourceID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[NTPBAppConfigurationResource setGzippedConfigurationData:](self, "setGzippedConfigurationData:");
  }
  if (*((void *)a3 + 8)) {
    -[NTPBAppConfigurationResource setSourceURL:](self, "setSourceURL:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBAppConfigurationResource setEtag:](self, "setEtag:");
  }
  lastFetchedDate = self->_lastFetchedDate;
  uint64_t v6 = *((void *)a3 + 4);
  if (lastFetchedDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](lastFetchedDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBAppConfigurationResource setLastFetchedDate:](self, "setLastFetchedDate:");
  }
  lastModifiedDate = self->_lastModifiedDate;
  uint64_t v8 = *((void *)a3 + 5);
  if (lastModifiedDate)
  {
    if (v8) {
      -[NTPBDate mergeFrom:](lastModifiedDate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBAppConfigurationResource setLastModifiedDate:](self, "setLastModifiedDate:");
  }
  if (*((void *)a3 + 6)) {
    -[NTPBAppConfigurationResource setLastModifiedString:](self, "setLastModifiedString:");
  }
  if (*((unsigned char *)a3 + 72))
  {
    self->_maxAge = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 7))
  {
    -[NTPBAppConfigurationResource setResourceID:](self, "setResourceID:");
  }
}

- (NSData)gzippedConfigurationData
{
  return self->_gzippedConfigurationData;
}

- (void)setGzippedConfigurationData:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NTPBDate)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (void)setLastFetchedDate:(id)a3
{
}

- (NTPBDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSString)lastModifiedString
{
  return self->_lastModifiedString;
}

- (void)setLastModifiedString:(id)a3
{
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
}

@end