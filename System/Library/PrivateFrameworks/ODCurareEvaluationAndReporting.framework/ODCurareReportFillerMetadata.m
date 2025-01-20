@interface ODCurareReportFillerMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)date;
- (NSString)selectedModelName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(id)a3;
- (void)setSelectedModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerMetadata

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerMetadata;
  v4 = [(ODCurareReportFillerMetadata *)&v8 description];
  v5 = [(ODCurareReportFillerMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  date = self->_date;
  if (date) {
    [v3 setObject:date forKey:@"date"];
  }
  selectedModelName = self->_selectedModelName;
  if (selectedModelName) {
    [v4 setObject:selectedModelName forKey:@"selectedModelName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_date) {
    -[ODCurareReportFillerMetadata writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_selectedModelName) {
    -[ODCurareReportFillerMetadata writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 setDate:date];
  [v5 setSelectedModelName:self->_selectedModelName];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_date copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_selectedModelName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((date = self->_date, !((unint64_t)date | v4[1])) || -[NSString isEqual:](date, "isEqual:")))
  {
    selectedModelName = self->_selectedModelName;
    if ((unint64_t)selectedModelName | v4[2]) {
      char v7 = -[NSString isEqual:](selectedModelName, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_date hash];
  return [(NSString *)self->_selectedModelName hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[ODCurareReportFillerMetadata setDate:](self, "setDate:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[ODCurareReportFillerMetadata setSelectedModelName:](self, "setSelectedModelName:");
    id v4 = v5;
  }
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)selectedModelName
{
  return self->_selectedModelName;
}

- (void)setSelectedModelName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedModelName, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerMetadata writeTo:]", "ODCurareReportFillerMetadata.m", 83, "nil != self->_date");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ODCurareReportFillerMetadata writeTo:]", "ODCurareReportFillerMetadata.m", 88, "nil != self->_selectedModelName");
}

@end