@interface PKPaymentLocalPassCredential(NanoPassKit)
- (void)_initWithPassTypeIdentifier:()NanoPassKit serialNumber:credentialType:sanitizedPrimaryAccountNumber:longDescription:cardType:;
@end

@implementation PKPaymentLocalPassCredential(NanoPassKit)

- (void)_initWithPassTypeIdentifier:()NanoPassKit serialNumber:credentialType:sanitizedPrimaryAccountNumber:longDescription:cardType:
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = a1;
  v21.super_class = (Class)&off_26D094C58;
  id v18 = objc_msgSendSuper2(&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    [v18 setPassTypeIdentifier:v14];
    [v19 setSerialNumber:v15];
    [v19 setCredentialType:a5];
    [v19 setSanitizedPrimaryAccountNumber:v16];
    [v19 setLongDescription:v17];
    [v19 setCardType:a8];
  }

  return v19;
}

@end