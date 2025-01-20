@interface PSGInputSuggestionsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isDocumentEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (BOOL)isResponseContextBlacklisted;
- (BOOL)shouldDisableAutoCaps;
- (NSArray)conversationTurns;
- (NSArray)recipients;
- (NSArray)responseKitConversationTurns;
- (NSSet)availableApps;
- (NSSet)recipientNames;
- (NSString)adaptationContextID;
- (NSString)bundleIdentifier;
- (NSString)contextAfterInput;
- (NSString)contextBeforeInput;
- (NSString)initiatingProcess;
- (NSString)localeIdentifier;
- (NSString)markedText;
- (NSString)responseContext;
- (NSString)selectedText;
- (NSString)textContentType;
- (PSGInputSuggestionsRequest)initWithCoder:(id)a3;
- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 adaptationContextID:(id)a5 shouldDisableAutoCaps:(BOOL)a6 isResponseContextBlacklisted:(BOOL)a7 contextBeforeInput:(id)a8 markedText:(id)a9 selectedText:(id)a10 contextAfterInput:(id)a11 selectedRangeInMarkedText:(_NSRange)a12 localeIdentifier:(id)a13 bundleIdentifier:(id)a14 recipients:(id)a15 recipientNames:(id)a16 textContentType:(id)a17 availableApps:(id)a18 textualResponseLimit:(unint64_t)a19 structuredInfoLimit:(unint64_t)a20 totalSuggestionsLimit:(unint64_t)a21;
- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 adaptationContextID:(id)a5 shouldDisableAutoCaps:(BOOL)a6 isResponseContextBlacklisted:(BOOL)a7 contextBeforeInput:(id)a8 markedText:(id)a9 selectedText:(id)a10 contextAfterInput:(id)a11 selectedRangeInMarkedText:(_NSRange)a12 localeIdentifier:(id)a13 bundleIdentifier:(id)a14 recipients:(id)a15 textContentType:(id)a16 availableApps:(id)a17 textualResponseLimit:(unint64_t)a18 structuredInfoLimit:(unint64_t)a19;
- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 responseKitConversationTurns:(id)a5 adaptationContextID:(id)a6 shouldDisableAutoCaps:(BOOL)a7 isResponseContextBlacklisted:(BOOL)a8 contextBeforeInput:(id)a9 markedText:(id)a10 selectedText:(id)a11 contextAfterInput:(id)a12 selectedRangeInMarkedText:(_NSRange)a13 localeIdentifier:(id)a14 bundleIdentifier:(id)a15 recipients:(id)a16 recipientNames:(id)a17 textContentType:(id)a18 availableApps:(id)a19 textualResponseLimit:(unint64_t)a20 structuredInfoLimit:(unint64_t)a21 totalSuggestionsLimit:(unint64_t)a22;
- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 responseKitConversationTurns:(id)a5 adaptationContextID:(id)a6 shouldDisableAutoCaps:(BOOL)a7 isResponseContextBlacklisted:(BOOL)a8 contextBeforeInput:(id)a9 markedText:(id)a10 selectedText:(id)a11 contextAfterInput:(id)a12 selectedRangeInMarkedText:(_NSRange)a13 localeIdentifier:(id)a14 bundleIdentifier:(id)a15 recipients:(id)a16 recipientNames:(id)a17 textContentType:(id)a18 availableApps:(id)a19 textualResponseLimit:(unint64_t)a20 structuredInfoLimit:(unint64_t)a21 totalSuggestionsLimit:(unint64_t)a22 initiatingProcess:(id)a23;
- (_NSRange)selectedRangeInMarkedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)structuredInfoLimit;
- (unint64_t)textualResponseLimit;
- (unint64_t)totalSuggestionsLimit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGInputSuggestionsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_responseKitConversationTurns, 0);
  objc_storeStrong((id *)&self->_availableApps, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_recipientNames, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_contextAfterInput, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_contextBeforeInput, 0);
  objc_storeStrong((id *)&self->_adaptationContextID, 0);
  objc_storeStrong((id *)&self->_conversationTurns, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
}

- (NSString)initiatingProcess
{
  return self->_initiatingProcess;
}

- (NSArray)responseKitConversationTurns
{
  return self->_responseKitConversationTurns;
}

- (unint64_t)totalSuggestionsLimit
{
  return self->_totalSuggestionsLimit;
}

