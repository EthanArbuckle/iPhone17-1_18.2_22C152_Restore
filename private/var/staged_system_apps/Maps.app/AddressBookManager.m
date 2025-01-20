@interface AddressBookManager
+ (BOOL)addressBookAllowed;
+ (id)sharedManager;
- (AddressBookAddress)meCardHomeAddress;
- (AddressBookAddress)meCardSchoolAddress;
- (AddressBookAddress)meCardWorkAddress;
- (AddressBookManager)init;
- (BOOL)meCardExists;
- (CNContact)meCard;
- (CNContactStore)contactStore;
- (MapsSuggestionsCorrectedMapItemProvider)msgCorrectedMapItemProvider;
- (NSArray)allHomeAddresses;
- (NSArray)allOtherAddresses;
- (NSArray)allSchoolAddresses;
- (NSArray)allWorkAddresses;
- (NSArray)properties;
- (NSURL)meCardPunchOutURL;
- (id)_contactWithCacheIdentifier:(id)a3 predicate:(id)a4;
- (id)addressForAddressObject:(id)a3;
- (id)addressForIdentifier:(id)a3;
- (id)contactForCNContactIdentifier:(id)a3;
- (id)contactForRecordId:(int)a3;
- (id)contactWithEmailAddress:(id)a3;
- (id)contactWithPhoneNumber:(id)a3;
- (id)mapItemFormShortcutForCNIdentifier:(id)a3;
- (id)senderNameForAddress:(id)a3 ofType:(id)a4;
- (id)spokenContactNameForAddress:(id)a3 ofType:(id)a4;
- (void)_cancelAddressCollectionTimerIfNeeded;
- (void)_enumerateContactsWithAddress:(id)a3 ofType:(id)a4 handler:(id)a5;
- (void)_updateStoreWithCoalescing:(BOOL)a3;
- (void)collectAddresses;
- (void)createMeCardWithContact:(id)a3 completion:(id)a4;
- (void)performBlockAfterFirstCollection:(id)a3;
- (void)setNeedsAddressCollection;
- (void)updateContact:(id)a3 completion:(id)a4;
- (void)updateStore:(id)a3;
- (void)updateStoreImmediately:(id)a3;
@end

@implementation AddressBookManager

- (NSArray)properties
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054328;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  if (qword_10160F070 != -1) {
    dispatch_once(&qword_10160F070, block);
  }
  return (NSArray *)(id)qword_10160F068;
}

- (void)_cancelAddressCollectionTimerIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_deferredAddressCollectionTimer)
  {
    v4 = sub_10008A498();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      [(GCDTimer *)self->_deferredAddressCollectionTimer invalidate];
      deferredAddressCollectionTimer = self->_deferredAddressCollectionTimer;
      self->_deferredAddressCollectionTimer = 0;

      goto LABEL_10;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(AddressBookManager *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    v11 = [(GCDTimer *)self->_deferredAddressCollectionTimer fireDate];
    [v11 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] cancelling previous deferred address collection timer (had %#.1lfs to go)", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:
  os_unfair_lock_unlock(p_lock);
}

- (CNContactStore)contactStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v5 = sub_10008A498();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      uint64_t v12 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
      v13 = self->_contactStore;
      self->_contactStore = v12;

      contactStore = self->_contactStore;
      goto LABEL_10;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] initialising CNContactStore", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  v14 = contactStore;
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void)setNeedsAddressCollection
{
  [(AddressBookManager *)self _cancelAddressCollectionTimerIfNeeded];
  objc_initWeak(&location, self);
  v3 = sub_10008A498();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(AddressBookManager *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ([v7 isEqualToString:v6] & 1) == 0)
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = 0x3FF0000000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] scheduling deferred address collection in %#.1lfs", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  contactStoreQueue = self->_contactStoreQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001B884;
  v13[3] = &unk_1012E7638;
  objc_copyWeak(&v14, &location);
  v11 = +[GCDTimer scheduledTimerWithTimeInterval:contactStoreQueue queue:0 repeating:v13 block:1.0];
  deferredAddressCollectionTimer = self->_deferredAddressCollectionTimer;
  self->_deferredAddressCollectionTimer = v11;

  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (AddressBookManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)AddressBookManager;
  id v2 = [(AddressBookManager *)&v21 init];
  if (v2)
  {
    v3 = sub_10008A498();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      *((_DWORD *)v2 + 2) = 0;
      uint64_t v10 = +[NSMutableDictionary dictionary];
      v11 = (void *)*((void *)v2 + 11);
      *((void *)v2 + 11) = v10;

      dispatch_group_t v12 = dispatch_group_create();
      v13 = (void *)*((void *)v2 + 6);
      *((void *)v2 + 6) = v12;

      id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create("com.apple.Maps.AddressBookManager.collection", v14);
      __int16 v16 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v15;

      uint64_t v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:v2 selector:"updateStore:" name:CNContactStoreMeContactDidChangeNotification object:0];

      __int16 v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:v2 selector:"updateStore:" name:CNContactStoreDidChangeNotification object:0];

      uint64_t v19 = +[NSNotificationCenter defaultCenter];
      [v19 addObserver:v2 selector:"updateStoreImmediately:" name:off_1015F31C0 object:0];

      dispatch_group_enter(*((dispatch_group_t *)v2 + 6));
      [v2 setNeedsAddressCollection];
      return (AddressBookManager *)v2;
    }
    id v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] initialising", buf, 0xCu);

    goto LABEL_9;
  }
  return (AddressBookManager *)v2;
}

