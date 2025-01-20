@interface PXNavigationListItem
- (BOOL)isDeletable;
- (BOOL)isDraggable;
- (BOOL)isEmbeddedGlyph;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNavigationListItem:(id)a3;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isGroup;
- (BOOL)isRemovable;
- (BOOL)isRenamable;
- (BOOL)isReorderable;
- (NSString)accessoryGlyphImageName;
- (NSString)accessoryTitle;
- (NSString)badgeString;
- (NSString)containerIdentifier;
- (NSString)description;
- (NSString)glyphImageName;
- (NSString)identifier;
- (NSString)title;
- (NSString)visualDescription;
- (NSURL)fileURL;
- (PHCollection)collection;
- (PXNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5 containerIdentifier:(id)a6;
- (PXProgrammaticNavigationDestination)destination;
- (id)copyWithZone:(_NSZone *)a3;
- (id)representedObject;
- (int64_t)indentationLevel;
- (int64_t)itemCount;
- (int64_t)style;
- (unint64_t)hash;
- (unint64_t)lockState;
- (void)setBadgeString:(id)a3;
- (void)setLockState:(unint64_t)a3;
@end

@implementation PXNavigationListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_badgeString, 0);
  objc_storeStrong((id *)&self->_accessoryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setBadgeString:(id)a3
{
}

- (NSString)badgeString
{
  return self->_badgeString;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXNavigationListItem *)self title];
  v6 = [(PXNavigationListItem *)self identifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title = %@, identifier = %@, indentationLevel = %ld",
    v4,
    self,
    v5,
    v6,
  v7 = [(PXNavigationListItem *)self indentationLevel]);

  v8 = [(PXNavigationListItem *)self containerIdentifier];

  if (v8)
  {
    v9 = [(PXNavigationListItem *)self containerIdentifier];
    [v7 appendFormat:@", containerIdentifier = %@", v9];
  }
  v10 = [(PXNavigationListItem *)self glyphImageName];

  if (v10)
  {
    v11 = [(PXNavigationListItem *)self glyphImageName];
    [v7 appendFormat:@", glyphImageName = %@", v11];
  }
  v12 = [(PXNavigationListItem *)self badgeString];

  if (v12)
  {
    v13 = [(PXNavigationListItem *)self badgeString];
    [v7 appendFormat:@", badgeString = %@", v13];
  }
  unint64_t v14 = [(PXNavigationListItem *)self lockState];
  if (v14 > 2) {
    v15 = @"Unknown";
  }
  else {
    v15 = off_1E5DBA060[v14];
  }
  [v7 appendFormat:@", lockState = %@>", v15];
  return (NSString *)v7;
}

- (unint64_t)hash
{
  v3 = [(PXNavigationListItem *)self identifier];
  uint64_t v4 = [v3 hash];

  v5 = [(PXNavigationListItem *)self title];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(PXNavigationListItem *)self accessoryTitle];
  uint64_t v8 = [v7 hash];

  v9 = [(PXNavigationListItem *)self glyphImageName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(PXNavigationListItem *)self containerIdentifier];
  uint64_t v12 = [v11 hash];

  BOOL v13 = [(PXNavigationListItem *)self isDraggable];
  uint64_t v14 = 2;
  if (!v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v10 ^ v12 ^ v14;
  if ([(PXNavigationListItem *)self isRemovable]) {
    uint64_t v16 = 4;
  }
  else {
    uint64_t v16 = 0;
  }
  BOOL v17 = [(PXNavigationListItem *)self isRenamable];
  uint64_t v18 = 8;
  if (!v17) {
    uint64_t v18 = 0;
  }
  uint64_t v19 = v16 ^ v18;
  BOOL v20 = [(PXNavigationListItem *)self isExpandable];
  uint64_t v21 = 16;
  if (!v20) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v15 ^ v19 ^ v21;
  BOOL v23 = [(PXNavigationListItem *)self isGroup];
  uint64_t v24 = 32;
  if (!v23) {
    uint64_t v24 = 0;
  }
  int64_t v25 = v22 ^ v24 ^ ([(PXNavigationListItem *)self indentationLevel] << 6);
  if ([(PXNavigationListItem *)self isReorderable]) {
    uint64_t v26 = 128;
  }
  else {
    uint64_t v26 = 0;
  }
  BOOL v27 = [(PXNavigationListItem *)self isDeletable];
  uint64_t v28 = 256;
  if (!v27) {
    uint64_t v28 = 0;
  }
  int64_t v29 = v25 ^ v26 ^ v28 ^ ([(PXNavigationListItem *)self style] << 9);
  unint64_t v30 = v29 ^ ([(PXNavigationListItem *)self lockState] << 10);
  v31 = [(PXNavigationListItem *)self collection];
  uint64_t v32 = [v31 hash];

  v33 = [(PXNavigationListItem *)self badgeString];
  uint64_t v34 = v32 ^ [v33 hash];

  v35 = [(PXNavigationListItem *)self destination];
  unint64_t v36 = v30 ^ v34 ^ [v35 hash];

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXNavigationListItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXNavigationListItem *)self isEqualToNavigationListItem:v4];
  }

  return v5;
}