- (unint64_t)structuredInfoLimit
{
  return self->_structuredInfoLimit;
}

- (unint64_t)textualResponseLimit
{
  return self->_textualResponseLimit;
}

- (NSSet)availableApps
{
  return self->_availableApps;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (NSSet)recipientNames
{
  return self->_recipientNames;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (BOOL)isDocumentEmpty
{
  return self->_isDocumentEmpty;
}

- (_NSRange)selectedRangeInMarkedText
{
  NSUInteger length = self->_selectedRangeInMarkedText.length;
  NSUInteger location = self->_selectedRangeInMarkedText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)contextAfterInput
{
  return self->_contextAfterInput;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (NSString)contextBeforeInput
{
  return self->_contextBeforeInput;
}

- (BOOL)isResponseContextBlacklisted
{
  return self->_isResponseContextBlacklisted;
}

- (BOOL)shouldDisableAutoCaps
{
  return self->_shouldDisableAutoCaps;
}

- (NSString)adaptationContextID
{
  return self->_adaptationContextID;
}

- (NSArray)conversationTurns
{
  return self->_conversationTurns;
}

- (NSString)responseContext
{
  return self->_responseContext;
}

- (id)description
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"<PSGInputSuggestionsRequest ctx_sz:%tu cvt:("), -[NSString length](self->_responseContext, "length");
  v5 = (void *)[v3 initWithString:v4];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v6 = self->_conversationTurns;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v43 + 1) + 8 * i) description];
        [v5 appendString:v11];

        [v5 appendString:@"; "];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v8);
  }

  v12 = (void *)[[NSString alloc] initWithFormat:@" aci:%@ dac:%d rcb:%d cbi_sz:%tu mkt_sz:%tu stt_sz:%tu cai_sz:%tu mkt_range:{%tu, %tu} lid:%@ bid:%@ rts:("), self->_adaptationContextID, self->_shouldDisableAutoCaps, self->_isResponseContextBlacklisted, -[NSString length](self->_contextBeforeInput, "length"), -[NSString length](self->_markedText, "length"), -[NSString length](self->_selectedText, "length"), -[NSString length](self->_contextAfterInput, "length"), self->_selectedRangeInMarkedText.location, self->_selectedRangeInMarkedText.length, self->_localeIdentifier, self->_bundleIdentifier];
  [v5 appendString:v12];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v13 = self->_recipients;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        [v5 appendString:*(void *)(*((void *)&v39 + 1) + 8 * j)];
        [v5 appendString:@"; "];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v15);
  }

  [v5 appendString:@") rns:("];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v18 = self->_recipientNames;
  uint64_t v19 = [(NSSet *)v18 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        [v5 appendString:*(void *)(*((void *)&v35 + 1) + 8 * k)];
        [v5 appendString:@"; "];
      }
      uint64_t v20 = [(NSSet *)v18 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v20);
  }

  v23 = (void *)[[NSString alloc] initWithFormat:@") tct:%@ app:(", self->_textContentType];
  [v5 appendString:v23];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v24 = self->_availableApps;
  uint64_t v25 = [(NSSet *)v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        [v5 appendString:*(void *)(*((void *)&v31 + 1) + 8 * m)];
        [v5 appendString:@"; "];
      }
      uint64_t v26 = [(NSSet *)v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v26);
  }

  v29 = (void *)[[NSString alloc] initWithFormat:@" txtl:%tu strl:%tu tsgl:%tu ipr:%@>"], self->_textualResponseLimit, self->_structuredInfoLimit, self->_totalSuggestionsLimit, self->_initiatingProcess);
  [v5 appendString:v29];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_responseContext hash];
  uint64_t v4 = [(NSArray *)self->_conversationTurns hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSArray *)self->_responseKitConversationTurns count] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_adaptationContextID hash];
  uint64_t v7 = self->_shouldDisableAutoCaps - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  uint64_t v8 = self->_isResponseContextBlacklisted - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_contextBeforeInput hash] - v8 + 32 * v8;
  NSUInteger v10 = [(NSString *)self->_markedText hash] - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_selectedText hash] - v10 + 32 * v10;
  NSUInteger v12 = [(NSString *)self->_contextAfterInput hash];
  NSUInteger v13 = self->_selectedRangeInMarkedText.location - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  NSUInteger v14 = self->_selectedRangeInMarkedText.length - v13 + 32 * v13;
  uint64_t v15 = self->_isDocumentEmpty - v14 + 32 * v14;
  NSUInteger v16 = [(NSString *)self->_localeIdentifier hash] - v15 + 32 * v15;
  NSUInteger v17 = [(NSString *)self->_bundleIdentifier hash] - v16 + 32 * v16;
  uint64_t v18 = [(NSArray *)self->_recipients hash] - v17 + 32 * v17;
  uint64_t v19 = [(NSSet *)self->_recipientNames hash] - v18 + 32 * v18;
  NSUInteger v20 = [(NSString *)self->_textContentType hash] - v19 + 32 * v19;
  uint64_t v21 = [(NSSet *)self->_availableApps hash];
  unint64_t v22 = self->_textualResponseLimit - (v21 - v20 + 32 * v20) + 32 * (v21 - v20 + 32 * v20);
  unint64_t v23 = self->_structuredInfoLimit - v22 + 32 * v22;
  unint64_t v24 = self->_totalSuggestionsLimit - v23 + 32 * v23;
  return [(NSString *)self->_initiatingProcess hash] - v24 + 32 * v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PSGInputSuggestionsRequest *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGInputSuggestionsRequest *)self isEqualToRequest:v5];

  return v6;
}