- (void)collectAddresses
{
  v3 = sub_10008A498();
  v140 = self;
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v4 = self;
  if (!v4)
  {
    v9 = @"<nil>";
    goto LABEL_10;
  }
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    v7 = [(AddressBookManager *)v4 performSelector:"accessibilityIdentifier"];
    v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543362;
  v166 = v9;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] will collect address...", buf, 0xCu);

  self = v140;
LABEL_11:

  [(AddressBookManager *)self _cancelAddressCollectionTimerIfNeeded];
  if (+[AddressBookManager addressBookAllowed])
  {
    uint64_t v10 = [(AddressBookManager *)self contactStore];
    v11 = [(AddressBookManager *)self properties];
    id v159 = 0;
    dispatch_group_t v12 = [v10 _ios_meContactWithKeysToFetch:v11 error:&v159];
    id v139 = v159;
  }
  else
  {
    dispatch_group_t v12 = 0;
    id v139 = 0;
  }
  id v147 = objc_alloc_init((Class)NSMutableDictionary);
  id v145 = objc_alloc_init((Class)NSMutableDictionary);
  id v142 = objc_alloc_init((Class)NSMutableDictionary);
  id v141 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = v12;
  v144 = v12;
  if (v12)
  {
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v14 = [v12 postalAddresses];
    id v15 = [v14 countByEnumeratingWithState:&v155 objects:v164 count:16];
    if (!v15) {
      goto LABEL_34;
    }
    id v16 = v15;
    uint64_t v17 = *(void *)v156;
    while (1)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v156 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        v20 = [[AddressBookAddress alloc] initWithContact:v13 addressValue:v19];
        [(AddressBookAddress *)v20 _setSuppressStoreUpdateNotifications:1];
        if (v20)
        {
          objc_super v21 = [(AddressBookAddress *)v20 addressValue];
          v22 = [v21 identifier];

          if (v22)
          {
            v23 = [v19 label];
            unsigned int v24 = [v23 isEqualToString:CNLabelHome];

            if (v24)
            {
              v25 = [(AddressBookAddress *)v20 addressValue];
              v26 = [v25 identifier];
              v27 = v147;
              goto LABEL_26;
            }
            v28 = [v19 label];
            unsigned int v29 = [v28 isEqualToString:CNLabelWork];

            if (v29)
            {
              v25 = [(AddressBookAddress *)v20 addressValue];
              v26 = [v25 identifier];
              v27 = v145;
LABEL_26:
              [v27 setObject:v20 forKey:v26];
            }
            else
            {
              v30 = [v19 label];
              unsigned int v31 = [v30 isEqualToString:CNLabelSchool];

              v25 = [(AddressBookAddress *)v20 addressValue];
              v26 = [v25 identifier];
              if (v31) {
                v32 = v142;
              }
              else {
                v32 = v141;
              }
              [v32 setObject:v20 forKey:v26];
              v13 = v144;
            }
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v155 objects:v164 count:16];
      if (!v16)
      {
LABEL_34:

        self = v140;
        break;
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v34 = sub_10008A498();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v143 = &self->_lock;
    v35 = self;
    if (!v35)
    {
      v40 = @"<nil>";
LABEL_44:

      v138 = v40;
      id v137 = [v147 count];
      id v41 = v147;
      v42 = v41;
      v146 = v34;
      if (v41)
      {
        id v43 = [v41 count];
        if (v43)
        {
          id v44 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v43];
          long long v160 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          v45 = [v42 allKeys];
          v46 = [v45 sortedArrayUsingSelector:"compare:"];

          id obj = v46;
          id v47 = [v46 countByEnumeratingWithState:&v160 objects:buf count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v161;
            do
            {
              for (j = 0; j != v48; j = (char *)j + 1)
              {
                if (*(void *)v161 != v49) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v51 = *(void *)(*((void *)&v160 + 1) + 8 * (void)j);
                id v52 = objc_alloc((Class)NSString);
                v53 = [v42 objectForKeyedSubscript:v51];
                id v54 = [v52 initWithFormat:@"%@: %@", v51, v53];
                [v44 addObject:v54];
              }
              id v48 = [obj countByEnumeratingWithState:&v160 objects:buf count:16];
            }
            while (v48);
          }

          v55 = [v44 componentsJoinedByString:@", "];
          v56 = +[NSString stringWithFormat:@"<%p> {%@}", v42, v55];

          self = v140;
          v34 = v146;
        }
        else
        {
          v56 = +[NSString stringWithFormat:@"<%p> (empty)", v42];
        }
      }
      else
      {
        v56 = @"<nil>";
      }

      v136 = v56;
      id v135 = [v145 count];
      id v57 = v145;
      v58 = v57;
      if (v57)
      {
        id v59 = [v57 count];
        if (v59)
        {
          id v60 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v59];
          long long v160 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          v61 = [v58 allKeys];
          v62 = [v61 sortedArrayUsingSelector:"compare:"];

          id obja = v62;
          id v63 = [v62 countByEnumeratingWithState:&v160 objects:buf count:16];
          if (v63)
          {
            id v64 = v63;
            uint64_t v65 = *(void *)v161;
            do
            {
              for (k = 0; k != v64; k = (char *)k + 1)
              {
                if (*(void *)v161 != v65) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v67 = *(void *)(*((void *)&v160 + 1) + 8 * (void)k);
                id v68 = objc_alloc((Class)NSString);
                v69 = [v58 objectForKeyedSubscript:v67];
                id v70 = [v68 initWithFormat:@"%@: %@", v67, v69];
                [v60 addObject:v70];
              }
              id v64 = [obja countByEnumeratingWithState:&v160 objects:buf count:16];
            }
            while (v64);
          }

          v71 = [v60 componentsJoinedByString:@", "];
          v72 = +[NSString stringWithFormat:@"<%p> {%@}", v58, v71];

          self = v140;
          v34 = v146;
        }
        else
        {
          v72 = +[NSString stringWithFormat:@"<%p> (empty)", v58];
        }
      }
      else
      {
        v72 = @"<nil>";
      }

      v73 = v72;
      id v74 = [v142 count];
      id v75 = v142;
      v76 = v75;
      if (v75)
      {
        id v77 = [v75 count];
        if (v77)
        {
          id v130 = v74;
          v132 = v73;
          id v78 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v77];
          long long v160 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          v79 = [v76 allKeys];
          v80 = [v79 sortedArrayUsingSelector:"compare:"];

          id objb = v80;
          id v81 = [v80 countByEnumeratingWithState:&v160 objects:buf count:16];
          if (v81)
          {
            id v82 = v81;
            uint64_t v83 = *(void *)v161;
            do
            {
              for (m = 0; m != v82; m = (char *)m + 1)
              {
                if (*(void *)v161 != v83) {
                  objc_enumerationMutation(objb);
                }
                uint64_t v85 = *(void *)(*((void *)&v160 + 1) + 8 * (void)m);
                id v86 = objc_alloc((Class)NSString);
                v87 = [v76 objectForKeyedSubscript:v85];
                id v88 = [v86 initWithFormat:@"%@: %@", v85, v87];
                [v78 addObject:v88];
              }
              id v82 = [objb countByEnumeratingWithState:&v160 objects:buf count:16];
            }
            while (v82);
          }

          v89 = [v78 componentsJoinedByString:@", "];
          v90 = +[NSString stringWithFormat:@"<%p> {%@}", v76, v89];

          self = v140;
          v34 = v146;
          id v74 = v130;
          v73 = v132;
        }
        else
        {
          v90 = +[NSString stringWithFormat:@"<%p> (empty)", v76];
        }
      }
      else
      {
        v90 = @"<nil>";
      }

      v91 = v90;
      id v134 = [v141 count];
      id v92 = v141;
      v93 = v92;
      if (v92)
      {
        id v94 = [v92 count];
        v13 = v144;
        if (v94)
        {
          v129 = v91;
          id v131 = v74;
          v133 = v73;
          id v95 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v94];
          long long v160 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          v96 = v93;
          v97 = [v93 allKeys];
          v98 = [v97 sortedArrayUsingSelector:"compare:"];

          id objc = v98;
          id v99 = [v98 countByEnumeratingWithState:&v160 objects:buf count:16];
          if (v99)
          {
            id v100 = v99;
            uint64_t v101 = *(void *)v161;
            do
            {
              for (n = 0; n != v100; n = (char *)n + 1)
              {
                if (*(void *)v161 != v101) {
                  objc_enumerationMutation(objc);
                }
                uint64_t v103 = *(void *)(*((void *)&v160 + 1) + 8 * (void)n);
                id v104 = objc_alloc((Class)NSString);
                v105 = [v96 objectForKeyedSubscript:v103];
                id v106 = [v104 initWithFormat:@"%@: %@", v103, v105];
                [v95 addObject:v106];
              }
              id v100 = [objc countByEnumeratingWithState:&v160 objects:buf count:16];
            }
            while (v100);
          }

          v107 = [v95 componentsJoinedByString:@", "];
          v93 = v96;
          objd = +[NSString stringWithFormat:@"<%p> {%@}", v96, v107];

          self = v140;
          v13 = v144;
          v108 = v146;
          id v74 = v131;
          v73 = v133;
          v91 = v129;
          goto LABEL_93;
        }
        objd = +[NSString stringWithFormat:@"<%p> (empty)", v93];
      }
      else
      {
        objd = @"<nil>";
        v13 = v144;
      }
      v108 = v34;
