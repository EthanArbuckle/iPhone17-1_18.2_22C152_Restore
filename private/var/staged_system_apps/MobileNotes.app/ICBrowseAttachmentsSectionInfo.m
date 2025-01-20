@interface ICBrowseAttachmentsSectionInfo
- (ICBrowseAttachmentsSectionInfo)initWithSectionInfo:(id)a3 name:(id)a4 additionalObjects:(id)a5 sortDescriptors:(id)a6;
- (NSArray)objects;
- (NSString)indexTitle;
- (NSString)name;
- (unint64_t)numberOfObjects;
@end

@implementation ICBrowseAttachmentsSectionInfo

- (ICBrowseAttachmentsSectionInfo)initWithSectionInfo:(id)a3 name:(id)a4 additionalObjects:(id)a5 sortDescriptors:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ICBrowseAttachmentsSectionInfo;
  v15 = [(ICBrowseAttachmentsSectionInfo *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sectionInfo, a3);
    v17 = (NSString *)[v12 copy];
    name = v16->_name;
    v16->_name = v17;

    objc_storeStrong((id *)&v16->_additionalObjects, a5);
    v19 = [v11 objects];
    if (v19)
    {
      v20 = [v11 objects];
      v21 = [v13 allObjects];
      v22 = [v20 arrayByAddingObjectsFromArray:v21];
    }
    else
    {
      v22 = [v13 allObjects];
    }

    uint64_t v23 = [v22 sortedArrayUsingDescriptors:v14];
    sortedObjects = v16->_sortedObjects;
    v16->_sortedObjects = (NSArray *)v23;
  }
  return v16;
}

- (unint64_t)numberOfObjects
{
  return [(NSArray *)self->_sortedObjects count];
}

- (NSArray)objects
{
  return self->_sortedObjects;
}

- (NSString)name
{
  name = [(NSFetchedResultsSectionInfo *)self->_sectionInfo name];
  v4 = name;
  if (!name)
  {
    if (self->_name) {
      name = (__CFString *)self->_name;
    }
    else {
      name = &stru_10063F3D8;
    }
  }
  v5 = name;

  return v5;
}

- (NSString)indexTitle
{
  v2 = [(NSFetchedResultsSectionInfo *)self->_sectionInfo indexTitle];
  v3 = v2;
  if (!v2) {
    v2 = &stru_10063F3D8;
  }
  v4 = v2;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedObjects, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);

  objc_storeStrong((id *)&self->_additionalObjects, 0);
}

@end