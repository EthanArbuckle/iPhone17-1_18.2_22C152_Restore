@interface CLPCReportingSchemaColumn
- (CLPCReportingSchemaColumn)init;
- (NSNumber)valueID;
- (NSString)name;
- (id)dictionaryRepresentation;
- (unint64_t)format;
- (unint64_t)metadataType;
- (unint64_t)statID;
- (unint64_t)type;
- (void)setFormat:(unint64_t)a3;
- (void)setMetadataType:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setStatID:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setValueID:(id)a3;
@end

@implementation CLPCReportingSchemaColumn

- (NSNumber)valueID
{
  return self->_valueID;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)statID
{
  return self->_statID;
}

- (unint64_t)metadataType
{
  return self->_metadataType;
}

- (CLPCReportingSchemaColumn)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLPCReportingSchemaColumn;
  v2 = [(CLPCReportingSchemaColumn *)&v7 init];
  v3 = (CLPCReportingSchemaColumn *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = 0;

    v5 = v3;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  id v1 = a1;
  v11[6] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v10[0] = @"Format";
    v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "format"));
    v11[0] = v2;
    v10[1] = @"Type";
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1, "type"));
    v11[1] = v3;
    v10[2] = @"StatID";
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v1, "statID"));
    v11[2] = v4;
    v10[3] = @"MetadataType";
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1, "metadataType"));
    v11[3] = v5;
    v10[4] = @"ValueID";
    v6 = [v1 valueID];
    if (v6) {
      [v1 valueID];
    }
    else {
    objc_super v7 = [MEMORY[0x263EFF9D0] null];
    }
    v11[4] = v7;
    v10[5] = @"Name";
    v8 = [v1 name];
    v11[5] = v8;
    id v1 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];
  }
  return v1;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStatID:(unint64_t)a3
{
  self->_statID = a3;
}

- (void)setMetadataType:(unint64_t)a3
{
  self->_metadataType = a3;
}

- (void)setValueID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_valueID, 0);
}

@end