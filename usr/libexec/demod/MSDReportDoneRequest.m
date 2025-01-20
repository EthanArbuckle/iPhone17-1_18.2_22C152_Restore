@interface MSDReportDoneRequest
- (BOOL)isValid;
- (NSError)error;
- (NSString)requestStr;
- (id)getPostData;
- (void)setError:(id)a3;
- (void)setRequestStr:(id)a3;
@end

@implementation MSDReportDoneRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDReportDoneRequest;
  if (![(MSDCommandServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDReportDoneRequest *)self requestStr];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v4 = [(MSDReportDoneRequest *)self requestStr];
  [v3 setObject:v4 forKey:@"RequestOperation"];

  v5 = [(MSDCommandServerRequest *)self deviceUDID];
  [v3 setObject:v5 forKey:@"UniqueDeviceID"];

  objc_super v6 = [(MSDReportDoneRequest *)self error];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = [(MSDReportDoneRequest *)self error];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%08llX", [v8 code]);
    [v7 setObject:v9 forKey:@"ErrorCode"];

    v10 = [(MSDReportDoneRequest *)self error];
    v11 = [v10 domain];
    [v7 setObject:v11 forKey:@"ErrorDomain"];

    v12 = [(MSDReportDoneRequest *)self error];
    v13 = [v12 localizedDescription];
    [v7 setObject:v13 forKey:NSLocalizedDescriptionKey];

    [v3 setObject:v7 forKey:@"Error"];
  }
  v14 = [v3 convertToNSData];

  return v14;
}

- (NSString)requestStr
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestStr:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_requestStr, 0);
}

@end