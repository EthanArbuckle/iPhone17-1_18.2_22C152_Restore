@interface NSSUsageRespMsgAppUsage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)dynamicSizeInBytes;
- (unint64_t)hash;
- (unint64_t)sharedSizeInBytes;
- (unint64_t)staticSizeInBytes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setDynamicSizeInBytes:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setSharedSizeInBytes:(unint64_t)a3;
- (void)setStaticSizeInBytes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageRespMsgAppUsage

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsgAppUsage;
  v4 = [(NSSUsageRespMsgAppUsage *)&v8 description];
  v5 = [(NSSUsageRespMsgAppUsage *)self dictionaryRepresentation];
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
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_staticSizeInBytes];
  [v4 setObject:v8 forKey:@"staticSizeInBytes"];

  v9 = [NSNumber numberWithUnsignedLongLong:self->_dynamicSizeInBytes];
  [v4 setObject:v9 forKey:@"dynamicSizeInBytes"];

  v10 = [NSNumber numberWithUnsignedLongLong:self->_sharedSizeInBytes];
  [v4 setObject:v10 forKey:@"sharedSizeInBytes"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgAppUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  name = self->_name;
  v5 = a3;
  [v5 setName:name];
  [v5 setBundleIdentifier:self->_bundleIdentifier];
  [v5 setBundleVersion:self->_bundleVersion];
  v5[3] = self->_staticSizeInBytes;
  v5[1] = self->_dynamicSizeInBytes;
  v5[2] = self->_sharedSizeInBytes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  v5[3] = self->_staticSizeInBytes;
  v5[1] = self->_dynamicSizeInBytes;
  v5[2] = self->_sharedSizeInBytes;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v8 = [v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[6])) || -[NSString isEqual:](name, "isEqual:"))
    && ((bundleIdentifier = self->_bundleIdentifier, !((unint64_t)bundleIdentifier | v4[4]))
     || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
    && ((bundleVersion = self->_bundleVersion, !((unint64_t)bundleVersion | v4[5]))
     || -[NSString isEqual:](bundleVersion, "isEqual:"))
    && self->_staticSizeInBytes == v4[3]
    && self->_dynamicSizeInBytes == v4[1]
    && self->_sharedSizeInBytes == v4[2];

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_bundleVersion hash] ^ (2654435761u * self->_staticSizeInBytes) ^ (2654435761u * self->_dynamicSizeInBytes) ^ (2654435761u * self->_sharedSizeInBytes);
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  if (v4[6]) {
    -[NSSUsageRespMsgAppUsage setName:](self, "setName:");
  }
  if (v4[4]) {
    -[NSSUsageRespMsgAppUsage setBundleIdentifier:](self, "setBundleIdentifier:");
  }
  if (v4[5]) {
    -[NSSUsageRespMsgAppUsage setBundleVersion:](self, "setBundleVersion:");
  }
  self->_staticSizeInBytes = v4[3];
  self->_dynamicSizeInBytes = v4[1];
  self->_sharedSizeInBytes = v4[2];
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

- (unint64_t)staticSizeInBytes
{
  return self->_staticSizeInBytes;
}

- (void)setStaticSizeInBytes:(unint64_t)a3
{
  self->_staticSizeInBytes = a3;
}

- (unint64_t)dynamicSizeInBytes
{
  return self->_dynamicSizeInBytes;
}

- (void)setDynamicSizeInBytes:(unint64_t)a3
{
  self->_dynamicSizeInBytes = a3;
}

- (unint64_t)sharedSizeInBytes
{
  return self->_sharedSizeInBytes;
}

- (void)setSharedSizeInBytes:(unint64_t)a3
{
  self->_sharedSizeInBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end