- (BOOL)isEqualToNavigationListItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXNavigationListItem *)self identifier];
  uint64_t v6 = [v4 identifier];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_34;
  }
  id v8 = [(PXNavigationListItem *)self title];
  id v9 = [v4 title];
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    char v11 = [v8 isEqualToString:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_34;
    }
  }
  id v12 = [(PXNavigationListItem *)self accessoryTitle];
  id v13 = [v4 accessoryTitle];
  if (v12 == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    char v15 = [v12 isEqualToString:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_34;
    }
  }
  id v16 = [(PXNavigationListItem *)self glyphImageName];
  id v17 = [v4 glyphImageName];
  if (v16 == v17)
  {
  }
  else
  {
    uint64_t v18 = v17;
    char v19 = [v16 isEqualToString:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_34;
    }
  }
  id v20 = [(PXNavigationListItem *)self containerIdentifier];
  id v21 = [v4 containerIdentifier];
  if (v20 == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    char v23 = [v20 isEqualToString:v21];

    if ((v23 & 1) == 0) {
      goto LABEL_34;
    }
  }
  int v24 = [(PXNavigationListItem *)self isDraggable];
  if (v24 != [v4 isDraggable]) {
    goto LABEL_34;
  }
  int v25 = [(PXNavigationListItem *)self isReorderable];
  if (v25 != [v4 isReorderable]) {
    goto LABEL_34;
  }
  int v26 = [(PXNavigationListItem *)self isRemovable];
  if (v26 != [v4 isRemovable]) {
    goto LABEL_34;
  }
  int v27 = [(PXNavigationListItem *)self isRenamable];
  if (v27 != [v4 isRenamable]) {
    goto LABEL_34;
  }
  int v28 = [(PXNavigationListItem *)self isExpandable];
  if (v28 != [v4 isExpandable]) {
    goto LABEL_34;
  }
  int v29 = [(PXNavigationListItem *)self isDeletable];
  if (v29 != [v4 isDeletable]) {
    goto LABEL_34;
  }
  int v30 = [(PXNavigationListItem *)self isGroup];
  if (v30 != [v4 isGroup]) {
    goto LABEL_34;
  }
  int64_t v31 = [(PXNavigationListItem *)self indentationLevel];
  if (v31 != [v4 indentationLevel]) {
    goto LABEL_34;
  }
  unint64_t v32 = [(PXNavigationListItem *)self lockState];
  if (v32 != [v4 lockState]) {
    goto LABEL_34;
  }
  id v33 = [(PXNavigationListItem *)self collection];
  id v34 = [v4 collection];
  if (v33 == v34)
  {
  }
  else
  {
    v35 = v34;
    char v36 = [v33 isEqual:v34];

    if ((v36 & 1) == 0) {
      goto LABEL_34;
    }
  }
  int64_t v37 = [(PXNavigationListItem *)self style];
  if (v37 != [v4 style])
  {
LABEL_34:
    char v42 = 0;
    goto LABEL_35;
  }
  id v38 = [(PXNavigationListItem *)self badgeString];
  id v39 = [v4 badgeString];
  if (v38 == v39)
  {
  }
  else
  {
    v40 = v39;
    char v41 = [v38 isEqualToString:v39];

    if ((v41 & 1) == 0) {
      goto LABEL_34;
    }
  }
  v44 = [(PXNavigationListItem *)self destination];
  v45 = [v4 destination];
  if (v44 == v45) {
    char v42 = 1;
  }
  else {
    char v42 = [v44 isEqual:v45];
  }

