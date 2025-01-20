@interface REMTemplate
+ (NSString)cdEntityName;
+ (id)cdEntityNameForSavedAttachment;
+ (id)cdEntityNameForSavedReminder;
+ (id)newObjectID;
+ (id)newObjectIDForSavedAttachment;
+ (id)newObjectIDForSavedReminder;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (REMAccountCapabilities)accountCapabilities;
- (REMListBadge)badge;
- (REMStore)store;
- (REMTemplate)initWithStore:(id)a3 storage:(id)a4;
- (REMTemplateSectionContext)sectionContext;
- (REMTemplateStorage)storage;
- (id)debugDescription;
- (id)description;
- (id)optionalObjectID;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMTemplate

- (REMTemplate)initWithStore:(id)a3 storage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTemplate;
  v9 = [(REMTemplate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_storage, a4);
    -[REMTemplateStorage setStoreGenerationIfNeeded:](v10->_storage, "setStoreGenerationIfNeeded:", [v7 storeGeneration]);
  }

  return v10;
}

- (id)optionalObjectID
{
  v2 = [(REMTemplate *)self storage];
  v3 = [v2 optionalObjectID];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [(REMTemplate *)self store];
  uint64_t v6 = [v4 store];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMTemplate *)self store];
    v9 = [v4 store];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMTemplate *)self storage];
  uint64_t v13 = [v4 storage];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMTemplate *)self storage];
    v16 = [v4 storage];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(REMTemplate *)self storage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMTemplate *)self storage];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMTemplate *)self storage];
  uint64_t v6 = [v5 debugDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  v5 = [(REMTemplate *)self storage];
  uint64_t v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMTemplate;
  if (-[REMTemplate respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(REMTemplate *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMTemplate *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (REMAccountCapabilities)accountCapabilities
{
  v2 = [(REMTemplate *)self storage];
  unint64_t v3 = [v2 accountCapabilities];

  return (REMAccountCapabilities *)v3;
}

- (REMListBadge)badge
{
  v2 = [(REMTemplate *)self badgeEmblem];
  if (v2) {
    unint64_t v3 = [[REMListBadge alloc] initWithRawValue:v2];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (REMTemplateSectionContext)sectionContext
{
  unint64_t v3 = [(REMTemplate *)self accountCapabilities];
  int v4 = [v3 supportsSections];

  if (v4) {
    v5 = [[REMTemplateSectionContext alloc] initWithParentTemplate:self];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (id)newObjectID
{
  return +[REMTemplateStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMTemplateStorage objectIDWithUUID:a3];
}

+ (NSString)cdEntityName
{
  return +[REMTemplateStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  v2 = [(REMTemplate *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

+ (id)cdEntityNameForSavedReminder
{
  return @"REMCDSavedReminder";
}

+ (id)newObjectIDForSavedReminder
{
  char v3 = [MEMORY[0x1E4F29128] UUID];
  int v4 = [a1 cdEntityNameForSavedReminder];
  v5 = +[REMObjectID objectIDWithUUID:v3 entityName:v4];

  return v5;
}

+ (id)cdEntityNameForSavedAttachment
{
  return @"REMCDSavedAttachment";
}

+ (id)newObjectIDForSavedAttachment
{
  char v3 = [MEMORY[0x1E4F29128] UUID];
  int v4 = [a1 cdEntityNameForSavedAttachment];
  v5 = +[REMObjectID objectIDWithUUID:v3 entityName:v4];

  return v5;
}

- (REMStore)store
{
  return self->_store;
}

- (REMTemplateStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end