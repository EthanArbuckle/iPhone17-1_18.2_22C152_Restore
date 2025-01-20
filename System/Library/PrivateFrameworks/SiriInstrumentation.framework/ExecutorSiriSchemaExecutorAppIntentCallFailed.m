@interface ExecutorSiriSchemaExecutorAppIntentCallFailed
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ExecutorSiriSchemaExecutorAppIntentCallFailed)initWithDictionary:(id)a3;
- (ExecutorSiriSchemaExecutorAppIntentCallFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)reason;
- (unint64_t)hash;
- (void)deleteReason;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ExecutorSiriSchemaExecutorAppIntentCallFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)reason
{
  return self->_reason;
}

- (ExecutorSiriSchemaExecutorAppIntentCallFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ExecutorSiriSchemaExecutorAppIntentCallFailed;
  v5 = [(ExecutorSiriSchemaExecutorAppIntentCallFailed *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ExecutorSiriSchemaExecutorAppIntentCallFailed setReason:](v5, "setReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (ExecutorSiriSchemaExecutorAppIntentCallFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ExecutorSiriSchemaExecutorAppIntentCallFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ExecutorSiriSchemaExecutorAppIntentCallFailed *)self dictionaryRepresentation];
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
    int v4 = [(ExecutorSiriSchemaExecutorAppIntentCallFailed *)self reason];
    v5 = @"EXECUTORAPPINTENTERROR_UNKNOWN";
    if (v4 <= 199)
    {
      switch(v4)
      {
        case 'd':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_UNKNOWN";
          break;
        case 'e':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_SYSTEMREQUIREMENT_DEVICE_UNLOCK_REQUIRED";
          break;
        case 'f':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_APP_REQUIREMENT_SIGN_IN_REQUIRED";
          break;
        case 'g':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_APP_REQUIREMENT_ACCOUNT_SETUP_REQUIRED";
          break;
        case 'h':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_APP_REQUIREMENT_USER_CONFIRMATION_REQUIRED";
          break;
        case 'i':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_SIRI_PERMISSION_REQUIRED";
          break;
        case 'j':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_SHORTCUTS_PERMISSION_REQUIRED";
          break;
        case 'k':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_PRECISE_LOCATION_PERMISSION_REQUIRED";
          break;
        case 'l':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_LOCATION_PERMISSION_REQUIRED";
          break;
        case 'm':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_WIFI_PERMISSION_REQUIRED";
          break;
        case 'n':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_BLUETOOTH_PERMISSION_REQUIRED";
          break;
        case 'o':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_PHOTOS_PERMISSION_REQUIRED";
          break;
        case 'p':
          v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_PERMISSIONREQUIREMENT_CONTACTS_PERMISSION_REQUIRED";
          break;
        default:
          switch(v4)
          {
            case 1:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_PRE_FLIGHT_CHECK_FAILURE";
              break;
            case 2:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_PRECISE_LOCATION_DISABLED";
              break;
            case 3:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_LOCATION_DISABLED";
              break;
            case 4:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_WIFI_DISABLED";
              break;
            case 5:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_BLUETOOTH_DISABLED";
              break;
            case 6:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_NETWORK_FAILURE";
              break;
            case 7:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_PARTIAL_FAILURE";
              break;
            case 8:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_UNSUPPORTED_ON_DEVICE";
              break;
            case 9:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_FEATURE_CURRENTLY_RESTRICTED";
              break;
            case 10:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_ENTITY_NOT_FOUND";
              break;
            case 11:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_ACTION_NOT_ALLOWED";
              break;
            case 12:
              v5 = @"EXECUTORAPPINTENTERROR_ACTIONFAILURE_DEVELOPER_DEFINED_ERROR";
              break;
            default:
              goto LABEL_10;
          }
          break;
      }
    }
    else
    {
      v6 = @"EXECUTORAPPINTENTERROR_RUNTIMEERROR_PROTECTED_APP_UNLOCK_REQUIRED";
      uint64_t v7 = @"EXECUTORAPPINTENTERROR_TOOLEXECUTOR_PREDEFINED";
      if (v4 != 301) {
        uint64_t v7 = @"EXECUTORAPPINTENTERROR_UNKNOWN";
      }
      if (v4 != 201) {
        v6 = v7;
      }
      if (v4 == 200) {
        v5 = @"EXECUTORAPPINTENTERROR_ACTIONREQUIREMENT_UNKNOWN";
      }
      else {
        v5 = v6;
      }
    }
LABEL_10:
    [v3 setObject:v5 forKeyedSubscript:@"reason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_reason;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int reason = self->_reason, reason == [v4 reason]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ExecutorSiriSchemaExecutorAppIntentCallFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int reason = a3;
}

@end