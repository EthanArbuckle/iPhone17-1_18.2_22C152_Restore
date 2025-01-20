@interface SOSAccountStatus
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (id)description;
- (id)init:(int)a3 error:(id)a4;
- (int)status;
- (void)setError:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation SOSAccountStatus

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int)status
{
  return self->_status;
}

- (id)description
{
  [(SOSAccountStatus *)self status];
  uint64_t v3 = SOSCCGetStatusDescription();
  v4 = [(SOSAccountStatus *)self error];
  v5 = +[NSString stringWithFormat:@"<SOSStatus: %@ (%@)>", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned __int8 v7 = 0;
  if (v5 && (isKindOfClass & 1) != 0)
  {
    id v8 = v5;
    unsigned int v9 = [(SOSAccountStatus *)self status];
    if (v9 != [v8 status])
    {
      unsigned __int8 v7 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = [(SOSAccountStatus *)self error];
    if (v10 || ([v8 error], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = [(SOSAccountStatus *)self error];
      v12 = [v8 error];
      unsigned __int8 v7 = [v11 isEqual:v12];

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      unsigned __int8 v7 = 1;
    }

    goto LABEL_11;
  }
LABEL_13:

  return v7;
}

- (id)init:(int)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SOSAccountStatus;
  id v8 = [(SOSAccountStatus *)&v11 init];
  unsigned int v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

@end