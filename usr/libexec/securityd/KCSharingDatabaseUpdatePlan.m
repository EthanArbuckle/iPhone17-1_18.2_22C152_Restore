@interface KCSharingDatabaseUpdatePlan
- (BOOL)applyInTransaction:(__OpaqueSecDbConnection *)a3 withAccessGroups:(id)a4 error:(id *)a5;
- (BOOL)applyInTransaction:(__OpaqueSecDbConnection *)a3 withAccessGroups:(id)a4 updateInfos:(id)a5 error:(id *)a6;
- (BOOL)hasChanges;
- (KCSharingDatabaseUpdatePlan)init;
- (NSMutableArray)insertIntoIncoming;
- (NSMutableArray)insertIntoLocalAndMirror;
- (NSMutableArray)insertIntoMirror;
- (NSMutableArray)insertIntoOutgoing;
- (NSMutableArray)itemsToDelete;
- (NSMutableArray)reinsertIntoLocal;
- (id)groupUpdateInfoFrom:(SecDbItem *)a3 to:(id)a4;
- (id)updateInfoForDeletion:(SecDbItem *)a3;
- (id)updateLocalItemWithRemoteItem:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 withAccessGroups:(id)a5 error:(id *)a6;
@end

@implementation KCSharingDatabaseUpdatePlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToDelete, 0);
  objc_storeStrong((id *)&self->_insertIntoOutgoing, 0);
  objc_storeStrong((id *)&self->_insertIntoMirror, 0);
  objc_storeStrong((id *)&self->_insertIntoIncoming, 0);
  objc_storeStrong((id *)&self->_reinsertIntoLocal, 0);

  objc_storeStrong((id *)&self->_insertIntoLocalAndMirror, 0);
}

- (NSMutableArray)itemsToDelete
{
  return self->_itemsToDelete;
}

- (NSMutableArray)insertIntoOutgoing
{
  return self->_insertIntoOutgoing;
}

- (NSMutableArray)insertIntoMirror
{
  return self->_insertIntoMirror;
}

- (NSMutableArray)insertIntoIncoming
{
  return self->_insertIntoIncoming;
}

- (NSMutableArray)reinsertIntoLocal
{
  return self->_reinsertIntoLocal;
}

- (NSMutableArray)insertIntoLocalAndMirror
{
  return self->_insertIntoLocalAndMirror;
}

