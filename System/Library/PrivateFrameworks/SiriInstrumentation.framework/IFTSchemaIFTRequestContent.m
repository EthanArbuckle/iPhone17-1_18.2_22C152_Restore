@interface IFTSchemaIFTRequestContent
- (BOOL)hasPromptResolution;
- (BOOL)hasSpeech;
- (BOOL)hasStop;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTRequestContent)initWithDictionary:(id)a3;
- (IFTSchemaIFTRequestContent)initWithJSON:(id)a3;
- (IFTSchemaIFTRequestContentSpeechContent)speech;
- (IFTSchemaIFTRequestContentStopContent)stop;
- (IFTSchemaIFTRequestContentTextContent)text;
- (IFTSchemaIFTSystemPromptResolution)promptResolution;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Requestcontent;
- (void)deletePromptResolution;
- (void)deleteSpeech;
- (void)deleteStop;
- (void)deleteText;
- (void)setHasPromptResolution:(BOOL)a3;
- (void)setHasSpeech:(BOOL)a3;
- (void)setHasStop:(BOOL)a3;
- (void)setHasText:(BOOL)a3;
- (void)setPromptResolution:(id)a3;
- (void)setSpeech:(id)a3;
- (void)setStop:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTRequestContent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IFTSchemaIFTRequestContent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTRequestContent *)self text];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTRequestContent *)self deleteText];
  }
  v9 = [(IFTSchemaIFTRequestContent *)self speech];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTRequestContent *)self deleteSpeech];
  }
  v12 = [(IFTSchemaIFTRequestContent *)self promptResolution];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTRequestContent *)self deletePromptResolution];
  }
  v15 = [(IFTSchemaIFTRequestContent *)self stop];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTRequestContent *)self deleteStop];
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
  objc_storeStrong((id *)&self->_stop, 0);
  objc_storeStrong((id *)&self->_promptResolution, 0);
  objc_storeStrong((id *)&self->_speech, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setHasStop:(BOOL)a3
{
  self->_hasStop = a3;
}

- (BOOL)hasStop
{
  return self->_hasStop;
}

- (void)setHasPromptResolution:(BOOL)a3
{
  self->_hasPromptResolution = a3;
}

- (BOOL)hasPromptResolution
{
  return self->_hasPromptResolution;
}

- (void)setHasSpeech:(BOOL)a3
{
  self->_hasSpeech = a3;
}

- (BOOL)hasSpeech
{
  return self->_hasSpeech;
}

- (void)setHasText:(BOOL)a3
{
  self->_hasText = a3;
}

- (BOOL)hasText
{
  return self->_hasText;
}

- (unint64_t)whichOneof_Requestcontent
{
  return self->_whichOneof_Requestcontent;
}

- (IFTSchemaIFTRequestContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTRequestContent;
  v5 = [(IFTSchemaIFTRequestContent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTRequestContentTextContent alloc] initWithDictionary:v6];
      [(IFTSchemaIFTRequestContent *)v5 setText:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"speech"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTRequestContentSpeechContent alloc] initWithDictionary:v8];
      [(IFTSchemaIFTRequestContent *)v5 setSpeech:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"promptResolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTSystemPromptResolution alloc] initWithDictionary:v10];
      [(IFTSchemaIFTRequestContent *)v5 setPromptResolution:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"stop"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTRequestContentStopContent alloc] initWithDictionary:v12];
      [(IFTSchemaIFTRequestContent *)v5 setStop:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (IFTSchemaIFTRequestContent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTRequestContent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTRequestContent *)self dictionaryRepresentation];
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
  if (self->_promptResolution)
  {
    id v4 = [(IFTSchemaIFTRequestContent *)self promptResolution];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"promptResolution"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"promptResolution"];
    }
  }
  if (self->_speech)
  {
    uint64_t v7 = [(IFTSchemaIFTRequestContent *)self speech];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"speech"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"speech"];
    }
  }
  if (self->_stop)
  {
    v10 = [(IFTSchemaIFTRequestContent *)self stop];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"stop"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"stop"];
    }
  }
  if (self->_text)
  {
    v13 = [(IFTSchemaIFTRequestContent *)self text];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"text"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"text"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTRequestContentTextContent *)self->_text hash];
  unint64_t v4 = [(IFTSchemaIFTRequestContentSpeechContent *)self->_speech hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTSystemPromptResolution *)self->_promptResolution hash];
  return v4 ^ v5 ^ [(IFTSchemaIFTRequestContentStopContent *)self->_stop hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichOneof_Requestcontent = self->_whichOneof_Requestcontent;
  if (whichOneof_Requestcontent != objc_msgSend(v4, "whichOneof_Requestcontent")) {
    goto LABEL_23;
  }
  v6 = [(IFTSchemaIFTRequestContent *)self text];
  uint64_t v7 = [v4 text];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(IFTSchemaIFTRequestContent *)self text];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTRequestContent *)self text];
    int v11 = [v4 text];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTRequestContent *)self speech];
  uint64_t v7 = [v4 speech];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(IFTSchemaIFTRequestContent *)self speech];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(IFTSchemaIFTRequestContent *)self speech];
    objc_super v16 = [v4 speech];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTRequestContent *)self promptResolution];
  uint64_t v7 = [v4 promptResolution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(IFTSchemaIFTRequestContent *)self promptResolution];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(IFTSchemaIFTRequestContent *)self promptResolution];
    v21 = [v4 promptResolution];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTRequestContent *)self stop];
  uint64_t v7 = [v4 stop];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(IFTSchemaIFTRequestContent *)self stop];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(IFTSchemaIFTRequestContent *)self stop];
    v26 = [v4 stop];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(IFTSchemaIFTRequestContent *)self text];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTRequestContent *)self text];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTRequestContent *)self speech];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTRequestContent *)self speech];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTRequestContent *)self promptResolution];

  if (v8)
  {
    v9 = [(IFTSchemaIFTRequestContent *)self promptResolution];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(IFTSchemaIFTRequestContent *)self stop];

  if (v10)
  {
    int v11 = [(IFTSchemaIFTRequestContent *)self stop];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRequestContentReadFrom(self, (uint64_t)a3);
}

