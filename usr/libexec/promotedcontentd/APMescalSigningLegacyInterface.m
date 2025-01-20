@interface APMescalSigningLegacyInterface
+ (void)requestCertificateWithCompletion:(id)a3;
+ (void)requestMescalSetupForData:(id)a3 completionHandler:(id)a4;
@end

@implementation APMescalSigningLegacyInterface

+ (void)requestMescalSetupForData:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSUUID UUID];
  v8 = +[NSDate date];
  v9 = [APMescalSignSetupRequester alloc];
  v10 = +[APIDAccountProvider privateUserAccount];
  v11 = [(APServerRequester *)v9 initWithBundleID:@"com.apple.news" requestIdentifier:v7 contextIdentifier:0 contentIdentifier:0 idAccount:v10];

  [(APMescalSignSetupRequester *)v11 setData:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C3FE8;
  v14[3] = &unk_1002357B8;
  id v15 = v8;
  id v16 = v5;
  id v12 = v5;
  id v13 = v8;
  [(APServerRequester *)v11 makeRequest:v14];
}

+ (void)requestCertificateWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = +[NSUUID UUID];
  id v5 = +[NSDate date];
  id v6 = [APMescalSignSetupCertificateRequester alloc];
  v7 = +[APIDAccountProvider privateUserAccount];
  v8 = [(APServerRequester *)v6 initWithBundleID:@"com.apple.news" requestIdentifier:v4 contextIdentifier:0 contentIdentifier:0 idAccount:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C41DC;
  v11[3] = &unk_1002357B8;
  id v12 = v5;
  id v13 = v3;
  id v9 = v3;
  id v10 = v5;
  [(APServerRequester *)v8 makeRequest:v11];
}

@end