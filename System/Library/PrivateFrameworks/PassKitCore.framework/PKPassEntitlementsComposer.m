@interface PKPassEntitlementsComposer
- (BOOL)canAllowResharing;
- (BOOL)editable;
- (BOOL)preferDetailedCapabilityDisplay;
- (NSArray)composeSharedEntitlements;
- (NSArray)entitlementEntries;
- (NSArray)predefinedEntitlementEntries;
- (PKPassEntitlementsComposer)init;
- (PKPassEntitlementsComposer)initWithMyEntitlements:(id)a3;
- (PKPassEntitlementsComposer)initWithMyEntitlements:(id)a3 predefinedSharedEntitlements:(id)a4;
- (PKPassEntitlementsComposer)initWithRedeemableSharedEntitlements:(id)a3 predefinedSharedEntitlements:(id)a4;
- (PKPassEntitlementsComposer)initWithSharedEntitlements:(id)a3 availableEntitlements:(id)a4 editable:(BOOL)a5;
- (PKPassEntitlementsComposer)initWithSharedEntitlements:(id)a3 availableEntitlements:(id)a4 predefinedSharedEntitlements:(id)a5 editable:(BOOL)a6;
- (PKPassEntitlementsComposerPredefinedSelectionEntry)activePredefinedSelectionEntry;
- (id)_allPossibleCapabilitySetsForView:(id)a3;
- (id)addPredefinedSharedEntitlementSelection:(id)a3;
- (id)globalView;
- (id)localizedSelectedEntitlementSummaryForAccessType:(int64_t)a3;
- (id)viewFor:(id)a3;
- (id)viewForEnabledEntitlements;
- (id)viewForPredefined:(id)a3;
- (unint64_t)maxSelectionCount;
- (unsigned)_initWithSharedEntitlements:(void *)a3 availableEntitlements:(void *)a4 predefinedSharedEntitlements:(unsigned __int8)a5 editable:(unsigned __int8)a6 isMyEntitlements:;
- (void)_rootEntryNodeDidSetEnabled:(id)a3;
- (void)setMaxSelectionCount:(unint64_t)a3;
- (void)setPossiblePredefinedSharedEntitlementSelection:(id)a3;
@end

@implementation PKPassEntitlementsComposer

- (PKPassEntitlementsComposer)init
{
  return 0;
}

- (PKPassEntitlementsComposer)initWithRedeemableSharedEntitlements:(id)a3 predefinedSharedEntitlements:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v30 = a4;
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (v5)
  {
    v28 = objc_msgSend(v5, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_276_0);
  }
  else
  {
    v28 = 0;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v11 = [v10 sharedEntitlement];
        v12 = objc_alloc_init(PKPassEntitlement);
        v13 = [v11 entitlementIdentifier];
        [(PKPassEntitlement *)v12 setIdentifier:v13];

        v14 = [v11 timeConfiguration];
        [(PKPassEntitlement *)v12 setTimeConfiguration:v14];

        v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "recipientShareability"));
        v39 = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        [(PKPassEntitlement *)v12 setShareability:v16];

        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "recipientShareability"));
        [(PKPassEntitlement *)v12 setActiveShareability:v17];

        v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "recipientVisibility"));
        v38 = v18;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        [(PKPassEntitlement *)v12 setVisibility:v19];

        v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "recipientVisibility"));
        [(PKPassEntitlement *)v12 setActiveVisibility:v20];

        v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "recipientManageability"));
        v37 = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        [(PKPassEntitlement *)v12 setManageability:v22];

        v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "recipientManageability"));
        [(PKPassEntitlement *)v12 setActiveManageability:v23];

        v24 = [v11 recipientCapabilityRole];
        [(PKPassEntitlement *)v12 setActiveCapabilityRole:v24];

        v25 = (void *)[v10 copy];
        [v25 replaceSharedEntitlementWithEntitlement:v12];
        [v32 addObject:v25];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v7);
  }

  v26 = -[PKPassEntitlementsComposer _initWithSharedEntitlements:availableEntitlements:predefinedSharedEntitlements:editable:isMyEntitlements:](self, v28, v32, v30, 0, 1u);
  return (PKPassEntitlementsComposer *)v26;
}

uint64_t __96__PKPassEntitlementsComposer_initWithRedeemableSharedEntitlements_predefinedSharedEntitlements___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharedEntitlement];
}

