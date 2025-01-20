@interface NSSUsageRespMsgAppBundle
- (BOOL)hasBundleIdentifier;
- (BOOL)hasBundleVersion;
- (BOOL)hasName;
- (BOOL)hasSize;
- (BOOL)hasSupportsManualPurge;
- (BOOL)hasVendor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsManualPurge;
- (NSSUsageSize)size;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (NSString)vendor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setHasSupportsManualPurge:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSize:(id)a3;
- (void)setSupportsManualPurge:(BOOL)a3;
- (void)setVendor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageRespMsgAppBundle

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasBundleVersion
{
  return self->_bundleVersion != 0;
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (void)setSupportsManualPurge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportsManualPurge = a3;
}

- (void)setHasSupportsManualPurge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsManualPurge
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSize
{
  return self->_size != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgAppBundle;
  v4 = [(NSSUsageRespMsgAppBundle *)&v8 description];
  v5 = [(NSSUsageRespMsgAppBundle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    [v4 setObject:bundleVersion forKey:@"bundleVersion"];
  }
  vendor = self->_vendor;
  if (vendor) {
    [v4 setObject:vendor forKey:@"vendor"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_supportsManualPurge];
    [v4 setObject:v9 forKey:@"supportsManualPurge"];
  }
  size = self->_size;
  if (size)
  {
    v11 = [(NSSUsageSize *)size dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"size"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgAppBundleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_vendor)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_size)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
    id v4 = v5;
  }
  if (self->_bundleVersion)
  {
    objc_msgSend(v5, "setBundleVersion:");
    id v4 = v5;
  }
  if (self->_vendor)
  {
    objc_msgSend(v5, "setVendor:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[48] = self->_supportsManualPurge;
    v4[52] |= 1u;
  }
  if (self->_size)
  {
    objc_msgSend(v5, "setSize:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_vendor copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 48) = self->_supportsManualPurge;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v14 = [(NSSUsageSize *)self->_size copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_14;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  bundleVersion = self->_bundleVersion;
  if ((unint64_t)bundleVersion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleVersion, "isEqual:")) {
      goto LABEL_14;
    }
  }
  vendor = self->_vendor;
  if ((unint64_t)vendor | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](vendor, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_supportsManualPurge)
      {
        if (*((unsigned char *)v4 + 48)) {
          goto LABEL_20;
        }
      }
      else if (!*((unsigned char *)v4 + 48))
      {
        goto LABEL_20;
      }
    }
LABEL_14:
    char v9 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_14;
  }
LABEL_20:
  size = self->_size;
  if ((unint64_t)size | *((void *)v4 + 4)) {
    char v9 = -[NSSUsageSize isEqual:](size, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_bundleVersion hash];
  NSUInteger v6 = [(NSString *)self->_vendor hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_supportsManualPurge;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSSUsageSize *)self->_size hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[NSSUsageRespMsgAppBundle setName:](self, "setName:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[NSSUsageRespMsgAppBundle setBundleIdentifier:](self, "setBundleIdentifier:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[NSSUsageRespMsgAppBundle setBundleVersion:](self, "setBundleVersion:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[NSSUsageRespMsgAppBundle setVendor:](self, "setVendor:");
    NSUInteger v4 = v7;
  }
  if (v4[52])
  {
    self->_supportsManualPurge = v4[48];
    *(unsigned char *)&self->_has |= 1u;
  }
  size = self->_size;
  uint64_t v6 = *((void *)v4 + 4);
  if (size)
  {
    if (v6) {
      -[NSSUsageSize mergeFrom:](size, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NSSUsageRespMsgAppBundle setSize:](self, "setSize:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
}

- (BOOL)supportsManualPurge
{
  return self->_supportsManualPurge;
}

- (NSSUsageSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end