LABEL_93:

      *(_DWORD *)buf = 138545410;
      v166 = v138;
      __int16 v167 = 2048;
      id v168 = v137;
      __int16 v169 = 2114;
      v170 = v136;
      __int16 v171 = 2048;
      id v172 = v135;
      __int16 v173 = 2114;
      v174 = v73;
      __int16 v175 = 2048;
      id v176 = v74;
      __int16 v177 = 2114;
      v178 = v91;
      __int16 v179 = 2048;
      id v180 = v134;
      __int16 v181 = 2114;
      v182 = objd;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "[%{public}@] storing addresses:\n\t%lu Home: %{public}@\n\t%lu Work: %{public}@\n\t%lu School: %{public}@\n\t%lu Other: %{public}@", buf, 0x5Cu);

      p_lock = v143;
      v34 = v108;
      goto LABEL_94;
    }
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    if (objc_opt_respondsToSelector())
    {
      v38 = [(AddressBookManager *)v35 performSelector:"accessibilityIdentifier"];
      v39 = v38;
      if (v38 && ![v38 isEqualToString:v37])
      {
        v40 = +[NSString stringWithFormat:@"%@<%p, %@>", v37, v35, v39];

        goto LABEL_42;
      }
    }
    v40 = +[NSString stringWithFormat:@"%@<%p>", v37, v35];
LABEL_42:

    goto LABEL_44;
  }
