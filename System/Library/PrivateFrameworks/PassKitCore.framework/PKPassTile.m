@interface PKPassTile
+ (BOOL)supportsSecureCoding;
+ (id)_createDefaultDashboardGroupTileWithChildTiles:(id)a3;
+ (id)createTileRowsForTiles:(id)a3 forceCompact:(BOOL)a4 maximumRows:(unint64_t)a5 maximumColumns:(unint64_t)a6;
- (BOOL)isGroupTile;
- (BOOL)isInProgress;
- (BOOL)supportsPaymentPassAction:(id)a3;
- (NSArray)tiles;
- (NSString)analyticsIdentifier;
- (NSString)axID;
- (NSString)stateIdentifier;
- (PKPassTile)init;
- (PKPassTile)initWithCoder:(id)a3;
- (PKPassTileMetadata)metadata;
- (PKPassTileState)state;
- (id)_init;
- (id)_initWithMetadata:(id)a3 childTiles:(id)a4 stateIdentifier:(id)a5 state:(id)a6 inProgress:(BOOL)a7;
- (id)maximumRows;
- (id)prearmTiles;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsIdentifier:(id)a3;
- (void)setAxID:(id)a3;
- (void)setTiles:(id)a3;
@end

@implementation PKPassTile

+ (id)createTileRowsForTiles:(id)a3 forceCompact:(BOOL)a4 maximumRows:(unint64_t)a5 maximumColumns:(unint64_t)a6
{
  BOOL v37 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = 0;
  if (v8 && a6)
  {
    unint64_t v38 = a6;
    id v34 = v8;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__33;
    v51 = __Block_byref_object_dispose__33;
    id v52 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PKPassTile_createTileRowsForTiles_forceCompact_maximumRows_maximumColumns___block_invoke;
    aBlock[3] = &unk_1E56E7C90;
    v45 = &v47;
    id v36 = v10;
    id v44 = v36;
    v46 = &v53;
    v11 = (void (**)(void))_Block_copy(aBlock);
    unint64_t v12 = [v34 count];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v12 >= v38 * a5) {
      unint64_t v14 = v38 * a5;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v37 && v12 >= a5 + 1 && v14)
    {
      do
      {
        if (v14 >= v38) {
          unint64_t v15 = v38;
        }
        else {
          unint64_t v15 = v14;
        }
        v16 = [NSNumber numberWithUnsignedInteger:v15];
        [v13 insertObject:v16 atIndex:0];

        v14 -= v15;
      }
      while (v14);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v34;
    uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v40;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
          v21 = [v20 state];
          v22 = [v21 stateTypeDefaultV2];

          if (v37) {
            goto LABEL_19;
          }
          v24 = [v20 metadata];
          if (![v24 preferredStyle])
          {

LABEL_26:
            v11[2](v11);
            int v23 = 1;
            goto LABEL_27;
          }
          if (!v22)
          {

LABEL_19:
            int v23 = 0;
            goto LABEL_27;
          }
          unint64_t v25 = [v22 preferredStyle];

          int v23 = 0;
          if (v25 <= 4 && ((1 << v25) & 0x15) != 0) {
            goto LABEL_26;
          }
LABEL_27:
          v26 = (void *)v48[5];
          if (!v26)
          {
            id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v28 = (void *)v48[5];
            v48[5] = (uint64_t)v27;

            v26 = (void *)v48[5];
          }
          [v26 addObject:v20];
          ++v54[3];
          unint64_t v29 = [v36 count];
          unint64_t v30 = v38;
          if ([v13 count] > v29)
          {
            v31 = [v13 objectAtIndexedSubscript:v29];
            unint64_t v30 = [v31 unsignedIntegerValue];
          }
          if (((v54[3] < v30) & ~v23) == 0) {
            v11[2](v11);
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v57 count:16];
        uint64_t v17 = v32;
      }
      while (v32);
    }

    v11[2](v11);
    v9 = (void *)[v36 copy];

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);

    id v8 = v34;
  }

  return v9;
}