- (id)updateLocalItemWithRemoteItem:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 withAccessGroups:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v43 = 0;
  id v11 = [v9 type];
  if (v11 == (id)2)
  {
    v23 = [v9 internetPassword];
    CFDictionaryRef v14 = [v23 attributesWithAccessGroups:v10 error:a6];

    if (v14)
    {
      v24 = [v9 internetPassword];
      id v25 = [(id)objc_opt_class() databaseItemClass];
      v17 = (void *)sub_10011ACF4((uint64_t)v25, v14, dword_10035D2B0, &v43);

      if (v17)
      {
        CFDataRef v26 = sub_10013F924();
        id v42 = 0;
        sub_10011B6B0((uint64_t)v17, v26, (__CFString **)&v42);
        if (v26) {
          CFRelease(v26);
        }
        v19 = (__CFString *)v42;
        if (!v42)
        {
          v35 = _NSConcreteStackBlock;
          uint64_t v36 = 3221225472;
          v37 = sub_1000CB798;
          v38 = &unk_1002F9678;
          id v28 = v17;
          id v39 = v28;
          if ((sub_10011C214((uint64_t)v28, (uint64_t)a4, &v43, (uint64_t)&v35) & 1) != 0
            || (sub_10011C1B8((__CFError *)v43) & 1) != 0)
          {
            v29 = v43;
            if (v43)
            {
              v43 = 0;
              CFRelease(v29);
            }
            v30 = [KCSharingLocalItem alloc];
            id v12 = -[KCSharingLocalItem initPasswordWithInternetPasswordDatabaseItem:error:](v30, "initPasswordWithInternetPasswordDatabaseItem:error:", v28, a6, v35, v36, v37, v38);
            int v31 = 1;
          }
          else
          {
            v34 = v43;
            if (a6)
            {
              int v31 = 0;
              id v12 = 0;
              *a6 = v43;
              v43 = 0;
            }
            else
            {
              if (v43)
              {
                v43 = 0;
                CFRelease(v34);
              }
              int v31 = 0;
              id v12 = 0;
            }
          }

          if (v31) {
            goto LABEL_37;
          }
          goto LABEL_30;
        }
        goto LABEL_20;
      }
LABEL_22:
      v19 = v43;
      if (a6)
      {
        *a6 = v43;
        v43 = 0;
        goto LABEL_28;
      }
      if (!v43) {
        goto LABEL_28;
      }
      v43 = 0;
LABEL_27:
      CFRelease(v19);
      goto LABEL_28;
    }
LABEL_29:
    id v12 = 0;
    goto LABEL_30;
  }
  id v12 = 0;
  if (v11 == (id)1)
  {
    v13 = [v9 privateKey];
    CFDictionaryRef v14 = [v13 attributesWithAccessGroups:v10 error:a6];

    if (v14)
    {
      v15 = [v9 privateKey];
      id v16 = [(id)objc_opt_class() databaseItemClass];
      v17 = (void *)sub_10011ACF4((uint64_t)v16, v14, dword_10035D2B0, &v43);

      if (v17)
      {
        CFDataRef v18 = sub_10013F924();
        id v42 = 0;
        sub_10011B6B0((uint64_t)v17, v18, (__CFString **)&v42);
        if (v18) {
          CFRelease(v18);
        }
        v19 = (__CFString *)v42;
        if (!v42)
        {
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1000CB710;
          v40[3] = &unk_1002F9678;
          id v20 = v17;
          id v41 = v20;
          if ((sub_10011C214((uint64_t)v20, (uint64_t)a4, &v43, (uint64_t)v40) & 1) != 0
            || (sub_10011C1B8((__CFError *)v43) & 1) != 0)
          {
            v21 = v43;
            if (v43)
            {
              v43 = 0;
              CFRelease(v21);
            }
            id v12 = [[KCSharingLocalItem alloc] initPasskeyWithPrivateKeyDatabaseItem:v20 error:a6];
            char v22 = 1;
          }
          else
          {
            v33 = v43;
            if (a6)
            {
              char v22 = 0;
              id v12 = 0;
              *a6 = v43;
              v43 = 0;
            }
            else
            {
              if (v43)
              {
                v43 = 0;
                CFRelease(v33);
              }
              char v22 = 0;
              id v12 = 0;
            }
          }

          if (v22) {
            goto LABEL_37;
          }
LABEL_30:
          v27 = 0;
          goto LABEL_38;
        }
LABEL_20:
        if (a6)
        {
          *a6 = v19;
LABEL_28:

          goto LABEL_29;
        }
        id v42 = 0;
        goto LABEL_27;
      }
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_37:
  id v12 = v12;
  v27 = v12;
LABEL_38:

  return v27;
}

- (BOOL)applyInTransaction:(__OpaqueSecDbConnection *)a3 withAccessGroups:(id)a4 updateInfos:(id)a5 error:(id *)a6
{
  id v99 = a4;
  id v94 = a5;
  id v100 = [(NSMutableArray *)self->_insertIntoMirror mutableCopy];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v97 = self;
  v8 = self->_insertIntoLocalAndMirror;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v135 objects:v145 count:16];
  if (!v9)
  {
    char v96 = 0;
    goto LABEL_39;
  }
  id v10 = v9;
  char v96 = 0;
  uint64_t v11 = *(void *)v136;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v136 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v135 + 1) + 8 * i);
      CFDictionaryRef v14 = (char *)[v13 type];
      if ((unint64_t)(v14 - 1) < 2)
      {
        id v134 = 0;
        v15 = [v13 remoteItemWithAccessGroups:v99 error:&v134];
        id v16 = (KCSharingMirrorEntry *)v134;
        if (v15)
        {
          char v22 = [v15 contents];
          if (v22)
          {
            v133 = v16;
            v23 = [(KCSharingDatabaseUpdatePlan *)v97 updateLocalItemWithRemoteItem:v22 inTransaction:a3 withAccessGroups:v99 error:&v133];
            v24 = v133;

            if (v23)
            {
              if ([v15 isFullyDecoded]) {
                uint64_t v25 = 0;
              }
              else {
                uint64_t v25 = 2;
              }
              CFDataRef v26 = [[KCSharingMirrorEntry alloc] initWithUpdatedLocalItem:v23 forIncomingEntry:v13 flags:v25];
              [v100 addObject:v26];
              v27 = KCSharingLogObject();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v23;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Inserted item into local: %@", buf, 0xCu);
              }

              id v28 = KCSharingLogObject();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v26;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "...with corresponding mirror: %@", buf, 0xCu);
              }

              char v96 = 1;
            }
            else
            {
              CFDataRef v26 = [[KCSharingMirrorEntry alloc] initWithIncomingEntry:v13 flags:8];
              [v100 addObject:v26];
            }

            id v16 = v24;
          }
          else
          {
            v23 = [[KCSharingMirrorEntry alloc] initWithIncomingEntry:v13 flags:2];
            [v100 addObject:v23];
          }

          goto LABEL_33;
        }
