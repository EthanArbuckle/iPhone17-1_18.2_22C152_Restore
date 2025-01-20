@interface SFAirDropBrowser
- (NSArray)people;
- (NSArray)photosAssetIDs;
- (NSArray)urlsBeingShared;
- (NSMutableDictionary)nodeIDToNode;
- (NSString)sendingAppBundleID;
- (NSString)sessionID;
- (SFAirDropBrowser)init;
- (SFAirDropBrowserBatchDelegate)batchDelegate;
- (SFAirDropBrowserDelegate)delegate;
- (SFAirDropBrowserDiffableDelegate)diffableDelegate;
- (void)dealloc;
- (void)getChangedIndexesForClientPeopleList:(id)a3 withCompletion:(id)a4;
- (void)pause;
- (void)resume;
- (void)setBatchDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDelegate:(id)a3;
- (void)setPhotosAssetIDs:(id)a3;
- (void)setSendingAppBundleID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setUrlsBeingShared:(id)a3;
- (void)start;
- (void)stop;
- (void)updateDiscoveredPeople;
@end

@implementation SFAirDropBrowser

- (SFAirDropBrowser)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFAirDropBrowser;
  v2 = [(SFAirDropBrowser *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_browser = 0;
    uint64_t v4 = objc_opt_new();
    nodes = v3->_nodes;
    v3->_nodes = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    nodeIDToNode = v3->_nodeIDToNode;
    v3->_nodeIDToNode = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)dealloc
{
  [(SFAirDropBrowser *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropBrowser;
  [(SFAirDropBrowser *)&v3 dealloc];
}

- (void)start
{
  v13[4] = *MEMORY[0x1E4F143B8];
  if (!self->_browser)
  {
    *(void *)&long long v9 = 0;
    long long v10 = 0u;
    uint64_t v11 = 0;
    *((void *)&v9 + 1) = self;
    objc_super v3 = (__SFBrowser *)SFBrowserCreate(0, @"AirDrop");
    self->_browser = v3;
    SFBrowserSetClient((uint64_t)v3, (uint64_t)browserCallBack, &v9);
    SFBrowserSetDispatchQueue((uint64_t)self->_browser, MEMORY[0x1E4F14428]);
    sendingAppBundleID = &stru_1EF9BDC68;
    urlsBeingShared = self->_urlsBeingShared;
    if (self->_sendingAppBundleID) {
      sendingAppBundleID = (__CFString *)self->_sendingAppBundleID;
    }
    v12[0] = @"BundleID";
    v12[1] = @"URLsBeingShared";
    photosAssetIDs = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (urlsBeingShared) {
      v7 = urlsBeingShared;
    }
    else {
      v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v13[0] = sendingAppBundleID;
    v13[1] = v7;
    if (self->_photosAssetIDs) {
      photosAssetIDs = self->_photosAssetIDs;
    }
    v12[2] = @"PhotosAssetIDs";
    v12[3] = @"ShouldCollectDiscoveryMetrics";
    v13[2] = photosAssetIDs;
    v13[3] = MEMORY[0x1E4F1CC38];
    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, v12, 4, v9, v10, v11);
    SFBrowserSetOptions((uint64_t)self->_browser, (uint64_t)v8);
    SFBrowserOpenNode((uint64_t)self->_browser, 0, self->_sessionID, 0);
  }
}

- (void)pause
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_batchDelegate);

  if (WeakRetained)
  {
    self->_shouldDeliverEmptyUpdates = 1;
    [(SFAirDropBrowser *)self stop];
  }
}

- (void)resume
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_batchDelegate);

  if (WeakRetained)
  {
    [(SFAirDropBrowser *)self start];
  }
}

- (void)stop
{
  browser = self->_browser;
  if (browser)
  {
    SFBrowserInvalidate((uint64_t)browser);
    CFRelease(self->_browser);
    self->_browser = 0;
  }
}

