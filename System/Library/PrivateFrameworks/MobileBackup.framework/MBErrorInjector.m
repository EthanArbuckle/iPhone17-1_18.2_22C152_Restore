@interface MBErrorInjector
+ (id)errorInjectorForRegex:(id)a3;
- (id)_initWithCompiledExpression:(id)a3;
- (id)errorIfMatches:(id)a3;
@end

@implementation MBErrorInjector

+ (id)errorInjectorForRegex:(id)a3
{
  id v3 = a3;
  if (MBIsInternalInstall() && [v3 length])
  {
    id v9 = 0;
    v4 = +[NSRegularExpression regularExpressionWithPattern:v3 options:0 error:&v9];
    id v5 = v9;
    if (v4)
    {
      id v6 = [[MBErrorInjector alloc] _initWithCompiledExpression:v4];
    }
    else
    {
      v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=error-injection= Failed to compile regex: %@", buf, 0xCu);
        _MBLog();
      }

      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_initWithCompiledExpression:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBErrorInjector;
  id v6 = [(MBErrorInjector *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expression, a3);
  }

  return v7;
}

- (id)errorIfMatches:(id)a3
{
  id v4 = a3;
  if (-[NSRegularExpression numberOfMatchesInString:options:range:](self->_expression, "numberOfMatchesInString:options:range:", v4, 0, 0, [v4 length]))
  {
    id v5 = +[MBError errorWithCode:555 path:v4 format:@"Synthetic error for testing"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end