- (BOOL)isEqualToRequest:(id)a3
{
  uint64_t v4 = (id *)a3;
  NSUInteger v5 = v4;
  if (!v4) {
    goto LABEL_65;
  }
  responseContext = self->_responseContext;
  uint64_t v7 = (NSString *)v4[2];
  if (responseContext == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    NSUInteger v9 = responseContext;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_65;
    }
  }
  conversationTurns = self->_conversationTurns;
  NSUInteger v12 = (NSArray *)v5[3];
  if (conversationTurns == v12)
  {
  }
  else
  {
    NSUInteger v13 = v12;
    NSUInteger v14 = conversationTurns;
    char v15 = [(NSArray *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_65;
    }
  }
  NSUInteger v16 = [(NSArray *)self->_responseKitConversationTurns count];
  if (v16 != [v5[18] count]) {
    goto LABEL_65;
  }
  adaptationContextID = self->_adaptationContextID;
  uint64_t v18 = (NSString *)v5[4];
  if (adaptationContextID == v18)
  {
  }
  else
  {
    uint64_t v19 = v18;
    NSUInteger v20 = adaptationContextID;
    char v21 = [(NSString *)v20 isEqual:v19];

    if ((v21 & 1) == 0) {
      goto LABEL_65;
    }
  }
  if (self->_shouldDisableAutoCaps != *((unsigned __int8 *)v5 + 8)
    || self->_isResponseContextBlacklisted != *((unsigned __int8 *)v5 + 9))
  {
    goto LABEL_65;
  }
  contextBeforeInput = self->_contextBeforeInput;
  unint64_t v23 = (NSString *)v5[5];
  if (contextBeforeInput == v23)
  {
  }
  else
  {
    unint64_t v24 = v23;
    uint64_t v25 = contextBeforeInput;
    char v26 = [(NSString *)v25 isEqual:v24];

    if ((v26 & 1) == 0) {
      goto LABEL_65;
    }
  }
  markedText = self->_markedText;
  v28 = (NSString *)v5[6];
  if (markedText == v28)
  {
  }
  else
  {
    v29 = v28;
    v30 = markedText;
    char v31 = [(NSString *)v30 isEqual:v29];

    if ((v31 & 1) == 0) {
      goto LABEL_65;
    }
  }
  selectedText = self->_selectedText;
  long long v33 = (NSString *)v5[7];
  if (selectedText == v33)
  {
  }
  else
  {
    long long v34 = v33;
    long long v35 = selectedText;
    char v36 = [(NSString *)v35 isEqual:v34];

    if ((v36 & 1) == 0) {
      goto LABEL_65;
    }
  }
  contextAfterInput = self->_contextAfterInput;
  long long v38 = (NSString *)v5[8];
  if (contextAfterInput == v38)
  {
  }
  else
  {
    long long v39 = v38;
    long long v40 = contextAfterInput;
    char v41 = [(NSString *)v40 isEqual:v39];

    if ((v41 & 1) == 0) {
      goto LABEL_65;
    }
  }
  char v42 = 0;
  if (self->_selectedRangeInMarkedText.location == v5[20] && self->_selectedRangeInMarkedText.length == v5[21])
  {
    if (self->_isDocumentEmpty == *((unsigned __int8 *)v5 + 10))
    {
      localeIdentifier = self->_localeIdentifier;
      long long v44 = (NSString *)v5[9];
      if (localeIdentifier == v44)
      {
      }
      else
      {
        long long v45 = v44;
        long long v46 = localeIdentifier;
        char v47 = [(NSString *)v46 isEqual:v45];

        if ((v47 & 1) == 0) {
          goto LABEL_65;
        }
      }
      bundleIdentifier = self->_bundleIdentifier;
      v49 = (NSString *)v5[10];
      if (bundleIdentifier == v49)
      {
      }
      else
      {
        v50 = v49;
        uint64_t v51 = bundleIdentifier;
        char v52 = [(NSString *)v51 isEqual:v50];

        if ((v52 & 1) == 0) {
          goto LABEL_65;
        }
      }
      recipients = self->_recipients;
      v54 = (NSArray *)v5[11];
      if (recipients == v54)
      {
      }
      else
      {
        v55 = v54;
        v56 = recipients;
        char v57 = [(NSArray *)v56 isEqual:v55];

        if ((v57 & 1) == 0) {
          goto LABEL_65;
        }
      }
      recipientNames = self->_recipientNames;
      v59 = (NSSet *)v5[12];
      if (recipientNames == v59)
      {
      }
      else
      {
        v60 = v59;
        v61 = recipientNames;
        char v62 = [(NSSet *)v61 isEqual:v60];

        if ((v62 & 1) == 0) {
          goto LABEL_65;
        }
      }
      textContentType = self->_textContentType;
      v64 = (NSString *)v5[13];
      if (textContentType == v64)
      {
      }
      else
      {
        v65 = v64;
        v66 = textContentType;
        char v67 = [(NSString *)v66 isEqual:v65];

        if ((v67 & 1) == 0) {
          goto LABEL_65;
        }
      }
      availableApps = self->_availableApps;
      v69 = (NSSet *)v5[14];
      if (availableApps == v69)
      {
      }
      else
      {
        v70 = v69;
        v71 = availableApps;
        char v72 = [(NSSet *)v71 isEqual:v70];

        if ((v72 & 1) == 0) {
          goto LABEL_65;
        }
      }
      if (self->_textualResponseLimit != v5[15]
        || self->_structuredInfoLimit != v5[16]
        || self->_totalSuggestionsLimit != v5[17])
      {
        goto LABEL_65;
      }
      v73 = self->_initiatingProcess;
      v74 = v73;
      if (v73 == v5[19]) {
        char v42 = 1;
      }
      else {
        char v42 = -[NSString isEqual:](v73, "isEqual:");
      }

      goto LABEL_66;
    }
LABEL_65:
    char v42 = 0;
  }
LABEL_66:

  return v42;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_responseContext copyWithZone:a3];
    uint64_t v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    uint64_t v8 = [(NSArray *)self->_conversationTurns copyWithZone:a3];
    NSUInteger v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSArray *)self->_responseKitConversationTurns copyWithZone:a3];
    NSUInteger v11 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v10;

    uint64_t v12 = [(NSString *)self->_adaptationContextID copyWithZone:a3];
    NSUInteger v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    *(unsigned char *)(v5 + 8) = self->_shouldDisableAutoCaps;
    *(unsigned char *)(v5 + 9) = self->_isResponseContextBlacklisted;
    uint64_t v14 = [(NSString *)self->_contextBeforeInput copyWithZone:a3];
    char v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    uint64_t v16 = [(NSString *)self->_markedText copyWithZone:a3];
    NSUInteger v17 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v16;

    uint64_t v18 = [(NSString *)self->_selectedText copyWithZone:a3];
    uint64_t v19 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v18;

    uint64_t v20 = [(NSString *)self->_contextAfterInput copyWithZone:a3];
    char v21 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v20;

    *(_NSRange *)(v5 + 160) = self->_selectedRangeInMarkedText;
    *(unsigned char *)(v5 + 10) = self->_isDocumentEmpty;
    uint64_t v22 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
    unint64_t v23 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v22;

    uint64_t v24 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
    uint64_t v25 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v24;

    uint64_t v26 = [(NSArray *)self->_recipients copyWithZone:a3];
    uint64_t v27 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v26;

    uint64_t v28 = [(NSSet *)self->_recipientNames copyWithZone:a3];
    v29 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v28;

    uint64_t v30 = [(NSString *)self->_textContentType copyWithZone:a3];
    char v31 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v30;

    uint64_t v32 = [(NSSet *)self->_availableApps copyWithZone:a3];
    long long v33 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v32;

    *(void *)(v5 + 120) = self->_textualResponseLimit;
    *(void *)(v5 + 128) = self->_structuredInfoLimit;
    *(void *)(v5 + 136) = self->_totalSuggestionsLimit;
    objc_storeStrong((id *)(v5 + 152), self->_initiatingProcess);
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  responseContext = self->_responseContext;
  id v5 = a3;
  [v5 encodeObject:responseContext forKey:@"ctx"];
  [v5 encodeObject:self->_conversationTurns forKey:@"cvt"];
  [v5 encodeObject:self->_adaptationContextID forKey:@"aci"];
  [v5 encodeBool:self->_shouldDisableAutoCaps forKey:@"dac"];
  [v5 encodeBool:self->_isResponseContextBlacklisted forKey:@"rcb"];
  [v5 encodeObject:self->_contextBeforeInput forKey:@"cbi"];
  [v5 encodeObject:self->_markedText forKey:@"mkt"];
  [v5 encodeObject:self->_selectedText forKey:@"stt"];
  [v5 encodeObject:self->_contextAfterInput forKey:@"cai"];
  [v5 encodeInt64:self->_selectedRangeInMarkedText.location forKey:@"loc"];
  [v5 encodeInt64:self->_selectedRangeInMarkedText.length forKey:@"len"];
  [v5 encodeObject:self->_localeIdentifier forKey:@"lid"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bid"];
  [v5 encodeObject:self->_recipients forKey:@"rts"];
  [v5 encodeObject:self->_recipientNames forKey:@"rns"];
  [v5 encodeObject:self->_textContentType forKey:@"tct"];
  [v5 encodeObject:self->_availableApps forKey:@"app"];
  [v5 encodeInt64:self->_textualResponseLimit forKey:@"txtl"];
  [v5 encodeInt64:self->_structuredInfoLimit forKey:@"strl"];
  [v5 encodeInt64:self->_totalSuggestionsLimit forKey:@"tsgl"];
  [v5 encodeObject:self->_initiatingProcess forKey:@"ipr"];
}

