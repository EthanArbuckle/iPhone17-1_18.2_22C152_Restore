@interface SIRINLUSystemReportedFailure
+ (BOOL)supportsSecureCoding;
- (NSString)renderedText;
- (NSUUID)taskId;
- (SIRINLUSystemReportedFailure)init;
- (SIRINLUSystemReportedFailure)initWithCoder:(id)a3;
- (SIRINLUSystemReportedFailure)initWithTaskId:(id)a3 reason:(id)a4 task:(id)a5;
- (USOSerializedGraph)reason;
- (USOSerializedGraph)task;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReason:(id)a3;
- (void)setRenderedText:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskId:(id)a3;
@end

@implementation SIRINLUSystemReportedFailure

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

- (void)setTask:(id)a3
{
}

- (USOSerializedGraph)task
{
  return self->_task;
}

- (void)setReason:(id)a3
{
}

- (USOSerializedGraph)reason
{
  return self->_reason;
}

- (void)setTaskId:(id)a3
{
}

- (NSUUID)taskId
{
  return self->_taskId;
}

- (void)setRenderedText:(id)a3
{
}

- (NSString)renderedText
{
  return self->renderedText;
}

- (id)description
{
  v3 = [(SIRINLUSystemReportedFailure *)self reason];
  v4 = [v3 printedForm];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = [(SIRINLUSystemReportedFailure *)self task];
  v7 = [v6 printedForm];
  v8 = +[SIRINLUPrintUtils indentLines:v7 numSpaces:4];

  v9 = NSString;
  v10 = [(SIRINLUSystemReportedFailure *)self taskId];
  v11 = [v9 stringWithFormat:@"{SystemReportedFailure\n  taskId: %@\n  reason:\n%@\n  task:\n%@\n}", v10, v5, v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSystemReportedFailure *)self taskId];
  [v4 encodeObject:v5 forKey:@"taskId"];

  v6 = [(SIRINLUSystemReportedFailure *)self reason];
  [v4 encodeObject:v6 forKey:@"reason"];

  id v7 = [(SIRINLUSystemReportedFailure *)self task];
  [v4 encodeObject:v7 forKey:@"task"];
}

- (SIRINLUSystemReportedFailure)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRINLUSystemReportedFailure;
  v5 = [(SIRINLUSystemReportedFailure *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskId"];
    taskId = v5->_taskId;
    v5->_taskId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (USOSerializedGraph *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"task"];
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v10;
  }
  return v5;
}

- (SIRINLUSystemReportedFailure)initWithTaskId:(id)a3 reason:(id)a4 task:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUSystemReportedFailure;
  v12 = [(SIRINLUSystemReportedFailure *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_taskId, a3);
    objc_storeStrong((id *)&v13->_reason, a4);
    objc_storeStrong((id *)&v13->_task, a5);
  }

  return v13;
}

- (SIRINLUSystemReportedFailure)init
{
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUSystemReportedFailure;
  return [(SIRINLUSystemReportedFailure *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end