LABEL_94:

  objc_storeStrong((id *)&self->_meCard, v13);
  v109 = self->_homeAddresses;
  v110 = self->_workAddresses;
  v111 = self->_schoolAddresses;
  v112 = self->_otherAddresses;
  v113 = (NSDictionary *)[v147 copy];
  homeAddresses = self->_homeAddresses;
  self->_homeAddresses = v113;

  v115 = (NSDictionary *)[v145 copy];
  workAddresses = self->_workAddresses;
  self->_workAddresses = v115;

  v117 = (NSDictionary *)[v142 copy];
  schoolAddresses = self->_schoolAddresses;
  self->_schoolAddresses = v117;

  v119 = (NSDictionary *)[v141 copy];
  otherAddresses = self->_otherAddresses;
  self->_otherAddresses = v119;

  os_unfair_lock_unlock(p_lock);
  sub_10008A3A8(v109);
  sub_10008A3A8(v110);
  sub_10008A3A8(v111);
  sub_10008A3A8(v112);
  if (self->_collectGroup)
  {
    v121 = sub_10008A498();
    if (!os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
LABEL_102:

      dispatch_group_leave((dispatch_group_t)self->_collectGroup);
      collectGroup = self->_collectGroup;
      self->_collectGroup = 0;

      v13 = v144;
      goto LABEL_103;
    }
    v122 = self;
    v123 = (objc_class *)objc_opt_class();
    v124 = NSStringFromClass(v123);
    obje = v109;
    if (objc_opt_respondsToSelector())
    {
      v125 = [(AddressBookManager *)v122 performSelector:"accessibilityIdentifier"];
      v126 = v125;
      if (v125 && ![v125 isEqualToString:v124])
      {
        v127 = +[NSString stringWithFormat:@"%@<%p, %@>", v124, v122, v126];

        goto LABEL_101;
      }
    }
    v127 = +[NSString stringWithFormat:@"%@<%p>", v124, v122];
LABEL_101:

    *(_DWORD *)buf = 138543362;
    v166 = v127;
    _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_INFO, "[%{public}@] completed first address collection", buf, 0xCu);

    v109 = obje;
    goto LABEL_102;
  }
LABEL_103:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10054FD98;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (BOOL)addressBookAllowed
{
  return +[CNContactStore _maps_isAuthorized];
}

- (AddressBookAddress)meCardWorkAddress
{
  id v2 = [(AddressBookManager *)self allWorkAddresses];
  v3 = [v2 firstObject];

  return (AddressBookAddress *)v3;
}

- (AddressBookAddress)meCardSchoolAddress
{
  id v2 = [(AddressBookManager *)self allSchoolAddresses];
  v3 = [v2 firstObject];

  return (AddressBookAddress *)v3;
}

- (AddressBookAddress)meCardHomeAddress
{
  id v2 = [(AddressBookManager *)self allHomeAddresses];
  v3 = [v2 firstObject];

  return (AddressBookAddress *)v3;
}

+ (id)sharedManager
{
  if (qword_10160F060 != -1) {
    dispatch_once(&qword_10160F060, &stru_1012EE920);
  }
  id v2 = (void *)qword_10160F058;

  return v2;
}

- (void)performBlockAfterFirstCollection:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = self->_collectGroup;
    os_unfair_lock_unlock(&self->_lock);
    if (!v5)
    {
      v4[2](v4);
      goto LABEL_12;
    }
    v6 = sub_10008A498();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      dispatch_group_notify((dispatch_group_t)v5, (dispatch_queue_t)&_dispatch_main_q, v4);
LABEL_12:

      goto LABEL_13;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [(AddressBookManager *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        dispatch_group_t v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    dispatch_group_t v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

    *(_DWORD *)buf = 138543362;
    id v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] scheduling post-collection block", buf, 0xCu);

    goto LABEL_10;
  }
LABEL_13:
}

- (MapsSuggestionsCorrectedMapItemProvider)msgCorrectedMapItemProvider
{
  id v2 = self;
  objc_sync_enter(v2);
  msgCorrectedMapItemProvider = v2->_msgCorrectedMapItemProvider;
  if (!msgCorrectedMapItemProvider)
  {
    id v4 = sub_10008A498();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v11 = sub_100018584();
      uint64_t v12 = [v11 oneFavorites];
      shortcutManager = v2->_shortcutManager;
      v2->_shortcutManager = (MapsSuggestionsShortcutManager *)v12;

      objc_initWeak((id *)buf, v2);
      id v14 = objc_alloc((Class)MapsSuggestionsCorrectedMapItemProvider);
      id v15 = v2->_shortcutManager;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10054E988;
      v20[3] = &unk_1012E6708;
      objc_copyWeak(&v21, (id *)buf);
      id v16 = (MapsSuggestionsCorrectedMapItemProvider *)[v14 initWithMeCardReader:v15 handler:v20];
      uint64_t v17 = v2->_msgCorrectedMapItemProvider;
      v2->_msgCorrectedMapItemProvider = v16;

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
      msgCorrectedMapItemProvider = v2->_msgCorrectedMapItemProvider;
      goto LABEL_10;
    }
    v5 = v2;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      v8 = [(AddressBookManager *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ([v8 isEqualToString:v7] & 1) == 0)
      {
        uint64_t v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    uint64_t v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] initialising corrected map item provider", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  __int16 v18 = msgCorrectedMapItemProvider;
  objc_sync_exit(v2);

  return v18;
}

- (void)updateStore:(id)a3
{
  id v4 = a3;
  v5 = sub_10008A498();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      uint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    uint64_t v12 = [v4 name];
    *(_DWORD *)buf = 138543618;
    id v14 = v11;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] received notification %{public}@", buf, 0x16u);
  }
  [(AddressBookManager *)self _updateStoreWithCoalescing:1];
}

