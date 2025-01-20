@interface SDSuggestion
+ (id)placeholderSuggestion;
- (BOOL)isPlaceholder;
- (INImage)image;
- (NSArray)contacts;
- (NSArray)contactsIdentifiers;
- (NSArray)formattedHandles;
- (NSArray)handles;
- (NSArray)recipients;
- (NSString)conversationIdentifier;
- (NSString)derivedIntentIdentifier;
- (NSString)displayName;
- (NSString)groupName;
- (NSString)reason;
- (NSString)transportBundleIdentifier;
- (SDSuggestion)initWithSuggestion:(id)a3;
- (_PSSuggestion)suggestion;
- (id)_caseSensitiveBundleIDFromBundleID:(id)a3;
- (id)createPeopleSuggestion;
- (int64_t)transientContactsCount;
- (void)_configure;
- (void)_requestSandboxExtensionForDonatedImage:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContactsIdentifiers:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setDerivedIntentIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFormattedHandles:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHandles:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setTransientContactsCount:(int64_t)a3;
- (void)setTransportBundleIdentifier:(id)a3;
@end

@implementation SDSuggestion

+ (id)placeholderSuggestion
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setIsPlaceholder:1];
  [v2 setTransportBundleIdentifier:@"SDSuggestionTransportIdentifierPlaceholder"];

  return v2;
}

- (SDSuggestion)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDSuggestion;
  v6 = [(SDSuggestion *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestion, a3);
    [(SDSuggestion *)v7 _configure];
  }

  return v7;
}

- (void)_configure
{
  v3 = self;
  v4 = [(SDSuggestion *)self suggestion];
  if (!v4)
  {
    v67 = +[NSAssertionHandler currentHandler];
    [v67 handleFailureInMethod:a2 object:v3 file:@"SDSuggestion.m" lineNumber:69 description:@"suggestion must be set."];
  }
  id v5 = [v4 groupName];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = +[NSMutableArray array];
  v76 = +[NSMutableArray array];
  v77 = +[NSMutableArray array];
  if ([v5 length])
  {
    v8 = +[NSNull null];
    objc_super v9 = +[NSPredicate predicateWithFormat:@"SELF != %@", v8];

    v10 = [v4 recipients];
    v11 = [v10 valueForKey:@"handle"];

    v12 = [v11 filteredArrayUsingPredicate:v9];
    v13 = v6;
    id v14 = [v12 mutableCopy];

    id v15 = v14;
    v16 = v5;
    v17 = [v4 recipients];
    v18 = [v17 valueForKey:@"contact"];

    v19 = [v18 filteredArrayUsingPredicate:v9];
    id v20 = [v19 mutableCopy];

    uint64_t v21 = 0;
    v22 = v15;
    goto LABEL_63;
  }
  v74 = v6;
  v75 = v7;
  v68 = v5;
  v69 = v3;
  v23 = [v4 recipients];
  id v24 = [v23 count];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v71 = v4;
  id obj = [v4 recipients];
  id v25 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (!v25)
  {
    uint64_t v72 = 0;
    v78 = 0;
    uint64_t v28 = 0;
    goto LABEL_52;
  }
  id v26 = v25;
  uint64_t v72 = 0;
  char v27 = 0;
  char v79 = 0;
  v78 = 0;
  uint64_t v28 = 0;
  uint64_t v80 = *(void *)v82;
  if ((unint64_t)v24 <= 1) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = 1000;
  }
  uint64_t v70 = v29;
  do
  {
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(void *)v82 != v80) {
        objc_enumerationMutation(obj);
      }
      v31 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      uint64_t v32 = [v31 displayName];
      v33 = [v31 contact];
      uint64_t v34 = [v31 handle];
      v35 = (void *)v34;
      if (v33)
      {
        [v77 addObject:v33];
      }
      else if (v34)
      {
        id v36 = [objc_alloc((Class)CNMutableContact) initWithIdentifier:v34];
        [v77 addObject:v36];
        ++v72;
      }
      v37 = [v33 identifier];
      if (v37) {
        [v76 addObject:v37];
      }

      if ([(id)v32 length]) {
        goto LABEL_23;
      }
      if ([v33 isKeyAvailable:CNContactNicknameKey])
      {
        uint64_t v38 = [v33 nickname];

        uint64_t v32 = v38;
      }
      if ([(id)v32 length])
      {
LABEL_23:
        if (!v35) {
          goto LABEL_29;
        }
      }
      else
      {
        id v47 = [v33 mutableCopy];
        [v47 setMiddleName:&stru_1008E7020];
        uint64_t v48 = +[CNContactFormatter stringFromContact:v47 style:v70];

        uint64_t v32 = v48;
        if (!v35) {
          goto LABEL_29;
        }
      }
      if (v32
        && ([v71 bundleID],
            v39 = objc_claimAutoreleasedReturnValue(),
            unsigned int v40 = [v39 isEqualToString:@"com.apple.mobilemail"],
            v39,
            v40))
      {
        v41 = +[NSString stringWithFormat:@"%@ <%@>", v32, v35];
        [v74 addObject:v41];
      }
      else
      {
        [v74 addObject:v35];
      }
      [v75 addObject:v35];
