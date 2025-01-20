@interface SPAKE2Prover
- (BOOL)isVerified;
- (BOOL)processMsg1:(id)a3 error:(id *)a4;
- (BOOL)processMsg2:(id)a3 error:(id *)a4;
- (SPAKE2Common)common;
- (SPAKE2Prover)initWithSalt:(id)a3 code:(id)a4 error:(id *)a5;
- (id)decryptMessage:(id)a3 error:(id *)a4;
- (id)encryptMessage:(id)a3 error:(id *)a4;
- (id)getKey;
- (id)getMsg1WithError:(id *)a3;
- (id)getMsg2WithError:(id *)a3;
- (void)setCommon:(id)a3;
@end

@implementation SPAKE2Prover

- (SPAKE2Prover)initWithSalt:(id)a3 code:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SPAKE2Prover;
  v10 = [(SPAKE2Prover *)&v18 init];
  if (!v10) {
    goto LABEL_4;
  }
  v11 = [[SPAKE2Common alloc] initWithSalt:v8 code:v9];
  [(SPAKE2Prover *)v10 setCommon:v11];

  v12 = [(SPAKE2Prover *)v10 common];
  int v13 = [v12 generateStateWithError:a5];

  if (!v13) {
    goto LABEL_5;
  }
  v14 = [(SPAKE2Prover *)v10 common];
  int v15 = [v14 setupProver:a5];

  if (v15) {
LABEL_4:
  }
    v16 = v10;
  else {
LABEL_5:
  }
    v16 = 0;

  return v16;
}

- (id)getMsg1WithError:(id *)a3
{
  v4 = [(SPAKE2Prover *)self common];
  v5 = [v4 getMsg1WithError:a3];

  return v5;
}

- (BOOL)processMsg1:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(SPAKE2Prover *)self common];
  LOBYTE(a4) = [v7 processMsg1:v6 error:a4];

  return (char)a4;
}

- (id)getMsg2WithError:(id *)a3
{
  v4 = [(SPAKE2Prover *)self common];
  v5 = [v4 getMsg2WithError:a3];

  return v5;
}

- (BOOL)processMsg2:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(SPAKE2Prover *)self common];
  LOBYTE(a4) = [v7 processMsg2:v6 error:a4];

  return (char)a4;
}

- (BOOL)isVerified
{
  v2 = [(SPAKE2Prover *)self common];
  char v3 = [v2 isVerified];

  return v3;
}

- (id)getKey
{
  v2 = [(SPAKE2Prover *)self common];
  char v3 = [v2 getKey];

  return v3;
}

- (id)encryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(SPAKE2Prover *)self common];
  id v8 = [v7 encryptMessage:v6 error:a4];

  return v8;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(SPAKE2Prover *)self common];
  id v8 = [v7 decryptMessage:v6 error:a4];

  return v8;
}

- (SPAKE2Common)common
{
  return (SPAKE2Common *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCommon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end