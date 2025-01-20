@interface REMListSectionStorage
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (NSString)canonicalName;
- (REMListSectionStorage)initWithCoder:(id)a3;
- (REMListSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6;
- (id)cdKeyToStorageKeyMap;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCanonicalName:(id)a3;
- (void)setListID:(id)a3;
@end

@implementation REMListSectionStorage

- (void)setListID:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)REMListSectionStorage;
  [(REMBaseSectionStorage *)&v3 setParentID:a3];
}

- (REMListSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)REMListSectionStorage;
  return [(REMBaseSectionStorage *)&v7 initWithObjectID:a3 accountID:a4 parentID:a5 displayName:a6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMListSectionStorage;
  id v4 = [(REMBaseSectionStorage *)&v7 copyWithZone:a3];
  v5 = [(REMListSectionStorage *)self canonicalName];
  [v4 setCanonicalName:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMListSectionStorage;
  if ([(REMBaseSectionStorage *)&v13 isEqual:v4])
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(REMListSectionStorage *)self canonicalName];
      uint64_t v7 = [v5 canonicalName];
      if (v6 == (void *)v7)
      {
        char v11 = 1;
        v8 = v6;
      }
      else
      {
        v8 = (void *)v7;
        v9 = [(REMListSectionStorage *)self canonicalName];
        v10 = [v5 canonicalName];
        char v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListSectionStorage)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMListSectionStorage;
  id v3 = a3;
  id v4 = [(REMBaseSectionStorage *)&v7 initWithCoder:v3];
  id v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"canonicalName", v7.receiver, v7.super_class);

  [(REMListSectionStorage *)v4 setCanonicalName:v5];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMListSectionStorage;
  id v4 = a3;
  [(REMBaseSectionStorage *)&v6 encodeWithCoder:v4];
  id v5 = [(REMListSectionStorage *)self canonicalName];
  [v4 encodeObject:v5 forKey:@"canonicalName"];
}

+ (id)cdEntityName
{
  return @"REMCDListSection";
}

- (id)cdKeyToStorageKeyMap
{
  if (cdListSectionKeyToStorageKeyMap_onceToken != -1) {
    dispatch_once(&cdListSectionKeyToStorageKeyMap_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)cdListSectionKeyToStorageKeyMap_mapping;

  return v2;
}

- (NSString)canonicalName
{
  return self->canonicalName;
}

- (void)setCanonicalName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end