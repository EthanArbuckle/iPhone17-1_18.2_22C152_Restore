@interface ATXProactiveSuggestionGroupedUIFeedbackResult
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionGroupedUIFeedbackResult)init;
- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithCoder:(id)a3;
- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithProto:(id)a3;
- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionGroupedUIFeedbackResult:(id)a3;
- (BOOL)isGroupSessionComplete;
- (NSDate)endDateOfLastSession;
- (NSDate)startDateOfFirstSession;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)numAbandonedSuggestions;
- (unint64_t)numEngagedSuggestions;
- (unint64_t)numRejectedSuggestions;
- (unint64_t)numSessionsWithAbandonedSuggestions;
- (unint64_t)numSessionsWithEngagedSuggestions;
- (unint64_t)numSessionsWithRejectedSuggestions;
- (void)encodeWithCoder:(id)a3;
- (void)setIsGroupSessionComplete:(BOOL)a3;
- (void)updateWithIntermediateSessionResults:(id)a3;
@end

@implementation ATXProactiveSuggestionGroupedUIFeedbackResult

- (ATXProactiveSuggestionGroupedUIFeedbackResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXProactiveSuggestionGroupedUIFeedbackResult;
  v2 = [(ATXProactiveSuggestionGroupedUIFeedbackResult *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    proto = v2->_proto;
    v2->_proto = (ATXPBProactiveSuggestionGroupedUIFeedbackResult *)v3;
  }
  return v2;
}

- (void)updateWithIntermediateSessionResults:(id)a3
{
  id v25 = a3;
  proto = self->_proto;
  v5 = [v25 engagedSuggestions];
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumEngagedSuggestions:](proto, "setNumEngagedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numEngagedSuggestions](proto, "numEngagedSuggestions")+ [v5 count]);

  objc_super v6 = self->_proto;
  v7 = [v25 rejectedSuggestions];
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumRejectedSuggestions:](v6, "setNumRejectedSuggestions:", -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numRejectedSuggestions](v6, "numRejectedSuggestions")+ [v7 count]);

  v8 = self->_proto;
  v9 = [v25 shownSuggestions];
  uint64_t v10 = [v9 count];
  v11 = [v25 engagedSuggestions];
  uint64_t v12 = [v11 count];
  v13 = [v25 rejectedSuggestions];
  -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setNumAbandonedSuggestions:](v8, "setNumAbandonedSuggestions:", v10- (v12+ [v13 count])+ -[ATXPBProactiveSuggestionGroupedUIFeedbackResult numAbandonedSuggestions](v8, "numAbandonedSuggestions"));

  uint64_t v14 = [v25 engagementType];
  if (v14)
  {
    if (v14 == 1)
    {
      [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto setNumSessionsWithRejectedSuggestions:[(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numSessionsWithRejectedSuggestions]+ 1];
    }
    else if (v14 == 2)
    {
      [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto setNumSessionsWithEngagedSuggestions:[(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numSessionsWithEngagedSuggestions]+ 1];
    }
  }
  else
  {
    [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto setNumSessionsWithAbandonedSuggestions:[(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numSessionsWithAbandonedSuggestions]+ 1];
  }
  if (![(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto hasStartDateOfFirstSessionInSeconds])
  {
    v15 = [v25 session];
    v16 = [v15 sessionStartDate];
    [v16 timeIntervalSinceReferenceDate];
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setStartDateOfFirstSessionInSeconds:](self->_proto, "setStartDateOfFirstSessionInSeconds:");
  }
  if (![(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto hasEndDateOfLastSessionInSeconds])goto LABEL_11; {
  [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto endDateOfLastSessionInSeconds];
  }
  double v18 = v17;
  v19 = [v25 session];
  v20 = [v19 sessionEndDate];
  [v20 timeIntervalSinceReferenceDate];
  double v22 = v21;

  if (v18 < v22)
  {
LABEL_11:
    v23 = [v25 session];
    v24 = [v23 sessionEndDate];
    [v24 timeIntervalSinceReferenceDate];
    -[ATXPBProactiveSuggestionGroupedUIFeedbackResult setEndDateOfLastSessionInSeconds:](self->_proto, "setEndDateOfLastSessionInSeconds:");
  }
}

- (void)setIsGroupSessionComplete:(BOOL)a3
{
}

- (BOOL)isGroupSessionComplete
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto isComplete];
}

- (unint64_t)numSessionsWithEngagedSuggestions
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numSessionsWithEngagedSuggestions];
}

- (unint64_t)numSessionsWithRejectedSuggestions
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numSessionsWithRejectedSuggestions];
}

- (unint64_t)numSessionsWithAbandonedSuggestions
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numSessionsWithAbandonedSuggestions];
}

- (unint64_t)numEngagedSuggestions
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numEngagedSuggestions];
}

- (unint64_t)numRejectedSuggestions
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numRejectedSuggestions];
}

- (unint64_t)numAbandonedSuggestions
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto numAbandonedSuggestions];
}

- (NSDate)startDateOfFirstSession
{
  if ([(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto hasStartDateOfFirstSessionInSeconds])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto startDateOfFirstSessionInSeconds];
    v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)endDateOfLastSession
{
  if ([(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto hasEndDateOfLastSessionInSeconds])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto endDateOfLastSessionInSeconds];
    v4 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (id)encodeAsProto
{
  return (id)[(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto data];
}

- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithProto:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(ATXProactiveSuggestionGroupedUIFeedbackResult *)(uint64_t)self initWithProto:v9];
    }

    goto LABEL_9;
  }
  v11.receiver = self;
  v11.super_class = (Class)ATXProactiveSuggestionGroupedUIFeedbackResult;
  objc_super v6 = [(ATXProactiveSuggestionGroupedUIFeedbackResult *)&v11 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proto, a3);
  }
  self = v7;
  v8 = self;
LABEL_10:

  return v8;
}

- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBProactiveSuggestionGroupedUIFeedbackResult alloc] initWithData:v4];

    self = [(ATXProactiveSuggestionGroupedUIFeedbackResult *)self initWithProto:v5];
    objc_super v6 = self;
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)proto
{
  return self->_proto;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXProactiveSuggestionGroupedUIFeedbackResult *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestionGroupedUIFeedbackResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  objc_super v6 = [(ATXProactiveSuggestionGroupedUIFeedbackResult *)self initWithProtoData:v5];
  return v6;
}

- (unint64_t)hash
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXProactiveSuggestionGroupedUIFeedbackResult *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionGroupedUIFeedbackResult *)self isEqualToATXProactiveSuggestionGroupedUIFeedbackResult:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionGroupedUIFeedbackResult:(id)a3
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto isEqual:*((void *)a3 + 1)];
}

- (id)jsonDict
{
  return [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_proto dictionaryRepresentation];
}

- (void).cxx_destruct
{
}

- (void)initWithProto:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138412546;
  v9 = v5;
  __int16 v10 = 2112;
  objc_super v11 = v7;
  _os_log_fault_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object Protobuf object was of class: %@", (uint8_t *)&v8, 0x16u);
}

@end