- (void)deleteStop
{
  if (self->_whichOneof_Requestcontent == 4)
  {
    self->_unint64_t whichOneof_Requestcontent = 0;
    self->_stop = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestContentStopContent)stop
{
  if (self->_whichOneof_Requestcontent == 4) {
    v2 = self->_stop;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStop:(id)a3
{
  id v4 = (IFTSchemaIFTRequestContentStopContent *)a3;
  text = self->_text;
  self->_text = 0;

  speech = self->_speech;
  self->_speech = 0;

  promptResolution = self->_promptResolution;
  self->_promptResolution = 0;

  self->_unint64_t whichOneof_Requestcontent = 4 * (v4 != 0);
  stop = self->_stop;
  self->_stop = v4;
}

- (void)deletePromptResolution
{
  if (self->_whichOneof_Requestcontent == 3)
  {
    self->_unint64_t whichOneof_Requestcontent = 0;
    self->_promptResolution = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSystemPromptResolution)promptResolution
{
  if (self->_whichOneof_Requestcontent == 3) {
    v2 = self->_promptResolution;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPromptResolution:(id)a3
{
  id v4 = (IFTSchemaIFTSystemPromptResolution *)a3;
  text = self->_text;
  self->_text = 0;

  speech = self->_speech;
  self->_speech = 0;

  stop = self->_stop;
  self->_stop = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichOneof_Requestcontent = v8;
  promptResolution = self->_promptResolution;
  self->_promptResolution = v4;
}

- (void)deleteSpeech
{
  if (self->_whichOneof_Requestcontent == 2)
  {
    self->_unint64_t whichOneof_Requestcontent = 0;
    self->_speech = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestContentSpeechContent)speech
{
  if (self->_whichOneof_Requestcontent == 2) {
    v2 = self->_speech;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpeech:(id)a3
{
  id v4 = (IFTSchemaIFTRequestContentSpeechContent *)a3;
  text = self->_text;
  self->_text = 0;

  promptResolution = self->_promptResolution;
  self->_promptResolution = 0;

  stop = self->_stop;
  self->_stop = 0;

  self->_unint64_t whichOneof_Requestcontent = 2 * (v4 != 0);
  speech = self->_speech;
  self->_speech = v4;
}

- (void)deleteText
{
  if (self->_whichOneof_Requestcontent == 1)
  {
    self->_unint64_t whichOneof_Requestcontent = 0;
    self->_text = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestContentTextContent)text
{
  if (self->_whichOneof_Requestcontent == 1) {
    v2 = self->_text;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setText:(id)a3
{
  id v4 = (IFTSchemaIFTRequestContentTextContent *)a3;
  speech = self->_speech;
  self->_speech = 0;

  promptResolution = self->_promptResolution;
  self->_promptResolution = 0;

  stop = self->_stop;
  self->_stop = 0;

  self->_unint64_t whichOneof_Requestcontent = v4 != 0;
  text = self->_text;
  self->_text = v4;
}

@end