- (PSGInputSuggestionsRequest)initWithCoder:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = (void *)MEMORY[0x263F61E90];
  uint64_t v7 = psg_default_log_handle();
  uint64_t v85 = v4;
  uint64_t v87 = [v6 robustDecodeObjectOfClass:v4 forKey:@"ctx" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v7];

  uint64_t v8 = (void *)MEMORY[0x263F61E90];
  NSUInteger v9 = (void *)MEMORY[0x2105116B0]();
  uint64_t v83 = v5;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), v5, 0);
  NSUInteger v11 = psg_default_log_handle();
  uint64_t v12 = [v8 robustDecodeObjectOfClasses:v10 forKey:@"cvt" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v11];

  NSUInteger v13 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v90;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v90 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        id v19 = objc_alloc(MEMORY[0x263F64248]);
        uint64_t v20 = [v18 text];
        char v21 = [v18 senderID];
        uint64_t v22 = [v18 timestamp];
        unint64_t v23 = (void *)[v19 initWithString:v20 senderID:v21 timestamp:v22];

        if (!v23)
        {
          v60 = 0;
          char v62 = obj;
          v63 = obj;
          v61 = self;
          v59 = (void *)v87;
          goto LABEL_17;
        }
        [v13 addObject:v23];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v24 = (void *)MEMORY[0x263F61E90];
  uint64_t v25 = psg_default_log_handle();
  uint64_t v76 = [v24 robustDecodeObjectOfClass:v85 forKey:@"aci" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v25];

  unsigned int v73 = [v3 decodeBoolForKey:@"dac"];
  unsigned int v72 = [v3 decodeBoolForKey:@"rcb"];
  uint64_t v26 = (void *)MEMORY[0x263F61E90];
  uint64_t v27 = psg_default_log_handle();
  uint64_t v75 = [v26 robustDecodeObjectOfClass:v85 forKey:@"cbi" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v27];

  uint64_t v28 = (void *)MEMORY[0x263F61E90];
  v29 = psg_default_log_handle();
  uint64_t v74 = [v28 robustDecodeObjectOfClass:v85 forKey:@"mkt" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v29];

  uint64_t v30 = (void *)MEMORY[0x263F61E90];
  char v31 = psg_default_log_handle();
  v82 = [v30 robustDecodeObjectOfClass:v85 forKey:@"stt" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v31];

  uint64_t v32 = (void *)MEMORY[0x263F61E90];
  long long v33 = psg_default_log_handle();
  v81 = [v32 robustDecodeObjectOfClass:v85 forKey:@"cai" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v33];

  uint64_t v71 = [v3 decodeInt64ForKey:@"loc"];
  uint64_t v70 = [v3 decodeInt64ForKey:@"len"];
  long long v34 = (void *)MEMORY[0x263F61E90];
  long long v35 = psg_default_log_handle();
  v80 = [v34 robustDecodeObjectOfClass:v85 forKey:@"lid" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v35];

  char v36 = (void *)MEMORY[0x263F61E90];
  long long v37 = psg_default_log_handle();
  v79 = [v36 robustDecodeObjectOfClass:v85 forKey:@"bid" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v37];

  long long v38 = (void *)MEMORY[0x263F61E90];
  long long v39 = (void *)MEMORY[0x2105116B0]();
  long long v40 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v85, v83, 0);
  char v41 = psg_default_log_handle();
  v84 = [v38 robustDecodeObjectOfClasses:v40 forKey:@"rts" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v41];

  char v42 = (void *)MEMORY[0x263F61E90];
  long long v43 = (void *)MEMORY[0x2105116B0]();
  long long v44 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v85, objc_opt_class(), 0);
  long long v45 = psg_default_log_handle();
  v78 = [v42 robustDecodeObjectOfClasses:v44 forKey:@"rns" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v45];

  long long v46 = (void *)MEMORY[0x263F61E90];
  char v47 = psg_default_log_handle();
  v77 = [v46 robustDecodeObjectOfClass:v85 forKey:@"tct" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v47];

  v48 = (void *)MEMORY[0x263F61E90];
  v49 = (void *)MEMORY[0x2105116B0]();
  v50 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v85, objc_opt_class(), 0);
  uint64_t v51 = psg_default_log_handle();
  char v52 = [v48 robustDecodeObjectOfClasses:v50 forKey:@"app" withCoder:v3 expectNonNull:0 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v51];

  uint64_t v69 = [v3 decodeInt64ForKey:@"txtl"];
  uint64_t v53 = [v3 decodeInt64ForKey:@"strl"];
  uint64_t v54 = [v3 decodeInt64ForKey:@"tsgl"];
  v55 = (void *)MEMORY[0x263F61E90];
  v56 = psg_default_log_handle();
  char v57 = [v55 robustDecodeObjectOfClass:v85 forKey:@"ipr" withCoder:v3 expectNonNull:1 errorDomain:@"PSGErrorDomain" errorCode:3 logHandle:v56];

  if (v57)
  {
    v58 = [v3 error];

    v59 = (void *)v87;
    if (!v58)
    {
      uint64_t v68 = v54;
      uint64_t v67 = v53;
      v65 = (void *)v74;
      v64 = (void *)v75;
      v63 = (void *)v76;
      v61 = objc_retain(-[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:", v87, obj, v13, v76, v73, v72, v75, v74, v82, v81, v71, v70, v80,
                v79,
                v84,
                v78,
                v77,
                v52,
                v69,
                v67,
                v68,
                v57));
      v60 = v61;
      goto LABEL_16;
    }
    v60 = 0;
    v61 = self;
  }
  else
  {
    v60 = 0;
    v61 = self;
    v59 = (void *)v87;
  }
  v64 = (void *)v75;
  v63 = (void *)v76;
  v65 = (void *)v74;
