@interface MFCertificateTrustInfo
- (ECSecureMIMETrustEvaluation)trustEvaluation;
- (MFCertificateTrustInfo)initWithCertificateType:(unint64_t)a3 trust:(__SecTrust *)a4 sender:(id)a5;
- (NSString)sender;
- (__SecTrust)trust;
- (unint64_t)certificateType;
- (void)dealloc;
@end

@implementation MFCertificateTrustInfo

- (MFCertificateTrustInfo)initWithCertificateType:(unint64_t)a3 trust:(__SecTrust *)a4 sender:(id)a5
{
  id v9 = a5;
  if (!a4)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"MFCertificateTrustInfo.m", 32, @"Invalid parameter not satisfying: %@", @"trust" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)MFCertificateTrustInfo;
  v10 = [(MFCertificateTrustInfo *)&v23 init];
  v11 = v10;
  if (v10)
  {
    v10->_certificateType = a3;
    v10->_unevaluatedTrust = (__SecTrust *)CFRetain(a4);
    uint64_t v12 = [v9 copy];
    sender = v11->_sender;
    v11->_sender = (NSString *)v12;

    id v14 = v9;
    v15 = [v14 emailAddressValue];
    v16 = [v15 simpleAddress];
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      v18 = [v14 stringValue];
    }
    v19 = v18;

    uncommentedSender = v11->_uncommentedSender;
    v11->_uncommentedSender = v19;
  }
  return v11;
}

- (void)dealloc
{
  CFRelease(self->_unevaluatedTrust);
  v3.receiver = self;
  v3.super_class = (Class)MFCertificateTrustInfo;
  [(MFCertificateTrustInfo *)&v3 dealloc];
}

- (ECSecureMIMETrustEvaluation)trustEvaluation
{
  trustEvaluation = self->_trustEvaluation;
  if (!trustEvaluation)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    int v5 = objc_msgSend(v4, "mf_blockRemoteContent");

    if (v5) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3;
    }
    v7 = [MEMORY[0x1E4F608D0] evaluateTrust:self->_unevaluatedTrust withOptions:v6 signerEmailAddress:self->_uncommentedSender];
    v8 = self->_trustEvaluation;
    self->_trustEvaluation = v7;

    trustEvaluation = self->_trustEvaluation;
  }
  id v9 = trustEvaluation;
  return v9;
}

- (__SecTrust)trust
{
  v2 = [(MFCertificateTrustInfo *)self trustEvaluation];
  objc_super v3 = (__SecTrust *)[v2 trust];

  return v3;
}

- (unint64_t)certificateType
{
  return self->_certificateType;
}

- (NSString)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_uncommentedSender, 0);
  objc_storeStrong((id *)&self->_trustEvaluation, 0);
}

@end