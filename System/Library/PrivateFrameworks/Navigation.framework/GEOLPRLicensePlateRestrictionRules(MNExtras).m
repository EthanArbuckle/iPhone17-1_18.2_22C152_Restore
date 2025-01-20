@interface GEOLPRLicensePlateRestrictionRules(MNExtras)
- (id)plateRegionsContainingLatLngs:()MNExtras inRadius:;
@end

@implementation GEOLPRLicensePlateRestrictionRules(MNExtras)

- (id)plateRegionsContainingLatLngs:()MNExtras inRadius:
{
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "licensePlateRegionsCount"));
  v8 = [a1 licensePlateRegions];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__GEOLPRLicensePlateRestrictionRules_MNExtras__plateRegionsContainingLatLngs_inRadius___block_invoke;
  v14[3] = &unk_1E60F7540;
  id v15 = v6;
  double v17 = a2;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v14];

  v11 = v16;
  id v12 = v9;

  return v12;
}

@end