LABEL_16:

  char v62 = obj;
LABEL_17:

  return v60;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 adaptationContextID:(id)a5 shouldDisableAutoCaps:(BOOL)a6 isResponseContextBlacklisted:(BOOL)a7 contextBeforeInput:(id)a8 markedText:(id)a9 selectedText:(id)a10 contextAfterInput:(id)a11 selectedRangeInMarkedText:(_NSRange)a12 localeIdentifier:(id)a13 bundleIdentifier:(id)a14 recipients:(id)a15 recipientNames:(id)a16 textContentType:(id)a17 availableApps:(id)a18 textualResponseLimit:(unint64_t)a19 structuredInfoLimit:(unint64_t)a20 totalSuggestionsLimit:(unint64_t)a21
{
  BOOL v48 = a6;
  BOOL v49 = a7;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v24 = a4;
  id v53 = a5;
  id v52 = a8;
  id v51 = a9;
  id v46 = a10;
  id v45 = a11;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  id v40 = a17;
  id v39 = a18;
  uint64_t v25 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v26 = v24;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v56 != v29) {
          objc_enumerationMutation(v26);
        }
        char v31 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v32 = [v31 text];

        if (v32)
        {
          id v33 = objc_alloc(MEMORY[0x263F38248]);
          long long v34 = [v31 text];
          long long v35 = [v31 senderId];
          char v36 = [v31 timestamp];
          long long v37 = (void *)[v33 initWithText:v34 senderID:v35 timestamp:v36];
          [v25 addObject:v37];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v28);
  }

  v50 = -[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:", v54, v25, v26, v53, v48, v49, v52, v51, v46, v45, a12.location, a12.length, v44, v43,
          v42,
          v41,
          v40,
          v39,
          a19,
          a20,
          a21);

  return v50;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 adaptationContextID:(id)a5 shouldDisableAutoCaps:(BOOL)a6 isResponseContextBlacklisted:(BOOL)a7 contextBeforeInput:(id)a8 markedText:(id)a9 selectedText:(id)a10 contextAfterInput:(id)a11 selectedRangeInMarkedText:(_NSRange)a12 localeIdentifier:(id)a13 bundleIdentifier:(id)a14 recipients:(id)a15 textContentType:(id)a16 availableApps:(id)a17 textualResponseLimit:(unint64_t)a18 structuredInfoLimit:(unint64_t)a19
{
  BOOL v46 = a6;
  BOOL v47 = a7;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v22 = a4;
  id v50 = a5;
  id v49 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a11;
  id v41 = a13;
  id v40 = a14;
  id v39 = a15;
  id v38 = a16;
  id v37 = a17;
  unint64_t v23 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v30 = [v29 text];

        if (v30)
        {
          id v31 = objc_alloc(MEMORY[0x263F38248]);
          uint64_t v32 = [v29 text];
          id v33 = [v29 senderId];
          long long v34 = [v29 timestamp];
          long long v35 = (void *)[v31 initWithText:v32 senderID:v33 timestamp:v34];
          [v23 addObject:v35];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v26);
  }

  BOOL v48 = -[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:", v51, v23, v24, v50, v46, v47, v49, v44, v43, v42, a12.location, a12.length, v41, v40,
          v39,
          0,
          v38,
          v37,
          a18,
          a19,
          3);

  return v48;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 responseKitConversationTurns:(id)a5 adaptationContextID:(id)a6 shouldDisableAutoCaps:(BOOL)a7 isResponseContextBlacklisted:(BOOL)a8 contextBeforeInput:(id)a9 markedText:(id)a10 selectedText:(id)a11 contextAfterInput:(id)a12 selectedRangeInMarkedText:(_NSRange)a13 localeIdentifier:(id)a14 bundleIdentifier:(id)a15 recipients:(id)a16 recipientNames:(id)a17 textContentType:(id)a18 availableApps:(id)a19 textualResponseLimit:(unint64_t)a20 structuredInfoLimit:(unint64_t)a21 totalSuggestionsLimit:(unint64_t)a22
{
  BOOL v42 = a7;
  BOOL v43 = a8;
  uint64_t v31 = initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasOnceToken4;
  id v40 = a19;
  id v35 = a18;
  id v39 = a17;
  id v38 = a16;
  id v23 = a15;
  id v37 = a14;
  id v36 = a12;
  id v24 = a11;
  id v25 = a10;
  id v47 = a9;
  id v46 = a6;
  id v45 = a5;
  id v26 = a4;
  id v27 = a3;
  if (v31 != -1)
  {
    id v30 = v27;
    dispatch_once(&initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasOnceToken4, &__block_literal_global_108);
    id v27 = v30;
  }
  long long v34 = v27;
  uint64_t v28 = -[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:", v27, v26, v45, v46, v42, v43, v47, v25, v24, v36, a13.location, a13.length, v37, v23,
          v38,
          v39,
          v35,
          v40,
          a20,
          a21,
          a22,
          initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasExprOnceResult);

  return v28;
}

