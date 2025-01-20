@interface PKAccountWebServiceResponse
+ (BOOL)jsonDataOptional;
+ (id)responseWithData:(id)a3 account:(id)a4 request:(id)a5;
@end

@implementation PKAccountWebServiceResponse

+ (id)responseWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v9 account:v8 request:v7];

  return v10;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

@end