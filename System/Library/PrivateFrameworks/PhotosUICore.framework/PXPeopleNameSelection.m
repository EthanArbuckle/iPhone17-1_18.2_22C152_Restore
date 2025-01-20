@interface PXPeopleNameSelection
- (CNContact)contact;
- (NSString)fullName;
- (NSString)localizedName;
- (NSString)name;
- (PXPeopleNameSelection)initWithContact:(id)a3;
- (PXPeopleNameSelection)initWithName:(id)a3;
- (PXPeopleNameSelection)initWithName:(id)a3 contact:(id)a4 person:(id)a5 type:(unint64_t)a6;
- (PXPeopleNameSelection)initWithSelectedPerson:(id)a3;
- (PXPerson)person;
- (id)_selectionTypeString;
- (id)description;
- (unint64_t)selectionType;
- (void)setLinkedPerson:(id)a3;
@end

@implementation PXPeopleNameSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (NSString)name
{
  return self->_name;
}

- (CNContact)contact
{
  return self->_contact;
}

- (PXPerson)person
{
  return self->_person;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (id)_selectionTypeString
{
  unint64_t v2 = [(PXPeopleNameSelection *)self selectionType];
  if (v2 - 1 > 2) {
    return @"PXPeopleNameSelectionTypeNone";
  }
  else {
    return off_1E5DC7490[v2 - 1];
  }
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleNameSelection;
  v3 = [(PXPeopleNameSelection *)&v11 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(PXPeopleNameSelection *)self _selectionTypeString];
  [v4 appendFormat:@": selectionType: %@, ", v5];

  v6 = [(PXPeopleNameSelection *)self person];
  [v4 appendFormat:@"person: %@, ", v6];

  v7 = [(PXPeopleNameSelection *)self contact];
  [v4 appendFormat:@"contact: %@, ", v7];

  v8 = [(PXPeopleNameSelection *)self name];
  [v4 appendFormat:@"name: %@, ", v8];

  v9 = [(PXPeopleNameSelection *)self localizedName];
  [v4 appendFormat:@"localizedName: %@", v9];

  return v4;
}

- (NSString)fullName
{
  unint64_t v3 = [(PXPeopleNameSelection *)self selectionType];
  switch(v3)
  {
    case 1uLL:
      v5 = [(PXPeopleNameSelection *)self person];
      v4 = [v5 name];

      break;
    case 2uLL:
      v6 = (void *)MEMORY[0x1E4F391F0];
      v7 = [(PXPeopleNameSelection *)self contact];
      v4 = [v6 fullNameFromContact:v7];

      break;
    case 3uLL:
      v4 = [(PXPeopleNameSelection *)self name];
      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (NSString)localizedName
{
  unint64_t v3 = [(PXPeopleNameSelection *)self selectionType];
  switch(v3)
  {
    case 1uLL:
      v5 = [(PXPeopleNameSelection *)self person];
      v4 = objc_msgSend(v5, "px_localizedName");
LABEL_11:

      break;
    case 2uLL:
      v5 = [(PXPeopleNameSelection *)self contact];
      v6 = objc_msgSend(MEMORY[0x1E4F391F0], "px_localizedNameFromContact:", v5);
      if ([v6 length])
      {
        id v7 = v6;
      }
      else
      {
        id v7 = [MEMORY[0x1E4F391F0] fullNameFromContact:v5];
      }
      v4 = v7;

      goto LABEL_11;
    case 3uLL:
      v4 = [(PXPeopleNameSelection *)self name];
      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (void)setLinkedPerson:(id)a3
{
  id v5 = a3;
  if ([(PXPeopleNameSelection *)self selectionType] == 2) {
    objc_storeStrong((id *)&self->_person, a3);
  }
}

- (PXPeopleNameSelection)initWithName:(id)a3 contact:(id)a4 person:(id)a5 type:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleNameSelection;
  v14 = [(PXPeopleNameSelection *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_contact, a4);
    objc_storeStrong((id *)&v15->_person, a5);
    v15->_selectionType = a6;
  }

  return v15;
}

- (PXPeopleNameSelection)initWithSelectedPerson:(id)a3
{
  return [(PXPeopleNameSelection *)self initWithName:0 contact:0 person:a3 type:1];
}

- (PXPeopleNameSelection)initWithContact:(id)a3
{
  return [(PXPeopleNameSelection *)self initWithName:0 contact:a3 person:0 type:2];
}

- (PXPeopleNameSelection)initWithName:(id)a3
{
  return [(PXPeopleNameSelection *)self initWithName:a3 contact:0 person:0 type:3];
}

@end