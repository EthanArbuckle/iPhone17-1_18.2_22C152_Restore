@interface PXNewSearchToken
+ (id)_iconForSearchUserCategory:(unint64_t)a3;
+ (id)_imagewithSymbolName:(id)a3;
+ (id)px_oneYearAgoSearchToken;
+ (id)px_searchTokenForHashtag:(id)a3;
+ (id)socialGroupDisplayText;
+ (id)symbolNameForSearchUserCategory:(unint64_t)a3;
+ (id)unnamedPersonDisplayText;
+ (id)unnamedPetDisplayText;
+ (unint64_t)_searchUserCategoryForSearchTokenCategory:(unint64_t)a3;
- (BOOL)hasLeadingHashtag;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToToken:(id)a3;
- (BOOL)isPersistable;
- (BOOL)isSocialGroup;
- (BOOL)isUnnamedPersonOrPet;
- (NSAttributedString)attributedTitle;
- (NSString)identifier;
- (NSString)priorityAssetUUID;
- (PSIQueryToken)queryToken;
- (PXNewSearchToken)init;
- (PXNewSearchToken)initWithAttributedTitle:(id)a3 queryToken:(id)a4 type:(unint64_t)a5 priorityAssetUUID:(id)a6;
- (PXNewSearchToken)initWithDictionaryRepresentation:(id)a3;
- (PXNewSearchToken)initWithSearchText:(id)a3 searchCategory:(unint64_t)a4;
- (PXNewSearchToken)initWithTitle:(id)a3 queryToken:(id)a4 type:(unint64_t)a5 priorityAssetUUID:(id)a6;
- (UIImage)icon;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)searchUserCategory;
- (unint64_t)type;
- (void)setSearchUserCategory:(unint64_t)a3;
@end

@implementation PXNewSearchToken

+ (id)px_searchTokenForHashtag:(id)a3
{
  id v3 = a3;
  v4 = [@"#" stringByAppendingString:v3];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F8ACC8]) initWithText:v3 userCategory:0 matchType:1];

  v6 = [[PXNewSearchToken alloc] initWithTitle:v4 queryToken:v5 type:1 priorityAssetUUID:0];
  return v6;
}

+ (id)px_oneYearAgoSearchToken
{
  v2 = PXLocalizedStringFromTable(@"SEARCH_SUGGESTION_LAST_YEAR", @"PhotosUICore");
  id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1102];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F8ACC8]) initWithText:v2 userCategory:8 searchedCategories:v3 matchType:2];
  v5 = [[PXNewSearchToken alloc] initWithTitle:v2 queryToken:v4 type:1 priorityAssetUUID:0];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_queryToken, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (PSIQueryToken)queryToken
{
  return self->_queryToken;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setSearchUserCategory:(unint64_t)a3
{
  self->_searchUserCategory = a3;
}

- (unint64_t)searchUserCategory
{
  return self->_searchUserCategory;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), self];
  v14[0] = v3;
  v4 = [NSString stringWithFormat:@"identifier: %@", self->_identifier];
  v14[1] = v4;
  v5 = [NSString stringWithFormat:@"attributedTitle: %@", self->_attributedTitle];
  v14[2] = v5;
  v6 = [NSString stringWithFormat:@"priorityAssetUUID: %@", self->_priorityAssetUUID];
  v14[3] = v6;
  v7 = [NSString stringWithFormat:@"icon: %@", self->_icon];
  v14[4] = v7;
  v8 = [NSString stringWithFormat:@"queryToken: %@", self->_queryToken];
  v14[5] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];

  v10 = NSString;
  v11 = [v9 componentsJoinedByString:@", "];
  v12 = [v10 stringWithFormat:@"<%@>", v11];

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(PXNewSearchToken *)self attributedTitle];
  v4 = [v3 string];
  uint64_t v5 = [v4 hash];
  v6 = [(PXNewSearchToken *)self queryToken];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqualToToken:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 218, @"%@ should be an instance inheriting from %@, but it is %@", @"otherToken", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 218, @"%@ should be an instance inheriting from %@, but it is nil", @"otherToken", v18 object file lineNumber description];
  }

LABEL_3:
  v6 = [(PXNewSearchToken *)self attributedTitle];
  id v7 = [v6 string];

  v8 = [v5 attributedTitle];
  v9 = [v8 string];

  id v10 = v9;
  if (v7 == v10)
  {
  }
  else
  {
    int v11 = [v7 isEqualToString:v10];

    if (!v11)
    {
      char v12 = 0;
      goto LABEL_11;
    }
  }
  v13 = [(PXNewSearchToken *)self queryToken];
  v14 = [v5 queryToken];
  if (v13 == v14) {
    char v12 = 1;
  }
  else {
    char v12 = [v13 isEqual:v14];
  }

LABEL_11:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXNewSearchToken *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PXNewSearchToken *)self isEqualToToken:v4];
  }

  return v5;
}

- (BOOL)isSocialGroup
{
  v2 = [(PXNewSearchToken *)self queryToken];
  BOOL v3 = [v2 userCategory] == 5;

  return v3;
}

- (BOOL)isUnnamedPersonOrPet
{
  v4 = [(PXNewSearchToken *)self queryToken];
  uint64_t v5 = [v4 userCategory];
  if (v5 == 1
    || ([(PXNewSearchToken *)self queryToken],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 userCategory] == 6))
  {
    v6 = [(PXNewSearchToken *)self attributedTitle];
    id v7 = [v6 string];
    v8 = +[PXNewSearchToken unnamedPersonDisplayText];
    char v9 = [v7 isEqualToString:v8];

    if (v5 == 1) {
      goto LABEL_7;
    }
  }
  else
  {
    char v9 = 0;
  }

LABEL_7:
  return v9;
}

