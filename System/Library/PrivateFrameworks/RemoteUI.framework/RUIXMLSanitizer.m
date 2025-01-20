@interface RUIXMLSanitizer
- (RUIXMLSanitizer)init;
- (id)logStringWithXMLString:(id)a3 error:(id *)a4;
- (id)sanitizedDataWithElement:(id)a3 error:(id *)a4;
- (id)sanitizedXML:(id)a3 error:(id *)a4;
- (id)sanitizedXMLElementWithData:(id)a3 error:(id *)a4;
@end

@implementation RUIXMLSanitizer

- (RUIXMLSanitizer)init
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = 0;
  v3 = (RUIXMLSanitizer *)(*(uint64_t (**)(uint64_t *))(ObjectType + 112))(&v5);
  swift_deallocPartialClassInstance();
  return v3;
}

- (id)sanitizedXML:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_2146020E8();
  unint64_t v9 = v8;

  v10 = sub_2145E3C14(v7, v9);
  unint64_t v12 = v11;

  sub_214556AF4(v7, v9);
  v13 = (void *)sub_2146020D8();
  sub_214556AF4((uint64_t)v10, v12);
  return v13;
}

- (id)sanitizedDataWithElement:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_2145E416C();
  unint64_t v9 = v8;

  v10 = (void *)sub_2146020D8();
  sub_214556AF4(v7, v9);
  return v10;
}

- (id)sanitizedXMLElementWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_2146020E8();
  unint64_t v9 = v8;

  v10 = (void *)sub_2145E4404(v7, v9);
  sub_214556AF4(v7, v9);
  return v10;
}

- (id)logStringWithXMLString:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_214602EA8();
  uint64_t v7 = v6;
  unint64_t v8 = self;
  sub_2145E93A0(v5, v7);
  swift_bridgeObjectRelease();

  unint64_t v9 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  return v9;
}

@end