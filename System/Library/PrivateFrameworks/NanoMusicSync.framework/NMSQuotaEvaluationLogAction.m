@interface NMSQuotaEvaluationLogAction
+ (id)logActionWithActionType:(unint64_t)a3 state:(id)a4;
- (NMSQuotaEvaluationLogAction)initWithActionType:(unint64_t)a3 state:(id)a4;
- (id)_identifierLogMessage;
- (id)_stringForType:(unint64_t)a3;
- (id)logMessage;
@end

@implementation NMSQuotaEvaluationLogAction

+ (id)logActionWithActionType:(unint64_t)a3 state:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithActionType:a3 state:v6];

  return v7;
}

- (NMSQuotaEvaluationLogAction)initWithActionType:(unint64_t)a3 state:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NMSQuotaEvaluationLogAction;
  v8 = [(NMSQuotaEvaluationLogAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_state, a4);
  }

  return v9;
}

- (id)_identifierLogMessage
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v4 = [(NMSQuotaEvaluationState *)self->_state mediaLibraryIdentifier];

  if (v4)
  {
    v5 = [(NMSQuotaEvaluationState *)self->_state mediaLibraryIdentifier];
    [v3 addObject:v5];
  }
  id v6 = [(NMSQuotaEvaluationState *)self->_state externalLibraryIdentifier];

  if (v6)
  {
    id v7 = [(NMSQuotaEvaluationState *)self->_state externalLibraryIdentifier];
    [v3 addObject:v7];
  }
  v8 = [v3 componentsJoinedByString:@" - "];

  return v8;
}

- (id)logMessage
{
  v3 = NSString;
  v4 = [(NMSQuotaEvaluationLogAction *)self _stringForType:self->_type];
  int64_t v5 = [(NMSQuotaEvaluationState *)self->_state containerIndex];
  int64_t v6 = [(NMSQuotaEvaluationState *)self->_state itemIndex];
  id v7 = [(NMSQuotaEvaluationLogAction *)self _identifierLogMessage];
  v8 = [v3 stringWithFormat:@"%@\tCTNR:%3ld\tITEM:%3ld\t%@\titemSize:%llu\tlistSize:%llu", v4, v5, v6, v7, -[NMSQuotaEvaluationState itemSize](self->_state, "itemSize"), -[NMSQuotaEvaluationState listTotalSize](self->_state, "listTotalSize")];

  return v8;
}

- (id)_stringForType:(unint64_t)a3
{
  if (a3 > 2) {
    return &stru_26D512A48;
  }
  else {
    return off_264633A38[a3];
  }
}

- (void).cxx_destruct
{
}

@end