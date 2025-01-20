@interface SIRINLUUserWantedToPause
+ (BOOL)supportsSecureCoding;
- (NSUUID)taskId;
- (SIRINLUUserWantedToPause)initWithCoder:(id)a3;
- (SIRINLUUserWantedToPause)initWithReference:(id)a3;
- (SIRINLUUserWantedToPause)initWithTaskId:(id)a3 reference:(id)a4;
- (USOSerializedGraph)reference;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReference:(id)a3;
- (void)setTaskId:(id)a3;
@end

@implementation SIRINLUUserWantedToPause

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

- (void)setReference:(id)a3
{
}

- (USOSerializedGraph)reference
{
  return self->_reference;
}

- (void)setTaskId:(id)a3
{
}

- (NSUUID)taskId
{
  return self->_taskId;
}

- (id)description
{
  v3 = [(SIRINLUUserWantedToPause *)self reference];
  v4 = [v3 printedForm];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = NSString;
  v7 = [(SIRINLUUserWantedToPause *)self taskId];
  v8 = [v6 stringWithFormat:@"{UserWantedToPause\n  taskId: %@\n  reference:\n%@\n}", v7, v5];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUUserWantedToPause *)self taskId];
  [v4 encodeObject:v5 forKey:@"taskId"];

  id v6 = [(SIRINLUUserWantedToPause *)self reference];
  [v4 encodeObject:v6 forKey:@"reference"];
}

- (SIRINLUUserWantedToPause)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUUserWantedToPause;
  v5 = [(SIRINLUUserWantedToPause *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskId"];
    taskId = v5->_taskId;
    v5->_taskId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reference"];
    reference = v5->_reference;
    v5->_reference = (USOSerializedGraph *)v8;
  }
  return v5;
}

- (SIRINLUUserWantedToPause)initWithTaskId:(id)a3 reference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUUserWantedToPause;
  v9 = [(SIRINLUUserWantedToPause *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskId, a3);
    objc_storeStrong((id *)&v10->_reference, a4);
  }

  return v10;
}

- (SIRINLUUserWantedToPause)initWithReference:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserWantedToPause;
  uint64_t v6 = [(SIRINLUUserWantedToPause *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reference, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end