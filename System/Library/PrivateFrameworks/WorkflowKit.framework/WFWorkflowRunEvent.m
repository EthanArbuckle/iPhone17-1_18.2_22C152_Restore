@interface WFWorkflowRunEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSString)source;
- (NSString)triggerID;
- (WFWorkflowReference)workflow;
- (WFWorkflowRunEvent)initWithCoder:(id)a3;
- (WFWorkflowRunEvent)initWithIdentifier:(id)a3 workflow:(id)a4 source:(id)a5 date:(id)a6 triggerID:(id)a7 outcome:(int64_t)a8;
- (int64_t)outcome;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowRunEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

- (int64_t)outcome
{
  return self->_outcome;
}

- (NSString)triggerID
{
  return self->_triggerID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)source
{
  return self->_source;
}

- (WFWorkflowReference)workflow
{
  return self->_workflow;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFWorkflowRunEvent;
  id v4 = a3;
  [(WFWorkflowRunEvent *)&v9 encodeWithCoder:v4];
  v5 = [(WFWorkflowRunEvent *)self workflow];
  [v4 encodeObject:v5 forKey:@"workflow"];

  v6 = [(WFWorkflowRunEvent *)self source];
  [v4 encodeObject:v6 forKey:@"source"];

  v7 = [(WFWorkflowRunEvent *)self date];
  [v4 encodeObject:v7 forKey:@"date"];

  v8 = [(WFWorkflowRunEvent *)self triggerID];
  [v4 encodeObject:v8 forKey:@"triggerID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFWorkflowRunEvent outcome](self, "outcome"), @"outcome");
}

- (WFWorkflowRunEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFWorkflowRunEvent;
  v5 = [(WFWorkflowRunEvent *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflow"];
    workflow = v5->_workflow;
    v5->_workflow = (WFWorkflowReference *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerID"];
    triggerID = v5->_triggerID;
    v5->_triggerID = (NSString *)v12;

    v5->_outcome = [v4 decodeIntegerForKey:@"outcome"];
    v14 = v5;
  }

  return v5;
}

- (WFWorkflowRunEvent)initWithIdentifier:(id)a3 workflow:(id)a4 source:(id)a5 date:(id)a6 triggerID:(id)a7 outcome:(int64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowRunEvent;
  v19 = [(WFWorkflowRunEvent *)&v25 initWithIdentifier:a3 objectType:5];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workflow, a4);
    objc_storeStrong((id *)&v20->_source, a5);
    objc_storeStrong((id *)&v20->_date, a6);
    uint64_t v21 = [v18 copy];
    triggerID = v20->_triggerID;
    v20->_triggerID = (NSString *)v21;

    v20->_outcome = a8;
    v23 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end