@interface PLResourceIdentityXPC
+ (id)dictionaryRepresentationFromResourceIdentity:(id)a3;
+ (id)imageRequestResourceForDataStoreKey:(id)a3 store:(id)a4 assetObjectID:(id)a5 context:(id)a6;
+ (id)possibleClassesInDictionaryRepresentation;
- (BOOL)isOriginalResource;
- (NSString)description;
- (PLResourceIdentityXPC)initWithDictionary:(id)a3;
- (PLResourceIdentityXPC)initWithResource:(id)a3;
- (PLResourceIdentityXPC)initWithResourceType:(unsigned int)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 uti:(id)a6 conformsToTypes:(int64_t)a7;
- (PLUniformTypeIdentifier)uniformTypeIdentifier;
- (unsigned)recipeID;
- (unsigned)resourceType;
- (unsigned)version;
@end

@implementation PLResourceIdentityXPC

- (void).cxx_destruct
{
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (NSString)description
{
  v3 = +[PLResourceRecipe recipeFromID:[(PLResourceIdentityXPC *)self recipeID]];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t resourceType = self->_resourceType;
  if (resourceType > 0x1F) {
    v8 = @"invalid";
  }
  else {
    v8 = off_1E58641E0[resourceType];
  }
  v9 = v8;
  v10 = [(PLUniformTypeIdentifier *)self->_uniformTypeIdentifier identifier];
  v11 = [v4 stringWithFormat:@"<%@ %p> %@, recipe: %@, uti: %@", v6, self, v9, v3, v10];

  return (NSString *)v11;
}

- (BOOL)isOriginalResource
{
  v2 = self;
  if ([(PLResourceIdentityXPC *)v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = ([(PLResourceIdentityXPC *)v2 recipeID] & 1) == 0;
  }

  return v3;
}

- (PLResourceIdentityXPC)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"resourceType"];
  uint64_t v6 = [v5 integerValue];
  v7 = [v4 objectForKeyedSubscript:@"resourceVersion"];
  uint64_t v8 = [v7 integerValue];
  v9 = [v4 objectForKeyedSubscript:@"resourceRecipeID"];
  uint64_t v10 = [v9 integerValue];
  v11 = [v4 objectForKeyedSubscript:@"resourceUniformTypeIdentifier"];
  v12 = [v4 objectForKeyedSubscript:@"conformsToTypes"];

  v13 = -[PLResourceIdentityXPC initWithResourceType:version:recipeID:uti:conformsToTypes:](self, "initWithResourceType:version:recipeID:uti:conformsToTypes:", v6, v8, v10, v11, [v12 integerValue]);
  return v13;
}

