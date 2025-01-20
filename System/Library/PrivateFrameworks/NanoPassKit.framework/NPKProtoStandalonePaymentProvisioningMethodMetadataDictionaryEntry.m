@interface NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry
- (BOOL)hasMetadata;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentProvisioningMethodMetadata)metadata;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry;
  v4 = [(NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v7 = [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)metadata dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"metadata"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    objc_msgSend(v4, "setType:");
    id v4 = v5;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_type copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)self->_metadata copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((type = self->_type, !((unint64_t)type | v4[2])) || -[NSString isEqual:](type, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[1]) {
      char v7 = -[NPKProtoStandalonePaymentProvisioningMethodMetadata isEqual:](metadata, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_type hash];
  return [(NPKProtoStandalonePaymentProvisioningMethodMetadata *)self->_metadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry setType:](self, "setType:");
    id v4 = v7;
  }
  metadata = self->_metadata;
  uint64_t v6 = v4[1];
  if (metadata)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry setMetadata:](self, "setMetadata:");
  }
  id v4 = v7;
LABEL_9:
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NPKProtoStandalonePaymentProvisioningMethodMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end