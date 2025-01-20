@interface ICAgeVerifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContentAllowed;
- (ICAgeVerifier)initWithExpirationDate:(id)a3;
- (NSDate)verificationExpirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (void)runAgeVerification;
- (void)setStatus:(int64_t)a3;
@end

@implementation ICAgeVerifier

- (void).cxx_destruct
{
}

- (NSDate)verificationExpirationDate
{
  return self->_verificationExpirationDate;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ICAgeVerifier *)self verificationExpirationDate];
  int64_t v5 = [(ICAgeVerifier *)self status];
  if ((unint64_t)(v5 - 1) > 2) {
    v6 = @"Age verification status unknown";
  }
  else {
    v6 = off_1E5AC8E58[v5 - 1];
  }
  v7 = [v3 stringWithFormat:@"ICAgeVerifier %p - verificationExpirationDate: %@ - status: %@", self, v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICAgeVerifier *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      uint64_t v6 = [(ICAgeVerifier *)v5 status];
      if (v6 == [(ICAgeVerifier *)self status])
      {
        v7 = [(ICAgeVerifier *)v5 verificationExpirationDate];
        v8 = [(ICAgeVerifier *)self verificationExpirationDate];
        if (v7 == v8)
        {
          char v11 = 1;
        }
        else
        {
          v9 = [(ICAgeVerifier *)v5 verificationExpirationDate];
          v10 = [(ICAgeVerifier *)self verificationExpirationDate];
          char v11 = [v9 isEqual:v10];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v5[1] = [(ICAgeVerifier *)self status];
    uint64_t v6 = [(ICAgeVerifier *)self verificationExpirationDate];
    uint64_t v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[2];
    v5[2] = v7;
  }
  return v5;
}

- (BOOL)isExplicitContentAllowed
{
  return [(ICAgeVerifier *)self status] == 3;
}

- (void)runAgeVerification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(ICAgeVerifier *)self setStatus:0];
  v3 = [(ICAgeVerifier *)self verificationExpirationDate];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    int64_t v5 = [(ICAgeVerifier *)self verificationExpirationDate];
    [v5 timeIntervalSinceDate:v4];
    double v7 = v6;

    if (v7 >= 0.0)
    {
      [(ICAgeVerifier *)self setStatus:3];
      v8 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        char v11 = self;
        v9 = "%{public}@ - Age verification status is current";
        goto LABEL_9;
      }
    }
    else
    {
      [(ICAgeVerifier *)self setStatus:2];
      v8 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        char v11 = self;
        v9 = "%{public}@ - Age verification status has expired";
LABEL_9:
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
      }
    }

    goto LABEL_11;
  }
  [(ICAgeVerifier *)self setStatus:2];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    char v11 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_INFO, "%{public}@ - Provided expiration date is nil", (uint8_t *)&v10, 0xCu);
  }
LABEL_11:
}

- (ICAgeVerifier)initWithExpirationDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAgeVerifier;
  double v6 = [(ICAgeVerifier *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_verificationExpirationDate, a3);
  }

  return v7;
}

@end