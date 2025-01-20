@interface PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper
- (BOOL)hasSiriRequestGrainDebugSummary;
- (BOOL)hasSiriRequestGrainMetrics;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper)initWithDictionary:(id)a3;
- (PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper)initWithJSON:(id)a3;
- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)siriRequestGrainDebugSummary;
- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)siriRequestGrainMetrics;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEventtype;
- (void)deleteSiriRequestGrainDebugSummary;
- (void)deleteSiriRequestGrainMetrics;
- (void)setHasSiriRequestGrainDebugSummary:(BOOL)a3;
- (void)setHasSiriRequestGrainMetrics:(BOOL)a3;
- (void)setSiriRequestGrainDebugSummary:(id)a3;
- (void)setSiriRequestGrainMetrics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper

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
  return @"com.apple.aiml.pnrondeviceframework.PnROnDeviceFrameworkWrapper";
}

- (id)getVersion
{
  return &unk_2707DFB38;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self whichEventtype];
  v3 = @"com.apple.aiml.pnrondeviceframework.ProvisionalPnROnDeviceFrameworkWrapper";
  if (v2 == 102) {
    v3 = @"com.apple.aiml.pnrondeviceframework.ProvisionalPnROnDeviceFrameworkWrapper.ProvisionalPnRSiriRequestGrainDebugSummary";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.pnrondeviceframework.ProvisionalPnROnDeviceFrameworkWrapper.ProvisionalPnRSiriRequestGrainSummary";
  }
  else {
    return v3;
  }
}

- (void)setSiriRequestGrainMetrics:(id)a3
{
  v4 = (PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)a3;
  siriRequestGrainDebugSummary = self->_siriRequestGrainDebugSummary;
  self->_siriRequestGrainDebugSummary = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_whichEventtype = v6;
  siriRequestGrainMetrics = self->_siriRequestGrainMetrics;
  self->_siriRequestGrainMetrics = v4;
}

- (PNROnDeviceProvisionalPnRSiriRequestGrainSummary)siriRequestGrainMetrics
{
  if (self->_whichEventtype == 101) {
    unint64_t v2 = self->_siriRequestGrainMetrics;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)deleteSiriRequestGrainMetrics
{
  if (self->_whichEventtype == 101)
  {
    self->_whichEventtype = 0;
    self->_siriRequestGrainMetrics = 0;
    MEMORY[0x270F9A758]();
  }
}

- (void)setSiriRequestGrainDebugSummary:(id)a3
{
  v4 = (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)a3;
  siriRequestGrainMetrics = self->_siriRequestGrainMetrics;
  self->_siriRequestGrainMetrics = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_whichEventtype = v6;
  siriRequestGrainDebugSummary = self->_siriRequestGrainDebugSummary;
  self->_siriRequestGrainDebugSummary = v4;
}

- (PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary)siriRequestGrainDebugSummary
{
  if (self->_whichEventtype == 102) {
    unint64_t v2 = self->_siriRequestGrainDebugSummary;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)deleteSiriRequestGrainDebugSummary
{
  if (self->_whichEventtype == 102)
  {
    self->_whichEventtype = 0;
    self->_siriRequestGrainDebugSummary = 0;
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPnROnDeviceFrameworkWrapperReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  v4 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainMetrics];

  if (v4)
  {
    v5 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainMetrics];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainDebugSummary];

  if (v6)
  {
    v7 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainDebugSummary];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichEventtype = self->_whichEventtype;
  if (whichEventtype != [v4 whichEventtype]) {
    goto LABEL_13;
  }
  unint64_t v6 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainMetrics];
  v7 = [v4 siriRequestGrainMetrics];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainMetrics];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainMetrics];
    v11 = [v4 siriRequestGrainMetrics];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainDebugSummary];
  v7 = [v4 siriRequestGrainDebugSummary];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainDebugSummary];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainDebugSummary];
    v16 = [v4 siriRequestGrainDebugSummary];
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
  unint64_t v3 = [(PNROnDeviceProvisionalPnRSiriRequestGrainSummary *)self->_siriRequestGrainMetrics hash];
  return [(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary *)self->_siriRequestGrainDebugSummary hash] ^ v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_siriRequestGrainDebugSummary)
  {
    id v4 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainDebugSummary];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"siriRequestGrainDebugSummary"];
    }
    else
    {
      unint64_t v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"siriRequestGrainDebugSummary"];
    }
  }
  if (self->_siriRequestGrainMetrics)
  {
    v7 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self siriRequestGrainMetrics];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"siriRequestGrainMetrics"];
    }
    else
    {
      v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"siriRequestGrainMetrics"];
    }
  }
  [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  unint64_t v2 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper;
  v5 = [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)&v12 init];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"siriRequestGrainMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [[PNROnDeviceProvisionalPnRSiriRequestGrainSummary alloc] initWithDictionary:v6];
      [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)v5 setSiriRequestGrainMetrics:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"siriRequestGrainDebugSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary alloc] initWithDictionary:v8];
      [(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper *)v5 setSiriRequestGrainDebugSummary:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (unint64_t)whichEventtype
{
  return self->_whichEventtype;
}

- (BOOL)hasSiriRequestGrainMetrics
{
  return self->_hasSiriRequestGrainMetrics;
}

- (void)setHasSiriRequestGrainMetrics:(BOOL)a3
{
  self->_hasSiriRequestGrainMetrics = a3;
}

- (BOOL)hasSiriRequestGrainDebugSummary
{
  return self->_hasSiriRequestGrainDebugSummary;
}

- (void)setHasSiriRequestGrainDebugSummary:(BOOL)a3
{
  self->_hasSiriRequestGrainDebugSummary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriRequestGrainDebugSummary, 0);
  objc_storeStrong((id *)&self->_siriRequestGrainMetrics, 0);
}

@end