LABEL_26:
        v19 = [KCSharingMirrorEntry alloc];
        id v20 = v13;
        uint64_t v21 = 2;
LABEL_27:
        char v22 = [(KCSharingMirrorEntry *)v19 initWithIncomingEntry:v20 flags:v21];
        [v100 addObject:v22];
LABEL_33:

        goto LABEL_34;
      }
      if (v14)
      {
        if (v14 != (char *)3) {
          continue;
        }
        id v132 = 0;
        v15 = [v13 shareWithAccessGroups:v99 error:&v132];
        id v16 = (KCSharingMirrorEntry *)v132;
        if (!v15) {
          goto LABEL_26;
        }
        v17 = [v15 contents];

        if (!v17) {
          goto LABEL_26;
        }
        if ([v15 isFullyDecoded]) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = 2;
        }
        v19 = [KCSharingMirrorEntry alloc];
        id v20 = v13;
        uint64_t v21 = v18;
        goto LABEL_27;
      }
      id v16 = [[KCSharingMirrorEntry alloc] initWithIncomingEntry:v13 flags:2];
      [v100 addObject:v16];
LABEL_34:
    }
    id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v135 objects:v145 count:16];
  }
  while (v10);
LABEL_39:

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v29 = v97->_reinsertIntoLocal;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v128 objects:v143 count:16];
  if (!v30) {
    goto LABEL_70;
  }
  id v31 = v30;
  uint64_t v32 = *(void *)v129;
  while (2)
  {
    uint64_t v33 = 0;
    while (2)
    {
      if (*(void *)v129 != v32) {
        objc_enumerationMutation(v29);
      }
      v34 = *(void **)(*((void *)&v128 + 1) + 8 * v33);
      v35 = (char *)[v34 type];
      if ((unint64_t)(v35 - 1) < 2)
      {
        id v127 = 0;
        id v41 = [v34 remoteItemWithAccessGroups:v99 error:&v127];
        v37 = (KCSharingMirrorEntry *)v127;
        if (v41)
        {
          id v42 = [v41 contents];
          if (v42)
          {
            v126 = v37;
            v43 = [(KCSharingDatabaseUpdatePlan *)v97 updateLocalItemWithRemoteItem:v42 inTransaction:a3 withAccessGroups:v99 error:&v126];
            v44 = v126;

            unsigned int v45 = [v34 flags];
            if (v43)
            {
              if ([v41 isFullyDecoded]) {
                uint64_t v46 = v45 & 0xFFFFFFF5;
              }
              else {
                uint64_t v46 = v45 & 0xFFFFFFF5 | 2;
              }
              v47 = [[KCSharingMirrorEntry alloc] initWithUpdatedLocalItem:v43 forMirrorEntry:v34 flags:v46];
              char v96 = 1;
            }
            else
            {
              v47 = [[KCSharingMirrorEntry alloc] initWithMirrorEntry:v34 flags:v45 & 0xFFFFFFF5 | 8];
            }
            [v100 addObject:v47];

            v37 = v44;
          }
          else
          {
            v43 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v34, [v34 flags] & 0xFFFFFFF5 | 2);
            [v100 addObject:v43];
          }
        }
        else
        {
          id v42 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v34, [v34 flags] & 0xFFFFFFF5 | 2);
          [v100 addObject:v42];
        }

LABEL_67:
      }
      else
      {
        if (!v35)
        {
          v37 = -[KCSharingMirrorEntry initWithMirrorEntry:flags:]([KCSharingMirrorEntry alloc], "initWithMirrorEntry:flags:", v34, [v34 flags] & 0xFFFFFFF5 | 2);
          [v100 addObject:v37];
          goto LABEL_67;
        }
        if (v35 == (char *)3)
        {
          id v125 = 0;
          uint64_t v36 = [v34 shareWithAccessGroups:v99 error:&v125];
          v37 = (KCSharingMirrorEntry *)v125;
          unsigned int v38 = [v34 flags];
          unsigned int v39 = v38;
          if (v36)
          {
            if ([v36 isFullyDecoded]) {
              uint64_t v40 = v39 & 0xFFFFFFF5;
            }
            else {
              uint64_t v40 = v39 & 0xFFFFFFF5 | 2;
            }
          }
          else
          {
            uint64_t v40 = v38 & 0xFFFFFFF5 | 2;
          }
          v48 = [[KCSharingMirrorEntry alloc] initWithMirrorEntry:v34 flags:v40];
          [v100 addObject:v48];

          goto LABEL_67;
        }
      }
      if (v31 != (id)++v33) {
        continue;
      }
      break;
    }
    id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v128 objects:v143 count:16];
    if (v31) {
      continue;
    }
    break;
  }
