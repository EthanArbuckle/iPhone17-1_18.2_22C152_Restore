@interface PDVehicleFunctionsManager
- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (void)passTileManager:(id)a3 updateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (void)vehicleReportDidChangeForCarKeyWithAppletIdentifier:(id)a3 keyIdentifier:(id)a4;
@end

@implementation PDVehicleFunctionsManager

- (void)vehicleReportDidChangeForCarKeyWithAppletIdentifier:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)PDOSTransactionCreate("PDVehicleFunctionsManager");
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100370E50;
    v13[3] = &unk_100730198;
    id v14 = v9;
    v15 = self;
    id v16 = v6;
    id v17 = v8;
    id v11 = v9;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v13);
    dispatch_async(queue, v12);
  }
}

- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 passType] == (id)1)
  {
    v15 = 0;
    id v16 = 0;
    v9 = [v7 devicePrimaryPaymentApplication];
    sub_100371204(v9, &v16, &v15);

    BOOL v10 = 0;
    dispatch_block_t v12 = v15;
    id v11 = v16;
    if (v16 && v15)
    {
      v13 = [v8 metadata];
      BOOL v10 = [v13 type] == (id)1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  if (![(PDVehicleFunctionsManager *)self passTileManager:a3 isRelevantForPass:v10 tileDescriptor:v11 descriptorState:a6])
  {
    unint64_t v26 = 0;
    goto LABEL_21;
  }
  dispatch_block_t v12 = sub_100371648((uint64_t)self, v10);
  id v13 = objc_alloc_init((Class)NSMutableSet);
  if (!v12)
  {
    id v23 = objc_alloc_init((Class)NSMutableSet);
LABEL_16:
    char v25 = 0;
    goto LABEL_17;
  }
  id v14 = [v11 metadata];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v15 = [v14 metadataTypeVehicleFunction];
  id v16 = [v15 vehicleFunctions];

  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if ([v12 isRKEFunctionSupported:v21]) {
          [v13 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }

  id v22 = [v13 count];
  id v23 = objc_alloc_init((Class)NSMutableSet);
  if (v22 != (id)1) {
    goto LABEL_16;
  }
  v24 = [v11 states];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1003717C0;
  v28[3] = &unk_10074B9D8;
  id v29 = v13;
  v30 = v12;
  id v23 = v23;
  id v31 = v23;
  [v24 enumerateKeysAndObjectsUsingBlock:v28];

  char v25 = 1;
LABEL_17:
  if ((v25 & ((unint64_t)[v23 count] < 2)) != 0) {
    unint64_t v26 = 1;
  }
  else {
    unint64_t v26 = 2;
  }

LABEL_21:
  return v26;
}

- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  return 1;
}

- (void)passTileManager:(id)a3 updateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = sub_100371648((uint64_t)self, a4);
  dispatch_block_t v12 = [v9 metadata];
  id v13 = objc_alloc_init((Class)NSMutableSet);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = v12;
  id v14 = [v12 metadataTypeVehicleFunction];
  v15 = [v14 vehicleFunctions];

  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    id v17 = v16;
    unsigned __int8 v18 = 0;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if ([v11 isRKEFunctionSupported:v21])
        {
          [v13 addObject:v21];
          if (v18) {
            unsigned __int8 v18 = 1;
          }
          else {
            unsigned __int8 v18 = [v11 isRKEFunctionInProgress:v21];
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  id v22 = objc_alloc_init((Class)NSMutableSet);
  id v23 = [v9 states];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100371C08;
  v28[3] = &unk_10074B9D8;
  id v29 = v13;
  v30 = v11;
  id v31 = v22;
  id v24 = v22;
  id v25 = v13;
  [v23 enumerateKeysAndObjectsUsingBlock:v28];

  unint64_t v26 = [v24 anyObject];
  [v10 setStateIdentifier:v26];

  [v10 setInProgress:v18 & 1];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passTileManager);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end