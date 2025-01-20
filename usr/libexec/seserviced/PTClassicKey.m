@interface PTClassicKey
+ (id)_withExportedBlob:(id)a3 error:(id *)a4;
+ (id)_withNativePTData:(id)a3 error:(id *)a4;
+ (id)withData:(id)a3 error:(id *)a4;
- ($BE749665CD263385F3F5ED554982D87D)accessControlConstraintsItem;
- ($BE749665CD263385F3F5ED554982D87D)assetACLAttestationItem;
- ($BE749665CD263385F3F5ED554982D87D)assetACLItem;
- ($BE749665CD263385F3F5ED554982D87D)encryptedWrappedKeyBlobItem;
- ($BE749665CD263385F3F5ED554982D87D)keyBlobItem;
- (BOOL)isExportedData;
- (NSData)accessControlConstraints;
- (NSData)assetACL;
- (NSData)assetACLAttestation;
- (NSData)keyData;
- (NSData)keyIdentifier;
- (NSData)publicKey;
- (id)description;
- (unsigned)keyNumber;
@end

@implementation PTClassicKey

+ (id)withData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    unsigned int v6 = [v5 u8:0];
    if (v6 == 230)
    {
      v7 = +[PTClassicKey _withExportedBlob:v5 error:a4];
      goto LABEL_8;
    }
    if (v6 == 48)
    {
      v7 = +[PTClassicKey _withNativePTData:v5 error:a4];
LABEL_8:
      a4 = v7;
      goto LABEL_9;
    }
  }
  if (a4)
  {
    v8 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return a4;
}

+ (id)_withNativePTData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    objc_storeStrong((id *)(v7 + 128), a3);
    *(unsigned char *)(v7 + 120) = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceSpec())
    {
      if (a4)
      {
        v8 = SESDefaultLogObject();
        v16 = [v6 base64];
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        a4 = 0;
      }
    }
    else if (DERParseSequenceSpec())
    {
      if (a4)
      {
        v10 = SESDefaultLogObject();
        v11 = +[NSData dataWithDERItem:&v21];
        v17 = [v11 base64];
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      if (!DERParseSequenceSpec())
      {
        *(_OWORD *)(v7 + 168) = v19;
        long long v15 = v22;
        *(_OWORD *)(v7 + 184) = v20;
        *(_OWORD *)(v7 + 136) = v21;
        *(_OWORD *)(v7 + 152) = v15;
        *(_OWORD *)(v7 + 200) = 0u;
        a4 = (id *)(id)v7;
        goto LABEL_14;
      }
      if (a4)
      {
        v12 = SESDefaultLogObject();
        v13 = +[NSData dataWithDERItem:&v19];
        v18 = [v13 base64];
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if (a4)
  {
    v9 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_15:

  return a4;
}

+ (id)_withExportedBlob:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v29 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v28[0] = [v6 DERItem];
  v28[1] = v7;
  if (!DERDecodeItem((uint64_t)v28, &v29))
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3010000000;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    v25 = &unk_1003D5B51;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005D154;
    v21[3] = &unk_10040D010;
    v21[4] = &v22;
    if (DERDecodeSequenceContentWithBlock(v30, (uint64_t)v21) || !v23[5])
    {
      if (!a4)
      {
LABEL_10:
        _Block_object_dispose(&v22, 8);
        goto LABEL_11;
      }
      uint64_t v9 = SESDefaultLogObject();
      v10 = [v6 base64];
      v11 = SESCreateAndLogError();
    }
    else
    {
      uint64_t v9 = objc_opt_new();
      objc_storeStrong((id *)(v9 + 128), a3);
      *(unsigned char *)(v9 + 120) = 1;
      if (DERParseSequenceSpec())
      {
        if (!a4) {
          goto LABEL_9;
        }
        v10 = SESDefaultLogObject();
        v13 = +[NSData dataWithDERItem:v23 + 4];
        long long v20 = [v13 base64];
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      unint64_t v14 = DERLengthOfEncodedSequence(0x2000000000000010, v9 + 8, 7, (uint64_t)&unk_100376BE8) + 32;
      unint64_t v15 = v23[5];
      BOOL v16 = v15 >= v14;
      unint64_t v17 = v15 - v14;
      if (v16)
      {
        v18 = v23 + 4;
        v23[4] += v14;
        v18[1] = v17;
        DERParseSequenceSpec();
        *(_OWORD *)(v9 + 200) = 0u;
        a4 = (id *)(id)v9;
        goto LABEL_9;
      }
      if (!a4)
      {
LABEL_9:

        goto LABEL_10;
      }
      v10 = SESDefaultLogObject();
      v11 = SESCreateAndLogError();
    }
    *a4 = v11;
LABEL_8:

    a4 = 0;
    goto LABEL_9;
  }
  if (a4)
  {
    v8 = SESDefaultLogObject();
    long long v19 = [v6 base64];
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_11:

  return a4;
}

- (id)description
{
  uint64_t v3 = [(PTClassicKey *)self keyNumber];
  v4 = [(PTClassicKey *)self keyIdentifier];
  id v5 = [v4 asHexString];
  id v6 = +[NSString stringWithFormat:@"Key: keyNumber 0x%X keyIdentifier %@ isExported %d", v3, v5, self->_isExportedData];

  return v6;
}

- (NSData)publicKey
{
  return +[NSData dataWithDERItem:&self->_ptKeyBlob.publicKey];
}

- (NSData)keyIdentifier
{
  uint64_t v3 = +[NSMutableData dataWithLength:32];
  data = self->_ptKeyBlob.publicKey.data;
  LODWORD(self) = self->_ptKeyBlob.publicKey.length;
  id v5 = v3;
  CC_SHA256(data, (CC_LONG)self, (unsigned __int8 *)[v5 mutableBytes]);
  [v5 setLength:16];

  return (NSData *)v5;
}

- (unsigned)keyNumber
{
  return bswap32(*(_DWORD *)self->_ptKeyBlob.keyNumber.data);
}

- (NSData)assetACL
{
  return +[NSData dataWithDERItem:&self->_assetACLItem];
}

- (NSData)assetACLAttestation
{
  return +[NSData dataWithDERItem:&self->_assetACLAttestationItem];
}

- (NSData)accessControlConstraints
{
  return +[NSData dataWithDERItem:&self->_accessControlConstraintsItem];
}

- (BOOL)isExportedData
{
  return self->_isExportedData;
}

- (NSData)keyData
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- ($BE749665CD263385F3F5ED554982D87D)keyBlobItem
{
  objc_copyStruct(v4, &self->_keyBlobItem, 16, 1, 0);
  v2 = (char *)v4[0];
  unint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)encryptedWrappedKeyBlobItem
{
  objc_copyStruct(v4, &self->_encryptedWrappedKeyBlobItem, 16, 1, 0);
  v2 = (char *)v4[0];
  unint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)assetACLItem
{
  objc_copyStruct(v4, &self->_assetACLItem, 16, 1, 0);
  v2 = (char *)v4[0];
  unint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)assetACLAttestationItem
{
  objc_copyStruct(v4, &self->_assetACLAttestationItem, 16, 1, 0);
  v2 = (char *)v4[0];
  unint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($BE749665CD263385F3F5ED554982D87D)accessControlConstraintsItem
{
  objc_copyStruct(v4, &self->_accessControlConstraintsItem, 16, 1, 0);
  v2 = (char *)v4[0];
  unint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end