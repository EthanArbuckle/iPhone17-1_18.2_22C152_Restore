@interface NTPBAVAssetKey
- (BOOL)hasCreatedAt;
- (BOOL)hasExpiresAt;
- (BOOL)hasIdentifier;
- (BOOL)hasKeyData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keyData;
- (NSString)identifier;
- (NTPBDate)createdAt;
- (NTPBDate)expiresAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setExpiresAt:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAVAssetKey

- (void)dealloc
{
  [(NTPBAVAssetKey *)self setIdentifier:0];
  [(NTPBAVAssetKey *)self setKeyData:0];
  [(NTPBAVAssetKey *)self setCreatedAt:0];
  [(NTPBAVAssetKey *)self setExpiresAt:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAssetKey;
  [(NTPBAVAssetKey *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
}

- (BOOL)hasCreatedAt
{
  return self->_createdAt != 0;
}

- (BOOL)hasExpiresAt
{
  return self->_expiresAt != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAssetKey;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAVAssetKey description](&v3, sel_description), -[NTPBAVAssetKey dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  keyData = self->_keyData;
  if (keyData) {
    [v4 setObject:keyData forKey:@"key_data"];
  }
  createdAt = self->_createdAt;
  if (createdAt) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](createdAt, "dictionaryRepresentation"), @"created_at");
  }
  expiresAt = self->_expiresAt;
  if (expiresAt) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](expiresAt, "dictionaryRepresentation"), @"expires_at");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAVAssetKeyReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_keyData) {
    PBDataWriterWriteDataField();
  }
  if (self->_createdAt) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_expiresAt)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = (id)[(NSString *)self->_identifier copyWithZone:a3];
  v5[4] = (id)[(NSData *)self->_keyData copyWithZone:a3];

  v5[1] = [(NTPBDate *)self->_createdAt copyWithZone:a3];
  v5[2] = [(NTPBDate *)self->_expiresAt copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      keyData = self->_keyData;
      if (!((unint64_t)keyData | *((void *)a3 + 4)) || (int v5 = -[NSData isEqual:](keyData, "isEqual:")) != 0)
      {
        createdAt = self->_createdAt;
        if (!((unint64_t)createdAt | *((void *)a3 + 1))
          || (int v5 = -[NTPBDate isEqual:](createdAt, "isEqual:")) != 0)
        {
          expiresAt = self->_expiresAt;
          if ((unint64_t)expiresAt | *((void *)a3 + 2))
          {
            LOBYTE(v5) = -[NTPBDate isEqual:](expiresAt, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = [(NSData *)self->_keyData hash] ^ v3;
  unint64_t v5 = [(NTPBDate *)self->_createdAt hash];
  return v4 ^ v5 ^ [(NTPBDate *)self->_expiresAt hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[NTPBAVAssetKey setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBAVAssetKey setKeyData:](self, "setKeyData:");
  }
  createdAt = self->_createdAt;
  uint64_t v6 = *((void *)a3 + 1);
  if (createdAt)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](createdAt, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBAVAssetKey setCreatedAt:](self, "setCreatedAt:");
  }
  expiresAt = self->_expiresAt;
  uint64_t v8 = *((void *)a3 + 2);
  if (expiresAt)
  {
    if (v8)
    {
      -[NTPBDate mergeFrom:](expiresAt, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBAVAssetKey setExpiresAt:](self, "setExpiresAt:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (NTPBDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (NTPBDate)expiresAt
{
  return self->_expiresAt;
}

- (void)setExpiresAt:(id)a3
{
}

@end