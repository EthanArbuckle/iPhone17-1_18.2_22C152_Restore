@interface SDNodeCoalescer
- (NSArray)availableNodes;
- (NSArray)coalescedNodes;
- (NSMutableDictionary)contactIdentifierMap;
- (NSMutableDictionary)originalNodes;
- (SDNodeCoalescer)init;
- (id)coalescedNodesForNewAvailableNodes:(id)a3;
- (id)mappedContactIdentifierForContactIdentifier:(id)a3;
- (id)setMappedContactIdentifier:(id)a3 relatedContactIdentifiers:(id)a4;
- (void)setAvailableNodes:(id)a3;
- (void)setContactIdentifierMap:(id)a3;
- (void)setOriginalNodes:(id)a3;
@end

@implementation SDNodeCoalescer

- (SDNodeCoalescer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDNodeCoalescer;
  v2 = [(SDNodeCoalescer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    originalNodes = v2->_originalNodes;
    v2->_originalNodes = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    contactIdentifierMap = v2->_contactIdentifierMap;
    v2->_contactIdentifierMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)coalescedNodesForNewAvailableNodes:(id)a3
{
  id v83 = a3;
  v88 = objc_opt_new();
  v95 = objc_opt_new();
  v87 = objc_opt_new();
  v84 = objc_opt_new();
  v86 = objc_opt_new();
  uint64_t v5 = self;
  v6 = objc_opt_new();
  objc_storeStrong((id *)&self->_availableNodes, a3);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obj = self->_availableNodes;
  v98 = self;
  v92 = v6;
  id v91 = [(NSArray *)obj countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v110;
    uint64_t v89 = kSFNodeKindRapport;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v110 != v90) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(const char **)(*((void *)&v109 + 1) + 8 * (void)v7);
        v9 = (void *)SFNodeCopyKinds();
        v10 = (void *)SFNodeCopyRealName();
        v11 = (void *)SFNodeCopyContactIdentifiers();
        v12 = (void *)SFNodeCopyContactIdentifier();
        uint64_t v101 = SFNodeCopyUserName();
        unsigned int v93 = [v9 containsObject:v89];
        unsigned int v13 = sub_10005068C();
        if (v11)
        {
          if (v12) {
            goto LABEL_8;
          }
        }
        else
        {
          v11 = sub_1000507A4();
          if (v12)
          {
LABEL_8:
            BOOL v14 = 1;
LABEL_15:
            BOOL v96 = v14;
            v103 = v12;
            goto LABEL_16;
          }
        }
        uint64_t v15 = sub_1000507F0();
        BOOL v14 = v15 != 0;
        if (v15) {
          int v16 = 1;
        }
        else {
          int v16 = v13;
        }
        if (v16 == 1)
        {
          v12 = (void *)v15;
          goto LABEL_15;
        }
        BOOL v96 = 0;
        v103 = 0;
        v12 = (void *)v101;
LABEL_16:
        id v17 = v12;
        v18 = airdrop_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v81 = v93;
          uint64_t v82 = v13;
          uint64_t v79 = v101;
          id v80 = v17;
          v77 = v10;
          v78 = v103;
          v76 = v9;
          NSPrintF();
          v47 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v114 = v8;
          __int16 v115 = 2112;
          v116 = v47;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Coalescing node %@: %@", buf, 0x16u);

          v6 = v92;
        }

        v99 = v17;
        if (v17)
        {
          v94 = v7;
          unsigned int v19 = v13;
          v20 = v11;
          v21 = v10;
          v22 = v9;
          [v6 objectForKeyedSubscript:v17];
          v24 = v23 = v6;
          v25 = sub_1001AC8B8();
          v26 = sub_1001AC768(v24, v25);

          v27 = magic_head_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v114 = "-[SDNodeCoalescer coalescedNodesForNewAvailableNodes:]";
            __int16 v115 = 2112;
            v116 = (const char *)v17;
            __int16 v117 = 2112;
            v118 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s identifier: %@, mostRevelant: %@", buf, 0x20u);
          }

          [v23 setObject:v26 forKeyedSubscript:v17];
          v6 = v23;
          v9 = v22;
          v10 = v21;
          v11 = v20;
          unsigned int v13 = v19;
          v7 = v94;
        }
        else
        {
          v26 = airdrop_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v8;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No identifier found for node %@", buf, 0xCu);
          }
        }

        if (v13)
        {
          v28 = SFNodeCopyIDSDeviceIdentifier();
          if (v28 || (v28 = SFNodeCopyComputerName()) != 0)
          {
            uint64_t v5 = v98;
            v29 = -[NSMutableDictionary objectForKeyedSubscript:](v98->_originalNodes, "objectForKeyedSubscript:", v28, v76);

            if (!v29)
            {
              Copy = (const void *)SFNodeCreateCopy();
              [(NSMutableDictionary *)v98->_originalNodes setObject:Copy forKeyedSubscript:v28];
              CFRelease(Copy);
            }
            v31 = [(NSMutableDictionary *)v98->_originalNodes objectForKeyedSubscript:v28];
            [v88 setObject:v31 forKeyedSubscript:v28];

            v32 = [v95 objectForKeyedSubscript:v28];
            if (v32)
            {
              v33 = v32;
              if (([v32 containsObject:v8] & 1) == 0) {
                [v33 addObject:v8];
              }
            }
            else
            {
              v33 = +[NSMutableArray arrayWithObject:v8];
            }
            [v95 setObject:v33 forKeyedSubscript:v28];
            v45 = (void *)SFNodeCopyModelIdentifier();
            if (v45)
            {
              v46 = (void *)SFNodeCopyIconData();
              [v86 setObject:v46 forKeyedSubscript:v28];
            }
            v6 = v92;
          }
          else
          {
            v28 = airdrop_log();
            uint64_t v5 = v98;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v114 = v8;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "coalescedNodesForNewAvailableNodes: Device ID is not available for %@", buf, 0xCu);
            }
          }
