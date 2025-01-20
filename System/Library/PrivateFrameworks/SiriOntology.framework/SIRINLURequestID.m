@interface SIRINLURequestID
+ (BOOL)supportsSecureCoding;
- (NSString)connectionID;
- (NSString)idAsString;
- (NSUUID)nluRequestId;
- (SIRINLURequestID)initWithCoder:(id)a3;
- (SIRINLURequestID)initWithIdAsString:(id)a3 connectionID:(id)a4;
- (SIRINLURequestID)initWithIdAsString:(id)a3 nluRequestId:(id)a4 connectionID:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionID:(id)a3;
- (void)setIdAsString:(id)a3;
- (void)setNluRequestId:(id)a3;
@end

@implementation SIRINLURequestID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_idAsString, 0);
}

- (void)setConnectionID:(id)a3
{
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)setNluRequestId:(id)a3
{
}

- (NSUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setIdAsString:(id)a3
{
}

- (NSString)idAsString
{
  return self->_idAsString;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SIRINLURequestID *)self idAsString];
  v5 = [(SIRINLURequestID *)self nluRequestId];
  v6 = [(SIRINLURequestID *)self connectionID];
  v7 = [v3 stringWithFormat:@"{RequestID:\n  idAsString: %@\n  nluRequestId: %@\n  connectionID: %@\n}", v4, v5, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLURequestID *)self idAsString];
  [v4 encodeObject:v5 forKey:@"idAsString"];

  v6 = [(SIRINLURequestID *)self nluRequestId];
  [v4 encodeObject:v6 forKey:@"nluRequestId"];

  id v7 = [(SIRINLURequestID *)self connectionID];
  [v4 encodeObject:v7 forKey:@"connectionID"];
}

- (SIRINLURequestID)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRINLURequestID;
  v5 = [(SIRINLURequestID *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idAsString"];
    idAsString = v5->_idAsString;
    v5->_idAsString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nluRequestId"];
    nluRequestId = v5->_nluRequestId;
    v5->_nluRequestId = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionID"];
    connectionID = v5->_connectionID;
    v5->_connectionID = (NSString *)v10;
  }
  return v5;
}

- (SIRINLURequestID)initWithIdAsString:(id)a3 nluRequestId:(id)a4 connectionID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLURequestID;
  v12 = [(SIRINLURequestID *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idAsString, a3);
    objc_storeStrong((id *)&v13->_nluRequestId, a4);
    objc_storeStrong((id *)&v13->_connectionID, a5);
  }

  return v13;
}

- (SIRINLURequestID)initWithIdAsString:(id)a3 connectionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SIRINLURequestID;
  id v9 = [(SIRINLURequestID *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idAsString, a3);
    objc_storeStrong((id *)&v10->_connectionID, a4);
    id v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    nluRequestId = v10->_nluRequestId;
    v10->_nluRequestId = v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end