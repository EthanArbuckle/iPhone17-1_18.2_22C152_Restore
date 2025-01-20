@interface FCCKPResponseOperationResultErrorExtension
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPResponseOperationResultErrorExtension

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPResponseOperationResultErrorExtension;
  v4 = [(FCCKPResponseOperationResultErrorExtension *)&v8 description];
  v5 = [(FCCKPResponseOperationResultErrorExtension *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  extensionName = self->_extensionName;
  if (extensionName) {
    [v3 setObject:extensionName forKey:@"extensionName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_typeCode];
    [v4 setObject:v6 forKey:@"typeCode"];
  }
  extensionPayload = self->_extensionPayload;
  if (extensionPayload) {
    [v4 setObject:extensionPayload forKey:@"extensionPayload"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPResponseOperationResultErrorExtensionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_extensionName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_extensionPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_extensionName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_typeCode;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_extensionPayload copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  extensionName = self->_extensionName;
  if ((unint64_t)extensionName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](extensionName, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_typeCode != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  extensionPayload = self->_extensionPayload;
  if ((unint64_t)extensionPayload | *((void *)v4 + 2)) {
    char v7 = -[NSData isEqual:](extensionPayload, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_extensionName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_typeCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSData *)self->_extensionPayload hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPayload, 0);
  objc_storeStrong((id *)&self->_extensionName, 0);
}

@end