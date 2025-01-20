@interface PSGCarrierLockDetailsController
- (id)specifiers;
- (id)valueString:(id)a3;
@end

@implementation PSGCarrierLockDetailsController

- (id)specifiers
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:sel_valueString_ detail:0 cell:4 edit:0];
    [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v9[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)valueString:(id)a3
{
  return PSG_LocalizedStringForGeneral(@"CARRIER_LOCK_LOCKED_DETAILS");
}

@end