- (unsigned)_initWithSharedEntitlements:(void *)a3 availableEntitlements:(void *)a4 predefinedSharedEntitlements:(unsigned __int8)a5 editable:(unsigned __int8)a6 isMyEntitlements:
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (!a1)
  {
    v13 = 0;
    goto LABEL_112;
  }
  v136.receiver = a1;
  v136.super_class = (Class)PKPassEntitlementsComposer;
  v13 = (unsigned __int8 *)objc_msgSendSuper2(&v136, sel_init);
  if (v13)
  {
    id v107 = v10;
    uint64_t v14 = [v10 copy];
    v15 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v14;

    uint64_t v16 = [v11 copy];
    v17 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v16;

    v13[97] = a5;
    v13[96] = a6;
    uint64_t v18 = +[PKPassEntitlementCapabilitySet predefinedSets];
    v19 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v18;

    v120 = objc_msgSend(*((id *)v13 + 1), "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_286);
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v20 = *((id *)v13 + 1);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v149 objects:v159 count:16];
    if (!v21)
    {
      int v115 = 0;
      v113 = 0;
      goto LABEL_20;
    }
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    v113 = 0;
    uint64_t v24 = *(void *)v150;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v150 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = [*(id *)(*((void *)&v149 + 1) + 8 * i) timeConfiguration];
        v27 = v26;
        if (v23)
        {
          if (v113 && v26)
          {
            if (([v113 isEqual:v26] & 1) == 0) {
              goto LABEL_18;
            }
          }
          else if (v113 != v26)
          {
LABEL_18:

            int v115 = 1;
            goto LABEL_20;
          }
        }
        else
        {
          id v28 = v26;

          v113 = v28;
        }

        uint64_t v23 = 1;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v149 objects:v159 count:16];
      uint64_t v23 = 1;
      if (!v22)
      {
        int v115 = 0;
LABEL_20:

        long long v147 = 0u;
        long long v148 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        id v29 = *((id *)v13 + 1);
        uint64_t v30 = [v29 countByEnumeratingWithState:&v145 objects:v158 count:16];
        id v106 = v11;
        id v108 = v12;
        if (!v30)
        {
          int v116 = 1;
          uint64_t v111 = -1;
          uint64_t v112 = -1;
          uint64_t v105 = -1;
          uint64_t v110 = -1;
          goto LABEL_56;
        }
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v146;
        uint64_t v111 = -1;
        uint64_t v112 = -1;
        uint64_t v33 = -1;
        uint64_t v34 = -1;
LABEL_22:
        uint64_t v35 = 0;
        while (1)
        {
          if (*(void *)v146 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v36 = *(void **)(*((void *)&v145 + 1) + 8 * v35);
          uint64_t v37 = [v36 recipientShareability];
          if (v34 == -1) {
            uint64_t v38 = v37;
          }
          else {
            uint64_t v38 = v34;
          }
          uint64_t v110 = v38;
          BOOL v39 = v34 == v37 || v34 == -1;
          uint64_t v40 = [v36 recipientVisibility];
          uint64_t v41 = v111;
          BOOL v42 = v111 == -1;
          if (v111 == -1) {
            uint64_t v43 = v40;
          }
          else {
            uint64_t v43 = v111;
          }
          uint64_t v111 = v43;
          int v44 = v41 == v40 || v42;
          uint64_t v45 = [v36 recipientManageability];
          uint64_t v46 = v112;
          BOOL v47 = v112 == -1;
          if (v112 == -1) {
            uint64_t v48 = v45;
          }
          else {
            uint64_t v48 = v112;
          }
          uint64_t v112 = v48;
          if (v46 == v45) {
            BOOL v47 = 1;
          }
          int v49 = v47 & v44 & v39;
          unsigned int v50 = [v36 intraAccountSharingEnabled];
          if (v33 == -1)
          {
            if ((v49 & 1) == 0)
            {
              uint64_t v105 = v50;
              int v116 = 0;
LABEL_56:

              id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v53 = (void *)*((void *)v13 + 10);
              *((void *)v13 + 10) = v52;

              v54 = [[PKPassEntitlementsComposerEntryNode alloc] initWithIdentifier:@"Global" parentEntitlementComposer:v13];
              v55 = (void *)*((void *)v13 + 7);
              *((void *)v13 + 7) = v54;

              [*((id *)v13 + 7) setTimeConfiguration:v113];
              [*((id *)v13 + 10) addObject:*((void *)v13 + 7)];
              uint64_t v56 = objc_msgSend(MEMORY[0x1E4F28E10], "pk_createStrongPointerPersonalityToStrongObjects");
              v57 = (void *)*((void *)v13 + 8);
              *((void *)v13 + 8) = v56;

              id v117 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v143 = 0u;
              long long v144 = 0u;
              long long v141 = 0u;
              long long v142 = 0u;
              id obj = *((id *)v13 + 2);
              uint64_t v58 = [obj countByEnumeratingWithState:&v141 objects:v157 count:16];
              if (v58)
              {
                uint64_t v59 = v58;
                id v118 = *(id *)v142;
                do
                {
                  for (uint64_t j = 0; j != v59; ++j)
                  {
                    if (*(id *)v142 != v118) {
                      objc_enumerationMutation(obj);
                    }
                    v61 = *(void **)(*((void *)&v141 + 1) + 8 * j);
                    v62 = objc_msgSend(v61, "entitlementIdentifier", v105);
                    uint64_t v63 = [v120 objectForKeyedSubscript:v62];
                    if (v63 || v13[97])
                    {
                      v64 = -[PKPassEntitlementsComposerEntry initWithDisplayableEntitlement:parentEntitlementComposer:]((id *)[PKPassEntitlementsComposerEntry alloc], v61, v13);
                      v65 = (void *)v63;
                      if (!v63)
                      {
                        v66 = [v61 entitlement];
                        if (v66)
                        {
                          v67 = [[PKPassSharedEntitlement alloc] initWithEntitlement:v66];
                        }
                        else
                        {
                          v67 = [v61 sharedEntitlement];
                        }
                        v65 = v67;
                      }
                      v68 = (void *)[v65 copy];
                      [v64 setSharedEntitlement:v68];

                      [v117 addObject:v64];
                      v69 = [[PKPassEntitlementsComposerEntitlementEntryNode alloc] initWithDisplayableEntitlement:v61 sharedEntitlement:v65 parentEntitlementComposer:v13];
                      [(PKPassEntitlementsComposerEntryNode *)v69 setParent:*((void *)v13 + 7)];
                      [(PKPassEntitlementsComposerEntryNode *)v69 setEnabled:v63 != 0];
                      if (v115)
                      {
                        v70 = [v65 timeConfiguration];
                        v71 = (void *)[v70 copy];
                        [(PKPassEntitlementsComposerEntryNode *)v69 setTimeConfiguration:v71];
                      }
                      if ((v116 & 1) == 0)
                      {
                        if (v63)
                        {
                          -[PKPassEntitlementsComposerEntryNode setShareability:](v69, "setShareability:", [v65 recipientShareability]);
                          -[PKPassEntitlementsComposerEntryNode setVisibility:](v69, "setVisibility:", [v65 recipientVisibility]);
                          -[PKPassEntitlementsComposerEntryNode setManageability:](v69, "setManageability:", [v65 recipientManageability]);
                          -[PKPassEntitlementsComposerEntryNode setIntraAccountSharingEnabled:](v69, "setIntraAccountSharingEnabled:", [v65 intraAccountSharingEnabled]);
                        }
                        else
                        {
                          [(PKPassEntitlementsComposerEntryNode *)v69 resetCapabilities];
                        }
                      }
                      v72 = [*((id *)v13 + 7) children];
                      [v72 addObject:v69];

                      [*((id *)v13 + 8) setObject:v69 forKey:v64];
                    }
                  }
                  uint64_t v59 = [obj countByEnumeratingWithState:&v141 objects:v157 count:16];
                }
                while (v59);
              }

              if (v116)
              {
                uint64_t v73 = [*((id *)v13 + 1) count];
                v74 = (void *)*((void *)v13 + 7);
                if (v73)
                {
                  [v74 setShareability:v110];
                  [*((id *)v13 + 7) setVisibility:v111];
                  [*((id *)v13 + 7) setManageability:v112];
                  [*((id *)v13 + 7) setIntraAccountSharingEnabled:v105 == 1];
                }
                else
                {
                  [v74 resetCapabilities];
                }
              }
              v75 = objc_msgSend(v117, "copy", v105);
              uint64_t v76 = [v75 sortedArrayUsingComparator:&__block_literal_global_295_0];
              v77 = (void *)*((void *)v13 + 4);
              *((void *)v13 + 4) = v76;

              uint64_t v78 = objc_msgSend(v117, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_298_0);
              v79 = (void *)*((void *)v13 + 3);
              *((void *)v13 + 3) = v78;

              *((void *)v13 + 11) = [v117 count];
              long long v137 = 0u;
              long long v138 = 0u;
              long long v139 = 0u;
              long long v140 = 0u;
              id v80 = *((id *)v13 + 10);
              uint64_t v81 = [v80 countByEnumeratingWithState:&v137 objects:v156 count:16];
              if (v81)
              {
                uint64_t v82 = v81;
                uint64_t v83 = *(void *)v138;
                do
                {
                  for (uint64_t k = 0; k != v82; ++k)
                  {
                    if (*(void *)v138 != v83) {
                      objc_enumerationMutation(v80);
                    }
                    [*(id *)(*((void *)&v137 + 1) + 8 * k) setEditable:v13[97]];
                  }
                  uint64_t v82 = [v80 countByEnumeratingWithState:&v137 objects:v156 count:16];
                }
                while (v82);
              }

              v121 = [v13 composeSharedEntitlements];
              v13[97] = 1;
              long long v132 = 0u;
              long long v133 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              id v85 = *((id *)v13 + 10);
              uint64_t v86 = [v85 countByEnumeratingWithState:&v132 objects:v155 count:16];
              if (v86)
              {
                uint64_t v87 = v86;
                uint64_t v88 = *(void *)v133;
                do
                {
                  for (uint64_t m = 0; m != v87; ++m)
                  {
                    if (*(void *)v133 != v88) {
                      objc_enumerationMutation(v85);
                    }
                    [*(id *)(*((void *)&v132 + 1) + 8 * m) setEditable:1];
                  }
                  uint64_t v87 = [v85 countByEnumeratingWithState:&v132 objects:v155 count:16];
                }
                while (v87);
              }

              [v13 setPossiblePredefinedSharedEntitlementSelection:v108];
              long long v130 = 0u;
              long long v131 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              id v119 = [v13 predefinedEntitlementEntries];
              uint64_t v90 = [v119 countByEnumeratingWithState:&v128 objects:v154 count:16];
              if (v90)
              {
                uint64_t v91 = v90;
                uint64_t v92 = *(void *)v129;
                do
                {
                  for (uint64_t n = 0; n != v91; ++n)
                  {
                    if (*(void *)v129 != v92) {
                      objc_enumerationMutation(v119);
                    }
                    v94 = *(void **)(*((void *)&v128 + 1) + 8 * n);
                    v95 = [v94 predefinedSelection];
                    v96 = [v95 sharedEntitlements];

                    uint64_t v97 = [v96 count];
                    v126[0] = MEMORY[0x1E4F143A8];
                    v126[1] = 3221225472;
                    v126[2] = __135__PKPassEntitlementsComposer__initWithSharedEntitlements_availableEntitlements_predefinedSharedEntitlements_editable_isMyEntitlements___block_invoke;
                    v126[3] = &unk_1E56F5258;
                    id v127 = v121;
                    if (v97 == objc_msgSend(v96, "pk_countObjectsPassingTest:", v126))
                    {
                      v98 = [v13 viewForPredefined:v94];
                      [v98 setEnabled:1];
                    }
                  }
                  uint64_t v91 = [v119 countByEnumeratingWithState:&v128 objects:v154 count:16];
                }
                while (v91);
              }

              v13[97] = a5;
              long long v122 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              id v99 = *((id *)v13 + 10);
              uint64_t v100 = [v99 countByEnumeratingWithState:&v122 objects:v153 count:16];
              id v11 = v106;
              if (v100)
              {
                uint64_t v101 = v100;
                uint64_t v102 = *(void *)v123;
                do
                {
                  for (iuint64_t i = 0; ii != v101; ++ii)
                  {
                    if (*(void *)v123 != v102) {
                      objc_enumerationMutation(v99);
                    }
                    [*(id *)(*((void *)&v122 + 1) + 8 * ii) setEditable:v13[97]];
                  }
                  uint64_t v101 = [v99 countByEnumeratingWithState:&v122 objects:v153 count:16];
                }
                while (v101);
              }

              id v10 = v107;
              id v12 = v108;
              goto LABEL_112;
            }
            uint64_t v33 = v50;
          }
          else
          {
            if (v33 == v50) {
              int v51 = v49;
            }
            else {
              int v51 = 0;
            }
            if (v51 != 1)
            {
              int v116 = 0;
LABEL_53:
              uint64_t v105 = v33;
              goto LABEL_56;
            }
          }
          uint64_t v34 = v110;
          if (v31 == ++v35)
          {
            uint64_t v31 = [v29 countByEnumeratingWithState:&v145 objects:v158 count:16];
            if (v31) {
              goto LABEL_22;
            }
            int v116 = 1;
            goto LABEL_53;
          }
        }
      }
    }
  }