LABEL_70:

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v49 = v97->_insertIntoIncoming;
  id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v121 objects:v142 count:16];
  if (!v50) {
    goto LABEL_83;
  }
  id v51 = v50;
  uint64_t v52 = *(void *)v122;
  while (2)
  {
    uint64_t v53 = 0;
    while (2)
    {
      if (*(void *)v122 != v52) {
        objc_enumerationMutation(v49);
      }
      v54 = *(void **)(*((void *)&v121 + 1) + 8 * v53);
      *(void *)buf = 0;
      uint64_t v55 = [v54 attributesWithAccessGroups:v99 error:a6];
      if (!v55) {
        goto LABEL_150;
      }
      CFDictionaryRef v56 = (const __CFDictionary *)v55;
      id v57 = [(id)objc_opt_class() databaseItemClass];
      v58 = (void *)sub_10011ACF4((uint64_t)v57, v56, dword_10035D2B0, (__CFString **)buf);
      if (!v58)
      {
LABEL_122:
        v86 = *(const void **)buf;
        if (a6)
        {
          *a6 = *(id *)buf;
          *(void *)buf = 0;
        }
        else if (*(void *)buf)
        {
          *(void *)buf = 0;
          CFRelease(v86);
        }
LABEL_149:

        goto LABEL_150;
      }
      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_1000CC580;
      v119[3] = &unk_1002F9678;
      id v59 = v58;
      id v120 = v59;
      if ((sub_10011C214((uint64_t)v59, (uint64_t)a3, (__CFString **)buf, (uint64_t)v119) & 1) == 0
        && (sub_10011C1B8(*(__CFError **)buf) & 1) == 0)
      {
        v87 = *(const void **)buf;
        if (a6)
        {
          *a6 = *(id *)buf;
          *(void *)buf = 0;
        }
        else if (*(void *)buf)
        {
          *(void *)buf = 0;
          CFRelease(v87);
        }
        id v89 = v120;
LABEL_148:

        goto LABEL_149;
      }
      v60 = *(const void **)buf;
      if (*(void *)buf)
      {
        *(void *)buf = 0;
        CFRelease(v60);
      }

      if (v51 != (id)++v53) {
        continue;
      }
      break;
    }
    id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v121 objects:v142 count:16];
    if (v51) {
      continue;
    }
    break;
  }
