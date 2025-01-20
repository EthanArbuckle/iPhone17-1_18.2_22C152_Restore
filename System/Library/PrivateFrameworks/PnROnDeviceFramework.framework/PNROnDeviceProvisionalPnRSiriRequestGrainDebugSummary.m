@interface PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary
- (BOOL)hasErrorMessage;
- (BOOL)hasTurnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorMessage;
- (NSString)turnId;
- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)initWithDictionary:(id)a3;
- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteErrorMessage;
- (void)deleteTurnId;
- (void)setErrorMessage:(id)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)setHasTurnId:(BOOL)a3;
- (void)setTurnId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary

- (BOOL)hasTurnId
{
  return self->_turnId != 0;
}

- (void)deleteTurnId
{
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteErrorMessage
{
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  v4 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self turnId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self errorMessage];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self turnId];
  id v6 = [v4 turnId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self turnId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self turnId];
    v10 = [v4 turnId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self errorMessage];
  id v6 = [v4 errorMessage];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self errorMessage];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self errorMessage];
    v15 = [v4 errorMessage];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_turnId hash];
  return [(NSString *)self->_errorMessage hash] ^ v3;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_errorMessage)
  {
    id v4 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self errorMessage];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorMessage"];
  }
  if (self->_turnId)
  {
    id v6 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self turnId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"turnId"];
  }
  [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self dictionaryRepresentation];
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

- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary;
  v5 = [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)&v12 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"turnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)v5 setTurnId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)v5 setErrorMessage:v9];
    }
    v10 = v5;
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

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void)setHasTurnId:(BOOL)a3
{
  self->_hasTurnId = a3;
}

- (void)setHasErrorMessage:(BOOL)a3
{
  self->_hasErrorMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
}

@end