@interface ICFolderListSectionIdentifier
+ (ICFolderListSectionIdentifier)systemSectionIdentifier;
+ (ICFolderListSectionIdentifier)tagSectionIdentifier;
+ (NSArray)sortDescriptors;
- (BOOL)hasHeader;
- (BOOL)isCollapsible;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICFolderListSectionIdentifier:(id)a3;
- (ICFolderListSectionIdentifier)initWithObject:(id)a3;
- (ICFolderListSectionIdentifier)initWithSectionType:(int64_t)a3;
- (NSManagedObjectID)accountObjectID;
- (NSString)description;
- (NSString)expansionStateContext;
- (NSString)title;
- (int64_t)accountSectionTypeForLegacyAccount:(id)a3;
- (int64_t)accountSectionTypeForModernAccount:(id)a3;
- (int64_t)sectionType;
- (unint64_t)hash;
- (void)setAccountObjectID:(id)a3;
- (void)setSectionType:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICFolderListSectionIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accountObjectID, 0);
}

+ (ICFolderListSectionIdentifier)tagSectionIdentifier
{
  if (tagSectionIdentifier_once[0] != -1) {
    dispatch_once(tagSectionIdentifier_once, &__block_literal_global_226);
  }
  v2 = (void *)tagSectionIdentifier_identifier;
  return (ICFolderListSectionIdentifier *)v2;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    uint64_t v4 = [(ICFolderListSectionIdentifier *)self sectionType];
    v5 = [(ICFolderListSectionIdentifier *)self accountObjectID];
    char v6 = [v5 hash];
    self->_hash = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICFolderListSectionIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    char v6 = ICDynamicCast();
    BOOL v7 = [(ICFolderListSectionIdentifier *)self isEqualToICFolderListSectionIdentifier:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToICFolderListSectionIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICFolderListSectionIdentifier *)self sectionType];
  uint64_t v6 = [v4 sectionType];
  BOOL v7 = [(ICFolderListSectionIdentifier *)self accountObjectID];
  if (v7)
  {
    uint64_t v8 = [v4 accountObjectID];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  uint64_t v10 = [(ICFolderListSectionIdentifier *)self accountObjectID];
  if (v10)
  {
    int v11 = 0;
  }
  else
  {
    uint64_t v12 = [v4 accountObjectID];
    int v11 = v12 == 0;
  }
  if (v9)
  {
    uint64_t v13 = [(ICFolderListSectionIdentifier *)self accountObjectID];
    v14 = [v4 accountObjectID];
    v11 |= [v13 isEqual:v14];
  }
  if (v5 == v6) {
    BOOL v15 = v11;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

uint64_t __48__ICFolderListSectionIdentifier_initWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v4 = *(void **)(a1 + 40);
    id v45 = v3;
    uint64_t v5 = [v4 accountSectionTypeForModernAccount:v45];
LABEL_5:
    *(void *)(*(void *)(a1 + 40) + 24) = v5;
    uint64_t v7 = [*(id *)(a1 + 32) objectID];
    uint64_t v8 = *(void *)(a1 + 40);
    BOOL v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    uint64_t v10 = [v45 localizedName];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v10;

    goto LABEL_15;
  }
  if ([v3 conformsToProtocol:&unk_1F0A65758])
  {
    uint64_t v6 = *(void **)(a1 + 40);
    id v45 = *(id *)(a1 + 32);
    uint64_t v5 = [v6 accountSectionTypeForLegacyAccount:v45];
    goto LABEL_5;
  }
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();
  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    id v15 = v14;
    v16 = [v15 account];
    uint64_t v17 = [v16 objectID];
    uint64_t v18 = *(void *)(a1 + 40);
    v19 = *(void **)(v18 + 16);
    *(void *)(v18 + 16) = v17;

    v20 = [v15 account];
    uint64_t v21 = [v20 localizedName];
    uint64_t v22 = *(void *)(a1 + 40);
    v23 = *(void **)(v22 + 32);
    *(void *)(v22 + 32) = v21;

    v24 = *(void **)(a1 + 40);
    *(void *)(*(void *)(a1 + 40) + 24) = [v15 account];
LABEL_14:

    goto LABEL_15;
  }
  if ([v14 conformsToProtocol:&unk_1F0A657B8])
  {
    v25 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    v26 = [v15 account];
    uint64_t v27 = [v25 accountSectionTypeForLegacyAccount:v26];
LABEL_12:
    *(void *)(*(void *)(a1 + 40) + 24) = v27;

    v31 = [v15 account];
    uint64_t v32 = [v31 objectID];
    uint64_t v33 = *(void *)(a1 + 40);
    v34 = *(void **)(v33 + 16);
    *(void *)(v33 + 16) = v32;

    [v15 account];
    uint64_t v35 = [(id)objc_claimAutoreleasedReturnValue() localizedName];
LABEL_13:
    uint64_t v36 = *(void *)(a1 + 40);
    v37 = *(void **)(v36 + 32);
    *(void *)(v36 + 32) = v35;

    goto LABEL_14;
  }
  objc_opt_class();
  char v28 = objc_opt_isKindOfClass();
  v29 = *(void **)(a1 + 32);
  if (v28)
  {
    v30 = *(void **)(a1 + 40);
    id v15 = v29;
    v26 = [v15 account];
    uint64_t v27 = [v30 accountSectionTypeForModernAccount:v26];
    goto LABEL_12;
  }
  if ([v29 conformsToProtocol:&unk_1F0A65818])
  {
    v38 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    v39 = [v15 account];
    *(void *)(*(void *)(a1 + 40) + 24) = [v38 accountSectionTypeForLegacyAccount:v39];

    v40 = [v15 account];
    uint64_t v41 = [v40 objectID];
    uint64_t v42 = *(void *)(a1 + 40);
    v43 = *(void **)(v42 + 16);
    *(void *)(v42 + 16) = v41;

    [v15 account];
    uint64_t v35 = [(id)objc_claimAutoreleasedReturnValue() name];
    goto LABEL_13;
  }
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0) {
    return result;
  }
  *(void *)(*(void *)(a1 + 40) + 24) = 8;
  *(void *)(*(void *)(a1 + 40) + 32) = [MEMORY[0x1E4F83388] localizedSectionTitle];
