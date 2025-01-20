@interface OSALogWriteResult
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (NSString)filePath;
- (OSALogIdentity)identity;
- (OSALogWriteResult)initWithCoder:(id)a3;
- (OSALogWriteResult)initWithIdentity:(id)a3 error:(id)a4;
- (OSALogWriteResult)initWithIdentity:(id)a3 filePath:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSALogWriteResult

- (OSALogWriteResult)initWithIdentity:(id)a3 filePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OSALogWriteResult;
  v9 = [(OSALogWriteResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_filePath, a4);
    error = v10->_error;
    v10->_error = 0;
  }
  return v10;
}

- (OSALogWriteResult)initWithIdentity:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OSALogWriteResult;
  v9 = [(OSALogWriteResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    filePath = v10->_filePath;
    v10->_filePath = 0;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identity = self->_identity;
  id v5 = a3;
  [v5 encodeObject:identity forKey:@"identity"];
  [v5 encodeObject:self->_filePath forKey:@"path"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (OSALogWriteResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    id v8 = (void *)v7;
    if (v6)
    {
      v9 = [(OSALogWriteResult *)self initWithIdentity:v5 filePath:v6];
    }
    else
    {
      if (!v7)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460] format:@"OSALogWriteResult: path and error both null"];
        v10 = 0;
        goto LABEL_8;
      }
      v9 = [(OSALogWriteResult *)self initWithIdentity:v5 error:v7];
    }
    self = v9;
    v10 = self;
LABEL_8:

    goto LABEL_9;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460] format:@"OSALogWriteResult missing log identity"];
  v10 = 0;
LABEL_9:

  return v10;
}

- (OSALogIdentity)identity
{
  return self->_identity;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end