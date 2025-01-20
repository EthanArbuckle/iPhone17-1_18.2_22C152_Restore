@interface HAPTLVNumberValueBase
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVNumberValueBase)init;
- (HAPTLVNumberValueBase)initWithValue:(id)a3;
- (NSNumber)value;
- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5;
- (id)_serialize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setValue:(id)a3;
@end

@implementation HAPTLVNumberValueBase

- (HAPTLVNumberValueBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPTLVNumberValueBase;
  return [(HAPTLVNumberValueBase *)&v3 init];
}

- (HAPTLVNumberValueBase)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVNumberValueBase;
  v6 = [(HAPTLVNumberValueBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    unsigned int v11 = 0;
    id v7 = v6;
    v8 = [-[HAPTLVNumberValueBase _parseFromData:length:status:](self, "_parseFromData:length:status:", [v7 bytes], objc_msgSend(v7, "length"), &v11);
    BOOL v9 = v11 == 0;
    if (v11)
    {
      if (a4)
      {
        sub_100044EEC(v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [(HAPTLVNumberValueBase *)self setValue:v8];
    }
  }
  else if (a4)
  {
    +[NSError hmfErrorWithCode:3];
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"%@ is unavailable", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)serializeWithError:(id *)a3
{
  if (a3
    && ([(HAPTLVNumberValueBase *)self value],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v7 = +[NSError hmfErrorWithCode:8];
    id v6 = 0;
    *a3 = v7;
  }
  else
  {
    id v6 = [(HAPTLVNumberValueBase *)self _serialize];
  }

  return v6;
}

- (id)_serialize
{
  v2 = NSStringFromSelector(a2);
  objc_super v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HAPTLVNumberValueBase allocWithZone:a3];
  id v5 = [(HAPTLVNumberValueBase *)self value];
  id v6 = [(HAPTLVNumberValueBase *)v4 initWithValue:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPTLVNumberValueBase *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(HAPTLVNumberValueBase *)self value];
      id v7 = [(HAPTLVNumberValueBase *)v5 value];

      unsigned __int8 v8 = [v6 isEqualToNumber:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end