LABEL_29:
      if (v27)
      {
        if (v79) {
          goto LABEL_34;
        }
        if (!v28 && v32)
        {
          uint64_t v28 = (uint64_t)(id)v32;
LABEL_34:
          char v27 = 1;
          char v79 = 1;
          goto LABEL_48;
        }
        if (!(v28 | v32))
        {
          uint64_t v28 = [v31 handle];
        }
        char v79 = 0;
        char v27 = 1;
      }
      else if (v32)
      {
        if (v78) {
          v42 = v78;
        }
        else {
          v42 = (void *)v28;
        }
        id v43 = v42;

        id v44 = (id)v32;
        char v27 = 1;
        v78 = v44;
        uint64_t v28 = (uint64_t)v43;
      }
      else
      {
        uint64_t v45 = [v31 handle];
        uint64_t v46 = v45;
        if (v78)
        {

          char v27 = 0;
          uint64_t v28 = v46;
        }
        else
        {
          char v27 = 0;
          v78 = (void *)v45;
        }
      }
LABEL_48:
    }
    id v26 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
  }
  while (v26);
LABEL_52:

  v16 = v68;
  if ([v68 length])
  {
    v4 = v71;
    id v20 = v77;
    v22 = v74;
  }
  else
  {
    v4 = v71;
    v49 = [v71 recipients];
    id v50 = [v49 count];

    id v20 = v77;
    v22 = v74;
    if (v50 == (id)1)
    {
      id v51 = v78;
    }
    else
    {
      v52 = [v71 recipients];
      id v53 = [v52 count];

      if (v53 == (id)2
        || ([v71 recipients],
            v54 = objc_claimAutoreleasedReturnValue(),
            id v55 = [v54 count],
            v54,
            v55 == (id)3))
      {
        uint64_t v56 = SFLocalizedStringForKey();
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v56, v78, v28);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v56 = SFLocalizedStringForKey();
        v57 = [v71 recipients];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v56, v78, v28, (char *)[v57 count] - 2);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v56;
    }

    v16 = v51;
  }

  v3 = v69;
  id v15 = v75;
  uint64_t v21 = v72;