- (void)updateDiscoveredPeople
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  browser = self->_browser;
  if (browser) {
    v5 = (void *)SFBrowserCopyChildren((uint64_t)browser, 0);
  }
  else {
    v5 = 0;
  }
  people = self->_people;
  if (people) {
    v7 = people;
  }
  else {
    v7 = (NSArray *)objc_opt_new();
  }
  v123 = v7;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v160 objects:v174 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v161;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v161 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v160 + 1) + 8 * i);
        v13 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
        v14 = [(NSMutableDictionary *)self->_nodes objectForKeyedSubscript:v13];
        if (v14)
        {
          v15 = v14;
          [v14 updateWithSFNode:v12];
          nodeIDToNode = self->_nodeIDToNode;
          v17 = [v15 nodeIdentifier];
          v18 = nodeIDToNode;
        }
        else
        {
          v15 = +[SFAirDropNode nodeWithSFNode:v12];
          [(NSMutableDictionary *)self->_nodes setObject:v15 forKeyedSubscript:v13];
          v17 = [MEMORY[0x1E4F29128] UUID];
          [v15 setNodeIdentifier:v17];
          v18 = self->_nodeIDToNode;
        }
        [(NSMutableDictionary *)v18 setObject:v15 forKeyedSubscript:v17];

        [v3 addObject:v15];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v160 objects:v174 count:16];
    }
    while (v9);
  }

  v19 = [v3 array];
  v20 = [v19 differenceFromArray:v123];

  v115 = v20;
  if ([v20 hasChanges])
  {
    v21 = airdrop_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v173 = v20;
      _os_log_impl(&dword_1A5389000, v21, OS_LOG_TYPE_DEFAULT, "Updated people: %@", buf, 0xCu);
    }

    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    v22 = [v20 insertions];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v156 objects:v171 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v157;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v157 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v156 + 1) + 8 * j);
          v28 = airdrop_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v27 object];
            *(_DWORD *)buf = 138412290;
            v173 = v29;
            _os_log_impl(&dword_1A5389000, v28, OS_LOG_TYPE_DEFAULT, "Updated people: Adding person %@", buf, 0xCu);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v156 objects:v171 count:16];
      }
      while (v24);
    }

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    v30 = [v115 removals];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v152 objects:v170 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v153;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v153 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v152 + 1) + 8 * k);
          v36 = airdrop_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = [v35 object];
            *(_DWORD *)buf = 138412290;
            v173 = v37;
            _os_log_impl(&dword_1A5389000, v36, OS_LOG_TYPE_DEFAULT, "Updated people: Removing person %@", buf, 0xCu);
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v152 objects:v170 count:16];
      }
      while (v32);
    }
  }
  v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v41 = v123;
  uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v148 objects:v169 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v149;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v149 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void *)(*((void *)&v148 + 1) + 8 * m);
        if ([v3 containsObject:v46]) {
          v47 = v38;
        }
        else {
          v47 = (void *)v40;
        }
        [v47 addObject:v46];
      }
      uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v148 objects:v169 count:16];
    }
    while (v43);
  }

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v48 = v3;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v144 objects:v168 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v145;
    do
    {
      for (uint64_t n = 0; n != v50; ++n)
      {
        if (*(void *)v145 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v144 + 1) + 8 * n);
        if (![(NSArray *)v41 containsObject:v53]) {
          [v39 addObject:v53];
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v144 objects:v168 count:16];
    }
    while (v50);
  }
  v118 = (void *)v40;
  v119 = v41;
  v113 = v48;

  [v39 sortUsingComparator:&__block_literal_global_3];
  v120 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v54 = [MEMORY[0x1E4F1CA48] array];
  v55 = [MEMORY[0x1E4F1CA48] array];
  v56 = [MEMORY[0x1E4F1CA48] array];
  id v57 = v38;
  v58 = [MEMORY[0x1E4F28E60] indexSet];
  v112 = [MEMORY[0x1E4F28E60] indexSet];
  v116 = [MEMORY[0x1E4F1CA48] array];
  v126 = [MEMORY[0x1E4F1CA48] array];
  v114 = [MEMORY[0x1E4F1CA48] array];
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v124 = v39;
  uint64_t v59 = [v124 countByEnumeratingWithState:&v140 objects:v167 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v141;
    do
    {
      for (iuint64_t i = 0; ii != v60; ++ii)
      {
        if (*(void *)v141 != v61) {
          objc_enumerationMutation(v124);
        }
        v63 = *(void **)(*((void *)&v140 + 1) + 8 * ii);
        char v64 = [v63 isSuggestion];
        v65 = v56;
        if ((v64 & 1) == 0)
        {
          char v66 = [v63 isMe];
          v65 = v55;
          if ((v66 & 1) == 0)
          {
            if ([v63 isUnknown]) {
              v65 = (void *)v54;
            }
            else {
              v65 = v120;
            }
          }
        }
        [v65 addObject:v63];
      }
      uint64_t v60 = [v124 countByEnumeratingWithState:&v140 objects:v167 count:16];
    }
    while (v60);
  }

  if ([v57 count])
  {
    unint64_t v67 = 0;
    uint64_t v68 = 0;
    do
    {
      v69 = [v57 objectAtIndexedSubscript:v67];
      if (([v69 isSuggestion] & 1) != 0 || objc_msgSend(v69, "isMe")) {
        ++v68;
      }

      ++v67;
    }
    while ([v57 count] > v67);
  }
  else
  {
    uint64_t v68 = 0;
  }
  v117 = (void *)v54;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v70 = v56;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v136 objects:v166 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v137;
    do
    {
      for (juint64_t j = 0; jj != v72; ++jj)
      {
        if (*(void *)v137 != v73) {
          objc_enumerationMutation(v70);
        }
        [v57 insertObject:*(void *)(*((void *)&v136 + 1) + 8 * jj) atIndex:v68 + jj];
        [v58 addIndex:v68 + jj];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v136 objects:v166 count:16];
      v68 += jj;
    }
    while (v72);
  }

  if ([v57 count])
  {
    unint64_t v75 = 0;
    uint64_t v76 = 0;
    v77 = v116;
    do
    {
      v78 = [v57 objectAtIndexedSubscript:v75];
      if ([v78 isMe])
      {
        [v116 addObject:v78];
        ++v76;
      }

      ++v75;
    }
    while ([v57 count] > v75);
  }
  else
  {
    uint64_t v76 = 0;
    v77 = v116;
  }
  v111 = v70;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v122 = v55;
  uint64_t v79 = [v122 countByEnumeratingWithState:&v132 objects:v165 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v133;
    do
    {
      for (kuint64_t k = 0; kk != v80; ++kk)
      {
        if (*(void *)v133 != v81) {
          objc_enumerationMutation(v122);
        }
        uint64_t v83 = *(void *)(*((void *)&v132 + 1) + 8 * kk);
        [v57 insertObject:v83 atIndex:v76 + kk];
        [v58 addIndex:v76 + kk];
        [v77 addObject:v83];
      }
      uint64_t v80 = [v122 countByEnumeratingWithState:&v132 objects:v165 count:16];
      v76 += kk;
    }
    while (v80);
  }

  if ([v57 count])
  {
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    while (1)
    {
      v86 = [v57 objectAtIndexedSubscript:v84];
      if ([v86 isUnknown]) {
        break;
      }
      ++v85;
      char v88 = [v86 isMe];
      v87 = v126;
      if ((v88 & 1) == 0) {
        goto LABEL_104;
      }
LABEL_105:

      if ([v57 count] <= (unint64_t)++v84) {
        goto LABEL_108;
      }
    }
    v87 = v114;
LABEL_104:
    [v87 addObject:v86];
    goto LABEL_105;
  }
  uint64_t v85 = 0;
