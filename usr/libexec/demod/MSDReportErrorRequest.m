@interface MSDReportErrorRequest
- (BOOL)isValid;
- (NSError)error;
- (id)getPostData;
- (void)setError:(id)a3;
@end

@implementation MSDReportErrorRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDReportErrorRequest;
  if (![(MSDCommandServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDReportErrorRequest *)self error];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  v13[0] = @"ErrorCode";
  v3 = [(MSDReportErrorRequest *)self error];
  BOOL v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 code]);
  v14[0] = v4;
  v13[1] = @"ErrorDomain";
  v5 = [(MSDReportErrorRequest *)self error];
  objc_super v6 = [v5 domain];
  v14[1] = v6;
  v13[2] = NSLocalizedDescriptionKey;
  v7 = [(MSDReportErrorRequest *)self error];
  v8 = [v7 localizedDescription];
  v14[2] = v8;
  v13[3] = @"UniqueDeviceID";
  v9 = [(MSDCommandServerRequest *)self deviceUDID];
  v14[3] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  v11 = [v10 convertToNSData];

  return v11;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end