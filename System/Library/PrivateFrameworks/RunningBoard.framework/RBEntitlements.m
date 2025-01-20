@interface RBEntitlements
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasEntitlementDomain:(unint64_t)a3;
- (NSString)description;
- (RBEntitlements)init;
- (id)_entitlementsForOption:(uint64_t)a1;
- (id)_initWithEntitlements:(id)a3;
@end

@implementation RBEntitlements

- (id)_initWithEntitlements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBEntitlements;
  v5 = [(RBEntitlements *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSSet *)v6;
  }
  return v5;
}

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v11 = (void (*)(void *))__39__RBEntitlements_hasEntitlementDomain___block_invoke;
  v12 = &unk_2647C7B70;
  v13 = self;
  v14 = &v15;
  id v4 = v10;
  if (a3)
  {
    char v19 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unsigned int v7 = 0;
      do
      {
        if (((1 << v7) & a3) != 0)
        {
          v11(v4);
          if (v19) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  char v8 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __39__RBEntitlements_hasEntitlementDomain___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = -[RBEntitlements _entitlementsForOption:](*(void *)(a1 + 32), a2);
  if (v6)
  {
    unsigned int v7 = *(void **)(*(void *)(a1 + 32) + 8);
    char v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 intersectsSet:v8];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (id)_entitlementsForOption:(uint64_t)a1
{
  v18[3] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] != 1)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:sel__entitlementsForOption_ object:a1 file:@"RBEntitlements.m" lineNumber:130 description:@"use _entitlementsForOptions:"];
    }
    uint8x8_t v5 = 0;
    switch(a2)
    {
      case 1:
        v18[0] = @"com.apple.runningboard.process-state";
        v18[1] = @"com.apple.assertiond.app-state-monitor";
        v18[2] = @"com.apple.multitasking.termination";
        uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
        unsigned int v7 = v18;
        goto LABEL_10;
      case 2:
        v17[0] = @"com.apple.runningboard.launchprocess";
        v17[1] = @"com.apple.assertiond.system-shell";
        v17[2] = @"com.apple.private.xpc.launchd.app-server";
        uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
        unsigned int v7 = v17;
LABEL_10:
        uint64_t v8 = 3;
        goto LABEL_14;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        v16[0] = @"com.apple.runningboard.terminateprocess";
        v16[1] = @"com.apple.multitasking.termination";
        uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
        unsigned int v7 = v16;
        goto LABEL_13;
      case 8:
        v15[0] = @"com.apple.backboardd.debugapplications";
        v15[1] = @"com.apple.springboard.debugapplications";
        uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
        unsigned int v7 = v15;
LABEL_13:
        uint64_t v8 = 2;
        goto LABEL_14;
      default:
        if (a2 == 16)
        {
          v14 = @"com.apple.runningboard.endowment-originator";
          v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
          v11 = -[RBEntitlements _entitlementsForOption:](a1, 2);
          uint8x8_t v5 = [v10 arrayByAddingObjectsFromArray:v11];
        }
        else if (a2 == 32)
        {
          v13[0] = @"com.apple.multitasking.unlimitedassertions";
          v13[1] = @"com.apple.multitasking.systemappassertions";
          v13[2] = @"com.apple.multitasking.newsstandassertions";
          v13[3] = @"com.apple.multitasking.voipassertions";
          v13[4] = @"com.apple.assertiond.system-shell";
          uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
          unsigned int v7 = v13;
          uint64_t v8 = 5;
LABEL_14:
          uint8x8_t v5 = [v6 arrayWithObjects:v7 count:v8];
        }
        break;
    }
  }
  else
  {
    uint8x8_t v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)hasEntitlement:(id)a3
{
  return [(NSSet *)self->_entitlements containsObject:a3];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint8x8_t v4 = [(id)objc_opt_class() description];
  uint8x8_t v5 = [(NSSet *)self->_entitlements allObjects];
  uint64_t v6 = [v5 componentsJoinedByString:@",\n\t\t\t"];
  unsigned int v7 = (void *)[v3 initWithFormat:@"<%@| [\n\t\t\t%@\n\t\t\t]>", v4, v6];

  return (NSString *)v7;
}

- (RBEntitlements)init
{
  uint8x8_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBEntitlements.m" lineNumber:80 description:@"-init is not allowed on RBEntitlements"];

  return 0;
}

@end