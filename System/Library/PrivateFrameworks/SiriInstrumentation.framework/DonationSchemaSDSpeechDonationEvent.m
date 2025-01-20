@interface DonationSchemaSDSpeechDonationEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasEventMetaData;
- (BOOL)hasSpeechSampleDonation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DonationSchemaSDSpeechDonationEvent)initWithDictionary:(id)a3;
- (DonationSchemaSDSpeechDonationEvent)initWithJSON:(id)a3;
- (DonationSchemaSDSpeechDonationEventMetaData)eventMetaData;
- (DonationSchemaSDSpeechSampleDonation)speechSampleDonation;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetaData;
- (void)deleteSpeechSampleDonation;
- (void)setEventMetaData:(id)a3;
- (void)setHasEventMetaData:(BOOL)a3;
- (void)setHasSpeechSampleDonation:(BOOL)a3;
- (void)setSpeechSampleDonation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DonationSchemaSDSpeechDonationEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DonationSchemaSDSpeechDonationEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DonationSchemaSDSpeechDonationEvent *)self deleteEventMetaData];
  }
  v9 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DonationSchemaSDSpeechDonationEvent *)self deleteSpeechSampleDonation];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  if ([(DonationSchemaSDSpeechDonationEvent *)self whichEvent_Type] == 101) {
    v3 = self->_speechSampleDonation;
  }
  else {
    v3 = 0;
  }
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101) {
    return @"speechSampleDonation";
  }
  else {
    return 0;
  }
}

- (int)clockIsolationLevel
{
  if ([(DonationSchemaSDSpeechDonationEvent *)self whichEvent_Type] == 101) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSampleDonation, 0);
  objc_storeStrong((id *)&self->_eventMetaData, 0);
}

- (void)setHasSpeechSampleDonation:(BOOL)a3
{
  self->_hasSpeechSampleDonation = a3;
}

- (BOOL)hasSpeechSampleDonation
{
  return self->_hasSpeechSampleDonation;
}

- (void)setHasEventMetaData:(BOOL)a3
{
  self->_hasEventMetaData = a3;
}

- (void)setEventMetaData:(id)a3
{
}

- (DonationSchemaSDSpeechDonationEventMetaData)eventMetaData
{
  return self->_eventMetaData;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DonationSchemaSDSpeechDonationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DonationSchemaSDSpeechDonationEvent;
  v5 = [(DonationSchemaSDSpeechDonationEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetaData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[DonationSchemaSDSpeechDonationEventMetaData alloc] initWithDictionary:v6];
      [(DonationSchemaSDSpeechDonationEvent *)v5 setEventMetaData:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speechSampleDonation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[DonationSchemaSDSpeechSampleDonation alloc] initWithDictionary:v8];
      [(DonationSchemaSDSpeechDonationEvent *)v5 setSpeechSampleDonation:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (DonationSchemaSDSpeechDonationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DonationSchemaSDSpeechDonationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DonationSchemaSDSpeechDonationEvent *)self dictionaryRepresentation];
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
  if (self->_eventMetaData)
  {
    id v4 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetaData"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetaData"];
    }
  }
  if (self->_speechSampleDonation)
  {
    uint64_t v7 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"speechSampleDonation"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"speechSampleDonation"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DonationSchemaSDSpeechDonationEventMetaData *)self->_eventMetaData hash];
  return [(DonationSchemaSDSpeechSampleDonation *)self->_speechSampleDonation hash] ^ v3;
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
  v6 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];
  uint64_t v7 = [v4 eventMetaData];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];
    int v11 = [v4 eventMetaData];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];
  uint64_t v7 = [v4 speechSampleDonation];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];
    v16 = [v4 speechSampleDonation];
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

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];

  if (v4)
  {
    v5 = [(DonationSchemaSDSpeechDonationEvent *)self eventMetaData];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];

  if (v6)
  {
    uint64_t v7 = [(DonationSchemaSDSpeechDonationEvent *)self speechSampleDonation];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DonationSchemaSDSpeechDonationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSpeechSampleDonation
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechSampleDonation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DonationSchemaSDSpeechSampleDonation)speechSampleDonation
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_speechSampleDonation;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeechSampleDonation:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_speechSampleDonation, a3);
}

- (void)deleteEventMetaData
{
}

- (BOOL)hasEventMetaData
{
  return self->_eventMetaData != 0;
}

- (id)qualifiedMessageName
{
  if ([(DonationSchemaSDSpeechDonationEvent *)self whichEvent_Type] == 101) {
    return @"com.apple.aiml.donation.SDSpeechDonationEvent.SDSpeechSampleDonation";
  }
  else {
    return @"com.apple.aiml.donation.SDSpeechDonationEvent";
  }
}

- (int)getAnyEventType
{
  return 87;
}

@end