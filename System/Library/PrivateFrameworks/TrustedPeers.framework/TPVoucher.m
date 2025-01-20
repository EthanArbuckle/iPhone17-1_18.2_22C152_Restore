@interface TPVoucher
+ (id)voucherInfoWithData:(id)a3 sig:(id)a4;
+ (id)voucherWithReason:(unint64_t)a3 beneficiaryID:(id)a4 sponsorID:(id)a5 signingKeyPair:(id)a6 error:(id *)a7;
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVoucher:(id)a3;
- (NSData)data;
- (NSData)sig;
- (NSString)beneficiaryID;
- (NSString)sponsorID;
- (TPVoucher)initWithObj:(id)a3 data:(id)a4 sig:(id)a5;
- (id)createRecoveryECPublicKey:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)setBeneficiaryID:(id)a3;
- (void)setData:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setSig:(id)a3;
- (void)setSponsorID:(id)a3;
@end

@implementation TPVoucher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_sponsorID, 0);
  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

- (void)setSig:(id)a3
{
}

- (NSData)sig
{
  return self->_sig;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setSponsorID:(id)a3
{
}

- (NSString)sponsorID
{
  return self->_sponsorID;
}

- (void)setBeneficiaryID:(id)a3
{
}

- (NSString)beneficiaryID
{
  return self->_beneficiaryID;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)hash
{
  v3 = [(TPVoucher *)self data];
  uint64_t v4 = [v3 hash];
  v5 = [(TPVoucher *)self sig];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TPVoucher *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TPVoucher *)self isEqualToVoucher:v4];
  }

  return v5;
}

- (BOOL)isEqualToVoucher:(id)a3
{
  uint64_t v4 = (TPVoucher *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    BOOL v5 = [(TPVoucher *)self data];
    unint64_t v6 = [(TPVoucher *)v4 data];
    if ([v5 isEqualToData:v6])
    {
      v7 = [(TPVoucher *)self sig];
      v8 = [(TPVoucher *)v4 sig];
      char v9 = [v7 isEqualToData:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  uint64_t v4 = [(TPVoucher *)self dictionaryRepresentation];
  BOOL v5 = [v4 description];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [TPPBVoucher alloc];
  uint64_t v4 = [(TPVoucher *)self data];
  BOOL v5 = [(TPPBVoucher *)v3 initWithData:v4];

  unint64_t v6 = [(TPPBVoucher *)v5 dictionaryRepresentation];

  return v6;
}

- (id)createRecoveryECPublicKey:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F67CC8];
  id v4 = a3;
  id v5 = [v3 alloc];
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F67CC0]) initWithCurve:4];
  uint64_t v11 = 0;
  v7 = (void *)[v5 initWithData:v4 specifier:v6 error:&v11];

  uint64_t v8 = v11;
  id v9 = 0;
  if (!v8) {
    id v9 = v7;
  }

  return v9;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TPVoucher *)self sig];
  unint64_t v6 = [(TPVoucher *)self data];
  char v7 = checkTypesafeSignature(v4, v5, v6, @"TPPB.Voucher");

  return v7;
}

- (TPVoucher)initWithObj:(id)a3 data:(id)a4 sig:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[TPStringTable defaultTable];
  v22.receiver = self;
  v22.super_class = (Class)TPVoucher;
  v12 = [(TPVoucher *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v8 reason] - 1;
    if (v13 < 5) {
      unint64_t v14 = v13 + 1;
    }
    else {
      unint64_t v14 = 0;
    }
    v12->_reason = v14;
    v15 = [v8 beneficiary];
    uint64_t v16 = [v11 stringWithString:v15];
    beneficiaryID = v12->_beneficiaryID;
    v12->_beneficiaryID = (NSString *)v16;

    v18 = [v8 sponsor];
    uint64_t v19 = [v11 stringWithString:v18];
    sponsorID = v12->_sponsorID;
    v12->_sponsorID = (NSString *)v19;

    objc_storeStrong((id *)&v12->_data, a4);
    objc_storeStrong((id *)&v12->_sig, a5);
  }

  return v12;
}

+ (id)voucherInfoWithData:(id)a3 sig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [[TPPBVoucher alloc] initWithData:v5];
  if (v7) {
    id v8 = [[TPVoucher alloc] initWithObj:v7 data:v5 sig:v6];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)voucherWithReason:(unint64_t)a3 beneficiaryID:(id)a4 sponsorID:(id)a5 signingKeyPair:(id)a6 error:(id *)a7
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = objc_alloc_init(TPPBVoucher);
  [(TPPBVoucher *)v16 setBeneficiary:v15];

  [(TPPBVoucher *)v16 setSponsor:v14];
  if (a3 - 1 >= 5)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TPVoucher.m", 109, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
    uint64_t v19 = 0;
  }
  else
  {
    [(TPPBVoucher *)v16 setReason:a3];
    v17 = [(TPPBVoucher *)v16 data];
    v18 = typesafeSignature(v13, v17, @"TPPB.Voucher", a7);
    if (v18) {
      uint64_t v19 = [[TPVoucher alloc] initWithObj:v16 data:v17 sig:v18];
    }
    else {
      uint64_t v19 = 0;
    }
  }
  return v19;
}

@end