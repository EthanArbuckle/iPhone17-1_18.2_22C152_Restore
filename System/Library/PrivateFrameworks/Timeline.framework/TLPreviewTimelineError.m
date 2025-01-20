@interface TLPreviewTimelineError
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)errorDescription;
- (NSString)path;
- (TLPreviewTimelineError)initWithCoder:(id)a3;
- (TLPreviewTimelineError)initWithErrorType:(int64_t)a3 errorDescription:(id)a4;
- (TLPreviewTimelineError)initWithErrorType:(int64_t)a3 errorDescription:(id)a4 path:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)errorType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TLPreviewTimelineError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLPreviewTimelineError)initWithErrorType:(int64_t)a3 errorDescription:(id)a4
{
  return [(TLPreviewTimelineError *)self initWithErrorType:a3 errorDescription:a4 path:0];
}

- (TLPreviewTimelineError)initWithErrorType:(int64_t)a3 errorDescription:(id)a4 path:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TLPreviewTimelineError;
  v10 = [(TLPreviewTimelineError *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_errorType = a3;
    uint64_t v12 = [v8 copy];
    errorDescription = v11->_errorDescription;
    v11->_errorDescription = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    path = v11->_path;
    v11->_path = (NSString *)v14;
  }
  return v11;
}

- (TLPreviewTimelineError)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TLPreviewTimelineError *)self init];
  if (v5)
  {
    v5->_errorType = [v4 decodeIntegerForKey:@"errorType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorDescription"];
    errorDescription = v5->_errorDescription;
    v5->_errorDescription = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TLPreviewTimelineError *)self errorType];
  id v7 = [(TLPreviewTimelineError *)self errorDescription];
  uint64_t v6 = [(TLPreviewTimelineError *)self path];
  [v4 encodeInteger:v5 forKey:@"errorType"];
  [v4 encodeObject:v7 forKey:@"errorDescription"];
  [v4 encodeObject:v6 forKey:@"path"];
}

- (unint64_t)hash
{
  int64_t v3 = [(TLPreviewTimelineError *)self errorType];
  id v4 = [(TLPreviewTimelineError *)self errorDescription];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(TLPreviewTimelineError *)self path];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 errorType];
    int64_t v6 = [(TLPreviewTimelineError *)self errorType];
    unint64_t v7 = [v4 errorDescription];
    uint64_t v8 = [(TLPreviewTimelineError *)self errorDescription];
    if (v7 == v8)
    {
      char v11 = 1;
    }
    else
    {
      id v9 = [v4 errorDescription];
      v10 = [(TLPreviewTimelineError *)self errorDescription];
      char v11 = [v9 isEqual:v10];
    }
    v13 = [v4 path];
    uint64_t v14 = [(TLPreviewTimelineError *)self path];
    if (v13 == v14)
    {
      char v17 = 1;
    }
    else
    {
      v15 = [v4 path];
      v16 = [(TLPreviewTimelineError *)self path];
      char v17 = [v15 isEqual:v16];
    }
    if (v5 == v6) {
      char v18 = v11;
    }
    else {
      char v18 = 0;
    }
    char v12 = v18 & v17;
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [(TLPreviewTimelineError *)self errorType];
  uint64_t v5 = [(TLPreviewTimelineError *)self errorDescription];
  int64_t v6 = [(TLPreviewTimelineError *)self path];
  unint64_t v7 = [[TLPreviewTimelineError alloc] initWithErrorType:v4 errorDescription:v5 path:v6];

  return v7;
}

- (int64_t)errorType
{
  return self->_errorType;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end