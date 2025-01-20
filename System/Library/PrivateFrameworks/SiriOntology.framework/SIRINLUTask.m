@interface SIRINLUTask
+ (BOOL)supportsSecureCoding;
- (SIRINLUTask)initWithCoder:(id)a3;
- (SIRINLUTask)initWithTask:(id)a3 score:(double)a4;
- (USOSerializedGraph)task;
- (double)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setScore:(double)a3;
- (void)setTask:(id)a3;
@end

@implementation SIRINLUTask

- (void).cxx_destruct
{
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
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
  v3 = [(USOSerializedGraph *)self->_task printedForm];
  v4 = +[SIRINLUPrintUtils indentLines:v3 numSpaces:4];

  v5 = [NSString stringWithFormat:@"{Task\n  task:\n%@\n  score: %f\n}", v4, *(void *)&self->_score];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUTask *)self task];
  [v4 encodeObject:v5 forKey:@"task"];

  id v6 = [NSNumber numberWithDouble:self->_score];
  [v4 encodeObject:v6 forKey:@"score"];
}

- (SIRINLUTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUTask;
  v5 = [(SIRINLUTask *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"task"];
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
    [v8 doubleValue];
    v5->_score = v9;
  }
  return v5;
}

- (SIRINLUTask)initWithTask:(id)a3 score:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUTask;
  v8 = [(SIRINLUTask *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_task, a3);
    v9->_score = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end