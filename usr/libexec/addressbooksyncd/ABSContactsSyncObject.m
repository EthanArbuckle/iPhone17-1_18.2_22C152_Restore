@interface ABSContactsSyncObject
+ (void)clearMeCardSet;
- (ABSContactsSyncObject)init;
- (ABSContactsSyncObject)initWithReality:(id)a3 person:(id)a4 isMe:(BOOL)a5;
- (NSString)accountID;
- (NSString)guid;
- (id)_pBcontainerAttributesForContainer:(id)a3;
- (id)createProtobufWithOptions:(id)a3;
- (id)description;
- (id)objectIdentifier;
- (void)_attachContainerAttributesToWrapper:(id)a3 contact:(id)a4 store:(id)a5;
- (void)_attachInnerContactDataToWrapper:(id)a3 contact:(id)a4 options:(id)a5;
- (void)_attachMiscToWrapper:(id)a3 contact:(id)a4;
@end

@implementation ABSContactsSyncObject

- (ABSContactsSyncObject)init
{
  return 0;
}

- (ABSContactsSyncObject)initWithReality:(id)a3 person:(id)a4 isMe:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)ABSContactsSyncObject;
  v11 = [(ABSContactsSyncObject *)&v36 init];
  if (v11)
  {
    if (!v10)
    {
      v23 = +[NSAssertionHandler currentHandler];
      [v23 handleFailureInMethod:a2 object:v11 file:@"ABSContactsSyncObject.m" lineNumber:59 description:@"nil CNContact passed in"];
    }
    if (!v9)
    {
      v24 = +[NSAssertionHandler currentHandler];
      [v24 handleFailureInMethod:a2 object:v11 file:@"ABSContactsSyncObject.m" lineNumber:60 description:@"reality database is nil"];
    }
    v12 = [v10 identifier];
    v13 = (NSString *)[v12 copy];
    guid = v11->_guid;
    v11->_guid = v13;

    if (![(NSString *)v11->_guid length])
    {
      v25 = +[NSAssertionHandler currentHandler];
      [v25 handleFailureInMethod:a2 object:v11 file:@"ABSContactsSyncObject.m" lineNumber:62 description:@"contact guid is nil or empty"];
    }
    if (v5) {
      [(id)qword_100069CE0 addObject:v11->_guid];
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_100021344;
    v34 = sub_100021354;
    id v35 = 0;
    v15 = +[ABSContactsInterface sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002135C;
    v26[3] = &unk_100055568;
    v29 = &v30;
    id v16 = v9;
    id v27 = v16;
    id v17 = v10;
    id v28 = v17;
    [v15 accessSync:v26];

    v18 = (NSString *)[(id)v31[5] copy];
    accountID = v11->_accountID;
    v11->_accountID = v18;

    v20 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v11->_accountID;
      *(_DWORD *)buf = 134218754;
      id v38 = v16;
      __int16 v39 = 2048;
      id v40 = v17;
      __int16 v41 = 1024;
      BOOL v42 = v5;
      __int16 v43 = 2114;
      v44 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "initWithReality:%p person:%p isMe:%d accountId:%{public}@", buf, 0x26u);
    }

    _Block_object_dispose(&v30, 8);
  }

  return v11;
}

+ (void)clearMeCardSet
{
  qword_100069CE0 = (uint64_t)[objc_alloc((Class)NSMutableSet) initWithCapacity:4];

  _objc_release_x1();
}

- (id)objectIdentifier
{
  v4 = [(ABSContactsSyncObject *)self guid];
  if (!v4)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"ABSContactsSyncObject.m", 84, @"My identifier is nil. CompanionSync would be upset, were I not crashing now." object file lineNumber description];
  }

  return v4;
}