LABEL_83:

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v49 = (NSMutableArray *)v100;
  id v61 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v115 objects:v141 count:16];
  if (!v61)
  {
LABEL_96:

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v49 = v97->_insertIntoOutgoing;
    id v71 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v107 objects:v140 count:16];
    if (v71)
    {
      id v72 = v71;
      uint64_t v73 = *(void *)v108;
LABEL_98:
      uint64_t v74 = 0;
      while (1)
      {
        if (*(void *)v108 != v73) {
          objc_enumerationMutation(v49);
        }
        v75 = *(void **)(*((void *)&v107 + 1) + 8 * v74);
        *(void *)buf = 0;
        uint64_t v76 = [v75 attributesWithAccessGroups:v99 error:a6];
        if (!v76) {
          goto LABEL_150;
        }
        CFDictionaryRef v56 = (const __CFDictionary *)v76;
        id v77 = [(id)objc_opt_class() databaseItemClass];
        v78 = (void *)sub_10011ACF4((uint64_t)v77, v56, dword_10035D2B0, (__CFString **)buf);
        if (!v78) {
          goto LABEL_122;
        }
        v105[0] = _NSConcreteStackBlock;
        v105[1] = 3221225472;
        v105[2] = sub_1000CC62C;
        v105[3] = &unk_1002F9678;
        id v59 = v78;
        id v106 = v59;
        if ((sub_10011C214((uint64_t)v59, (uint64_t)a3, (__CFString **)buf, (uint64_t)v105) & 1) == 0
          && (sub_10011C1B8(*(__CFError **)buf) & 1) == 0)
        {
          v92 = *(const void **)buf;
          if (a6)
          {
            *a6 = *(id *)buf;
            *(void *)buf = 0;
          }
          else if (*(void *)buf)
          {
            *(void *)buf = 0;
            CFRelease(v92);
          }
          id v89 = v106;
          goto LABEL_148;
        }
        v79 = *(const void **)buf;
        if (*(void *)buf)
        {
          *(void *)buf = 0;
          CFRelease(v79);
        }

        if (v72 == (id)++v74)
        {
          id v72 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v107 objects:v140 count:16];
          if (v72) {
            goto LABEL_98;
          }
          break;
        }
      }
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v49 = v97->_itemsToDelete;
    id v80 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v101 objects:v139 count:16];
    if (v80)
    {
      id v81 = v80;
      uint64_t v82 = *(void *)v102;
      while (2)
      {
        for (j = 0; j != v81; j = (char *)j + 1)
        {
          if (*(void *)v102 != v82) {
            objc_enumerationMutation(v49);
          }
          v84 = *(CFStringRef ***)(*((void *)&v101 + 1) + 8 * (void)j);
          *(void *)buf = 0;
          if (v94)
          {
            v85 = [(KCSharingDatabaseUpdatePlan *)v97 updateInfoForDeletion:v84];
            if (v85) {
              [v94 addObject:v85];
            }
          }
          if (!sub_10011E5A4(v84, (uint64_t)a3, (CFTypeRef *)buf, (uint64_t)&stru_1002F96C0))
          {
            v90 = *(const void **)buf;
            if (a6)
            {
              *a6 = *(id *)buf;
            }
            else if (*(void *)buf)
            {
              *(void *)buf = 0;
              CFRelease(v90);
            }
            goto LABEL_150;
          }
        }
        id v81 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v101 objects:v139 count:16];
        if (v81) {
          continue;
        }
        break;
      }
    }
    else
    {

      if ((v96 & 1) == 0)
      {
LABEL_137:
        BOOL v91 = 1;
        goto LABEL_151;
      }
    }
    sub_10013F064();
    goto LABEL_137;
  }
  id v62 = v61;
  uint64_t v63 = *(void *)v116;
