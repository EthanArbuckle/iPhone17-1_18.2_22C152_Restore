@interface TRIMLRuntimeDimensions
- (BOOL)hasCrashPrefixHash;
- (BOOL)hasPluginId;
- (BOOL)hasUnderlyingDomainCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)crashPrefixHash;
- (NSString)pluginId;
- (NSString)underlyingDomainCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCrashPrefixHash:(id)a3;
- (void)setPluginId:(id)a3;
- (void)setUnderlyingDomainCode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRIMLRuntimeDimensions

- (BOOL)hasUnderlyingDomainCode
{
  return self->_underlyingDomainCode != 0;
}

- (BOOL)hasPluginId
{
  return self->_pluginId != 0;
}

- (BOOL)hasCrashPrefixHash
{
  return self->_crashPrefixHash != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRIMLRuntimeDimensions;
  v4 = [(TRIMLRuntimeDimensions *)&v8 description];
  v5 = [(TRIMLRuntimeDimensions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  underlyingDomainCode = self->_underlyingDomainCode;
  if (underlyingDomainCode) {
    [v3 setObject:underlyingDomainCode forKey:@"underlying_domain_code"];
  }
  pluginId = self->_pluginId;
  if (pluginId) {
    [v4 setObject:pluginId forKey:@"plugin_id"];
  }
  crashPrefixHash = self->_crashPrefixHash;
  if (crashPrefixHash) {
    [v4 setObject:crashPrefixHash forKey:@"crash_prefix_hash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRIMLRuntimeDimensionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_underlyingDomainCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_pluginId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_crashPrefixHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_underlyingDomainCode)
  {
    objc_msgSend(v4, "setUnderlyingDomainCode:");
    id v4 = v5;
  }
  if (self->_pluginId)
  {
    objc_msgSend(v5, "setPluginId:");
    id v4 = v5;
  }
  if (self->_crashPrefixHash)
  {
    objc_msgSend(v5, "setCrashPrefixHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_underlyingDomainCode copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_pluginId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_crashPrefixHash copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((underlyingDomainCode = self->_underlyingDomainCode, !((unint64_t)underlyingDomainCode | v4[3]))
     || -[NSString isEqual:](underlyingDomainCode, "isEqual:"))
    && ((pluginId = self->_pluginId, !((unint64_t)pluginId | v4[2]))
     || -[NSString isEqual:](pluginId, "isEqual:")))
  {
    crashPrefixHash = self->_crashPrefixHash;
    if ((unint64_t)crashPrefixHash | v4[1]) {
      char v8 = -[NSString isEqual:](crashPrefixHash, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_underlyingDomainCode hash];
  NSUInteger v4 = [(NSString *)self->_pluginId hash] ^ v3;
  return v4 ^ [(NSString *)self->_crashPrefixHash hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[TRIMLRuntimeDimensions setUnderlyingDomainCode:](self, "setUnderlyingDomainCode:");
  }
  if (v4[2]) {
    -[TRIMLRuntimeDimensions setPluginId:](self, "setPluginId:");
  }
  if (v4[1]) {
    -[TRIMLRuntimeDimensions setCrashPrefixHash:](self, "setCrashPrefixHash:");
  }
}

- (NSString)underlyingDomainCode
{
  return self->_underlyingDomainCode;
}

- (void)setUnderlyingDomainCode:(id)a3
{
}

- (NSString)pluginId
{
  return self->_pluginId;
}

- (void)setPluginId:(id)a3
{
}

- (NSString)crashPrefixHash
{
  return self->_crashPrefixHash;
}

- (void)setCrashPrefixHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDomainCode, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
  objc_storeStrong((id *)&self->_crashPrefixHash, 0);
}

@end