@interface NPKProtoDeviceMetadataWithFieldsRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)metadataFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetadataFields:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoDeviceMetadataWithFieldsRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoDeviceMetadataWithFieldsRequest;
  v4 = [(NPKProtoDeviceMetadataWithFieldsRequest *)&v8 description];
  v5 = [(NPKProtoDeviceMetadataWithFieldsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_metadataFields];
  [v3 setObject:v4 forKey:@"metadataFields"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoDeviceMetadataWithFieldsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_metadataFields;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_metadataFields;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_metadataFields == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_metadataFields;
}

- (void)mergeFrom:(id)a3
{
  self->_metadataFields = *((_DWORD *)a3 + 2);
}

- (unsigned)metadataFields
{
  return self->_metadataFields;
}

- (void)setMetadataFields:(unsigned int)a3
{
  self->_metadataFields = a3;
}

@end