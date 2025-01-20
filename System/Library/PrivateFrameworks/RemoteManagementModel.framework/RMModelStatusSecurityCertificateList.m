@interface RMModelStatusSecurityCertificateList
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 subjectSummary:(id)a4 isIdentity:(id)a5 data:(id)a6;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 subjectSummary:(id)a6 isIdentity:(id)a7 data:(id)a8;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSData)statusData;
- (NSNumber)statusIsIdentity;
- (NSNumber)statusRemoved;
- (NSString)statusDeclarationIdentifier;
- (NSString)statusIdentifier;
- (NSString)statusSubjectSummary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusData:(id)a3;
- (void)setStatusDeclarationIdentifier:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusIsIdentity:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusSubjectSummary:(id)a3;
@end

@implementation RMModelStatusSecurityCertificateList

+ (NSSet)allowedStatusKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"declaration-identifier";
  v6[3] = @"subject-summary";
  v6[4] = @"is-identity";
  v6[5] = @"data";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"security.certificate.list";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 subjectSummary:(id)a6 isIdentity:(id)a7 data:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_opt_new();
  [v19 setStatusIdentifier:v18];

  if (v17) {
    id v20 = v17;
  }
  else {
    id v20 = (id)MEMORY[0x263EFFA80];
  }
  [v19 setStatusRemoved:v20];

  [v19 setStatusDeclarationIdentifier:v16];
  [v19 setStatusSubjectSummary:v15];

  [v19 setStatusIsIdentity:v14];
  [v19 setStatusData:v13];

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 subjectSummary:(id)a4 isIdentity:(id)a5 data:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setStatusIdentifier:v12];

  [v13 setStatusSubjectSummary:v11];
  [v13 setStatusIsIdentity:v10];

  [v13 setStatusData:v9];
  return v13;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C37B0;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0918];
  v27[0] = v21;
  id v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0930];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C37C8;
  id v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0948];
  v26[0] = v18;
  id v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0960];
  v26[1] = v17;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C37E0;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0978];
  v25[0] = v15;
  id v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0990];
  v25[1] = v14;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C37F8;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C09A8];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C09C0];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C3810;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C09D8];
  v23[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C09F0];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C3828;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A08];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A20];
  v22[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  id v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelStatusSecurityCertificateList allowedStatusKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"identifier" forKeyPath:@"statusIdentifier" isRequired:1 defaultValue:0 error:a5])goto LABEL_7; {
  BOOL v14 = 0;
  }
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"_removed" forKeyPath:@"statusRemoved" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"declaration-identifier" forKeyPath:@"statusDeclarationIdentifier" isRequired:0 defaultValue:0 error:a5])
    {
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"subject-summary" forKeyPath:@"statusSubjectSummary" isRequired:1 defaultValue:0 error:a5]&& [(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"is-identity" forKeyPath:@"statusIsIdentity" isRequired:1 defaultValue:0 error:a5])
      {
        BOOL v14 = [(RMModelPayloadBase *)self loadDataFromDictionary:v8 usingKey:@"data" forKeyPath:@"statusData" isRequired:1 defaultValue:0 serializationType:v6 error:a5];
        goto LABEL_8;
      }
LABEL_7:
      BOOL v14 = 0;
    }
  }
LABEL_8:

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(RMModelStatusSecurityCertificateList *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"identifier" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelStatusSecurityCertificateList *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"_removed" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v8 = [(RMModelStatusSecurityCertificateList *)self statusDeclarationIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"declaration-identifier" value:v8 isRequired:0 defaultValue:0];

  id v9 = [(RMModelStatusSecurityCertificateList *)self statusSubjectSummary];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"subject-summary" value:v9 isRequired:1 defaultValue:0];

  id v10 = [(RMModelStatusSecurityCertificateList *)self statusIsIdentity];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"is-identity" value:v10 isRequired:1 defaultValue:0];

  id v11 = [(RMModelStatusSecurityCertificateList *)self statusData];
  [(RMModelPayloadBase *)self serializeDataIntoDictionary:v5 usingKey:@"data" value:v11 isRequired:1 defaultValue:0 serializationType:v3];

  id v12 = (void *)[v5 copy];
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RMModelStatusSecurityCertificateList;
  v4 = [(RMModelPayloadBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusRemoved copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusDeclarationIdentifier copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusSubjectSummary copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_statusIsIdentity copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSData *)self->_statusData copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
}

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
}

- (NSString)statusDeclarationIdentifier
{
  return self->_statusDeclarationIdentifier;
}

- (void)setStatusDeclarationIdentifier:(id)a3
{
}

- (NSString)statusSubjectSummary
{
  return self->_statusSubjectSummary;
}

- (void)setStatusSubjectSummary:(id)a3
{
}

- (NSNumber)statusIsIdentity
{
  return self->_statusIsIdentity;
}

- (void)setStatusIsIdentity:(id)a3
{
}

- (NSData)statusData
{
  return self->_statusData;
}

- (void)setStatusData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusData, 0);
  objc_storeStrong((id *)&self->_statusIsIdentity, 0);
  objc_storeStrong((id *)&self->_statusSubjectSummary, 0);
  objc_storeStrong((id *)&self->_statusDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end