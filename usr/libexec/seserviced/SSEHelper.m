@interface SSEHelper
+ (id)performOperationApprovalV3:(id)a3 seid:(id)a4 acl:(id)a5 operation:(id)a6 nonce:(id)a7 error:(id *)a8;
@end

@implementation SSEHelper

+ (id)performOperationApprovalV3:(id)a3 seid:(id)a4 acl:(id)a5 operation:(id)a6 nonce:(id)a7 error:(id *)a8
{
  CFDataRef v13 = (const __CFData *)a7;
  v14 = (__CFString *)a6;
  CFDataRef v15 = (const __CFData *)a4;
  CFDataRef v16 = (const __CFData *)a3;
  v25[1] = (__CFData *)[a5 DERItem];
  v25[2] = v17;
  v25[3] = 0;
  v25[4] = 0;
  encodeSequenceSpec();
  CFDataRef v18 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25[0] = 0;
  CFDataRef v19 = +[NSData data];
  LODWORD(a5) = SSEEvaluateSecureElementACL(v16, v15, v18, v19, v14, v13, 3u, v25, &v24);

  v21 = v24;
  v20 = v25[0];
  if (!a5 && v25[0] && v24)
  {
    [(__CFData *)v25[0] DERItem];
    [(__CFData *)v21 DERItem];
    encodeSequenceSpec();
    a8 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a8)
  {
    v22 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    a8 = 0;
  }

  return a8;
}

@end