LABEL_112:

  return v13;
}

- (PKPassEntitlementsComposer)initWithMyEntitlements:(id)a3
{
  return [(PKPassEntitlementsComposer *)self initWithMyEntitlements:a3 predefinedSharedEntitlements:0];
}

- (PKPassEntitlementsComposer)initWithMyEntitlements:(id)a3 predefinedSharedEntitlements:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_279);
  v9 = -[PKPassEntitlementsComposer _initWithSharedEntitlements:availableEntitlements:predefinedSharedEntitlements:editable:isMyEntitlements:](self, v8, v7, v6, 0, 1u);

  return (PKPassEntitlementsComposer *)v9;
}

PKPassSharedEntitlement *__82__PKPassEntitlementsComposer_initWithMyEntitlements_predefinedSharedEntitlements___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 entitlement];
  v3 = [[PKPassSharedEntitlement alloc] initWithEntitlement:v2];
  v4 = [v2 timeConfiguration];
  [(PKPassSharedEntitlement *)v3 setTimeConfiguration:v4];

  id v5 = [v2 activeShareability];
  -[PKPassSharedEntitlement setRecipientShareability:](v3, "setRecipientShareability:", [v5 unsignedIntegerValue]);

  id v6 = [v2 activeVisibility];
  -[PKPassSharedEntitlement setRecipientVisibility:](v3, "setRecipientVisibility:", [v6 unsignedIntegerValue]);

  id v7 = [v2 activeManageability];
  -[PKPassSharedEntitlement setRecipientManageability:](v3, "setRecipientManageability:", [v7 unsignedIntegerValue]);

  uint64_t v8 = [v2 activeCapabilityRole];
  [(PKPassSharedEntitlement *)v3 setRecipientCapabilityRole:v8];

  return v3;
}

