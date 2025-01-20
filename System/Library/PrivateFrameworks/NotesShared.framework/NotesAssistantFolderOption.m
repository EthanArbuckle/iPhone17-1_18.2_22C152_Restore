@interface NotesAssistantFolderOption
+ (void)disambiguateFolderOptions:(id)a3;
+ (void)disambiguateSameTitleFolderOptions:(id)a3;
- (NSManagedObjectID)managedObjectID;
- (NSString)accountIdentifier;
- (NSString)accountTitle;
- (NSString)fullTitle;
- (NSString)identifierURIPathComponent;
- (NSString)parentTitle;
- (NSString)title;
- (NotesAssistantFolderOption)initWithLegacyFolder:(id)a3;
- (NotesAssistantFolderOption)initWithModernFolder:(id)a3;
- (id)debugDescription;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountTitle:(id)a3;
- (void)setFullTitle:(id)a3;
- (void)setIdentifierURIPathComponent:(id)a3;
- (void)setManagedObjectID:(id)a3;
- (void)setParentTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NotesAssistantFolderOption

+ (void)disambiguateFolderOptions:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v11 title];
        v13 = [v5 objectForKeyedSubscript:v12];

        if (!v13)
        {
          v13 = [MEMORY[0x1E4F1CA80] set];
          v14 = [v11 title];
          [v5 setObject:v13 forKeyedSubscript:v14];
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v15 = objc_msgSend(v5, "allValues", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        if ((unint64_t)[v20 count] >= 2) {
          [a1 disambiguateSameTitleFolderOptions:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v17);
  }

  v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"fullTitle" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v31 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v6 sortUsingDescriptors:v22];
}

- (NotesAssistantFolderOption)initWithLegacyFolder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NotesAssistantFolderOption;
  v5 = [(NotesAssistantFolderOption *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectID];
    managedObjectID = v5->_managedObjectID;
    v5->_managedObjectID = (NSManagedObjectID *)v6;

    uint64_t v8 = [v4 localizedTitle];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_storeStrong((id *)&v5->_fullTitle, v5->_title);
    v10 = [v4 parentFolder];
    uint64_t v11 = [v10 localizedTitle];
    parentTitle = v5->_parentTitle;
    v5->_parentTitle = (NSString *)v11;

    v13 = [v4 account];
    uint64_t v14 = [v13 name];
    accountTitle = v5->_accountTitle;
    v5->_accountTitle = (NSString *)v14;

    uint64_t v16 = [v4 identifierURIPathComponent];
    identifierURIPathComponent = v5->_identifierURIPathComponent;
    v5->_identifierURIPathComponent = (NSString *)v16;
  }
  return v5;
}

- (NotesAssistantFolderOption)initWithModernFolder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NotesAssistantFolderOption;
  v5 = [(NotesAssistantFolderOption *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectID];
    managedObjectID = v5->_managedObjectID;
    v5->_managedObjectID = (NSManagedObjectID *)v6;

    uint64_t v8 = [v4 localizedTitle];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_storeStrong((id *)&v5->_fullTitle, v5->_title);
    v10 = [v4 parent];
    uint64_t v11 = [v10 localizedTitle];
    parentTitle = v5->_parentTitle;
    v5->_parentTitle = (NSString *)v11;

    uint64_t v13 = [v4 accountName];
    accountTitle = v5->_accountTitle;
    v5->_accountTitle = (NSString *)v13;

    uint64_t v15 = [v4 identifierURIPathComponent];
    identifierURIPathComponent = v5->_identifierURIPathComponent;
    v5->_identifierURIPathComponent = (NSString *)v15;

    uint64_t v17 = [v4 account];
    int v18 = [v17 accountType];

    if (v18 == 1)
    {
      objc_super v19 = [v4 account];
      uint64_t v20 = [v19 identifier];
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v20;
    }
    else
    {
      objc_super v19 = v5->_accountIdentifier;
      v5->_accountIdentifier = 0;
    }
  }
  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NotesAssistantFolderOption *)self title];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p>(title: \"%@\"", v4, self, v5];

  return v6;
}

+ (void)disambiguateSameTitleFolderOptions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [v8 title];
        v10 = [v8 parentTitle];

        if (v10)
        {
          uint64_t v11 = NSString;
          v12 = [v8 parentTitle];
          [v11 stringWithFormat:@"%@/%@", v12, v9];
        }
        else
        {
          v12 = [v8 accountTitle];
          [v9 stringByAppendingFormat:@" [%@]", v12];
        uint64_t v13 = };

        [v8 setFullTitle:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (NSString)accountTitle
{
  return self->_accountTitle;
}

- (void)setAccountTitle:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)fullTitle
{
  return self->_fullTitle;
}

- (void)setFullTitle:(id)a3
{
}

- (NSManagedObjectID)managedObjectID
{
  return self->_managedObjectID;
}

- (void)setManagedObjectID:(id)a3
{
}

- (NSString)identifierURIPathComponent
{
  return self->_identifierURIPathComponent;
}

- (void)setIdentifierURIPathComponent:(id)a3
{
}

- (NSString)parentTitle
{
  return self->_parentTitle;
}

- (void)setParentTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_parentTitle, 0);
  objc_storeStrong((id *)&self->_identifierURIPathComponent, 0);
  objc_storeStrong((id *)&self->_managedObjectID, 0);
  objc_storeStrong((id *)&self->_fullTitle, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountTitle, 0);
}

@end