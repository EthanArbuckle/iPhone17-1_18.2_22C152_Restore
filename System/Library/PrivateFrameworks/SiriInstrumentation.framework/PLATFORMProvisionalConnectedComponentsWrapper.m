@interface PLATFORMProvisionalConnectedComponentsWrapper
- (BOOL)hasClockIdentifier;
- (BOOL)hasMsg;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLATFORMProvisionalConnectedComponentsByClock)msg;
- (PLATFORMProvisionalConnectedComponentsWrapper)initWithDictionary:(id)a3;
- (PLATFORMProvisionalConnectedComponentsWrapper)initWithJSON:(id)a3;
- (SISchemaUUID)clockIdentifier;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEventtype;
- (void)deleteClockIdentifier;
- (void)deleteMsg;
- (void)setClockIdentifier:(id)a3;
- (void)setHasClockIdentifier:(BOOL)a3;
- (void)setHasMsg:(BOOL)a3;
- (void)setMsg:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLATFORMProvisionalConnectedComponentsWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msg, 0);
  objc_storeStrong((id *)&self->_clockIdentifier, 0);
}

- (void)setHasMsg:(BOOL)a3
{
  self->_hasMsg = a3;
}

- (BOOL)hasMsg
{
  return self->_hasMsg;
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  self->_hasClockIdentifier = a3;
}

- (void)setClockIdentifier:(id)a3
{
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (unint64_t)whichEventtype
{
  return self->_whichEventtype;
}

- (PLATFORMProvisionalConnectedComponentsWrapper)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLATFORMProvisionalConnectedComponentsWrapper;
  v5 = [(PLATFORMProvisionalConnectedComponentsWrapper *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clockIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLATFORMProvisionalConnectedComponentsWrapper *)v5 setClockIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"msg"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLATFORMProvisionalConnectedComponentsByClock alloc] initWithDictionary:v8];
      [(PLATFORMProvisionalConnectedComponentsWrapper *)v5 setMsg:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLATFORMProvisionalConnectedComponentsWrapper)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLATFORMProvisionalConnectedComponentsWrapper *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self dictionaryRepresentation];
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
  if (self->_clockIdentifier)
  {
    id v4 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self clockIdentifier];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clockIdentifier"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clockIdentifier"];
    }
  }
  if (self->_msg)
  {
    uint64_t v7 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self msg];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"msg"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"msg"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clockIdentifier hash];
  return [(PLATFORMProvisionalConnectedComponentsByClock *)self->_msg hash] ^ v3;
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
  v6 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self clockIdentifier];
  uint64_t v7 = [v4 clockIdentifier];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self clockIdentifier];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self clockIdentifier];
    v11 = [v4 clockIdentifier];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self msg];
  uint64_t v7 = [v4 msg];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self msg];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self msg];
    v16 = [v4 msg];
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
  id v4 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self clockIdentifier];

  if (v4)
  {
    v5 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self clockIdentifier];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self msg];

  if (v6)
  {
    uint64_t v7 = [(PLATFORMProvisionalConnectedComponentsWrapper *)self msg];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLATFORMProvisionalConnectedComponentsWrapperReadFrom(self, (uint64_t)a3);
}

- (void)deleteMsg
{
  if (self->_whichEventtype == 101)
  {
    self->_unint64_t whichEventtype = 0;
    self->_msg = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLATFORMProvisionalConnectedComponentsByClock)msg
{
  if (self->_whichEventtype == 101) {
    v2 = self->_msg;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMsg:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEventtype = v3;
  objc_storeStrong((id *)&self->_msg, a3);
}

- (void)deleteClockIdentifier
{
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

- (id)qualifiedMessageName
{
  if ([(PLATFORMProvisionalConnectedComponentsWrapper *)self whichEventtype] == 101) {
    return @"com.apple.aiml.siri.platform.ProvisionalConnectedComponentsWrapper.ProvisionalConnectedComponentsByClock";
  }
  else {
    return @"com.apple.aiml.siri.platform.ProvisionalConnectedComponentsWrapper";
  }
}

- (id)getVersion
{
  return &unk_1F06072D8;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.platform.ConnectedComponentsWrapper";
}

- (BOOL)isProvisional
{
  return 1;
}

- (int)getAnyEventType
{
  return 7;
}

@end