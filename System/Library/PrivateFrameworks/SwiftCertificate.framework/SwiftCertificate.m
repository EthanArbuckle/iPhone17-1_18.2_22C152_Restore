id sub_25E672EF0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t vars8;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *a2 = v4;

  return v4;
}

void sub_25E672F48(void **a1, uint64_t *a2)
{
  v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
  id v5 = v2;
}

id sub_25E672FA0()
{
  swift_beginAccess();
  v1 = *(void **)(v0 + 16);

  return v1;
}

uint64_t sub_25E672FE4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  unint64_t v5 = *(void *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_25E6730F0(v4, v5);
}

uint64_t sub_25E673030(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 24);
  unint64_t v6 = *(void *)(v4 + 32);
  *(void *)(v4 + 24) = v2;
  *(void *)(v4 + 32) = v3;
  sub_25E6730F0(v2, v3);
  return sub_25E67332C(v5, v6);
}

uint64_t sub_25E6730A0()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  sub_25E6730F0(v1, *(void *)(v0 + 32));
  return v1;
}

uint64_t sub_25E6730F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

void *Certificate.__allocating_init(derRepresentation:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  CFDataRef v5 = (const __CFData *)sub_25E674410();
  SecCertificateRef v6 = SecCertificateCreateWithData(0, v5);

  if (v6)
  {
    v4[2] = v6;
    v4[3] = a1;
    v4[4] = a2;
  }
  else
  {
    sub_25E6732D8();
    swift_allocError();
    void *v7 = 0;
    swift_willThrow();
    sub_25E67332C(a1, a2);
    swift_deallocPartialClassInstance();
  }
  return v4;
}

