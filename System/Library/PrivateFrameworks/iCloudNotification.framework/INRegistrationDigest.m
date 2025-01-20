@interface INRegistrationDigest
- (BOOL)isEqual:(id)a3;
- (INRegistrationDigest)initWithData:(id)a3;
- (INRegistrationDigest)initWithRegistrationRequest:(id)a3;
- (id)data;
- (unint64_t)hash;
@end

@implementation INRegistrationDigest

- (INRegistrationDigest)initWithRegistrationRequest:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INRegistrationDigest;
  v5 = [(INRegistrationDigest *)&v15 init];
  if (v5)
  {
    v6 = [v4 parameters];
    id v7 = [v6 mutableCopy];

    [v7 removeObjectForKey:@"cause"];
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      CC_SHA1([v10 bytes], (CC_LONG)objc_msgSend(v10, "length"), md);
      uint64_t v11 = +[NSData dataWithBytes:md length:20];
      hashData = v5->_hashData;
      v5->_hashData = (NSData *)v11;
    }
    else
    {
      v13 = _INLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000262B4(v13);
      }
    }
  }

  return v5;
}

- (INRegistrationDigest)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INRegistrationDigest;
  v6 = [(INRegistrationDigest *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hashData, a3);
  }

  return v7;
}

- (id)data
{
  return self->_hashData;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INRegistrationDigest *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      hashData = self->_hashData;
      v6 = [(INRegistrationDigest *)v4 data];
      unsigned __int8 v7 = [(NSData *)hashData isEqualToData:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_hashData hash];
}

- (void).cxx_destruct
{
}

@end