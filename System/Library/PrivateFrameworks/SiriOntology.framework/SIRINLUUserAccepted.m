@interface SIRINLUUserAccepted
+ (BOOL)supportsSecureCoding;
- (NSUUID)offerId;
- (SIRINLUUserAccepted)init;
- (SIRINLUUserAccepted)initWithCoder:(id)a3;
- (SIRINLUUserAccepted)initWithOfferId:(id)a3 reference:(id)a4;
- (USOSerializedGraph)reference;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOfferId:(id)a3;
- (void)setReference:(id)a3;
@end

@implementation SIRINLUUserAccepted

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
}

- (void)setReference:(id)a3
{
}

- (USOSerializedGraph)reference
{
  return self->_reference;
}

- (void)setOfferId:(id)a3
{
}

- (NSUUID)offerId
{
  return self->_offerId;
}

- (id)description
{
  v3 = [(SIRINLUUserAccepted *)self reference];
  v4 = [v3 printedForm];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = NSString;
  v7 = [(SIRINLUUserAccepted *)self offerId];
  v8 = [v6 stringWithFormat:@"{UserAccepted\n  offerId: %@\n  reference:\n%@\n}", v7, v5];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUUserAccepted *)self offerId];
  [v4 encodeObject:v5 forKey:@"offerId"];

  id v6 = [(SIRINLUUserAccepted *)self reference];
  [v4 encodeObject:v6 forKey:@"reference"];
}

- (SIRINLUUserAccepted)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUUserAccepted;
  v5 = [(SIRINLUUserAccepted *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerId"];
    offerId = v5->_offerId;
    v5->_offerId = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reference"];
    reference = v5->_reference;
    v5->_reference = (USOSerializedGraph *)v8;
  }
  return v5;
}

- (SIRINLUUserAccepted)initWithOfferId:(id)a3 reference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUUserAccepted;
  v9 = [(SIRINLUUserAccepted *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_offerId, a3);
    objc_storeStrong((id *)&v10->_reference, a4);
  }

  return v10;
}

- (SIRINLUUserAccepted)init
{
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUUserAccepted;
  return [(SIRINLUUserAccepted *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end