- (PKPassEntitlementsComposer)initWithSharedEntitlements:(id)a3 availableEntitlements:(id)a4 editable:(BOOL)a5
{
  return [(PKPassEntitlementsComposer *)self initWithSharedEntitlements:a3 availableEntitlements:a4 predefinedSharedEntitlements:0 editable:a5];
}

- (PKPassEntitlementsComposer)initWithSharedEntitlements:(id)a3 availableEntitlements:(id)a4 predefinedSharedEntitlements:(id)a5 editable:(BOOL)a6
{
  return (PKPassEntitlementsComposer *)-[PKPassEntitlementsComposer _initWithSharedEntitlements:availableEntitlements:predefinedSharedEntitlements:editable:isMyEntitlements:](self, a3, a4, a5, a6, 0);
}

uint64_t __135__PKPassEntitlementsComposer__initWithSharedEntitlements_availableEntitlements_predefinedSharedEntitlements_editable_isMyEntitlements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 entitlementIdentifier];
  if (v4 && (id v5 = v4, v6 = [v4 length], v5, v5, v6))
  {
    id v7 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __135__PKPassEntitlementsComposer__initWithSharedEntitlements_availableEntitlements_predefinedSharedEntitlements_editable_isMyEntitlements___block_invoke_2;
    v10[3] = &unk_1E56F5230;
    id v11 = v3;
    uint64_t v8 = objc_msgSend(v7, "pk_containsObjectPassingTest:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __135__PKPassEntitlementsComposer__initWithSharedEntitlements_availableEntitlements_predefinedSharedEntitlements_editable_isMyEntitlements___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) entitlementIdentifier];
  id v5 = [v3 entitlementIdentifier];
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
    int v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      int v10 = 0;
    }
    else {
      int v10 = [v6 isEqualToString:v7];
    }
  }

  if ([*(id *)(a1 + 32) hasCanonicallyEquivalentRightsToPassEntitlement:v3]) {
    int v11 = 1;
  }
  else {
    int v11 = [*(id *)(a1 + 32) hasCanonicallyEquivalentRoleToPassSharedEntitlement:v3];
  }
  uint64_t v12 = v10 & v11;

  return v12;
}