void *Certificate.init(derRepresentation:)(uint64_t a1, unint64_t a2)
{
  CFDataRef v5 = (const __CFData *)sub_25E674410();
  SecCertificateRef v6 = SecCertificateCreateWithData(0, v5);

  if (v6)
  {
    v2[2] = v6;
    v2[3] = a1;
    v2[4] = a2;
  }
  else
  {
    sub_25E6732D8();
    swift_allocError();
    void *v7 = 0;
    swift_willThrow();
    sub_25E67332C(a1, a2);
    type metadata accessor for Certificate();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

unint64_t sub_25E6732D8()
{
  unint64_t result = qword_26A701600;
  if (!qword_26A701600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A701600);
  }
  return result;
}

uint64_t sub_25E67332C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t type metadata accessor for Certificate()
{
  return self;
}

uint64_t sub_25E6733A8()
{
  swift_beginAccess();
  CFDataRef v1 = SecCertificateCopyData(*(SecCertificateRef *)(v0 + 16));
  uint64_t v2 = sub_25E674420();

  return v2;
}

uint64_t sub_25E67340C()
{
  swift_beginAccess();
  CFStringRef v1 = SecCertificateCopySubjectSummary(*(SecCertificateRef *)(v0 + 16));
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (__CFString *)v1;
  uint64_t v3 = sub_25E674430();

  return v3;
}

uint64_t sub_25E673480()
{
  commonName[1] = *(CFStringRef *)MEMORY[0x263EF8340];
  commonName[0] = 0;
  swift_beginAccess();
  if (SecCertificateCopyCommonName(*(SecCertificateRef *)(v0 + 16), commonName))
  {
    sub_25E6732D8();
    swift_allocError();
    void *v1 = 3;
    swift_willThrow();
  }
  else
  {
    uint64_t v2 = (__CFString *)commonName[0];
    if (commonName[0])
    {
      uint64_t v0 = sub_25E674430();
    }
    else
    {
      return 0;
    }
  }
  return v0;
}

uint64_t sub_25E673574()
{
  emailAddresses[1] = *(CFArrayRef *)MEMORY[0x263EF8340];
  emailAddresses[0] = 0;
  swift_beginAccess();
  uint64_t result = SecCertificateCopyEmailAddresses(*(SecCertificateRef *)(v0 + 16), emailAddresses);
  if (result)
  {
    sub_25E6732D8();
    swift_allocError();
    void *v2 = 4;
    swift_willThrow();

    return v0;
  }
  else
  {
    if (emailAddresses[0])
    {
      emailAddresses[0];
      uint64_t result = sub_25E674440();
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25E673678()
{
  return sub_25E6736D0(MEMORY[0x263F16DB0]);
}

uint64_t sub_25E6736A4()
{
  return sub_25E6736D0(MEMORY[0x263F16DB8]);
}

uint64_t sub_25E6736D0(uint64_t (*a1)(void))
{
  swift_beginAccess();
  uint64_t v3 = a1(*(void *)(v1 + 16));
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v1 = sub_25E674420();
  }
  else
  {
    sub_25E6732D8();
    swift_allocError();
    *CFDataRef v5 = 2;
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_25E67377C()
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  error[0] = 0;
  swift_beginAccess();
  uint64_t v2 = SecCertificateCopyKey(*(SecCertificateRef *)(v0 + 16));
  if (!v2)
  {
    sub_25E6732D8();
    swift_allocError();
    void *v9 = 2;
    swift_willThrow();
    return v1;
  }
  uint64_t v3 = v2;
  CFDataRef v4 = SecKeyCopyExternalRepresentation(v2, error);
  if (!v4)
  {
    CFErrorRef v8 = error[0];
    if (!error[0])
    {
      sub_25E6732D8();
      swift_allocError();
      void *v14 = 2;
      swift_willThrow();
      uint64_t v11 = 0;
      unint64_t v12 = 0xF000000000000000;
      goto LABEL_9;
    }
    uint64_t v1 = 0;
    unint64_t v7 = 0xF000000000000000;
LABEL_8:
    sub_25E6732D8();
    swift_allocError();
    CFErrorRef *v10 = v8;
    swift_willThrow();
    uint64_t v11 = v1;
    unint64_t v12 = v7;
LABEL_9:
    sub_25E673900(v11, v12);

    return v1;
  }
  CFDataRef v5 = v4;
  uint64_t v1 = sub_25E674420();
  unint64_t v7 = v6;

  CFErrorRef v8 = error[0];
  if (error[0]) {
    goto LABEL_8;
  }

  return v1;
}

uint64_t sub_25E673900(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25E67332C(a1, a2);
  }
  return a1;
}

uint64_t sub_25E673914()
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  error[0] = 0;
  swift_beginAccess();
  CFDataRef v1 = SecCertificateCopySerialNumberData(*(SecCertificateRef *)(v0 + 16), error);
  if (v1)
  {
    CFDataRef v2 = v1;
    uint64_t v3 = sub_25E674420();
    unint64_t v5 = v4;

    uint64_t v6 = (uint64_t)error[0];
    if (!error[0]) {
      return v3;
    }
  }
  else
  {
    uint64_t v6 = (uint64_t)error[0];
    if (!error[0])
    {
      unint64_t v5 = 0xF000000000000000;
      uint64_t v6 = 2;
      sub_25E6732D8();
      uint64_t v3 = 0;
      goto LABEL_7;
    }
    uint64_t v3 = 0;
    unint64_t v5 = 0xF000000000000000;
  }
  sub_25E6732D8();
  id v7 = (id)v6;
LABEL_7:
  swift_allocError();
  *CFErrorRef v8 = v6;
  swift_willThrow();
  sub_25E673900(v3, v5);
  return v3;
}

uint64_t Certificate.deinit()
{
  sub_25E67332C(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return v0;
}

uint64_t Certificate.__deallocating_deinit()
{
  sub_25E67332C(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return MEMORY[0x270FA0228](v0, 40, 7);
}

id sub_25E673A94@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  unint64_t v4 = *(void **)(v3 + 40);
  *a2 = v4;

  return v4;
}

void sub_25E673AEC(void **a1, uint64_t *a2)
{
  CFDataRef v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  id v5 = v2;
}

id sub_25E673B44()
{
  swift_beginAccess();
  CFDataRef v1 = *(void **)(v0 + 40);

  return v1;
}

void *DigitalIdentity.__allocating_init(certificate:privateKey:)(uint64_t a1, void *a2)
{
  unint64_t v4 = (void *)swift_allocObject();
  v4[5] = a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  sub_25E6730F0(v5, v6);
  CFDataRef v8 = (const __CFData *)sub_25E674410();
  SecCertificateRef v9 = SecCertificateCreateWithData(0, v8);

  if (v9)
  {
    v4[2] = v9;
    v4[3] = v5;
    v4[4] = v6;
  }
  else
  {
    sub_25E6732D8();
    swift_allocError();
    void *v10 = 0;
    swift_willThrow();
    sub_25E67332C(v5, v6);
    type metadata accessor for Certificate();
    swift_deallocPartialClassInstance();
  }
  swift_release();

  return v4;
}

void *DigitalIdentity.init(certificate:privateKey:)(uint64_t a1, void *a2)
{
  v2[5] = a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  sub_25E6730F0(v5, v6);
  CFDataRef v8 = (const __CFData *)sub_25E674410();
  SecCertificateRef v9 = SecCertificateCreateWithData(0, v8);

  if (v9)
  {
    v2[2] = v9;
    v2[3] = v5;
    v2[4] = v6;
  }
  else
  {
    sub_25E6732D8();
    swift_allocError();
    void *v10 = 0;
    swift_willThrow();
    sub_25E67332C(v5, v6);
    type metadata accessor for Certificate();
    swift_deallocPartialClassInstance();
  }
  swift_release();

  return v2;
}

void DigitalIdentity.__allocating_init(derRepresentation:)()
{
}

void DigitalIdentity.init(derRepresentation:)()
{
}

void sub_25E673E20()
{
}

uint64_t DigitalIdentity.deinit()
{
  sub_25E67332C(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return v0;
}

uint64_t DigitalIdentity.__deallocating_deinit()
{
  sub_25E67332C(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t method lookup function for Certificate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Certificate);
}

uint64_t dispatch thunk of Certificate.secCertificate.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of Certificate.der.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of Certificate.__allocating_init(derRepresentation:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of Certificate.derRepresentation.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of Certificate.subjectSummary.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of Certificate.commonName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Certificate.emailAddresses.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of Certificate.normalizedIssuerSequence.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of Certificate.normalizedSubjectSequence.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of Certificate.publicKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of Certificate.serialNumberData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t type metadata accessor for DigitalIdentity()
{
  return self;
}

uint64_t method lookup function for DigitalIdentity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DigitalIdentity);
}

uint64_t dispatch thunk of DigitalIdentity.privateKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of DigitalIdentity.__allocating_init(certificate:privateKey:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for SecKey(uint64_t a1)
{
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

void sub_25E674184(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for SwiftCertificateError(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for SwiftCertificateError(void **a1)
{
  CFDataRef v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for SwiftCertificateError(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for SwiftCertificateError(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for SwiftCertificateError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFA && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483643);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 4;
  if (v4 >= 6) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SwiftCertificateError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 4;
    }
  }
  return result;
}

uint64_t sub_25E6743C0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25E6743DC(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SwiftCertificateError()
{
  return &type metadata for SwiftCertificateError;
}

uint64_t sub_25E674410()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25E674420()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25E674430()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E674440()
{
  return MEMORY[0x270EF1B98]();
}

uint64_t sub_25E674450()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E674460()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E674470()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E674480()
{
  return MEMORY[0x270F9FB48]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x270EFD6E8](certificate, commonName);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

OSStatus SecCertificateCopyEmailAddresses(SecCertificateRef certificate, CFArrayRef *emailAddresses)
{
  return MEMORY[0x270EFD720](certificate, emailAddresses);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD7A8](certificate, error);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}