@interface PXPlacesMapThumbnailLocationCurator
- (Class)locationCuratorClass;
- (PXPlacesMapThumbnailLocationCurator)init;
- (PXPlacesMapThumbnailLocationCurator)initWithLocationCuratorClass:(Class)a3 curatedThumbnailsLimit:(unint64_t)a4;
- (id)curatedGeotaggableFromSet:(id)a3;
- (unint64_t)curatedThumbnailsLimit;
@end

@implementation PXPlacesMapThumbnailLocationCurator

- (void).cxx_destruct
{
}

- (unint64_t)curatedThumbnailsLimit
{
  return self->_curatedThumbnailsLimit;
}

- (Class)locationCuratorClass
{
  return self->_locationCuratorClass;
}

- (id)curatedGeotaggableFromSet:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v5 = [a3 array];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v15 handleFailureInMethod:a2, self, @"PXPlacesMapThumbnailLocationCurator.m", 62, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"geotaggableSet.array", v17, v18 object file lineNumber description];
    }
    v6 = [v5 firstObject];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
        [v19 handleFailureInMethod:a2, self, @"PXPlacesMapThumbnailLocationCurator.m", 68, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assets.firstObject", v21, v22 object file lineNumber description];
      }
      v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
      v23[0] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      v9 = [v5 sortedArrayUsingDescriptors:v8];

      unint64_t v10 = [(PXPlacesMapThumbnailLocationCurator *)self curatedThumbnailsLimit];
      id v11 = v9;
      v12 = v11;
      if (v10 && [v11 count] > v10)
      {
        objc_msgSend(v12, "subarrayWithRange:", 0, v10);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v13 = v12;
      }

      PXMap();
    }
  }
  return 0;
}

uint64_t __65__PXPlacesMapThumbnailLocationCurator_curatedGeotaggableFromSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (PXPlacesMapThumbnailLocationCurator)initWithLocationCuratorClass:(Class)a3 curatedThumbnailsLimit:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapThumbnailLocationCurator;
  v6 = [(PXPlacesMapThumbnailLocationCurator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationCuratorClass, a3);
    v7->_curatedThumbnailsLimit = a4;
  }
  return v7;
}

- (PXPlacesMapThumbnailLocationCurator)init
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F8E7F8] fetchLimit];
  return [(PXPlacesMapThumbnailLocationCurator *)self initWithLocationCuratorClass:v3 curatedThumbnailsLimit:v4];
}

@end