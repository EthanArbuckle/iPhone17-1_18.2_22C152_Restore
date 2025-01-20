@interface TRIActivationEventRecord
+ (id)recordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleIdentifier:(id)a9 carrierCountryIsoCode:(id)a10 diagnosticsUsageEnabled:(int64_t)a11 hasAne:(int64_t)a12 aneVersion:(id)a13;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (NSString)aneVersion;
- (NSString)carrierBundleIdentifier;
- (NSString)carrierCountryIsoCode;
- (NSString)factorPackSetId;
- (NSString)languageCode;
- (NSString)osBuild;
- (NSString)parentId;
- (NSString)regionCode;
- (TRIActivationEventRecord)initWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleIdentifier:(id)a9 carrierCountryIsoCode:(id)a10 diagnosticsUsageEnabled:(int64_t)a11 hasAne:(int64_t)a12 aneVersion:(id)a13;
- (id)copyWithReplacementAneVersion:(id)a3;
- (id)copyWithReplacementCarrierBundleIdentifier:(id)a3;
- (id)copyWithReplacementCarrierCountryIsoCode:(id)a3;
- (id)copyWithReplacementDeploymentId:(int)a3;
- (id)copyWithReplacementDiagnosticsUsageEnabled:(int64_t)a3;
- (id)copyWithReplacementFactorPackSetId:(id)a3;
- (id)copyWithReplacementHasAne:(int64_t)a3;
- (id)copyWithReplacementLanguageCode:(id)a3;
- (id)copyWithReplacementOsBuild:(id)a3;
- (id)copyWithReplacementParentId:(id)a3;
- (id)copyWithReplacementRegionCode:(id)a3;
- (id)description;
- (int)deploymentId;
- (int64_t)diagnosticsUsageEnabled;
- (int64_t)hasAne;
- (unint64_t)hash;
@end

@implementation TRIActivationEventRecord

- (TRIActivationEventRecord)initWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleIdentifier:(id)a9 carrierCountryIsoCode:(id)a10 diagnosticsUsageEnabled:(int64_t)a11 hasAne:(int64_t)a12 aneVersion:(id)a13
{
  id v17 = a3;
  id v37 = a4;
  id v18 = a4;
  id v39 = a6;
  id v19 = a6;
  id v40 = a7;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v44 = a10;
  id v23 = a13;
  v41 = v22;
  v42 = v23;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1271, @"Invalid parameter not satisfying: %@", @"parentId != nil" object file lineNumber description];

    id v22 = v41;
    id v23 = v42;
    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1272, @"Invalid parameter not satisfying: %@", @"factorPackSetId != nil" object file lineNumber description];

  id v22 = v41;
  id v23 = v42;
  if (v19)
  {
LABEL_4:
    if (v20) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1273, @"Invalid parameter not satisfying: %@", @"osBuild != nil" object file lineNumber description];

  id v22 = v41;
  id v23 = v42;
  if (v20)
  {
LABEL_5:
    if (v21) {
      goto LABEL_6;
    }
LABEL_16:
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1275, @"Invalid parameter not satisfying: %@", @"regionCode != nil" object file lineNumber description];

    id v23 = v42;
    if (v41) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_15:
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1274, @"Invalid parameter not satisfying: %@", @"languageCode != nil" object file lineNumber description];

  id v22 = v41;
  id v23 = v42;
  if (!v21) {
    goto LABEL_16;
  }
LABEL_6:
  if (v22) {
    goto LABEL_7;
  }
LABEL_17:
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1276, @"Invalid parameter not satisfying: %@", @"carrierBundleIdentifier != nil" object file lineNumber description];

  id v23 = v42;
LABEL_7:
  if (v44)
  {
    if (v23) {
      goto LABEL_9;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1277, @"Invalid parameter not satisfying: %@", @"carrierCountryIsoCode != nil" object file lineNumber description];

    if (v42) {
      goto LABEL_9;
    }
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1278, @"Invalid parameter not satisfying: %@", @"aneVersion != nil" object file lineNumber description];

