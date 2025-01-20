@interface Result
+ (Result)resultWithError:(id)a3;
+ (Result)resultWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (BOOL)isSuccess;
- (NSError)error;
- (Result)initWithError:(id)a3;
- (Result)initWithSuccess:(id)a3;
- (id)_errorMessageForValue:(BOOL)a3 error:(BOOL)a4;
- (id)description;
- (id)flatMap:(id)a3;
- (id)map:(id)a3;
- (id)value;
- (unint64_t)hash;
- (void)setError:(id)a3;
- (void)setValue:(id)a3;
- (void)withValue:(id)a3 orError:(id)a4;
@end

@implementation Result

+ (Result)resultWithValue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithSuccess:v4];

  return (Result *)v5;
}

- (Result)initWithSuccess:(id)a3
{
  id v5 = a3;
  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"Value cannot be nil"];
  }
  v9.receiver = self;
  v9.super_class = (Class)Result;
  v6 = [(Result *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_isSuccess = 1;
  }

  return v7;
}

- (void)withValue:(id)a3 orError:(id)a4
{
  v6 = (void (**)(id, id))a3;
  v7 = (void (**)(void))a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    objc_super v9 = [(Result *)self _errorMessageForValue:v6 == 0 error:v7 == 0];
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
    }
  }
  id value = self->_value;
  if (v6 && value)
  {
    v6[2](v6, self->_value);
  }
  else
  {
    error = self->_error;
    if (v8 && error)
    {
      v8[2](v8);
    }
    else
    {
      if (!v6 && value)
      {
        v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Had a value but no value block", (uint8_t *)&v15, 2u);
        }

        error = self->_error;
      }
      if (!v8 && error)
      {
        v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Had an error but no error block", (uint8_t *)&v15, 2u);
        }
      }
    }
  }
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

+ (Result)resultWithError:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithError:v4];

  return (Result *)v5;
}

- (Result)initWithError:(id)a3
{
  id v5 = a3;
  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"Error cannot be nil"];
  }
  v9.receiver = self;
  v9.super_class = (Class)Result;
  v6 = [(Result *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_isSuccess = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_100103DAC;
  v12 = sub_100104760;
  v7.receiver = self;
  v7.super_class = (Class)Result;
  id v13 = [(Result *)&v7 description];
  v5[4] = &v8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005D5AA0;
  v6[3] = &unk_1012F1768;
  v6[4] = &v8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005D5B34;
  v5[3] = &unk_1012EAC00;
  [(Result *)self withValue:v6 orError:v5];
  id v3 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v3;
}

- (id)_errorMessageForValue:(BOOL)a3 error:(BOOL)a4
{
  CFStringRef v4 = @"value block is nil.";
  if (a4) {
    CFStringRef v4 = @"both are nil.";
  }
  if (a3) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = @"error block is nil.";
  }
  v6 = [@"Neither block can be nil but " stringByAppendingString:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CFStringRef v4 = (Result *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(Result *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(Result *)self isEqualToResult:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isSuccess];
  if (v5 == [(Result *)self isSuccess])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005D5DD8;
    v9[3] = &unk_1012F1790;
    v9[4] = self;
    v9[5] = &v10;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1005D5E14;
    v8[3] = &unk_1012F17B8;
    v8[4] = self;
    v8[5] = &v10;
    [v4 withValue:v9 orError:v8];
    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = 16;
  if (!self->_isSuccess) {
    uint64_t v3 = 24;
  }
  BOOL isSuccess = self->_isSuccess;
  return (unint64_t)[*(id *)((char *)&self->super.isa + v3) hash] ^ (2654435761 * isSuccess);
}

- (id)map:(id)a3
{
  if (self->_isSuccess)
  {
    uint64_t v3 = (*((void (**)(id, id))a3 + 2))(a3, self->_value);
    id v4 = +[Result resultWithValue:v3];
  }
  else
  {
    id v4 = self;
  }

  return v4;
}

- (id)flatMap:(id)a3
{
  if (self->_isSuccess)
  {
    (*((void (**)(id, id))a3 + 2))(a3, self->_value);
    uint64_t v3 = (Result *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = self;
  }

  return v3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_value, 0);
}

@end