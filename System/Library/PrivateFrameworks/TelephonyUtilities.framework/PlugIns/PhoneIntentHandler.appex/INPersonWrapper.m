@interface INPersonWrapper
- (BOOL)isEqual:(id)a3;
- (INPerson)inPerson;
- (INPersonWrapper)initWithINPerson:(id)a3;
- (TUHandle)tuHandle;
- (unint64_t)hash;
@end

@implementation INPersonWrapper

- (INPersonWrapper)initWithINPerson:(id)a3
{
  objc_storeStrong((id *)&self->_inPerson, a3);
  id v5 = a3;
  v6 = +[TUHandle handleWithPerson:v5];
  tuHandle = self->_tuHandle;
  self->_tuHandle = v6;

  return self;
}

- (unint64_t)hash
{
  uint64_t v3 = [(INPerson *)self->_inPerson displayName];
  v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_10004D938;
  }
  v6 = v5;

  v7 = [(INPerson *)self->_inPerson personHandle];
  uint64_t v8 = [v7 label];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_10004D938;
  }
  v11 = v10;

  unint64_t v12 = (unint64_t)[(__CFString *)v6 hash];
  unint64_t v13 = (unint64_t)[(__CFString *)v11 hash];

  return v13 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [v4[1] displayName];
    v6 = [(INPerson *)self->_inPerson displayName];
    if ([v5 isEqualToString:v6])
    {
      v7 = [v4[1] personHandle];
      uint64_t v8 = [v7 label];
      v9 = [(INPerson *)self->_inPerson personHandle];
      v10 = [v9 label];
      if ([v8 isEqualToString:v10]) {
        char v11 = TUHandlesAreCanonicallyEqual();
      }
      else {
        char v11 = 0;
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

  return v11;
}

- (INPerson)inPerson
{
  return self->_inPerson;
}

- (TUHandle)tuHandle
{
  return self->_tuHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuHandle, 0);

  objc_storeStrong((id *)&self->_inPerson, 0);
}

@end