LABEL_15:
  return MEMORY[0x1F41817F8]();
}

- (int64_t)accountSectionTypeForModernAccount:(id)a3
{
  id v3 = a3;
  if ([v3 accountType] == 3)
  {
    int64_t v4 = 6;
  }
  else if ([v3 isManaged])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 2;
  }

  return v4;
}

- (ICFolderListSectionIdentifier)initWithObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICFolderListSectionIdentifier;
  uint64_t v5 = [(ICFolderListSectionIdentifier *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 managedObjectContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__ICFolderListSectionIdentifier_initWithObject___block_invoke;
    v8[3] = &unk_1E5FD91D0;
    id v9 = v4;
    uint64_t v10 = v5;
    [v6 performBlockAndWait:v8];
  }
  return v5;
}

+ (ICFolderListSectionIdentifier)systemSectionIdentifier
{
  if (systemSectionIdentifier_once[0] != -1) {
    dispatch_once(systemSectionIdentifier_once, &__block_literal_global_9);
  }
  v2 = (void *)systemSectionIdentifier_identifier;
  return (ICFolderListSectionIdentifier *)v2;
}

+ (NSArray)sortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sectionType" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSString)expansionStateContext
{
  unint64_t v3 = [(ICFolderListSectionIdentifier *)self sectionType] - 1;
  if (v3 > 7) {
    id v4 = @"ICFolderListSectionTypeSystem";
  }
  else {
    id v4 = off_1E5FD9940[v3];
  }
  uint64_t v5 = [(ICFolderListSectionIdentifier *)self accountObjectID];
  if (v5)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [(ICFolderListSectionIdentifier *)self accountObjectID];
    uint64_t v8 = [v7 URIRepresentation];
    id v9 = [v8 absoluteString];
    id v4 = [v6 stringWithFormat:@"%@:%@", v4, v9];
  }
  return (NSString *)v4;
}

uint64_t __53__ICFolderListSectionIdentifier_tagSectionIdentifier__block_invoke()
{
  tagSectionIdentifier_identifier = [[ICFolderListSectionIdentifier alloc] initWithSectionType:8];
  return MEMORY[0x1F41817F8]();
}

uint64_t __56__ICFolderListSectionIdentifier_systemSectionIdentifier__block_invoke()
{
  systemSectionIdentifier_identifier = [[ICFolderListSectionIdentifier alloc] initWithSectionType:0];
  return MEMORY[0x1F41817F8]();
}

- (ICFolderListSectionIdentifier)initWithSectionType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICFolderListSectionIdentifier;
  id v4 = [(ICFolderListSectionIdentifier *)&v11 init];
  uint64_t v5 = v4;
  if (v4)
  {
    accountObjectID = v4->_accountObjectID;
    v4->_accountObjectID = 0;
    v4->_sectionType = a3;

    switch(a3)
    {
      case 0:
        title = v5->_title;
        v5->_title = (NSString *)&stru_1F0973378;
        goto LABEL_12;
      case 1:
        uint64_t v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Quick Notes" value:@"Quick Notes" table:0 allowSiri:1];
        goto LABEL_11;
      case 2:
      case 3:
      case 4:
      case 5:
      case 7:
        if ((unint64_t)(a3 - 2) > 5) {
          uint64_t v7 = @"ICFolderListSectionTypeSystem";
        }
        else {
          uint64_t v7 = off_1E5FD9910[a3 - 2];
        }
        return v5;
      case 6:
        uint64_t v9 = [MEMORY[0x1E4F83278] localizedLocalAccountName];
        goto LABEL_11;
      case 8:
        uint64_t v9 = [MEMORY[0x1E4F83388] localizedSectionTitle];
LABEL_11:
        title = v5->_title;
        v5->_title = (NSString *)v9;
LABEL_12:

        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (BOOL)hasHeader
{
  return (unint64_t)([(ICFolderListSectionIdentifier *)self sectionType] - 1) < 8;
}

- (BOOL)isCollapsible
{
  return 1;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(ICFolderListSectionIdentifier *)self sectionType] - 1;
  if (v6 > 7) {
    uint64_t v7 = @"ICFolderListSectionTypeSystem";
  }
  else {
    uint64_t v7 = off_1E5FD9940[v6];
  }
  uint64_t v8 = [(ICFolderListSectionIdentifier *)self accountObjectID];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, sectionType: %@, accountObjectID: %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (int64_t)accountSectionTypeForLegacyAccount:(id)a3
{
  uint64_t v3 = [a3 legacyAccountType];
  int64_t v4 = 7;
  if (v3 == 1) {
    int64_t v4 = 4;
  }
  if (v3 == 2) {
    return 5;
  }
  else {
    return v4;
  }
}

- (void)setAccountObjectID:(id)a3
{
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

@end