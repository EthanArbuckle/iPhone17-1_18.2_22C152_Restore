id UNCommunicationContextFromBBCommunicationContext(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  unsigned char v25[128];
  uint64_t v26;
  uint64_t vars8;

  v26 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x263F1DFC8]);
  v3 = [v1 recipients];
  v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    v7 = v6;
    v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = UNContactFromBBContact(*(void **)(*((void *)&v21 + 1) + 8 * i));
        objc_msgSend(v4, "addObject:", v10, (void)v21);
      }
      v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  v11 = [v1 identifier];
  [v2 setIdentifier:v11];

  v12 = [v1 associatedObjectUri];
  [v2 setAssociatedObjectUri:v12];

  v13 = [v1 bundleIdentifier];
  [v2 setBundleIdentifier:v13];

  v14 = [v1 displayName];
  [v2 setDisplayName:v14];

  v15 = [v1 sender];

  if (v15)
  {
    v16 = [v1 sender];
    v17 = UNContactFromBBContact(v16);

    [v2 setSender:v17];
  }
  objc_msgSend(v2, "setRecipients:", v4, (void)v21);
  v18 = [v1 contentURL];
  [v2 setContentURL:v18];

  v19 = [v1 imageName];
  [v2 setImageName:v19];

  objc_msgSend(v2, "setSystemImage:", objc_msgSend(v1, "systemImage"));
  objc_msgSend(v2, "setMentionsCurrentUser:", objc_msgSend(v1, "mentionsCurrentUser"));
  objc_msgSend(v2, "setNotifyRecipientAnyway:", objc_msgSend(v1, "notifyRecipientAnyway"));
  objc_msgSend(v2, "setReplyToCurrentUser:", objc_msgSend(v1, "isReplyToCurrentUser"));
  objc_msgSend(v2, "setRecipientCount:", objc_msgSend(v1, "recipientCount"));
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v1, "capabilities") & 1);
  objc_msgSend(v2, "setBusinessCorrespondence:", objc_msgSend(v1, "isBusinessCorrespondence"));

  return v2;
}

id UNContactFromBBContact(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 handleType];
  if (v2 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (v2 == 2);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F1DFD0]);
  v5 = [v1 handle];
  [v4 setHandle:v5];

  [v4 setHandleType:v3];
  v6 = [v1 displayName];
  [v4 setDisplayName:v6];

  objc_msgSend(v4, "setDisplayNameSuggested:", objc_msgSend(v1, "isDisplayNameSuggested"));
  v7 = [v1 serviceName];
  [v4 setServiceName:v7];

  v8 = [v1 customIdentifier];
  [v4 setCustomIdentifier:v8];

  v9 = [v1 cnContactIdentifier];
  [v4 setCnContactIdentifier:v9];

  v10 = [v1 cnContactFullname];
  [v4 setCnContactFullname:v10];

  uint64_t v11 = [v1 isCNContactIdentifierSuggested];
  [v4 setCnContactIdentifierSuggested:v11];
  return v4;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}