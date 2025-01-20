@interface PGGraphBusinessEdge
- (BOOL)hasProperties:(id)a3;
- (BOOL)hasRoutineInfo;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (PGGraphBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)confidence;
- (id)edgeDescription;
- (id)initFromSourceNode:(id)a3 toBusinessNode:(id)a4 confidence:(double)a5 hasRoutineInfo:(BOOL)a6 universalStartDate:(id)a7 universalEndDate:(id)a8;
- (id)propertyDictionary;
- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4;
@end

@implementation PGGraphBusinessEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (BOOL)hasRoutineInfo
{
  return self->_hasRoutineInfo;
}

- (double)confidence
{
  return self->_confidence;
}

- (id)edgeDescription
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBusinessEdge;
  uint64_t v4 = [(PGGraphOptimizedEdge *)&v9 edgeDescription];
  v5 = (void *)v4;
  if (self->_hasRoutineInfo) {
    v6 = @"Has Routine Info, ";
  }
  else {
    v6 = &stru_1F283BC78;
  }
  v7 = [v3 stringWithFormat:@"%@ (%@%@ - %@)", v4, v6, self->_universalStartDate, self->_universalEndDate];

  return v7;
}

- (id)propertyDictionary
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"confidence";
  v3 = [NSNumber numberWithDouble:self->_confidence];
  v12[0] = v3;
  v11[1] = @"routine";
  uint64_t v4 = [NSNumber numberWithBool:self->_hasRoutineInfo];
  v12[1] = v4;
  v11[2] = @"universalStartDate";
  v5 = NSNumber;
  [(NSDate *)self->_universalStartDate timeIntervalSince1970];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v12[2] = v6;
  v11[3] = @"universalEndDate";
  v7 = NSNumber;
  [(NSDate *)self->_universalEndDate timeIntervalSince1970];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v12[3] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"confidence"];
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_confidence) {
        goto LABEL_11;
      }
    }

    objc_super v9 = [v5 objectForKeyedSubscript:@"routine"];
    v7 = v9;
    if (v9)
    {
      if (self->_hasRoutineInfo != [v9 BOOLValue]) {
        goto LABEL_11;
      }
    }

    v10 = [v5 objectForKeyedSubscript:@"universalStartDate"];
    v7 = v10;
    if (v10)
    {
      [v10 doubleValue];
      double v12 = v11;
      [(NSDate *)self->_universalStartDate timeIntervalSince1970];
      if (v12 != v13) {
        goto LABEL_11;
      }
    }

    v14 = [v5 objectForKeyedSubscript:@"universalEndDate"];
    v7 = v14;
    if (!v14
      || ([v14 doubleValue],
          double v16 = v15,
          [(NSDate *)self->_universalEndDate timeIntervalSince1970],
          v16 == v17))
    {
      BOOL v18 = 1;
    }
    else
    {
LABEL_11:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PGGraphBusinessEdge;
  [(PGGraphOptimizedEdge *)&v4 checkConsistencyOfProperties:a3 withExtraPropertyKeys:a4];
}

- (PGGraphBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  BOOL v18 = [v17 objectForKeyedSubscript:@"confidence"];

  if (v18)
  {
    v19 = v17;
  }
  else
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"confidence"];

    v22 = [v17 objectForKeyedSubscript:@"utcs"];

    if (v22)
    {
      v23 = [v17 objectForKeyedSubscript:@"utcs"];
      [v19 setObject:v23 forKeyedSubscript:@"universalStartDate"];

      [v19 setObject:0 forKeyedSubscript:@"utcs"];
    }
    v24 = [v17 objectForKeyedSubscript:@"utce"];

    if (v24)
    {
      v25 = [v17 objectForKeyedSubscript:@"utce"];
      [v19 setObject:v25 forKeyedSubscript:@"universalEndDate"];

      [v19 setObject:0 forKeyedSubscript:@"utce"];
    }
  }
  v26 = [(PGGraphBusinessEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v19];

  return v26;
}

- (PGGraphBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  PGAbstractMethodException(self, a2);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v16);
}

- (id)initFromSourceNode:(id)a3 toBusinessNode:(id)a4 confidence:(double)a5 hasRoutineInfo:(BOOL)a6 universalStartDate:(id)a7 universalEndDate:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PGGraphBusinessEdge;
  id v17 = [(PGGraphEdge *)&v20 initWithSourceNode:a3 targetNode:a4];
  p_isa = (id *)&v17->super.super.super.super.isa;
  if (v17)
  {
    v17->_confidence = a5;
    v17->_hasRoutineInfo = a6;
    objc_storeStrong((id *)&v17->_universalStartDate, a7);
    objc_storeStrong(p_isa + 8, a8);
  }

  return p_isa;
}

@end