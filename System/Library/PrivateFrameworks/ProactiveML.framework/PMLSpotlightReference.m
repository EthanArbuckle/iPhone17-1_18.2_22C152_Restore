@interface PMLSpotlightReference
+ (id)referenceWithBundleId:(id)a3 domainId:(id)a4 itemIds:(id)a5;
- (NSArray)itemIdentifiers;
- (NSString)bundleIdentifier;
- (NSString)domainIdentifier;
- (PMLSpotlightReference)initWithBundleId:(id)a3 domainId:(id)a4 itemIds:(id)a5;
@end

@implementation PMLSpotlightReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (PMLSpotlightReference)initWithBundleId:(id)a3 domainId:(id)a4 itemIds:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PMLTraining.m", 39, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PMLTraining.m", 40, @"Invalid parameter not satisfying: %@", @"itemIds" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PMLSpotlightReference;
  v14 = [(PMLSpotlightReference *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v15->_domainIdentifier, a4);
    objc_storeStrong((id *)&v15->_itemIdentifiers, a5);
  }

  return v15;
}

+ (id)referenceWithBundleId:(id)a3 domainId:(id)a4 itemIds:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithBundleId:v10 domainId:v9 itemIds:v8];

  return v11;
}

@end