void __412__PSGInputSuggestionsRequest_initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  v1 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v2 = [v1 processName];
  id v3 = (void *)initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasExprOnceResult;
  initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasExprOnceResult = v2;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 responseKitConversationTurns:(id)a5 adaptationContextID:(id)a6 shouldDisableAutoCaps:(BOOL)a7 isResponseContextBlacklisted:(BOOL)a8 contextBeforeInput:(id)a9 markedText:(id)a10 selectedText:(id)a11 contextAfterInput:(id)a12 selectedRangeInMarkedText:(_NSRange)a13 localeIdentifier:(id)a14 bundleIdentifier:(id)a15 recipients:(id)a16 recipientNames:(id)a17 textContentType:(id)a18 availableApps:(id)a19 textualResponseLimit:(unint64_t)a20 structuredInfoLimit:(unint64_t)a21 totalSuggestionsLimit:(unint64_t)a22 initiatingProcess:(id)a23
{
  id v65 = a3;
  id v52 = a4;
  id v26 = a4;
  id v53 = a5;
  id v61 = a5;
  id v54 = a6;
  id v60 = a6;
  id v27 = a9;
  uint64_t v28 = v26;
  id v63 = a10;
  id v64 = a11;
  id v62 = a12;
  uint64_t v29 = v65;
  id v59 = a14;
  id v30 = a15;
  id v31 = a16;
  id v32 = a17;
  id v33 = a18;
  id v34 = a19;
  id v35 = a23;
  v66.receiver = self;
  v66.super_class = (Class)PSGInputSuggestionsRequest;
  id v36 = [(PSGInputSuggestionsRequest *)&v66 init];
  id v37 = v36;
  if (v36)
  {
    long long v58 = v28;
    objc_storeStrong((id *)&v36->_responseContext, a3);
    objc_storeStrong((id *)&v37->_conversationTurns, v52);
    objc_storeStrong((id *)&v37->_responseKitConversationTurns, v53);
    objc_storeStrong((id *)&v37->_adaptationContextID, v54);
    v37->_shouldDisableAutoCaps = a7;
    v37->_isResponseContextBlacklisted = a8;
    objc_storeStrong((id *)&v37->_contextBeforeInput, a9);
    objc_storeStrong((id *)&v37->_markedText, a10);
    objc_storeStrong((id *)&v37->_selectedText, a11);
    objc_storeStrong((id *)&v37->_contextAfterInput, a12);
    v37->_selectedRangeInMarkedText = a13;
    id v49 = v34;
    id v50 = v33;
    id v47 = v31;
    id v48 = v35;
    if ([v27 length] || objc_msgSend(v64, "length"))
    {
      BOOL v38 = 0;
      id v39 = a23;
      id v40 = v65;
      id v42 = a18;
      id v41 = a19;
      id v43 = a17;
    }
    else
    {
      id v39 = a23;
      id v40 = v65;
      id v42 = a18;
      id v41 = a19;
      id v43 = a17;
      if ([v63 length]) {
        BOOL v38 = 0;
      }
      else {
        BOOL v38 = [v62 length] == 0;
      }
    }
    v37->_isDocumentEmpty = v38;
    objc_storeStrong((id *)&v37->_localeIdentifier, a14);
    objc_storeStrong((id *)&v37->_bundleIdentifier, a15);
    objc_storeStrong((id *)&v37->_recipients, a16);
    objc_storeStrong((id *)&v37->_recipientNames, v43);
    objc_storeStrong((id *)&v37->_textContentType, v42);
    objc_storeStrong((id *)&v37->_availableApps, v41);
    unint64_t v44 = a20;
    if (a20 >= a22) {
      unint64_t v44 = a22;
    }
    if (a21 >= a22) {
      unint64_t v45 = a22;
    }
    else {
      unint64_t v45 = a21;
    }
    v37->_textualResponseLimit = v44;
    v37->_structuredInfoLimit = v45;
    v37->_totalSuggestionsLimit = a22;
    objc_storeStrong((id *)&v37->_initiatingProcess, v39);
    uint64_t v28 = v58;
    id v33 = v50;
    uint64_t v29 = v40;
    id v31 = v47;
    id v35 = v48;
    id v34 = v49;
  }

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end