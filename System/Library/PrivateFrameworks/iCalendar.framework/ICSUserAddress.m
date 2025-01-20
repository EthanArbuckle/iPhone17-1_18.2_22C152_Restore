@interface ICSUserAddress
+ (id)ICSStringFromCalendarUser:(int)a3;
+ (id)ICSStringFromParticipationStatus:(int)a3;
+ (id)ICSStringFromRole:(int)a3;
+ (id)ICSStringFromScheduleAgent:(int)a3;
+ (id)ICSStringFromScheduleForceSend:(int)a3;
+ (id)ICSStringFromScheduleStatus:(int)a3;
+ (id)URLForNoMail;
+ (int)calendarUserFromICSString:(id)a3;
+ (int)participationStatusFromICSString:(id)a3;
+ (int)roleFromICSString:(id)a3;
+ (int)scheduleAgentFromICSString:(id)a3;
+ (int)scheduleForceSendFromICSString:(id)a3;
+ (int)scheduleStatusFromICSString:(id)a3;
- (BOOL)hasEmailAddress;
- (BOOL)hasPhoneNumber;
- (BOOL)isEmailAddress;
- (BOOL)isHTTPAddress;
- (BOOL)isHTTPSAddress;
- (BOOL)isPhoneNumber;
- (BOOL)rsvp;
- (BOOL)shouldObscureParameter:(id)a3;
- (BOOL)shouldObscureValue;
- (BOOL)x_apple_self_invited;
- (ICSAlternateTimeProposal)alternateTimeProposal;
- (ICSDateValue)partstatModified;
- (ICSUserAddress)initWithEmailAddress:(id)a3;
- (ICSUserAddress)initWithPhoneNumber:(id)a3;
- (ICSUserAddress)initWithURL:(id)a3;
- (NSString)cn;
- (NSString)dir;
- (NSString)email;
- (NSString)likenessDataString;
- (NSString)x_apple_inviterName;
- (NSString)x_apple_telephone;
- (id)displayName;
- (id)emailAddress;
- (id)phoneNumber;
- (id)propertiesToHide;
- (id)propertiesToObscure;
- (id)sanitizeAddressString:(id)a3;
- (int)cutype;
- (int)partstat;
- (int)role;
- (int)scheduleAgentWithDefaultValue:(int)a3;
- (int)scheduleagent;
- (int)scheduleforcesend;
- (int)schedulestatus;
- (void)fixAddress;
- (void)setAlternateTimeProposal:(id)a3;
- (void)setCn:(id)a3;
- (void)setCutype:(int)a3;
- (void)setDir:(id)a3;
- (void)setEmail:(id)a3;
- (void)setLikenessDataString:(id)a3;
- (void)setPartstat:(int)a3;
- (void)setPartstatModified:(id)a3;
- (void)setRole:(int)a3;
- (void)setRsvp:(BOOL)a3;
- (void)setScheduleagent:(int)a3;
- (void)setScheduleforcesend:(int)a3;
- (void)setSchedulestatus:(int)a3;
- (void)setURL:(id)a3;
- (void)setX_apple_inviterName:(id)a3;
- (void)setX_apple_self_invited:(BOOL)a3;
- (void)setX_apple_telephone:(id)a3;
@end

@implementation ICSUserAddress

