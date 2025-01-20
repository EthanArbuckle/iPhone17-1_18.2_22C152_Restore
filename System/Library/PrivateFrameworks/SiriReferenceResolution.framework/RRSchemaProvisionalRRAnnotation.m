@interface RRSchemaProvisionalRRAnnotation
- (BOOL)hasAnnotationAddedTimestampInSeconds;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaProvisionalRRAnnotation)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRRAnnotation)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)name;
- (unint64_t)annotationAddedTimestampInSeconds;
- (unint64_t)hash;
- (void)setAnnotationAddedTimestampInSeconds:(unint64_t)a3;
- (void)setHasAnnotationAddedTimestampInSeconds:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRRAnnotation

- (unint64_t)annotationAddedTimestampInSeconds
{
  return self->_annotationAddedTimestampInSeconds;
}

- (int)name
{
  return self->_name;
}

- (RRSchemaProvisionalRRAnnotation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RRSchemaProvisionalRRAnnotation;
  v5 = [(RRSchemaProvisionalRRAnnotation *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRRAnnotation setName:](v5, "setName:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"annotationAddedTimestampInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRRAnnotation setAnnotationAddedTimestampInSeconds:](v5, "setAnnotationAddedTimestampInSeconds:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRRAnnotation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRRAnnotation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRRAnnotation *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RRSchemaProvisionalRRAnnotation annotationAddedTimestampInSeconds](self, "annotationAddedTimestampInSeconds"));
    [v3 setObject:v5 forKeyedSubscript:@"annotationAddedTimestampInSeconds"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(RRSchemaProvisionalRRAnnotation *)self name] - 1;
    if (v6 > 4) {
      uint64_t v7 = @"RRANNOTATIONNAME_UNKNOWN";
    }
    else {
      uint64_t v7 = off_264463610[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"name"];
  }
  [(RRSchemaProvisionalRRAnnotation *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_name;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_annotationAddedTimestampInSeconds;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $0E6D5F6156607B3C37387977E703F110 has = self->_has;
  int v6 = v4[24];
  if ((v6 & 1) != (*(unsigned char *)&has & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int name = self->_name;
    if (name != [v4 name])
    {
LABEL_10:
      BOOL v9 = 0;
      goto LABEL_11;
    }
    $0E6D5F6156607B3C37387977E703F110 has = self->_has;
    int v6 = v4[24];
  }
  if (((v6 ^ *(_DWORD *)&has) & 2) != 0) {
    goto LABEL_10;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    unint64_t annotationAddedTimestampInSeconds = self->_annotationAddedTimestampInSeconds;
    if (annotationAddedTimestampInSeconds != [v4 annotationAddedTimestampInSeconds]) {
      goto LABEL_10;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRAnnotationReadFrom(self, (uint64_t)a3);
}

- (void)setHasAnnotationAddedTimestampInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAnnotationAddedTimestampInSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAnnotationAddedTimestampInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t annotationAddedTimestampInSeconds = a3;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int name = a3;
}

@end