- (void)updateStoreImmediately:(id)a3
{
  id v4 = a3;
  v5 = sub_10008A498();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      uint64_t v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    uint64_t v12 = [v4 name];
    *(_DWORD *)buf = 138543618;
    id v14 = v11;
    __int16 v15 = 2114;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] received notification %{public}@", buf, 0x16u);
  }
  [(AddressBookManager *)self _updateStoreWithCoalescing:0];
}

- (void)_updateStoreWithCoalescing:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_10008A498();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  v6 = self;
  if (!v6)
  {
    v11 = @"<nil>";
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
    uint64_t v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  uint64_t v12 = @"NO";
  if (v3) {
    uint64_t v12 = @"YES";
  }
  v13 = v12;
  *(_DWORD *)buf = 138543618;
  uint64_t v17 = v11;
  __int16 v18 = 2114;
  uint64_t v19 = v13;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] updateStoreWithCoalescing: %{public}@", buf, 0x16u);

LABEL_13:
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_contactCache removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  if (v3)
  {
    [(AddressBookManager *)self setNeedsAddressCollection];
  }
  else
  {
    contactStoreQueue = self->_contactStoreQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10054EF7C;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async(contactStoreQueue, block);
  }
}

- (CNContact)meCard
{
  return self->_meCard;
}

- (BOOL)meCardExists
{
  return self->_meCard != 0;
}

- (NSURL)meCardPunchOutURL
{
  if (self->_meCard)
  {
    id v2 = +[NSURL URLWithString:@"contact://show?ref=me"];
  }
  else
  {
    id v2 = 0;
  }

  return (NSURL *)v2;
}

- (void)createMeCardWithContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_contactStoreQueue);
  objc_initWeak(&location, self);
  contactStoreQueue = self->_contactStoreQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10054F0E0;
  v11[3] = &unk_1012E9730;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(contactStoreQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_contactStoreQueue);
  objc_initWeak(&location, self);
  contactStoreQueue = self->_contactStoreQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10054F850;
  v11[3] = &unk_1012E9730;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(contactStoreQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSArray)allHomeAddresses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_homeAddresses allValues];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (NSArray)allWorkAddresses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_workAddresses allValues];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (NSArray)allSchoolAddresses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_schoolAddresses allValues];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (NSArray)allOtherAddresses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_otherAddresses allValues];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (id)mapItemFormShortcutForCNIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(AddressBookManager *)self msgCorrectedMapItemProvider];
    id v6 = [v5 mapItemFormShortcutForCNIdentifier:v4];

    if (v6) {
      id v7 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v6 isPlaceHolderPlace:0];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)contactForRecordId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!+[AddressBookManager addressBookAllowed])
  {
    id v12 = 0;
    goto LABEL_32;
  }
  id v5 = sub_10008A498();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_12;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = (int)v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact for record: %ld...", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v47 = sub_100103CEC;
  id v48 = sub_100104700;
  id v49 = 0;
  id v13 = objc_alloc((Class)CNContactFetchRequest);
  id v14 = +[AddressBookManager sharedManager];
  __int16 v15 = [v14 properties];
  id v16 = [v13 initWithKeysToFetch:v15];

  uint64_t v17 = +[CNContact predicateForLegacyIdentifier:v3];
  [v16 setPredicate:v17];

  [v16 setSortOrder:1];
  __int16 v18 = [(AddressBookManager *)self contactStore];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10055054C;
  v36[3] = &unk_1012EE948;
  v36[4] = buf;
  id v37 = 0;
  [v18 enumerateContactsWithFetchRequest:v16 error:&v37 usingBlock:v36];
  id v19 = v37;

  v20 = sub_10008A498();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = self;
    if (!v21)
    {
      v26 = @"<nil>";
LABEL_22:

      v27 = v26;
      id v28 = *(id *)(*(void *)&buf[8] + 40);
      if (!v28)
      {
        v33 = @"<nil>";
        goto LABEL_30;
      }
      unsigned int v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      if (objc_opt_respondsToSelector())
      {
        unsigned int v31 = [v28 performSelector:"accessibilityIdentifier"];
        v32 = v31;
        if (v31 && ([v31 isEqualToString:v30] & 1) == 0)
        {
          v33 = +[NSString stringWithFormat:@"%@<%p, %@>", v30, v28, v32];

          goto LABEL_28;
        }
      }
      v33 = +[NSString stringWithFormat:@"%@<%p>", v30, v28];
LABEL_28:

LABEL_30:
      uint64_t v34 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v38 = 138544131;
      v39 = v27;
      __int16 v40 = 2114;
      id v41 = v33;
      __int16 v42 = 2048;
      uint64_t v43 = (int)v3;
      __int16 v44 = 2113;
      uint64_t v45 = v34;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] ... found record %{public}@ for id %ld: %{private}@ ", v38, 0x2Au);

      goto LABEL_31;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v24 = [(AddressBookManager *)v21 performSelector:"accessibilityIdentifier"];
      v25 = v24;
      if (v24 && ([v24 isEqualToString:v23] & 1) == 0)
      {
        v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_20;
      }
    }
    v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_20:

    goto LABEL_22;
  }
LABEL_31:

  id v12 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

LABEL_32:

  return v12;
}

- (id)contactForCNContactIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v12 = 0;
    goto LABEL_14;
  }
  id v5 = sub_10008A498();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_12;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v11;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact identifier %{public}@", buf, 0x16u);
  }
  id v16 = v4;
  id v13 = +[NSArray arrayWithObjects:&v16 count:1];
  id v14 = +[CNContact predicateForContactsWithIdentifiers:v13];
  id v12 = [(AddressBookManager *)self _contactWithCacheIdentifier:v4 predicate:v14];

LABEL_14:

  return v12;
}

