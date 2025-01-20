@interface IFPlatformSchemaIFPlatformTargetStarted
- (BOOL)hasIfPlatformTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFPlatformSchemaIFPlatformTargetStarted)initWithDictionary:(id)a3;
- (IFPlatformSchemaIFPlatformTargetStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)ifPlatformTarget;
- (unint64_t)hash;
- (void)deleteIfPlatformTarget;
- (void)setHasIfPlatformTarget:(BOOL)a3;
- (void)setIfPlatformTarget:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFPlatformSchemaIFPlatformTargetStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)ifPlatformTarget
{
  return self->_ifPlatformTarget;
}

- (IFPlatformSchemaIFPlatformTargetStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPlatformSchemaIFPlatformTargetStarted;
  v5 = [(IFPlatformSchemaIFPlatformTargetStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifPlatformTarget"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFPlatformSchemaIFPlatformTargetStarted setIfPlatformTarget:](v5, "setIfPlatformTarget:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (IFPlatformSchemaIFPlatformTargetStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFPlatformSchemaIFPlatformTargetStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFPlatformSchemaIFPlatformTargetStarted *)self dictionaryRepresentation];
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
    int v4 = [(IFPlatformSchemaIFPlatformTargetStarted *)self ifPlatformTarget];
    v5 = @"IFPLATFORMTARGET_UNKNOWN";
    v6 = @"IFPLATFORMTARGET_RESPONSE_GENERATION_SERVICE_SETUP";
    uint64_t v7 = @"IFPLATFORMTARGET_SESSION_COORDINATOR_ACCEPT";
    if (v4 != 601) {
      uint64_t v7 = @"IFPLATFORMTARGET_UNKNOWN";
    }
    if (v4 != 501) {
      v6 = v7;
    }
    v8 = @"IFPLATFORMTARGET_FULL_PLANNER_SERVICE_SETUP";
    objc_super v9 = @"IFPLATFORMTARGET_PLAN_RESOLVER_SERVICE_SETUP";
    if (v4 != 401) {
      objc_super v9 = @"IFPLATFORMTARGET_UNKNOWN";
    }
    if (v4 != 301) {
      v8 = v9;
    }
    if (v4 <= 500) {
      v6 = v8;
    }
    v10 = @"IFPLATFORMTARGET_QUERY_DECORATION_SERVICE_SETUP";
    v11 = @"IFPLATFORMTARGET_PLAN_OVERRIDES_SERVICE_SETUP";
    if (v4 != 201) {
      v11 = @"IFPLATFORMTARGET_UNKNOWN";
    }
    if (v4 != 101) {
      v10 = v11;
    }
    if (v4 == 2) {
      v5 = @"IFPLATFORMTARGET_STANDARD_PLANNER_SETUP";
    }
    if (v4 == 1) {
      v5 = @"IFPLATFORMTARGET_STANDARD_PLANNER_MAKE_PLAN";
    }
    if (v4 > 100) {
      v5 = v10;
    }
    if (v4 <= 300) {
      v12 = v5;
    }
    else {
      v12 = v6;
    }
    [v3 setObject:v12 forKeyedSubscript:@"ifPlatformTarget"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_ifPlatformTarget;
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
        || (int ifPlatformTarget = self->_ifPlatformTarget,
            ifPlatformTarget == [v4 ifPlatformTarget]))
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
  return IFPlatformSchemaIFPlatformTargetStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteIfPlatformTarget
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIfPlatformTarget:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIfPlatformTarget
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIfPlatformTarget:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int ifPlatformTarget = a3;
}

@end