void __77__PKPassTile_createTileRowsForTiles_forceCompact_maximumRows_maximumColumns___block_invoke(void *a1)
{
  v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2)
  {
    v3 = (void *)a1[4];
    v4 = (void *)[v2 copy];
    [v3 addObject:v4];

    uint64_t v5 = *(void *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (PKPassTile)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassTile;
  return [(PKPassTile *)&v3 init];
}

- (id)_initWithMetadata:(id)a3 childTiles:(id)a4 stateIdentifier:(id)a5 state:(id)a6 inProgress:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  uint64_t v17 = 0;
  if (v12 && v15)
  {
    if ([v15 isResolved])
    {
      uint64_t v18 = [(PKPassTile *)self _init];
      uint64_t v19 = v18;
      if (v18)
      {
        objc_storeStrong(v18 + 2, a3);
        objc_storeStrong(v19 + 5, a4);
        objc_storeStrong(v19 + 3, a5);
        objc_storeStrong(v19 + 4, a6);
        *((unsigned char *)v19 + 8) = a7;
      }
      self = v19;
      uint64_t v17 = self;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }

  return v17;
}

- (BOOL)isGroupTile
{
  return [(PKPassTileMetadata *)self->_metadata isGroupType];
}

- (id)prearmTiles
{
  v2 = [(NSArray *)self->_tiles pk_objectsPassingTest:&__block_literal_global_104];
  if ([v2 count]) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __25__PKPassTile_prearmTiles__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 metadata];
  uint64_t v3 = [v2 showInPrearm];

  return v3;
}

- (id)maximumRows
{
  v2 = [(PKPassTile *)self metadata];
  if ([v2 type] == 2)
  {
    uint64_t v3 = [v2 metadataTypeHorizontalFlowGroup];
    uint64_t v4 = [v3 maximumRows];
    if (v4)
    {
LABEL_3:
      uint64_t v5 = [NSNumber numberWithUnsignedInteger:v4];
LABEL_7:

      goto LABEL_9;
    }
LABEL_6:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  if ([v2 type] == 3)
  {
    uint64_t v3 = [v2 metadataTypeVerticalFlowGroup];
    uint64_t v4 = [v3 rows];
    if (v4) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

+ (id)_createDefaultDashboardGroupTileWithChildTiles:(id)a3
{
  id v3 = a3;
  id v4 = +[PKPassTileMetadataHorizontalFlowGroup _createDefaultDashboardGroupMetadata];
  id v5 = +[PKPassTileStateGroup _createDefaultDashboardGroupStateWithMetadata:v4];
  id v6 = [[PKPassTile alloc] _initWithMetadata:v4 childTiles:v3 stateIdentifier:@"default" state:v5 inProgress:0];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTile)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassTile *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (PKPassTileMetadata *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"tiles"];
    tiles = v5->_tiles;
    v5->_tiles = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateIdentifier"];
    stateIdentifier = v5->_stateIdentifier;
    v5->_stateIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (PKPassTileState *)v12;

    v5->_inProgress = [v4 decodeBoolForKey:@"inProgress"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  metadata = self->_metadata;
  id v5 = a3;
  [v5 encodeObject:metadata forKey:@"metadata"];
  [v5 encodeObject:self->_tiles forKey:@"tiles"];
  [v5 encodeObject:self->_stateIdentifier forKey:@"stateIdentifier"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeBool:self->_inProgress forKey:@"inProgress"];
}

- (BOOL)supportsPaymentPassAction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 isActionAvailable]) {
    goto LABEL_10;
  }
  uint64_t v6 = [v5 type];
  if ((unint64_t)(v6 - 7) < 3)
  {
    BOOL v7 = 1;
    goto LABEL_11;
  }
  if (v6 != 4)
  {
    BOOL v7 = v6 == 3;
    goto LABEL_11;
  }
  if ([(PKPassTileMetadata *)self->_metadata type] != 1)
  {
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [(PKPassTileMetadata *)self->_metadata metadataTypeVehicleFunction];
  v9 = [v8 vehicleFunctions];
  if ([v9 count])
  {
    uint64_t v10 = [v5 vehicleFunctionActions];
    BOOL v7 = [v10 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

LABEL_11:
  return v7;
}

- (PKPassTileMetadata)metadata
{
  return self->_metadata;
}

- (NSString)stateIdentifier
{
  return self->_stateIdentifier;
}

- (PKPassTileState)state
{
  return self->_state;
}

- (BOOL)isInProgress
{
  return self->_inProgress;
}

- (NSArray)tiles
{
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_stateIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end