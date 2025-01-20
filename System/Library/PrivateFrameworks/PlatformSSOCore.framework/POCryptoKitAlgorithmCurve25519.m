@interface POCryptoKitAlgorithmCurve25519
- (BOOL)verifyKey:(__SecKey *)a3;
- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingCertificateString:(id)a5;
- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingKey:(__SecKey *)a5;
- (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519)init;
- (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519)initWithSecKeyAlgorithm:(const __CFString *)a3 algorithmName:(id)a4 alg:(id)a5;
- (id)signData:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5;
@end

@implementation POCryptoKitAlgorithmCurve25519

- (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)sub_259E9A058();
  v5 = (void *)sub_259E9A058();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(POJWTSigning *)&v8 initWithSecKeyAlgorithm:0 algorithmName:v4 alg:v5];

  return v6;
}

- (id)signData:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5
{
  uint64_t v8 = sub_259E99D58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  v13 = a4;
  v14 = self;
  uint64_t v15 = sub_259E99BE8();
  unint64_t v17 = v16;

  v18 = v13;
  sub_259E99D38();
  v25[1] = v15;
  v25[2] = v17;
  sub_259E60120();
  uint64_t v19 = sub_259E99D48();
  unint64_t v21 = v20;
  uint64_t v22 = v19;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  sub_259E5D850(v15, v17);
  v23 = (void *)sub_259E99BC8();
  sub_259E5D850(v22, v21);
  return v23;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingKey:(__SecKey *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a5;
  v11 = self;
  uint64_t v12 = sub_259E99BE8();
  unint64_t v14 = v13;

  uint64_t v15 = sub_259E99BE8();
  unint64_t v17 = v16;

  LOBYTE(v9) = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on5usingSb10Foundation4DataV_AISo9SecKeyRefatF_0(v12, v14, v15, v17, v10);
  sub_259E5D850(v15, v17);
  sub_259E5D850(v12, v14);

  return v9 & 1;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingCertificateString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  uint64_t v12 = sub_259E99BE8();
  unint64_t v14 = v13;

  uint64_t v15 = sub_259E99BE8();
  unint64_t v17 = v16;

  sub_259E9A068();
  LOBYTE(v9) = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C15verifySignature_2on22usingCertificateStringSb10Foundation4DataV_AISStF_0(v12, v14, v15, v17);
  swift_bridgeObjectRelease();
  sub_259E5D850(v15, v17);
  sub_259E5D850(v12, v14);

  return v9 & 1;
}

- (BOOL)verifyKey:(__SecKey *)a3
{
  v4 = a3;
  v5 = self;
  char v6 = _s15PlatformSSOCore30POCryptoKitAlgorithmCurve25519C9verifyKeyySbSo03SecH3RefaF_0(v4);

  return v6 & 1;
}

- (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519)initWithSecKeyAlgorithm:(const __CFString *)a3 algorithmName:(id)a4 alg:(id)a5
{
  CFStringRef v5 = (id)a3;
  result = (_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end