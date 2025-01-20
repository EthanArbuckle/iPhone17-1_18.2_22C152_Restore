@interface SISchemaAnyEvent
- (BOOL)hasAnyEventType;
- (BOOL)hasPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)topLevelUnionTypeClass;
- (NSData)jsonData;
- (NSData)payload;
- (SISchemaAnyEvent)initWithAnyEventType:(int)a3 payload:(id)a4;
- (SISchemaAnyEvent)initWithDictionary:(id)a3;
- (SISchemaAnyEvent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)unwrap;
- (int)anyEventType;
- (unint64_t)hash;
- (void)deleteAnyEventType;
- (void)deletePayload;
- (void)setAnyEventType:(int)a3;
- (void)setHasAnyEventType:(BOOL)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)unwrapMessageWithCompletion:(id)a3;
- (void)willProduceDictionaryRepresentation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAnyEvent

- (SISchemaAnyEvent)initWithAnyEventType:(int)a3 payload:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaAnyEvent;
  v7 = [(SISchemaAnyEvent *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SISchemaAnyEvent *)v7 setAnyEventType:v4];
    [(SISchemaAnyEvent *)v8 setPayload:v6];
  }

  return v8;
}

- (void)setPayload:(id)a3
{
}

- (void)setAnyEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_anyEventType = a3;
}

- (id)unwrap
{
  v3 = [(SISchemaAnyEvent *)self topLevelUnionTypeClass];
  if (v3)
  {
    id v4 = [v3 alloc];
    v5 = [(SISchemaAnyEvent *)self payload];
    id v6 = (void *)[v4 initWithData:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (NSData)payload
{
  return self->_payload;
}

- (Class)topLevelUnionTypeClass
{
  int v2 = [(SISchemaAnyEvent *)self anyEventType];
  v3 = 0;
  switch(v2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 106:
    case 107:
    case 108:
    case 109:
      v3 = objc_opt_class();
      break;
    default:
      break;
  }
  return (Class)v3;
}

- (int)anyEventType
{
  return self->_anyEventType;
}

- (void).cxx_destruct
{
}

- (void)willProduceDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v6 = [(SISchemaAnyEvent *)self unwrap];
  v5 = [v6 dictionaryRepresentation];
  [v4 setObject:v5 forKeyedSubscript:@"payload"];
}

- (id)suppressMessageUnderConditions
{
  int v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)unwrapMessageWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SISchemaAnyEvent *)self unwrap];
  id v6 = v5;
  if (v5) {
    [v5 unwrapMessageWithCompletion:v4];
  }
  else {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

- (void)setHasPayload:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (SISchemaAnyEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaAnyEvent;
  v5 = [(SISchemaAnyEvent *)&v11 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"anyEventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnyEvent setAnyEventType:](v5, "setAnyEventType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"payload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
      [(SISchemaAnyEvent *)v5 setPayload:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaAnyEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAnyEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  int v2 = [(SISchemaAnyEvent *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(SISchemaAnyEvent *)self anyEventType] - 1;
    if (v4 > 0x6C) {
      v5 = @"UNKNOWN_EVENT";
    }
    else {
      v5 = off_1E5EB5180[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"anyEventType"];
  }
  if (self->_payload)
  {
    id v6 = [(SISchemaAnyEvent *)self payload];
    uint64_t v7 = [v6 base64EncodedStringWithOptions:0];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"payload"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"payload"];
    }
  }
  [(SISchemaAnyEvent *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_anyEventType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_payload hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int anyEventType = self->_anyEventType, anyEventType == [v4 anyEventType]))
      {
        id v6 = [(SISchemaAnyEvent *)self payload];
        uint64_t v7 = [v4 payload];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(SISchemaAnyEvent *)self payload];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          objc_super v10 = (void *)v9;
          objc_super v11 = [(SISchemaAnyEvent *)self payload];
          v12 = [v4 payload];
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
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v4 = [(SISchemaAnyEvent *)self payload];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAnyEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePayload
{
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)deleteAnyEventType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAnyEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnyEventType
{
  return *(unsigned char *)&self->_has & 1;
}

@end