LABEL_85:
  uint64_t v64 = 0;
  while (1)
  {
    if (*(void *)v116 != v63) {
      objc_enumerationMutation(v49);
    }
    v65 = *(void **)(*((void *)&v115 + 1) + 8 * v64);
    *(void *)buf = 0;
    uint64_t v66 = [v65 attributesWithAccessGroups:v99 error:a6];
    if (!v66) {
      break;
    }
    CFDictionaryRef v56 = (const __CFDictionary *)v66;
    id v67 = [(id)objc_opt_class() databaseItemClass];
    v68 = (void *)sub_10011ACF4((uint64_t)v67, v56, dword_10035D2B0, (__CFString **)buf);
    if (!v68) {
      goto LABEL_122;
    }
    v69 = v68;
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_1000CC5AC;
    v111[3] = &unk_1002F96A0;
    v111[4] = v65;
    id v112 = v94;
    v113 = v97;
    id v59 = v69;
    id v114 = v59;
    if ((sub_10011C214((uint64_t)v59, (uint64_t)a3, (__CFString **)buf, (uint64_t)v111) & 1) == 0
      && (sub_10011C1B8(*(__CFError **)buf) & 1) == 0)
    {
      v88 = *(const void **)buf;
      if (a6)
      {
        *a6 = *(id *)buf;
        *(void *)buf = 0;
      }
      else if (*(void *)buf)
      {
        *(void *)buf = 0;
        CFRelease(v88);
      }

      id v89 = v112;
      goto LABEL_148;
    }
    v70 = *(const void **)buf;
    if (*(void *)buf)
    {
      *(void *)buf = 0;
      CFRelease(v70);
    }

    if (v62 == (id)++v64)
    {
      id v62 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v115 objects:v141 count:16];
      if (v62) {
        goto LABEL_85;
      }
      goto LABEL_96;
    }
  }
LABEL_150:

  BOOL v91 = 0;
LABEL_151:

  return v91;
}

- (BOOL)applyInTransaction:(__OpaqueSecDbConnection *)a3 withAccessGroups:(id)a4 error:(id *)a5
{
  return [(KCSharingDatabaseUpdatePlan *)self applyInTransaction:a3 withAccessGroups:a4 updateInfos:0 error:a5];
}

- (id)updateInfoForDeletion:(SecDbItem *)a3
{
  var1 = a3->var1;
  if (var1 != (SecDbClass *)sub_10000C75C(@"sharingIncomingQueue", &qword_10035D050, (uint64_t)&unk_10035D048))goto LABEL_2; {
  v7 = sub_100119CB8(a3, @"deln");
  }
  if (!v7 || !CFEqual(v7, &off_100325F00)) {
    goto LABEL_2;
  }
  v8 = (NSString *)sub_100119CB8(a3, kSecAttrUUID);
  if (v8) {
    BOOL v9 = CKRecordNameZoneWideShare == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8 != CKRecordNameZoneWideShare)
    {
LABEL_2:
      id v5 = 0;
      goto LABEL_3;
    }
  }
  else if (!CFEqual(v8, CKRecordNameZoneWideShare))
  {
    goto LABEL_2;
  }
  if (!sub_100119CB8(a3, @"zone")) {
    goto LABEL_2;
  }
  uint64_t v11 = (id)sub_100119CB8(a3, @"zone");
  if ([v11 hasPrefix:@"group-"])
  {
    id v12 = [v11 substringFromIndex:([@"group-" length])];
  }
  else
  {
    id v12 = 0;
  }

  id v5 = [objc_alloc((Class)KCSharingGroupUpdateInfo) initWithDepartedGroupID:v12];
  v13 = KCSharingLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138477827;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Group update info: %{private}@", (uint8_t *)&v14, 0xCu);
  }

LABEL_3:

  return v5;
}