uint64_t __55__PKPassEntitlementsComposer__createEntitlementEntries__block_invoke(uint64_t a1, void *a2)
{
  return [a2 entitlementIdentifier];
}

uint64_t __55__PKPassEntitlementsComposer__createEntitlementEntries__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 displayableEntitlement];
  id v6 = [v4 displayableEntitlement];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __55__PKPassEntitlementsComposer__createEntitlementEntries__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)setPossiblePredefinedSharedEntitlementSelection:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28E10], "pk_createStrongPointerPersonalityToStrongObjects");
    id v65 = v4;
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = v4;
    uint64_t v71 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
    if (v71)
    {
      uint64_t v70 = *(void *)v89;
      v79 = self;
      v68 = v5;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v89 != v70) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v88 + 1) + 8 * v6);
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          BOOL v9 = [v7 sharedEntitlements];
          uint64_t v76 = [v9 countByEnumeratingWithState:&v84 objects:v94 count:16];
          if (v76)
          {
            v69 = v7;
            id v73 = v8;
            id v74 = v9;
            uint64_t v72 = v6;
            id v77 = *(id *)v85;
            unint64_t v10 = 0x1E4F28000uLL;
LABEL_9:
            uint64_t v11 = 0;
            while (1)
            {
              if (*(id *)v85 != v77) {
                objc_enumerationMutation(v74);
              }
              uint64_t v12 = (PKPassEntitlementsComposerPredefinedEntryNode *)*(id *)(*((void *)&v84 + 1) + 8 * v11);
              v13 = v12;
              if (!self) {
                break;
              }
              entitlementEntriesForEntitlementIdentifier = self->_entitlementEntriesForEntitlementIdentifier;
              v15 = [(PKPassEntitlementsComposerPredefinedEntryNode *)v12 entitlementIdentifier];
              uint64_t v16 = [(NSDictionary *)entitlementEntriesForEntitlementIdentifier objectForKeyedSubscript:v15];
              v17 = [v16 displayableEntitlement];
              uint64_t v18 = [v17 entitlement];

              if (!v18)
              {
                int v49 = 0;
                id v5 = v68;
                BOOL v9 = v74;
                goto LABEL_48;
              }
              [v18 shareability];
              id v20 = v19 = v13;
              uint64_t v21 = objc_msgSend(*(id *)(v10 + 3792), "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode recipientShareability](v19, "recipientShareability"));
              if ([v20 containsObject:v21])
              {
                uint64_t v22 = [v18 visibility];
                uint64_t v23 = objc_msgSend(*(id *)(v10 + 3792), "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode recipientVisibility](v19, "recipientVisibility"));
                if ([v22 containsObject:v23])
                {
                  uint64_t v24 = [v18 manageability];
                  v25 = *(void **)(v10 + 3792);
                  v26 = v19;
                  v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode recipientManageability](v19, "recipientManageability"));
                  if ([v24 containsObject:v27])
                  {
                    int v28 = 1;
                  }
                  else if (v79->_isMyEntitlement)
                  {
                    int v28 = [(PKPassEntitlementsComposerPredefinedEntryNode *)v26 hasCanonicallyEquivalentRoleToPassEntitlement:v18];
                  }
                  else
                  {
                    int v28 = 0;
                  }
                }
                else
                {
                  v26 = v19;
                  if (v79->_isMyEntitlement) {
                    int v28 = [(PKPassEntitlementsComposerPredefinedEntryNode *)v19 hasCanonicallyEquivalentRoleToPassEntitlement:v18];
                  }
                  else {
                    int v28 = 0;
                  }
                }

                self = v79;
                id v8 = v73;
              }
              else
              {
                v26 = v19;
                if (self->_isMyEntitlement) {
                  int v28 = [(PKPassEntitlementsComposerPredefinedEntryNode *)v19 hasCanonicallyEquivalentRoleToPassEntitlement:v18];
                }
                else {
                  int v28 = 0;
                }
              }

              id v29 = [v18 timeConfiguration];
              uint64_t v30 = v26;
              uint64_t v31 = [(PKPassEntitlementsComposerEntryNode *)v26 timeConfiguration];
              BOOL v32 = 1;
              if (v31 && v29)
              {
                uint64_t v33 = [v29 intersect:v31];
                BOOL v32 = v33 != 0;
              }
              if ((v28 & v32) != 1)
              {
                id v5 = v68;
                uint64_t v6 = v72;
                BOOL v9 = v74;
                goto LABEL_51;
              }
              uint64_t v34 = self->_entitlementEntriesForEntitlementIdentifier;
              uint64_t v35 = [(PKPassEntitlementsComposerPredefinedEntryNode *)v30 entitlementIdentifier];
              long long v36 = [(NSDictionary *)v34 objectForKeyedSubscript:v35];

              unint64_t v10 = 0x1E4F28000;
              if (!v36) {
                goto LABEL_36;
              }
              uint64_t v37 = [PKPassEntitlementsComposerEntry alloc];
              uint64_t v38 = [v36 displayableEntitlement];
              BOOL v39 = -[PKPassEntitlementsComposerEntry initWithDisplayableEntitlement:parentEntitlementComposer:]((id *)&v37->super.isa, v38, self);

              uint64_t v40 = (void *)[(PKPassEntitlementsComposerPredefinedEntryNode *)v30 copy];
              [v39 setSharedEntitlement:v40];

              [v8 addObject:v39];
              if (v76 == ++v11)
              {
                uint64_t v76 = [v74 countByEnumeratingWithState:&v84 objects:v94 count:16];
                if (v76) {
                  goto LABEL_9;
                }
LABEL_36:

                uint64_t v41 = [PKPassEntitlementsComposerPredefinedSelectionEntry alloc];
                id v42 = v69;
                id v43 = v8;
                int v44 = self;
                if (v41)
                {
                  v92.receiver = v41;
                  v92.super_class = (Class)PKPassEntitlementsComposerPredefinedSelectionEntry;
                  uint64_t v45 = [(PKPassEntitlementsComposer *)&v92 init];
                  uint64_t v41 = (PKPassEntitlementsComposerPredefinedSelectionEntry *)v45;
                  uint64_t v46 = v66;
                  if (v45)
                  {
                    objc_storeStrong((id *)&v45->_availableEntitlements, v69);
                    objc_storeStrong((id *)&v41->_entries, v8);
                    objc_storeWeak((id *)&v41->_parentEntitlementComposer, v44);
                  }
                }
                else
                {
                  uint64_t v46 = v66;
                }

                v75 = v41;
                [v46 addObject:v41];
                BOOL v47 = [[PKPassEntitlementsComposerPredefinedEntryNode alloc] initWithPredefinedSelection:v42 parentEntitlementComposer:v44];
                [(PKPassEntitlementsComposerEntryNode *)v47 setEditable:self->_editable];
                uint64_t v48 = v47;
                int v49 = [(PKPassEntitlementsComposerEntryNode *)v47 children];
                long long v80 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v83 = 0u;
                id v78 = v43;
                uint64_t v50 = [v78 countByEnumeratingWithState:&v80 objects:v93 count:16];
                if (v50)
                {
                  uint64_t v51 = v50;
                  uint64_t v52 = *(void *)v81;
                  do
                  {
                    for (uint64_t i = 0; i != v51; ++i)
                    {
                      if (*(void *)v81 != v52) {
                        objc_enumerationMutation(v78);
                      }
                      v54 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                      v55 = [v54 sharedEntitlement];
                      uint64_t v56 = [PKPassEntitlementsComposerEntitlementEntryNode alloc];
                      v57 = [v54 displayableEntitlement];
                      uint64_t v58 = [(PKPassEntitlementsComposerEntitlementEntryNode *)v56 initWithDisplayableEntitlement:v57 sharedEntitlement:v55 parentEntitlementComposer:v44];

                      -[PKPassEntitlementsComposerEntryNode setShareability:](v58, "setShareability:", [v55 recipientShareability]);
                      -[PKPassEntitlementsComposerEntryNode setVisibility:](v58, "setVisibility:", [v55 recipientVisibility]);
                      -[PKPassEntitlementsComposerEntryNode setManageability:](v58, "setManageability:", [v55 recipientManageability]);
                      -[PKPassEntitlementsComposerEntryNode setIntraAccountSharingEnabled:](v58, "setIntraAccountSharingEnabled:", [v55 intraAccountSharingEnabled]);
                      uint64_t v59 = [v55 timeConfiguration];
                      [(PKPassEntitlementsComposerEntryNode *)v58 setTimeConfiguration:v59];

                      [(PKPassEntitlementsComposerEntryNode *)v58 setParent:v48];
                      self = v79;
                      [(PKPassEntitlementsComposerEntryNode *)v58 setEditable:v79->_editable];
                      [v49 addObject:v58];
                      [(NSMutableArray *)v79->_allEntryNodes addObject:v58];
                    }
                    uint64_t v51 = [v78 countByEnumeratingWithState:&v80 objects:v93 count:16];
                  }
                  while (v51);
                }

                id v5 = v68;
                v13 = v48;
                BOOL v9 = v75;
                [v68 setObject:v48 forKey:v75];
                [(NSMutableArray *)self->_allEntryNodes addObject:v48];
                id v8 = v73;
LABEL_48:

                uint64_t v6 = v72;
LABEL_49:

                goto LABEL_51;
              }
            }
            id v5 = v68;
            uint64_t v6 = v72;
            BOOL v9 = v74;
            goto LABEL_49;
          }
