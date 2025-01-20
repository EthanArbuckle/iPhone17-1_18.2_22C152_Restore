@interface SUSUIFakeSUDescriptor
- (SUSUIFakeSUDescriptor)init;
- (id)fakeDocumentation;
@end

@implementation SUSUIFakeSUDescriptor

- (SUSUIFakeSUDescriptor)init
{
  SEL v14 = a2;
  v15 = 0;
  v13.receiver = self;
  v13.super_class = (Class)SUSUIFakeSUDescriptor;
  v12 = [(SUDescriptor *)&v13 init];
  v15 = v12;
  objc_storeStrong((id *)&v15, v12);
  if (v12)
  {
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78268]) = 1;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78288]) = 1;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78298]) = 1;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78280]) = 0;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78338]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78340]), 0);
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78278]) = 1;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78270]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78300]), 0);
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78308]), 0);
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78258]), 0);
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F782A8]) = 0;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78260]) = 0;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F782F8]) = 0;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78358]) = 0;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F78328]) = 0;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F782C0]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F782B0]), @"FakeOS 17.0");
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F782C8]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F782E8]), 0);
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F782E0]), 0);
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F782D0]) = 0;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F782D8]) = 0;
    *((unsigned char *)&v15->super.super.isa + (int)*MEMORY[0x263F782A0]) = 0;
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78330]), @"FakeApple");
    objc_storeStrong((id *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78318]), @"FakeOS");
    id v10 = (id)[MEMORY[0x263F1C5C0] currentDevice];
    id v2 = (id)[v10 systemVersion];
    v3 = (void **)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78320]);
    v4 = *v3;
    *v3 = v2;

    id v11 = (id)[MEMORY[0x263F1C5C0] currentDevice];
    id v5 = (id)[v11 buildVersion];
    v6 = (void **)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78310]);
    v7 = *v6;
    *v6 = v5;

    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78290]) = (Class)26214400;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F782B8]) = (Class)26214400;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78348]) = (Class)5242880;
    *(Class *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F782F0]) = (Class)5242880;
    *(_DWORD *)((char *)&v15->super.super.isa + (int)*MEMORY[0x263F78350]) = 1;
  }
  v9 = v15;
  objc_storeStrong((id *)&v15, 0);
  return v9;
}

- (id)fakeDocumentation
{
  id v2 = objc_alloc_init(SUSUIFakeDocumentation);

  return v2;
}

@end