- (void)fixAddress
{
  v3 = [(ICSProperty *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = +[ICSUserAddress URLForNoMail];
    [(ICSProperty *)self setValue:v5 type:5021];
  }
  v6 = [(ICSProperty *)self parameterValueForName:@"RSVP"];

  if (v6)
  {
    v7 = [(ICSProperty *)self parameterValueForName:@"RSVP"];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"RSVP"];
    }
  }
  v9 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-FORCE-SEND"];

  if (v9)
  {
    v10 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-FORCE-SEND"];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"SCHEDULE-FORCE-SEND"];
    }
  }
  v12 = [(ICSProperty *)self parameterValueForName:@"CN"];

  if (v12)
  {
    v13 = [(ICSUserAddress *)self cn];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"CN"];
    }
  }
  v15 = [(ICSProperty *)self parameterValueForName:@"CUTYPE"];

  if (v15)
  {
    v16 = [(ICSProperty *)self parameterValueForName:@"CUTYPE"];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"CUTYPE"];
    }
  }
  v18 = [(ICSProperty *)self parameterValueForName:@"PARTSTAT"];

  if (v18)
  {
    v19 = [(ICSProperty *)self parameterValueForName:@"PARTSTAT"];
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"PARTSTAT"];
    }
  }
  v21 = [(ICSProperty *)self parameterValueForName:@"X-CALENDARSERVER-DTSTAMP"];

  if (v21)
  {
    v22 = [(ICSProperty *)self parameterValueForName:@"X-CALENDARSERVER-DTSTAMP"];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"X-CALENDARSERVER-DTSTAMP"];
    }
  }
  v24 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-STATUS"];

  if (v24)
  {
    v25 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-STATUS"];
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();

    if ((v26 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"SCHEDULE-STATUS"];
    }
  }
  v27 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-AGENT"];

  if (v27)
  {
    v28 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-AGENT"];
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"SCHEDULE-AGENT"];
    }
  }
  v30 = [(ICSProperty *)self parameterValueForName:@"ROLE"];

  if (v30)
  {
    v31 = [(ICSProperty *)self parameterValueForName:@"ROLE"];
    objc_opt_class();
    char v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0) {
      [(ICSProperty *)self removeParameterValueForName:@"ROLE"];
    }
  }
  v33 = [(ICSProperty *)self parameterValueForName:@"RELTYPE"];

  if (v33)
  {
    v34 = [(ICSProperty *)self parameterValueForName:@"RELTYPE"];
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0)
    {
      [(ICSProperty *)self removeParameterValueForName:@"RELTYPE"];
    }
  }
}

+ (int)calendarUserFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INDIVIDUAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GROUP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ROOM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)participationStatusFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NEEDS-ACTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACCEPTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DECLINED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TENTATIVE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DELEGATED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IN-PROCESS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"X-UNINVITED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"X-UNDELIVERABLE"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)scheduleStatusFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"1.0"])
  {
    int v4 = 1;
  }
  else if ([v3 hasPrefix:@"1.1"])
  {
    int v4 = 2;
  }
  else if ([v3 hasPrefix:@"1.2"])
  {
    int v4 = 3;
  }
  else if ([v3 hasPrefix:@"2.0"])
  {
    int v4 = 4;
  }
  else if ([v3 hasPrefix:@"2.3"])
  {
    int v4 = 5;
  }
  else if ([v3 hasPrefix:@"3.7"])
  {
    int v4 = 6;
  }
  else if ([v3 hasPrefix:@"3.8"])
  {
    int v4 = 7;
  }
  else if ([v3 hasPrefix:@"5.1"])
  {
    int v4 = 8;
  }
  else if ([v3 hasPrefix:@"5.2"])
  {
    int v4 = 9;
  }
  else if ([v3 hasPrefix:@"5.3"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)scheduleAgentFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CLIENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)scheduleForceSendFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REQUEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REPLY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)roleFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHAIR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OPT-PARTICIPANT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NON-PARTICIPANT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REQ-PARTICIPANT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NON-PARTICIPANT-CHAIR"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)ICSStringFromCalendarUser:(int)a3
{
  if ((a3 - 1) > 4) {
    return 0;
  }
  else {
    return off_1E6C257B8[a3 - 1];
  }
}

+ (id)ICSStringFromParticipationStatus:(int)a3
{
  if ((a3 - 1) > 8) {
    return 0;
  }
  else {
    return off_1E6C257E0[a3 - 1];
  }
}

+ (id)ICSStringFromScheduleAgent:(int)a3
{
  id v3 = @"NONE";
  if (a3 != 2) {
    id v3 = 0;
  }
  if (a3 == 1) {
    return @"CLIENT";
  }
  else {
    return v3;
  }
}

+ (id)ICSStringFromScheduleStatus:(int)a3
{
  if ((a3 - 1) > 9) {
    return 0;
  }
  else {
    return off_1E6C25828[a3 - 1];
  }
}

+ (id)ICSStringFromScheduleForceSend:(int)a3
{
  id v3 = @"REPLY";
  if (a3 != 2) {
    id v3 = 0;
  }
  if (a3 == 1) {
    return @"REQUEST";
  }
  else {
    return v3;
  }
}

+ (id)ICSStringFromRole:(int)a3
{
  if ((a3 - 1) > 4) {
    return 0;
  }
  else {
    return off_1E6C25878[a3 - 1];
  }
}

- (ICSUserAddress)initWithURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[ICSUserAddress URLForNoMail];
  }
  v7.receiver = self;
  v7.super_class = (Class)ICSUserAddress;
  v5 = [(ICSProperty *)&v7 initWithValue:v4 type:5021];

  return v5;
}

