@interface PCSManateeShareInvitation
- (BOOL)hasExportedPCSData;
- (BOOL)hasShareePublicKeyData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)exportedPCSData;
- (NSData)shareePublicKeyData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExportedPCSData:(id)a3;
- (void)setShareePublicKeyData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PCSManateeShareInvitation

- (BOOL)hasExportedPCSData
{
  return self->_exportedPCSData != 0;
}

- (BOOL)hasShareePublicKeyData
{
  return self->_shareePublicKeyData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PCSManateeShareInvitation;
  v4 = [(PCSManateeShareInvitation *)&v8 description];
  v5 = [(PCSManateeShareInvitation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  exportedPCSData = self->_exportedPCSData;
  if (exportedPCSData) {
    [v3 setObject:exportedPCSData forKey:@"exportedPCSData"];
  }
  shareePublicKeyData = self->_shareePublicKeyData;
  if (shareePublicKeyData) {
    [v4 setObject:shareePublicKeyData forKey:@"shareePublicKeyData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PCSManateeShareInvitationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_exportedPCSData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_shareePublicKeyData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_exportedPCSData)
  {
    objc_msgSend(v4, "setExportedPCSData:");
    id v4 = v5;
  }
  if (self->_shareePublicKeyData)
  {
    objc_msgSend(v5, "setShareePublicKeyData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_exportedPCSData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_shareePublicKeyData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((exportedPCSData = self->_exportedPCSData, !((unint64_t)exportedPCSData | v4[1]))
     || -[NSData isEqual:](exportedPCSData, "isEqual:")))
  {
    shareePublicKeyData = self->_shareePublicKeyData;
    if ((unint64_t)shareePublicKeyData | v4[2]) {
      char v7 = -[NSData isEqual:](shareePublicKeyData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_exportedPCSData hash];
  return [(NSData *)self->_shareePublicKeyData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[PCSManateeShareInvitation setExportedPCSData:](self, "setExportedPCSData:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[PCSManateeShareInvitation setShareePublicKeyData:](self, "setShareePublicKeyData:");
    id v4 = v5;
  }
}

- (NSData)exportedPCSData
{
  return self->_exportedPCSData;
}

- (void)setExportedPCSData:(id)a3
{
}

- (NSData)shareePublicKeyData
{
  return self->_shareePublicKeyData;
}

- (void)setShareePublicKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareePublicKeyData, 0);
  objc_storeStrong((id *)&self->_exportedPCSData, 0);
}

@end