@interface MapsToken
- (BOOL)isEqual:(id)a3;
- (MapsToken)initWithDelegate:(id)a3 tokenGroupName:(id)a4 reason:(id)a5;
- (MapsToken)initWithDelegate:(id)a3 tokenGroupName:(id)a4 userInfo:(id)a5;
- (MapsTokenDelegate)delegate;
- (NSDictionary)userInfo;
- (NSString)reason;
- (NSString)tokenGroupName;
- (double)createdTimestamp;
- (id)description;
- (id)tombstone;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MapsToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tokenGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)tombstone
{
  v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(NSUUID *)self->_identifier copy];
  v5 = (void *)v3[1];
  v3[1] = v4;

  id v6 = [(NSString *)self->_tokenGroupName copy];
  v7 = (void *)v3[3];
  v3[3] = v6;

  id v8 = [(NSDictionary *)self->_userInfo copy];
  v9 = (void *)v3[4];
  v3[4] = v8;

  return v3;
}

- (void)dealloc
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [(MapsToken *)self tombstone];
    [v5 decrementForToken:v6];

    objc_storeWeak((id *)p_delegate, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)MapsToken;
  [(MapsToken *)&v7 dealloc];
}

- (MapsToken)initWithDelegate:(id)a3 tokenGroupName:(id)a4 reason:(id)a5
{
  CFStringRef v14 = @"reason";
  id v15 = a5;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  v12 = [(MapsToken *)self initWithDelegate:v10 tokenGroupName:v9 userInfo:v11];
  return v12;
}

- (MapsToken)initWithDelegate:(id)a3 tokenGroupName:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MapsToken;
  v11 = [(MapsToken *)&v21 init];
  if (v11)
  {
    uint64_t v12 = +[NSUUID UUID];
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    CFStringRef v14 = (NSString *)[v9 copy];
    tokenGroupName = v11->_tokenGroupName;
    v11->_tokenGroupName = v14;

    v16 = (NSDictionary *)[v10 copy];
    userInfo = v11->_userInfo;
    v11->_userInfo = v16;

    objc_storeWeak((id *)&v11->_delegate, v8);
    +[NSDate timeIntervalSinceReferenceDate];
    v11->_createdTimestamp = v18;
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
    [WeakRetained incrementForToken:v11];
  }
  return v11;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)MapsToken;
  v3 = [(MapsToken *)&v8 description];
  id v4 = [(MapsToken *)self tokenGroupName];
  id v5 = [(MapsToken *)self userInfo];
  id v6 = +[NSString stringWithFormat:@"%@ <tokenGroupName: %@, userInfo: %@>", v3, v4, v5];

  return v6;
}

- (NSString)tokenGroupName
{
  return self->_tokenGroupName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)reason
{
  v2 = [(MapsToken *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"reason"];

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v4 = +[NSString stringWithFormat:@"%@", v3];

      v3 = (void *)v4;
    }
  }

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (id *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    unsigned __int8 v5 = [v4[1] isEqual:self->_identifier];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (MapsTokenDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsTokenDelegate *)WeakRetained;
}

- (double)createdTimestamp
{
  return self->_createdTimestamp;
}

@end