LABEL_108:
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v89 = v120;
  uint64_t v90 = [v89 countByEnumeratingWithState:&v128 objects:v164 count:16];
  if (v90)
  {
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v129;
    do
    {
      for (muint64_t m = 0; mm != v91; ++mm)
      {
        if (*(void *)v129 != v92) {
          objc_enumerationMutation(v89);
        }
        uint64_t v94 = *(void *)(*((void *)&v128 + 1) + 8 * mm);
        [v57 insertObject:v94 atIndex:v85 + mm];
        [v58 addIndex:v85 + mm];
        [v126 addObject:v94];
      }
      uint64_t v91 = [v89 countByEnumeratingWithState:&v128 objects:v164 count:16];
      v85 += mm;
    }
    while (v91);
  }

  v95 = [v114 arrayByAddingObjectsFromArray:v117];
  v121 = (void *)[v95 copy];

  v96 = [v57 arrayByAddingObjectsFromArray:v117];
  v97 = self->_people;
  self->_people = v96;

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserWillChangePeople:self];

  v100 = v119;
  if ([(NSArray *)v119 count])
  {
    unint64_t v101 = 0;
    do
    {
      v102 = [(NSArray *)v100 objectAtIndexedSubscript:v101];
      if ([v118 containsObject:v102])
      {
        v103 = p_delegate;
        id v104 = objc_loadWeakRetained((id *)p_delegate);
        [v104 browser:self didDeletePersonAtIndex:v101];

        p_delegate = v103;
        [v112 addIndex:v101];
      }

      ++v101;
      v100 = v119;
    }
    while ([(NSArray *)v119 count] > v101);
  }
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __42__SFAirDropBrowser_updateDiscoveredPeople__block_invoke_2;
  v127[3] = &unk_1E5BBC790;
  v127[4] = self;
  [v58 enumerateIndexesUsingBlock:v127];
  unint64_t v105 = [v57 count];
  if (v105 < [v117 count] + v105)
  {
    unint64_t v106 = v105;
    do
    {
      id v107 = objc_loadWeakRetained((id *)p_delegate);
      [v107 browser:self didInsertPersonAtIndex:v105];

      [v58 addIndex:v105++];
    }
    while (v105 < [v117 count] + v106);
  }
  id v108 = objc_loadWeakRetained((id *)p_delegate);
  [v108 browserDidChangePeople:self];

  id v109 = objc_loadWeakRetained((id *)&self->_diffableDelegate);
  [v109 browserDidUpdateMePeople:v116 knownPeople:v126 unknownPeople:v121];

  if (!self->_shouldDeliverEmptyUpdates || [(NSArray *)self->_people count])
  {
    self->_shouldDeliverEmptyUpdates = 0;
    id v110 = objc_loadWeakRetained((id *)&self->_batchDelegate);
    [v110 browserDidUpdatePeople:self];
  }
}