LABEL_9:
  v45.receiver = self;
  v45.super_class = (Class)TRIActivationEventRecord;
  v24 = [(TRIActivationEventRecord *)&v45 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_parentId, a3);
    objc_storeStrong((id *)&v25->_factorPackSetId, v37);
    v25->_deploymentId = a5;
    objc_storeStrong((id *)&v25->_osBuild, v39);
    objc_storeStrong((id *)&v25->_languageCode, v40);
    objc_storeStrong((id *)&v25->_regionCode, a8);
    objc_storeStrong((id *)&v25->_carrierBundleIdentifier, a9);
    objc_storeStrong((id *)&v25->_carrierCountryIsoCode, a10);
    v25->_diagnosticsUsageEnabled = a11;
    v25->_hasAne = a12;
    objc_storeStrong((id *)&v25->_aneVersion, a13);
  }

  return v25;
}

+ (id)recordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleIdentifier:(id)a9 carrierCountryIsoCode:(id)a10 diagnosticsUsageEnabled:(int64_t)a11 hasAne:(int64_t)a12 aneVersion:(id)a13
{
  id v19 = a13;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a4;
  id v26 = a3;
  v27 = (void *)[objc_alloc((Class)a1) initWithParentId:v26 factorPackSetId:v25 deploymentId:a5 osBuild:v24 languageCode:v23 regionCode:v22 carrierBundleIdentifier:v21 carrierCountryIsoCode:v20 diagnosticsUsageEnabled:a11 hasAne:a12 aneVersion:v19];

  return v27;
}

- (id)copyWithReplacementParentId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:v4 factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:v4 deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:*(void *)&a3 osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];
}

- (id)copyWithReplacementOsBuild:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:v4 languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementLanguageCode:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:v4 regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementRegionCode:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:v4 carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementCarrierBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:v4 carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementCarrierCountryIsoCode:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:v4 diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:self->_aneVersion];

  return v5;
}

- (id)copyWithReplacementDiagnosticsUsageEnabled:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:a3 hasAne:self->_hasAne aneVersion:self->_aneVersion];
}

- (id)copyWithReplacementHasAne:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:a3 aneVersion:self->_aneVersion];
}