- (id)sanitizeAddressString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (sanitizeAddressString__onceToken != -1) {
    dispatch_once(&sanitizeAddressString__onceToken, &__block_literal_global_2);
  }
  id v5 = v4;
  v6 = [v5 lowercaseString];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)sanitizeAddressString__invalidIndexPrefixes;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  v9 = v5;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "hasPrefix:", v13, (void)v16))
        {
          char v14 = objc_msgSend(v5, "substringFromIndex:", (unint64_t)objc_msgSend(v13, "length") >> 1);

          v9 = [(ICSUserAddress *)self sanitizeAddressString:v14];

          goto LABEL_13;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    v9 = v5;
  }
LABEL_13:

  return v9;
}

void __40__ICSUserAddress_sanitizeAddressString___block_invoke()
{
  v0 = (void *)sanitizeAddressString__invalidIndexPrefixes;
  sanitizeAddressString__invalidIndexPrefixes = (uint64_t)&unk_1F360C1E8;
}

- (ICSUserAddress)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if (([v4 hasPrefix:@"/"] & 1) != 0 || (objc_msgSend(v4, "rangeOfString:", @":"), v5))
    {
      v6 = [(ICSUserAddress *)self sanitizeAddressString:v4];
      id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6 encodingInvalidCharacters:0];
    }
    else
    {
      [v4 rangeOfString:@"@"];
      if (!v10)
      {
        id v7 = +[ICSUserAddress URLForNoMail];
        goto LABEL_7;
      }
      uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v6 = [v4 stringByTrimmingCharactersInSet:v11];

      v12 = (void *)MEMORY[0x1E4F28E58];
      v13 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      char v14 = [v13 bitmapRepresentation];
      v15 = [v12 characterSetWithBitmapRepresentation:v14];

      long long v16 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v15];
      long long v17 = (void *)MEMORY[0x1E4F1CB10];
      long long v18 = [NSString stringWithFormat:@"mailto:%@", v16];
      id v7 = [v17 URLWithString:v18 encodingInvalidCharacters:0];
    }
  }
  else
  {
    id v7 = 0;
  }
LABEL_7:
  uint64_t v8 = [(ICSUserAddress *)self initWithURL:v7];

  return v8;
}

- (ICSUserAddress)initWithPhoneNumber:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([v4 rangeOfString:@"tel:" options:9] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v6 = [v4 stringByTrimmingCharactersInSet:v5];

      if ([v6 hasPrefix:@"+"])
      {
        id v7 = (void *)MEMORY[0x1E4F28E58];
        uint64_t v8 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
        v9 = [v8 bitmapRepresentation];
        uint64_t v10 = [v7 characterSetWithBitmapRepresentation:v9];

        uint64_t v11 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v10];
        v12 = (void *)MEMORY[0x1E4F1CB10];
        v13 = [@"tel:" stringByAppendingString:v11];
        char v14 = [v12 URLWithString:v13 encodingInvalidCharacters:0];

LABEL_9:
        goto LABEL_10;
      }
      uint64_t v15 = +[ICSUserAddress URLForNoMail];
    }
    else
    {
      v6 = [(ICSUserAddress *)self sanitizeAddressString:v4];
      uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v6 encodingInvalidCharacters:0];
    }
    char v14 = (void *)v15;
    goto LABEL_9;
  }
  char v14 = 0;
LABEL_10:
  long long v16 = [(ICSUserAddress *)self initWithURL:v14];

  return v16;
}

- (BOOL)hasEmailAddress
{
  if ([(ICSUserAddress *)self isEmailAddress]) {
    return 1;
  }
  id v4 = [(ICSUserAddress *)self email];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)isEmailAddress
{
  BOOL v3 = [(ICSProperty *)self value];
  id v4 = [v3 scheme];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(ICSProperty *)self value];
  v6 = [v5 scheme];
  BOOL v7 = [v6 caseInsensitiveCompare:@"mailto"] == 0;

  return v7;
}

- (BOOL)isHTTPAddress
{
  BOOL v3 = [(ICSProperty *)self value];
  id v4 = [v3 scheme];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(ICSProperty *)self value];
  v6 = [v5 scheme];
  BOOL v7 = [v6 caseInsensitiveCompare:@"http"] == 0;

  return v7;
}

- (BOOL)isHTTPSAddress
{
  BOOL v3 = [(ICSProperty *)self value];
  id v4 = [v3 scheme];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(ICSProperty *)self value];
  v6 = [v5 scheme];
  BOOL v7 = [v6 caseInsensitiveCompare:@"https"] == 0;

  return v7;
}

