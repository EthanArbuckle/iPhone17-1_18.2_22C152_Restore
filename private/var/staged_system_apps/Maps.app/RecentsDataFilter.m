@interface RecentsDataFilter
- (NSPredicate)filterPredicate;
- (RecentsDataFilter)init;
- (RecentsDataFilter)initWithFilterPredicate:(id)a3;
- (RecentsDataFilter)initWithSearchMode:(unsigned int)a3;
- (RecentsDataFilter)initWithSearchMode:(unsigned int)a3 filterPredicate:(id)a4;
- (id)filteredRecents:(id)a3 excludingDuplicatesOfEntries:(id)a4;
- (unsigned)searchMode;
@end

@implementation RecentsDataFilter

- (RecentsDataFilter)initWithSearchMode:(unsigned int)a3 filterPredicate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RecentsDataFilter;
  v8 = [(RecentsDataFilter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_searchMode = a3;
    objc_storeStrong((id *)&v8->_filterPredicate, a4);
  }

  return v9;
}

- (id)filteredRecents:(id)a3 excludingDuplicatesOfEntries:(id)a4
{
  id v5 = a3;
  id v50 = a4;
  v6 = sub_1000AA148();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Filter", "", buf, 2u);
  }

  id v7 = [(RecentsDataFilter *)self filterPredicate];

  if (v7)
  {
    v8 = [(RecentsDataFilter *)self filterPredicate];
    uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];

    v10 = (void *)v9;
  }
  else
  {
    v10 = v5;
  }
  v51 = v10;
  if (![v10 count])
  {
    id v47 = &__NSArray0__struct;
    goto LABEL_58;
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_10044D43C;
  v110[3] = &unk_1012EA7B0;
  id v49 = v11;
  id v111 = v49;
  v61 = objc_retainBlock(v110);
  v57 = +[NSMutableSet set];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v12 = v50;
  id v13 = [v12 countByEnumeratingWithState:&v106 objects:v116 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v107;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v107 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = [v16 MKMapItem];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          v17 = [v16 mapItem:v49];
        }
        v18 = v17;
        if (v17)
        {
          v19 = [v17 _geoMapItem];
          v20 = ((void (*)(void *, void *))v61[2])(v61, v19);

          [v57 addObject:v20];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v106 objects:v116 count:16];
    }
    while (v13);
  }

  v52 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v51 count]);
  *(void *)buf = 0;
  v101 = buf;
  uint64_t v102 = 0x3032000000;
  v103 = sub_100103BFC;
  v104 = sub_100104688;
  id v105 = +[NSMutableDictionary dictionary];
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_10044D4EC;
  v99[3] = &unk_1012EA7D8;
  v99[4] = buf;
  v21 = objc_retainBlock(v99);
  v60 = +[NSMutableSet set];
  v59 = +[NSMutableSet set];
  v58 = +[NSMutableDictionary dictionary];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v51;
  id v22 = [obj countByEnumeratingWithState:&v95 objects:v115 count:16];
  if (!v22) {
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)v96;
  do
  {
    for (j = 0; j != v22; j = (char *)j + 1)
    {
      if (*(void *)v96 != v23) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
      v26 = ((void (*)(void *, void *))v21[2])(v21, v25);
      v27 = v26;
      if (v26)
      {
        v28 = [v26 historyEntry];
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_10044D5FC;
        v89[3] = &unk_1012EA840;
        v94 = v61;
        id v90 = v60;
        id v91 = v58;
        id v92 = v27;
        id v93 = v59;
        [v28 ifSearch:&stru_1012EA7F8 ifRoute:&stru_1012EA818 ifPlaceDisplay:v89 ifTransitLineItem:&stru_1012EA860];

        id v29 = v94;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_30;
        }
        id v29 = v25;
        v30 = [v29 mapItem];
        v31 = [v30 _geoMapItem];
        v32 = ((void (*)(void *, void *))v61[2])(v61, v31);

        [v60 addObject:v32];
      }

LABEL_30:
    }
    id v22 = [obj countByEnumeratingWithState:&v95 objects:v115 count:16];
  }
  while (v22);
