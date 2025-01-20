@interface MSDHubSession
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
@end

@implementation MSDHubSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = [v8 info];
  v11 = [v10 endpoint];

  unsigned int v12 = [v11 isEqualToString:@"/Register"];
  v13 = off_100151278;
  if (!v12) {
    v13 = off_100151280;
  }
  id v14 = objc_alloc_init(*v13);
  v15 = [v7 protectionSpace];
  unsigned int v16 = [v14 trustServer:[v15 serverTrust] isRedirect:[v8 redirected]];

  if (v16)
  {
    v17 = [v7 protectionSpace];
    v18 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v17 serverTrust]);

    v9[2](v9, 0, v18);
  }
  else
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000CA6A0(v8, v19);
    }

    v9[2](v9, 2, 0);
  }
}

@end