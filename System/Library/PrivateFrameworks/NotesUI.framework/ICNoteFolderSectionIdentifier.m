@interface ICNoteFolderSectionIdentifier
- (BOOL)isEqual:(id)a3;
- (ICNoteFolderSectionIdentifier)init;
- (ICNoteFolderSectionIdentifier)initWithNoteContainerObjectID:(id)a3;
- (NSManagedObjectID)noteContainerObjectID;
- (id)debugDescription;
- (unint64_t)hash;
@end

@implementation ICNoteFolderSectionIdentifier

- (ICNoteFolderSectionIdentifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteFolderSectionIdentifier;
  return [(ICNoteSectionIdentifier *)&v3 initWithNoteSectionType:2];
}

- (ICNoteFolderSectionIdentifier)initWithNoteContainerObjectID:(id)a3
{
  id v5 = a3;
  v6 = [(ICNoteFolderSectionIdentifier *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_noteContainerObjectID, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();

  if (v5 && (int64_t v6 = -[ICNoteSectionIdentifier sectionType](self, "sectionType"), v6 == [v5 sectionType]))
  {
    v7 = [(ICNoteFolderSectionIdentifier *)self noteContainerObjectID];
    v8 = [v5 noteContainerObjectID];
    v9 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v7) {
      v10 = 0;
    }
    else {
      v10 = v7;
    }
    unint64_t v11 = v10;
    if (v9 == v8) {
      v12 = 0;
    }
    else {
      v12 = v8;
    }
    unint64_t v13 = v12;
    v14 = (void *)v13;
    if (v11 | v13)
    {
      if (v11) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        char v16 = 0;
      }
      else {
        char v16 = [(id)v11 isEqual:v13];
      }
    }
    else
    {
      char v16 = 1;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    uint64_t v4 = [(ICNoteSectionIdentifier *)self sectionType];
    id v5 = [(ICNoteFolderSectionIdentifier *)self noteContainerObjectID];
    char v6 = [v5 hash];
    self->_hash = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

    return self->_hash;
  }
  return result;
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  char v6 = NSStringFromICNoteSectionType([(ICNoteSectionIdentifier *)self sectionType]);
  uint64_t v7 = [(ICNoteFolderSectionIdentifier *)self noteContainerObjectID];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, sectionType: %@, noteContainerObjectID: %@>", v5, self, v6, v7];

  return v8;
}

- (NSManagedObjectID)noteContainerObjectID
{
  return self->_noteContainerObjectID;
}

- (void).cxx_destruct
{
}

@end