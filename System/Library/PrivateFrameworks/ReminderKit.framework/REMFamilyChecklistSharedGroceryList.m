@interface REMFamilyChecklistSharedGroceryList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSItemProvider)itemProvider;
- (NSSet)participants;
- (NSURL)URL;
- (REMFamilyChecklistSharedGroceryList)initWithCoder:(id)a3;
- (REMFamilyChecklistSharedGroceryList)initWithListID:(id)a3 participants:(id)a4;
- (REMObjectID)listID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation REMFamilyChecklistSharedGroceryList

- (REMFamilyChecklistSharedGroceryList)initWithListID:(id)a3 participants:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMFamilyChecklistSharedGroceryList;
  v9 = [(REMFamilyChecklistSharedGroceryList *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listID, a3);
    objc_storeStrong((id *)&v10->_participants, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMFamilyChecklistSharedGroceryList *)self listID];
  v6 = [(REMFamilyChecklistSharedGroceryList *)self participants];
  id v7 = [(REMFamilyChecklistSharedGroceryList *)self URL];
  id v8 = [(REMFamilyChecklistSharedGroceryList *)self itemProvider];
  v9 = [v3 stringWithFormat:@"<%@: %p listID: %@, participants: %@, URL: %@ itemProvider: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v5 = [(REMFamilyChecklistSharedGroceryList *)self listID];
  uint64_t v6 = [v4 listID];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMFamilyChecklistSharedGroceryList *)self listID];
    v9 = [v4 listID];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_12;
    }
  }
  v11 = [(REMFamilyChecklistSharedGroceryList *)self participants];
  uint64_t v12 = [v4 participants];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(REMFamilyChecklistSharedGroceryList *)self participants];
    v15 = [v4 participants];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  v17 = [(REMFamilyChecklistSharedGroceryList *)self URL];
  uint64_t v18 = [v4 URL];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    v20 = [(REMFamilyChecklistSharedGroceryList *)self URL];
    v21 = [v4 URL];
    int v22 = [v20 isEqual:v21];

    if (!v22)
    {
LABEL_12:
      char v23 = 0;
      goto LABEL_13;
    }
  }
  v25 = [(REMFamilyChecklistSharedGroceryList *)self itemProvider];
  uint64_t v26 = [v4 itemProvider];
  if (v25 == (void *)v26)
  {
    char v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    v28 = [(REMFamilyChecklistSharedGroceryList *)self itemProvider];
    v29 = [v4 itemProvider];
    char v23 = [v28 isEqual:v29];
  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  v3 = [(REMFamilyChecklistSharedGroceryList *)self listID];
  uint64_t v4 = [v3 hash];
  v5 = [(REMFamilyChecklistSharedGroceryList *)self participants];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(REMFamilyChecklistSharedGroceryList *)self URL];
  uint64_t v8 = [v7 hash];
  v9 = [(REMFamilyChecklistSharedGroceryList *)self itemProvider];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(REMFamilyChecklistSharedGroceryList *)self listID];
  uint64_t v6 = [(REMFamilyChecklistSharedGroceryList *)self participants];
  id v7 = (void *)[v4 initWithListID:v5 participants:v6];

  uint64_t v8 = [(REMFamilyChecklistSharedGroceryList *)self URL];
  [v7 setURL:v8];

  v9 = [(REMFamilyChecklistSharedGroceryList *)self itemProvider];
  [v7 setItemProvider:v9];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistSharedGroceryList)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"participants"];

  unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemProvider"];

  uint64_t v12 = [(REMFamilyChecklistSharedGroceryList *)self initWithListID:v5 participants:v9];
  [(REMFamilyChecklistSharedGroceryList *)v12 setURL:v10];
  [(REMFamilyChecklistSharedGroceryList *)v12 setItemProvider:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMFamilyChecklistSharedGroceryList *)self listID];
  [v4 encodeObject:v5 forKey:@"listID"];

  uint64_t v6 = [(REMFamilyChecklistSharedGroceryList *)self participants];
  [v4 encodeObject:v6 forKey:@"participants"];

  uint64_t v7 = [(REMFamilyChecklistSharedGroceryList *)self URL];
  [v4 encodeObject:v7 forKey:@"URL"];

  id v8 = [(REMFamilyChecklistSharedGroceryList *)self itemProvider];
  [v4 encodeObject:v8 forKey:@"itemProvider"];
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (NSSet)participants
{
  return self->_participants;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_listID, 0);
}

@end