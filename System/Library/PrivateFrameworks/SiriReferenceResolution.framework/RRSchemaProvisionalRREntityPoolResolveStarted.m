@interface RRSchemaProvisionalRREntityPoolResolveStarted
- (BOOL)hasUsoQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaProvisionalRREntityPoolResolveStarted)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRREntityPoolResolveStarted)initWithJSON:(id)a3;
- (USOSchemaUSOGraph)usoQuery;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasUsoQuery:(BOOL)a3;
- (void)setUsoQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRREntityPoolResolveStarted

- (void).cxx_destruct
{
}

- (void)setHasUsoQuery:(BOOL)a3
{
  self->_hasUsoQuery = a3;
}

- (void)setUsoQuery:(id)a3
{
}

- (USOSchemaUSOGraph)usoQuery
{
  return self->_usoQuery;
}

- (RRSchemaProvisionalRREntityPoolResolveStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RRSchemaProvisionalRREntityPoolResolveStarted;
  v5 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"usoQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F6F180]) initWithDictionary:v6];
      [(RRSchemaProvisionalRREntityPoolResolveStarted *)v5 setUsoQuery:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRREntityPoolResolveStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self dictionaryRepresentation];
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
  if (self->_usoQuery)
  {
    id v4 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self usoQuery];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"usoQuery"];
    }
    else
    {
      v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"usoQuery"];
    }
  }
  [(RRSchemaProvisionalRREntityPoolResolveStarted *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(USOSchemaUSOGraph *)self->_usoQuery hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self usoQuery];
    v6 = [v4 usoQuery];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self usoQuery];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self usoQuery];
      v11 = [v4 usoQuery];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self usoQuery];

  if (v4)
  {
    v5 = [(RRSchemaProvisionalRREntityPoolResolveStarted *)self usoQuery];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRREntityPoolResolveStartedReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUsoQuery
{
  return self->_usoQuery != 0;
}

@end