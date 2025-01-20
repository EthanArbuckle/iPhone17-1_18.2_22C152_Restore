@interface DMDFetchOrganizationsOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchOrganizationsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2D80;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(DMDTaskOperation *)self configurationEngine];

  if (v5)
  {
    v6 = [(DMDTaskOperation *)self configurationEngine];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004BF68;
    v7[3] = &unk_1000CB1D8;
    v7[4] = self;
    [v6 handleFetchConfigurationOrganizationsRequest:v4 completionHandler:v7];
  }
  else
  {
    v6 = DMFErrorWithCodeAndUserInfo();
    [(DMDFetchOrganizationsOperation *)self endOperationWithError:v6];
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDFetchOrganizationsOperation;
  return [super validateRequest:a3 error:a4];
}

@end