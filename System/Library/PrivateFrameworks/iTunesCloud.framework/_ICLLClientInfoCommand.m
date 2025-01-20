@interface _ICLLClientInfoCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setExternalId:(uint64_t)a1;
- (void)setSharedSessionToken:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLClientInfoCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSessionToken, 0);

  objc_storeStrong((id *)&self->_externalId, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sharedSessionToken hash];
  return [(NSString *)self->_externalId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sharedSessionToken = self->_sharedSessionToken, !((unint64_t)sharedSessionToken | v4[2]))
     || -[NSString isEqual:](sharedSessionToken, "isEqual:")))
  {
    externalId = self->_externalId;
    if ((unint64_t)externalId | v4[1]) {
      char v7 = -[NSString isEqual:](externalId, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sharedSessionToken copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_externalId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sharedSessionToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_externalId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLClientInfoCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sharedSessionToken = self->_sharedSessionToken;
  if (sharedSessionToken) {
    [v3 setObject:sharedSessionToken forKey:@"sharedSessionToken"];
  }
  externalId = self->_externalId;
  if (externalId) {
    [v4 setObject:externalId forKey:@"externalId"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLClientInfoCommand;
  id v4 = [(_ICLLClientInfoCommand *)&v8 description];
  id v5 = [(_ICLLClientInfoCommand *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setSharedSessionToken:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setExternalId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

@end