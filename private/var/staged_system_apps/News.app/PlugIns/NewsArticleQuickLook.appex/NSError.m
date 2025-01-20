@interface NSError
+ (id)naq_errorFailedUnexpectedArticleLoadedWithIdentifier:(id)a3 expectedIdentifier:(id)a4;
+ (id)naq_errorFailedValidationForIdentifier:(id)a3;
@end

@implementation NSError

+ (id)naq_errorFailedValidationForIdentifier:(id)a3
{
  if (a3) {
    v4 = (__CFString *)a3;
  }
  else {
    v4 = &stru_1000041A8;
  }
  CFStringRef v10 = @"identifier";
  v11 = v4;
  v5 = v4;
  id v6 = a3;
  v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8 = +[NSError errorWithDomain:@"NAQNewsPreviewErrorDomain" code:1 userInfo:v7];

  return v8;
}

+ (id)naq_errorFailedUnexpectedArticleLoadedWithIdentifier:(id)a3 expectedIdentifier:(id)a4
{
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  else {
    id v6 = &stru_1000041A8;
  }
  v15[0] = @"identifier";
  v15[1] = @"expectedIdentifier";
  if (a4) {
    v7 = (__CFString *)a4;
  }
  else {
    v7 = &stru_1000041A8;
  }
  v16[0] = v6;
  v16[1] = v7;
  v8 = v7;
  v9 = v6;
  id v10 = a4;
  id v11 = a3;
  v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v13 = +[NSError errorWithDomain:@"NAQNewsPreviewErrorDomain" code:2 userInfo:v12];

  return v13;
}

@end