@interface SIRINLUUserAcknowledged
+ (BOOL)supportsSecureCoding;
- (NSUUID)systemDialogActId;
- (SIRINLUUserAcknowledged)initWithCoder:(id)a3;
- (SIRINLUUserAcknowledged)initWithSystemDialogActId:(id)a3 reference:(id)a4;
- (USOSerializedGraph)reference;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReference:(id)a3;
- (void)setSystemDialogActId:(id)a3;
@end

@implementation SIRINLUUserAcknowledged

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_systemDialogActId, 0);
}

- (void)setReference:(id)a3
{
}

- (USOSerializedGraph)reference
{
  return self->_reference;
}

- (void)setSystemDialogActId:(id)a3
{
}

- (NSUUID)systemDialogActId
{
  return self->_systemDialogActId;
}

- (id)description
{
  v3 = [(SIRINLUUserAcknowledged *)self reference];
  v4 = [v3 printedForm];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = NSString;
  v7 = [(SIRINLUUserAcknowledged *)self systemDialogActId];
  v8 = [v6 stringWithFormat:@"{UserAcknowledged\n  systemDialogActId: %@\n  reference:\n%@\n}", v7, v5];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUUserAcknowledged *)self systemDialogActId];
  [v4 encodeObject:v5 forKey:@"systemDialogActId"];

  id v6 = [(SIRINLUUserAcknowledged *)self reference];
  [v4 encodeObject:v6 forKey:@"reference"];
}

- (SIRINLUUserAcknowledged)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUUserAcknowledged;
  v5 = [(SIRINLUUserAcknowledged *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemDialogActId"];
    systemDialogActId = v5->_systemDialogActId;
    v5->_systemDialogActId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reference"];
    reference = v5->_reference;
    v5->_reference = (USOSerializedGraph *)v8;
  }
  return v5;
}

- (SIRINLUUserAcknowledged)initWithSystemDialogActId:(id)a3 reference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUUserAcknowledged;
  v9 = [(SIRINLUUserAcknowledged *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemDialogActId, a3);
    objc_storeStrong((id *)&v10->_reference, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end