uint64_t __42__SFAirDropBrowser_updateDiscoveredPeople__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v7 != 0;
  }
  if (v6 && v7)
  {
    if (![v6 isClassroom] || objc_msgSend(v8, "isClassroom"))
    {
      if ([v6 isClassroom] & 1) == 0 && (objc_msgSend(v8, "isClassroom"))
      {
LABEL_14:
        uint64_t v9 = 1;
        goto LABEL_17;
      }
      if (![v6 isClassroomCourse] || objc_msgSend(v8, "isClassroomCourse"))
      {
        if (([v6 isClassroomCourse] & 1) != 0 || (objc_msgSend(v8, "isClassroomCourse") & 1) == 0)
        {
          uint64_t v10 = [v6 displayName];
          uint64_t v11 = [v8 displayName];
          uint64_t v9 = [v10 localizedCaseInsensitiveCompare:v11];

          goto LABEL_17;
        }
        goto LABEL_14;
      }
    }
    uint64_t v9 = -1;
  }
LABEL_17:

  return v9;
}

void __42__SFAirDropBrowser_updateDiscoveredPeople__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained browser:*(void *)(a1 + 32) didInsertPersonAtIndex:a2];
}

- (void)getChangedIndexesForClientPeopleList:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = a4;
  }
  else
  {
    id v9 = a4;
    id v7 = objc_opt_new();
  }
  uint64_t v10 = [(NSArray *)self->_people sortedArrayUsingComparator:&__block_literal_global_135];
  id v13 = 0;
  id v14 = 0;
  objc_msgSend(v7, "sf_differencesFromArray:removedIndexes:insertedIndexes:", v10, &v14, &v13);
  id v11 = v14;
  id v12 = v13;
  (*((void (**)(id, void *, id, id))a4 + 2))(a4, v10, v11, v12);
}

