@interface NSString(TelephonyUtilities)
+ (id)tu_conversationHandoffDynamicIdentifierForEligibility:()TelephonyUtilities;
+ (id)tu_conversationHandoffDynamicIdentifierWithGroupUUID:()TelephonyUtilities participantIdentifier:uplinkMuted:sendingVideo:;
- (BOOL)destinationIdIsCallControlCode;
- (TUConversationHandoffEligibility)tu_handoffEligibility;
- (id)IDSFormattedDestinationID;
- (id)destinationIDWithoutControlOrPhoneNumberSeparatorCharacters;
- (id)formattedDisplayID;
- (id)normalizedDestinationID;
- (id)normalizedTokenURI;
- (id)tu_stringByAddingBase64Padding;
- (id)tu_stringByStrippingBase64Padding;
- (id)tu_unsignedLongLongNumber;
- (uint64_t)LTRString;
- (uint64_t)RTLString;
- (uint64_t)destinationIdIsEmailAddress;
- (uint64_t)destinationIdIsPhoneNumber;
- (uint64_t)destinationIdIsTokenURI;
@end

@implementation NSString(TelephonyUtilities)

- (uint64_t)destinationIdIsEmailAddress
{
  uint64_t result = [a1 length];
  if (result)
  {
    return MEMORY[0x1F4123A48](a1);
  }
  return result;
}

- (uint64_t)destinationIdIsTokenURI
{
  id v0 = (id)IDSCopyTokenAndIDForTokenWithID();
  return 0;
}

- (uint64_t)destinationIdIsPhoneNumber
{
  uint64_t result = [a1 length];
  if (result)
  {
    if (([a1 destinationIdIsEmailAddress] & 1) != 0
      || ([a1 destinationIdIsTemporary] & 1) != 0
      || ([a1 destinationIdIsPseudonym] & 1) != 0)
    {
      return 0;
    }
    else
    {
      return [a1 destinationIdIsHardware] ^ 1;
    }
  }
  return result;
}

- (uint64_t)LTRString
{
  return [NSString stringWithFormat:@"\u202D%@\u202C", a1];
}

- (uint64_t)RTLString
{
  return [NSString stringWithFormat:@"\u202E%@\u202C", a1];
}

- (BOOL)destinationIdIsCallControlCode
{
  if ([a1 length] == 1)
  {
    BOOL v2 = [a1 characterAtIndex:0] - 48 >= 6;
  }
  else
  {
    if ([a1 length] != 2) {
      return 0;
    }
    int v3 = [a1 characterAtIndex:0];
    unsigned int v4 = [a1 characterAtIndex:1];
    BOOL v2 = (v3 - 49) >= 2 || v4 <= 0x2F || v4 >= 0x3A;
  }
  return !v2;
}

- (id)IDSFormattedDestinationID
{
  BOOL v2 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  int v3 = [a1 stringByRemovingCharactersFromSet:v2];

  if (MEMORY[0x19F397490](v3))
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForTemporaryIDIDS != -1) {
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForTemporaryIDIDS, &__block_literal_global_39);
    }
    unsigned int v4 = &IDSFormattedDestinationID__IDSCopyIDForTemporaryID;
  }
  else if (MEMORY[0x19F397480](v3))
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForPseudonymIDIDS != -1) {
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForPseudonymIDIDS, &__block_literal_global_17_0);
    }
    unsigned int v4 = &IDSFormattedDestinationID__IDSCopyIDForPseudonymID;
  }
  else if (MEMORY[0x19F397470](v3))
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForPhoneNumberIDS != -1) {
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForPhoneNumberIDS, &__block_literal_global_20);
    }
    unsigned int v4 = &IDSFormattedDestinationID__IDSCopyIDForPhoneNumber;
  }
  else
  {
    if (IDSFormattedDestinationID__pred_IDSCopyIDForEmailAddressIDS != -1) {
      dispatch_once(&IDSFormattedDestinationID__pred_IDSCopyIDForEmailAddressIDS, &__block_literal_global_23);
    }
    unsigned int v4 = &IDSFormattedDestinationID__IDSCopyIDForEmailAddress;
  }
  v5 = (void *)((uint64_t (*)(void *))*v4)(v3);

  return v5;
}

- (id)normalizedTokenURI
{
  id v0 = (void *)IDSCopyAddressDestinationForDestination();
  v1 = (void *)IDSCopyRawAddressForDestination();

  BOOL v2 = objc_msgSend(v1, "_im_normalizedURIString");

  return v2;
}

- (id)destinationIDWithoutControlOrPhoneNumberSeparatorCharacters
{
  BOOL v2 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  int v3 = [a1 stringByRemovingCharactersFromSet:v2];

  if ([a1 _appearsToBePhoneNumber])
  {
    unsigned int v4 = [MEMORY[0x1E4F28B88] phoneNumberSeparatorCharacterSet];
    uint64_t v5 = [v3 stringByRemovingCharactersFromSet:v4];

    int v3 = (void *)v5;
  }

  return v3;
}

- (id)normalizedDestinationID
{
  v1 = +[TUHandle normalizedHandleWithDestinationID:a1];
  BOOL v2 = [v1 value];

  return v2;
}

