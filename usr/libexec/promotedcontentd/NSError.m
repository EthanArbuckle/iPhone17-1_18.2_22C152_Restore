@interface NSError
+ (NSError)errorWithBatchParseErrors:(id)a3;
+ (NSError)errorWithCode:(int64_t)a3 internalError:(id)a4;
- (id)internalErrors;
@end

@implementation NSError

+ (NSError)errorWithCode:(int64_t)a3 internalError:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    CFStringRef v10 = @"internalError";
    id v11 = v5;
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:a3 userInfo:v7];

  return (NSError *)v8;
}

+ (NSError)errorWithBatchParseErrors:(id)a3
{
  CFStringRef v7 = @"internalErrors";
  id v8 = a3;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = +[NSError errorWithDomain:@"com.apple.ap.MediaServiceRequest" code:3009 userInfo:v4];

  return (NSError *)v5;
}

- (id)internalErrors
{
  id v3 = [(NSError *)self domain];
  if (![v3 isEqualToString:@"com.apple.ap.MediaServiceRequest"]
    || (id)[(NSError *)self code] != (id)3009)
  {
    id v5 = 0;
    goto LABEL_6;
  }
  v4 = [(NSError *)self userInfo];

  if (v4)
  {
    id v3 = [(NSError *)self userInfo];
    id v5 = [v3 objectForKeyedSubscript:@"internalErrors"];
LABEL_6:

    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

@end