uint64_t __72__SFAirDropBrowser_getChangedIndexesForClientPeopleList_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  id v8 = v7;
  if (v6) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v7 != 0;
  }
  if (v6 && v7)
  {
    if ([v6 isClassroom] && !objc_msgSend(v8, "isClassroom")) {
      goto LABEL_30;
    }
    if (([v6 isClassroom] & 1) != 0 || (objc_msgSend(v8, "isClassroom") & 1) == 0)
    {
      if ([v6 isClassroomCourse] && !objc_msgSend(v8, "isClassroomCourse")) {
        goto LABEL_30;
      }
      if (([v6 isClassroomCourse] & 1) != 0 || (objc_msgSend(v8, "isClassroomCourse") & 1) == 0)
      {
        if ([v6 isSuggestion] && objc_msgSend(v8, "isSuggestion"))
        {
          uint64_t v10 = [v6 model];
          uint64_t v11 = [v8 model];
LABEL_33:
          id v13 = (void *)v11;
          uint64_t v9 = [v10 compare:v11];

          goto LABEL_31;
        }
        if ([v6 isSuggestion] && !objc_msgSend(v8, "isSuggestion")) {
          goto LABEL_30;
        }
        if (([v6 isSuggestion] & 1) != 0 || (objc_msgSend(v8, "isSuggestion") & 1) == 0)
        {
          if ([v6 isMe] && !objc_msgSend(v8, "isMe")) {
            goto LABEL_30;
          }
          if (([v6 isMe] & 1) != 0 || (objc_msgSend(v8, "isMe") & 1) == 0)
          {
            if (![v6 isKnown] || objc_msgSend(v8, "isKnown"))
            {
              if (([v6 isKnown] & 1) != 0 || (objc_msgSend(v8, "isKnown") & 1) == 0)
              {
                uint64_t v10 = [v6 discoveryDate];
                uint64_t v11 = [v8 discoveryDate];
                goto LABEL_33;
              }
              goto LABEL_29;
            }
LABEL_30:
            uint64_t v9 = -1;
            goto LABEL_31;
          }
        }
      }
    }
LABEL_29:
    uint64_t v9 = 1;
  }
LABEL_31:

  return v9;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSArray)people
{
  return self->_people;
}

- (SFAirDropBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAirDropBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFAirDropBrowserBatchDelegate)batchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_batchDelegate);

  return (SFAirDropBrowserBatchDelegate *)WeakRetained;
}

- (void)setBatchDelegate:(id)a3
{
}

- (NSString)sendingAppBundleID
{
  return self->_sendingAppBundleID;
}

- (void)setSendingAppBundleID:(id)a3
{
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
}

- (NSArray)photosAssetIDs
{
  return self->_photosAssetIDs;
}

- (void)setPhotosAssetIDs:(id)a3
{
}

- (SFAirDropBrowserDiffableDelegate)diffableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diffableDelegate);

  return (SFAirDropBrowserDiffableDelegate *)WeakRetained;
}

- (void)setDiffableDelegate:(id)a3
{
}

- (NSMutableDictionary)nodeIDToNode
{
  return self->_nodeIDToNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeIDToNode, 0);
  objc_destroyWeak((id *)&self->_diffableDelegate);
  objc_storeStrong((id *)&self->_photosAssetIDs, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
  objc_destroyWeak((id *)&self->_batchDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

@end