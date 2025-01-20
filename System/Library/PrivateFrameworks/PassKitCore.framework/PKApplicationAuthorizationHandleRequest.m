@interface PKApplicationAuthorizationHandleRequest
+ (BOOL)supportsSecureCoding;
+ (id)_classForType:(uint64_t)a1;
+ (objc_class)_createForName:(void *)a3 context:(unint64_t)a4 withType:;
- (NSData)externalizedContext;
- (NSString)name;
- (PKApplicationAuthorizationHandleRequest)init;
- (PKApplicationAuthorizationHandleRequest)initWithCoder:(id)a3;
- (int64_t)type;
- (void)_initForName:(void *)a3 context:(uint64_t)a4 withType:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationAuthorizationHandleRequest

+ (id)_classForType:(uint64_t)a1
{
  self;
  if (a2 > 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_opt_class();
  }
  return v3;
}

+ (objc_class)_createForName:(void *)a3 context:(unint64_t)a4 withType:
{
  id v6 = a2;
  id v7 = a3;
  self;
  result = (objc_class *)+[PKApplicationAuthorizationHandleRequest _classForType:]((uint64_t)PKApplicationAuthorizationHandleRequest, a4);
  if (result)
  {
    v9 = -[PKApplicationAuthorizationHandleRequest _initForName:context:withType:]([result alloc], v6, v7, a4);

    return (objc_class *)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_initForName:(void *)a3 context:(uint64_t)a4 withType:
{
  id v7 = a2;
  result = a3;
  v9 = result;
  if (!a1) {
    goto LABEL_6;
  }
  if (v7 && result)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKApplicationAuthorizationHandleRequest;
    v10 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[1] = a4;
      uint64_t v11 = [v7 copy];
      v12 = (void *)a1[2];
      a1[2] = v11;

      uint64_t v13 = [v9 copy];
      v14 = (void *)a1[3];
      a1[3] = v13;
    }
LABEL_6:

    return a1;
  }
  __break(1u);
  return result;
}

- (PKApplicationAuthorizationHandleRequest)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationAuthorizationHandleRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (+[PKApplicationAuthorizationHandleRequest _classForType:]((uint64_t)PKApplicationAuthorizationHandleRequest, v5)&& (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    if (v6)
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
      if (v7)
      {
        self = -[PKApplicationAuthorizationHandleRequest _initForName:context:withType:](self, v6, v7, v5);
        v8 = self;
LABEL_10:

        goto LABEL_11;
      }
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationAuthorizationRequest" code:0 userInfo:0];
      [v4 failWithError:v9];
    }
    else
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationAuthorizationRequest" code:0 userInfo:0];
      [v4 failWithError:v7];
    }
    v8 = 0;
    goto LABEL_10;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationAuthorizationRequest" code:0 userInfo:0];
  [v4 failWithError:v6];
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_externalizedContext forKey:@"context"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end