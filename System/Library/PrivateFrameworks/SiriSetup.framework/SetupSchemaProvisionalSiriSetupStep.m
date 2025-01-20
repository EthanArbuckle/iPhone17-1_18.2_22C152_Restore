@interface SetupSchemaProvisionalSiriSetupStep
- (BOOL)hasPage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SetupSchemaProvisionalSiriSetupStep)initWithDictionary:(id)a3;
- (SetupSchemaProvisionalSiriSetupStep)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)page;
- (unint64_t)hash;
- (void)deletePage;
- (void)setHasPage:(BOOL)a3;
- (void)setPage:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SetupSchemaProvisionalSiriSetupStep

- (void)setPage:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_page = a3;
}

- (BOOL)hasPage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deletePage
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupStepReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    MEMORY[0x270F58560](a3, self->_page, 1);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((v4[12] & 1) == (*(unsigned char *)&self->_has & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0 || (int page = self->_page, page == [v4 page])) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_page;
  }
  else {
    return 0;
  }
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(SetupSchemaProvisionalSiriSetupStep *)self page] - 1;
    if (v4 > 6) {
      v5 = @"SIRISETUPPAGE_UNKNOWN";
    }
    else {
      v5 = off_264C67098[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"page"];
  }
  [(SetupSchemaProvisionalSiriSetupStep *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  v2 = [(SetupSchemaProvisionalSiriSetupStep *)self dictionaryRepresentation];
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

- (SetupSchemaProvisionalSiriSetupStep)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unsigned int v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SetupSchemaProvisionalSiriSetupStep *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupStep)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SetupSchemaProvisionalSiriSetupStep;
  v5 = [(SetupSchemaProvisionalSiriSetupStep *)&v9 init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"page"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SetupSchemaProvisionalSiriSetupStep setPage:](v5, "setPage:", [v6 intValue]);
    }
    uint64_t v7 = v5;
  }
  return v5;
}

- (int)page
{
  return self->_page;
}

@end