@interface SPRPINData
+ (BOOL)supportsSecureCoding;
- (BOOL)isPinBypass;
- (NSData)casd;
- (NSData)pinAppletAttestationData;
- (NSData)pinBlock;
- (NSData)pinCipherBlob;
- (NSData)pinKEKHash;
- (NSData)pinKeyBlob;
- (SPRPINData)initWithCoder:(id)a3;
- (SPRPINData)initWithPinBlock:(id)a3 casd:(id)a4 pinAppletAttestationData:(id)a5 pinKEKHash:(id)a6;
- (SPRPINData)initWithPinBlock:(id)a3 casd:(id)a4 pinAppletAttestationData:(id)a5 pinKEKHash:(id)a6 isPinBypass:(BOOL)a7;
- (SPRPINData)initWithPinCipherBlob:(id)a3 pinKeyBlob:(id)a4 casd:(id)a5 pinAppletAttestationData:(id)a6 pinKEKHash:(id)a7 isPinBypass:(BOOL)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRPINData

- (SPRPINData)initWithPinCipherBlob:(id)a3 pinKeyBlob:(id)a4 casd:(id)a5 pinAppletAttestationData:(id)a6 pinKEKHash:(id)a7 isPinBypass:(BOOL)a8
{
  v14 = (NSData *)a3;
  v15 = (NSData *)a4;
  v16 = (NSData *)a5;
  v17 = (NSData *)a6;
  v18 = (NSData *)a7;
  pinBlock = self->_pinBlock;
  self->_pinBlock = 0;

  pinCipherBlob = self->_pinCipherBlob;
  self->_pinCipherBlob = v14;
  v21 = v14;

  pinKeyBlob = self->_pinKeyBlob;
  self->_pinKeyBlob = v15;
  v23 = v15;

  casd = self->_casd;
  self->_casd = v16;
  v25 = v16;

  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v17;
  v27 = v17;

  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v18;

  self->_isPinBypass = a8;
  return self;
}

- (SPRPINData)initWithPinBlock:(id)a3 casd:(id)a4 pinAppletAttestationData:(id)a5 pinKEKHash:(id)a6
{
  v10 = (NSData *)a3;
  v11 = (NSData *)a4;
  v12 = (NSData *)a5;
  v13 = (NSData *)a6;
  pinBlock = self->_pinBlock;
  self->_pinBlock = v10;
  v15 = v10;

  casd = self->_casd;
  self->_casd = v11;
  v17 = v11;

  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v12;
  v19 = v12;

  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v13;

  self->_isPinBypass = 0;
  return self;
}

- (SPRPINData)initWithPinBlock:(id)a3 casd:(id)a4 pinAppletAttestationData:(id)a5 pinKEKHash:(id)a6 isPinBypass:(BOOL)a7
{
  v12 = (NSData *)a3;
  v13 = (NSData *)a4;
  v14 = (NSData *)a5;
  v15 = (NSData *)a6;
  pinBlock = self->_pinBlock;
  self->_pinBlock = v12;
  v17 = v12;

  casd = self->_casd;
  self->_casd = v13;
  v19 = v13;

  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v14;
  v21 = v14;

  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v15;

  self->_isPinBypass = a7;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRPINData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"pinBlock", v7, v8);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinBlock = self->_pinBlock;
  self->_pinBlock = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"pinCipherBlob", v13, v14);
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinCipherBlob = self->_pinCipherBlob;
  self->_pinCipherBlob = v15;

  uint64_t v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"pinKeyBlob", v19, v20);
  v21 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinKeyBlob = self->_pinKeyBlob;
  self->_pinKeyBlob = v21;

  uint64_t v23 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"casd", v25, v26);
  v27 = (NSData *)objc_claimAutoreleasedReturnValue();
  casd = self->_casd;
  self->_casd = v27;

  uint64_t v29 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"pinAppletAttestationData", v31, v32);
  v33 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinAppletAttestationData = self->_pinAppletAttestationData;
  self->_pinAppletAttestationData = v33;

  uint64_t v35 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, @"pinKEKHash", v37, v38);
  v39 = (NSData *)objc_claimAutoreleasedReturnValue();
  pinKEKHash = self->_pinKEKHash;
  self->_pinKEKHash = v39;

  char v45 = objc_msgSend_decodeBoolForKey_(v4, v41, @"isPinBypass", v42, v43, v44);
  self->_isPinBypass = v45;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  pinBlock = self->_pinBlock;
  id v26 = a3;
  objc_msgSend_encodeObject_forKey_(v26, v5, (uint64_t)pinBlock, @"pinBlock", v6, v7);
  objc_msgSend_encodeObject_forKey_(v26, v8, (uint64_t)self->_pinCipherBlob, @"pinCipherBlob", v9, v10);
  objc_msgSend_encodeObject_forKey_(v26, v11, (uint64_t)self->_pinKeyBlob, @"pinKeyBlob", v12, v13);
  objc_msgSend_encodeObject_forKey_(v26, v14, (uint64_t)self->_casd, @"casd", v15, v16);
  objc_msgSend_encodeObject_forKey_(v26, v17, (uint64_t)self->_pinAppletAttestationData, @"pinAppletAttestationData", v18, v19);
  objc_msgSend_encodeObject_forKey_(v26, v20, (uint64_t)self->_pinKEKHash, @"pinKEKHash", v21, v22);
  objc_msgSend_encodeBool_forKey_(v26, v23, self->_isPinBypass, @"isPinBypass", v24, v25);
}

- (NSData)pinBlock
{
  return self->_pinBlock;
}

- (NSData)pinCipherBlob
{
  return self->_pinCipherBlob;
}

- (NSData)pinKeyBlob
{
  return self->_pinKeyBlob;
}

- (NSData)casd
{
  return self->_casd;
}

- (NSData)pinAppletAttestationData
{
  return self->_pinAppletAttestationData;
}

- (NSData)pinKEKHash
{
  return self->_pinKEKHash;
}

- (BOOL)isPinBypass
{
  return self->_isPinBypass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinKEKHash, 0);
  objc_storeStrong((id *)&self->_pinAppletAttestationData, 0);
  objc_storeStrong((id *)&self->_casd, 0);
  objc_storeStrong((id *)&self->_pinKeyBlob, 0);
  objc_storeStrong((id *)&self->_pinCipherBlob, 0);
  objc_storeStrong((id *)&self->_pinBlock, 0);
}

@end