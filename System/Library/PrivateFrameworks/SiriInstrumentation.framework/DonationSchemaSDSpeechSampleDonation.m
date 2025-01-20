@interface DonationSchemaSDSpeechSampleDonation
- (BOOL)hasAsrTask;
- (BOOL)hasAudioCaptureDevice;
- (BOOL)hasCaptureDate;
- (BOOL)hasDonationID;
- (BOOL)hasDonorBundleID;
- (BOOL)hasEvaluation;
- (BOOL)hasExpected;
- (BOOL)hasLocale;
- (BOOL)hasTranscription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DonationSchemaSDSpeechSampleDonation)initWithDictionary:(id)a3;
- (DonationSchemaSDSpeechSampleDonation)initWithJSON:(id)a3;
- (NSArray)attributes;
- (NSData)jsonData;
- (NSString)donorBundleID;
- (NSString)expected;
- (NSString)transcription;
- (SISchemaUUID)donationID;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)asrTask;
- (int)attributesAtIndex:(unint64_t)a3;
- (int)audioCaptureDevice;
- (int)evaluation;
- (int)locale;
- (unint64_t)attributesCount;
- (unint64_t)captureDate;
- (unint64_t)hash;
- (void)addAttributes:(int)a3;
- (void)clearAttributes;
- (void)deleteAsrTask;
- (void)deleteAudioCaptureDevice;
- (void)deleteCaptureDate;
- (void)deleteDonationID;
- (void)deleteDonorBundleID;
- (void)deleteEvaluation;
- (void)deleteExpected;
- (void)deleteLocale;
- (void)deleteTranscription;
- (void)setAsrTask:(int)a3;
- (void)setAttributes:(id)a3;
- (void)setAudioCaptureDevice:(int)a3;
- (void)setCaptureDate:(unint64_t)a3;
- (void)setDonationID:(id)a3;
- (void)setDonorBundleID:(id)a3;
- (void)setEvaluation:(int)a3;
- (void)setExpected:(id)a3;
- (void)setHasAsrTask:(BOOL)a3;
- (void)setHasAudioCaptureDevice:(BOOL)a3;
- (void)setHasCaptureDate:(BOOL)a3;
- (void)setHasDonationID:(BOOL)a3;
- (void)setHasDonorBundleID:(BOOL)a3;
- (void)setHasEvaluation:(BOOL)a3;
- (void)setHasExpected:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasTranscription:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)setTranscription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DonationSchemaSDSpeechSampleDonation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DonationSchemaSDSpeechSampleDonation;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(DonationSchemaSDSpeechSampleDonation *)self deleteDonationID];
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
  objc_storeStrong((id *)&self->_expected, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_donorBundleID, 0);
  objc_storeStrong((id *)&self->_donationID, 0);
}

- (void)setHasExpected:(BOOL)a3
{
  self->_hasDonationID = a3;
}

- (void)setHasTranscription:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasDonorBundleID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDonationID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)evaluation
{
  return self->_evaluation;
}

- (void)setExpected:(id)a3
{
}

- (NSString)expected
{
  return self->_expected;
}

- (void)setTranscription:(id)a3
{
}

- (NSString)transcription
{
  return self->_transcription;
}

- (int)asrTask
{
  return self->_asrTask;
}

- (int)locale
{
  return self->_locale;
}

- (int)audioCaptureDevice
{
  return self->_audioCaptureDevice;
}

- (void)setAttributes:(id)a3
{
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (unint64_t)captureDate
{
  return self->_captureDate;
}

- (void)setDonorBundleID:(id)a3
{
}

- (NSString)donorBundleID
{
  return self->_donorBundleID;
}

- (void)setDonationID:(id)a3
{
}

- (SISchemaUUID)donationID
{
  return self->_donationID;
}

- (DonationSchemaSDSpeechSampleDonation)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DonationSchemaSDSpeechSampleDonation;
  v5 = [(DonationSchemaSDSpeechSampleDonation *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"donationID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DonationSchemaSDSpeechSampleDonation *)v5 setDonationID:v7];
    }
    v30 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"donorBundleID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(DonationSchemaSDSpeechSampleDonation *)v5 setDonorBundleID:v9];
    }
    v29 = v8;
    v10 = [v4 objectForKeyedSubscript:@"captureDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DonationSchemaSDSpeechSampleDonation setCaptureDate:](v5, "setCaptureDate:", [v10 unsignedLongLongValue]);
    }
    v28 = v10;
    v11 = [v4 objectForKeyedSubscript:@"attributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[DonationSchemaSDSpeechSampleDonation addAttributes:](v5, "addAttributes:", [v17 intValue]);
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v14);
      }
    }
    v18 = [v4 objectForKeyedSubscript:@"audioCaptureDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DonationSchemaSDSpeechSampleDonation setAudioCaptureDevice:](v5, "setAudioCaptureDevice:", [v18 intValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DonationSchemaSDSpeechSampleDonation setLocale:](v5, "setLocale:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"asrTask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DonationSchemaSDSpeechSampleDonation setAsrTask:](v5, "setAsrTask:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"transcription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(DonationSchemaSDSpeechSampleDonation *)v5 setTranscription:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"expected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[v23 copy];
      [(DonationSchemaSDSpeechSampleDonation *)v5 setExpected:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"evaluation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DonationSchemaSDSpeechSampleDonation setEvaluation:](v5, "setEvaluation:", [v25 intValue]);
    }
    v26 = v5;
  }
  return v5;
}