- (id)formattedDisplayID
{
  BOOL v2 = [NSString stringWithString:a1];
  if ([a1 _appearsToBePhoneNumber])
  {
    if (!formattedDisplayID_sCountryCode)
    {
      int v3 = [MEMORY[0x1E4F1CA20] currentLocale];
      unsigned int v4 = [v3 objectForKey:*MEMORY[0x1E4F1C400]];
      uint64_t v5 = [v4 lowercaseString];
      v6 = (void *)formattedDisplayID_sCountryCode;
      formattedDisplayID_sCountryCode = v5;
    }
    uint64_t v7 = CFPhoneNumberCreate();
    if (v7)
    {
      v8 = (const void *)v7;
      String = (void *)CFPhoneNumberCreateString();
      if (!String) {
        String = (void *)CFPhoneNumberCreateString();
      }
      CFRelease(v8);
      if ([String length])
      {
        uint64_t v10 = [String LTRString];

        BOOL v2 = (void *)v10;
      }
    }
  }

  return v2;
}

- (id)tu_stringByStrippingBase64Padding
{
  if (([a1 length] & 3) != 0) {
    [NSString stringWithString:a1];
  }
  else {
  BOOL v2 = [a1 stringByReplacingOccurrencesOfString:@"=" withString:&stru_1EECEA668];
  }

  return v2;
}

- (id)tu_stringByAddingBase64Padding
{
  if (([a1 length] & 3) != 0) {
    objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(a1, "length") - (objc_msgSend(a1, "length") & 3) + 4, @"=", 0);
  }
  else {
  BOOL v2 = [NSString stringWithString:a1];
  }

  return v2;
}

- (id)tu_unsignedLongLongNumber
{
  BOOL v2 = (void *)[a1 length];
  if (v2)
  {
    BOOL v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(a1, "UTF8String"), 0, 0));
  }

  return v2;
}

- (TUConversationHandoffEligibility)tu_handoffEligibility
{
  if ([a1 length])
  {
    BOOL v2 = [a1 componentsSeparatedByString:@"~"];
    if ((unint64_t)[v2 count] < 2)
    {
      uint64_t v7 = 0;
      uint64_t v5 = 0;
      v11 = 0;
    }
    else
    {
      id v3 = objc_alloc(MEMORY[0x1E4F29128]);
      unsigned int v4 = [v2 objectAtIndexedSubscript:0];
      uint64_t v5 = (void *)[v3 initWithUUIDString:v4];

      v6 = [v2 objectAtIndexedSubscript:1];
      uint64_t v7 = objc_msgSend(v6, "tu_unsignedLongLongNumber");

      v8 = [v2 objectAtIndexedSubscript:2];
      if (v8)
      {
        v9 = [v2 objectAtIndexedSubscript:2];
        uint64_t v10 = [v9 isEqualToString:@"1"];
      }
      else
      {
        uint64_t v10 = 0;
      }

      uint64_t v12 = [v2 objectAtIndexedSubscript:3];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v2 objectAtIndexedSubscript:3];
        int v15 = [v14 isEqualToString:@"0"];

        uint64_t v16 = v15 ^ 1u;
      }
      else
      {
        uint64_t v16 = 1;
      }
      v11 = 0;
      if (v5 && v7)
      {
        v11 = objc_alloc_init(TUConversationHandoffEligibility);
        [(TUConversationHandoffEligibility *)v11 setEligible:1];
        [(TUConversationHandoffEligibility *)v11 setConversationGroupUUID:v5];
        [(TUConversationHandoffEligibility *)v11 setUplinkMuted:v10];
        [(TUConversationHandoffEligibility *)v11 setSendingVideo:v16];
        v17 = objc_alloc_init(TUConversationParticipantAssociation);
        [(TUConversationHandoffEligibility *)v11 setAssociation:v17];

        uint64_t v18 = [v7 unsignedLongLongValue];
        v19 = [(TUConversationHandoffEligibility *)v11 association];
        [v19 setIdentifier:v18];
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)tu_conversationHandoffDynamicIdentifierWithGroupUUID:()TelephonyUtilities participantIdentifier:uplinkMuted:sendingVideo:
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v9 = [a3 UUIDString];
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4, v9);
  v11 = (void *)v10;
  uint64_t v12 = @"0";
  if (a5) {
    v13 = @"1";
  }
  else {
    v13 = @"0";
  }
  v17[1] = v10;
  v17[2] = v13;
  if (a6) {
    uint64_t v12 = @"1";
  }
  v17[3] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  int v15 = [v14 componentsJoinedByString:@"~"];

  return v15;
}

+ (id)tu_conversationHandoffDynamicIdentifierForEligibility:()TelephonyUtilities
{
  id v4 = a3;
  uint64_t v5 = [v4 conversationGroupUUID];
  v6 = [v4 association];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v4 isUplinkMuted];
  uint64_t v9 = [v4 isSendingVideo];

  uint64_t v10 = objc_msgSend(a1, "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:", v5, v7, v8, v9);

  return v10;
}

@end