LABEL_51:

          ++v6;
        }
        while (v6 != v71);
        uint64_t v60 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
        uint64_t v71 = v60;
      }
      while (v60);
    }

    if ([v66 count] && objc_msgSend(v5, "count"))
    {
      v61 = (NSArray *)[v66 copy];
      predefinedEntitlementEntries = self->_predefinedEntitlementEntries;
      self->_predefinedEntitlementEntries = v61;

      objc_storeStrong((id *)&self->_predefinedSelectionNodeForPredefinedEntry, v5);
    }

    id v4 = v65;
  }
  else
  {
    uint64_t v63 = self->_predefinedEntitlementEntries;
    self->_predefinedEntitlementEntries = 0;

    predefinedSelectionNodeForPredefinedEntry = self->_predefinedSelectionNodeForPredefinedEntry;
    self->_predefinedSelectionNodeForPredefinedEntry = 0;
  }
}

- (id)addPredefinedSharedEntitlementSelection:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_predefinedEntitlementEntries)
  {
    uint64_t v6 = [v4 identifier];
    predefinedEntitlementEntries = self->_predefinedEntitlementEntries;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__PKPassEntitlementsComposer_addPredefinedSharedEntitlementSelection___block_invoke;
    v22[3] = &unk_1E56F52E0;
    id v23 = v6;
    id v8 = v6;
    BOOL v9 = [(NSArray *)predefinedEntitlementEntries pk_arrayBySafelyApplyingBlock:v22];
    unint64_t v10 = [v9 arrayByAddingObject:v5];
    [(PKPassEntitlementsComposer *)self setPossiblePredefinedSharedEntitlementSelection:v10];
  }
  else
  {
    v25[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [(PKPassEntitlementsComposer *)self setPossiblePredefinedSharedEntitlementSelection:v8];
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = self->_predefinedEntitlementEntries;
  id v12 = (id)[(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "predefinedSelection", (void)v18);

        if (v16 == v5)
        {
          id v12 = v15;
          goto LABEL_14;
        }
      }
      id v12 = (id)[(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v12;
}

id __70__PKPassEntitlementsComposer_addPredefinedSharedEntitlementSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 predefinedSelection];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {

LABEL_10:
    id v11 = 0;
    goto LABEL_12;
  }
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
  }
  else
  {
    char v10 = [v6 isEqualToString:v7];

    if (v10) {
      goto LABEL_10;
    }
  }
  id v11 = v3;
LABEL_12:

  return v11;
}