- (void)_attachInnerContactDataToWrapper:(id)a3 contact:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:off_100069A08];
  unsigned int v11 = [v10 isEqualToString:off_100069A18];

  if (v11)
  {
    v12 = [v8 CNFSSerialize];
    [v7 setFastEncodingData:v12];
  }
  else
  {
    v13 = [v9 objectForKeyedSubscript:off_100069A08];
    unsigned int v14 = [v13 isEqualToString:off_100069A28];

    if (v14)
    {
      v12 = +[ABSPBContact toPBContact:v8];
      [v7 setPb:v12];
    }
    else
    {
      id v18 = v8;
      v15 = +[NSArray arrayWithObjects:&v18 count:1];
      id v17 = 0;
      v12 = +[CNContactVCardSerialization dataWithContacts:v15 error:&v17];
      id v16 = v17;

      [v7 setVcardData:v12];
    }
  }
}

- (void)_attachMiscToWrapper:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  [v6 setGuid:v8];

  id v9 = (void *)qword_100069CE0;
  id v10 = [v7 identifier];
  [v6 setIsMe:[v9 containsObject:v10]];

  unsigned int v11 = [v7 valueForKey:CNContactModificationDateKey];
  [v11 timeIntervalSince1970];
  [v6 setModDate:];
  v12 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    unsigned int v14 = [v7 thumbnailImageData];
    *(_DWORD *)buf = 134217984;
    v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending thumbnail: %p", buf, 0xCu);
  }
  v15 = [v7 thumbnailImageData];
  [v6 setThumbnail:v15];

  id v16 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    id v18 = [(ABSContactsSyncObject *)self accountID];
    *(_DWORD *)buf = 138543362;
    v37 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "createProtobufWithOptions:Setting accountExternalIdentifier:%{public}@", buf, 0xCu);
  }
  v19 = [(ABSContactsSyncObject *)self accountID];
  [v6 setAccountExternalIdentifier:v19];

  [v6 setSharedPhotoDisplayPreference:[v7 sharedPhotoDisplayPreference]];
  if ([v6 containsCustomPoster])
  {
    v20 = [v7 watchWallpaperImageData];
    [v6 setWallpaperImageData:v20];

    v21 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = [v6 wallpaperImageData];
      *(_DWORD *)buf = 134217984;
      v37 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending poster: %p", buf, 0xCu);
    }
  }
  else
  {
    v24 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not sending poster", buf, 2u);
    }
  }
  if ([v6 isMe])
  {
    v25 = [v7 wallpaper];
    v26 = [v25 dataRepresentation];
    [v6 setWallpaperDataRepresentation:v26];
  }
  id v27 = [v7 addressingGrammarsEncrypted];
  id v35 = 0;
  id v28 = +[NSKeyedArchiver archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v35];
  id v29 = v35;

  if (v29)
  {
    uint64_t v30 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100037DA4((uint64_t)v29, v30);
    }
  }
  else
  {
    [v6 setEncryptedPronounData:v28];
  }
  v31 = [v7 sensitiveContentConfiguration];
  uint64_t v32 = [v31 dataRepresentation];

  if (v32)
  {
    [v6 setSensitiveContentConfiguration:v32];
  }
  else
  {
    v33 = [v7 sensitiveContentConfiguration];

    if (v33)
    {
      v34 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100037D60(v34);
      }
    }
  }
}

- (void)_attachContainerAttributesToWrapper:(id)a3 contact:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned int v11 = objc_opt_class();
  v12 = [v10 identifier];

  v13 = [v11 containerForContactIdentifier:v12 store:v9];

  unsigned int v14 = [(ABSContactsSyncObject *)self _pBcontainerAttributesForContainer:v13];
  [v8 setContainerAttributes:v14];

  v15 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = [v13 identifier];
    id v18 = [v8 containerAttributes];
    int v19 = 138543618;
    v20 = v17;
    __int16 v21 = 2112;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting container %{public}@ attributes: %@", (uint8_t *)&v19, 0x16u);
  }
}

- (id)_pBcontainerAttributesForContainer:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ABSPBContainerAttributes);
  -[ABSPBContainerAttributes setGuardianRestricted:](v4, "setGuardianRestricted:", [v3 isGuardianRestricted]);
  BOOL v5 = [v3 name];
  [(ABSPBContainerAttributes *)v4 setName:v5];

  id v6 = [v3 type];
  [(ABSPBContainerAttributes *)v4 setType:v6];

  return v4;
}

