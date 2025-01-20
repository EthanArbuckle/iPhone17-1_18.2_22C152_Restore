@interface GLTKeyDiversification
+ (__SecKey)diversifyPrivateKey:(__SecKey *)a3 withDocumentIdentifier:(id)a4 trackingPreventionSalt:(id)a5 error:(id *)a6;
+ (id)diversifyPublicKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4 withDocumentIdentifier:(id)a5 error:(id *)a6;
+ (id)diversifyPublicKey:(__SecKey *)a3 withDocumentIdentifier:(id)a4 error:(id *)a5;
@end

@implementation GLTKeyDiversification

+ (id)diversifyPublicKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4 withDocumentIdentifier:(id)a5 error:(id *)a6
{
  v6 = +[GLTKeyDiversificationSwift diversifyWithPublicKey:a3 trackingPreventionSalt:a4 docId:a5 error:a6];
  if (v6)
  {
    v7 = [GLTDiversifiedKeyAndTPS alloc];
    uint64_t v8 = [v6 diversifiedKey];
    v9 = [v6 trackingPreventionSalt];
    v10 = [(GLTDiversifiedKeyAndTPS *)v7 initWithKey:v8 trackingPreventionSalt:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)diversifyPublicKey:(__SecKey *)a3 withDocumentIdentifier:(id)a4 error:(id *)a5
{
  return (id)[a1 diversifyPublicKey:a3 trackingPreventionSalt:0 withDocumentIdentifier:a4 error:a5];
}

+ (__SecKey)diversifyPrivateKey:(__SecKey *)a3 withDocumentIdentifier:(id)a4 trackingPreventionSalt:(id)a5 error:(id *)a6
{
  return +[GLTKeyDiversificationSwift diversifyWithPrivateKey:a3 docId:a4 trackingPreventionSalt:a5 error:a6];
}

@end