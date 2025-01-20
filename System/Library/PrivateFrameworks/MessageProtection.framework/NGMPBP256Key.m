@interface NGMPBP256Key
- (BOOL)hasKeyData;
- (BOOL)hasKeychainTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keyData;
- (NSString)keychainTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keystoreAsString:(int)a3;
- (int)StringAsKeystore:(id)a3;
- (int)keystore;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeychainTag:(id)a3;
- (void)setKeystore:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBP256Key

- (BOOL)hasKeychainTag
{
  return self->_keychainTag != 0;
}

- (id)keystoreAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26427F690[a3 - 1];
  }
  return v3;
}

- (int)StringAsKeystore:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Software"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SecKey"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CTKTokenOID"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBP256Key;
  int v4 = [(NGMPBP256Key *)&v8 description];
  v5 = [(NGMPBP256Key *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  keychainTag = self->_keychainTag;
  if (keychainTag) {
    [v3 setObject:keychainTag forKey:@"keychainTag"];
  }
  unsigned int v6 = self->_keystore - 1;
  if (v6 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_keystore);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_26427F690[v6];
  }
  [v4 setObject:v7 forKey:@"keystore"];

  keyData = self->_keyData;
  if (keyData) {
    [v4 setObject:keyData forKey:@"keyData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBP256KeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_keychainTag) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteInt32Field();
  if (self->_keyData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_keychainTag)
  {
    objc_msgSend(v4, "setKeychainTag:");
    id v4 = v5;
  }
  v4[6] = self->_keystore;
  if (self->_keyData)
  {
    objc_msgSend(v5, "setKeyData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_keychainTag copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 24) = self->_keystore;
  uint64_t v8 = [(NSData *)self->_keyData copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((keychainTag = self->_keychainTag, !((unint64_t)keychainTag | v4[2]))
     || -[NSString isEqual:](keychainTag, "isEqual:"))
    && self->_keystore == *((_DWORD *)v4 + 6))
  {
    keyData = self->_keyData;
    if ((unint64_t)keyData | v4[1]) {
      char v7 = -[NSData isEqual:](keyData, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_keychainTag hash];
  uint64_t v4 = 2654435761 * self->_keystore;
  return v4 ^ v3 ^ [(NSData *)self->_keyData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NGMPBP256Key setKeychainTag:](self, "setKeychainTag:");
    uint64_t v4 = v5;
  }
  self->_keystore = v4[6];
  if (*((void *)v4 + 1))
  {
    -[NGMPBP256Key setKeyData:](self, "setKeyData:");
    uint64_t v4 = v5;
  }
}

- (NSString)keychainTag
{
  return self->_keychainTag;
}

- (void)setKeychainTag:(id)a3
{
}

- (int)keystore
{
  return self->_keystore;
}

- (void)setKeystore:(int)a3
{
  self->_keystore = a3;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainTag, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end