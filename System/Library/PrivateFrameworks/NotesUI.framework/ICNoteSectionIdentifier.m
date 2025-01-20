@interface ICNoteSectionIdentifier
+ (NSArray)sortDescriptors;
+ (NSDictionary)titles;
- (BOOL)containsRelevantIdentifiers;
- (BOOL)isCollapsible;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICNoteSectionIdentifier:(id)a3;
- (ICNoteSectionIdentifier)initWithNoteSectionType:(int64_t)a3;
- (NSString)debugDescription;
- (NSString)expansionStateContext;
- (NSString)title;
- (int64_t)sectionType;
- (unint64_t)hash;
- (void)setSectionType:(int64_t)a3;
@end

@implementation ICNoteSectionIdentifier

- (BOOL)containsRelevantIdentifiers
{
  return ([(ICNoteSectionIdentifier *)self sectionType] & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICNoteSectionIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v6 = ICDynamicCast();
    BOOL v7 = [(ICNoteSectionIdentifier *)self isEqualToICNoteSectionIdentifier:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToICNoteSectionIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICNoteSectionIdentifier *)self sectionType];
  uint64_t v6 = [v4 sectionType];

  return v5 == v6;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    uint64_t v4 = [(ICNoteSectionIdentifier *)self sectionType];
    unint64_t result = ICHashWithHashKeys(v4, v5, v6, v7, v8, v9, v10, v11, 0);
  }
  self->_hash = result;
  return result;
}

+ (NSArray)sortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sectionType" ascending:1];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSString)expansionStateContext
{
  int64_t v2 = [(ICNoteSectionIdentifier *)self sectionType];
  if ((unint64_t)(v2 - 1) > 6) {
    return (NSString *)@"ICNoteSectionTypeTags";
  }
  else {
    return &off_1E5FD9A70[v2 - 1]->isa;
  }
}

- (ICNoteSectionIdentifier)initWithNoteSectionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteSectionIdentifier;
  unint64_t result = [(ICNoteSectionIdentifier *)&v5 init];
  if (result) {
    result->_sectionType = a3;
  }
  return result;
}

+ (NSDictionary)titles
{
  if (titles_onceToken != -1) {
    dispatch_once(&titles_onceToken, &__block_literal_global_10);
  }
  int64_t v2 = (void *)titles_titles;
  return (NSDictionary *)v2;
}

void __33__ICNoteSectionIdentifier_titles__block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v7[0] = &stru_1F0973378;
  v6[0] = &unk_1F09A4100;
  v6[1] = &unk_1F09A4118;
  v0 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Invitations" value:@"Invitations" table:0 allowSiri:1];
  v7[1] = v0;
  v6[2] = &unk_1F09A4130;
  v1 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Folders" value:@"Folders" table:0 allowSiri:1];
  v7[2] = v1;
  v6[3] = &unk_1F09A4148;
  int64_t v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Pinned" value:@"Pinned" table:0 allowSiri:1];
  v7[3] = v2;
  v6[4] = &unk_1F09A4160;
  v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes" value:@"Notes" table:0 allowSiri:1];
  v7[4] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  objc_super v5 = (void *)titles_titles;
  titles_titles = v4;
}

- (NSString)title
{
  v3 = [(id)objc_opt_class() titles];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICNoteSectionIdentifier sectionType](self, "sectionType"));
  objc_super v5 = [v3 objectForKeyedSubscript:v4];

  return (NSString *)v5;
}

- (BOOL)isCollapsible
{
  return (unint64_t)([(ICNoteSectionIdentifier *)self sectionType] - 1) < 3;
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(ICNoteSectionIdentifier *)self sectionType];
  if ((unint64_t)(v5 - 1) > 6) {
    uint64_t v6 = @"ICNoteSectionTypeTags";
  }
  else {
    uint64_t v6 = off_1E5FD9A70[v5 - 1];
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p> sectionType: %@", v4, self, v6];
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

@end