- (BOOL)hasPhoneNumber
{
  if ([(ICSUserAddress *)self isPhoneNumber]) {
    return 1;
  }
  id v4 = [(ICSUserAddress *)self x_apple_telephone];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)isPhoneNumber
{
  v2 = [(ICSProperty *)self value];
  BOOL v3 = [v2 scheme];

  if (v3) {
    BOOL v4 = [v3 caseInsensitiveCompare:@"tel"] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)emailAddress
{
  if ([(ICSUserAddress *)self isEmailAddress])
  {
    BOOL v3 = [(ICSProperty *)self value];
    BOOL v4 = [v3 resourceSpecifier];
  }
  else
  {
    uint64_t v5 = [(ICSUserAddress *)self email];

    if (v5)
    {
      BOOL v4 = [(ICSUserAddress *)self email];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  v6 = [v4 stringByRemovingPercentEscapes];

  return v6;
}

- (id)phoneNumber
{
  if ([(ICSUserAddress *)self isPhoneNumber])
  {
    BOOL v3 = [(ICSProperty *)self value];
    BOOL v4 = [v3 resourceSpecifier];
  }
  else
  {
    uint64_t v5 = [(ICSUserAddress *)self x_apple_telephone];

    if (v5)
    {
      BOOL v4 = [(ICSUserAddress *)self x_apple_telephone];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (id)displayName
{
  BOOL v3 = [(ICSUserAddress *)self cn];
  if ([v3 length])
  {
    id v4 = v3;
LABEL_5:
    uint64_t v5 = v4;
    goto LABEL_6;
  }
  if ([(ICSUserAddress *)self isEmailAddress])
  {
    id v4 = [(ICSUserAddress *)self emailAddress];
    goto LABEL_5;
  }
  if ([(ICSUserAddress *)self isHTTPAddress]
    || [(ICSUserAddress *)self isHTTPSAddress])
  {
    BOOL v7 = [(ICSProperty *)self value];
    uint64_t v8 = [v7 resourceSpecifier];
    uint64_t v5 = [v8 lastPathComponent];
  }
  else
  {
    BOOL v7 = [(ICSProperty *)self value];
    uint64_t v5 = [v7 absoluteString];
  }

LABEL_6:
  return v5;
}

- (void)setCn:(id)a3
{
  id v6 = a3;
  if ([v6 rangeOfString:@"\""] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v6;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\", @"'", 2, 0, objc_msgSend(v6, "length""));

    id v4 = (id)v5;
  }
  id v7 = v4;
  [(ICSProperty *)self setParameterValue:v4 forName:@"CN"];
}

- (NSString)cn
{
  v2 = [(ICSProperty *)self parameterValueForName:@"CN"];
  if ([v2 rangeOfString:@"\\\""] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\\", @"\", 2, 0, objc_msgSend(v2, "length"));

    v2 = (void *)v3;
  }
  return (NSString *)v2;
}

- (void)setCutype:(int)a3
{
  if (a3)
  {
    +[ICSCalendarUserParameter calendarUserTypeParameterFromCode:](ICSCalendarUserParameter, "calendarUserTypeParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"CUTYPE"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"CUTYPE"];
  }
}

- (int)cutype
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"CUTYPE"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"CUTYPE"];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setDir:(id)a3
{
}

- (NSString)dir
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"DIR"];
}

- (void)setPartstat:(int)a3
{
  if (a3)
  {
    +[ICSParticipationStatusParameter participationStatusParameterFromCode:](ICSParticipationStatusParameter, "participationStatusParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"PARTSTAT"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"PARTSTAT"];
  }
}

- (int)partstat
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"PARTSTAT"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"PARTSTAT"];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setSchedulestatus:(int)a3
{
  if (a3)
  {
    +[ICSScheduleStatusParameter scheduleStatusParameterFromCode:](ICSScheduleStatusParameter, "scheduleStatusParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"SCHEDULE-STATUS"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"SCHEDULE-STATUS"];
  }
}

- (int)schedulestatus
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-STATUS"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-STATUS"];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setScheduleagent:(int)a3
{
  if (a3)
  {
    +[ICSScheduleAgentParameter scheduleAgentParameterFromCode:](ICSScheduleAgentParameter, "scheduleAgentParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"SCHEDULE-AGENT"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"SCHEDULE-AGENT"];
  }
}

- (int)scheduleagent
{
  return [(ICSUserAddress *)self scheduleAgentWithDefaultValue:0];
}

- (int)scheduleAgentWithDefaultValue:(int)a3
{
  int v5 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-AGENT"];

  if (v5)
  {
    id v6 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-AGENT"];
    a3 = [v6 longValue];
  }
  return a3;
}

- (void)setScheduleforcesend:(int)a3
{
  if (a3)
  {
    +[ICSScheduleForceSendParameter scheduleForceSendParameterFromCode:](ICSScheduleForceSendParameter, "scheduleForceSendParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"SCHEDULE-FORCE-SEND"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"SCHEDULE-FORCE-SEND"];
  }
}

- (int)scheduleforcesend
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-FORCE-SEND"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"SCHEDULE-FORCE-SEND"];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setRole:(int)a3
{
  if (a3)
  {
    +[ICSRoleParameter roleParameterFromCode:](ICSRoleParameter, "roleParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"ROLE"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"ROLE"];
  }
}

- (int)role
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"ROLE"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"ROLE"];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setRsvp:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSProperty *)self setParameterValue:v4 forName:@"RSVP"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"RSVP"];
  }
}

- (BOOL)rsvp
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"RSVP"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"RSVP"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPartstatModified:(id)a3
{
}

- (ICSDateValue)partstatModified
{
  return (ICSDateValue *)[(ICSProperty *)self parameterValueForName:@"X-CALENDARSERVER-DTSTAMP"];
}

- (void)setX_apple_self_invited:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSProperty *)self setParameterValue:v4 forName:@"X-APPLE-SELF-INVITED"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"X-APPLE-SELF-INVITED"];
  }
}