- (id)createProtobufWithOptions:(id)a3
{
  id v44 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = sub_100021344;
  v65 = sub_100021354;
  id v66 = 0;
  id v3 = [[ABSPBSyncObject alloc] initWithMemo:@"Contact"];
  v4 = objc_alloc_init(ABSPBContactWrapper);
  [(ABSPBSyncObject *)v3 setContactWrapper:v4];
  __int16 v43 = v3;
  id v5 = objc_alloc_init((Class)CNContactStore);
  v48 = v4;
  v45 = sub_100018E28();
  id v6 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:v45];
  id v7 = [(ABSContactsSyncObject *)self guid];
  v70 = v7;
  id v8 = +[NSArray arrayWithObjects:&v70 count:1];
  id v9 = +[CNContact predicateForContactsWithIdentifiers:v8];
  [v6 setPredicate:v9];

  [v6 setUnifyResults:1];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100022374;
  v57[3] = &unk_100055388;
  id v42 = v5;
  id v58 = v42;
  id v41 = v6;
  id v59 = v41;
  v60 = &v61;
  v46 = sub_100005874((uint64_t)v57);
  if (v46)
  {
    id v10 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100037EB8((uint64_t)v46, v10);
    }
LABEL_34:
    id v21 = 0;
LABEL_35:
    objc_super v36 = 0;
    goto LABEL_36;
  }
  unsigned int v11 = [[v62[5] linkedContacts:v41];
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    id v21 = (id)v62[5];
    if (v21) {
      goto LABEL_16;
    }
LABEL_31:
    id v38 = *(id *)(qword_100069D78 + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = [(ABSContactsSyncObject *)self guid];
      sub_100037E1C(v39, buf, v38);
    }

    goto LABEL_34;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v13 = [(id)v62[5] linkedContacts];
  id v14 = [v13 countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v54;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v54 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v18 = [v17 identifier];
        int v19 = [(ABSContactsSyncObject *)self guid];
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          id v21 = v17;
          goto LABEL_15;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_15:

  if (!v21) {
    goto LABEL_31;
  }
LABEL_16:
  [(ABSContactsSyncObject *)self _attachInnerContactDataToWrapper:v48 contact:v21 options:v44];
  [(ABSContactsSyncObject *)self _attachMiscToWrapper:v48 contact:v21];
  v22 = [v21 identifier];
  if (!v22
    || ([v21 identifier],
        v23 = objc_claimAutoreleasedReturnValue(),
        BOOL v24 = [v23 length] == 0,
        v23,
        v22,
        v24))
  {
    v37 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100037E74(v37);
    }
    goto LABEL_35;
  }
  v25 = [(id)v62[5] identifier];
  [(ABSPBContactWrapper *)v48 setLinkGuid:v25];

  [(id)v62[5] linkedContacts];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v26 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v50;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
        v31 = [v30 identifier];
        uint64_t v32 = [v21 identifier];
        unsigned __int8 v33 = [v31 isEqualToString:v32];

        if ((v33 & 1) == 0)
        {
          v34 = objc_alloc_init(ABSPBLinkTo);
          -[ABSPBLinkTo setIsImage:](v34, "setIsImage:", [v30 isPreferredForImage]);
          -[ABSPBLinkTo setIsName:](v34, "setIsName:", [v30 isPreferredForName]);
          id v35 = [v30 identifier];
          [(ABSPBLinkTo *)v34 setToGuid:v35];

          [(ABSPBContactWrapper *)v48 addLinkTo:v34];
        }
      }
      id v27 = [v26 countByEnumeratingWithState:&v49 objects:v67 count:16];
    }
    while (v27);
  }

  [(ABSContactsSyncObject *)self _attachContainerAttributesToWrapper:v48 contact:v21 store:v42];
  [(ABSPBContactWrapper *)v48 clearGroupNames];
  objc_super v36 = [(ABSPBSyncObject *)v43 data];

LABEL_36:
  _Block_object_dispose(&v61, 8);

  return v36;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(ABSContactsSyncObject *)self guid];
  id v6 = +[NSString stringWithFormat:@"<%@:%p,guid=%@>", v4, self, v5];

  return v6;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end