- (id)contactWithEmailAddress:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    __int16 v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "-[AddressBookManager contactWithEmailAddress:]";
      __int16 v20 = 2080;
      id v21 = "AddressBookAddress.m";
      __int16 v22 = 1024;
      int v23 = 575;
      __int16 v24 = 2080;
      v25 = "emailAddress";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (![v4 length])
  {
    id v12 = 0;
    goto LABEL_15;
  }
  id v5 = sub_10008A498();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_13;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_10;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

LABEL_13:
    *(_DWORD *)buf = 138543619;
    __int16 v19 = (const char *)v11;
    __int16 v20 = 2113;
    id v21 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact for email %{private}@", buf, 0x16u);
  }
  id v13 = +[CNContact predicateForContactsMatchingEmailAddress:v4];
  id v12 = [(AddressBookManager *)self _contactWithCacheIdentifier:v4 predicate:v13];

LABEL_15:

  return v12;
}

- (id)contactWithPhoneNumber:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v20 = "-[AddressBookManager contactWithPhoneNumber:]";
      __int16 v21 = 2080;
      __int16 v22 = "AddressBookAddress.m";
      __int16 v23 = 1024;
      int v24 = 586;
      __int16 v25 = 2080;
      v26 = "phoneNumber";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (![v4 length])
  {
    id v12 = 0;
    goto LABEL_15;
  }
  id v5 = sub_10008A498();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_13;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(AddressBookManager *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_10;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

LABEL_13:
    *(_DWORD *)buf = 138543619;
    __int16 v20 = (const char *)v11;
    __int16 v21 = 2113;
    __int16 v22 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will fetch contact for phone %{private}@", buf, 0x16u);
  }
  id v13 = +[CNPhoneNumber phoneNumberWithStringValue:v4];
  id v14 = +[CNContact predicateForContactsMatchingPhoneNumber:v13];
  id v12 = [(AddressBookManager *)self _contactWithCacheIdentifier:v4 predicate:v14];

LABEL_15:

  return v12;
}

- (id)_contactWithCacheIdentifier:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (+[AddressBookManager addressBookAllowed])
    {
      *(void *)id v57 = 0;
      *(void *)&v57[8] = v57;
      *(void *)&v57[16] = 0x3032000000;
      *(void *)&long long v58 = sub_100103CEC;
      *((void *)&v58 + 1) = sub_100104700;
      id v59 = 0;
      os_unfair_lock_lock(&self->_lock);
      if (v6)
      {
        uint64_t v8 = [(NSMutableDictionary *)self->_contactCache objectForKeyedSubscript:v6];
        id v9 = *(void **)(*(void *)&v57[8] + 40);
        *(void *)(*(void *)&v57[8] + 40) = v8;
      }
      os_unfair_lock_unlock(&self->_lock);
      uint64_t v10 = *(void *)(*(void *)&v57[8] + 40);
      v11 = sub_10008A498();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (!v12)
        {
LABEL_24:

          id v25 = *(id *)(*(void *)&v57[8] + 40);
LABEL_53:
          _Block_object_dispose(v57, 8);

          goto LABEL_65;
        }
        id v13 = self;
        if (!v13)
        {
          __int16 v18 = @"<nil>";
          goto LABEL_23;
        }
        id v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        if (objc_opt_respondsToSelector())
        {
          id v16 = [(AddressBookManager *)v13 performSelector:"accessibilityIdentifier"];
          uint64_t v17 = v16;
          if (v16 && ([v16 isEqualToString:v15] & 1) == 0)
          {
            __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

            goto LABEL_13;
          }
        }
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_13:

LABEL_23:
        *(_DWORD *)buf = 138543618;
        id v54 = v18;
        __int16 v55 = 2114;
        id v56 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] fetched cached contact with identifier %{public}@", buf, 0x16u);

        goto LABEL_24;
      }
      if (!v12)
      {
LABEL_27:

        id v26 = objc_alloc((Class)CNContactFetchRequest);
        v27 = [(AddressBookManager *)self properties];
        id v28 = [v26 initWithKeysToFetch:v27];

        [v28 setPredicate:v7];
        [v28 setSortOrder:1];
        unsigned int v29 = [(AddressBookManager *)self contactStore];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1005515F0;
        v51[3] = &unk_1012EE948;
        v51[4] = v57;
        id v52 = 0;
        [v29 enumerateContactsWithFetchRequest:v28 error:&v52 usingBlock:v51];
        id v30 = v52;

        uint64_t v31 = *(void *)(*(void *)&v57[8] + 40);
        v32 = sub_10008A498();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        BOOL v34 = v6 == 0;
        if (!v31) {
          BOOL v34 = 1;
        }
        if (!v34)
        {
          if (!v33)
          {
LABEL_48:

            os_unfair_lock_lock(&self->_lock);
            [(NSMutableDictionary *)self->_contactCache setObject:*(void *)(*(void *)&v57[8] + 40) forKeyedSubscript:v6];
            os_unfair_lock_unlock(&self->_lock);
LABEL_52:
            id v25 = *(id *)(*(void *)&v57[8] + 40);

            goto LABEL_53;
          }
          v35 = self;
          if (!v35)
          {
            v39 = @"<nil>";
            goto LABEL_47;
          }
          v36 = (objc_class *)objc_opt_class();
          v50 = NSStringFromClass(v36);
          if (objc_opt_respondsToSelector())
          {
            id v37 = [(AddressBookManager *)v35 performSelector:"accessibilityIdentifier"];
            v38 = v37;
            if (v37 && ([v37 isEqualToString:v50] & 1) == 0)
            {
              v39 = +[NSString stringWithFormat:@"%@<%p, %@>", v50, v35, v38];

              goto LABEL_37;
            }
          }
          v39 = +[NSString stringWithFormat:@"%@<%p>", v50, v35];
LABEL_37:

LABEL_47:
          *(_DWORD *)buf = 138543618;
          id v54 = v39;
          __int16 v55 = 2114;
          id v56 = v6;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}@] will cache contact with identifier %{public}@", buf, 0x16u);

          goto LABEL_48;
        }
        if (!v33)
        {
LABEL_51:

          goto LABEL_52;
        }
        __int16 v40 = self;
        if (!v40)
        {
          uint64_t v45 = @"<nil>";
          goto LABEL_50;
        }
        id v41 = (objc_class *)objc_opt_class();
        __int16 v42 = NSStringFromClass(v41);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v43 = [(AddressBookManager *)v40 performSelector:"accessibilityIdentifier"];
          __int16 v44 = v43;
          if (v43 && ([v43 isEqualToString:v42] & 1) == 0)
          {
            uint64_t v45 = +[NSString stringWithFormat:@"%@<%p, %@>", v42, v40, v44];

            goto LABEL_45;
          }
        }
        uint64_t v45 = +[NSString stringWithFormat:@"%@<%p>", v42, v40];
