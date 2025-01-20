@interface PDSResponse
- (NSDictionary)statusByUser;
- (PDSResponse)initWithStatus:(int64_t)a3 statusByUser:(id)a4 ttl:(int64_t)a5;
- (id)description;
- (int64_t)status;
- (int64_t)ttl;
@end

@implementation PDSResponse

- (PDSResponse)initWithStatus:(int64_t)a3 statusByUser:(id)a4 ttl:(int64_t)a5
{
  id v10 = a4;
  if (!v10)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PDSResponse.m", 15, @"Invalid parameter not satisfying: %@", @"statusByUser" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PDSResponse;
  v11 = [(PDSResponse *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_statusByUser, a4);
    v12->_ttl = a5;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PDSResponse *)self status];
  v6 = [(PDSResponse *)self statusByUser];
  v7 = [v3 stringWithFormat:@"<%@: %p status = %d; statusByUser = \"%@\">", v4, self, v5, v6];;

  return v7;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDictionary)statusByUser
{
  return self->_statusByUser;
}

- (int64_t)ttl
{
  return self->_ttl;
}

- (void).cxx_destruct
{
}

@end