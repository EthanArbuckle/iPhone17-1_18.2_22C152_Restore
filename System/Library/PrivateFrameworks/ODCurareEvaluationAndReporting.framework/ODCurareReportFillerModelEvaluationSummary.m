@interface ODCurareReportFillerModelEvaluationSummary
+ (Class)modelEvaluationResultsType;
- (BOOL)hasDataUsedToEvaluateModel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)modelEvaluationResults;
- (NSString)evaluationDate;
- (NSString)modelName;
- (ODCurareReportFillerDataSet)dataUsedToEvaluateModel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modelEvaluationResultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)modelEvaluationResultsCount;
- (void)addModelEvaluationResults:(id)a3;
- (void)clearModelEvaluationResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataUsedToEvaluateModel:(id)a3;
- (void)setEvaluationDate:(id)a3;
- (void)setModelEvaluationResults:(id)a3;
- (void)setModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerModelEvaluationSummary

- (void)clearModelEvaluationResults
{
}

- (void)addModelEvaluationResults:(id)a3
{
  id v4 = a3;
  modelEvaluationResults = self->_modelEvaluationResults;
  id v8 = v4;
  if (!modelEvaluationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_modelEvaluationResults;
    self->_modelEvaluationResults = v6;

    id v4 = v8;
    modelEvaluationResults = self->_modelEvaluationResults;
  }
  [(NSMutableArray *)modelEvaluationResults addObject:v4];
}

- (unint64_t)modelEvaluationResultsCount
{
  return [(NSMutableArray *)self->_modelEvaluationResults count];
}

- (id)modelEvaluationResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_modelEvaluationResults objectAtIndex:a3];
}

+ (Class)modelEvaluationResultsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDataUsedToEvaluateModel
{
  return self->_dataUsedToEvaluateModel != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerModelEvaluationSummary;
  id v4 = [(ODCurareReportFillerModelEvaluationSummary *)&v8 description];
  v5 = [(ODCurareReportFillerModelEvaluationSummary *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  modelName = self->_modelName;
  if (modelName) {
    [v3 setObject:modelName forKey:@"modelName"];
  }
  evaluationDate = self->_evaluationDate;
  if (evaluationDate) {
    [v4 setObject:evaluationDate forKey:@"evaluationDate"];
  }
  if ([(NSMutableArray *)self->_modelEvaluationResults count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_modelEvaluationResults, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v8 = self->_modelEvaluationResults;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"modelEvaluationResults"];
  }
  dataUsedToEvaluateModel = self->_dataUsedToEvaluateModel;
  if (dataUsedToEvaluateModel)
  {
    v15 = [(ODCurareReportFillerDataSet *)dataUsedToEvaluateModel dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"dataUsedToEvaluateModel"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelEvaluationSummaryReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_modelName) {
    -[ODCurareReportFillerModelEvaluationSummary writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_evaluationDate) {
    -[ODCurareReportFillerModelEvaluationSummary writeTo:]();
  }
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_modelEvaluationResults;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_dataUsedToEvaluateModel) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setModelName:self->_modelName];
  [v8 setEvaluationDate:self->_evaluationDate];
  if ([(ODCurareReportFillerModelEvaluationSummary *)self modelEvaluationResultsCount])
  {
    [v8 clearModelEvaluationResults];
    unint64_t v4 = [(ODCurareReportFillerModelEvaluationSummary *)self modelEvaluationResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ODCurareReportFillerModelEvaluationSummary *)self modelEvaluationResultsAtIndex:i];
        [v8 addModelEvaluationResults:v7];
      }
    }
  }
  if (self->_dataUsedToEvaluateModel) {
    objc_msgSend(v8, "setDataUsedToEvaluateModel:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_modelName copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_evaluationDate copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = self->_modelEvaluationResults;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (void)v19);
        [v5 addModelEvaluationResults:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v16 = [(ODCurareReportFillerDataSet *)self->_dataUsedToEvaluateModel copyWithZone:a3];
  long long v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((modelName = self->_modelName, !((unint64_t)modelName | v4[4]))
     || -[NSString isEqual:](modelName, "isEqual:"))
    && ((evaluationDate = self->_evaluationDate, !((unint64_t)evaluationDate | v4[2]))
     || -[NSString isEqual:](evaluationDate, "isEqual:"))
    && ((modelEvaluationResults = self->_modelEvaluationResults, !((unint64_t)modelEvaluationResults | v4[3]))
     || -[NSMutableArray isEqual:](modelEvaluationResults, "isEqual:")))
  {
    dataUsedToEvaluateModel = self->_dataUsedToEvaluateModel;
    if ((unint64_t)dataUsedToEvaluateModel | v4[1]) {
      char v9 = -[ODCurareReportFillerDataSet isEqual:](dataUsedToEvaluateModel, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelName hash];
  NSUInteger v4 = [(NSString *)self->_evaluationDate hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_modelEvaluationResults hash];
  return v4 ^ v5 ^ [(ODCurareReportFillerDataSet *)self->_dataUsedToEvaluateModel hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[ODCurareReportFillerModelEvaluationSummary setModelName:](self, "setModelName:");
  }
  if (*((void *)v4 + 2)) {
    -[ODCurareReportFillerModelEvaluationSummary setEvaluationDate:](self, "setEvaluationDate:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ODCurareReportFillerModelEvaluationSummary addModelEvaluationResults:](self, "addModelEvaluationResults:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  dataUsedToEvaluateModel = self->_dataUsedToEvaluateModel;
  uint64_t v11 = *((void *)v4 + 1);
  if (dataUsedToEvaluateModel)
  {
    if (v11) {
      -[ODCurareReportFillerDataSet mergeFrom:](dataUsedToEvaluateModel, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[ODCurareReportFillerModelEvaluationSummary setDataUsedToEvaluateModel:](self, "setDataUsedToEvaluateModel:");
  }
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)evaluationDate
{
  return self->_evaluationDate;
}

- (void)setEvaluationDate:(id)a3
{
}

- (NSMutableArray)modelEvaluationResults
{
  return self->_modelEvaluationResults;
}

- (void)setModelEvaluationResults:(id)a3
{
}

- (ODCurareReportFillerDataSet)dataUsedToEvaluateModel
{
  return self->_dataUsedToEvaluateModel;
}

- (void)setDataUsedToEvaluateModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelEvaluationResults, 0);
  objc_storeStrong((id *)&self->_evaluationDate, 0);
  objc_storeStrong((id *)&self->_dataUsedToEvaluateModel, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerModelEvaluationSummary writeTo:]", "ODCurareReportFillerModelEvaluationSummary.m", 165, "nil != self->_modelName");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ODCurareReportFillerModelEvaluationSummary writeTo:]", "ODCurareReportFillerModelEvaluationSummary.m", 170, "nil != self->_evaluationDate");
}

@end