@interface NFAsserter
- (BOOL)isEntitled:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualType:(id)a3;
- (BOOL)isSupported;
- (NFAsserter)initWithRemoteAssertion:(id)a3;
- (NFAssertionInternal)remoteAssertion;
- (NSString)description;
- (unint64_t)hash;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
- (void)setRemoteAssertion:(id)a3;
@end

@implementation NFAsserter

- (NSString)description
{
  v2 = [(NFAsserter *)self remoteAssertion];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NFAsserter)initWithRemoteAssertion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFAsserter;
  v6 = [(NFAsserter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteAssertion, a3);
    v8 = v7;
  }

  return v7;
}

- (NFAssertionInternal)remoteAssertion
{
  return self->_remoteAssertion;
}

- (BOOL)isSupported
{
  return 1;
}

- (BOOL)isEntitled:(id)a3
{
  return 0;
}

- (void)onAssertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSError);
  v6 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  v7 = +[NSString stringWithUTF8String:"Feature Not Supported"];
  v11 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v9 = [v5 initWithDomain:v6 code:14 userInfo:v8];
  (*((void (**)(id, id))a3 + 2))(v4, v9);
}

- (void)onDeassertWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)NSError);
    v6 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    v7 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v11 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v9 = [v5 initWithDomain:v6 code:14 userInfo:v8];
    (*((void (**)(id, id))a3 + 2))(v4, v9);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NFAsserter *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(NFAsserter *)self remoteAssertion];
      v6 = [(NFAsserter *)v4 remoteAssertion];
      unsigned __int8 v7 = [v5 isEqual:v6];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unsigned __int8 v7 = 0;
        goto LABEL_9;
      }
      id v5 = [(NFAsserter *)self remoteAssertion];
      unsigned __int8 v7 = [v5 isEqual:v4];
    }
  }
LABEL_9:

  return v7;
}

- (BOOL)isEqualType:(id)a3
{
  id v4 = a3;
  id v5 = [(NFAsserter *)self remoteAssertion];
  id v6 = [v5 assertionType];
  unsigned __int8 v7 = [v4 remoteAssertion];

  LOBYTE(v4) = v6 == [v7 assertionType];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(NFAsserter *)self remoteAssertion];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)setRemoteAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end