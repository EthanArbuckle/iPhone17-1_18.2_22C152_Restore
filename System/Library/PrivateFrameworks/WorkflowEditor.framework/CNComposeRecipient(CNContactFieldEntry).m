@interface CNComposeRecipient(CNContactFieldEntry)
+ (WFContactComposeRecipient)wf_composeRecipientForContact:()CNContactFieldEntry;
- (id)wf_contactFieldEntry;
@end

@implementation CNComposeRecipient(CNContactFieldEntry)

- (id)wf_contactFieldEntry
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [a1 contact];

  if (v2)
  {
    v3 = [a1 contact];
    unint64_t v4 = [a1 kind];
    v5 = [a1 valueIdentifier];
    id v6 = v3;
    id v7 = v5;
    if (v4 > 2) {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v8 = dword_234B796D8[v4];
    }
    v16 = CNContactPropertyKeyFromWFContactPropertyID();
    if ([v6 isKeyAvailable:v16])
    {
      v17 = [v6 valueForKey:v16];
      *(void *)v31 = MEMORY[0x263EF8330];
      *(void *)&v31[8] = 3221225472;
      *(void *)&v31[16] = __WFContactForSpecificHandle_block_invoke;
      v32 = &unk_264BFD8E8;
      id v33 = v7;
      uint64_t v18 = [v17 indexOfObjectPassingTest:v31];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = 0;
      }
      else
      {
        v12 = objc_msgSend(MEMORY[0x263F33748], "contactWithCNContact:propertyID:multivalueIndex:", v6, v8, v18, *(void *)v31, *(void *)&v31[8], *(void *)&v31[16], v32);
      }
    }
    else
    {
      v12 = 0;
    }

    if (!v12)
    {
      v19 = (void *)MEMORY[0x263F33748];
      v20 = [a1 contact];
      v12 = [v19 contactWithCNContact:v20];
    }
    v21 = getWFWFContactFieldEntryLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v31 = 136315650;
      *(void *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = a1;
      *(_WORD *)&v31[22] = 2112;
      v32 = v12;
      _os_log_impl(&dword_23490C000, v21, OS_LOG_TYPE_INFO, "%s Converting from CNComposeRecipient to WFContact: %@ -> %@", v31, 0x20u);
    }

    v22 = (void *)[objc_alloc(MEMORY[0x263F33790]) initWithContact:v12];
    goto LABEL_34;
  }
  uint64_t v9 = [a1 kind];
  v10 = [a1 address];
  v11 = [MEMORY[0x263F08708] controlCharacterSet];
  v12 = [v10 stringByTrimmingCharactersInSet:v11];

  if (![v12 length])
  {
    v23 = getWFWFContactFieldEntryLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [a1 address];
      *(_DWORD *)v31 = 136315650;
      *(void *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = a1;
      *(_WORD *)&v31[22] = 2112;
      v32 = v24;
      v25 = "%s Failed converting to WFContact from: %@ - reason: empty normalized address (source %@)";
      v26 = v23;
      os_log_type_t v27 = OS_LOG_TYPE_INFO;
LABEL_32:
      _os_log_impl(&dword_23490C000, v26, v27, v25, v31, 0x20u);
    }
LABEL_33:

    v22 = 0;
    goto LABEL_34;
  }
  switch(v9)
  {
    case 0:
      id v28 = objc_alloc(MEMORY[0x263F33790]);
      v14 = [MEMORY[0x263F33860] addressWithEmailAddress:v12];
      uint64_t v15 = [v28 initWithEmailAddress:v14];
      goto LABEL_24;
    case 2:
      v22 = (void *)[objc_alloc(MEMORY[0x263F33790]) initWithCustomHandle:v12];
      break;
    case 1:
      id v13 = objc_alloc(MEMORY[0x263F33790]);
      v14 = [MEMORY[0x263F33928] phoneNumberWithPhoneNumberString:v12];
      uint64_t v15 = [v13 initWithPhoneNumber:v14];
LABEL_24:
      v22 = (void *)v15;

      break;
    default:
      v22 = 0;
      break;
  }
  v29 = getWFWFContactFieldEntryLogObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v31 = 136315650;
    *(void *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
    *(_WORD *)&v31[12] = 2112;
    *(void *)&v31[14] = a1;
    *(_WORD *)&v31[22] = 2112;
    v32 = v22;
    _os_log_impl(&dword_23490C000, v29, OS_LOG_TYPE_INFO, "%s Converting from CNComposeRecipient to WFContactFieldEntry: %@ -> %@", v31, 0x20u);
  }

  if (!v22)
  {
    v23 = getWFWFContactFieldEntryLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [a1 address];
      *(_DWORD *)v31 = 136315650;
      *(void *)&v31[4] = "-[CNComposeRecipient(CNContactFieldEntry) wf_contactFieldEntry]";
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[14] = a1;
      *(_WORD *)&v31[22] = 2112;
      v32 = v24;
      v25 = "%s Failed converting to WFContact from: %@ - reason: no entry found for address: %@";
      v26 = v23;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      goto LABEL_32;
    }
    goto LABEL_33;
  }
LABEL_34:

  return v22;
}

+ (WFContactComposeRecipient)wf_composeRecipientForContact:()CNContactFieldEntry
{
  id v3 = a3;
  unint64_t v4 = [[WFContactComposeRecipient alloc] initWithWFContact:v3];

  return v4;
}

@end