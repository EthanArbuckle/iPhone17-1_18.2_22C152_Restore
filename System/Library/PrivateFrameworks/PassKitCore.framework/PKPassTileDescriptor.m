@interface PKPassTileDescriptor
+ (id)createWithPassDictionary:(id)a3 privateDictionary:(id)a4;
+ (uint64_t)_createConcreteTilesForDictionaries:(void *)a3 privateDictionaryMap:(uint64_t)a4 context:;
- (BOOL)isDefaultEnabled;
- (NSArray)childDescriptors;
- (NSDictionary)states;
- (NSString)defaultStateIdentifier;
- (PKPassTileDescriptor)init;
- (PKPassTileMetadata)metadata;
- (id)_init;
- (id)_initWithMetadata:(void *)a3 dictionary:(void *)a4 privateDictionary:;
- (id)createTileForState:(id)a3 childTiles:(id)a4 withBundle:(id)a5 privateBundle:(id)a6;
- (void)setChildDescriptors:(id)a3;
- (void)setDefaultEnabled:(BOOL)a3;
- (void)setDefaultStateIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setStates:(id)a3;
@end

@implementation PKPassTileDescriptor

+ (id)createWithPassDictionary:(id)a3 privateDictionary:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 PKArrayForKey:@"tilesV2"];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 PKArrayForKey:@"tiles"];
  }
  v10 = v9;

  v11 = off_1E56D5000;
  id v51 = +[PKPassTileMetadata _createDictionaryMapForDictionaries:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [v5 PKArrayForKey:@"tilesV2"];
  if ([v13 count])
  {
    v43 = v10;
    id v44 = v6;
    id v45 = v5;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v60;
      id v47 = v14;
      id v48 = v12;
      uint64_t v46 = *(void *)v60;
      do
      {
        uint64_t v18 = 0;
        uint64_t v49 = v16;
        do
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v53 = v18;
          v19 = *(void **)(*((void *)&v59 + 1) + 8 * v18);
          v20 = objc_msgSend(v19, "PKStringForKey:", @"context", v43, v44, v45);
          uint64_t v21 = PKPassTileContextFromString(v20);

          if (v21)
          {
            id v22 = [v19 PKArrayForKey:@"groups"];
            id v58 = v51;
            uint64_t v57 = self;
            v52 = v22;
            if ([v22 count])
            {
              id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v23 = v22;
              uint64_t v24 = [v23 countByEnumeratingWithState:&v64 objects:v69 count:16];
              v25 = v58;
              if (v24)
              {
                uint64_t v26 = v24;
                uint64_t v27 = *(void *)v65;
                uint64_t v55 = *(void *)v65;
                id v56 = v23;
                do
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v65 != v27) {
                      objc_enumerationMutation(v23);
                    }
                    v29 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                    v63 = 0;
                    v30 = (void *)[(__objc2_class *)v11[215] _createWithDictionary:v29 privateDictionaryMap:v25 privateDictionary:&v63 context:v21];
                    v31 = v30;
                    if (v30 && [v30 isGroupType])
                    {
                      v32 = [PKPassTileDescriptor alloc];
                      id v33 = -[PKPassTileDescriptor _initWithMetadata:dictionary:privateDictionary:](v32, v31, v29, v63);
                      if (v33)
                      {
                        v34 = v11;
                        v35 = [v29 PKArrayForKey:@"tiles"];
                        v36 = (void *)+[PKPassTileDescriptor _createConcreteTilesForDictionaries:privateDictionaryMap:context:](v57, v35, v25, v21);
                        [v33 setChildDescriptors:v36];

                        v37 = [v33 childDescriptors];
                        uint64_t v38 = [v37 count];

                        if (v38) {
                          [v54 addObject:v33];
                        }

                        v11 = v34;
                        v25 = v58;
                        uint64_t v27 = v55;
                        id v23 = v56;
                      }
                    }
                  }
                  uint64_t v26 = [v23 countByEnumeratingWithState:&v64 objects:v69 count:16];
                }
                while (v26);
              }

              if ([v54 count]) {
                v39 = (void *)[v54 copy];
              }
              else {
                v39 = 0;
              }
              id v14 = v47;
              id v12 = v48;
              uint64_t v17 = v46;
              uint64_t v16 = v49;
            }
            else
            {
              v39 = 0;
            }

            objc_msgSend(v12, "pk_safelyAddObjectsFromArray:", v39);
          }
          uint64_t v18 = v53 + 1;
        }
        while (v53 + 1 != v16);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v16);
    }

    id v6 = v44;
    id v5 = v45;
    v10 = v43;
    goto LABEL_37;
  }
  id v14 = [v5 PKArrayForKey:@"tiles"];

  if ([v14 count])
  {
    v40 = (void *)+[PKPassTileDescriptor _createConcreteTilesForDictionaries:privateDictionaryMap:context:]((uint64_t)a1, v14, v51, 1);
    objc_msgSend(v12, "pk_safelyAddObjectsFromArray:", v40);

LABEL_37:
    id v41 = v12;
    goto LABEL_38;
  }
  id v41 = 0;
LABEL_38:

  return v41;
}

