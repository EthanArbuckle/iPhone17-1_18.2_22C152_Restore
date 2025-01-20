@interface RRSchemaProvisionalPullerStarted
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (RRSchemaProvisionalPullerStarted)initWithDictionary:(id)a3;
- (RRSchemaProvisionalPullerStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalPullerStarted

- (void).cxx_destruct
{
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (RRSchemaProvisionalPullerStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RRSchemaProvisionalPullerStarted;
  v5 = [(RRSchemaProvisionalPullerStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(RRSchemaProvisionalPullerStarted *)v5 setName:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalPullerStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalPullerStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalPullerStarted *)self dictionaryRepresentation];
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
  if (self->_name)
  {
    id v4 = [(RRSchemaProvisionalPullerStarted *)self name];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  [(RRSchemaProvisionalPullerStarted *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(RRSchemaProvisionalPullerStarted *)self name];
    v6 = [v4 name];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(RRSchemaProvisionalPullerStarted *)self name];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(RRSchemaProvisionalPullerStarted *)self name];
      v11 = [v4 name];
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
  id v5 = a3;
  id v4 = [(RRSchemaProvisionalPullerStarted *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalPullerStartedReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end