@interface NSURL(Telephony)
+ (id)phoneAppVoicemailURLForMessageUUID:()Telephony;
+ (id)phoneAppVoicemailURLForRecordID:()Telephony;
+ (id)telephonyURLForTelEmergencyCall;
+ (id)telephonyURLForVoicemail;
+ (id)telephonyURLWithDestinationID:()Telephony addressBookUID:;
+ (id)telephonyURLWithDestinationID:()Telephony addressBookUID:forceAssist:suppressAssist:wasAssisted:;
+ (id)telephonyURLWithDestinationID:()Telephony promptUser:;
+ (uint64_t)telephonyURLWithDestinationID:()Telephony;
- (BOOL)_hasScheme:()Telephony;
- (id)_destinationIDConvertingNumbersToLatin:()Telephony;
- (id)_mobilePhonePathParameters;
- (id)_mobilePhoneQueryParameters;
- (id)formattedPhoneNumber;
- (id)originatingUIIdentifier;
- (id)recentsUniqueID;
- (id)telephonyParameterDictionary;
- (id)voicemailMessageUUID;
- (id)webSafeTelephoneURL;
- (uint64_t)_dialAssistBooleanQueryParameterValueForKey:()Telephony;
- (uint64_t)addressBookUID;
- (uint64_t)callService;
- (uint64_t)forceAssist;
- (uint64_t)hasTelephonyScheme;
- (uint64_t)isBasebandLogURL;
- (uint64_t)isEmergencyCallURL;
- (uint64_t)isEmergencyURL;
- (uint64_t)isPhoneAppVoicemailURL;
- (uint64_t)isTelephonyPromptURL;
- (uint64_t)isTelephonyURL;
- (uint64_t)isVoicemailURL;
- (uint64_t)isWebSafeTelephoneURL;
- (uint64_t)phoneNumber;
- (uint64_t)suppressAssist;
- (uint64_t)wasAlreadyAssisted;
- (void)voicemailRecordID;
@end

@implementation NSURL(Telephony)

+ (uint64_t)telephonyURLWithDestinationID:()Telephony
{
  return [a1 telephonyURLWithDestinationID:a3 promptUser:0];
}

+ (id)telephonyURLWithDestinationID:()Telephony promptUser:
{
  v5 = TUURLHostForTelephoneNumber(a3);
  if ([v5 length])
  {
    v6 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
    uint64_t v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

    v5 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x1E4F1CB10];
  v9 = @"tel";
  if (a4) {
    v9 = @"telprompt";
  }
  v10 = [NSString stringWithFormat:@"%@://%@?%@=%@", v9, v5, @"handleType", @"phoneNumber"];
  v11 = [v8 URLWithString:v10];

  return v11;
}

+ (id)telephonyURLWithDestinationID:()Telephony addressBookUID:
{
  v5 = (void *)MEMORY[0x1E4F28E78];
  v6 = objc_msgSend(a1, "telephonyURLWithDestinationID:");
  uint64_t v7 = [v5 stringWithFormat:@"%@", v6];

  if (a4 != -1) {
    [v7 appendFormat:@"&%@=%d", @"abuid", a4];
  }
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

+ (id)telephonyURLWithDestinationID:()Telephony addressBookUID:forceAssist:suppressAssist:wasAssisted:
{
  id v12 = a3;
  v13 = [MEMORY[0x1E4F28E78] string];
  v14 = v13;
  if (a4 != -1) {
    [v13 appendFormat:@"&%@=%d", @"abuid", a4];
  }
  if ((a5 & 1) != 0 || a6)
  {
    v15 = @"suppressAssist";
    if (a5) {
      v15 = @"forceAssist";
    }
    [v14 appendFormat:@"&%@=1", v15];
  }
  if (a7) {
    [v14 appendFormat:@"&%@=1", @"wasAssisted"];
  }
  v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = NSString;
  v18 = [a1 telephonyURLWithDestinationID:v12];
  v19 = [v17 stringWithFormat:@"%@%@", v18, v14];
  v20 = [v16 URLWithString:v19];

  return v20;
}

+ (id)telephonyURLForVoicemail
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [NSString stringWithFormat:@"%@://?%@=1", @"tel", @"isVoicemail"];
  v2 = [v0 URLWithString:v1];

  return v2;
}