+ (uint64_t)_createConcreteTilesForDictionaries:(void *)a3 privateDictionaryMap:(uint64_t)a4 context:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  self;
  if ([v6 count])
  {
    id v24 = v6;
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v26 = 0;
          id v15 = +[PKPassTileMetadata _createWithDictionary:v14 privateDictionaryMap:v7 privateDictionary:&v26 context:a4];
          uint64_t v16 = v15;
          if (v15)
          {
            if (v11 == 2)
            {
              if ([v15 isSelectable]) {
                goto LABEL_25;
              }
              uint64_t v11 = 2;
            }
            else if (v11 == 1)
            {
              if (([v15 isSelectable] & 1) == 0)
              {
LABEL_25:
                uint64_t v21 = PKLogFacilityTypeGetObject(0);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  id v22 = [v16 identifier];
                  *(_DWORD *)buf = 138412290;
                  v32 = v22;
                  _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "PKPassTileDescriptor: invalid configuration of tiles found by tile %@ - rejecting all tiles.", buf, 0xCu);
                }
                uint64_t v20 = 0;
                id v6 = v24;
                v19 = v25;
                goto LABEL_30;
              }
              uint64_t v11 = 1;
            }
            else if ([v15 isSelectable])
            {
              uint64_t v11 = 1;
            }
            else
            {
              uint64_t v11 = 2;
            }
            uint64_t v17 = [PKPassTileDescriptor alloc];
            id v18 = -[PKPassTileDescriptor _initWithMetadata:dictionary:privateDictionary:](v17, v16, v14, v26);
            if (v18) {
              [v25 addObject:v18];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v19 = v25;
    if ([v25 count]) {
      uint64_t v20 = [v25 copy];
    }
    else {
      uint64_t v20 = 0;
    }
    id v6 = v24;
LABEL_30:
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)_initWithMetadata:(void *)a3 dictionary:(void *)a4 privateDictionary:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    uint64_t v11 = [a1 _init];
    uint64_t v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)(v11 + 16), a2);
      uint64_t v13 = [*(id *)(v12 + 16) type];
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      long long v30 = __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke;
      v31 = &unk_1E56F5408;
      uint64_t v33 = v13;
      id v15 = v14;
      id v32 = v15;
      uint64_t v16 = (void (**)(void *, void *))_Block_copy(&v28);
      if (v10)
      {
        uint64_t v17 = objc_msgSend(v10, "PKDictionaryForKey:", @"states", v28, v29, v30, v31);
        v16[2](v16, v17);
      }
      id v18 = objc_msgSend(v9, "PKDictionaryForKey:", @"states", v28, v29, v30, v31);
      v16[2](v16, v18);

      uint64_t v19 = [v15 copy];
      uint64_t v20 = *(void **)(v12 + 24);
      *(void *)(v12 + 24) = v19;

      uint64_t v21 = [v9 PKDictionaryForKey:@"defaultConfiguration"];
      uint64_t v22 = [v21 PKStringForKey:@"state"];
      id v23 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v22;

      id v24 = [v21 PKNumberForKey:@"enabled"];
      id v25 = v24;
      if (v24) {
        char v26 = [v24 BOOLValue];
      }
      else {
        char v26 = 1;
      }
      *(unsigned char *)(v12 + 8) = v26;
    }
    a1 = (id)v12;
  }

  return a1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassTileDescriptor;
  return [(PKPassTileDescriptor *)&v3 init];
}

- (PKPassTileDescriptor)init
{
  return 0;
}

void __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke_2;
    v4[3] = &unk_1E56F53E0;
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = v3;
    [a2 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

void __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = +[PKPassTileState _createForDictionary:v5 withTileType:*(void *)(a1 + 40)];
    if (v6) {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    }
  }
}

- (id)createTileForState:(id)a3 childTiles:(id)a4 withBundle:(id)a5 privateBundle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isSupported]
    && (uint64_t v14 = [v10 isEnabled], v14 != 2)
    && (v14 || self->_defaultEnabled))
  {
    id v15 = [v10 stateIdentifier];
    defaultStateIdentifier = v15;
    if (!v15) {
      defaultStateIdentifier = self->_defaultStateIdentifier;
    }
    uint64_t v17 = defaultStateIdentifier;

    id v18 = [v10 stateOverride];
    if (!v18 && v17)
    {
      id v18 = [(NSDictionary *)self->_states objectForKeyedSubscript:v17];
    }
    uint64_t v19 = (void *)[v18 createResolvedStateWithBundle:v12 privateBundle:v13];

    if (v19) {
      id v20 = -[PKPassTile _initWithMetadata:childTiles:stateIdentifier:state:inProgress:]([PKPassTile alloc], "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", self->_metadata, v11, v17, v19, [v10 isInProgress]);
    }
    else {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (PKPassTileMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (NSArray)childDescriptors
{
  return self->_childDescriptors;
}

- (void)setChildDescriptors:(id)a3
{
}

- (NSString)defaultStateIdentifier
{
  return self->_defaultStateIdentifier;
}

- (void)setDefaultStateIdentifier:(id)a3
{
}

- (BOOL)isDefaultEnabled
{
  return self->_defaultEnabled;
}

- (void)setDefaultEnabled:(BOOL)a3
{
  self->_defaultEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultStateIdentifier, 0);
  objc_storeStrong((id *)&self->_childDescriptors, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end