- (void)setMaxSelectionCount:(unint64_t)a3
{
  self->_maxSelectionCount = a3;
}

- (BOOL)preferDetailedCapabilityDisplay
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = self->_originalSharedEntitlements;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v10 = [v9 recipientShareability];
        if (v10 > v6) {
          unint64_t v6 = v10;
        }
        if (v6 > 1 || [v9 recipientVisibility] == 2)
        {
LABEL_29:
          BOOL v20 = 1;
          goto LABEL_30;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    if (!v6) {
      return 0;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = self->_availableEntitlements;
    uint64_t v11 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v3);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "entitlement", (void)v22);
          uint64_t v16 = [v15 entitlementTemplate];

          v17 = v16;
          if (v17 == @"carKeyEntitlementTemplateV2")
          {

            goto LABEL_29;
          }
          long long v18 = v17;
          if (@"carKeyEntitlementTemplateV2" && v17)
          {
            char v19 = [(__CFString *)v17 isEqualToString:@"carKeyEntitlementTemplateV2"];

            if (v19) {
              goto LABEL_29;
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [(NSArray *)v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v20 = 0;
LABEL_30:

  return v20;
}

- (BOOL)canAllowResharing
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_allEntryNodes;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "editable", (void)v8))
        {
          if ([v6 possibleShareability]) {
            goto LABEL_13;
          }
        }
        else if ([v6 shareability])
        {
LABEL_13:
          LOBYTE(v3) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v3;
}

- (NSArray)entitlementEntries
{
  return self->_entitlementEntries;
}

- (NSArray)composeSharedEntitlements
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = self->_allEntryNodes;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = [v9 parent];

        if (!v10)
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __55__PKPassEntitlementsComposer_composeSharedEntitlements__block_invoke;
          v14[3] = &unk_1E56F5308;
          id v11 = v3;
          id v15 = v11;
          [v9 enumerateEntitlementEntries:v14];
          if ([v11 count])
          {
            uint64_t v12 = (void *)[v11 copy];

            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_13:

  return (NSArray *)v12;
}

void __55__PKPassEntitlementsComposer_composeSharedEntitlements__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 enabled])
  {
    id v3 = [v6 sharedEntitlement];
    uint64_t v4 = (void *)[v3 copy];

    objc_msgSend(v4, "setRecipientShareability:", objc_msgSend(v6, "shareability"));
    objc_msgSend(v4, "setRecipientVisibility:", objc_msgSend(v6, "visibility"));
    objc_msgSend(v4, "setRecipientManageability:", objc_msgSend(v6, "manageability"));
    objc_msgSend(v4, "setIntraAccountSharingEnabled:", objc_msgSend(v6, "intraAccountSharingEnabled"));
    uint64_t v5 = [v6 timeConfiguration];
    [v4 setTimeConfiguration:v5];

    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PKPassEntitlementsComposerPredefinedSelectionEntry)activePredefinedSelectionEntry
{
  id v3 = [(PKPassEntitlementsComposer *)self predefinedEntitlementEntries];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PKPassEntitlementsComposer_activePredefinedSelectionEntry__block_invoke;
  v6[3] = &unk_1E56F5330;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "pk_firstObjectPassingTest:", v6);

  return (PKPassEntitlementsComposerPredefinedSelectionEntry *)v4;
}

uint64_t __60__PKPassEntitlementsComposer_activePredefinedSelectionEntry__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) viewForPredefined:a2];
  uint64_t v3 = [v2 enabled];

  return v3;
}

