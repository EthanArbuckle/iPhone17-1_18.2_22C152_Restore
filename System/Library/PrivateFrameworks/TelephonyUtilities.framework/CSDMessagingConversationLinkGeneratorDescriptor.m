@interface CSDMessagingConversationLinkGeneratorDescriptor
+ (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptorWithCSDConversationLinkGeneratorDescriptor:(id)a3;
- (BOOL)hasGeneratorID;
- (BOOL)hasGeneratorVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDConversationLinkGeneratorDescriptor)csdConversationLinkGeneratorDescriptor;
- (NSString)generatorID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)generatorVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGeneratorID:(id)a3;
- (void)setGeneratorVersion:(unsigned int)a3;
- (void)setHasGeneratorVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationLinkGeneratorDescriptor

+ (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptorWithCSDConversationLinkGeneratorDescriptor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CSDMessagingConversationLinkGeneratorDescriptor);
  v5 = [v3 identifier];
  [(CSDMessagingConversationLinkGeneratorDescriptor *)v4 setGeneratorID:v5];

  id v6 = [v3 version];
  [(CSDMessagingConversationLinkGeneratorDescriptor *)v4 setGeneratorVersion:v6];

  return v4;
}

- (CSDConversationLinkGeneratorDescriptor)csdConversationLinkGeneratorDescriptor
{
  id v3 = [CSDConversationLinkGeneratorDescriptor alloc];
  v4 = [(CSDMessagingConversationLinkGeneratorDescriptor *)self generatorID];
  v5 = [(CSDConversationLinkGeneratorDescriptor *)v3 initWithIdentifier:v4 version:[(CSDMessagingConversationLinkGeneratorDescriptor *)self generatorVersion]];

  return v5;
}

- (BOOL)hasGeneratorID
{
  return self->_generatorID != 0;
}

- (void)setGeneratorVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_generatorVersion = a3;
}

- (void)setHasGeneratorVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGeneratorVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationLinkGeneratorDescriptor;
  id v3 = [(CSDMessagingConversationLinkGeneratorDescriptor *)&v7 description];
  v4 = [(CSDMessagingConversationLinkGeneratorDescriptor *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  generatorID = self->_generatorID;
  if (generatorID) {
    [v3 setObject:generatorID forKey:@"generatorID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = +[NSNumber numberWithUnsignedInt:self->_generatorVersion];
    [v4 setObject:v6 forKey:@"generatorVersion"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100146304((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_generatorID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_generatorID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setGeneratorID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_generatorVersion;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_generatorID copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_generatorVersion;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  generatorID = self->_generatorID;
  if ((unint64_t)generatorID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](generatorID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_generatorVersion == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_generatorID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_generatorVersion;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[CSDMessagingConversationLinkGeneratorDescriptor setGeneratorID:](self, "setGeneratorID:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_generatorVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)generatorID
{
  return self->_generatorID;
}

- (void)setGeneratorID:(id)a3
{
}

- (unsigned)generatorVersion
{
  return self->_generatorVersion;
}

- (void).cxx_destruct
{
}

@end