@interface SIRINLUUserStatedTask
+ (BOOL)supportsSecureCoding;
- (SIRINLUUserStatedTask)initWithCoder:(id)a3;
- (SIRINLUUserStatedTask)initWithGoal:(id)a3;
- (SIRINLUUserStatedTask)initWithTask:(id)a3;
- (USOSerializedGraph)goal;
- (USOSerializedGraph)task;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGoal:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation SIRINLUUserStatedTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (void)setGoal:(id)a3
{
}

- (USOSerializedGraph)goal
{
  return self->_goal;
}

- (void)setTask:(id)a3
{
}

- (USOSerializedGraph)task
{
  return self->_task;
}

- (id)description
{
  v2 = [(SIRINLUUserStatedTask *)self task];
  v3 = [v2 printedForm];
  v4 = +[SIRINLUPrintUtils indentLines:v3 numSpaces:4];

  v5 = [NSString stringWithFormat:@"{UserStatedTask\n  task:\n%@\n}", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SIRINLUUserStatedTask *)self task];
  [v4 encodeObject:v5 forKey:@"task"];
}

- (SIRINLUUserStatedTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserStatedTask;
  id v5 = [(SIRINLUUserStatedTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"task"];
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v6;

    objc_storeStrong((id *)&v5->_goal, v5->_task);
  }

  return v5;
}

- (SIRINLUUserStatedTask)initWithGoal:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserStatedTask;
  uint64_t v6 = [(SIRINLUUserStatedTask *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    objc_storeStrong((id *)&v7->_goal, a3);
  }

  return v7;
}

- (SIRINLUUserStatedTask)initWithTask:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserStatedTask;
  uint64_t v6 = [(SIRINLUUserStatedTask *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    objc_storeStrong((id *)&v7->_goal, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end