+ (id)telephonyURLForTelEmergencyCall
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [NSString stringWithFormat:@"%@://", @"telemergencycall"];
  v2 = [v0 URLWithString:v1];

  return v2;
}

- (id)_destinationIDConvertingNumbersToLatin:()Telephony
{
  v4 = [a1 resourceSpecifier];
  v5 = [v4 stringByRemovingPercentEncoding];

  uint64_t v6 = [v5 rangeOfString:@"//" options:8];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v5 substringFromIndex:v6 + v7];

    v5 = (void *)v8;
  }
  uint64_t v9 = [v5 rangeOfString:@"?"];
  if (v10)
  {
    uint64_t v11 = [v5 substringToIndex:v9];

    v5 = (void *)v11;
  }
  if ((unint64_t)[v5 length] >= 2
    && objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1) == 47)
  {
    uint64_t v12 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

    v5 = (void *)v12;
  }
  if (a3 && [v5 length])
  {
    v13 = (void *)IMCopyStringWithLatinNumbers();
    v14 = v13;
    if (v13)
    {
      id v15 = v13;

      v5 = v15;
    }
  }

  return v5;
}

- (uint64_t)phoneNumber
{
  return [a1 _destinationIDConvertingNumbersToLatin:1];
}

- (uint64_t)addressBookUID
{
  if ([a1 hasTelephonyScheme])
  {
    v2 = [a1 _mobilePhoneQueryParameters];
    v3 = v2;
    v4 = @"abuid";
  }
  else
  {
    if (([a1 isFaceTimeURL] & 1) == 0 && !objc_msgSend(a1, "isFaceTimeAudioURL")) {
      return 0xFFFFFFFFLL;
    }
    v2 = [a1 queryParameters];
    v3 = v2;
    v4 = @"uid";
  }
  v5 = [v2 objectForKey:v4];

  if (v5)
  {
    uint64_t v6 = [v5 intValue];

    return v6;
  }
  return 0xFFFFFFFFLL;
}

- (uint64_t)callService
{
  if ([a1 hasTelephonyScheme] & 1) != 0 || (objc_msgSend(a1, "isEmergencyCallURL")) {
    return 1;
  }
  if ([a1 isFaceTimeAudioURL]) {
    return 2;
  }
  if ([a1 isFaceTimeURL]) {
    return 3;
  }
  return 0;
}

- (id)originatingUIIdentifier
{
  v1 = [a1 _mobilePhoneQueryParameters];
  v2 = [v1 objectForKey:@"originatingUI"];

  return v2;
}

- (uint64_t)forceAssist
{
  return [a1 _dialAssistBooleanQueryParameterValueForKey:@"forceAssist"];
}

- (uint64_t)suppressAssist
{
  return [a1 _dialAssistBooleanQueryParameterValueForKey:@"suppressAssist"];
}

- (uint64_t)wasAlreadyAssisted
{
  return [a1 _dialAssistBooleanQueryParameterValueForKey:@"wasAssisted"];
}

- (uint64_t)_dialAssistBooleanQueryParameterValueForKey:()Telephony
{
  id v4 = a3;
  if ([a1 hasTelephonyScheme])
  {
    v5 = [a1 _mobilePhoneQueryParameters];
  }
  else
  {
    if (([a1 isFaceTimeURL] & 1) == 0 && !objc_msgSend(a1, "isFaceTimeAudioURL")) {
      goto LABEL_8;
    }
    v5 = [a1 queryParameters];
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 objectForKey:v4];

  if (!v7)
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [v7 BOOLValue];

LABEL_9:
  return v8;
}

