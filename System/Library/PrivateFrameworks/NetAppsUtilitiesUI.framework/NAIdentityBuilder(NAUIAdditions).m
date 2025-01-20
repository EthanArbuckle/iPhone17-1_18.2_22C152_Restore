@interface NAIdentityBuilder(NAUIAdditions)
- (id)appendCGFloatCharacteristic:()NAUIAdditions withRole:;
- (id)appendCGPointCharacteristic:()NAUIAdditions withRole:;
- (id)appendCGRectCharacteristic:()NAUIAdditions withRole:;
- (uint64_t)appendCGFloatCharacteristic:()NAUIAdditions;
- (uint64_t)appendCGPointCharacteristic:()NAUIAdditions;
- (uint64_t)appendCGRectCharacteristic:()NAUIAdditions;
@end

@implementation NAIdentityBuilder(NAUIAdditions)

- (uint64_t)appendCGFloatCharacteristic:()NAUIAdditions
{
  return [a1 appendCGFloatCharacteristic:a3 withRole:3];
}

- (uint64_t)appendCGPointCharacteristic:()NAUIAdditions
{
  return [a1 appendCGPointCharacteristic:a3 withRole:3];
}

- (uint64_t)appendCGRectCharacteristic:()NAUIAdditions
{
  return [a1 appendCGRectCharacteristic:a3 withRole:3];
}

- (id)appendCGFloatCharacteristic:()NAUIAdditions withRole:
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__NAIdentityBuilder_NAUIAdditions__appendCGFloatCharacteristic_withRole___block_invoke;
  v11[3] = &unk_264627E70;
  id v12 = v6;
  id v7 = v6;
  v8 = (void *)MEMORY[0x223C9CEC0](v11);
  v9 = [a1 appendCharacteristic:v8 withRole:a4 comparatorBlock:0 hashBlock:0];

  return v9;
}

- (id)appendCGPointCharacteristic:()NAUIAdditions withRole:
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__NAIdentityBuilder_NAUIAdditions__appendCGPointCharacteristic_withRole___block_invoke;
  v10[3] = &unk_264627E70;
  id v11 = v6;
  id v7 = v6;
  v8 = [a1 appendCharacteristic:v10 withRole:a4 comparatorBlock:0 hashBlock:0];

  return v8;
}

- (id)appendCGRectCharacteristic:()NAUIAdditions withRole:
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__NAIdentityBuilder_NAUIAdditions__appendCGRectCharacteristic_withRole___block_invoke;
  v10[3] = &unk_264627E70;
  id v11 = v6;
  id v7 = v6;
  v8 = [a1 appendCharacteristic:v10 withRole:a4 comparatorBlock:0 hashBlock:0];

  return v8;
}

@end