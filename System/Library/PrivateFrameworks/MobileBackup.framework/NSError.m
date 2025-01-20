@interface NSError
- (BOOL)isNotFound;
- (NSError)excludingNotFound;
- (id)_errorWithSQL:(id)a3;
@end

@implementation NSError

- (NSError)excludingNotFound
{
  if ([(NSError *)self isNotFound]) {
    v3 = 0;
  }
  else {
    v3 = self;
  }
  return v3;
}

- (BOOL)isNotFound
{
  if ((id)[(NSError *)self code] != (id)12) {
    return 0;
  }
  v3 = [(NSError *)self domain];
  unsigned __int8 v4 = [v3 isEqualToString:PQLSqliteErrorDomain];

  return v4;
}

- (id)_errorWithSQL:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(NSError *)self userInfo];
    id v6 = [v5 mutableCopy];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NSMutableDictionary dictionary];
    }
    v10 = v8;

    [v10 setObject:v4 forKeyedSubscript:@"ExpandedSQL"];
    id v11 = objc_alloc((Class)NSError);
    v12 = [(NSError *)self domain];
    v9 = (NSError *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, -[NSError code](self, "code"), v10);
  }
  else
  {
    v9 = self;
  }
  return v9;
}

@end