- (id)copyWithReplacementAneVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParentId:self->_parentId factorPackSetId:self->_factorPackSetId deploymentId:self->_deploymentId osBuild:self->_osBuild languageCode:self->_languageCode regionCode:self->_regionCode carrierBundleIdentifier:self->_carrierBundleIdentifier carrierCountryIsoCode:self->_carrierCountryIsoCode diagnosticsUsageEnabled:self->_diagnosticsUsageEnabled hasAne:self->_hasAne aneVersion:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_29;
  }
  int v6 = self->_parentId != 0;
  v7 = [v4 parentId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_29;
  }
  parentId = self->_parentId;
  if (parentId)
  {
    v10 = [v5 parentId];
    int v11 = [(NSString *)parentId isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  int v12 = self->_factorPackSetId != 0;
  v13 = [v5 factorPackSetId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_29;
  }
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    v16 = [v5 factorPackSetId];
    int v17 = [(NSString *)factorPackSetId isEqual:v16];

    if (!v17) {
      goto LABEL_29;
    }
  }
  int deploymentId = self->_deploymentId;
  if (deploymentId != [v5 deploymentId]) {
    goto LABEL_29;
  }
  int v19 = self->_osBuild != 0;
  id v20 = [v5 osBuild];
  int v21 = v20 == 0;

  if (v19 == v21) {
    goto LABEL_29;
  }
  osBuild = self->_osBuild;
  if (osBuild)
  {
    id v23 = [v5 osBuild];
    int v24 = [(NSString *)osBuild isEqual:v23];

    if (!v24) {
      goto LABEL_29;
    }
  }
  int v25 = self->_languageCode != 0;
  id v26 = [v5 languageCode];
  int v27 = v26 == 0;

  if (v25 == v27) {
    goto LABEL_29;
  }
  languageCode = self->_languageCode;
  if (languageCode)
  {
    v29 = [v5 languageCode];
    int v30 = [(NSString *)languageCode isEqual:v29];

    if (!v30) {
      goto LABEL_29;
    }
  }
  int v31 = self->_regionCode != 0;
  v32 = [v5 regionCode];
  int v33 = v32 == 0;

  if (v31 == v33) {
    goto LABEL_29;
  }
  regionCode = self->_regionCode;
  if (regionCode)
  {
    v35 = [v5 regionCode];
    int v36 = [(NSString *)regionCode isEqual:v35];

    if (!v36) {
      goto LABEL_29;
    }
  }
  int v37 = self->_carrierBundleIdentifier != 0;
  v38 = [v5 carrierBundleIdentifier];
  int v39 = v38 == 0;

  if (v37 == v39) {
    goto LABEL_29;
  }
  carrierBundleIdentifier = self->_carrierBundleIdentifier;
  if (carrierBundleIdentifier)
  {
    v41 = [v5 carrierBundleIdentifier];
    int v42 = [(NSString *)carrierBundleIdentifier isEqual:v41];

    if (!v42) {
      goto LABEL_29;
    }
  }
  int v43 = self->_carrierCountryIsoCode != 0;
  id v44 = [v5 carrierCountryIsoCode];
  int v45 = v44 == 0;

  if (v43 == v45) {
    goto LABEL_29;
  }
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  if (carrierCountryIsoCode)
  {
    v47 = [v5 carrierCountryIsoCode];
    int v48 = [(NSString *)carrierCountryIsoCode isEqual:v47];

    if (!v48) {
      goto LABEL_29;
    }
  }
  int64_t diagnosticsUsageEnabled = self->_diagnosticsUsageEnabled;
  if (diagnosticsUsageEnabled != [v5 diagnosticsUsageEnabled]
    || (int64_t hasAne = self->_hasAne, hasAne != [v5 hasAne])
    || (int v51 = self->_aneVersion != 0,
        [v5 aneVersion],
        v52 = objc_claimAutoreleasedReturnValue(),
        int v53 = v52 == 0,
        v52,
        v51 == v53))
  {
LABEL_29:
    char v56 = 0;
  }
  else
  {
    aneVersion = self->_aneVersion;
    if (aneVersion)
    {
      v55 = [v5 aneVersion];
      char v56 = [(NSString *)aneVersion isEqual:v55];
    }
    else
    {
      char v56 = 1;
    }
  }

  return v56;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIActivationEventRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIActivationEventRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_parentId hash];
  NSUInteger v4 = [(NSString *)self->_factorPackSetId hash];
  uint64_t v5 = self->_deploymentId - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  NSUInteger v6 = [(NSString *)self->_osBuild hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_languageCode hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_regionCode hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_carrierBundleIdentifier hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_carrierCountryIsoCode hash];
  int64_t v11 = self->_diagnosticsUsageEnabled - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  int64_t v12 = self->_hasAne - v11 + 32 * v11;
  return [(NSString *)self->_aneVersion hash] - v12 + 32 * v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  parentId = self->_parentId;
  factorPackSetId = self->_factorPackSetId;
  NSUInteger v6 = [NSNumber numberWithInt:self->_deploymentId];
  long long v13 = *(_OWORD *)&self->_osBuild;
  long long v12 = *(_OWORD *)&self->_regionCode;
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  NSUInteger v8 = [NSNumber numberWithInteger:self->_diagnosticsUsageEnabled];
  NSUInteger v9 = [NSNumber numberWithInteger:self->_hasAne];
  NSUInteger v10 = (void *)[v3 initWithFormat:@"<TRIActivationEventRecord | parentId:%@ factorPackSetId:%@ deploymentId:%@ osBuild:%@ languageCode:%@ regionCode:%@ carrierBundleIdentifier:%@ carrierCountryIsoCode:%@ diagnosticsUsageEnabled:%@ hasAne:%@ aneVersion:%@>", parentId, factorPackSetId, v6, v13, v12, carrierCountryIsoCode, v8, v9, self->_aneVersion];

  return v10;
}

- (NSString)parentId
{
  return self->_parentId;
}

- (NSString)factorPackSetId
{
  return self->_factorPackSetId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSString)carrierBundleIdentifier
{
  return self->_carrierBundleIdentifier;
}

- (NSString)carrierCountryIsoCode
{
  return self->_carrierCountryIsoCode;
}

- (int64_t)diagnosticsUsageEnabled
{
  return self->_diagnosticsUsageEnabled;
}

- (int64_t)hasAne
{
  return self->_hasAne;
}

- (NSString)aneVersion
{
  return self->_aneVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneVersion, 0);
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
}

@end