LABEL_53:

          v39 = (void *)v101;
          goto LABEL_54;
        }
        if (v96)
        {
          uint64_t v5 = v98;
          v28 = [(SDNodeCoalescer *)v98 setMappedContactIdentifier:v103 relatedContactIdentifiers:v11];
          v34 = [(NSMutableDictionary *)v98->_originalNodes objectForKeyedSubscript:v28];

          if (!v34)
          {
            v35 = (const void *)SFNodeCreateCopy();
            [(NSMutableDictionary *)v98->_originalNodes setObject:v35 forKeyedSubscript:v28];
            CFRelease(v35);
          }
          v36 = -[NSMutableDictionary objectForKeyedSubscript:](v98->_originalNodes, "objectForKeyedSubscript:", v28, v76);
          [v88 setObject:v36 forKeyedSubscript:v28];

          v37 = [v87 objectForKeyedSubscript:v28];
          if (v37)
          {
            v38 = v37;
            if (([v37 containsObject:v8] & 1) == 0) {
              [v38 addObject:v8];
            }
          }
          else
          {
            v38 = +[NSMutableArray arrayWithObject:v8];
          }
          [v87 setObject:v38 forKeyedSubscript:v28];

          goto LABEL_53;
        }
        v39 = (void *)v101;
        if (v101)
        {
          uint64_t v5 = v98;
          if ((v93 & 1) == 0)
          {
            v40 = [(NSMutableDictionary *)v98->_originalNodes objectForKeyedSubscript:v101];

            if (!v40)
            {
              v41 = (const void *)SFNodeCreateCopy();
              [(NSMutableDictionary *)v98->_originalNodes setObject:v41 forKeyedSubscript:v101];
              CFRelease(v41);
            }
            v42 = -[NSMutableDictionary objectForKeyedSubscript:](v98->_originalNodes, "objectForKeyedSubscript:", v101, v76, v77, v78, v79, v80, v81, v82, v83);
            [v88 setObject:v42 forKeyedSubscript:v101];
          }
          v43 = [v84 objectForKeyedSubscript:v101, v76];
          if (v43)
          {
            v44 = v43;
            if (([v43 containsObject:v8] & 1) == 0) {
              [v44 addObject:v8];
            }
          }
          else
          {
            v44 = +[NSMutableArray arrayWithObject:v8];
          }
          [v84 setObject:v44 forKeyedSubscript:v101];
        }
        else
        {
          [v88 setObject:v8 forKeyedSubscript:v10];
          uint64_t v5 = v98;
        }