- (uint64_t)isTelephonyURL
{
  if ([a1 _hasScheme:@"tel"] & 1) != 0 || (objc_msgSend(a1, "isTelephonyPromptURL")) {
    return 1;
  }

  return [a1 _hasScheme:@"telSOS"];
}

- (uint64_t)isTelephonyPromptURL
{
  return [a1 _hasScheme:@"telprompt"];
}

- (uint64_t)hasTelephonyScheme
{
  if ([a1 isTelephonyURL]) {
    return 1;
  }

  return [a1 _hasScheme:@"callto"];
}

- (BOOL)_hasScheme:()Telephony
{
  id v4 = a3;
  v5 = [a1 scheme];
  if ([v5 length])
  {
    uint64_t v6 = [a1 scheme];
    BOOL v7 = [v6 caseInsensitiveCompare:v4] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)formattedPhoneNumber
{
  if (([a1 hasTelephonyScheme] & 1) != 0 || objc_msgSend(a1, "isFaceTimeAudioURL"))
  {
    v2 = [a1 _destinationIDConvertingNumbersToLatin:0];
    if (MGGetBoolAnswer())
    {
      v3 = TUNetworkCountryCode();
      if ([v3 length])
      {
        if (PNIsValidPhoneNumberForCountry())
        {
          id v4 = (void *)PNCreateFormattedStringWithCountry();
          if (v4)
          {
LABEL_14:

            goto LABEL_16;
          }
        }
      }
    }
    else
    {
      v3 = 0;
    }
    v5 = v3;
    v3 = TUHomeCountryCode();

    if (![v3 length]
      || !PNIsValidPhoneNumberForCountry()
      || (id v6 = (id)PNCreateFormattedStringWithCountry()) == 0)
    {
      id v6 = v2;
    }
    id v4 = v6;
    goto LABEL_14;
  }
  id v4 = 0;
LABEL_16:

  return v4;
}

- (uint64_t)isWebSafeTelephoneURL
{
  if (![a1 hasTelephonyScheme]) {
    return 0;
  }
  if ([a1 isVoicemailURL]) {
    return 1;
  }
  v3 = [a1 phoneNumber];
  uint64_t v4 = [v3 length];
  if (!v4)
  {
LABEL_23:
    uint64_t v2 = [v3 destinationIdIsCallControlCode];
    goto LABEL_25;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  char v8 = 0;
  do
  {
    int v9 = [v3 characterAtIndex:v7];
    char v10 = v9 - 38;
    if ((v9 - 38) > 0x31) {
      goto LABEL_12;
    }
    if (((1 << v10) & 0x2040000200040) != 0) {
      goto LABEL_9;
    }
    if (((1 << v10) & 0x81) == 0)
    {
LABEL_12:
      if (v9 == 112 || v9 == 119)
      {
LABEL_9:
        char v8 = 1;
        goto LABEL_21;
      }
      if ((v8 & 1) == 0 && (v9 == 35 || v9 == 42))
      {
        uint64_t v2 = 0;
        goto LABEL_25;
      }
      if ((v9 - 48) < 0xA || (v9 & 0xFFFFFFDF) - 65 < 0x1A) {
        ++v6;
      }
    }
LABEL_21:
    ++v7;
  }
  while (v5 != v7);
  if (v6 <= 2) {
    goto LABEL_23;
  }
  uint64_t v2 = 1;
LABEL_25:

  return v2;
}

- (id)webSafeTelephoneURL
{
  if ([a1 hasTelephonyScheme])
  {
    uint64_t v2 = [a1 phoneNumber];
    uint64_t v3 = [v2 length];
    uint64_t v4 = (unsigned __int16 *)malloc_type_malloc((2 * v3) | 1, 0x3F951BC9uLL);
    uint64_t v5 = malloc_type_malloc((2 * v3) | 1, 0x58A7AA4EuLL);
    v19 = v2;
    [v2 getCharacters:v4];
    uint64_t v6 = 0;
    if (v3)
    {
      uint64_t v7 = MEMORY[0x1E4F14390];
      char v8 = v4;
      do
      {
        unsigned int v10 = *v8++;
        uint64_t v9 = v10;
        if (v10 > 0x7F)
        {
          if (__maskrune(v9, 0x100uLL))
          {
LABEL_6:
            unsigned __int16 v11 = __toupper(v9);
            if (v11 < 0x57u) {
              __int16 v12 = 56;
            }
            else {
              __int16 v12 = 57;
            }
            if (v11 < 0x54u) {
              __int16 v12 = 55;
            }
            if (v11 <= 0x4Fu) {
              __int16 v13 = ((((86 * (char)(v11 - 65)) & 0x8000) != 0)
            }
                                    + ((unsigned __int16)(86 * (char)(v11 - 65)) >> 8)
                                    + 50);
            else {
              __int16 v13 = v12;
            }
            v5[v6] = v13;
            goto LABEL_18;
          }
        }
        else if ((*(_DWORD *)(v7 + 4 * v9 + 60) & 0x100) != 0)
        {
          goto LABEL_6;
        }
        if ((v9 - 48) > 9)
        {
          if (v9 == 43 && !v6)
          {
            _WORD *v5 = 43;
            uint64_t v6 = 1;
          }
          goto LABEL_19;
        }
        v5[v6] = v9;
LABEL_18:
        ++v6;
LABEL_19:
        --v3;
      }
      while (v3);
    }
    id v15 = NSString;
    v16 = [NSString stringWithCharacters:v5 length:v6];
    v17 = [v15 stringWithFormat:@"%@:%@", @"tel", v16];

    v14 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    free(v4);
    free(v5);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)isBasebandLogURL
{
  v1 = [a1 phoneNumber];
  uint64_t v2 = [v1 rangeOfString:@"?"];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [v1 substringToIndex:v2];

    v1 = (void *)v3;
  }
  if (v1)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"*5005*78283#"];
    uint64_t v5 = [v1 isEqual:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)isEmergencyURL
{
  return 0;
}

- (uint64_t)isEmergencyCallURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToString:@"telemergencycall"];

  return v2;
}