- (PLResourceIdentityXPC)initWithResource:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 uniformTypeIdentifier];
    if (!v6) {
      goto LABEL_5;
    }
    v7 = (void *)v6;
    uint64_t v8 = [v5 uniformTypeIdentifier];
    v9 = [v8 identifier];

    if (v9)
    {
      uint64_t v10 = [v5 uniformTypeIdentifier];
      v11 = [v10 identifier];

      v12 = [v5 uniformTypeIdentifier];
      uint64_t v13 = PLResourceConformsToTypesFromUTI(v12);
    }
    else
    {
LABEL_5:
      v14 = PLImageManagerGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        v17 = PLResourceIdentityShortDescription(v5);
        int v21 = 138543618;
        v22 = v16;
        __int16 v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Attempting to create %{public}@ from resource (%{public}@) with missing uniform type identifier, will guess uti from resource type", (uint8_t *)&v21, 0x16u);
      }
      v11 = 0;
      uint64_t v13 = 0;
      switch([v5 resourceType])
      {
        case 0u:
        case 4u:
        case 0xAu:
        case 0xFu:
          v18 = (id *)MEMORY[0x1E4F44400];
          goto LABEL_14;
        case 1u:
        case 3u:
        case 0xBu:
          v18 = (id *)MEMORY[0x1E4F44448];
          goto LABEL_14;
        case 2u:
          v18 = (id *)MEMORY[0x1E4F44330];
          goto LABEL_14;
        case 5u:
        case 6u:
        case 8u:
        case 9u:
        case 0xCu:
        case 0xDu:
        case 0xEu:
        case 0x1Fu:
          v18 = (id *)MEMORY[0x1E4F44408];
          goto LABEL_14;
        case 7u:
          v18 = (id *)MEMORY[0x1E4F44378];
LABEL_14:
          v11 = [*v18 identifier];
          uint64_t v13 = 0;
          break;
        case 0x10u:
        case 0x11u:
        case 0x12u:
        case 0x13u:
        case 0x14u:
        case 0x15u:
        case 0x16u:
        case 0x17u:
        case 0x18u:
        case 0x19u:
        case 0x1Au:
        case 0x1Bu:
        case 0x1Cu:
        case 0x1Du:
        case 0x1Eu:
          break;
        default:
          uint64_t v13 = 0;
          break;
      }
    }
    v19 = -[PLResourceIdentityXPC initWithResourceType:version:recipeID:uti:conformsToTypes:](self, "initWithResourceType:version:recipeID:uti:conformsToTypes:", [v5 resourceType], objc_msgSend(v5, "version"), objc_msgSend(v5, "recipeID"), v11, v13);
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (PLResourceIdentityXPC)initWithResourceType:(unsigned int)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 uti:(id)a6 conformsToTypes:(int64_t)a7
{
  id v11 = a6;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)PLResourceIdentityXPC;
    v12 = [(PLResourceIdentityXPC *)&v17 init];
    uint64_t v13 = v12;
    if (v12)
    {
      v12->_uint64_t resourceType = a3;
      v12->_version = a4;
      v12->_recipeID = a5;
      uint64_t v14 = +[PLUniformTypeIdentifier utiWithIdentifier:v11];
      uniformTypeIdentifier = v13->_uniformTypeIdentifier;
      v13->_uniformTypeIdentifier = (PLUniformTypeIdentifier *)v14;
    }
  }
  else
  {

    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)possibleClassesInDictionaryRepresentation
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  return v5;
}

+ (id)dictionaryRepresentationFromResourceIdentity:(id)a3
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 uniformTypeIdentifier];
  v5 = [v4 identifier];

  if (v5)
  {
    v16[0] = @"resourceType";
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "resourceType"));
    v17[0] = v6;
    v16[1] = @"resourceVersion";
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "version"));
    v17[1] = v7;
    v16[2] = @"resourceRecipeID";
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recipeID"));
    v17[2] = v8;
    v16[3] = @"resourceUniformTypeIdentifier";
    v9 = [v3 uniformTypeIdentifier];
    uint64_t v10 = [v9 identifier];
    v17[3] = v10;
    v16[4] = @"conformsToTypes";
    id v11 = NSNumber;
    v12 = [v3 uniformTypeIdentifier];
    uint64_t v13 = [v11 numberWithInteger:PLResourceConformsToTypesFromUTI(v12)];
    v17[4] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)imageRequestResourceForDataStoreKey:(id)a3 store:(id)a4 assetObjectID:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__103813;
  v31 = __Block_byref_object_dispose__103814;
  id v32 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__PLResourceIdentityXPC_imageRequestResourceForDataStoreKey_store_assetObjectID_context___block_invoke;
  v20[3] = &unk_1E5872A48;
  id v14 = v12;
  id v21 = v14;
  id v15 = v13;
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  id v17 = v11;
  id v24 = v17;
  uint64_t v25 = &v27;
  id v26 = a1;
  [v15 performBlockAndWait:v20];
  id v18 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __89__PLResourceIdentityXPC_imageRequestResourceForDataStoreKey_store_assetObjectID_context___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  id v21 = 0;
  id v3 = [v2 fetchResourcesForAssetVersions:0 allowDerivatives:1 additionalPredicate:0 relationshipKeyPathsForPrefetching:0 error:&v21];
  id v16 = v21;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 dataStoreKey];
        if ([v10 isEqualToKey:*(void *)(a1 + 48)])
        {
          id v11 = [v9 dataStore];
          int v12 = [v11 isEqual:*(void *)(a1 + 56)];

          if (v12)
          {
            uint64_t v13 = [objc_alloc(*(Class *)(a1 + 72)) initWithResource:v9];
            uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
            id v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;

            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }
LABEL_12:
}

@end