- (BOOL)x_apple_self_invited
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"X-APPLE-SELF-INVITED"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"X-APPLE-SELF-INVITED"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setEmail:(id)a3
{
  if (a3) {
    [(ICSProperty *)self setParameterValue:a3 forName:@"EMAIL"];
  }
  else {
    [(ICSProperty *)self removeParameterValueForName:@"EMAIL"];
  }
}

- (NSString)email
{
  uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"EMAIL"];
  if (!v3)
  {
    uint64_t v3 = [(ICSProperty *)self parameterValueForName:@"X-CALENDARSERVER-EMAIL"];
  }
  return (NSString *)v3;
}

- (void)setX_apple_telephone:(id)a3
{
  if (a3) {
    [(ICSProperty *)self setParameterValue:a3 forName:@"X-APPLE-TELEPHONE"];
  }
  else {
    [(ICSProperty *)self removeParameterValueForName:@"X-APPLE-TELEPHONE"];
  }
}

- (NSString)x_apple_telephone
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-APPLE-TELEPHONE"];
}

- (void)setLikenessDataString:(id)a3
{
  if (a3) {
    [(ICSProperty *)self setParameterValue:a3 forName:@"TO-ALL-LIKENESS-DATA"];
  }
  else {
    [(ICSProperty *)self removeParameterValueForName:@"TO-ALL-LIKENESS-DATA"];
  }
}

- (NSString)likenessDataString
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"TO-ALL-LIKENESS-DATA"];
}

- (void)setX_apple_inviterName:(id)a3
{
  if (a3) {
    [(ICSProperty *)self setParameterValue:a3 forName:@"X-APPLE-INVITER-NAME"];
  }
  else {
    [(ICSProperty *)self removeParameterValueForName:@"X-APPLE-INVITER-NAME"];
  }
}

- (NSString)x_apple_inviterName
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-APPLE-INVITER-NAME"];
}

- (void)setAlternateTimeProposal:(id)a3
{
  if (a3) {
    [(ICSProperty *)self setParameterValue:a3 forName:@"TO-ALL-PROPOSED-NEW-TIME"];
  }
  else {
    [(ICSProperty *)self removeParameterValueForName:@"TO-ALL-PROPOSED-NEW-TIME"];
  }
}

- (ICSAlternateTimeProposal)alternateTimeProposal
{
  return (ICSAlternateTimeProposal *)[(ICSProperty *)self parameterValueForName:@"TO-ALL-PROPOSED-NEW-TIME"];
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a3;
  id v4 = objc_msgSend(v7, "setWithObjects:", @"CUTYPE", @"PARTSTAT", @"ROLE", @"RSVP", @"SCHEDULE-FORCE-SEND", @"SCHEDULE-STATUS", @"SCHEDULE-AGENT", @"X-CALENDARSERVER-DTSTAMP", @"TO-ALL-PROPOSED-NEW-TIME", 0);
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

- (BOOL)shouldObscureValue
{
  return 1;
}

- (void)setURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[ICSUserAddress URLForNoMail];
  }
  id v5 = v4;
  [(ICSProperty *)self setValue:v4 type:5021];
}

+ (id)URLForNoMail
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"invalid:nomail"];
}

@end