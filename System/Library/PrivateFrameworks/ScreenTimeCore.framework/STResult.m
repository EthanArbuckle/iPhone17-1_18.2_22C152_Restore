@interface STResult
+ (id)failure:(id)a3;
+ (id)success;
+ (id)success:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (NSCopying)value;
- (NSError)error;
- (id)_initWithSuccessValue:(id)a3 failureError:(id)a4 type:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)flatMap:(id)a3;
- (id)flatMapError:(id)a3;
- (id)map:(id)a3;
- (id)mapError:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)evaluateWithSuccess:(id)a3 failure:(id)a4;
@end

@implementation STResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)mapError:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  int64_t v6 = [(STResult *)self type];
  if (v6 == 1)
  {
    v7 = [(STResult *)self error];
    v8 = v5[2](v5, v7);
    id v3 = +[STResult failure:v8];
  }
  else if (!v6)
  {
    id v3 = [(STResult *)self copy];
  }

  return v3;
}

+ (id)success:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 failure:v4];
  }
  else
  {
    id v5 = [objc_alloc((Class)a1) _initWithSuccessValue:v4 failureError:0 type:0];
  }
  int64_t v6 = v5;

  return v6;
}

- (void)evaluateWithSuccess:(id)a3 failure:(id)a4
{
  v10 = a3;
  int64_t v6 = a4;
  int64_t v7 = [(STResult *)self type];
  if (v7 == 1)
  {
    v8 = [(STResult *)self error];
    v9 = (void (*)(void))v6[2];
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    v8 = [(STResult *)self value];
    v9 = (void (*)(void))v10[2];
  }
  v9();

LABEL_6:
}

- (id)_initWithSuccessValue:(id)a3 failureError:(id)a4 type:(int64_t)a5
{
  v8 = (NSCopying *)a3;
  v9 = (NSError *)a4;
  v15.receiver = self;
  v15.super_class = (Class)STResult;
  v10 = [(STResult *)&v15 init];
  value = v10->_value;
  v10->_value = v8;
  v12 = v8;

  error = v10->_error;
  v10->_error = v9;

  v10->_type = a5;
  return v10;
}

- (NSCopying)value
{
  return (NSCopying *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  value = self->_value;
  error = self->_error;
  int64_t type = self->_type;
  return [v4 _initWithSuccessValue:value failureError:error type:type];
}

+ (id)success
{
  id v2 = objc_alloc((Class)a1);
  id v3 = +[NSNull null];
  id v4 = [v2 _initWithSuccessValue:v3 failureError:0 type:0];

  return v4;
}

+ (id)failure:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) _initWithSuccessValue:0 failureError:v4 type:1];

  return v5;
}

- (id)description
{
  int64_t v4 = [(STResult *)self type];
  if (v4 == 1)
  {
    v8 = (objc_class *)objc_opt_class();
    int64_t v6 = NSStringFromClass(v8);
    int64_t v7 = [(STResult *)self error];
    +[NSString stringWithFormat:@"<%@:%p { Failure: %@ }>", v6, self, v7];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    id v5 = (objc_class *)objc_opt_class();
    int64_t v6 = NSStringFromClass(v5);
    int64_t v7 = [(STResult *)self value];
    +[NSString stringWithFormat:@"<%@:%p { Success: %@ }>", v6, self, v7];
  id v2 = };

LABEL_6:
  return v2;
}

- (id)map:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  int64_t v6 = [(STResult *)self type];
  if (v6 == 1)
  {
    id v3 = [(STResult *)self copy];
  }
  else if (!v6)
  {
    int64_t v7 = [(STResult *)self value];
    v8 = v5[2](v5, v7);
    id v3 = +[STResult success:v8];
  }
  return v3;
}

- (id)flatMap:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  int64_t v6 = [(STResult *)self type];
  if (v6 != 1)
  {
    if (v6) {
      goto LABEL_10;
    }
    int64_t v7 = [(STResult *)self value];
    v8 = v5[2](v5, v7);

    id v9 = [v8 type];
    if (v9 == (id)1)
    {
      v10 = [v8 error];
      uint64_t v11 = +[STResult failure:v10];
      goto LABEL_7;
    }
    if (!v9)
    {
      v10 = [v8 value];
      uint64_t v11 = +[STResult success:v10];
LABEL_7:
      id v3 = (id)v11;

      goto LABEL_10;
    }
  }
  id v3 = [(STResult *)self copy];
LABEL_10:

  return v3;
}

- (id)flatMapError:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  int64_t v6 = [(STResult *)self type];
  if (v6 == 1)
  {
    id v3 = [(STResult *)self error];
    int64_t v7 = v5[2](v5, v3);

    id v8 = [v7 type];
    if (v8 == (id)1)
    {
      id v9 = [v7 error];
      uint64_t v10 = +[STResult failure:v9];
    }
    else
    {
      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v9 = [v7 value];
      uint64_t v10 = +[STResult success:v9];
    }
    id v3 = (id)v10;

    goto LABEL_9;
  }
  if (!v6) {
    id v3 = [(STResult *)self copy];
  }
LABEL_10:

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (STResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STResult *)self isEqualToResult:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToResult:(id)a3
{
  int64_t v7 = (STResult *)a3;
  if (self == v7)
  {
    unsigned __int8 v11 = 1;
    goto LABEL_19;
  }
  id v8 = [(STResult *)self type];
  if (v8 != (void *)[(STResult *)v7 type])
  {
    unsigned __int8 v11 = 0;
    goto LABEL_19;
  }
  id v9 = [(STResult *)self value];
  if (v9 || ([(STResult *)v7 value], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [(STResult *)self value];
    int64_t v4 = [(STResult *)v7 value];
    if (([v3 isEqual:v4] & 1) == 0)
    {

      unsigned __int8 v11 = 0;
      goto LABEL_16;
    }
    int v10 = 1;
  }
  else
  {
    v16 = 0;
    int v10 = 0;
  }
  v12 = [(STResult *)self error];
  if (!v12)
  {
    BOOL v5 = [(STResult *)v7 error];
    if (!v5)
    {
      unsigned __int8 v11 = 1;
LABEL_21:

      if ((v10 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  v13 = [(STResult *)self error];
  v14 = [(STResult *)v7 error];
  unsigned __int8 v11 = [v13 isEqual:v14];

  if (!v12) {
    goto LABEL_21;
  }

  if (v10)
  {
LABEL_15:
  }
LABEL_16:
  if (!v9) {

  }
LABEL_19:
  return v11;
}

- (unint64_t)hash
{
  int64_t v3 = [(STResult *)self type];
  int64_t v4 = [(STResult *)self value];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;
  int64_t v6 = [(STResult *)self error];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

@end