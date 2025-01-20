@interface BRFieldStructureSignature
- (BOOL)hasOldVersionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToSignature:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BRFieldStructureSignature)initWithLocalStatInfo:(id)a3;
- (NSString)description;
- (NSString)oldVersionIdentifier;
- (NSString)versionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)etag;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setOldVersionIdentifier:(id)a3;
- (void)setVersionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldStructureSignature

- (id)etag
{
  v2 = [(NSString *)self->_versionIdentifier componentsSeparatedByString:@";"];
  v3 = [v2 firstObject];

  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isEquivalentToSignature:(id)a3
{
  return areSignaturesEquivalent(self, a3);
}

- (BRFieldStructureSignature)initWithLocalStatInfo:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRFieldStructureSignature;
  v5 = [(BRFieldStructureSignature *)&v19 init];
  if (v5)
  {
    v6 = [v4 ckInfo];
    v7 = [v6 etag];
    uint64_t v8 = [v4 localChangeCount];
    v9 = v7;
    v10 = v9;
    v11 = &stru_26F3822F0;
    if (v9) {
      v11 = v9;
    }
    v12 = v11;
    v13 = v12;
    if (v8)
    {
      uint64_t v14 = [(__CFString *)v12 stringByAppendingFormat:@";%llu", v8];

      v13 = (void *)v14;
    }

    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v13;

    uint64_t v16 = [v4 oldVersionIdentifier];
    oldVersionIdentifier = v5->_oldVersionIdentifier;
    v5->_oldVersionIdentifier = (NSString *)v16;
  }
  return v5;
}

- (BOOL)hasOldVersionIdentifier
{
  return self->_oldVersionIdentifier != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldStructureSignature;
  id v4 = [(BRFieldStructureSignature *)&v8 description];
  v5 = [(BRFieldStructureSignature *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier) {
    [v3 setObject:versionIdentifier forKey:@"versionIdentifier"];
  }
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if (oldVersionIdentifier) {
    [v4 setObject:oldVersionIdentifier forKey:@"oldVersionIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldStructureSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_versionIdentifier) {
    -[BRFieldStructureSignature writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_oldVersionIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setVersionIdentifier:self->_versionIdentifier];
  if (self->_oldVersionIdentifier) {
    objc_msgSend(v4, "setOldVersionIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_versionIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_oldVersionIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((versionIdentifier = self->_versionIdentifier, !((unint64_t)versionIdentifier | v4[2]))
     || -[NSString isEqual:](versionIdentifier, "isEqual:")))
  {
    oldVersionIdentifier = self->_oldVersionIdentifier;
    if ((unint64_t)oldVersionIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](oldVersionIdentifier, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_versionIdentifier hash];
  return [(NSString *)self->_oldVersionIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[BRFieldStructureSignature setVersionIdentifier:](self, "setVersionIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[BRFieldStructureSignature setOldVersionIdentifier:](self, "setOldVersionIdentifier:");
    id v4 = v5;
  }
}

- (NSString)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (void)setOldVersionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldStructureSignature writeTo:]", "BRFieldStructureSignature.m", 87, "nil != self->_versionIdentifier");
}

@end