@interface SIRINLUSystemReportedSuccess
+ (BOOL)supportsSecureCoding;
- (NSString)renderedText;
- (NSUUID)taskId;
- (SIRINLUSystemReportedSuccess)init;
- (SIRINLUSystemReportedSuccess)initWithCoder:(id)a3;
- (SIRINLUSystemReportedSuccess)initWithTaskId:(id)a3 task:(id)a4;
- (USOSerializedGraph)task;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRenderedText:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskId:(id)a3;
@end

@implementation SIRINLUSystemReportedSuccess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
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
  v3 = [(SIRINLUSystemReportedSuccess *)self task];
  v4 = [v3 printedForm];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = NSString;
  v7 = [(SIRINLUSystemReportedSuccess *)self taskId];
  v8 = [v6 stringWithFormat:@"{SystemReportedSuccess\n  taskId: %@\n  task:\n%@\n}", v7, v5];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSystemReportedSuccess *)self taskId];
  [v4 encodeObject:v5 forKey:@"taskId"];

  id v6 = [(SIRINLUSystemReportedSuccess *)self task];
  [v4 encodeObject:v6 forKey:@"task"];
}

- (SIRINLUSystemReportedSuccess)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUSystemReportedSuccess;
  v5 = [(SIRINLUSystemReportedSuccess *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskId"];
    taskId = v5->_taskId;
    v5->_taskId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"task"];
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v8;
  }
  return v5;
}

- (SIRINLUSystemReportedSuccess)initWithTaskId:(id)a3 task:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUSystemReportedSuccess;
  v9 = [(SIRINLUSystemReportedSuccess *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskId, a3);
    objc_storeStrong((id *)&v10->_task, a4);
  }

  return v10;
}

- (SIRINLUSystemReportedSuccess)init
{
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUSystemReportedSuccess;
  return [(SIRINLUSystemReportedSuccess *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end