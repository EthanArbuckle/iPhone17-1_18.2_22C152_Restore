@interface CNVCardInstantMessageParser
+ (id)handleWithUsername:(id)a3 userIdentifier:(id)a4 service:(id)a5 bundleIdentifiers:(id)a6 teamIdentifier:(id)a7;
+ (id)serviceForString:(id)a3;
+ (id)valueWithService:(id)a3 existingHandles:(id)a4 parser:(id)a5;
@end

@implementation CNVCardInstantMessageParser

+ (id)valueWithService:(id)a3 existingHandles:(id)a4 parser:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v9 firstValueForParameterWithName:@"X-TEAMIDENTIFIER"];
  v12 = [v9 firstParameterWithName:@"X-BUNDLEIDENTIFIERS"];
  v13 = [v12 values];

  v14 = [v9 firstValueForParameterWithName:@"X-USERID"];
  v15 = [v9 parseStringValue];
  [v9 advancePastSemicolon];

  v16 = [v15 componentsSeparatedByString:@":"];
  if ((unint64_t)[v16 count] >= 2)
  {
    v17 = (void *)[v16 mutableCopy];
    id v30 = a1;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      v18 = [v17 firstObject];
      uint64_t v19 = +[CNVCardInstantMessageParser serviceForString:v18];

      id v8 = (id)v19;
    }
    objc_msgSend(v17, "removeObjectAtIndex:", 0, v30);
    v20 = [v17 componentsJoinedByString:@":"];

    v21 = [v20 stringByRemovingPercentEncoding];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;

      v20 = v23;
    }
    a1 = v31;

    v15 = v20;
  }
  v24 = [a1 handleWithUsername:v15 userIdentifier:v14 service:v8 bundleIdentifiers:v13 teamIdentifier:v11];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __71__CNVCardInstantMessageParser_valueWithService_existingHandles_parser___block_invoke;
  v32[3] = &unk_1E6C2CF78;
  id v33 = v24;
  id v25 = v24;
  int v26 = objc_msgSend(v10, "_cn_any:", v32);

  if (v26) {
    v27 = 0;
  }
  else {
    v27 = v25;
  }
  id v28 = v27;

  return v28;
}

uint64_t __71__CNVCardInstantMessageParser_valueWithService_existingHandles_parser___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 value];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

+ (id)handleWithUsername:(id)a3 userIdentifier:(id)a4 service:(id)a5 bundleIdentifiers:(id)a6 teamIdentifier:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  v13 = (void *)MEMORY[0x1E4F1CA60];
  id v14 = a7;
  v15 = (__CFString *)a5;
  id v16 = a4;
  v17 = [v13 dictionary];
  if ([v12 count] == 1)
  {
    v18 = [v12 firstObject];
    uint64_t v19 = [v18 componentsSeparatedByString:@","];

    id v12 = (id)v19;
  }
  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v11, @"username");
  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v16, @"userIdentifier");

  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v14, @"teamIdentifier");
  objc_msgSend(v17, "_cn_setNonNilObject:forKey:", v12, @"bundleIdentifiers");
  if (v15) {
    v20 = v15;
  }
  else {
    v20 = &stru_1F362EAE0;
  }
  [v17 setObject:v20 forKey:@"service"];

  return v17;
}

+ (id)serviceForString:(id)a3
{
  v3 = (__CFString *)a3;
  uint64_t v4 = [(__CFString *)v3 lowercaseString];
  uint64_t v5 = [(__CFString *)v3 length];
  v6 = v3;
  switch(v5)
  {
    case 2:
      int v7 = [v4 isEqualToString:@"qq"];
      id v8 = CNVCardInstantMessageServiceQQ;
      goto LABEL_27;
    case 3:
      if ([v4 isEqualToString:@"aim"])
      {
        id v9 = CNVCardInstantMessageServiceAIM;
        goto LABEL_24;
      }
      if ([v4 isEqualToString:@"icq"])
      {
        id v9 = CNVCardInstantMessageServiceICQ;
        goto LABEL_24;
      }
      v13 = @"msn";
      goto LABEL_26;
    case 4:
      id v10 = @"xmpp";
      goto LABEL_14;
    case 5:
      if ([v4 isEqualToString:@"gtalk"])
      {
        id v9 = CNVCardInstantMessageServiceGoogleTalk;
        goto LABEL_24;
      }
      if ([v4 isEqualToString:@"skype"])
      {
        id v9 = CNVCardInstantMessageServiceSkype;
        goto LABEL_24;
      }
      if ([v4 isEqualToString:@"yahoo"]
        || [v4 isEqualToString:@"ymsgr"])
      {
        id v9 = CNVCardInstantMessageServiceYahoo;
        goto LABEL_24;
      }
      v13 = @"msnim";
LABEL_26:
      int v7 = [v4 isEqualToString:v13];
      id v8 = CNVCardInstantMessageServiceMSN;
      goto LABEL_27;
    case 6:
      id v10 = @"jabber";
LABEL_14:
      int v7 = [v4 isEqualToString:v10];
      id v8 = CNVCardInstantMessageServiceJabber;
      goto LABEL_27;
    case 7:
      char v11 = [v4 isEqualToString:@"x-apple"];
      v6 = v3;
      if ((v11 & 1) == 0) {
        goto LABEL_29;
      }
      id v12 = 0;
      goto LABEL_30;
    case 8:
      if ([v4 isEqualToString:@"facebook"])
      {
        id v9 = CNVCardInstantMessageServiceFacebook;
LABEL_24:
        v6 = *v9;
      }
      else
      {
        int v7 = [v4 isEqualToString:@"gadugadu"];
        id v8 = CNVCardInstantMessageServiceGaduGadu;
LABEL_27:
        v6 = *v8;
        if (!v7) {
          v6 = v3;
        }
      }
LABEL_29:
      id v12 = v6;
LABEL_30:

      return v12;
    case 10:
      int v7 = [v4 isEqualToString:@"googletalk"];
      id v8 = CNVCardInstantMessageServiceGoogleTalk;
      goto LABEL_27;
    default:
      goto LABEL_29;
  }
}

@end