LABEL_54:

        v7 = (char *)v7 + 1;
      }
      while (v91 != v7);
      id v48 = [(NSArray *)obj countByEnumeratingWithState:&v109 objects:v122 count:16];
      id v91 = v48;
    }
    while (v48);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v97 = [v88 allValues];
  id v102 = [v97 countByEnumeratingWithState:&v105 objects:v121 count:16];
  if (!v102) {
    goto LABEL_106;
  }
  uint64_t v100 = *(void *)v106;
  do
  {
    v49 = 0;
    do
    {
      if (*(void *)v106 != v100) {
        objc_enumerationMutation(v97);
      }
      v50 = *(const char **)(*((void *)&v105 + 1) + 8 * (void)v49);
      int v51 = sub_10005068C();
      v52 = SFNodeCopyContactIdentifier();
      if (!v52)
      {
        v52 = sub_1000507F0();
      }
      uint64_t v53 = SFNodeCopyUserName();
      v54 = (void *)v53;
      if (v52) {
        char v55 = v51;
      }
      else {
        char v55 = 1;
      }
      if (((v52 == 0) & ~v51) != 0) {
        v56 = (void *)v53;
      }
      else {
        v56 = v52;
      }
      if (v55)
      {
        v57 = 0;
      }
      else
      {
        v57 = [(SDNodeCoalescer *)v5 mappedContactIdentifierForContactIdentifier:v52];
        v56 = v52;
      }
      id v58 = v56;
      if (v58)
      {
        v59 = [v92 objectForKeyedSubscript:v58];
        v60 = +[NSKeyedArchiver archivedDataWithRootObject:v59 requiringSecureCoding:1 error:0];
      }
      else
      {
        v60 = 0;
        v59 = 0;
      }
      v61 = magic_head_log();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        CFStringRef v62 = @"mapped ID %@";
        if (!v57) {
          CFStringRef v62 = @"no mapped ID";
        }
        v114 = v59;
        __int16 v115 = 2112;
        v116 = v50;
        __int16 v117 = 2112;
        v118 = v52;
        __int16 v119 = 2112;
        CFStringRef v120 = v62;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "SDNodeBrowser: Setting score to %@ for node %@ with ID %@ and %@", buf, 0x2Au);
      }

      SFNodeSetRangingData();
      v104 = v54;
      if (sub_10005068C())
      {
        v63 = (void *)SFNodeCopyIDSDeviceIdentifier();
        if (!v63) {
          v63 = (void *)SFNodeCopyComputerName();
        }
        v64 = [v95 objectForKeyedSubscript:v63, v76];
        SFNodeSetSiblingNodes();
        v65 = [v86 objectForKeyedSubscript:v63];
        if (v65) {
          SFNodeSetIconData();
        }

        uint64_t v5 = v98;
        goto LABEL_96;
      }
      if (v57)
      {
        v66 = v87;
        v67 = v57;
LABEL_95:
        v64 = [v66 objectForKeyedSubscript:v67 v76];
        SFNodeSetSiblingNodes();
        goto LABEL_96;
      }
      if (v54)
      {
        v66 = v84;
        v67 = v54;
        goto LABEL_95;
      }
      v69 = airdrop_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v50;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Coalesced node %@ not handled", buf, 0xCu);
      }

      v64 = 0;
LABEL_96:
      if ((unint64_t)objc_msgSend(v64, "count", v76) >= 2)
      {
        v68 = airdrop_log();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v76 = v64;
          NSPrintF();
          v70 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v114 = v50;
          __int16 v115 = 2112;
          v116 = v70;
          _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Coalesced node %@ represents nodes %@", buf, 0x16u);

          uint64_t v5 = v98;
        }
      }
      v49 = (char *)v49 + 1;
    }
    while (v102 != v49);
    id v71 = [v97 countByEnumeratingWithState:&v105 objects:v121 count:16];
    id v102 = v71;
  }
  while (v71);
LABEL_106:

  uint64_t v72 = [v88 allValues];
  coalescedNodes = v5->_coalescedNodes;
  v5->_coalescedNodes = (NSArray *)v72;

  v74 = v5->_coalescedNodes;
  return v74;
}

- (id)setMappedContactIdentifier:(id)a3 relatedContactIdentifiers:(id)a4
{
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
      unsigned int v13 = [(NSMutableDictionary *)self->_contactIdentifierMap objectForKeyedSubscript:v12];

      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = [(NSMutableDictionary *)self->_contactIdentifierMap objectForKeyedSubscript:v12];

    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v14 = v6;
LABEL_12:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contactIdentifierMap, "objectForKeyedSubscript:", v20, (void)v23);

        if (!v21) {
          [(NSMutableDictionary *)self->_contactIdentifierMap setObject:v14 forKeyedSubscript:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  return v14;
}

- (id)mappedContactIdentifierForContactIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_contactIdentifierMap objectForKeyedSubscript:a3];
}

- (NSArray)availableNodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvailableNodes:(id)a3
{
}

- (NSArray)coalescedNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)originalNodes
{
  return self->_originalNodes;
}

- (void)setOriginalNodes:(id)a3
{
}

- (NSMutableDictionary)contactIdentifierMap
{
  return self->_contactIdentifierMap;
}

- (void)setContactIdentifierMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifierMap, 0);
  objc_storeStrong((id *)&self->_originalNodes, 0);
  objc_storeStrong((id *)&self->_coalescedNodes, 0);

  objc_storeStrong((id *)&self->_availableNodes, 0);
}

@end