LABEL_45:

LABEL_50:
        *(_DWORD *)buf = 138543618;
        id v54 = v45;
        __int16 v55 = 2114;
        id v56 = v6;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}@] no contact found for identifier %{public}@", buf, 0x16u);

        goto LABEL_51;
      }
      __int16 v19 = self;
      if (!v19)
      {
        int v24 = @"<nil>";
        goto LABEL_26;
      }
      __int16 v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      if (objc_opt_respondsToSelector())
      {
        __int16 v22 = [(AddressBookManager *)v19 performSelector:"accessibilityIdentifier"];
        __int16 v23 = v22;
        if (v22 && ([v22 isEqualToString:v21] & 1) == 0)
        {
          int v24 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

          goto LABEL_21;
        }
      }
      int v24 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_21:

LABEL_26:
      *(_DWORD *)buf = 138543618;
      id v54 = v24;
      __int16 v55 = 2114;
      id v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] need to fetch uncached contact with identifier %{public}@", buf, 0x16u);

      goto LABEL_27;
    }
  }
  else
  {
    v46 = sub_1005762E4();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v57 = 136315906;
      *(void *)&v57[4] = "-[AddressBookManager _contactWithCacheIdentifier:predicate:]";
      *(_WORD *)&v57[12] = 2080;
      *(void *)&v57[14] = "AddressBookAddress.m";
      *(_WORD *)&v57[22] = 1024;
      LODWORD(v58) = 597;
      WORD2(v58) = 2080;
      *(void *)((char *)&v58 + 6) = "predicate";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", v57, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v47 = sub_1005762E4();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v48 = +[NSThread callStackSymbols];
        *(_DWORD *)id v57 = 138412290;
        *(void *)&v57[4] = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@", v57, 0xCu);
      }
    }
  }
  id v25 = 0;
LABEL_65:

  return v25;
}

- (id)senderNameForAddress:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = sub_100103CEC;
  __int16 v23 = sub_100104700;
  id v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1005518E0;
  v18[3] = &unk_1012EE948;
  v18[4] = &v19;
  [(AddressBookManager *)self _enumerateContactsWithAddress:v6 ofType:v7 handler:v18];
  uint64_t v8 = sub_10008A498();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = self;
    if (!v9)
    {
      id v14 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      BOOL v12 = [(AddressBookManager *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ([v12 isEqualToString:v11] & 1) == 0)
      {
        id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
    uint64_t v15 = v20[5];
    *(_DWORD *)buf = 138544131;
    id v26 = v14;
    __int16 v27 = 2113;
    uint64_t v28 = v15;
    __int16 v29 = 2113;
    id v30 = v6;
    __int16 v31 = 2113;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] resolved sender name %{private}@ for address \"%{private}@\", type %{private}@", buf, 0x2Au);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)spokenContactNameForAddress:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = sub_100103CEC;
  __int16 v23 = sub_100104700;
  id v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100551BF0;
  v18[3] = &unk_1012EE948;
  v18[4] = &v19;
  [(AddressBookManager *)self _enumerateContactsWithAddress:v6 ofType:v7 handler:v18];
  uint64_t v8 = sub_10008A498();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = self;
    if (!v9)
    {
      id v14 = @"<nil>";
      goto LABEL_10;
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      BOOL v12 = [(AddressBookManager *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ([v12 isEqualToString:v11] & 1) == 0)
      {
        id v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    id v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
    uint64_t v15 = v20[5];
    *(_DWORD *)buf = 138544131;
    id v26 = v14;
    __int16 v27 = 2113;
    uint64_t v28 = v15;
    __int16 v29 = 2113;
    id v30 = v6;
    __int16 v31 = 2113;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] resolved spoken name %{private}@ for address \"%{private}@\", type %{private}@", buf, 0x2Au);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)_enumerateContactsWithAddress:(id)a3 ofType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[AddressBookManager addressBookAllowed]) {
    goto LABEL_18;
  }
  v11 = sub_10008A498();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = self;
    if (!v12)
    {
      uint64_t v17 = @"<nil>";
      goto LABEL_11;
    }
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [(AddressBookManager *)v12 performSelector:"accessibilityIdentifier"];
      id v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        uint64_t v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_9;
      }
    }
    uint64_t v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543875;
    id v26 = v17;
    __int16 v27 = 2113;
    id v28 = v8;
    __int16 v29 = 2113;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] will enumerate contacts with address \"%{private}@\", type %{private}@...", buf, 0x20u);
  }
  id v18 = objc_alloc((Class)CNContactFetchRequest);
  uint64_t v19 = [(AddressBookManager *)self properties];
  id v20 = [v18 initWithKeysToFetch:v19];

  if ([v9 isEqualToString:CNContactEmailAddressesKey])
  {
    uint64_t v21 = +[CNContact predicateForContactsMatchingEmailAddress:v8];
  }
  else if ([v9 isEqualToString:CNContactPhoneNumbersKey])
  {
    __int16 v22 = +[CNPhoneNumber phoneNumberWithStringValue:v8];
    uint64_t v21 = +[CNContact predicateForContactsMatchingPhoneNumber:v22];
  }
  else
  {
    uint64_t v21 = 0;
  }
  [v20 setPredicate:v21];
  [v20 setSortOrder:1];
  __int16 v23 = [(AddressBookManager *)self contactStore];
  uint64_t v24 = 0;
  [v23 enumerateContactsWithFetchRequest:v20 error:&v24 usingBlock:v10];

