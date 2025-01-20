@interface AVCaptureDevice
+ (void)crl_checkAuthorizationForMediaType:(id)a3 completion:(id)a4;
@end

@implementation AVCaptureDevice

+ (void)crl_checkAuthorizationForMediaType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (char *)[a1 authorizationStatusForMediaType:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100050B0C;
  v13[3] = &unk_1014CE158;
  id v9 = v7;
  id v14 = v9;
  v10 = objc_retainBlock(v13);
  v11 = v10;
  if ((unint64_t)(v8 - 1) < 2)
  {
    v12 = (void (*)(void))v10[2];
    goto LABEL_6;
  }
  if (!v8)
  {
    +[AVCaptureDevice requestAccessForMediaType:v6 completionHandler:v10];
    goto LABEL_8;
  }
  if (v8 == (char *)3)
  {
    v12 = (void (*)(void))v10[2];
LABEL_6:
    v12();
  }
LABEL_8:
}

@end