- (id)localizedSelectedEntitlementSummaryForAccessType:(int64_t)a3
{
  uint64_t v5 = [(PKPassEntitlementsComposer *)self activePredefinedSelectionEntry];
  id v6 = [v5 predefinedSelection];

  if (v6)
  {
    uint64_t v7 = [v6 localizedTitle];
    goto LABEL_16;
  }
  long long v8 = [(PKPassEntitlementsComposer *)self entitlementEntries];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PKPassEntitlementsComposer_localizedSelectedEntitlementSummaryForAccessType___block_invoke;
  v17[3] = &unk_1E56F5358;
  v17[4] = self;
  long long v9 = objc_msgSend(v8, "pk_objectsPassingTest:", v17);
  long long v10 = v9;
  if (a3 != 4)
  {
    if ([v9 count]) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v14 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_NONE";
    goto LABEL_14;
  }
  char v11 = objc_msgSend(v9, "pk_containsObjectPassingTest:", &__block_literal_global_307);
  if (![v10 count]) {
    goto LABEL_10;
  }
  if (v11) {
    goto LABEL_13;
  }
LABEL_8:
  if ([v10 count] != 1)
  {
    uint64_t v15 = [v8 count];
    if (v15 != [v10 count])
    {
LABEL_13:
      uint64_t v14 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_CUSTOM";
      goto LABEL_14;
    }
    uint64_t v14 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_FULL";
LABEL_14:
    uint64_t v7 = PKLocalizedShareableCredentialString(&v14->isa, 0);
    goto LABEL_15;
  }
  uint64_t v12 = [v10 firstObject];
  uint64_t v13 = [v12 displayableEntitlement];
  uint64_t v7 = [v13 localizedTitle];

LABEL_15:
LABEL_16:

  return v7;
}

uint64_t __79__PKPassEntitlementsComposer_localizedSelectedEntitlementSummaryForAccessType___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) viewFor:a2];
  uint64_t v3 = [v2 enabled];

  return v3;
}

BOOL __79__PKPassEntitlementsComposer_localizedSelectedEntitlementSummaryForAccessType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 displayableEntitlement];
  uint64_t v4 = [v3 entitlement];
  uint64_t v5 = [v4 activeCapabilityRole];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [v2 sharedEntitlement];
    long long v8 = [v7 recipientCapabilityRole];
    BOOL v6 = v8 != 0;
  }
  return v6;
}

- (id)globalView
{
  return self->_globalGroup;
}

- (id)viewFor:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSMapTable objectForKey:](self->_entitlementNodeForEntitlementEntry, "objectForKey:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)viewForPredefined:(id)a3
{
  return [(NSMapTable *)self->_predefinedSelectionNodeForPredefinedEntry objectForKey:a3];
}

- (id)viewForEnabledEntitlements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[PKPassEntitlementsComposerEntryNode alloc] initWithIdentifier:@"enabledEntitlements" parentEntitlementComposer:self];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(NSMapTable *)self->_entitlementNodeForEntitlementEntry objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 enabled])
        {
          long long v10 = (void *)[v9 copy];
          [v10 setParent:v3];
          char v11 = [(PKPassEntitlementsComposerEntryNode *)v3 children];
          [v11 addObject:v10];

          [(NSMutableArray *)self->_allEntryNodes addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_allEntryNodes addObject:v3];
  return v3;
}

- (id)_allPossibleCapabilitySetsForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 allPossibleShareability];
  uint64_t v6 = [v4 allPossibleVisibility];
  uint64_t v7 = [v4 allPossibleManageability];

  predefinedCapabilitySets = self->_predefinedCapabilitySets;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__PKPassEntitlementsComposer__allPossibleCapabilitySetsForView___block_invoke;
  v16[3] = &unk_1E56F53A0;
  id v17 = v5;
  id v18 = v6;
  id v19 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = [(NSArray *)predefinedCapabilitySets pk_objectsPassingTest:v16];
  long long v13 = v12;
  if (!v12) {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v12;

  return v14;
}

uint64_t __64__PKPassEntitlementsComposer__allPossibleCapabilitySetsForView___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "shareability"));
  if ([v4 containsObject:v5])
  {
    uint64_t v6 = (void *)a1[5];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "visibility"));
    if ([v6 containsObject:v7])
    {
      long long v8 = (void *)a1[6];
      id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "manageability"));
      uint64_t v10 = [v8 containsObject:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)maxSelectionCount
{
  return self->_maxSelectionCount;
}

- (void)_rootEntryNodeDidSetEnabled:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_allEntryNodes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        if (v10 != v4)
        {
          id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "parent", (void)v12);

          if (!v11) {
            [v10 setEnabled:0 notifyIfRoot:0];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSArray)predefinedEntitlementEntries
{
  return self->_predefinedEntitlementEntries;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEntryNodes, 0);
  objc_storeStrong((id *)&self->_predefinedSelectionNodeForPredefinedEntry, 0);
  objc_storeStrong((id *)&self->_entitlementNodeForEntitlementEntry, 0);
  objc_storeStrong((id *)&self->_globalGroup, 0);
  objc_storeStrong((id *)&self->_predefinedCapabilitySets, 0);
  objc_storeStrong((id *)&self->_predefinedEntitlementEntries, 0);
  objc_storeStrong((id *)&self->_entitlementEntries, 0);
  objc_storeStrong((id *)&self->_entitlementEntriesForEntitlementIdentifier, 0);
  objc_storeStrong((id *)&self->_availableEntitlements, 0);
  objc_storeStrong((id *)&self->_originalSharedEntitlements, 0);
}

@end