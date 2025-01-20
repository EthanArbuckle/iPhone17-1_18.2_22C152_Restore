@interface PKSEConsistencyCheckResultCollector
- (BOOL)addCleanupActionsToResultsSummary;
- (NSArray)requestedActions;
- (NSDictionary)resultsSummary;
- (PKSEConsistencyCheckResultCollector)init;
- (int64_t)cleanupActions;
- (void)addCleanupActions:(int64_t)a3;
- (void)addCleanupActions:(int64_t)a3 cleanupReason:(id)a4 forDeviceCredential:(id)a5 passCredential:(id)a6;
- (void)setAddCleanupActionsToResultsSummary:(BOOL)a3;
@end

@implementation PKSEConsistencyCheckResultCollector

- (PKSEConsistencyCheckResultCollector)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKSEConsistencyCheckResultCollector;
  v2 = [(PKSEConsistencyCheckResultCollector *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestedActions = v2->_requestedActions;
    v2->_requestedActions = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultSummary = v2->_resultSummary;
    v2->_resultSummary = v5;

    v2->_addCleanupActionsToResultsSummary = 1;
    v2->_sendCleanupReasons = os_variant_has_internal_ui();
  }
  return v2;
}

- (void)addCleanupActions:(int64_t)a3 cleanupReason:(id)a4 forDeviceCredential:(id)a5 passCredential:(id)a6
{
  id v71 = a4;
  id v10 = a5;
  id v11 = a6;
  [(PKSEConsistencyCheckResultCollector *)self addCleanupActions:a3];
  if (a3 && v10)
  {
    v12 = [PKSEConsistencyCheckRequestedAction alloc];
    v13 = [v11 address];
    v14 = [(PKSEConsistencyCheckRequestedAction *)v12 initWithActions:a3 deviceCredential:v10 address:v13];

    [(NSMutableArray *)self->_requestedActions addObject:v14];
  }
  if (self->_addCleanupActionsToResultsSummary)
  {
    if (v11)
    {
      uint64_t v15 = [v11 type];
      if (!v10 || !v15)
      {
        if (!v15)
        {
LABEL_14:
          id v24 = v10;
          id v17 = v71;
          id v18 = [v11 paymentApplication];
          id v19 = [v18 applicationIdentifier];
          if (!v19)
          {
            v25 = [v24 address];
            id v19 = [v25 appletIdentifier];

            if (!v19) {
              goto LABEL_68;
            }
          }
          id v20 = [(NSMutableDictionary *)self->_resultSummary objectForKey:v19];
          if (!v20)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [(NSMutableDictionary *)self->_resultSummary setObject:v20 forKey:v19];
          }
          if (a3)
          {
            [v20 objectForKeyedSubscript:@"cleanupAction"];
            v26 = id v68 = v19;
            v27 = v20;
            uint64_t v28 = [v26 integerValue];

            int64_t v29 = v28 | a3;
            id v20 = v27;
            v30 = [NSNumber numberWithInteger:v29];
            [v27 setObject:v30 forKeyedSubscript:@"cleanupAction"];

            id v19 = v68;
          }
          if (v18)
          {
            v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "state"));
            [v20 setObject:v31 forKeyedSubscript:@"passState"];
          }
          if (v24 && ![v24 type])
          {
            v32 = [v24 underlyingCredentialState];
            [v20 setObject:v32 forKeyedSubscript:@"appletState"];
          }
          if (a3 && self->_sendCleanupReasons) {
            [v20 setObject:v17 forKeyedSubscript:@"appletCleanupReason"];
          }
LABEL_67:

LABEL_68:
          goto LABEL_69;
        }
LABEL_12:
        v16 = [v11 address];
        id v17 = v11;
        id v18 = v10;
        id v19 = v71;
        id v20 = v16;
        v70 = [v17 subcredential];
        v21 = [v18 address];
        uint64_t v22 = [v21 appletIdentifier];
        if (v22)
        {
          uint64_t v23 = v22;
        }
        else
        {
          uint64_t v23 = [v20 appletIdentifier];

          if (!v23)
          {
LABEL_66:

            id v24 = v20;
            goto LABEL_67;
          }
        }
        id v33 = [(NSMutableDictionary *)self->_resultSummary objectForKey:v23];
        if (!v33)
        {
          id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [(NSMutableDictionary *)self->_resultSummary setObject:v33 forKey:v23];
        }
        v64 = (void *)v23;
        id v69 = v19;
        id v34 = [v33 objectForKey:@"subkeys"];
        if (!v34)
        {
          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v33 setObject:v34 forKey:@"subkeys"];
        }
        v63 = v33;
        v35 = [v18 address];
        v36 = [v35 subcredentialIdentifier];
        v37 = v36;
        id v65 = v20;
        if (v36)
        {
          id v38 = v36;
        }
        else
        {
          id v38 = [v20 subcredentialIdentifier];
        }
        id v39 = v38;

        v66 = v39;
        id v40 = [v34 objectForKey:v39];
        if (!v40)
        {
          id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v34 setObject:v40 forKey:v66];
        }
        v67 = v17;
        if (a3)
        {
          v41 = [v40 objectForKeyedSubscript:@"cleanupAction"];
          uint64_t v42 = [v41 integerValue];

          int64_t v43 = v42 | a3;
          id v17 = v67;
          v44 = [NSNumber numberWithInteger:v43];
          [v40 setObject:v44 forKeyedSubscript:@"cleanupAction"];
        }
        v45 = v70;
        if (v70)
        {
          v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v70, "state"));
          [v40 setObject:v46 forKeyedSubscript:@"passState"];
        }
        if (!v18)
        {
LABEL_62:
          uint64_t v61 = [v45 credentialType];
          if (v61 || (uint64_t v61 = [v18 credentialType]) != 0)
          {
            v62 = [NSNumber numberWithInteger:v61];
            [v40 setObject:v62 forKeyedSubscript:@"credentialType"];
          }
          id v19 = v69;
          id v20 = v65;
          goto LABEL_66;
        }
        id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v48 = [v18 underlyingCredentialState];
        [v47 setObject:v48 forKeyedSubscript:@"keyState"];

        uint64_t v49 = [v18 type];
        unint64_t v50 = v49;
        if (v49 == 2)
        {
          v51 = [v18 underlyingCredentialState];
          [v40 setObject:v51 forKeyedSubscript:@"isoKeyState"];

          if (!a3 || !self->_sendCleanupReasons) {
            goto LABEL_54;
          }
          v52 = @"isoCleanupReason";
        }
        else
        {
          if (v49 != 1)
          {
            if (!v49) {
              [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKSecureElementConsistencyChecker: tried to add an applet device credential to a subcredential state. Credential: %@", v18 format];
            }
            goto LABEL_54;
          }
          v53 = [v18 underlyingCredentialState];
          [v40 setObject:v53 forKeyedSubscript:@"keyState"];

          if (!a3 || !self->_sendCleanupReasons)
          {
LABEL_54:
            if (a3 && self->_sendCleanupReasons) {
              [v47 setObject:v69 forKeyedSubscript:@"cleanupReason"];
            }
            v54 = [v67 keyMaterialHashForDeviceCredentialType];
            v55 = [NSNumber numberWithUnsignedInteger:v50];
            uint64_t v56 = [v54 objectForKeyedSubscript:v55];

            uint64_t v57 = [v18 keyMaterialHash];
            if (v56 | v57)
            {
              v58 = [(id)v56 base64EncodedStringWithOptions:0];
              [v47 setObject:v58 forKeyedSubscript:@"passPayloadMaterialHash"];

              v59 = [(id)v57 base64EncodedStringWithOptions:0];
              [v47 setObject:v59 forKeyedSubscript:@"devicePayloadMaterialHash"];
            }
            if ([v47 count])
            {
              v60 = PKSEConsistencyCheckDeviceCredentialTypeToString(v50);
              [v40 setObject:v47 forKeyedSubscript:v60];
            }
            id v17 = v67;
            v45 = v70;
            goto LABEL_62;
          }
          v52 = @"subcredentialCleanupReason";
        }
        [v40 setObject:v69 forKeyedSubscript:v52];
        goto LABEL_54;
      }
    }
    else if (!v10)
    {
      goto LABEL_12;
    }
    if (![v10 type]) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_69:
}

- (void)addCleanupActions:(int64_t)a3
{
  if (self->_addCleanupActionsToResultsSummary) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFFELL;
  }
  self->_cleanupActions |= v3;
}

- (NSDictionary)resultsSummary
{
  v2 = (void *)[(NSMutableDictionary *)self->_resultSummary copy];
  return (NSDictionary *)v2;
}

- (NSArray)requestedActions
{
  v2 = (void *)[(NSMutableArray *)self->_requestedActions copy];
  return (NSArray *)v2;
}

- (BOOL)addCleanupActionsToResultsSummary
{
  return self->_addCleanupActionsToResultsSummary;
}

- (void)setAddCleanupActionsToResultsSummary:(BOOL)a3
{
  self->_addCleanupActionsToResultsSummary = a3;
}

- (int64_t)cleanupActions
{
  return self->_cleanupActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSummary, 0);
  objc_storeStrong((id *)&self->_requestedActions, 0);
}

@end