@interface PKAppIntentUIUtilities
+ (void)annotateView:(id)a3 withEntityForPass:(id)a4;
+ (void)annotateView:(id)a3 withEntityForTransaction:(id)a4;
- (PKAppIntentUIUtilities)init;
@end

@implementation PKAppIntentUIUtilities

+ (void)annotateView:(id)a3 withEntityForPass:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E949DAC8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v10 = a4;
    id v11 = a3;
    sub_19F455EDC(v10, 0, 0xF000000000000000, (uint64_t *)v15);
    v13[2] = v15[2];
    v13[3] = v15[3];
    uint64_t v14 = v16;
    v13[0] = v15[0];
    v13[1] = v15[1];
    sub_19F46C7A8(v15);
    sub_19F46C820();
    sub_1A03ADDB8();
    uint64_t v12 = sub_1A03ADDC8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
    sub_1A03B52E8();
    sub_19F46C72C((uint64_t)v15);
  }
}

+ (void)annotateView:(id)a3 withEntityForTransaction:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E949DAC8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a4;
  id v11 = a3;
  sub_19F93D8A8(v10, (uint64_t *)v15);
  v13[2] = v15[2];
  v13[3] = v15[3];
  uint64_t v14 = v16;
  v13[0] = v15[0];
  v13[1] = v15[1];
  sub_19F47EC70((uint64_t)v15);
  sub_19F47ECFC();
  sub_1A03ADDB8();
  uint64_t v12 = sub_1A03ADDC8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  sub_1A03B52E8();
  sub_19F47ED50((uint64_t)v15);
}

- (PKAppIntentUIUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppIntentUIUtilities();
  return [(PKAppIntentUIUtilities *)&v3 init];
}

@end