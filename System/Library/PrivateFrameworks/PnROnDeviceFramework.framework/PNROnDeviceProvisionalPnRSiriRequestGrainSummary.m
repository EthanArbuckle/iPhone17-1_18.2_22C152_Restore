@interface PNROnDeviceProvisionalPnRSiriRequestGrainSummary
- (BOOL)hasError;
- (BOOL)hasRequestStatus;
- (BOOL)hasSrt;
- (BOOL)hasTurnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)error;
- (NSString)requestStatus;
- (NSString)turnId;
- (PNROnDeviceProvisionalPNRIntervalDurationMetric)srt;
- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)initWithDictionary:(id)a3;
- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteError;
- (void)deleteRequestStatus;
- (void)deleteSrt;
- (void)deleteTurnId;
- (void)setError:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasRequestStatus:(BOOL)a3;
- (void)setHasSrt:(BOOL)a3;
- (void)setHasTurnId:(BOOL)a3;
- (void)setRequestStatus:(id)a3;
- (void)setSrt:(id)a3;
- (void)setTurnId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNROnDeviceProvisionalPnRSiriRequestGrainSummary

- (BOOL)hasTurnId
{
  return self->_turnId != 0;
}

- (void)deleteTurnId
{
}

- (BOOL)hasRequestStatus
{
  return self->_requestStatus != 0;
}

- (void)deleteRequestStatus
{
}

- (BOOL)hasSrt
{
  return self->_srt != 0;
}

- (void)deleteSrt
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPnRSiriRequestGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self turnId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self requestStatus];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self srt];

  if (v6)
  {
    v7 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self srt];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self error];

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self turnId];
  v6 = [v4 turnId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self turnId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self turnId];
    id v10 = [v4 turnId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self requestStatus];
  v6 = [v4 requestStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self requestStatus];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self requestStatus];
    v15 = [v4 requestStatus];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self srt];
  v6 = [v4 srt];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self srt];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self srt];
    v20 = [v4 srt];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self error];
  v6 = [v4 error];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self error];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self error];
    v25 = [v4 error];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_turnId hash];
  NSUInteger v4 = [(NSString *)self->_requestStatus hash] ^ v3;
  unint64_t v5 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self->_srt hash];
  return v4 ^ v5 ^ [(NSString *)self->_error hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_error)
  {
    NSUInteger v4 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self error];
    unint64_t v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"error"];
  }
  if (self->_requestStatus)
  {
    v6 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self requestStatus];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"requestStatus"];
  }
  if (self->_srt)
  {
    v8 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self srt];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"srt"];
    }
    else
    {
      id v10 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v10 forKeyedSubscript:@"srt"];
    }
  }
  if (self->_turnId)
  {
    int v11 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self turnId];
    uint64_t v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"turnId"];
  }
  [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    NSUInteger v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return (NSData *)v3;
}

- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  NSUInteger v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v5 = 0;
  }
  else
  {
    self = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self initWithDictionary:v4];
    unint64_t v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PNROnDeviceProvisionalPnRSiriRequestGrainSummary;
  unint64_t v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"turnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)v5 setTurnId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"requestStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)v5 setRequestStatus:v9];
    }
    id v10 = [v4 objectForKeyedSubscript:@"srt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PNROnDeviceProvisionalPNRIntervalDurationMetric alloc] initWithDictionary:v10];
      [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)v5 setSrt:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)v5 setError:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (NSString)turnId
{
  return self->_turnId;
}

- (void)setTurnId:(id)a3
{
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
}

- (PNROnDeviceProvisionalPNRIntervalDurationMetric)srt
{
  return self->_srt;
}

- (void)setSrt:(id)a3
{
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void)setHasTurnId:(BOOL)a3
{
  self->_hasTurnId = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  self->_hasRequestStatus = a3;
}

- (void)setHasSrt:(BOOL)a3
{
  self->_hasSrt = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_srt, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
}

@end