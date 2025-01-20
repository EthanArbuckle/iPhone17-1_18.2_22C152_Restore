@interface VCSpotlightState
- (BOOL)isConsistentWithClientState:(unint64_t)a3;
- (BOOL)saveToPath:(id)a3 error:(id *)a4;
- (NSDictionary)syncedShortcuts;
- (VCSpotlightState)initWithIdentifier:(unint64_t)a3 syncedShortcuts:(id)a4;
- (VCSpotlightState)initWithPath:(id)a3;
- (unint64_t)identifier;
@end

@implementation VCSpotlightState

- (void).cxx_destruct
{
}

- (NSDictionary)syncedShortcuts
{
  return self->_syncedShortcuts;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)saveToPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setIdentifier:self->_identifier];
  v8 = [(VCSpotlightState *)self syncedShortcuts];
  v9 = [v8 allKeys];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__VCSpotlightState_saveToPath_error___block_invoke;
  v14[3] = &unk_1E6540CF0;
  v14[4] = self;
  v10 = objc_msgSend(v9, "if_map:", v14);
  v11 = (void *)[v10 mutableCopy];
  [v7 setPairs:v11];

  v12 = [v7 data];
  LOBYTE(a4) = [v12 writeToFile:v6 atomically:1 error:a4];

  return (char)a4;
}

VCPBSpotlightPair *__37__VCSpotlightState_saveToPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(VCPBSpotlightPair);
  [(VCPBSpotlightPair *)v4 setWorkflowID:v3];
  v5 = [*(id *)(a1 + 32) syncedShortcuts];
  id v6 = [v5 objectForKey:v3];

  -[VCPBSpotlightPair setSpotlightHash:](v4, "setSpotlightHash:", [v6 unsignedLongLongValue]);
  return v4;
}

- (BOOL)isConsistentWithClientState:(unint64_t)a3
{
  return [(VCSpotlightState *)self identifier] == a3;
}

- (VCSpotlightState)initWithPath:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VCSpotlightState;
  v5 = [(VCSpotlightState *)&v36 init];
  id v6 = v5;
  if (v5)
  {
    v5->_identifier = 0;
    uint64_t v7 = objc_opt_new();
    syncedShortcuts = v6->_syncedShortcuts;
    v6->_syncedShortcuts = (NSDictionary *)v7;

    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v4];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
      uint64_t v13 = [v11 initWithContentsOfURL:v12];

      v31 = (void *)v13;
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F94090]) initWithData:v13];
      v15 = objc_opt_new();
      v30 = (void *)v14;
      [v15 readFrom:v14];
      v16 = objc_opt_new();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v17 = [v15 pairs];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "spotlightHash"));
            v24 = [v22 workflowID];
            [v16 setObject:v23 forKey:v24];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v19);
      }

      v6->_identifier = [v15 identifier];
      uint64_t v25 = [v16 copy];
      v26 = v6->_syncedShortcuts;
      v6->_syncedShortcuts = (NSDictionary *)v25;

      v27 = v6;
    }
    else
    {
      v28 = v6;
    }
  }

  return v6;
}

- (VCSpotlightState)initWithIdentifier:(unint64_t)a3 syncedShortcuts:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VCSpotlightState;
  uint64_t v7 = [(VCSpotlightState *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_identifier = a3;
    uint64_t v9 = [v6 copy];
    syncedShortcuts = v8->_syncedShortcuts;
    v8->_syncedShortcuts = (NSDictionary *)v9;

    id v11 = v8;
  }

  return v8;
}

@end