LABEL_63:
  [(SDSuggestion *)v3 setDisplayName:v16];
  [(SDSuggestion *)v3 setFormattedHandles:v22];
  [(SDSuggestion *)v3 setHandles:v15];
  [(SDSuggestion *)v3 setContactsIdentifiers:v76];
  [(SDSuggestion *)v3 setContacts:v20];
  [(SDSuggestion *)v3 setTransientContactsCount:v21];
  v58 = [v4 bundleID];
  v59 = [(SDSuggestion *)v3 _caseSensitiveBundleIDFromBundleID:v58];
  [(SDSuggestion *)v3 setTransportBundleIdentifier:v59];

  v60 = [v4 recipients];
  [(SDSuggestion *)v3 setRecipients:v60];

  v61 = [v4 conversationIdentifier];
  [(SDSuggestion *)v3 setConversationIdentifier:v61];

  v62 = [v4 derivedIntentIdentifier];
  [(SDSuggestion *)v3 setDerivedIntentIdentifier:v62];

  v63 = [v4 groupName];
  [(SDSuggestion *)v3 setGroupName:v63];

  v64 = [v4 image];
  [(SDSuggestion *)v3 setImage:v64];

  v65 = [v4 reason];
  if (v65)
  {
    [(SDSuggestion *)v3 setReason:v65];
  }
  else
  {
    v66 = [v4 reasonType];
    [(SDSuggestion *)v3 setReason:v66];
  }
}

- (id)_caseSensitiveBundleIDFromBundleID:(id)a3
{
  id v3 = a3;
  v4 = [v3 lowercaseString];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.mobilesms"];

  if (v5) {
    id v6 = @"com.apple.MobileSMS";
  }
  else {
    id v6 = (__CFString *)v3;
  }

  return v6;
}

- (id)createPeopleSuggestion
{
  id v3 = [(SDSuggestion *)self conversationIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = +[NSUUID UUID];
    v7 = [v6 UUIDString];
    v8 = [v7 substringWithRange:24, 12];
    id v5 = [v8 lowercaseString];
  }
  objc_super v9 = [(SDSuggestion *)self image];
  id v10 = objc_alloc((Class)SFPeopleSuggestion);
  v11 = [(SDSuggestion *)self displayName];
  v12 = [(SDSuggestion *)self transportBundleIdentifier];
  v13 = [(SDSuggestion *)self contacts];
  id v14 = [(SDSuggestion *)self formattedHandles];
  LOBYTE(v17) = [(SDSuggestion *)self isPlaceholder];
  id v15 = [v10 initWithIdentifier:v5 displayName:v11 transportBundleIdentifier:v12 contacts:v13 formattedHandles:v14 donatedImage:v9 placeholder:v17];

  if (v9) {
    [(SDSuggestion *)self _requestSandboxExtensionForDonatedImage:v9];
  }

  return v15;
}

- (void)_requestSandboxExtensionForDonatedImage:(id)a3
{
  id v3 = a3;
  v4 = [v3 _imageData];

  if (!v4)
  {
    id v5 = [v3 _uri];
    if ([v5 isFileURL])
    {
      id v6 = v5;
      [v6 fileSystemRepresentation];
      v7 = (const char *)sandbox_extension_issue_file();
      if (v7)
      {
        v8 = +[NSData dataWithBytesNoCopy:v7 length:strlen(v7) + 1 freeWhenDone:1];
        [v3 _setSandboxExtensionData:v8];
      }
      else
      {
        objc_super v9 = share_sheet_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100023F44(v6, v9);
        }
      }
    }
  }
}

- (_PSSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSArray)formattedHandles
{
  return self->_formattedHandles;
}

- (void)setFormattedHandles:(id)a3
{
}

- (NSArray)contactsIdentifiers
{
  return self->_contactsIdentifiers;
}

- (void)setContactsIdentifiers:(id)a3
{
}

- (NSString)transportBundleIdentifier
{
  return self->_transportBundleIdentifier;
}

- (void)setTransportBundleIdentifier:(id)a3
{
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (void)setDerivedIntentIdentifier:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (int64_t)transientContactsCount
{
  return self->_transientContactsCount;
}

- (void)setTransientContactsCount:(int64_t)a3
{
  self->_transientContactsCount = a3;
}

- (INImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_transportBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contactsIdentifiers, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end