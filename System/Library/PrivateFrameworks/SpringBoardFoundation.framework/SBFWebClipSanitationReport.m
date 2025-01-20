@interface SBFWebClipSanitationReport
- (NSError)error;
- (SBFWebClipSanitationReport)initWithWebClip:(id)a3 result:(int64_t)a4 error:(id)a5;
- (UIWebClip)webClip;
- (id)description;
- (int64_t)result;
@end

@implementation SBFWebClipSanitationReport

- (SBFWebClipSanitationReport)initWithWebClip:(id)a3 result:(int64_t)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBFWebClipSanitationReport;
  v11 = [(SBFWebClipSanitationReport *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webClip, a3);
    uint64_t v13 = [v10 copy];
    error = v12->_error;
    v12->_error = (NSError *)v13;

    v12->_result = a4;
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_webClip withName:@"webClip"];
  unint64_t v5 = self->_result;
  if (v5 > 2) {
    v6 = @"(Unknown SBFWebClipSanitizationResult)";
  }
  else {
    v6 = off_1E548DF10[v5];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"result"];
  error = self->_error;
  if (error)
  {
    id v9 = (id)[v3 appendObject:error withName:@"error"];
    unint64_t v10 = [(NSError *)self->_error code];
    if (v10 > 2) {
      v11 = @"(Unknown SBFWebClipSanitizationError)";
    }
    else {
      v11 = off_1E548DF28[v10];
    }
    id v12 = (id)[v3 appendObject:v11 withName:@"errorCode"];
  }
  uint64_t v13 = [v3 build];

  return v13;
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (int64_t)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
}

@end