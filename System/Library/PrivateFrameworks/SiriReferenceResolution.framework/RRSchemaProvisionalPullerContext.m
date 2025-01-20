@interface RRSchemaProvisionalPullerContext
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaProvisionalPullerContext)initWithDictionary:(id)a3;
- (RRSchemaProvisionalPullerContext)initWithJSON:(id)a3;
- (RRSchemaProvisionalPullerEnded)ended;
- (RRSchemaProvisionalPullerFailed)failed;
- (RRSchemaProvisionalPullerStarted)started;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setStarted:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalPullerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_started, 0);
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (RRSchemaProvisionalPullerContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RRSchemaProvisionalPullerContext;
  v5 = [(RRSchemaProvisionalPullerContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"started"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RRSchemaProvisionalPullerStarted alloc] initWithDictionary:v6];
      [(RRSchemaProvisionalPullerContext *)v5 setStarted:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RRSchemaProvisionalPullerEnded alloc] initWithDictionary:v8];
      [(RRSchemaProvisionalPullerContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[RRSchemaProvisionalPullerFailed alloc] initWithDictionary:v10];
      [(RRSchemaProvisionalPullerContext *)v5 setFailed:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalPullerContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalPullerContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalPullerContext *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_ended)
  {
    id v4 = [(RRSchemaProvisionalPullerContext *)self ended];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ended"];
    }
    else
    {
      v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"ended"];
    }
  }
  if (self->_failed)
  {
    uint64_t v7 = [(RRSchemaProvisionalPullerContext *)self failed];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"failed"];
    }
    else
    {
      v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"failed"];
    }
  }
  if (self->_started)
  {
    v10 = [(RRSchemaProvisionalPullerContext *)self started];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"started"];
    }
    else
    {
      v12 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v12 forKeyedSubscript:@"started"];
    }
  }
  [(RRSchemaProvisionalPullerContext *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RRSchemaProvisionalPullerStarted *)self->_started hash];
  unint64_t v4 = [(RRSchemaProvisionalPullerEnded *)self->_ended hash] ^ v3;
  return v4 ^ [(RRSchemaProvisionalPullerFailed *)self->_failed hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_18;
  }
  v6 = [(RRSchemaProvisionalPullerContext *)self started];
  uint64_t v7 = [v4 started];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(RRSchemaProvisionalPullerContext *)self started];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RRSchemaProvisionalPullerContext *)self started];
    v11 = [v4 started];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(RRSchemaProvisionalPullerContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(RRSchemaProvisionalPullerContext *)self ended];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(RRSchemaProvisionalPullerContext *)self ended];
    v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(RRSchemaProvisionalPullerContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(RRSchemaProvisionalPullerContext *)self failed];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(RRSchemaProvisionalPullerContext *)self failed];
    v21 = [v4 failed];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(RRSchemaProvisionalPullerContext *)self started];

  if (v4)
  {
    v5 = [(RRSchemaProvisionalPullerContext *)self started];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(RRSchemaProvisionalPullerContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(RRSchemaProvisionalPullerContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RRSchemaProvisionalPullerContext *)self failed];

  if (v8)
  {
    v9 = [(RRSchemaProvisionalPullerContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalPullerContextReadFrom(self, (uint64_t)a3);
}

- (RRSchemaProvisionalPullerFailed)failed
{
  if (self->_whichContextevent == 103) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (RRSchemaProvisionalPullerFailed *)a3;
  started = self->_started;
  self->_started = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
  failed = self->_failed;
  self->_failed = v4;
}

- (RRSchemaProvisionalPullerEnded)ended
{
  if (self->_whichContextevent == 102) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (RRSchemaProvisionalPullerEnded *)a3;
  started = self->_started;
  self->_started = 0;

  failed = self->_failed;
  self->_failed = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;
}

- (RRSchemaProvisionalPullerStarted)started
{
  if (self->_whichContextevent == 101) {
    v2 = self->_started;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStarted:(id)a3
{
  id v4 = (RRSchemaProvisionalPullerStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
  started = self->_started;
  self->_started = v4;
}

@end