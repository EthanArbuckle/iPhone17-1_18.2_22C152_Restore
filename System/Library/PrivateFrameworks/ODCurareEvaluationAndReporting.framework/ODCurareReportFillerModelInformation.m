@interface ODCurareReportFillerModelInformation
- (BOOL)hasDataUsedToPersonalizeModel;
- (BOOL)hasModelCreationDate;
- (BOOL)hasModelHyperparameters;
- (BOOL)isDefaultModel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)modelCreationDate;
- (NSString)modelName;
- (ODCurareReportFillerDataSet)dataUsedToPersonalizeModel;
- (ODCurareReportFillerModelHyperparameters)modelHyperparameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataUsedToPersonalizeModel:(id)a3;
- (void)setIsDefaultModel:(BOOL)a3;
- (void)setModelCreationDate:(id)a3;
- (void)setModelHyperparameters:(id)a3;
- (void)setModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerModelInformation

- (BOOL)hasModelCreationDate
{
  return self->_modelCreationDate != 0;
}

- (BOOL)hasDataUsedToPersonalizeModel
{
  return self->_dataUsedToPersonalizeModel != 0;
}

- (BOOL)hasModelHyperparameters
{
  return self->_modelHyperparameters != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerModelInformation;
  v4 = [(ODCurareReportFillerModelInformation *)&v8 description];
  v5 = [(ODCurareReportFillerModelInformation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  modelName = self->_modelName;
  if (modelName) {
    [v3 setObject:modelName forKey:@"modelName"];
  }
  modelCreationDate = self->_modelCreationDate;
  if (modelCreationDate) {
    [v4 setObject:modelCreationDate forKey:@"modelCreationDate"];
  }
  v7 = [NSNumber numberWithBool:self->_isDefaultModel];
  [v4 setObject:v7 forKey:@"isDefaultModel"];

  dataUsedToPersonalizeModel = self->_dataUsedToPersonalizeModel;
  if (dataUsedToPersonalizeModel)
  {
    v9 = [(ODCurareReportFillerDataSet *)dataUsedToPersonalizeModel dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"dataUsedToPersonalizeModel"];
  }
  modelHyperparameters = self->_modelHyperparameters;
  if (modelHyperparameters)
  {
    v11 = [(ODCurareReportFillerModelHyperparameters *)modelHyperparameters dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"modelHyperparameters"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_modelName) {
    -[ODCurareReportFillerModelInformation writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_modelCreationDate) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteBOOLField();
  if (self->_dataUsedToPersonalizeModel) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_modelHyperparameters) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setModelName:self->_modelName];
  if (self->_modelCreationDate) {
    objc_msgSend(v5, "setModelCreationDate:");
  }
  id v4 = v5;
  v5[40] = self->_isDefaultModel;
  if (self->_dataUsedToPersonalizeModel)
  {
    objc_msgSend(v5, "setDataUsedToPersonalizeModel:");
    id v4 = v5;
  }
  if (self->_modelHyperparameters)
  {
    objc_msgSend(v5, "setModelHyperparameters:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_modelName copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_modelCreationDate copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(unsigned char *)(v5 + 40) = self->_isDefaultModel;
  id v10 = [(ODCurareReportFillerDataSet *)self->_dataUsedToPersonalizeModel copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  id v12 = [(ODCurareReportFillerModelHyperparameters *)self->_modelHyperparameters copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](modelName, "isEqual:")) {
      goto LABEL_14;
    }
  }
  modelCreationDate = self->_modelCreationDate;
  if ((unint64_t)modelCreationDate | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](modelCreationDate, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (self->_isDefaultModel)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_14:
    char v9 = 0;
    goto LABEL_15;
  }
  dataUsedToPersonalizeModel = self->_dataUsedToPersonalizeModel;
  if ((unint64_t)dataUsedToPersonalizeModel | *((void *)v4 + 1)
    && !-[ODCurareReportFillerDataSet isEqual:](dataUsedToPersonalizeModel, "isEqual:"))
  {
    goto LABEL_14;
  }
  modelHyperparameters = self->_modelHyperparameters;
  if ((unint64_t)modelHyperparameters | *((void *)v4 + 3)) {
    char v9 = -[ODCurareReportFillerModelHyperparameters isEqual:](modelHyperparameters, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelName hash];
  NSUInteger v4 = [(NSString *)self->_modelCreationDate hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_isDefaultModel;
  unint64_t v6 = v4 ^ [(ODCurareReportFillerDataSet *)self->_dataUsedToPersonalizeModel hash];
  return v6 ^ [(ODCurareReportFillerModelHyperparameters *)self->_modelHyperparameters hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  char v9 = v4;
  if (*((void *)v4 + 4))
  {
    -[ODCurareReportFillerModelInformation setModelName:](self, "setModelName:");
    NSUInteger v4 = v9;
  }
  if (*((void *)v4 + 2))
  {
    -[ODCurareReportFillerModelInformation setModelCreationDate:](self, "setModelCreationDate:");
    NSUInteger v4 = v9;
  }
  self->_isDefaultModel = v4[40];
  dataUsedToPersonalizeModel = self->_dataUsedToPersonalizeModel;
  uint64_t v6 = *((void *)v4 + 1);
  if (dataUsedToPersonalizeModel)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ODCurareReportFillerDataSet mergeFrom:](dataUsedToPersonalizeModel, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ODCurareReportFillerModelInformation setDataUsedToPersonalizeModel:](self, "setDataUsedToPersonalizeModel:");
  }
  NSUInteger v4 = v9;
LABEL_11:
  modelHyperparameters = self->_modelHyperparameters;
  uint64_t v8 = *((void *)v4 + 3);
  if (modelHyperparameters)
  {
    if (v8) {
      -[ODCurareReportFillerModelHyperparameters mergeFrom:](modelHyperparameters, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ODCurareReportFillerModelInformation setModelHyperparameters:](self, "setModelHyperparameters:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelCreationDate
{
  return self->_modelCreationDate;
}

- (void)setModelCreationDate:(id)a3
{
}

- (BOOL)isDefaultModel
{
  return self->_isDefaultModel;
}

- (void)setIsDefaultModel:(BOOL)a3
{
  self->_isDefaultModel = a3;
}

- (ODCurareReportFillerDataSet)dataUsedToPersonalizeModel
{
  return self->_dataUsedToPersonalizeModel;
}

- (void)setDataUsedToPersonalizeModel:(id)a3
{
}

- (ODCurareReportFillerModelHyperparameters)modelHyperparameters
{
  return self->_modelHyperparameters;
}

- (void)setModelHyperparameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelHyperparameters, 0);
  objc_storeStrong((id *)&self->_modelCreationDate, 0);
  objc_storeStrong((id *)&self->_dataUsedToPersonalizeModel, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerModelInformation writeTo:]", "ODCurareReportFillerModelInformation.m", 151, "nil != self->_modelName");
}

@end