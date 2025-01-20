@interface PMMPrediction
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPrediction:(id)a3;
- (NSArray)predictedItems;
- (NSDate)expirationDate;
- (PMMPrediction)initWithPredictedItems:(id)a3 expirationDate:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PMMPrediction

- (PMMPrediction)initWithPredictedItems:(id)a3 expirationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PMMPrediction;
  v9 = [(PMMPrediction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictedItems, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PMMPrediction *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMMPrediction *)self isEqualToPrediction:v5];

  return v6;
}

- (BOOL)isEqualToPrediction:(id)a3
{
  v4 = (id *)a3;
  expirationDate = self->_expirationDate;
  BOOL v6 = (NSDate *)v4[2];
  if (expirationDate == v6)
  {
  }
  else
  {
    id v7 = v6;
    id v8 = expirationDate;
    char v9 = [(NSDate *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_predictedItems;
  objc_super v12 = v11;
  if (v11 == v4[1]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSArray isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_expirationDate hash];
  return [(NSArray *)self->_predictedItems hash] - v3 + 32 * v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PredictionItems: %@\nexpirationDate: %@", self->_predictedItems, self->_expirationDate];
}

- (NSArray)predictedItems
{
  return self->_predictedItems;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_predictedItems, 0);
}

@end