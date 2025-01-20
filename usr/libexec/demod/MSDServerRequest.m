@interface MSDServerRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSString)getName;
- (NSString)savePath;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setSavePath:(id)a3;
@end

@implementation MSDServerRequest

- (BOOL)isValid
{
  return 1;
}

- (NSString)getName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MSDServerRequest *)self getResponseClass];
  v8 = objc_opt_new();
  if (v6)
  {
    v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DAF6C(self, (uint64_t)v6, v9);
    }
  }
  else
  {
    v10 = [v7 objectForKey:@"data"];
    [v8 setData:v10];
  }
  [v8 setError:v6];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 setSavePath:self->_savePath];
  [v4 setCompletion:self->_completion];
  return v4;
}

- (NSString)savePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSavePath:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_savePath, 0);
}

@end