@interface CLSPersonIdentity(Ingest)
- (id)locationsByAddressTypes;
@end

@implementation CLSPersonIdentity(Ingest)

- (id)locationsByAddressTypes
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__CLSPersonIdentity_Ingest__locationsByAddressTypes__block_invoke;
  v10[3] = &unk_1E68EABE0;
  id v11 = v2;
  id v3 = v2;
  [a1 enumerateAddressesOfType:0 asCLLocationsWithBlock:v10];
  v4 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CLSPersonIdentity_Ingest__locationsByAddressTypes__block_invoke_2;
  v8[3] = &unk_1E68EABE0;
  id v9 = v4;
  id v5 = v4;
  [a1 enumerateAddressesOfType:1 asCLLocationsWithBlock:v8];
  v12[0] = &unk_1F28D0E70;
  v12[1] = &unk_1F28D0E88;
  v13[0] = v3;
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

@end