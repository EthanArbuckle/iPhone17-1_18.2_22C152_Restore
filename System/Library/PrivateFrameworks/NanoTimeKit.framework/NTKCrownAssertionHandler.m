@interface NTKCrownAssertionHandler
- (BOOL)relinquishCrownAssertionForToken:(id)a3;
- (NTKCrownAssertionHandler)init;
- (id)takeCrownAssertionForToken:(id)a3;
@end

@implementation NTKCrownAssertionHandler

- (id)takeCrownAssertionForToken:(id)a3
{
  uint64_t v5 = sub_1BC871798();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FA5FB0);
  MEMORY[0x1F4188790](v11 - 8, v12, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BC871778();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v15, 1, 1, v5);
  }
  v16 = self;
  sub_1BC854220((uint64_t)v15, (uint64_t)v10);

  sub_1BC8545CC((uint64_t)v15);
  v17 = (void *)sub_1BC871768();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  return v17;
}

- (BOOL)relinquishCrownAssertionForToken:(id)a3
{
  uint64_t v3 = sub_1BC871798();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5, v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC871778();
  char v9 = sub_1BC856C0C((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  return v9 & 1;
}

- (NTKCrownAssertionHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CrownAssertionHandler();
  return [(NTKCrownAssertionHandler *)&v3 init];
}

@end