- (BOOL)hasLeadingHashtag
{
  v2 = [(PXNewSearchToken *)self attributedTitle];
  BOOL v3 = [v2 string];

  if ([v3 length]) {
    BOOL v4 = [v3 characterAtIndex:0] == 35;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isPersistable
{
  if ([(PXNewSearchToken *)self isUnnamedPersonOrPet]) {
    return 0;
  }
  else {
    return ![(PXNewSearchToken *)self isSocialGroup];
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PXNewSearchToken *)self isPersistable])
  {
    queryToken = self->_queryToken;
    id v9 = 0;
    BOOL v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:queryToken requiringSecureCoding:1 error:&v9];
    uint64_t v5 = v9;
    if (!v4) {
      PXAssertGetLog();
    }
    v10[0] = @"title";
    v6 = [(NSAttributedString *)self->_attributedTitle string];
    v10[1] = @"queryRepresentedObject";
    v11[0] = v6;
    v11[1] = v4;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    uint64_t v5 = PLPhotosSearchGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Attempted to get dictionaryRepresentation for search token which isn't persistable: %@", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (PXNewSearchToken)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 122, @"Invalid parameter not satisfying: %@", @"dict" object file lineNumber description];
  }
  v6 = [v5 objectForKeyedSubscript:@"title"];
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 125, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  id v7 = [v5 objectForKeyedSubscript:@"queryRepresentedObject"];
  id v15 = 0;
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v15];
  id v9 = v15;
  if (!v8) {
    PXAssertGetLog();
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  int v11 = [(PXNewSearchToken *)self initWithAttributedTitle:v10 queryToken:v8 type:1 priorityAssetUUID:0];

  return v11;
}

- (PXNewSearchToken)initWithSearchText:(id)a3 searchCategory:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = +[PXNewSearchToken _searchUserCategoryForSearchTokenCategory:a4];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F8ACC8]) initWithText:v6 userCategory:v7 matchType:2];
  id v9 = [(PXNewSearchToken *)self initWithTitle:v6 queryToken:v8 type:1 priorityAssetUUID:0];

  return v9;
}

- (PXNewSearchToken)initWithTitle:(id)a3 queryToken:(id)a4 type:(unint64_t)a5 priorityAssetUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 62, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 63, @"Invalid parameter not satisfying: %@", @"queryToken" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
  id v15 = [(PXNewSearchToken *)self initWithAttributedTitle:v14 queryToken:v12 type:a5 priorityAssetUUID:v13];

  return v15;
}

- (PXNewSearchToken)initWithAttributedTitle:(id)a3 queryToken:(id)a4 type:(unint64_t)a5 priorityAssetUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 42, @"Invalid parameter not satisfying: %@", @"attributedTitle" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PXNewSearchToken.m", 43, @"Invalid parameter not satisfying: %@", @"queryToken" object file lineNumber description];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PXNewSearchToken;
  uint64_t v14 = [(PXNewSearchToken *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    attributedTitle = v14->_attributedTitle;
    v14->_attributedTitle = (NSAttributedString *)v15;

    objc_storeStrong((id *)&v14->_queryToken, a4);
    v14->_type = a5;
    v14->_count = [v12 resultCount];
    uint64_t v17 = [v13 copy];
    priorityAssetUUID = v14->_priorityAssetUUID;
    v14->_priorityAssetUUID = (NSString *)v17;

    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "_iconForSearchUserCategory:", objc_msgSend(v12, "userCategory"));
    icon = v14->_icon;
    v14->_icon = (UIImage *)v19;

    v21 = NSString;
    v22 = [v11 string];
    uint64_t v23 = [v21 stringWithFormat:@"%@/%lu", v22, objc_msgSend(v12, "hash")];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v23;

    v14->_searchUserCategory = [v12 userCategory];
  }

  return v14;
}

- (PXNewSearchToken)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXNewSearchToken.m", 36, @"%s is not available as initializer", "-[PXNewSearchToken init]");

  abort();
}

+ (id)_imagewithSymbolName:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PXImageUtilities symbolIsEmbeddedGlyph:v3];
  id v5 = (void *)MEMORY[0x1E4FB1818];
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
    unint64_t v7 = [v5 imageNamed:v3 inBundle:v6];
  }
  else
  {
    unint64_t v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:v3];
  }

  return v7;
}

+ (id)_iconForSearchUserCategory:(unint64_t)a3
{
  BOOL v4 = [(id)objc_opt_class() symbolNameForSearchUserCategory:a3];
  id v5 = [a1 _imagewithSymbolName:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 _imagewithSymbolName:@"magnifyingglass"];
  }
  v8 = v7;

  return v8;
}

+ (id)symbolNameForSearchUserCategory:(unint64_t)a3
{
  if (a3 > 0x26) {
    return @"square.stack.3d.down.dottedline";
  }
  else {
    return off_1E5DC6768[a3];
  }
}

+ (id)socialGroupDisplayText
{
  return PXLocalizedStringFromTable(@"SEARCH_SOCIAL_GROUP_TITLE", @"PhotosUICore");
}

+ (id)unnamedPetDisplayText
{
  return PXLocalizedStringFromTable(@"SEARCH_UNNAMED_PET_SEARCH_TOKEN_TITLE", @"PhotosUICore");
}

+ (id)unnamedPersonDisplayText
{
  return PXLocalizedStringFromTable(@"SEARCH_UNNAMED_PERSON_SEARCH_TOKEN_TITLE", @"PhotosUICore");
}

+ (unint64_t)_searchUserCategoryForSearchTokenCategory:(unint64_t)a3
{
  if (a3 >= 0x26)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PXNewSearchToken.m" lineNumber:116 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return qword_1AB35BD20[a3];
}

@end