- (uint64_t)isVoicemailURL
{
  uint64_t v2 = [MEMORY[0x1E4F1CB10] telephonyURLForVoicemail];
  uint64_t v3 = [v2 isEqual:a1];

  return v3;
}

- (id)telephonyParameterDictionary
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [a1 _mobilePhoneQueryParameters];
  if ([v3 count])
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = [a1 _mobilePhonePathParameters];

    uint64_t v3 = v4;
    if (![v4 count]) {
      goto LABEL_5;
    }
  }
  [v2 addEntriesFromDictionary:v3];
LABEL_5:

  return v2;
}

- (id)_mobilePhonePathParameters
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v1 = [a1 absoluteString];
  uint64_t v2 = [v1 componentsSeparatedByString:@"/"];
  uint64_t v3 = v2;
  if (v2 && (unint64_t)[v2 count] >= 2)
  {
    uint64_t v4 = [v3 objectAtIndex:1];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v4 length])
    {
      id v15 = v4;
      v16 = v1;
      uint64_t v6 = [v4 componentsSeparatedByString:@"&"];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            unsigned __int16 v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
            if ([v11 count] == 2)
            {
              __int16 v12 = [v11 objectAtIndex:1];
              __int16 v13 = [v11 objectAtIndex:0];
              [v5 setObject:v12 forKey:v13];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      uint64_t v4 = v15;
      v1 = v16;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_mobilePhoneQueryParameters
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_getAssociatedObject(a1, "_TelephonyUtilities_telURLQueryParameters");
  if (v2) {
    goto LABEL_20;
  }
  uint64_t v3 = [a1 query];
  uint64_t v4 = v3;
  if (v3 && ![v3 isEqual:&stru_1EECEA668])
  {
    id object = a1;
    goto LABEL_8;
  }
  uint64_t v5 = [a1 resourceSpecifier];
  char v6 = [v5 hasPrefix:@"//"];

  if (v6)
  {
LABEL_19:

    uint64_t v2 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = [a1 resourceSpecifier];
  uint64_t v8 = [v7 componentsSeparatedByString:@"?"];

  if ([v8 count] != 2)
  {

    goto LABEL_19;
  }
  id object = a1;
  uint64_t v9 = [v8 objectAtIndex:1];

  uint64_t v4 = (void *)v9;
LABEL_8:
  [MEMORY[0x1E4F1CA60] dictionary];
  v23 = uint64_t v22 = v4;
  unsigned int v10 = [v4 componentsSeparatedByString:@"&"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v15 count] == 2)
        {
          v16 = [v15 objectAtIndex:1];
          long long v17 = [v16 stringByRemovingPercentEncoding];
          long long v18 = [v15 objectAtIndex:0];
          long long v19 = [v18 stringByRemovingPercentEncoding];
          [v23 setObject:v17 forKey:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v23];
  objc_setAssociatedObject(object, "_TelephonyUtilities_telURLQueryParameters", v2, (void *)0x301);

LABEL_20:

  return v2;
}

- (uint64_t)isPhoneAppVoicemailURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToString:@"vmshow"];

  return v2;
}