LABEL_18:
}

- (id)addressForIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    v11 = 0;
    goto LABEL_24;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v30 = *(_OWORD *)&self->_homeAddresses;
  schoolAddresses = self->_schoolAddresses;
  id v5 = +[NSArray arrayWithObjects:&v30 count:3];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_12:

  BOOL v12 = sub_10008A498();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = self;
    if (!v13)
    {
      id v18 = @"<nil>";
      goto LABEL_22;
    }
    id v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      id v16 = [(AddressBookManager *)v13 performSelector:"accessibilityIdentifier"];
      uint64_t v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        id v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_19;
      }
    }
    id v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_19:

LABEL_22:
    *(_DWORD *)buf = 138543875;
    id v25 = v18;
    __int16 v26 = 2113;
    id v27 = v4;
    __int16 v28 = 2113;
    __int16 v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] found match for \"%{private}@\": %{private}@", buf, 0x20u);
  }
LABEL_24:

  return v11;
}

- (id)addressForAddressObject:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v36 = 0;
    goto LABEL_44;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = [(NSDictionary *)self->_homeAddresses allValues];
  v57[0] = v5;
  id v6 = [(NSDictionary *)self->_workAddresses allValues];
  v57[1] = v6;
  __int16 v40 = self;
  id v7 = [(NSDictionary *)self->_schoolAddresses allValues];
  v57[2] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v57 count:3];

  id v39 = [v8 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v39)
  {
    uint64_t v9 = *(void *)v47;
    id v41 = v8;
    uint64_t v38 = *(void *)v47;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v8);
        }
        v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v42 objects:v56 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v43;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v43 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
              id v18 = [v17 geocodedMapItem];

              if (v18)
              {
                uint64_t v19 = [v17 geocodedMapItem];
                long long v20 = [v19 _geoMapItem];
                long long v21 = [v20 addressObject];

                if (v21 && [v21 isEqual:v4])
                {
                  __int16 v29 = sub_10008A498();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    long long v30 = v40;
                    if (v30)
                    {
                      __int16 v31 = (objc_class *)objc_opt_class();
                      id v32 = NSStringFromClass(v31);
                      if ((objc_opt_respondsToSelector() & 1) == 0) {
                        goto LABEL_34;
                      }
                      BOOL v33 = [(AddressBookManager *)v30 performSelector:"accessibilityIdentifier"];
                      BOOL v34 = v33;
                      if (v33 && ![v33 isEqualToString:v32])
                      {
                        v35 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v30, v34];
                      }
                      else
                      {

LABEL_34:
                        v35 = +[NSString stringWithFormat:@"%@<%p>", v32, v30];
                      }
                    }
                    else
                    {
                      v35 = @"<nil>";
                    }

                    *(_DWORD *)buf = 138543875;
                    uint64_t v51 = v35;
                    __int16 v52 = 2113;
                    id v53 = v4;
                    __int16 v54 = 2113;
                    __int16 v55 = v17;
                    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] found match for address object %{private}@: %{private}@", buf, 0x20u);
                  }
                  id v36 = v17;

                  long long v22 = v41;
                  goto LABEL_43;
                }
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v42 objects:v56 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v38;
        uint64_t v8 = v41;
      }
      id v39 = [v41 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v39);
  }

  long long v22 = sub_10008A498();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = v40;
    if (!v23)
    {
      __int16 v28 = @"<nil>";
      goto LABEL_41;
    }
    uint64_t v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      __int16 v26 = [(AddressBookManager *)v23 performSelector:"accessibilityIdentifier"];
      id v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        __int16 v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_27;
      }
    }
    __int16 v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_27:

LABEL_41:
    *(_DWORD *)buf = 138543619;
    uint64_t v51 = v28;
    __int16 v52 = 2113;
    id v53 = v4;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] no match found for address object %{private}@", buf, 0x16u);
  }
  id v36 = 0;
LABEL_43:

LABEL_44:

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutManager, 0);
  objc_storeStrong((id *)&self->_msgCorrectedMapItemProvider, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_otherAddresses, 0);
  objc_storeStrong((id *)&self->_schoolAddresses, 0);
  objc_storeStrong((id *)&self->_workAddresses, 0);
  objc_storeStrong((id *)&self->_homeAddresses, 0);
  objc_storeStrong((id *)&self->_collectGroup, 0);
  objc_storeStrong((id *)&self->_deferredAddressCollectionTimer, 0);
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_contactStoreQueue, 0);
}

@end