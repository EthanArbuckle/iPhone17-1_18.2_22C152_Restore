@interface FCCKAESSIVRecordNameCipher
- (id)_derivedKeyFromKey:(id)a3;
- (id)_encryptionSalt;
- (id)decryptRecordName:(id)a3 withKey:(id)a4;
- (id)encryptRecordName:(id)a3 withKey:(id)a4;
@end

@implementation FCCKAESSIVRecordNameCipher

- (id)encryptRecordName:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    v8 = [(FCCKAESSIVRecordNameCipher *)self _derivedKeyFromKey:a4];
    if (v8)
    {
      v9 = [(FCCKAESSIVRecordNameCipher *)self _encryptionSalt];
      v10 = [v6 dataUsingEncoding:4];
      v11 = objc_msgSend(v10, "fc_encryptAESSIVWithKey:additionalData:", v8, v9);
      v12 = v11;
      if (v11)
      {
        v7 = [v11 base64EncodedStringWithOptions:0];
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)decryptRecordName:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    v8 = [(FCCKAESSIVRecordNameCipher *)self _derivedKeyFromKey:a4];
    if (v8)
    {
      v9 = [(FCCKAESSIVRecordNameCipher *)self _encryptionSalt];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      v11 = objc_msgSend(v10, "fc_decryptAESSIVWithKey:additionalData:", v8, v9);
      if (v11) {
        v7 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)_derivedKeyFromKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  v5 = [v3 dataWithLength:64];
  ccsha512_di();
  [v4 length];
  id v6 = v4;
  [v6 bytes];

  [v5 length];
  id v7 = v5;
  [v7 mutableBytes];
  if (cchkdf())
  {

    id v7 = 0;
  }
  return v7;
}

- (id)_encryptionSalt
{
  if (qword_1EB5D1208 != -1) {
    dispatch_once(&qword_1EB5D1208, &__block_literal_global_38);
  }
  v2 = (void *)_MergedGlobals_156;
  return v2;
}

void __45__FCCKAESSIVRecordNameCipher__encryptionSalt__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v2 = xmmword_1A4973A60;
  uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v2 length:16];
  v1 = (void *)_MergedGlobals_156;
  _MergedGlobals_156 = v0;
}

@end