LABEL_35:
  return v42;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(PXNavigationListItem *)self identifier];
  int v7 = [(PXNavigationListItem *)self title];
  int64_t v8 = [(PXNavigationListItem *)self itemCount];
  id v9 = [(PXNavigationListItem *)self containerIdentifier];
  uint64_t v10 = (void *)[v5 initWithIdentifier:v6 title:v7 itemCount:v8 containerIdentifier:v9];

  char v11 = [(PXNavigationListItem *)self accessoryTitle];
  uint64_t v12 = [v11 copyWithZone:a3];
  id v13 = (void *)v10[3];
  v10[3] = v12;

  uint64_t v14 = [(PXNavigationListItem *)self badgeString];
  uint64_t v15 = [v14 copyWithZone:a3];
  id v16 = (void *)v10[4];
  v10[4] = v15;

  v10[5] = [(PXNavigationListItem *)self lockState];
  return v10;
}

- (PXProgrammaticNavigationDestination)destination
{
  return 0;
}

- (NSString)visualDescription
{
  v3 = @" ";
  id v4 = objc_msgSend(&stru_1F00B0030, "stringByPaddingToLength:withString:startingAtIndex:", -[PXNavigationListItem indentationLevel](self, "indentationLevel"), @" ", 0);
  if ([(PXNavigationListItem *)self isExpandable])
  {
    if ([(PXNavigationListItem *)self isExpanded]) {
      v3 = @"▾";
    }
    else {
      v3 = @"▸";
    }
  }
  BOOL v5 = NSString;
  uint64_t v6 = v3;
  int v7 = [(PXNavigationListItem *)self title];
  int64_t v8 = [(PXNavigationListItem *)self accessoryTitle];
  id v9 = [v5 stringWithFormat:@"<%p> %@%@%@ (%@)", self, v4, v6, v7, v8];

  return (NSString *)v9;
}

- (id)representedObject
{
  return 0;
}

- (int64_t)style
{
  return 0;
}

- (PHCollection)collection
{
  return 0;
}

- (int64_t)indentationLevel
{
  return 0;
}

- (BOOL)isExpanded
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isExpandable
{
  return 0;
}

- (BOOL)isRenamable
{
  return 0;
}

- (BOOL)isRemovable
{
  return 0;
}

- (BOOL)isReorderable
{
  return 0;
}

- (BOOL)isDraggable
{
  return 0;
}

- (BOOL)isEmbeddedGlyph
{
  v2 = [(PXNavigationListItem *)self glyphImageName];
  BOOL v3 = +[PXImageUtilities symbolIsEmbeddedGlyph:v2];

  return v3;
}

- (NSURL)fileURL
{
  return 0;
}

- (NSString)accessoryGlyphImageName
{
  return 0;
}

- (NSString)glyphImageName
{
  return 0;
}

- (NSString)accessoryTitle
{
  accessoryTitle = self->_accessoryTitle;
  if (!accessoryTitle)
  {
    int64_t v4 = [(PXNavigationListItem *)self itemCount];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v5 = self->_accessoryTitle;
      self->_accessoryTitle = (NSString *)@" ";
    }
    else
    {
      int64_t v6 = v4;
      BOOL v5 = PLSharedCountFormatter();
      int v7 = [NSNumber numberWithInteger:v6];
      int64_t v8 = [v5 stringFromNumber:v7];
      id v9 = self->_accessoryTitle;
      self->_accessoryTitle = v8;
    }
    accessoryTitle = self->_accessoryTitle;
  }
  return accessoryTitle;
}

- (PXNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5 containerIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PXNavigationListItem;
  id v13 = [(PXNavigationListItem *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    id v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    else {
      uint64_t v18 = &stru_1F00B0030;
    }
    objc_storeStrong((id *)&v13->_title, v18);

    v13->_itemCount = a5;
    uint64_t v19 = [v12 copy];
    containerIdentifier = v13->_containerIdentifier;
    v13->_containerIdentifier = (NSString *)v19;

    v13->_lockState = 0;
  }

  return v13;
}

@end