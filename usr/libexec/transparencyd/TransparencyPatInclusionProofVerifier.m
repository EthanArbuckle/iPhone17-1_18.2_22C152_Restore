@interface TransparencyPatInclusionProofVerifier
- (NSString)application;
- (TransparencyPatInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4;
- (TransparencyPatInclusionProofVerifier)initWithKeyStore:(id)a3 application:(id)a4;
- (TransparencyPublicKeyBag)keyBag;
- (unint64_t)verifyPatInclusionProofWithPerAppLogEntry:(id)a3 topLevelTreeEntry:(id)a4 error:(id *)a5;
- (void)setApplication:(id)a3;
@end

@implementation TransparencyPatInclusionProofVerifier

- (TransparencyPatInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyPatInclusionProofVerifier;
  v9 = [(TransparencyPatInclusionProofVerifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBag, a3);
    objc_storeStrong((id *)&v10->_application, a4);
  }

  return v10;
}

- (unint64_t)verifyPatInclusionProofWithPerAppLogEntry:(id)a3 topLevelTreeEntry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001ACF4C;
  v18[3] = &unk_1002C5690;
  id v10 = v8;
  id v19 = v10;
  v11 = objc_retainBlock(v18);
  objc_super v12 = [(TransparencyPatInclusionProofVerifier *)self application];
  v13 = +[TransparencyAnalytics formatEventName:@"VerifyPATInclusionProofEvent" application:v12];
  id v14 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v13 validateType:3 error:a5 block:v11];

  if (v14 == (id)1)
  {
    v15 = [v10 slh];
    v16 = +[SignedLogHead signedTypeWithObject:v15];

    id v14 = [v9 verifyTLTEntryForPerApplicationLogHead:v16 error:a5];
  }

  return (unint64_t)v14;
}

- (TransparencyPublicKeyBag)keyBag
{
  return (TransparencyPublicKeyBag *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_keyBag, 0);
}

- (TransparencyPatInclusionProofVerifier)initWithKeyStore:(id)a3 application:(id)a4
{
  id v6 = a4;
  id v7 = [a3 keyBag];
  id v8 = [(TransparencyPatInclusionProofVerifier *)self initWithKeyBag:v7 application:v6];

  return v8;
}

@end