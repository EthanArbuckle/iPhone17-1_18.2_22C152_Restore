@interface POCryptoKitHPKE_P384_SHA384_AES_GCM_256
- (BOOL)decodeAndDecryptJWT:(id)a3 privateKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPublicKey:(__SecKey *)a8 error:(id *)a9;
- (NSNumber)encryptionAlgorithm;
- (_TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256)init;
- (id)algValue;
- (id)encodeAndEncryptJWT:(id)a3 publicKey:(__SecKey *)a4 otherInfo:(id)a5 psk:(id)a6 psk_id:(id)a7 authPrivateKey:(__SecKey *)a8 auth_kid:(id)a9 error:(id *)a10;
- (void)addValuesTo:(id)a3;
@end

@implementation POCryptoKitHPKE_P384_SHA384_AES_GCM_256

- (NSNumber)encryptionAlgorithm
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm));
}

- (_TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256)init
{
  uint64_t v3 = sub_259E99E88();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm) = (Class)&unk_2707DBB80;
  id v6 = &unk_2707DBB80;
  sub_259E99E58();
  return (_TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256 *)POCryptoKitHPKE.init(cipherSuite:)((uint64_t)v5);
}

- (void)addValuesTo:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)sub_259E9A058();
  objc_msgSend(v4, sel_setEnc_, v6);

  sub_259E9A068();
  id v7 = (id)sub_259E9A058();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAlg_, v7);
}

- (id)algValue
{
  sub_259E9A068();
  v2 = (void *)sub_259E9A058();
  swift_bridgeObjectRelease();
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
  v18 = a4;
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
  POCryptoKitHPKE_P384_SHA384_AES_GCM_256.decodeAndDecryptJWT(_:privateKey:otherInfo:psk:psk_id:authPublicKey:)(v17, v18, v32, v16, (uint64_t)a6, v24, v25, v27, a8);

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
  POCryptoKitHPKE_P384_SHA384_AES_GCM_256.encodeAndEncryptJWT(_:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:)(v17, v38, v37, v16, v36, v24, v25, v27, a8, v28, v39);

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
                     + OBJC_IVAR____TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256_encryptionAlgorithm));
}

@end