- (void)voicemailRecordID
{
  if ([a1 isPhoneAppVoicemailURL])
  {
    id v2 = objc_alloc(MEMORY[0x1E4F29088]);
    uint64_t v3 = [a1 absoluteString];
    uint64_t v4 = (void *)[v2 initWithString:v3];

    uint64_t v5 = [v4 queryItems];
    char v6 = [v5 firstObject];

    uint64_t v7 = [v6 name];
    if ([v7 isEqualToString:@"recordID"])
    {
      uint64_t v8 = [v6 value];

      if (!v8)
      {
LABEL_8:

        return v8;
      }
      uint64_t v7 = [v6 value];
      uint64_t v8 = (void *)[v7 integerValue];
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_8;
  }
  return 0;
}

- (id)recentsUniqueID
{
  id v2 = objc_alloc(MEMORY[0x1E4F29088]);
  uint64_t v3 = [a1 absoluteString];
  uint64_t v4 = (void *)[v2 initWithString:v3];

  uint64_t v5 = [v4 queryItems];
  char v6 = [v5 firstObject];

  uint64_t v7 = [v6 name];
  if ([v7 isEqualToString:@"uniqueId"])
  {
    uint64_t v8 = [v6 value];

    if (v8)
    {
      uint64_t v9 = [v6 value];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v9 = 0;
LABEL_6:

  return v9;
}

- (id)voicemailMessageUUID
{
  if (![a1 isPhoneAppVoicemailURL])
  {
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  id v2 = objc_alloc(MEMORY[0x1E4F29088]);
  uint64_t v3 = [a1 absoluteString];
  uint64_t v4 = (void *)[v2 initWithString:v3];

  uint64_t v5 = [v4 queryItems];
  char v6 = [v5 firstObject];

  uint64_t v7 = [v6 name];
  if (![v7 isEqualToString:@"uuid"])
  {
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = [v6 value];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = [v6 value];
    uint64_t v8 = (void *)[v9 initWithUUIDString:v7];
LABEL_7:
  }
LABEL_9:

  return v8;
}

+ (id)phoneAppVoicemailURLForRecordID:()Telephony
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:@"vmshow"];
  uint64_t v5 = (void *)MEMORY[0x1E4F290C8];
  char v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = [v5 queryItemWithName:@"recordID" value:v7];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v4 setQueryItems:v9];

  unsigned int v10 = [v4 URL];

  return v10;
}

+ (id)phoneAppVoicemailURLForMessageUUID:()Telephony
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"vmshow"];
  char v6 = (void *)MEMORY[0x1E4F290C8];
  uint64_t v7 = [v4 UUIDString];

  uint64_t v8 = [v6 queryItemWithName:@"uuid" value:v7];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v5 setQueryItems:v9];

  unsigned int v10 = [v5 URL];

  return v10;
}

@end