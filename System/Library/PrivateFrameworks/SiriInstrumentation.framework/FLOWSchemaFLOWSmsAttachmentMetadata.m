@interface FLOWSchemaFLOWSmsAttachmentMetadata
- (BOOL)hasLinkId;
- (BOOL)hasSmsAttachmentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWSmsAttachmentMetadata)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWSmsAttachmentMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)smsAttachmentType;
- (unint64_t)hash;
- (void)deleteLinkId;
- (void)deleteSmsAttachmentType;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasSmsAttachmentType:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setSmsAttachmentType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWSmsAttachmentMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWSmsAttachmentMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLOWSchemaFLOWSmsAttachmentMetadata *)self deleteLinkId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (int)smsAttachmentType
{
  return self->_smsAttachmentType;
}

- (FLOWSchemaFLOWSmsAttachmentMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWSmsAttachmentMetadata;
  v5 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"smsAttachmentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWSmsAttachmentMetadata setSmsAttachmentType:](v5, "setSmsAttachmentType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(FLOWSchemaFLOWSmsAttachmentMetadata *)v5 setLinkId:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWSmsAttachmentMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_linkId)
  {
    id v4 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self smsAttachmentType] - 1;
    if (v7 > 7) {
      v8 = @"FLOWSMSATTACHMENTTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EAFB58[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"smsAttachmentType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_smsAttachmentType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(SISchemaUUID *)self->_linkId hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int smsAttachmentType = self->_smsAttachmentType,
            smsAttachmentType == [v4 smsAttachmentType]))
      {
        v6 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];
        unsigned int v7 = [v4 linkId];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];
          v12 = [v4 linkId];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];

  v5 = v7;
  if (v4)
  {
    v6 = [(FLOWSchemaFLOWSmsAttachmentMetadata *)self linkId];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsAttachmentMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteSmsAttachmentType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSmsAttachmentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSmsAttachmentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSmsAttachmentType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int smsAttachmentType = a3;
}

@end