- (id)groupUpdateInfoFrom:(SecDbItem *)a3 to:(id)a4
{
  id v5 = a4;
  id v35 = 0;
  v6 = [[KCSharingMirrorEntry alloc] initWithMirrorDatabaseItem:a3 error:&v35];
  id v7 = v35;
  if (!v6)
  {
    id v15 = KCSharingLogObject();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      id v24 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    id v37 = v7;
    CFDataRef v26 = "Existing stored share didn't turn into MirrorEntry: %@";
    v27 = v15;
    uint32_t v28 = 12;
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    goto LABEL_11;
  }
  v8 = [(KCSharingMirrorEntry *)v6 record];
  BOOL v9 = [v8 recordID];
  id v10 = [v9 recordName];
  if (([v10 isEqual:CKRecordNameZoneWideShare] & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v11 = [v5 record];
  id v12 = [v11 recordID];
  v13 = [v12 recordName];
  unsigned __int8 v14 = [v13 isEqual:CKRecordNameZoneWideShare];

  if ((v14 & 1) == 0)
  {
LABEL_10:
    id v15 = KCSharingLogObject();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    CFDataRef v26 = "Stored share or new share isn't actually a share?!";
    v27 = v15;
    uint32_t v28 = 2;
    goto LABEL_20;
  }
  id v15 = [(KCSharingMirrorEntry *)v6 record];
  id v16 = [v5 record];
  v17 = [v16 participants];
  uint64_t v18 = +[NSMutableSet setWithArray:v17];

  v19 = [v15 participants];
  id v20 = +[NSSet setWithArray:v19];
  [v18 minusSet:v20];

  +[NSMutableArray array];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000CCCA8;
  v33[3] = &unk_1002F9650;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v34 = v21;
  [v18 enumerateObjectsUsingBlock:v33];
  if ([v21 count])
  {
    id v22 = objc_alloc((Class)KCSharingGroupUpdateInfo);
    v23 = sub_100046CF4(v16);
    id v24 = [v22 initWithGroup:v23 addedParticipants:v21];

    uint64_t v25 = KCSharingLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Group update info: %{private}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v25 = KCSharingLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v16 recordID];
      id v30 = [v32 zoneID];
      id v31 = sub_10004695C(v30);
      *(_DWORD *)buf = 138412290;
      id v37 = v31;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Group update for %@ with no new participants", buf, 0xCu);
    }
    id v24 = 0;
  }

LABEL_12:

  return v24;
}

- (BOOL)hasChanges
{
  return [(NSMutableArray *)self->_insertIntoLocalAndMirror count]
      || [(NSMutableArray *)self->_reinsertIntoLocal count]
      || [(NSMutableArray *)self->_insertIntoIncoming count]
      || [(NSMutableArray *)self->_insertIntoMirror count]
      || [(NSMutableArray *)self->_insertIntoOutgoing count]
      || [(NSMutableArray *)self->_itemsToDelete count] != 0;
}

- (KCSharingDatabaseUpdatePlan)init
{
  v16.receiver = self;
  v16.super_class = (Class)KCSharingDatabaseUpdatePlan;
  v2 = [(KCSharingDatabaseUpdatePlan *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    insertIntoLocalAndMirror = v2->_insertIntoLocalAndMirror;
    v2->_insertIntoLocalAndMirror = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    reinsertIntoLocal = v2->_reinsertIntoLocal;
    v2->_reinsertIntoLocal = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    insertIntoIncoming = v2->_insertIntoIncoming;
    v2->_insertIntoIncoming = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    insertIntoMirror = v2->_insertIntoMirror;
    v2->_insertIntoMirror = (NSMutableArray *)v9;

    uint64_t v11 = +[NSMutableArray array];
    insertIntoOutgoing = v2->_insertIntoOutgoing;
    v2->_insertIntoOutgoing = (NSMutableArray *)v11;

    uint64_t v13 = +[NSMutableArray array];
    itemsToDelete = v2->_itemsToDelete;
    v2->_itemsToDelete = (NSMutableArray *)v13;
  }
  return v2;
}

@end