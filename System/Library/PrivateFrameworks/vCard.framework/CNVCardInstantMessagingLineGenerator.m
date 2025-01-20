@interface CNVCardInstantMessagingLineGenerator
+ (id)instantMessageUsernameWithSchemeForUsername:(id)a3 service:(id)a4;
+ (id)serviceTypeStringForInstantMessageService:(id)a3;
- (id)lineWithValue:(id)a3 label:(id)a4;
- (id)makeLineWithName:(id)a3 value:(id)a4;
- (id)standardLabelsForLabel:(id)a3;
@end

@implementation CNVCardInstantMessagingLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  v11 = [v10 valueForKey:@"username"];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v12 = 0;
  }
  else
  {
    v13 = [v8 valueForKey:@"service"];
    v14 = +[CNVCardValueEncoder encodeValue:v11];
    v15 = [(id)objc_opt_class() instantMessageUsernameWithSchemeForUsername:v14 service:v13];
    v17.receiver = self;
    v17.super_class = (Class)CNVCardInstantMessagingLineGenerator;
    v12 = [(CNVCardLineGenerator *)&v17 makeLineWithName:v6 value:v15];
  }
  return v12;
}

- (id)lineWithValue:(id)a3 label:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CNVCardInstantMessagingLineGenerator;
  id v5 = a3;
  id v6 = [(CNVCardLineGenerator *)&v14 lineWithValue:v5 label:a4];
  id v7 = objc_msgSend(v5, "valueForKey:", @"service", v14.receiver, v14.super_class);
  id v8 = [v5 valueForKey:@"userIdentifier"];
  v9 = [(id)objc_opt_class() serviceTypeStringForInstantMessageService:v7];
  id v10 = [v5 valueForKey:@"teamIdentifier"];
  v11 = [v5 valueForKey:@"bundleIdentifiers"];

  if ([v11 count])
  {
    v12 = [v11 componentsJoinedByString:@","];
  }
  else
  {
    v12 = 0;
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0) {
    [v6 insertParameterWithName:@"X-SERVICE-TYPE" value:v9 atIndex:0];
  }
  [v6 addParameterWithName:@"x-userid" value:v8];
  [v6 addParameterWithName:@"x-bundleidentifiers" value:v12];
  [v6 addParameterWithName:@"x-teamidentifier" value:v10];

  return v6;
}

+ (id)serviceTypeStringForInstantMessageService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AIMInstant"])
  {
    v4 = @"AIM";
  }
  else if ([v3 isEqualToString:@"FacebookInstant"])
  {
    v4 = @"Facebook";
  }
  else if ([v3 isEqualToString:@"GaduGaduInstant"])
  {
    v4 = @"GaduGadu";
  }
  else if ([v3 isEqualToString:@"GoogleTalkInstant"])
  {
    v4 = @"GoogleTalk";
  }
  else if ([v3 isEqualToString:@"ICQInstant"])
  {
    v4 = @"ICQ";
  }
  else if ([v3 isEqualToString:@"JabberInstant"])
  {
    v4 = @"Jabber";
  }
  else if ([v3 isEqualToString:@"MSNInstant"])
  {
    v4 = @"MSN";
  }
  else if ([v3 isEqualToString:@"QQInstant"])
  {
    v4 = @"QQ";
  }
  else if ([v3 isEqualToString:@"SkypeInstant"])
  {
    v4 = @"Skype";
  }
  else if ([v3 isEqualToString:@"YahooInstant"])
  {
    v4 = @"Yahoo";
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

+ (id)instantMessageUsernameWithSchemeForUsername:(id)a3 service:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28B88];
  id v7 = a3;
  id v8 = [v6 URLPathAllowedCharacterSet];
  v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  v21[0] = @"AIMInstant";
  v21[1] = @"ICQInstant";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  LODWORD(v7) = [v10 containsObject:v5];

  if (v7)
  {
    [NSString stringWithFormat:@"aim:%@", v9];
    goto LABEL_14;
  }
  v20[0] = @"FacebookInstant";
  v20[1] = @"GoogleTalkInstant";
  v20[2] = @"JabberInstant";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  int v12 = [v11 containsObject:v5];

  if (v12)
  {
    [NSString stringWithFormat:@"xmpp:%@", v9];
    goto LABEL_14;
  }
  if ([v5 isEqualToString:@"MSNInstant"])
  {
    [NSString stringWithFormat:@"msnim:%@", v9];
    goto LABEL_14;
  }
  v19[0] = @"GaduGaduInstant";
  v19[1] = @"QQInstant";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  int v14 = [v13 containsObject:v5];

  if (v14)
  {
    v15 = NSString;
  }
  else
  {
    if ([v5 isEqualToString:@"SkypeInstant"])
    {
      [NSString stringWithFormat:@"skype:%@", v9];
      goto LABEL_14;
    }
    int v16 = [v5 isEqualToString:@"YahooInstant"];
    v15 = NSString;
    if (v16)
    {
      [NSString stringWithFormat:@"ymsgr:%@", v9];
      goto LABEL_14;
    }
  }
  [v15 stringWithFormat:@"x-apple:%@", v9];
  objc_super v17 = LABEL_14:;

  return v17;
}

- (id)standardLabelsForLabel:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"MobileMe"])
  {
    v9[0] = @"MobileMe";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNVCardInstantMessagingLineGenerator;
    uint64_t v5 = [(CNVCardLineGenerator *)&v8 standardLabelsForLabel:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

@end