- (DonationSchemaSDSpeechSampleDonation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DonationSchemaSDSpeechSampleDonation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DonationSchemaSDSpeechSampleDonation *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unsigned int v4 = [(DonationSchemaSDSpeechSampleDonation *)self asrTask] - 1;
    if (v4 > 8) {
      v5 = @"SDASRTASK_UNKNOWN";
    }
    else {
      v5 = off_1E5EBDE30[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"asrTask"];
  }
  if ([(NSArray *)self->_attributes count])
  {
    uint64_t v6 = [(DonationSchemaSDSpeechSampleDonation *)self attributes];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"attributes"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v9 = [(DonationSchemaSDSpeechSampleDonation *)self audioCaptureDevice] - 1;
    if (v9 > 0xB) {
      v10 = @"SDAUDIOCAPTUREDEVICE_UNKNOWN";
    }
    else {
      v10 = off_1E5EBDE78[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"audioCaptureDevice"];
    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DonationSchemaSDSpeechSampleDonation captureDate](self, "captureDate"));
    [v3 setObject:v11 forKeyedSubscript:@"captureDate"];
  }
  if (self->_donationID)
  {
    id v12 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"donationID"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"donationID"];
    }
  }
  if (self->_donorBundleID)
  {
    uint64_t v15 = [(DonationSchemaSDSpeechSampleDonation *)self donorBundleID];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"donorBundleID"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    int v17 = [(DonationSchemaSDSpeechSampleDonation *)self evaluation];
    v18 = @"SDTRANSCRIPTIONEVALUATION_UNKNOWN";
    if (v17 == 1) {
      v18 = @"SDTRANSCRIPTIONEVALUATION_ACCURATE";
    }
    if (v17 == 2) {
      v19 = @"SDTRANSCRIPTIONEVALUATION_INACCURATE";
    }
    else {
      v19 = v18;
    }
    [v3 setObject:v19 forKeyedSubscript:@"evaluation"];
  }
  if (self->_expected)
  {
    v20 = [(DonationSchemaSDSpeechSampleDonation *)self expected];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"expected"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v22 = [(DonationSchemaSDSpeechSampleDonation *)self locale] - 1;
    if (v22 > 0x3D) {
      v23 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v23 = off_1E5EBDED8[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"locale"];
  }
  if (self->_transcription)
  {
    v24 = [(DonationSchemaSDSpeechSampleDonation *)self transcription];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"transcription"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v13 = [(SISchemaUUID *)self->_donationID hash];
  NSUInteger v3 = [(NSString *)self->_donorBundleID hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_captureDate;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = [(NSArray *)self->_attributes hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 2654435761 * self->_audioCaptureDevice;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_locale;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_asrTask;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v8 = 0;
LABEL_11:
  NSUInteger v9 = [(NSString *)self->_transcription hash];
  NSUInteger v10 = [(NSString *)self->_expected hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_evaluation;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  uint64_t v5 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];
  uint64_t v6 = [v4 donationID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];
    NSUInteger v10 = [v4 donationID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DonationSchemaSDSpeechSampleDonation *)self donorBundleID];
  uint64_t v6 = [v4 donorBundleID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v12 = [(DonationSchemaSDSpeechSampleDonation *)self donorBundleID];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = [(DonationSchemaSDSpeechSampleDonation *)self donorBundleID];
    uint64_t v15 = [v4 donorBundleID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[76] & 1)) {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t captureDate = self->_captureDate;
    if (captureDate != [v4 captureDate]) {
      goto LABEL_41;
    }
  }
  uint64_t v5 = [(DonationSchemaSDSpeechSampleDonation *)self attributes];
  uint64_t v6 = [v4 attributes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v18 = [(DonationSchemaSDSpeechSampleDonation *)self attributes];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(DonationSchemaSDSpeechSampleDonation *)self attributes];
    v21 = [v4 attributes];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  $1F6BF52D4E9FB4461D6CDD5C73881346 has = self->_has;
  int v24 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v25 = v4[76];
  if (v24 != ((v25 >> 1) & 1)) {
    goto LABEL_41;
  }
  if (v24)
  {
    int audioCaptureDevice = self->_audioCaptureDevice;
    if (audioCaptureDevice != [v4 audioCaptureDevice]) {
      goto LABEL_41;
    }
    $1F6BF52D4E9FB4461D6CDD5C73881346 has = self->_has;
    unsigned int v25 = v4[76];
  }
  int v27 = (*(unsigned int *)&has >> 2) & 1;
  if (v27 != ((v25 >> 2) & 1)) {
    goto LABEL_41;
  }
  if (v27)
  {
    int locale = self->_locale;
    if (locale != [v4 locale]) {
      goto LABEL_41;
    }
    $1F6BF52D4E9FB4461D6CDD5C73881346 has = self->_has;
    unsigned int v25 = v4[76];
  }
  int v29 = (*(unsigned int *)&has >> 3) & 1;
  if (v29 != ((v25 >> 3) & 1)) {
    goto LABEL_41;
  }
  if (v29)
  {
    int asrTask = self->_asrTask;
    if (asrTask != [v4 asrTask]) {
      goto LABEL_41;
    }
  }
  uint64_t v5 = [(DonationSchemaSDSpeechSampleDonation *)self transcription];
  uint64_t v6 = [v4 transcription];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v31 = [(DonationSchemaSDSpeechSampleDonation *)self transcription];
  if (v31)
  {
    long long v32 = (void *)v31;
    long long v33 = [(DonationSchemaSDSpeechSampleDonation *)self transcription];
    long long v34 = [v4 transcription];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(DonationSchemaSDSpeechSampleDonation *)self expected];
  uint64_t v6 = [v4 expected];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v36 = [(DonationSchemaSDSpeechSampleDonation *)self expected];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    v38 = [(DonationSchemaSDSpeechSampleDonation *)self expected];
    v39 = [v4 expected];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int v43 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v43 == ((v4[76] >> 4) & 1))
  {
    if (!v43 || (int evaluation = self->_evaluation, evaluation == [v4 evaluation]))
    {
      BOOL v41 = 1;
      goto LABEL_42;
    }
  }
LABEL_41:
  BOOL v41 = 0;
LABEL_42:

  return v41;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];

  if (v5)
  {
    uint64_t v6 = [(DonationSchemaSDSpeechSampleDonation *)self donationID];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(DonationSchemaSDSpeechSampleDonation *)self donorBundleID];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_attributes;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "intValue", (void)v16);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
  uint64_t v14 = [(DonationSchemaSDSpeechSampleDonation *)self transcription];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  uint64_t v15 = [(DonationSchemaSDSpeechSampleDonation *)self expected];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DonationSchemaSDSpeechSampleDonationReadFrom(self, (uint64_t)a3);
}