LABEL_32:

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v53 = obj;
  id v33 = [v53 countByEnumeratingWithState:&v85 objects:v114 count:16];
  if (!v33) {
    goto LABEL_54;
  }
  uint64_t v56 = *(void *)v86;
  while (2)
  {
    uint64_t v34 = 0;
    while (2)
    {
      if (*(void *)v86 != v56) {
        objc_enumerationMutation(v53);
      }
      v35 = *(void **)(*((void *)&v85 + 1) + 8 * v34);
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x2020000000;
      char v84 = 1;
      *(void *)v75 = 0;
      v76 = v75;
      uint64_t v77 = 0x3032000000;
      v78 = sub_100103BFC;
      v79 = sub_100104688;
      id v80 = 0;
      v36 = ((void (*)(void *, void *))v21[2])(v21, v35);
      v37 = v36;
      if (v36)
      {
        v38 = [v36 historyEntry];
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_10044D6D4;
        v72[3] = &unk_1012EA888;
        v74 = &v81;
        id v73 = v59;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_10044D740;
        v65[3] = &unk_1012EA8B0;
        v65[4] = self;
        v70 = &v81;
        v71 = v75;
        v39 = v61;
        id v69 = v39;
        id v66 = v60;
        id v67 = v58;
        id v68 = v37;
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_10044D8D8;
        v62[3] = &unk_1012EA8D8;
        v64 = v75;
        v63 = v39;
        [v38 ifSearch:v72 ifRoute:v65 ifPlaceDisplay:v62 ifTransitLineItem:&stru_1012EA8F8];

        id v40 = v73;
        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v35;
        v41 = [v40 mapItem];
        v42 = [v41 _geoMapItem];
        uint64_t v43 = ((void (*)(void *, void *))v61[2])(v61, v42);
        v44 = (void *)*((void *)v76 + 5);
        *((void *)v76 + 5) = v43;

LABEL_41:
      }
      if (!*((unsigned char *)v82 + 24)) {
        goto LABEL_49;
      }
      if (!*((void *)v76 + 5)) {
        goto LABEL_47;
      }
      if (objc_msgSend(v57, "containsObject:"))
      {
        *((unsigned char *)v82 + 24) = 0;
        goto LABEL_49;
      }
      if (*((unsigned char *)v82 + 24))
      {
LABEL_47:
        [v52 addObject:v35, v49];
        if (*((void *)v76 + 5)) {
          [v57 addObject:];
        }
      }
      else
      {
LABEL_49:
        v45 = sub_1000AA148();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v112 = 138412290;
          v113 = v35;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "RDFilter discard %@", v112, 0xCu);
        }
      }
      _Block_object_dispose(v75, 8);

      _Block_object_dispose(&v81, 8);
      if (v33 != (id)++v34) {
        continue;
      }
      break;
    }
    id v33 = [v53 countByEnumeratingWithState:&v85 objects:v114 count:16];
    if (v33) {
      continue;
    }
    break;
  }
LABEL_54:

  v46 = sub_1000AA148();
  if (os_signpost_enabled(v46))
  {
    *(_WORD *)v75 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Filter", "", v75, 2u);
  }

  id v47 = [v52 copy];
  _Block_object_dispose(buf, 8);

LABEL_58:

  return v47;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (RecentsDataFilter)initWithSearchMode:(unsigned int)a3
{
  return [(RecentsDataFilter *)self initWithSearchMode:*(void *)&a3 filterPredicate:0];
}

- (RecentsDataFilter)initWithFilterPredicate:(id)a3
{
  return [(RecentsDataFilter *)self initWithSearchMode:1 filterPredicate:a3];
}

- (RecentsDataFilter)init
{
  return [(RecentsDataFilter *)self initWithSearchMode:1];
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (void).cxx_destruct
{
}

@end