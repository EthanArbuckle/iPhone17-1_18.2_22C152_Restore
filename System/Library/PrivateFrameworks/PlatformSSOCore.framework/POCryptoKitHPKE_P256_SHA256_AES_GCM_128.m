@interface POCryptoKitHPKE_P256_SHA256_AES_GCM_128
- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9;
- (NSNumber)encryptionAlgorithm;
- (_TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128)init;
- (id)algValue;
- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10;
- (void)addValuesTo:(id)a3;
@end

@implementation POCryptoKitHPKE_P256_SHA256_AES_GCM_128

- (NSNumber)encryptionAlgorithm
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

- (_TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128)init
{
  uint64_t v19 = sub_259E99EB8();
  uint64_t v3 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_259E99E98();
  uint64_t v6 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259E99EA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259E99E88();
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm) = (Class)&unk_2707DBBB0;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F04720], v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F04710], v18);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F04728], v19);
  id v16 = &unk_2707DBBB0;
  sub_259E99E78();
  return (_TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128 *)POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v15);
}

- (void)addValuesTo:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_259E9A058();
  objc_msgSend(v4, sel_setEnc_, v6);

  id v7 = (id)sub_259E9A058();
  objc_msgSend(v4, sel_setAlg_, v7);
}

- (id)algValue
{
  v2 = (void *)sub_259E9A058();
  return v2;
}

- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9
{
  if (a5)
  {
    uint64_t v32 = sub_259E9A068();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v16 = 0;
  }
  id v17 = a3;
  uint64_t v18 = a4;
  if (!a6)
  {
    id v28 = a7;
    v29 = a8;
    v30 = self;
    unint64_t v24 = 0xF000000000000000;
    if (a7) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v25 = 0;
    unint64_t v27 = 0xF000000000000000;
    goto LABEL_9;
  }
  id v19 = a6;
  id v20 = a7;
  v21 = a8;
  v22 = self;
  a6 = (id)sub_259E99BE8();
  unint64_t v24 = v23;

  if (!a7) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v25 = sub_259E99BE8();
  unint64_t v27 = v26;

LABEL_9:
  POCryptoKitHPKE_P256_SHA256_AES_GCM_128.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v17, v18, v32, v16, (uint64_t)a6, v24, v25, v27, a8);

  sub_259E5D8A8(v25, v27);
  sub_259E5D8A8((uint64_t)a6, v24);
  swift_bridgeObjectRelease();
  return 1;
}

- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10
{
  if (a5)
  {
    uint64_t v37 = sub_259E9A068();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v16 = 0;
  }
  id v17 = a3;
  v38 = a4;
  if (a6)
  {
    id v18 = a6;
    id v19 = a7;
    id v20 = a8;
    id v21 = a9;
    v22 = self;
    uint64_t v36 = sub_259E99BE8();
    unint64_t v24 = v23;

    if (a7) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v25 = 0;
    unint64_t v27 = 0xF000000000000000;
    if (a9) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  id v30 = a7;
  v31 = a8;
  id v32 = a9;
  v33 = self;
  uint64_t v36 = 0;
  unint64_t v24 = 0xF000000000000000;
  if (!a7) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v25 = sub_259E99BE8();
  unint64_t v27 = v26;

  if (a9)
  {
LABEL_7:
    uint64_t v28 = sub_259E99BE8();
    unint64_t v39 = v29;

    goto LABEL_11;
  }
LABEL_10:
  uint64_t v28 = 0;
  unint64_t v39 = 0xF000000000000000;
LABEL_11:
  POCryptoKitHPKE_P256_SHA256_AES_GCM_128.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v17, v38, v37, v16, v36, v24, v25, v27, a8, v28, v39);

  sub_259E5D8A8(v28, v39);
  sub_259E5D8A8(v25, v27);
  sub_259E5D8A8(v36, v24);
  swift_bridgeObjectRelease();
  v34 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
  return v34;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_128_encryptionAlgorithm));
}

@end