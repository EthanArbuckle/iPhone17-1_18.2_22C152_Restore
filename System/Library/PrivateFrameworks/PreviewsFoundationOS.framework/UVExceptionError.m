@interface UVExceptionError
- (NSException)exception;
- (UVExceptionError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (UVExceptionError)initWithException:(id)a3;
@end

@implementation UVExceptionError

- (UVExceptionError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263EFF940];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [NSString stringWithFormat:@"UVExceptionError instantiated for domain %@ with code %zd.", v10, a4];

  v13 = (void *)[v11 initWithName:@"No exception specified" reason:v12 userInfo:v9];
  v14 = [(UVExceptionError *)self initWithException:v13];

  return v14;
}

- (UVExceptionError)initWithException:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12[0] = *MEMORY[0x263F08320];
  v6 = [v5 name];
  v13[0] = v6;
  v12[1] = *MEMORY[0x263F08338];
  v7 = [v5 reason];
  v13[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)UVExceptionError;
  id v9 = [(UVExceptionError *)&v11 initWithDomain:@"com.apple.PreviewsFoundation.ExceptionError" code:0 userInfo:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_exception, a3);
  }

  return v9;
}

- (NSException)exception
{
  return self->_exception;
}

- (void).cxx_destruct
{
}

@end