- (void)deleteEvaluation
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasEvaluation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEvaluation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEvaluation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int evaluation = a3;
}

- (void)deleteExpected
{
}

- (BOOL)hasExpected
{
  return self->_expected != 0;
}

- (void)deleteTranscription
{
}

- (BOOL)hasTranscription
{
  return self->_transcription != 0;
}

- (void)deleteAsrTask
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAsrTask:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAsrTask
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAsrTask:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int asrTask = a3;
}

- (void)deleteLocale
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocale
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int locale = a3;
}

- (void)deleteAudioCaptureDevice
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioCaptureDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioCaptureDevice
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioCaptureDevice:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int audioCaptureDevice = a3;
}

- (int)attributesAtIndex:(unint64_t)a3
{
  char v3 = [(NSArray *)self->_attributes objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)attributesCount
{
  return [(NSArray *)self->_attributes count];
}

- (void)addAttributes:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  attributes = self->_attributes;
  if (!attributes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_attributes;
    self->_attributes = v6;

    attributes = self->_attributes;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)attributes addObject:v8];
}

- (void)clearAttributes
{
}

- (void)deleteCaptureDate
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCaptureDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCaptureDate:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t captureDate = a3;
}

- (void)deleteDonorBundleID
{
}

- (BOOL)hasDonorBundleID
{
  return self->_donorBundleID != 0;
}

- (void)deleteDonationID
{
}

- (BOOL)hasDonationID
{
  return self->_donationID != 0;
}

@end