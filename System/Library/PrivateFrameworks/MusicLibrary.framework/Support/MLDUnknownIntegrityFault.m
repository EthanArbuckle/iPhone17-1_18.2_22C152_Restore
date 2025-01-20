@interface MLDUnknownIntegrityFault
- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4;
- (MLDUnknownIntegrityFault)initWithFaultString:(id)a3;
- (NSString)faultString;
- (id)description;
@end

@implementation MLDUnknownIntegrityFault

- (void).cxx_destruct
{
}

- (NSString)faultString
{
  return self->_faultString;
}

- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4
{
  if (a4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"unhandleable integrity fault";
    v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    *a4 = +[NSError errorWithDomain:v6 code:-1 userInfo:v7];
  }
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p \"%@\">", v4, self, self->_faultString];

  return v5;
}

- (MLDUnknownIntegrityFault)initWithFaultString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLDUnknownIntegrityFault;
  v5 = [(MLDUnknownIntegrityFault *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    faultString = v5->_faultString;
    v5->_faultString = v6;
  }
  return v5;
}

@end