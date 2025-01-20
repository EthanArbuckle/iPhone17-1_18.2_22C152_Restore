@interface WFContactFieldEntry(CNComposeRecipient)
- (id)composeRecipient;
@end

@implementation WFContactFieldEntry(CNComposeRecipient)

- (id)composeRecipient
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  switch([v1 type])
  {
    case 0:
      v2 = [WFContactComposeRecipient alloc];
      v3 = [v1 contact];
      uint64_t v4 = [(WFContactComposeRecipient *)v2 initWithWFContact:v3];
      goto LABEL_8;
    case 1:
      id v6 = objc_alloc(MEMORY[0x263F33430]);
      v3 = [v1 phoneNumber];
      v7 = [v3 string];
      v8 = v6;
      v9 = v7;
      uint64_t v10 = 1;
      goto LABEL_6;
    case 2:
      id v11 = objc_alloc(MEMORY[0x263F33430]);
      v3 = [v1 emailAddress];
      v7 = [v3 address];
      v8 = v11;
      v9 = v7;
      uint64_t v10 = 0;
LABEL_6:
      v5 = (void *)[v8 initWithContact:0 address:v9 kind:v10];

      goto LABEL_9;
    case 3:
      id v12 = objc_alloc(MEMORY[0x263F33430]);
      v3 = [v1 customHandle];
      uint64_t v4 = [v12 initWithContact:0 address:v3 kind:2];
LABEL_8:
      v5 = (void *)v4;
LABEL_9:

      break;
    default:
      v5 = 0;
      break;
  }

  v13 = getWFWFContactFieldEntryLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    v16 = "-[WFContactFieldEntry(CNComposeRecipient) composeRecipient]";
    __int16 v17 = 2112;
    id v18 = v1;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_23490C000, v13, OS_LOG_TYPE_INFO, "%s Converting from WFContactFieldEntry to CNComposeRecipient: %@ -> %@", (uint8_t *)&v15, 0x20u);
  }

  return v5;
}

@end