@interface POWSchemaProvisionalPOWClientEvent
- (BOOL)hasLink;
- (BOOL)hasUsage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POWSchemaProvisionalPOWClientEvent)initWithDictionary:(id)a3;
- (POWSchemaProvisionalPOWClientEvent)initWithJSON:(id)a3;
- (POWSchemaProvisionalPOWUsage)usage;
- (SISchemaRequestLinkInfo)link;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteLink;
- (void)deleteUsage;
- (void)setHasLink:(BOOL)a3;
- (void)setHasUsage:(BOOL)a3;
- (void)setLink:(id)a3;
- (void)setUsage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POWSchemaProvisionalPOWClientEvent

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.power.POWClientEvent";
}

- (id)getVersion
{
  return &unk_1F21AF1C8;
}

- (id)qualifiedMessageName
{
  if ([(POWSchemaProvisionalPOWClientEvent *)self whichEvent_Type] == 101) {
    return @"com.apple.aiml.siri.power.ProvisionalPOWClientEvent.ProvisionalPOWUsage";
  }
  else {
    return @"com.apple.aiml.siri.power.ProvisionalPOWClientEvent";
  }
}

- (BOOL)hasLink
{
  return self->_link != 0;
}

- (void)deleteLink
{
}

- (void)setUsage:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_usage, a3);
}

- (POWSchemaProvisionalPOWUsage)usage
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_usage;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)deleteUsage
{
  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    self->_usage = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POWSchemaProvisionalPOWClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  v4 = [(POWSchemaProvisionalPOWClientEvent *)self link];

  if (v4)
  {
    v5 = [(POWSchemaProvisionalPOWClientEvent *)self link];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(POWSchemaProvisionalPOWClientEvent *)self usage];

  if (v6)
  {
    v7 = [(POWSchemaProvisionalPOWClientEvent *)self usage];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_13;
  }
  v6 = [(POWSchemaProvisionalPOWClientEvent *)self link];
  v7 = [v4 link];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(POWSchemaProvisionalPOWClientEvent *)self link];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(POWSchemaProvisionalPOWClientEvent *)self link];
    v11 = [v4 link];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(POWSchemaProvisionalPOWClientEvent *)self usage];
  v7 = [v4 usage];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(POWSchemaProvisionalPOWClientEvent *)self usage];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(POWSchemaProvisionalPOWClientEvent *)self usage];
    v16 = [v4 usage];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SISchemaRequestLinkInfo *)self->_link hash];
  return [(POWSchemaProvisionalPOWUsage *)self->_usage hash] ^ v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_link)
  {
    id v4 = [(POWSchemaProvisionalPOWClientEvent *)self link];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"link"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"link"];
    }
  }
  if (self->_usage)
  {
    v7 = [(POWSchemaProvisionalPOWClientEvent *)self usage];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"usage"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"usage"];
    }
  }
  [(POWSchemaProvisionalPOWClientEvent *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(POWSchemaProvisionalPOWClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    uint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (POWSchemaProvisionalPOWClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POWSchemaProvisionalPOWClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (POWSchemaProvisionalPOWClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POWSchemaProvisionalPOWClientEvent;
  v5 = [(POWSchemaProvisionalPOWClientEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA1308]) initWithDictionary:v6];
      [(POWSchemaProvisionalPOWClientEvent *)v5 setLink:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"usage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[POWSchemaProvisionalPOWUsage alloc] initWithDictionary:v8];
      [(POWSchemaProvisionalPOWClientEvent *)v5 setUsage:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaRequestLinkInfo)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (void)setHasLink:(BOOL)a3
{
  self->_hasLink = a3;
}

- (BOOL)hasUsage
{
  return self->_hasUsage;
}

- (void)setHasUsage:(BOOL)a3
{
  self->_hasUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);

  objc_storeStrong((id *)&self->_link, 0);
}

@end