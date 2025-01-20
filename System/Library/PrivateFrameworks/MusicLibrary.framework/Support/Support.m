void sub_100004C58(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t vars8;

  v2 = [*(id *)(a1[4] + 160) objectForKey:a1[5]];
  v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v5 = [objc_alloc((Class)ML3MusicLibrary) initWithPath:a1[5]];
    v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setDelegate:a1[4]];
    v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) connectionPool];
    [v8 setUseDistantWriterConnections:0];

    v9 = a1[5];
    v10 = *(void **)(a1[4] + 160);
    v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
    [v10 setObject:v11 forKey:v9];
  }
}

id sub_100004EBC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldValidateDatabaseForLibrary:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10000550C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_10000555C(uint64_t a1)
{
  [*(id *)(a1 + 32) _logPrivacyAccessWithTransactionIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v15 = 0;
  unsigned __int8 v7 = [v4 executeUntrustedUpdate:v5 withParameters:v6 onTransaction:v3 error:&v15];
  id v8 = v15;
  [*(id *)(a1 + 32) faultForQuery:*(void *)(a1 + 48) fromClientBundleID:*(void *)(a1 + 64) onTrustError:v8];
  v9 = *(void **)(a1 + 72);
  if (v9)
  {
    v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007A54;
    v11[3] = &unk_10002D288;
    id v13 = v9;
    unsigned __int8 v14 = v7;
    id v12 = v8;
    dispatch_async(v10, v11);
  }
}

void sub_10000592C(void *a1)
{
  [*(id *)(a1[4] + 176) setObject:a1[6] forKeyedSubscript:a1[5]];
  v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering transaction %{public}@: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void sub_1000059FC(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 176) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138543618;
      uint64_t v6 = v4;
      __int16 v7 = 2114;
      uint64_t v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unregistering transaction %{public}@:%{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_100005AF0(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v2 = [v1 privacyContext];

  if (v2)
  {
    uint64_t v3 = [v1 privacyContext];
    [v3 logDatabasePrivacyAccess];
  }
  else
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not log database access. privacyContext=nil", v4, 2u);
    }
  }
}

void sub_100006004(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100006030(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 endTransaction];
}

void sub_100006078(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
  __int16 v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Validating successful - starting transaction", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000176A0;
    block[3] = &unk_10002D210;
    block[4] = v8;
    id v16 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    v11 = *(void **)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 88);
    id v17 = v10;
    uint64_t v13 = *(void *)(a1 + 96);
    uint64_t v22 = v12;
    uint64_t v23 = v13;
    id v21 = v11;
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 72);
    dispatch_async(v9, block);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Validation failed - skipping starting a transaction. err=%{public}@", buf, 0xCu);
    }

    uint64_t v14 = *(void *)(a1 + 80);
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v5);
    }
  }
}

void sub_100006FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000700C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    id v9 = v2;
    uint64_t v3 = [v2 client];
    unsigned int v4 = [v3 processID];
    if (v4 == [*(id *)(a1 + 48) processID])
    {
      id v5 = [v3 bundleID];
      id v6 = [*(id *)(a1 + 48) bundleID];
      if (v5 == v6)
      {
      }
      else
      {
        __int16 v7 = v6;
        unsigned __int8 v8 = [v5 isEqual:v6];

        if ((v8 & 1) == 0) {
          goto LABEL_8;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
LABEL_8:

    uint64_t v2 = v9;
  }
}

uint64_t sub_100007A54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t sub_100007A74(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 isEqualToString:MLMediaLibraryServiceMachServiceName])
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (![v8 isEqualToString:@"MLDSupportedServicesMediaLibraryResourcesService"]) {
      goto LABEL_6;
    }
    uint64_t v6 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  *a4 = 1;
LABEL_6:

  return _objc_release_x1();
}

id sub_100007B10(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007A74;
  v3[3] = &unk_10002D5D0;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

unint64_t variable initialization expression of MLDSpotlightIndexMusicAppEntityAssociator.entityTypeIdentifier()
{
  return 0xD000000000000016;
}

void MLDSpotlightIndexMusicAppEntityAssociator.associateAppEntityForEntity(of:persistentID:library:properties:with:)(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v149 = a5;
  os_log_t v153 = a2;
  sub_100008C18(0, &qword_100034860, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v9 = sub_10000B1C8(v8);
  __chkstk_darwin(v9);
  v11 = (char *)&v144 - v10;
  sub_100008C18(0, &qword_100034868, (void (*)(uint64_t))&type metadata accessor for Artwork);
  uint64_t v13 = sub_10000B1C8(v12);
  __chkstk_darwin(v13);
  id v15 = (char *)&v144 - v14;
  sub_100008C18(0, &qword_100034870, (void (*)(uint64_t))&type metadata accessor for MusicSiriRepresentation);
  uint64_t v17 = sub_10000B1C8(v16);
  __chkstk_darwin(v17);
  id v19 = (char *)&v144 - v18;
  uint64_t v154 = type metadata accessor for MusicSiriRepresentation();
  uint64_t v150 = *(void *)(v154 - 8);
  uint64_t v20 = __chkstk_darwin(v154);
  v151 = (char *)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v152 = (char *)&v144 - v22;
  sub_100008C18(0, &qword_100034878, (void (*)(uint64_t))&type metadata accessor for ContentRating);
  uint64_t v24 = sub_10000B1C8(v23);
  uint64_t v25 = __chkstk_darwin(v24);
  v27 = (char *)&v144 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v25);
  v30 = (char *)&v144 - v29;
  __chkstk_darwin(v28);
  v32 = (char *)&v144 - v31;
  if (a1 == 1)
  {
    uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    sub_10000B068(v42, v43);
    swift_bridgeObjectRelease();
    if (v159)
    {
      if (sub_10000B018((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any))
      {
        v44 = v157;
        os_log_t v148 = v156;
        sub_100009508(0, &qword_100034898);
        id v45 = [(id)swift_getObjCClassFromMetadata() identityKind];
        uint64_t v46 = a4;
        v47 = v44;
        v48 = (void *)sub_100009074((uint64_t)v153, 1, v45, v46, a3);

        uint64_t v49 = type metadata accessor for ContentRating();
        sub_10000B184((uint64_t)v32, v50, v51, v49);
        unint64_t v147 = 0xE800000000000000;
        uint64_t v52 = 0x7473696C79616C70;
        goto LABEL_46;
      }
    }
    else
    {
      sub_100008CD0((uint64_t)v158);
    }
    id v66 = v155;
    if (qword_100035000 != -1) {
      swift_once();
    }
    uint64_t v67 = type metadata accessor for Logger();
    v55 = (uint8_t *)sub_1000092CC(v67, (uint64_t)qword_100035038);
    id v68 = v66;
    v58 = Logger.logObject.getter();
    os_log_type_t v69 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v58, v69))
    {

      return;
    }
    swift_slowAlloc();
    v70 = (void *)sub_10000B09C();
    *(_DWORD *)v55 = 138543362;
    v158[0] = (uint64_t)v68;
    id v71 = v68;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v70 = v68;

    _os_log_impl((void *)&_mh_execute_header, v58, v69, "%{public}@ Failed to fetch Playlist name from properties", v55, 0xCu);
    sub_1000094A0();
    sub_10000B168();
    uint64_t v72 = (uint64_t)v70;
LABEL_31:
    sub_10000B050(v72);
    sub_10000B050((uint64_t)v55);

    return;
  }
  if (a1) {
    return;
  }
  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000B068(v33, v34);
  swift_bridgeObjectRelease();
  if (!v159)
  {
    sub_100008CD0((uint64_t)v158);
LABEL_14:
    id v53 = v155;
    if (qword_100035000 != -1) {
      swift_once();
    }
    uint64_t v54 = type metadata accessor for Logger();
    v55 = (uint8_t *)sub_1000092CC(v54, (uint64_t)qword_100035038);
    id v56 = v53;
    swift_bridgeObjectRetain_n();
    v57 = v56;
    v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      swift_slowAlloc();
      v60 = (void *)sub_10000B09C();
      v155 = (char *)sub_10000B150();
      os_log_t v156 = v57;
      v158[0] = (uint64_t)v155;
      sub_10000B12C(5.8382e-34);
      sub_10000B108();
      void *v60 = v57;

      sub_10000B1A8();
      uint64_t v61 = Dictionary.description.getter();
      unint64_t v63 = v62;
      swift_bridgeObjectRelease();
      uint64_t v64 = sub_100009670(v61, v63, v158);
      sub_10000B0E4(v64);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v65 = "%{public}@ Failed to fetch track title from properties: %s";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v58, v59, v65, v55, 0x16u);
      sub_1000094A0();
      sub_10000B168();
      sub_10000B050((uint64_t)v60);
      v80 = v155;
      swift_arrayDestroy();
      uint64_t v72 = (uint64_t)v80;
      goto LABEL_31;
    }
LABEL_32:

    swift_bridgeObjectRelease_n();
    return;
  }
  if ((sub_10000B018((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any) & 1) == 0) {
    goto LABEL_14;
  }
  unint64_t v35 = (unint64_t)v157;
  os_log_t v148 = v156;
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000B068(v36, v37);
  swift_bridgeObjectRelease();
  if (!v159)
  {
    swift_bridgeObjectRelease();
    sub_100008CD0((uint64_t)v158);
    goto LABEL_26;
  }
  unint64_t v147 = v35;
  if ((sub_10000B018((uint64_t)&type metadata for Int, (uint64_t)&type metadata for Any) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_26:
    id v73 = v155;
    if (qword_100035000 != -1) {
      swift_once();
    }
    uint64_t v74 = type metadata accessor for Logger();
    v55 = (uint8_t *)sub_1000092CC(v74, (uint64_t)qword_100035038);
    id v75 = v73;
    swift_bridgeObjectRetain_n();
    v57 = v75;
    v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      swift_slowAlloc();
      v60 = (void *)sub_10000B09C();
      v155 = (char *)sub_10000B150();
      os_log_t v156 = v57;
      v158[0] = (uint64_t)v155;
      sub_10000B12C(5.8382e-34);
      sub_10000B108();
      void *v60 = v57;

      sub_10000B1A8();
      uint64_t v76 = Dictionary.description.getter();
      unint64_t v78 = v77;
      swift_bridgeObjectRelease();
      uint64_t v79 = sub_100009670(v76, v78, v158);
      sub_10000B0E4(v79);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v65 = "%{public}@ Failed to fetch track media type from properties: %s";
      goto LABEL_30;
    }
    goto LABEL_32;
  }
  unint64_t v38 = (unint64_t)v156;
  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000B068(v39, v40);
  swift_bridgeObjectRelease();
  if (v159)
  {
    if (sub_10000B018((uint64_t)&type metadata for Bool, (uint64_t)&type metadata for Any))
    {
      char v41 = (char)v156;
      goto LABEL_35;
    }
  }
  else
  {
    sub_100008CD0((uint64_t)v158);
  }
  char v41 = 0;
LABEL_35:
  id v81 = sub_100008E14(v38, v41);
  v48 = (void *)sub_100009074((uint64_t)v153, 0, v81, a4, a3);
  uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000B068(v82, v83);
  swift_bridgeObjectRelease();
  if (v159)
  {
    if (sub_10000B018((uint64_t)&type metadata for Bool, (uint64_t)&type metadata for Any))
    {
      LODWORD(v146) = v156;
      uint64_t v84 = type metadata accessor for ContentRating();
      v85 = (unsigned int *)&enum case for ContentRating.explicit(_:);
      if (!v146) {
        v85 = (unsigned int *)&enum case for ContentRating.clean(_:);
      }
      (*(void (**)(char *, void, uint64_t))(*(void *)(v84 - 8) + 104))(v30, *v85, v84);
      sub_100009544((uint64_t)v30, 0, 1, v84);
      sub_100009E68((uint64_t)v30, (uint64_t)v32);
      goto LABEL_42;
    }
  }
  else
  {
    sub_100008CD0((uint64_t)v158);
  }
  uint64_t v86 = type metadata accessor for ContentRating();
  sub_10000B184((uint64_t)v32, v87, v88, v86);
LABEL_42:
  uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000B068(v89, v90);
  swift_bridgeObjectRelease();
  if (v159) {
    sub_10000B018((uint64_t)&type metadata for Bool, (uint64_t)&type metadata for Any);
  }
  else {
    sub_100008CD0((uint64_t)v158);
  }
  v47 = (void *)v147;

  unint64_t v147 = 0xE500000000000000;
  uint64_t v52 = 0x6B63617274;
LABEL_46:
  uint64_t v144 = v52;
  uint64_t v91 = v154;
  uint64_t v92 = type metadata accessor for Artwork();
  sub_10000B184((uint64_t)v15, v93, v94, v92);
  sub_10000956C((uint64_t)v32, (uint64_t)v27);
  uint64_t v95 = type metadata accessor for URL();
  sub_10000B184((uint64_t)v11, v96, v97, v95);
  id v98 = v48;
  swift_bridgeObjectRetain();
  uint64_t v99 = (uint64_t)v148;
  MusicSiriRepresentation.init(for:title:authorName:artwork:contentRating:url:isLibraryAdded:)();
  if (sub_1000095EC((uint64_t)v19, 1, v91) != 1)
  {
    uint64_t v111 = v91;
    v145 = v32;
    id v146 = v98;
    uint64_t v112 = v150;
    uint64_t v113 = v99;
    v114 = v152;
    (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v152, v19, v111);
    uint64_t v115 = MusicSiriRepresentation.id.getter();
    v117 = v116;
    uint64_t v118 = *(void *)&v155[OBJC_IVAR____TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator_entityTypeIdentifier];
    v119 = *(void **)&v155[OBJC_IVAR____TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator_entityTypeIdentifier
                         + 8];
    uint64_t propertyDictionary = Dictionary.init(dictionaryLiteral:)();
    v120._countAndFlagsBits = v115;
    v120._object = v117;
    v121._countAndFlagsBits = v118;
    v121._object = v119;
    v122._countAndFlagsBits = v113;
    v122._object = v47;
    CSSearchableItemAttributeSet.associate(entityInstanceIdentifier:entityTypeIdentifier:displayTitle:displaySubtitle:displaySynonyms:typeDisplayName:typeDisplaySynonyms:propertyDictionary:priority:)(v120, v121, v122, (Swift::String_optional)0, (Swift::OpaquePointer)&_swiftEmptyArrayStorage, (Swift::String_optional)0, (Swift::OpaquePointer)&_swiftEmptyArrayStorage, (Swift::OpaquePointer)propertyDictionary, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100035000 != -1) {
      swift_once();
    }
    uint64_t v123 = type metadata accessor for Logger();
    sub_1000092CC(v123, (uint64_t)qword_100035038);
    uint64_t v124 = v154;
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v151, v114, v154);
    uint64_t v125 = v112;
    v126 = v155;
    unint64_t v127 = v147;
    swift_bridgeObjectRetain();
    v128 = Logger.logObject.getter();
    os_log_type_t v129 = static os_log_type_t.default.getter();
    int v130 = v129;
    if (os_log_type_enabled(v128, v129))
    {
      uint64_t v131 = sub_10000B150();
      uint64_t v132 = swift_slowAlloc();
      os_log_t v153 = v128;
      v133 = (void *)v132;
      v155 = (char *)swift_slowAlloc();
      os_log_t v156 = (os_log_t)v126;
      v158[0] = (uint64_t)v155;
      *(_DWORD *)uint64_t v131 = 138543874;
      LODWORD(v149) = v130;
      v134 = v126;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v135 = (uint64_t)v133;
      void *v133 = v126;

      *(_WORD *)(v131 + 12) = 2080;
      swift_bridgeObjectRetain();
      os_log_t v156 = (os_log_t)sub_100009670(v144, v127, v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v131 + 22) = 2080;
      uint64_t v136 = MusicSiriRepresentation.id.getter();
      os_log_t v156 = (os_log_t)sub_100009670(v136, v137, v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v138 = *(void (**)(void))(v125 + 8);
      sub_10000B0D4();
      v138();
      os_log_t v139 = v153;
      _os_log_impl((void *)&_mh_execute_header, v153, (os_log_type_t)v149, "%{public}@ Associated siri representation for %s with id:%s", (uint8_t *)v131, 0x20u);
      sub_1000094A0();
      swift_arrayDestroy();
      sub_10000B050(v135);
      uint64_t v140 = (uint64_t)v155;
      swift_arrayDestroy();
      sub_10000B050(v140);
      sub_10000B050(v131);

      sub_10000B0D4();
      v138();
    }
    else
    {

      v142 = *(void (**)(void))(v125 + 8);
      sub_10000B0D4();
      v142();

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v142)(v114, v124);
    }
    goto LABEL_57;
  }
  v100 = v32;
  swift_bridgeObjectRelease();
  sub_100009614((uint64_t)v19, &qword_100034870, (void (*)(uint64_t))&type metadata accessor for MusicSiriRepresentation);
  unint64_t v101 = v147;
  if (qword_100035000 != -1) {
    swift_once();
  }
  uint64_t v102 = type metadata accessor for Logger();
  uint64_t v103 = sub_1000092CC(v102, (uint64_t)qword_100035038);
  v104 = v155;
  swift_bridgeObjectRetain();
  v105 = Logger.logObject.getter();
  os_log_type_t v106 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v105, v106))
  {
    sub_10000B150();
    uint64_t v107 = sub_10000B09C();
    id v146 = v98;
    v108 = (void *)v107;
    v155 = (char *)sub_10000B150();
    os_log_t v156 = (os_log_t)v104;
    v158[0] = (uint64_t)v155;
    *(_DWORD *)uint64_t v103 = 138543874;
    v145 = v100;
    v109 = v104;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v108 = v104;

    *(_WORD *)(v103 + 12) = 2080;
    swift_bridgeObjectRetain();
    os_log_t v156 = (os_log_t)sub_100009670(v144, v101, v158);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v103 + 22) = 2048;
    os_log_t v156 = v153;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v105, v106, "%{public}@ Could not instantiate MusicSiriRepresentation for %s with pid %lld", (uint8_t *)v103, 0x20u);
    sub_1000094A0();
    sub_10000B168();
    sub_10000B050((uint64_t)v108);
    uint64_t v110 = (uint64_t)v155;
    swift_arrayDestroy();
    sub_10000B050(v110);
    sub_10000B050(v103);

LABEL_57:
    uint64_t v141 = (uint64_t)v145;
    goto LABEL_58;
  }

  swift_bridgeObjectRelease_n();
  uint64_t v141 = (uint64_t)v100;
LABEL_58:
  sub_100009614(v141, &qword_100034878, (void (*)(uint64_t))&type metadata accessor for ContentRating);
}

void sub_100008C18(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

double sub_100008C6C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_10000A758(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_100009F5C(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_100008CD0(uint64_t a1)
{
  sub_100009FB8(0, &qword_100034880, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100008E14(unint64_t a1, char a2)
{
  if ((a1 & 8) != 0)
  {
    if (a2) {
      uint64_t v10 = (a1 >> 9) & 2 | 4;
    }
    else {
      uint64_t v10 = (a1 >> 9) & 2;
    }
    id v11 = [self kindWithVariants:v10];
  }
  else if ((a1 & 0x800) != 0 || (a1 & 0x200) != 0)
  {
    id v11 = [self kindWithVariants:0];
  }
  else
  {
    if (qword_100035000 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_1000092CC(v3, (uint64_t)qword_100035038);
    id v4 = v2;
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138543618;
      id v9 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v8 = v4;

      *(_WORD *)(v7 + 12) = 2048;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}@ Encountered unexpected MPModelKind for track with type: %ld", (uint8_t *)v7, 0x16u);
      sub_1000094A0();
      swift_arrayDestroy();
      sub_10000B050((uint64_t)v8);
      sub_10000B050(v7);
    }
    else
    {
    }
    id v11 = [self identityKind];
  }

  return v11;
}

uint64_t sub_100009074(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v8[2] = a2;
  v8[3] = a5;
  v8[4] = a1;
  v8[5] = a4;
  id v6 = objc_allocWithZone((Class)MPIdentifierSet);
  return sub_100009304(0xD00000000000001ELL, 0x80000001000214C0, a3, (uint64_t)sub_10000A008, (uint64_t)v8);
}

uint64_t sub_1000090F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return _swift_unknownObjectRelease(a2);
}

id MLDSpotlightIndexMusicAppEntityAssociator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id MLDSpotlightIndexMusicAppEntityAssociator.init()()
{
  id v1 = &v0[OBJC_IVAR____TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator_entityTypeIdentifier];
  *(void *)id v1 = 0xD000000000000016;
  *((void *)v1 + 1) = 0x8000000100021100;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for MLDSpotlightIndexMusicAppEntityAssociator();
  return objc_msgSendSuper2(&v3, "init");
}

id MLDSpotlightIndexMusicAppEntityAssociator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MLDSpotlightIndexMusicAppEntityAssociator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100009244()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AF24(v0, qword_100035038);
  sub_1000092CC(v0, (uint64_t)qword_100035038);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000092CC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100009304(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  v15[4] = sub_10000A718;
  v15[5] = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100009454;
  v15[3] = &unk_10002CB40;
  uint64_t v12 = _Block_copy(v15);
  swift_retain();
  id v13 = [v6 initWithSource:v10 modelKind:a3 block:v12];

  _Block_release(v12);
  swift_release();
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((a3 & 1) == 0) {
    return (uint64_t)v13;
  }
  __break(1u);
  return result;
}

void sub_100009454(uint64_t a1, void *a2)
{
  objc_super v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_1000094A0()
{
  if (!qword_100034888)
  {
    sub_100009508(255, &qword_100034890);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100034888);
    }
  }
}

uint64_t sub_100009508(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100009544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000956C(uint64_t a1, uint64_t a2)
{
  sub_100008C18(0, &qword_100034878, (void (*)(uint64_t))&type metadata accessor for ContentRating);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000095EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100009614(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_100008C18(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_100009670(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100009744(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009F5C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100009F5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009F0C((uint64_t)v12);
  return v7;
}

uint64_t sub_100009744(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000989C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100009974(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_10000989C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100009974(uint64_t a1, unint64_t a2)
{
  objc_super v2 = sub_100009A0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_100009C08(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_100009C08((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100009A0C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_100009B80(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100009B80(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100009FB8(0, &qword_100034930, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100009C08(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100009FB8(0, &qword_100034930, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100009DD8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100009D00(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100009D00(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100009DD8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100009E68(uint64_t a1, uint64_t a2)
{
  sub_100008C18(0, &qword_100034878, (void (*)(uint64_t))&type metadata accessor for ContentRating);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for MLDSpotlightIndexMusicAppEntityAssociator()
{
  return self;
}

uint64_t sub_100009F0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100009FB8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_10000A008(void *a1)
{
  uint64_t v4 = *(void *)(isEscapingClosureAtFileLocation + 16);
  uint64_t v3 = *(void **)(isEscapingClosureAtFileLocation + 24);
  NSString v6 = *(NSString *)(isEscapingClosureAtFileLocation + 32);
  uint64_t v5 = *(void *)(isEscapingClosureAtFileLocation + 40);
  uint64_t result = sub_10000AB00(v3, (SEL *)&selRef_libraryUID);
  uint64_t v9 = v8;
  if (v4 == 1)
  {
    if (!v8)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_10000B084();
    *(void *)(v9 + 16) = v6;
    *(void *)(v9 + 24) = v5;
    uint64_t v11 = sub_10000B084();
    *(void *)(v11 + 16) = sub_10000ACB8;
    *(void *)(v11 + 24) = v9;
    v32 = sub_10000AFC8;
    uint64_t v33 = v11;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    v30 = sub_1000090F0;
    uint64_t v31 = &unk_10002CD20;
    _Block_copy(&v28);
    sub_10000B0B8();
    swift_retain();
    swift_release();
    [a1 setLibraryIdentifiersWithDatabaseID:v10 block:isEscapingClosureAtFileLocation];

    _Block_release((const void *)isEscapingClosureAtFileLocation);
    sub_10000B1D4();
    swift_isEscapingClosureAtFileLocation();
    uint64_t result = sub_10000B1F8();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
LABEL_16:
      __break(1u);
      __break(1u);
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v12 = sub_10000B1E0();
    *(void *)(v12 + 16) = v5;
    uint64_t v13 = sub_10000B084();
    *(void *)(v13 + 16) = sub_10000AD68;
    *(void *)(v13 + 24) = v12;
    v32 = sub_10000AFC8;
    uint64_t v33 = v13;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    v30 = sub_1000090F0;
    uint64_t v31 = &unk_10002CD98;
    _Block_copy(&v28);
    sub_10000B0B8();
    swift_retain();
    swift_release();
    [a1 setUniversalStoreIdentifiersWithBlock:isEscapingClosureAtFileLocation];
    _Block_release((const void *)isEscapingClosureAtFileLocation);
    sub_10000B1D4();
    swift_isEscapingClosureAtFileLocation();
    sub_10000B1F8();
    sub_10000AB00(v3, (SEL *)&selRef_accountDSID);
    if (!v14)
    {
LABEL_12:
      swift_release();
      swift_release();
      goto LABEL_13;
    }
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v3 = (void *)sub_10000B1E0();
    v3[2] = v5;
    uint64_t v15 = sub_10000B084();
    *(void *)(v15 + 16) = sub_10000AE8C;
    *(void *)(v15 + 24) = v3;
    v32 = sub_10000AFC8;
    uint64_t v33 = v15;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    v30 = sub_1000090F0;
    uint64_t v31 = &unk_10002CE10;
    uint64_t v16 = _Block_copy(&v28);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    [a1 setPersonalStoreIdentifiersWithPersonID:v6 block:v16];

    _Block_release(v16);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
LABEL_13:
      uint64_t v26 = 0;
      return sub_10000AB60((uint64_t)v26);
    }
    __break(1u);
  }
  if (v9)
  {
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_10000B084();
    *(void *)(v18 + 16) = v6;
    *(void *)(v18 + 24) = v5;
    uint64_t v19 = sub_10000B084();
    *(void *)(v19 + 16) = sub_10000A8B4;
    *(void *)(v19 + 24) = v18;
    v32 = sub_10000AFC8;
    uint64_t v33 = v19;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    v30 = sub_1000090F0;
    uint64_t v31 = &unk_10002CBB8;
    _Block_copy(&v28);
    sub_10000B0B8();
    swift_retain();
    swift_release();
    [a1 setLibraryIdentifiersWithDatabaseID:v17 block:isEscapingClosureAtFileLocation];

    _Block_release((const void *)isEscapingClosureAtFileLocation);
    sub_10000B1D4();
    swift_isEscapingClosureAtFileLocation();
    uint64_t result = sub_10000B1F8();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      uint64_t v20 = sub_10000B1E0();
      *(void *)(v20 + 16) = v5;
      uint64_t v21 = sub_10000B084();
      *(void *)(v21 + 16) = sub_10000A8FC;
      *(void *)(v21 + 24) = v20;
      v32 = sub_10000AFC8;
      uint64_t v33 = v21;
      uint64_t v28 = _NSConcreteStackBlock;
      uint64_t v29 = 1107296256;
      v30 = sub_1000090F0;
      uint64_t v31 = &unk_10002CC30;
      _Block_copy(&v28);
      sub_10000B0B8();
      swift_retain();
      swift_release();
      [a1 setUniversalStoreIdentifiersWithBlock:isEscapingClosureAtFileLocation];
      _Block_release((const void *)isEscapingClosureAtFileLocation);
      sub_10000B1D4();
      swift_isEscapingClosureAtFileLocation();
      sub_10000B1F8();
      sub_10000AB00(v3, (SEL *)&selRef_accountDSID);
      if (v22)
      {
        NSString v23 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        uint64_t v24 = sub_10000B1E0();
        *(void *)(v24 + 16) = v5;
        uint64_t v25 = sub_10000B084();
        uint64_t v26 = sub_10000AB70;
        *(void *)(v25 + 16) = sub_10000AB70;
        *(void *)(v25 + 24) = v24;
        v32 = sub_10000AFC8;
        uint64_t v33 = v25;
        uint64_t v28 = _NSConcreteStackBlock;
        uint64_t v29 = 1107296256;
        v30 = sub_1000090F0;
        uint64_t v31 = &unk_10002CCA8;
        v27 = _Block_copy(&v28);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_release();
        [a1 setPersonalStoreIdentifiersWithPersonID:v23 block:v27];

        _Block_release(v27);
        LOBYTE(v27) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        swift_release();
        swift_release();
        if ((v27 & 1) == 0) {
          return sub_10000AB60((uint64_t)v26);
        }
        __break(1u);
      }
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10000A718()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A740(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A750()
{
  return swift_release();
}

unint64_t sub_10000A758(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000A7D0(a1, a2, v4);
}

unint64_t sub_10000A7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    NSString v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000A8B4(void *a1)
{
  return sub_10000ACC4(a1);
}

uint64_t sub_10000A8C4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A8FC()
{
  sub_10000B19C();
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v1, v2, v3, v4, v5, v6, v7, v8, v78, v85, v91);
  uint64_t v9 = swift_bridgeObjectRelease();
  if (v92)
  {
    if (sub_10000AFF8(v9, v10, v11, (uint64_t)&type metadata for String, v12, v13, v14, v15, v79, v86, v91))
    {
      NSString v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v0 setUniversalCloudLibraryID:v16];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v91);
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v17, v18, v19, v20, v21, v22, v23, v24, v79, v86, v91);
  uint64_t v25 = swift_bridgeObjectRelease();
  if (v92)
  {
    if (sub_10000AFF8(v25, v26, v27, (uint64_t)&type metadata for Int64, v28, v29, v30, v31, v80, v87, v91)) {
      [v0 setSubscriptionAdamID:v80];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v91);
  }
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v32, v33, v34, v35, v36, v37, v38, v39, v80, v87, v91);
  uint64_t v40 = swift_bridgeObjectRelease();
  if (v92)
  {
    if (sub_10000AFF8(v40, v41, v42, (uint64_t)&type metadata for Int64, v43, v44, v45, v46, v81, v88, v91)) {
      [v0 setAdamID:v81];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v91);
  }
  uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v47, v48, v49, v50, v51, v52, v53, v54, v81, v88, v91);
  uint64_t v55 = swift_bridgeObjectRelease();
  if (v92)
  {
    if (sub_10000AFF8(v55, v56, v57, (uint64_t)&type metadata for Int64, v58, v59, v60, v61, v82, v89, v91)) {
      [v0 setReportingAdamID:v82];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v91);
  }
  uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v62, v63, v64, v65, v66, v67, v68, v69, v82, v89, v91);
  uint64_t v70 = swift_bridgeObjectRelease();
  if (!v92) {
    return sub_100008CD0((uint64_t)&v91);
  }
  uint64_t result = sub_10000AFF8(v70, v71, v72, (uint64_t)&type metadata for Int64, v73, v74, v75, v76, v83, v90, v91);
  if (result) {
    return (uint64_t)[v0 setAssetAdamID:v84];
  }
  return result;
}

uint64_t sub_10000AB00(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t sub_10000AB60(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000AB70()
{
  sub_10000B19C();
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v1, v2, v3, v4, v5, v6, v7, v8, v24, v25, v26);
  swift_bridgeObjectRelease();
  if (v27)
  {
    if (sub_10000B038((uint64_t)&v24, v9, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for UInt64, v10, v11))[v0 setCloudID:v24]; {
  }
    }
  else
  {
    sub_100008CD0((uint64_t)&v26);
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v12, v13, v14, v15, v16, v17, v18, v19, v24, v25, v26);
  swift_bridgeObjectRelease();
  if (v27)
  {
    if (sub_10000B038((uint64_t)&v24, v20, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for String, v21, v22))
    {
      NSString v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v0 setCloudAlbumID:v23];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v26);
  }
}

uint64_t sub_10000AC80()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000ACB8(void *a1)
{
  return sub_10000ACC4(a1);
}

uint64_t sub_10000ACC4(void *a1)
{
  [a1 setPersistentID:*(void *)(v1 + 16)];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v3, v4, v5, v6, v7, v8, v9, v10, v15, v16, v17);
  swift_bridgeObjectRelease();
  if (!v18) {
    return sub_100008CD0((uint64_t)&v17);
  }
  uint64_t result = sub_10000B038((uint64_t)&v16, v11, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Int64, v12, v13);
  if (result) {
    return (uint64_t)[a1 setSyncID:v16];
  }
  return result;
}

void sub_10000AD68()
{
  sub_10000B19C();
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v1, v2, v3, v4, v5, v6, v7, v8, v33, v36, v39);
  uint64_t v9 = swift_bridgeObjectRelease();
  if (v40)
  {
    if (sub_10000AFF8(v9, v10, v11, (uint64_t)&type metadata for String, v12, v13, v14, v15, v34, v37, v39))
    {
      NSString v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v0 setGlobalPlaylistID:v16];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v39);
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v17, v18, v19, v20, v21, v22, v23, v24, v34, v37, v39);
  uint64_t v25 = swift_bridgeObjectRelease();
  if (v40)
  {
    if (sub_10000AFF8(v25, v26, v27, (uint64_t)&type metadata for String, v28, v29, v30, v31, v35, v38, v39))
    {
      NSString v32 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v0 setUniversalCloudLibraryID:v32];
    }
  }
  else
  {
    sub_100008CD0((uint64_t)&v39);
  }
}

uint64_t sub_10000AE8C()
{
  sub_10000B19C();
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000AFDC(v1, v2, v3, v4, v5, v6, v7, v8, v13, v14, v15);
  swift_bridgeObjectRelease();
  if (!v16) {
    return sub_100008CD0((uint64_t)&v15);
  }
  uint64_t result = sub_10000B038((uint64_t)&v14, v9, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for UInt64, v10, v11);
  if (result) {
    return (uint64_t)[v0 setCloudID:v14];
  }
  return result;
}

uint64_t *sub_10000AF24(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000AFCC()
{
  return _swift_deallocObject(v0, 32, 7);
}

double sub_10000AFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  return sub_100008C6C(a1, a2, v11, &a11);
}

uint64_t sub_10000AFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  return _swift_dynamicCast(&a9, &a11, v11 + 8, a4, 6);
}

uint64_t sub_10000B018@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return _swift_dynamicCast(v2 - 128, v2 - 112, a2 + 8, a1, 6);
}

uint64_t sub_10000B038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  return _swift_dynamicCast(a1, va, a3, a4, 6);
}

uint64_t sub_10000B050(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

double sub_10000B068(uint64_t a1, uint64_t a2)
{
  return sub_100008C6C(a1, a2, v2, (_OWORD *)(v3 - 112));
}

uint64_t sub_10000B084()
{
  return swift_allocObject();
}

uint64_t sub_10000B09C()
{
  return swift_slowAlloc();
}

uint64_t sub_10000B0B8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B0E4(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000B108()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

id sub_10000B12C(float a1)
{
  float *v1 = a1;
  return v2;
}

uint64_t sub_10000B150()
{
  return swift_slowAlloc();
}

uint64_t sub_10000B168()
{
  return swift_arrayDestroy();
}

uint64_t sub_10000B184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100009544(a1, 1, 1, a4);
}

uint64_t sub_10000B1A8()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B1C8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000B1D4()
{
  return v0;
}

uint64_t sub_10000B1E0()
{
  return swift_allocObject();
}

uint64_t sub_10000B1F8()
{
  return swift_release();
}

os_log_t sub_10000B210()
{
  os_log_t v0 = os_log_create("com.apple.amp.medialibraryd", "Default");

  return v0;
}

void sub_10000B2FC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWriterSuspended:", objc_msgSend(*(id *)(a1 + 40), "isSuspended"));
  uint64_t v2 = [*(id *)(a1 + 40) transactionMap];
  uint64_t v3 = [v2 allValues];
  [*(id *)(a1 + 32) setActiveTransactions:v3];

  uint64_t v4 = [*(id *)(a1 + 40) databaseOperationQueue];
  uint64_t v5 = [v4 operations];
  [*(id *)(a1 + 32) setEnqueuedConcurrentOperations:v5];

  uint64_t v6 = [*(id *)(a1 + 40) databaseOperationSerialQueue];
  uint64_t v7 = [v6 operations];
  [*(id *)(a1 + 32) setEnqueuedSerialOperations:v7];

  id v9 = [*(id *)(a1 + 40) databaseOperationLimitedQueue];
  uint64_t v8 = [v9 operations];
  [*(id *)(a1 + 32) setEnqueuedLimitedQueueOperations:v8];
}

id sub_10000C098(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendFormat:@"Library at path \"%@\"\n", a2];
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 writerAvailableConnections];
  [v7 _appendDescribableArray:v8 toString:*(void *)(a1 + 32) withTitle:@"Writer Available Connections" indentLevel:1];

  [*(id *)(a1 + 32) appendString:@"\n"];
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v6 writerBusyConnections];
  [v9 _appendDescribableArray:v10 toString:*(void *)(a1 + 32) withTitle:@"Writer Busy Connections" indentLevel:1];

  [*(id *)(a1 + 32) appendString:@"\n"];
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v6 readerAvailableConnections];
  [v11 _appendDescribableArray:v12 toString:*(void *)(a1 + 32) withTitle:@"Reader Available Connections" indentLevel:1];

  [*(id *)(a1 + 32) appendString:@"\n"];
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = [v6 readerBusyConnections];

  [v13 _appendDescribableArray:v14 toString:*(void *)(a1 + 32) withTitle:@"Reader Busy Connections" indentLevel:1];
  long long v15 = *(void **)(a1 + 32);

  return [v15 appendString:@"\n\n"];
}

uint64_t start()
{
  os_log_t v0 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Starting medialibraryd", buf, 2u);
  }

  _set_user_dir_suffix();
  id v1 = NSTemporaryDirectory();
  +[ML3MusicLibrary disableSharedLibrary];
  +[ML3MusicLibrary disableAutomaticDatabaseValidation];
  uint64_t v3 = +[NSProcessInfo processInfo];
  +[MLMediaLibraryService _setDaemonProcessInfo:v3];
  uint64_t v4 = +[MLDMediaLibraryService sharedInstance];
  [v4 start];

  uint64_t v5 = +[NSRunLoop currentRunLoop];
  [v5 run];

  id v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "medialibraryd exiting.", v8, 2u);
  }

  return 0;
}

void sub_10000C8B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_10000C8EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C9E0;
    block[3] = &unk_10002D170;
    id v4 = WeakRetained;
    dispatch_async(v2, block);
  }
}

void sub_10000C99C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _exitForLocalizationChange];
    id WeakRetained = v2;
  }
}

id sub_10000C9E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exitForLocalizationChange];
}

void sub_10000CAB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) suspendedValidations];
  id v3 = [v2 count];

  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[LanguageChange] Validation operations are in progress. Suspending further validations...", buf, 2u);
    }
  }
  [*(id *)(a1 + 32) setSuspended:1];
  [*(id *)(a1 + 32) _purgePendingDatabaseValidations];
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LanguageChange] exiting...", v6, 2u);
  }

  exit(0);
}

id sub_10000CD5C(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) suspendedValidations];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unlock: resuming validation queue - %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) setSuspended:0];
  return [*(id *)(a1 + 32) _purgePendingDatabaseValidations];
}

id sub_10000CF08(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);

  return [v2 removeAllObjects];
}

id sub_10000CFC0(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) suspendedValidations];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Lock: suspending validation queue - %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) setSuspended:1];
  return [*(id *)(a1 + 32) _purgePendingDatabaseValidations];
}

uint64_t sub_10000D16C(void *a1)
{
  if ([*(id *)(a1[4] + 40) containsObject:a1[5]]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = (uint64_t)[*(id *)(a1[4] + 48) containsObject:a1[5]];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

id sub_10000D1BC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

void sub_10000D1C8(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 24));
  id v6 = os_log_create("com.apple.amp.medialibraryd", "Service");
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfull validation of database at path %{public}@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1[4] + 40) addObject:a1[5]];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[5];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed validation of database at path %{public}@. error = %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  [*(id *)(a1[4] + 48) removeObject:a1[5]];
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }
}

void sub_10000D330(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Validation queue suspended - Adding pending database validation for media library at path: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) suspendedValidations];
    [v4 addObject:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = *(void **)(a1 + 48);
    [v5 runValidation];
  }
}

void sub_10000DB04(uint64_t a1)
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 _calculateUsageAnalytics];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v3 = 0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v9 = v12;
  v5[2] = sub_10000DBF4;
  v5[3] = &unk_10002D070;
  v5[4] = v3;
  uint64_t v8 = *(void *)(a1 + 64);
  long long v10 = v13;
  uint64_t v11 = v14;
  id v6 = *(id *)(a1 + 40);
  id v4 = objc_retainBlock(v5);
  AnalyticsSendEventLazy();
}

id sub_10000DBF4(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = *(void **)(a1 + 32);
  *(_OWORD *)long long v9 = *(_OWORD *)(a1 + 48);
  *(void *)&v9[16] = *(void *)(a1 + 64);
  [v3 _addPurgeableAnalytics:v9 toPayload:v2];
  id v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)long long v9 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v9[16] = v5;
  uint64_t v10 = *(void *)(a1 + 104);
  [v4 _addUsageAnalytics:v9 toPayload:v2];
  [*(id *)(a1 + 32) _addOptimizeStorageAnalyticsToPayload:v2];
  id v6 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)long long v9 = 138478339;
    *(void *)&v9[4] = v2;
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = v7;
    *(_WORD *)&v9[22] = 2050;
    *(void *)&v9[24] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Generated CacheDeletePurgeableRequest event with payload:\n%{private}@, transaction: %{public}@ %{public}p", v9, 0x20u);
  }

  return v2;
}

void sub_10000DE14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  *(double *)(v1 + 32) = *(double *)(v1 + 32) + fabs(*(double *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 40);
  if (v4 <= *(int *)(a1 + 72)) {
    unint64_t v4 = *(int *)(a1 + 72);
  }
  *(void *)(v3 + 40) = v4;
  *(void *)(*(void *)(a1 + 32) + 48) += *(void *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 56) += *(void *)(a1 + 64);
  if (!v2)
  {
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 72);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000DF30;
    v9[3] = &unk_10002D8A8;
    v9[4] = v7;
    id v10 = *(id *)(a1 + 40);
    dispatch_after(v6, v8, v9);
  }
}

void sub_10000DF30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(v1 + 48);
  long long v35 = *(_OWORD *)(v1 + 32);
  long long v36 = v2;
  uint64_t v3 = *(void *)(v1 + 64);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = *(id *)(v1 + 24);
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v10 = [v9 databasePath];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          long long v12 = +[NSFileManager defaultManager];
          long long v13 = [v9 databasePath];
          unsigned int v14 = [v12 fileExistsAtPath:v13];

          if (v14) {
            v3 += (uint64_t)[v9 purgeableStorageSizeWithUrgency:3];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v6);
  }

  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v15 = *(void **)(a1 + 32);
  if (v15)
  {
    [v15 _calculateUsageAnalytics];
    uint64_t v16 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v16 = 0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  long long v22 = v35;
  long long v23 = v36;
  long long v25 = v28;
  v20[2] = sub_10000E17C;
  v20[3] = &unk_10002D020;
  v20[4] = v16;
  uint64_t v24 = v3;
  long long v26 = v29;
  uint64_t v27 = v30;
  id v21 = *(id *)(a1 + 40);
  uint64_t v17 = objc_retainBlock(v20);
  AnalyticsSendEventLazy();
  uint64_t v18 = *(void *)(a1 + 32);
  *(_OWORD *)(v18 + 32) = 0u;
  *(_OWORD *)(v18 + 48) = 0u;
  *(void *)(v18 + 64) = 0;
}

id sub_10000E17C(uint64_t a1)
{
  long long v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v10[16] = v4;
  uint64_t v11 = *(void *)(a1 + 80);
  [v3 _addPurgeAnalytics:v10 toPayload:v2];
  id v5 = *(void **)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&v10[16] = v6;
  uint64_t v11 = *(void *)(a1 + 120);
  [v5 _addUsageAnalytics:v10 toPayload:v2];
  [*(id *)(a1 + 32) _addOptimizeStorageAnalyticsToPayload:v2];
  uint64_t v7 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)uint64_t v10 = 138478339;
    *(void *)&v10[4] = v2;
    *(_WORD *)&v10[12] = 2114;
    *(void *)&v10[14] = v8;
    *(_WORD *)&v10[22] = 2050;
    *(void *)&v10[24] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Generated CacheDeletePurge event with payload:\n%{private}@, transaction: %{public}@ %{public}p", v10, 0x20u);
  }

  return v2;
}

void sub_10000E5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E5D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 databasePath];
  if (v4)
  {
    id v5 = (void *)v4;
    long long v6 = +[NSFileManager defaultManager];
    uint64_t v7 = [v3 databasePath];
    if ([v6 fileExistsAtPath:v7])
    {
      unsigned int v8 = [v3 currentDatabaseVersion];

      if (v8 == 2220020)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) += [v3 totalSizeForAllNonRedownloadableTracks];
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) += [v3 totalSizeForAllRedownloadableNonCacheTracks];
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) += [v3 totalSizeForArtwork];
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  long long v9 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = [v3 databasePath];
    int v11 = 138543618;
    long long v12 = v10;
    __int16 v13 = 1024;
    unsigned int v14 = [v3 currentDatabaseVersion];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Skipping usage calculation for library at path '%{public}@' because db file is not present or invalid (db version=%d)", (uint8_t *)&v11, 0x12u);
  }
LABEL_9:
}

void sub_10000F568(uint64_t a1, void *a2)
{
  uint64_t v4 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = v5;
    __int16 v38 = 2114;
    long long v39 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ EnumerateRemovedFilesInDirectories events=%{public}@", buf, 0x16u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138543618;
    long long v30 = v8;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        __int16 v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"rescan", v30, (void)v31);

        if (v13)
        {
          [*(id *)(a1 + 32) _reconcileAllOriginalArtworkForLibrary:*(void *)(a1 + 40) withCompletion:0];
          goto LABEL_23;
        }
        unsigned int v14 = [v12 objectForKeyedSubscript:@"historyDone"];

        if (v14)
        {
          [*(id *)(a1 + 32) _reconcileOrginalArtworkWitRelativePaths:*(void *)(a1 + 48) forLibrary:*(void *)(a1 + 40) withCompletion:0];
          goto LABEL_23;
        }
        long long v15 = [v12 objectForKeyedSubscript:@"path"];
        uint64_t v16 = [*(id *)(a1 + 40) originalArtworkDirectory];
        unsigned int v17 = [v15 containsString:v16];

        uint64_t v18 = *(void **)(a1 + 40);
        if (v17)
        {
          uint64_t v19 = [v18 originalArtworkDirectory];
          uint64_t v20 = (char *)[v15 rangeOfString:v19];
          uint64_t v22 = v21;

          if (&v20[v22] >= [v15 length])
          {
            [*(id *)(a1 + 32) _reconcileAllOriginalArtworkForLibrary:*(void *)(a1 + 40) withCompletion:0];
          }
          else
          {
            long long v23 = [v15 substringFromIndex:&v20[v22 + 1]];
            uint64_t v24 = *(void **)(a1 + 48);
            id v25 = [v23 copy];
            [v24 addObject:v25];
          }
        }
        else
        {
          long long v26 = [v18 rootArtworkCacheDirectory];
          unsigned __int8 v27 = [v15 containsString:v26];

          if ((v27 & 1) == 0)
          {
            long long v28 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v29 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v30;
              uint64_t v37 = v29;
              __int16 v38 = 2114;
              long long v39 = v15;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ _reconcilePurgeNotification - Ignoring unrecognized path %{public}@", buf, 0x16u);
            }
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_23:
}

void sub_10000F980(uint64_t a1)
{
  long long v2 = +[NSFileManager defaultManager];
  id v3 = [*(id *)(a1 + 32) databasePath];
  unsigned int v4 = [v2 fileExistsAtPath:v3];
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2048;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Reconciling %lu paths of purged original artwork.", buf, 0x16u);
    }

    id v9 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000FB9C;
    v14[3] = &unk_10002CF80;
    long long v15 = *(id *)(a1 + 48);
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v13.i64[0];
    int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
    [v9 databaseConnectionAllowingWrites:1 withBlock:v14];
    [*(id *)(a1 + 32) cleanupArtworkWithOptions:16];

    id v6 = v15;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v11 = [*(id *)(a1 + 48) count];
    *(_DWORD *)buf = 134218242;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Skipping artwork reconciliation for %lu paths. No file exists at path '%{public}@'", buf, 0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

void sub_10000FB9C(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FC54;
  v7[3] = &unk_10002CFA8;
  unsigned int v4 = (void *)a1[4];
  uint64_t v5 = (void *)a1[6];
  v7[4] = a1[5];
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

id sub_10000FC54(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatePurgedOriginalWithRelativePath:a2 forLibrary:*(void *)(a1 + 40) usingConnection:*(void *)(a1 + 48)];
}

void sub_10000FD2C(uint64_t a1)
{
  long long v2 = +[NSFileManager defaultManager];
  id v3 = [*(id *)(a1 + 32) databasePath];
  unsigned int v4 = [v2 fileExistsAtPath:v3];
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Reconciling all original artwork for library %{public}@.", buf, 0x16u);
    }

    id v9 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000FF20;
    v13[3] = &unk_10002CF80;
    unsigned int v14 = v9;
    id v10 = v2;
    uint64_t v11 = *(void *)(a1 + 40);
    id v15 = v10;
    uint64_t v16 = v11;
    [v14 databaseConnectionAllowingWrites:1 withBlock:v13];
    [*(id *)(a1 + 32) cleanupArtworkWithOptions:16];

    id v6 = v14;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Skipping artwork reconciliation. No file exists at path '%{public}@'", buf, 0xCu);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

void sub_10000FF20(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FFF8;
  v8[3] = &unk_10002CF58;
  id v9 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  id v7 = v3;
  [v9 enumerateArtworkRelativePathsWithConnection:v7 matchingRelativePathContainer:0 block:v8];
}

void sub_10000FFF8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) originalArtworkDirectory];
  unsigned int v4 = [v3 stringByAppendingPathComponent:v5];

  if (([*(id *)(a1 + 40) fileExistsAtPath:v4] & 1) == 0) {
    [*(id *)(a1 + 48) _updatePurgedOriginalWithRelativePath:v5 forLibrary:*(void *)(a1 + 32) usingConnection:*(void *)(a1 + 56)];
  }
}

void sub_100010290(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 int64ForColumnIndex:0];
  uint64_t v5 = (int)[v3 intForColumnIndex:1];
  signed int v6 = [v3 intForColumnIndex:2];

  [*(id *)(a1 + 32) updateBestArtworkTokenForEntityPersistentID:v4 entityType:v5 artworkType:v6 retrievalTime:0 preserveExistingAvailableToken:*(void *)(a1 + 40) usingConnection:0.0];
  id v7 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated best artwork token for purged artwork with relativePath %{public}@.", (uint8_t *)&v10, 0x16u);
  }
}

void sub_100010684(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Unwind_Resume(a1);
}

uint64_t sub_1000106C8(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010A2C;
  v11[3] = &unk_10002CEB8;
  id v12 = WeakRetained;
  uint64_t v13 = &v16;
  int v15 = a2;
  uint64_t v14 = a3;
  id v8 = WeakRetained;
  dispatch_sync(v7, v11);
  uint64_t v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t sub_1000107B0(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000109F0;
  v11[3] = &unk_10002CEB8;
  id v12 = WeakRetained;
  uint64_t v13 = &v16;
  int v15 = a2;
  uint64_t v14 = a3;
  id v8 = WeakRetained;
  dispatch_sync(v7, v11);
  uint64_t v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_100010898(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000109E4;
  v7[3] = &unk_10002D530;
  id v8 = WeakRetained;
  uint64_t v9 = a2;
  id v6 = WeakRetained;
  dispatch_sync(v5, v7);
}

void sub_10001093C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000109DC;
  block[3] = &unk_10002D170;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_sync(v3, block);
}

id sub_1000109DC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _reconcilePurgeNotification];
}

id sub_1000109E4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _handleCacheDeleteNotification:*(void *)(a1 + 40)];
}

id sub_1000109F0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _handlePurgeRequestWithUrgency:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100010A2C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _handlePurgeableRequestWithUrgency:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100010EC4(uint64_t a1)
{
  long long v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v10 = 136446722;
    id v11 = v3;
    __int16 v12 = 2050;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Authorizer flagged suspicious query=%{public}s with action=%{public}ld from bundleID=%{public}@", (uint8_t *)&v10, 0x20u);
  }

  id v6 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    id v7 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v10 = 136446722;
    id v11 = v7;
    __int16 v12 = 2050;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Authorizer flagged suspicious query=%{public}s with action=%{public}ld from bundleID=%{public}@", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t sub_100011024(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_1000113CC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = +[ML3MusicLibrary libraryPathForContainerPath:a2];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void sub_1000114D4(id a1)
{
  uint64_t v1 = (void *)qword_100035018;
  qword_100035018 = (uint64_t)&off_10002EDE8;
}

void sub_10001169C(uint64_t a1)
{
  long long v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Maintenance] Maintenance operation complete. Performing artwork reconciliation.", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001178C;
  v5[3] = &unk_10002D418;
  id v6 = *(id *)(a1 + 48);
  [v4 reconcilePurgeableArtworkForLibrary:v3 withCompletion:v5];
}

uint64_t sub_10001178C(uint64_t a1)
{
  long long v2 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Maintenance] Artwork reconciliation complete.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void sub_100011C40(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 144);
  uint64_t v4 = [*(id *)(a1 + 40) name];
  uint64_t v5 = v4;
  if (v3)
  {
    unsigned int v6 = [v4 isEqualToString:ML3MusicLibraryContentsDidChangeNotification];

    if (v6)
    {
      id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = [*(id *)(a1 + 40) name];
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Resetting spotlight update timer to 5s due to %{public}@", buf, 0xCu);
      }
      dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144), v2, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    }
  }
  else
  {
    unsigned int v9 = [v4 isEqualToString:ML3MusicLibraryNonContentsPropertiesDidChangeNotification];

    int v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Creating spotlight update timer for 1hr due to ML3MusicLibraryNonContentsPropertiesDidChangeNotification", buf, 2u);
      }

      dispatch_time_t v2 = dispatch_time(0, 3600000000000);
    }
    else
    {
      if (v11)
      {
        __int16 v12 = [*(id *)(a1 + 40) name];
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Creating spotlight update timer for 5s due to %{public}@", buf, 0xCu);
      }
    }
    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 144);
    *(void *)(v14 + 144) = v13;

    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144), v2, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    uint64_t v16 = *(void *)(a1 + 32);
    unsigned int v17 = *(NSObject **)(v16 + 144);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100011F04;
    handler[3] = &unk_10002D170;
    handler[4] = v16;
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 144));
  }
}

void sub_100011F04(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSpotlightIndexForBundleID:ML3BundleIDMusic withCompletion:&stru_10002D6E8];
  [*(id *)(a1 + 32) updateSpotlightIndexForBundleID:ML3BundleIDVideos withCompletion:&stru_10002D708];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;
}

void sub_100011F84(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      id v7 = "Sucessfully finished spotlight index for Videos from library did change notification";
      uint64_t v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138543362;
    BOOL v11 = v4;
    id v7 = "Failed to index Videos for spotlight from library did change notification with error: %{public}@";
    uint64_t v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void sub_100012078(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      id v7 = "Sucessfully finished spotlight index for Music from library did change notification";
      uint64_t v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138543362;
    BOOL v11 = v4;
    id v7 = "Failed to index Music for spotlight from library did change notification with error: %{public}@";
    uint64_t v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void sub_1000122F8(id a1, ML3MusicLibrary *a2, unint64_t a3, BOOL *a4)
{
}

void sub_100012910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001292C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDebugSignal];
}

id sub_100012A98(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 72) cancelActiveTransationAndDatabaseOperationsForClient:*(void *)(a1 + 40)];
}

uint64_t sub_100012BEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012BFC(uint64_t a1)
{
}

void sub_100012C04(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) allValues];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100012D60(void *a1)
{
  uint64_t v2 = a1[6];
  switch(v2)
  {
    case 1:
      uint64_t v3 = MLMediaLibraryServiceMachServiceName;
      if (v3) {
        goto LABEL_9;
      }
      break;
    case 2:
      uint64_t v3 = @"MLDSupportedServicesMediaLibraryResourcesService";
      goto LABEL_9;
    case 3:
      uint64_t v3 = @"MLDSupportedServiceMediaLibraryClientImportService";
LABEL_9:
      id v5 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:v3];

      if (!v5)
      {
        switch(a1[6])
        {
          case 0:
            BOOL v6 = +[NSAssertionHandler currentHandler];
            [v6 handleFailureInMethod:a1[7] object:a1[4] file:@"MLDMediaLibraryService.m" lineNumber:1362 description:@"We should never get here"];

            goto LABEL_12;
          case 1:
            id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v3];
            [v7 setDelegate:a1[4]];
            break;
          case 2:
            id v7 = +[NSXPCListener anonymousListener];
            uint64_t v8 = +[MLMediaLibraryResourcesServiceServer sharedInstance];
            goto LABEL_16;
          case 3:
            id v7 = +[NSXPCListener anonymousListener];
            uint64_t v8 = +[MLDClientImportService sharedService];
LABEL_16:
            uint32_t v9 = (void *)v8;
            [v7 setDelegate:v8];

            break;
          default:
LABEL_12:
            id v7 = 0;
            break;
        }
        int v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543362;
          uint64_t v15 = v3;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting service '%{public}@'", (uint8_t *)&v14, 0xCu);
        }

        [*(id *)(a1[4] + 56) setObject:v7 forKeyedSubscript:v3];
        [v7 resume];
      }
      uint64_t v11 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:v3];
      uint64_t v12 = *(void *)(a1[5] + 8);
      dispatch_source_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      goto LABEL_21;
  }
  uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[4];
    int v14 = 138543362;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@ - Attempting to retrieve an XPC listener for an unknown service", (uint8_t *)&v14, 0xCu);
  }
LABEL_21:
}

void sub_1000130F8(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "setDelegate:", *(void *)(a1 + 40), (void)v11);
        uint64_t v8 = [v7 connectionPool];
        [v8 setUseDistantWriterConnections:0];

        uint32_t v9 = *(void **)(*(void *)(a1 + 40) + 160);
        int v10 = [v7 databasePath];
        [v9 setObject:v7 forKey:v10];
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_100013350(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[ML3MusicLibrary allLibraries];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001340C;
  v6[3] = &unk_10002D580;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void sub_10001340C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 databasePath];
  [v3 _performMaintenanceOnDatabaseAtPath:v4 withActivity:*(void *)(a1 + 40) completion:0];
}

void sub_1000134EC(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  if ([v3 isEqualToString:@"com.apple.siri.koa.donate"])
  {
    [*(id *)(a1 + 32) updateSiriIndexMetadataForAllLibrariesWithCompletion:0];
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 138543362;
      BOOL v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Received unhandled notifyd.matching darwin notification: '%{public}@'", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t sub_100013AA4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 200);
  return result;
}

uint64_t sub_100013B2C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 200) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100013BE4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 192);
  return result;
}

uint64_t sub_100013C70(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 192) = *(unsigned char *)(result + 40);
  return result;
}

void sub_100013EC4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLocked:*(unsigned __int8 *)(*(void *)(a1 + 40) + 192)];
  id v2 = +[MSVXPCTransaction activeTransactions];
  [*(id *)(a1 + 32) setActiveXPCTransactions:v2];

  [*(id *)(a1 + 32) setActiveClients:*(void *)(a1 + 48)];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 160) allValues];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = [MLDDatabaseFileDiagnostic alloc];
        long long v12 = [v10 databasePath];
        long long v13 = [(MLDDatabaseFileDiagnostic *)v11 initWithDatabasePath:v12];

        [v4 addObject:v13];
        long long v14 = [v10 connectionPool];
        uint64_t v15 = [v14 _generateDiagnostic];
        uint64_t v16 = [v10 databasePath];
        [v5 setObject:v15 forKey:v16];
      }
      id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) setDatabaseFileDiagnostics:v4];
  [*(id *)(a1 + 32) setLibraryConnectionDiagnostics:v5];
  [*(id *)(*(void *)(a1 + 40) + 72) collectDiagnostic:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 80) collectDiagnostic:*(void *)(a1 + 32)];
}

void sub_1000141C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Connection invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  if (v3) {
    [WeakRetained _handleXPCDisconnect:v3];
  }
}

void sub_1000142B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Connection interrupted: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  if (v3) {
    [WeakRetained _handleXPCDisconnect:v3];
  }
}

void sub_1000145C8(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[6];
  if (v1)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v4 = a1[6];
    uint64_t v5 = 0;
LABEL_5:
    v3(v4, v1, v5);
    return;
  }
  uint64_t v5 = a1[5];
  if (v5)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v4 = a1[6];
    uint64_t v1 = 0;
    goto LABEL_5;
  }
  id v6 = +[NSError msv_errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:0 debugDescription:@"MLDMediaLibraryService securityScopedURLWrapperForItemPid: encountered nil wrapper"];
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v6);
}

void sub_100014D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_100014D54(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
    id v5 = a3;
    os_unfair_lock_lock(v4);
    [*(id *)(a1 + 32) addObject:v5];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  }
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_100014DD0(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v2 = +[NSError msv_errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:3000 underlyingErrors:*(void *)(a1 + 32) debugDescription:@"Updating Siri index failed"];
    }
    else
    {
      uint64_t v2 = 0;
    }
    id v3 = (id)v2;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100015410(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isDatabaseLocked];
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unlocking database", buf, 2u);
    }

    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 _allMediaLibraries];
    [v5 _reconnectLibraries:v6];

    [*(id *)(*(void *)(a1 + 32) + 96) clearValidatedPaths];
    [*(id *)(*(void *)(a1 + 32) + 96) resumeValidations];
    id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unlock: resuming media library writer", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) setSuspended:0];
    uint64_t v8 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unlock: resuming the maintenance tasks queue", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 104) setSuspended:0];
    uint32_t v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unlock: completed successfully", buf, 2u);
    }

    [*(id *)(a1 + 32) setCurrentLockReason:0];
    [*(id *)(a1 + 32) setDatabaseLocked:0];
    int v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015740;
    block[3] = &unk_10002D418;
    id v19 = *(id *)(a1 + 40);
    dispatch_async(v10, block);
    id v11 = v19;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unlock: not locked", buf, 2u);
    }

    long long v12 = +[ML3MediaLibraryWriter writerErrorWithCode:0 description:@"Database is not currently locked."];
    long long v13 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100015758;
    v15[3] = &unk_10002D468;
    id v14 = *(id *)(a1 + 40);
    id v16 = v12;
    id v17 = v14;
    id v11 = v12;
    dispatch_async(v13, v15);
  }
}

uint64_t sub_100015740(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015758(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_100015874(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) isDatabaseLocked];
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lock: already locked", buf, 2u);
    }

    [*(id *)(a1 + 32) currentLockReason];
    id v5 = MLServiceLockReasonDescription();
    id v6 = +[NSString stringWithFormat:@"Database is already locked. (Reason = %@)", v5];

    id v7 = +[ML3MediaLibraryWriter writerErrorWithCode:1000 description:v6];
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015D00;
    block[3] = &unk_10002D468;
    id v9 = *(id *)(a1 + 40);
    id v21 = v7;
    id v22 = v9;
    id v10 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    if (v4)
    {
      id v11 = MLServiceLockReasonDescription();
      *(_DWORD *)buf = 138543362;
      long long v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Locking database for reason: %{public}@", buf, 0xCu);
    }
    long long v12 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Lock: cancelling all database operations", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) cancelAllActiveDatabaseOperationsAndWaitUntilFinished:1];
    [*(id *)(*(void *)(a1 + 32) + 96) suspendValidations];
    long long v13 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Lock: suspending the maintenance tasks queue", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 104) setSuspended:1];
    [*(id *)(*(void *)(a1 + 32) + 104) waitUntilAllOperationsAreFinished];
    id v14 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Lock: cancelling all import operations", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 80) cancelAllImportOperations];
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [v15 _allMediaLibraries];
    [v15 _disconnectLibraries:v16];

    id v17 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Lock: suspending media library writer", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 72) setSuspended:1];
    long long v18 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Lock: completed successfully", buf, 2u);
    }

    [*(id *)(a1 + 32) setCurrentLockReason:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setDatabaseLocked:1];
    id v19 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100015CE8;
    v23[3] = &unk_10002D418;
    id v24 = *(id *)(a1 + 40);
    dispatch_async(v19, v23);
    id v6 = v24;
  }
}

uint64_t sub_100015CE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015D00(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_100015E4C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100016124(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = objc_alloc((Class)ML3DatabasePrivacyContext);
    id v7 = [*(id *)(a1 + 32) clientIdentity];
    id v8 = [v6 initWithClientIdentity:v7];

    [v8 logDatabasePrivacyAccess];
    id v9 = [*(id *)(a1 + 40) _mediaLibraryForPath:*(void *)(a1 + 48)];
    id v10 = [objc_alloc((Class)ML3ServiceDatabaseImport) initWithDatabaseImport:*(void *)(a1 + 32) library:v9 writer:*(void *)(*(void *)(a1 + 40) + 72) client:*(void *)(a1 + 56)];
    id v11 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Performing import: %{public}@", buf, 0xCu);
    }

    long long v12 = *(void **)(*(void *)(a1 + 40) + 80);
    uint64_t v13 = *(void *)(a1 + 88);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000163F4;
    v19[3] = &unk_10002D378;
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100016468;
    v16[3] = &unk_10002D3A0;
    id v18 = *(id *)(a1 + 80);
    id v17 = *(id *)(a1 + 72);
    [v12 performImport:v10 fromSource:v13 progressBlock:v19 withCompletionHandler:v16];
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Database validation failed. Aborting database import.", buf, 2u);
    }

    uint64_t v15 = *(void *)(a1 + 80);
    if (v15) {
      (*(void (**)(uint64_t, void, id, void))(v15 + 16))(v15, 0, v5, 0);
    }
    [*(id *)(a1 + 72) endTransaction];
  }
}

void sub_1000163F4(uint64_t a1, float a2)
{
  id v6 = [*(id *)(a1 + 32) connection];
  BOOL v4 = [v6 remoteObjectProxy];
  *(float *)&double v5 = a2;
  [v4 importOperationWithIdentifier:*(void *)(a1 + 40) didUpdateWithProgress:v5];
}

id sub_100016468(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 endTransaction];
}

void sub_100016ADC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mediaLibraryForPath:*(void *)(a1 + 40)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(void **)(a1 + 64);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016E08;
  v8[3] = &unk_10002D300;
  id v9 = v7;
  id v11 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 72);
  [v3 performDatabaseOperation:v4 onLibrary:v2 withAttributes:v5 options:v6 fromClient:v9 completionHandler:v8];
}

void sub_100016BE8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    *(_OWORD *)buf = 0u;
    long long v16 = 0u;
    uint64_t v6 = [*(id *)(a1 + 32) connection];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) connection];
      id v8 = v7;
      if (v7)
      {
        [v7 auditToken];
      }
      else
      {
        long long v13 = 0u;
        long long v14 = 0u;
      }
      *(_OWORD *)buf = v13;
      long long v16 = v14;
    }
    else
    {
      MSVAuditTokenForCurrentProcess();
      id v8 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Logging privacy access for daemon process", (uint8_t *)&v13, 2u);
      }
    }

    long long v13 = *(_OWORD *)buf;
    long long v14 = v16;
    +[ML3DatabasePrivacyContext logDatabasePrivacyAccessWithAuditToken:&v13];
    id v11 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 64);
      LODWORD(v13) = 134217984;
      *(void *)((char *)&v13 + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Validating successful - enqueing operation for type %lu", (uint8_t *)&v13, 0xCu);
    }

    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 32), *(dispatch_block_t *)(a1 + 48));
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Validation failed! Operation not enqueued. %{public}@", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v5);
    }
  }
}

void sub_100016E08(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished database operation request on client: %{public}@. err=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 40) endTransaction];
}

void sub_100017324(uint64_t a1)
{
  [*(id *)(a1 + 32) _logPrivacyAccessWithTransactionIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v12 = 0;
  uint64_t v8 = [v4 executeUntrustedQuery:v5 withParameters:v6 options:v7 onTransaction:v3 error:&v12];
  id v9 = v12;
  [*(id *)(a1 + 32) faultForQuery:*(void *)(a1 + 48) fromClientBundleID:*(void *)(a1 + 72) onTrustError:v9];
  if (v8)
  {
    uint64_t v10 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    if (!v10)
    {
      uint64_t v11 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:@"Failed to serialize fetched query data."];

      id v9 = (id)v11;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void sub_1000175D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000175F8(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) _transactionForIdentifier:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000176A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mediaLibraryForPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 88);
  id v15 = 0;
  id v6 = [v3 beginTransactionForLibrary:v2 withClient:v4 options:v5 error:&v15];
  id v7 = v15;
  uint64_t v8 = [v6 identifier];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    if (!v7)
    {
      long long v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 32) file:@"MLDMediaLibraryService.m" lineNumber:471 description:@"Error cannot be nil even with nil transaction identifier"];
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    [*(id *)(a1 + 56) endTransaction];
    [*(id *)(a1 + 64) invalidate];
    id v12 = (MLDTransactionInfo *)os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_DEFAULT, "Releasing task assertion %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v12 = objc_alloc_init(MLDTransactionInfo);
    [(MLDTransactionInfo *)v12 setTaskAssertion:*(void *)(a1 + 64)];
    [(MLDTransactionInfo *)v12 setClient:*(void *)(a1 + 48)];
    long long v13 = [*(id *)(a1 + 72) privacyContext];
    [(MLDTransactionInfo *)v12 setPrivacyContext:v13];

    [*(id *)(a1 + 32) _registerTransactionInfo:v12 forIdentitifer:v9];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    [*(id *)(a1 + 56) endTransaction];
  }
}

void sub_100017EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017F14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained error];
  uint64_t v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Integrity check complete. err=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void, BOOL, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 == 0, v3);
  [*(id *)(a1 + 32) endTransaction];
}

void sub_100018280(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018438;
  v9[3] = &unk_10002D198;
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  uint64_t v3 = objc_retainBlock(v9);
  [v2 addObject:v3];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 112) operations];
  id v5 = [v4 firstObject];

  if (!v5)
  {
    id v5 = [objc_alloc((Class)ML3DatabaseRecoveryOperation) initWithDatabaseFilePath:*(void *)(a1 + 48)];
    objc_initWeak(&location, v5);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100018488;
    v6[3] = &unk_10002D8D0;
    objc_copyWeak(&v7, &location);
    v6[4] = *(void *)(a1 + 32);
    [v5 setCompletionBlock:v6];
    [*(id *)(*(void *)(a1 + 32) + 112) addOperation:v5];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void sub_100018418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100018438(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 == 0, a2);
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 endTransaction];
}

void sub_100018488(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained error];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018540;
  v7[3] = &unk_10002D8A8;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

id sub_100018540(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 120);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "removeAllObjects", (void)v8);
}

void sub_100018700(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) enumerateKeysAndObjectsUsingBlock:&stru_10002D148];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;
}

void sub_100018750(id a1, NSString *a2, NSXPCListener *a3, BOOL *a4)
{
  id v4 = a3;
  [(NSXPCListener *)v4 invalidate];
  [(NSXPCListener *)v4 suspend];
  [(NSXPCListener *)v4 setDelegate:0];
}

uint64_t sub_100018ACC(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v1 = &_dispatch_main_q;
  objc_copyWeak(&v4, &location);
  uint64_t v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

void sub_100018B94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_100018BB0(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    long long v8 = WeakRetained;
    if (WeakRetained)
    {
      long long v9 = [WeakRetained _stateDump];
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_100018CDC(id a1)
{
  qword_100035008 = [[MLDMediaLibraryService alloc] _init];

  _objc_release_x1();
}

void sub_100018F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018F70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to report progress to client. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1000193D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100019430(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to obtain client proxy object. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100019508(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping failure", (uint8_t *)&v8, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  }
}

void sub_100019960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000199C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to obtain client proxy object. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100019A98(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping failure", (uint8_t *)&v8, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  }
}

void sub_100019EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100019F50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to obtain client proxy object. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10001A028(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping failure", (uint8_t *)&v8, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  }
}

void sub_10001A34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_10001A940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_10001AA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_10001AAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001AB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v11) {

  }
  _Unwind_Resume(a1);
}

void sub_10001AC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (!v12) {

  }
  _Unwind_Resume(a1);
}

void sub_10001AD20(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  id v1 = (__CFRunLoop *)[*(id *)(*(void *)(a1 + 32) + 80) getCFRunLoop];

  CFRunLoopStop(v1);
}

void sub_10001AE0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001B604(void *a1, int a2, uint64_t *a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = *a3;
    id v4 = a1;
    id v5 = +[NSString stringWithUTF8String:v3];
    [v4 addObject:v5];
  }
  return 0;
}

void sub_10001BB80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 160));
  _Unwind_Resume(a1);
}

id sub_10001BBB8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void sub_10001BBC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    long long v10 = WeakRetained;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@ - Connection interrupted for session %{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    id v5 = WeakRetained[2];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001BEAC;
    v6[3] = &unk_10002D8A8;
    id v7 = *(id *)(a1 + 32);
    int v8 = WeakRetained;
    dispatch_sync(v5, v6);
  }
}

void sub_10001BD18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    long long v10 = WeakRetained;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@ - Connection invalidated for session %{public}@ - removing", buf, 0x16u);
  }

  if (WeakRetained)
  {
    id v5 = WeakRetained[2];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001BE6C;
    v6[3] = &unk_10002D8A8;
    id v7 = *(id *)(a1 + 32);
    int v8 = WeakRetained;
    dispatch_sync(v5, v6);
  }
}

id sub_10001BE6C(uint64_t a1)
{
  [*(id *)(a1 + 32) stop];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);

  return [v3 removeObject:v2];
}

id sub_10001BEAC(uint64_t a1)
{
  [*(id *)(a1 + 32) stop];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);

  return [v3 removeObject:v2];
}

void sub_10001BFDC(id a1)
{
  qword_100035028 = objc_alloc_init(MLDClientImportService);

  _objc_release_x1();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t MusicSiriRepresentation.init(for:title:authorName:artwork:contentRating:url:isLibraryAdded:)()
{
  return MusicSiriRepresentation.init(for:title:authorName:artwork:contentRating:url:isLibraryAdded:)();
}

uint64_t MusicSiriRepresentation.id.getter()
{
  return MusicSiriRepresentation.id.getter();
}

uint64_t type metadata accessor for MusicSiriRepresentation()
{
  return type metadata accessor for MusicSiriRepresentation();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for ContentRating()
{
  return type metadata accessor for ContentRating();
}

uint64_t type metadata accessor for Artwork()
{
  return type metadata accessor for Artwork();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

Swift::Void __swiftcall CSSearchableItemAttributeSet.associate(entityInstanceIdentifier:entityTypeIdentifier:displayTitle:displaySubtitle:displaySynonyms:typeDisplayName:typeDisplaySynonyms:propertyDictionary:priority:)(Swift::String entityInstanceIdentifier, Swift::String entityTypeIdentifier, Swift::String displayTitle, Swift::String_optional displaySubtitle, Swift::OpaquePointer displaySynonyms, Swift::String_optional typeDisplayName, Swift::OpaquePointer typeDisplaySynonyms, Swift::OpaquePointer propertyDictionary, Swift::Int priority)
{
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

uint64_t CacheDeleteEnumerateRemovedFilesInDirectories()
{
  return _CacheDeleteEnumerateRemovedFilesInDirectories();
}

uint64_t CacheDeleteInitPurgeMarker()
{
  return _CacheDeleteInitPurgeMarker();
}

uint64_t CacheDeleteRegister()
{
  return _CacheDeleteRegister();
}

uint64_t CacheDeleteRegisterPurgeNotification()
{
  return _CacheDeleteRegisterPurgeNotification();
}

uint64_t ML3ProcessHandleFromPID()
{
  return _ML3ProcessHandleFromPID();
}

uint64_t MLServiceLockReasonDescription()
{
  return _MLServiceLockReasonDescription();
}

uint64_t MSVAuditTokenForCurrentProcess()
{
  return _MSVAuditTokenForCurrentProcess();
}

uint64_t MSVBundleIDForAuditToken()
{
  return _MSVBundleIDForAuditToken();
}

uint64_t MSVDeviceIsHomePod()
{
  return _MSVDeviceIsHomePod();
}

uint64_t MSVDeviceIsWatch()
{
  return _MSVDeviceIsWatch();
}

uint64_t MSVDeviceSupportsMultipleLibraries()
{
  return _MSVDeviceSupportsMultipleLibraries();
}

uint64_t MSVGetDeviceHardwarePlatform()
{
  return _MSVGetDeviceHardwarePlatform();
}

uint64_t MSVLogAddStateHandler()
{
  return _MSVLogAddStateHandler();
}

uint64_t MSVLogRemoveStateHandler()
{
  return _MSVLogRemoveStateHandler();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _NSIsNSNumber()
{
  return __NSIsNSNumber();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__MLDSupportedServiceForXPCListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_MLDSupportedServiceForXPCListener:");
}

id objc_msgSend__XPCListenerForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_XPCListenerForService:");
}

id objc_msgSend__addOptimizeStorageAnalyticsToPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addOptimizeStorageAnalyticsToPayload:");
}

id objc_msgSend__addPurgeAnalytics_toPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPurgeAnalytics:toPayload:");
}

id objc_msgSend__addPurgeableAnalytics_toPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPurgeableAnalytics:toPayload:");
}

id objc_msgSend__addUsageAnalytics_toPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addUsageAnalytics:toPayload:");
}

id objc_msgSend__adjustProgressForIncomingOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustProgressForIncomingOperationCount:");
}

id objc_msgSend__allMediaLibraries(void *a1, const char *a2, ...)
{
  return _[a1 _allMediaLibraries];
}

id objc_msgSend__appendDescribableArray_toString_withTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendDescribableArray:toString:withTitle:");
}

id objc_msgSend__appendDescribableArray_toString_withTitle_indentLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendDescribableArray:toString:withTitle:indentLevel:");
}

id objc_msgSend__cacheDeleteUrgencyToMusicLibraryUrgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheDeleteUrgencyToMusicLibraryUrgency:");
}

id objc_msgSend__calculateUsageAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 _calculateUsageAnalytics];
}

id objc_msgSend__clientForConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientForConnection:");
}

id objc_msgSend__closeAllConnectionsAndWaitForBusyConnections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeAllConnectionsAndWaitForBusyConnections:");
}

id objc_msgSend__createErrorWithDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createErrorWithDescription:");
}

id objc_msgSend__createSQLiteErrorWithCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSQLiteErrorWithCode:description:");
}

id objc_msgSend__currentXPCClient(void *a1, const char *a2, ...)
{
  return _[a1 _currentXPCClient];
}

id objc_msgSend__deviceSharedLibraryPath(void *a1, const char *a2, ...)
{
  return _[a1 _deviceSharedLibraryPath];
}

id objc_msgSend__disconnectLibraries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectLibraries:");
}

id objc_msgSend__endSessionCommittingChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endSessionCommittingChanges:");
}

id objc_msgSend__exitForLocalizationChange(void *a1, const char *a2, ...)
{
  return _[a1 _exitForLocalizationChange];
}

id objc_msgSend__generateDiagnostic(void *a1, const char *a2, ...)
{
  return _[a1 _generateDiagnostic];
}

id objc_msgSend__generateSecurityScopedURLWrapperForItemPid_withLibrary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateSecurityScopedURLWrapperForItemPid:withLibrary:error:");
}

id objc_msgSend__handleDebugSignal(void *a1, const char *a2, ...)
{
  return _[a1 _handleDebugSignal];
}

id objc_msgSend__handlePurgeRequestWithUrgency_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePurgeRequestWithUrgency:info:");
}

id objc_msgSend__handlePurgeableRequestWithUrgency_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePurgeableRequestWithUrgency:info:");
}

id objc_msgSend__handleXPCDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleXPCDisconnect:");
}

id objc_msgSend__importOperations(void *a1, const char *a2, ...)
{
  return _[a1 _importOperations];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__isMediaPath_selector_resolvedPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isMediaPath:selector:resolvedPath:");
}

id objc_msgSend__isMediaVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isMediaVolume:");
}

id objc_msgSend__logPrivacyAccessWithTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logPrivacyAccessWithTransactionIdentifier:");
}

id objc_msgSend__mediaLibraryForPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaLibraryForPath:");
}

id objc_msgSend__performDiagnosticWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performDiagnosticWithReason:");
}

id objc_msgSend__performMaintenanceOnDatabaseAtPath_withActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMaintenanceOnDatabaseAtPath:withActivity:completion:");
}

id objc_msgSend__platformSupportsSiriIndexing(void *a1, const char *a2, ...)
{
  return _[a1 _platformSupportsSiriIndexing];
}

id objc_msgSend__platformSupportsSpotlightIndexing(void *a1, const char *a2, ...)
{
  return _[a1 _platformSupportsSpotlightIndexing];
}

id objc_msgSend__purgePendingDatabaseValidations(void *a1, const char *a2, ...)
{
  return _[a1 _purgePendingDatabaseValidations];
}

id objc_msgSend__reconcileAllOriginalArtworkForLibrary_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reconcileAllOriginalArtworkForLibrary:withCompletion:");
}

id objc_msgSend__reconcileOrginalArtworkWitRelativePaths_forLibrary_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reconcileOrginalArtworkWitRelativePaths:forLibrary:withCompletion:");
}

id objc_msgSend__reconnectLibraries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reconnectLibraries:");
}

id objc_msgSend__registerCacheDeleteHandler(void *a1, const char *a2, ...)
{
  return _[a1 _registerCacheDeleteHandler];
}

id objc_msgSend__registerForLanguageChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForLanguageChangeNotifications];
}

id objc_msgSend__registerForLibraryDidChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForLibraryDidChangeNotifications];
}

id objc_msgSend__registerTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerTransaction:");
}

id objc_msgSend__registerTransactionInfo_forIdentitifer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerTransactionInfo:forIdentitifer:");
}

id objc_msgSend__reportCacheDeletePurgeEventWithUrgency_amountRequested_amountPurged_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportCacheDeletePurgeEventWithUrgency:amountRequested:amountPurged:duration:");
}

id objc_msgSend__reportCacheDeletePurgeableRequestWithUrgency_purgeableAmount_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportCacheDeletePurgeableRequestWithUrgency:purgeableAmount:duration:");
}

id objc_msgSend__reportProgress(void *a1, const char *a2, ...)
{
  return _[a1 _reportProgress];
}

id objc_msgSend__resetIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _resetIdleTimer];
}

id objc_msgSend__setDaemonProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDaemonProcessInfo:");
}

id objc_msgSend__setupActivityHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _setupActivityHandlers];
}

id objc_msgSend__setupCacheDeleteController(void *a1, const char *a2, ...)
{
  return _[a1 _setupCacheDeleteController];
}

id objc_msgSend__setupNotifyEventHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _setupNotifyEventHandlers];
}

id objc_msgSend__setupSignalHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupSignalHandler];
}

id objc_msgSend__shouldAcceptConnectionForMediaLibraryService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldAcceptConnectionForMediaLibraryService:");
}

id objc_msgSend__startIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startIdleTimer];
}

id objc_msgSend__stateDump(void *a1, const char *a2, ...)
{
  return _[a1 _stateDump];
}

id objc_msgSend__stopIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopIdleTimer];
}

id objc_msgSend__suspendedImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 _suspendedImportOperations];
}

id objc_msgSend__tearDownLanguageChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownLanguageChangeNotifications];
}

id objc_msgSend__tearDownLibraryDidChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownLibraryDidChangeNotifications];
}

id objc_msgSend__tearDownSignalHandler(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownSignalHandler];
}

id objc_msgSend__transactionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionForIdentifier:");
}

id objc_msgSend__unregisterTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterTransaction:");
}

id objc_msgSend__unregisterTransactionInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterTransactionInfoForIdentifier:");
}

id objc_msgSend__updateMultiUserPurgeabilityForPrimaryLibraryPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMultiUserPurgeabilityForPrimaryLibraryPath:");
}

id objc_msgSend__updatePurgedOriginalWithRelativePath_forLibrary_usingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePurgedOriginalWithRelativePath:forLibrary:usingConnection:");
}

id objc_msgSend__updateSiriIndexForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSiriIndexForNotification:");
}

id objc_msgSend__updateSiriIndexMetadataForLibraryAtPath_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSiriIndexMetadataForLibraryAtPath:completion:");
}

id objc_msgSend__updateSpotlightIndexForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSpotlightIndexForNotification:");
}

id objc_msgSend__validateDatabaseAtPath_forConnection_byTruncatingFirst_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateDatabaseAtPath:forConnection:byTruncatingFirst:withCompletion:");
}

id objc_msgSend__validateTransactionIdentifier_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateTransactionIdentifier:forClient:");
}

id objc_msgSend__writeDiagnosticToDisk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeDiagnosticToDisk:");
}

id objc_msgSend_activeTransactions(void *a1, const char *a2, ...)
{
  return _[a1 activeTransactions];
}

id objc_msgSend_addAccountChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccountChangeObserver:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addTrack_persistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTrack:persistentID:");
}

id objc_msgSend_allLibraries(void *a1, const char *a2, ...)
{
  return _[a1 allLibraries];
}

id objc_msgSend_allLibraryContainerPaths(void *a1, const char *a2, ...)
{
  return _[a1 allLibraryContainerPaths];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attemptRecoveryUsingHandle_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptRecoveryUsingHandle:withError:");
}

id objc_msgSend_attributesOfFileSystemForPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfFileSystemForPath:error:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_autoupdatingSharedLibraryPath(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingSharedLibraryPath];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _[a1 beginTransaction];
}

id objc_msgSend_beginTransactionForDatabaseWithContext_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionForDatabaseWithContext:completionHandler:");
}

id objc_msgSend_beginTransactionForDatabaseWithContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionForDatabaseWithContext:error:");
}

id objc_msgSend_beginTransactionForLibrary_withClient_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionForLibrary:withClient:options:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_cancelAllActiveDatabaseOperationsAndWaitUntilFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllActiveDatabaseOperationsAndWaitUntilFinished:");
}

id objc_msgSend_cancelAllImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllImportOperations];
}

id objc_msgSend_cancelImportOperationsForSource_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelImportOperationsForSource:withCompletionHandler:");
}

id objc_msgSend_cancelImportOperationsOriginatingFromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelImportOperationsOriginatingFromClient:");
}

id objc_msgSend_cancelSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelSessionWithCompletion:");
}

id objc_msgSend_cleanupArtworkWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupArtworkWithOptions:");
}

id objc_msgSend_clearCloudAssetSharedCache(void *a1, const char *a2, ...)
{
  return _[a1 clearCloudAssetSharedCache];
}

id objc_msgSend_clearPurgeableStorageAmount_withUrgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPurgeableStorageAmount:withUrgency:");
}

id objc_msgSend_clearValidatedPaths(void *a1, const char *a2, ...)
{
  return _[a1 clearValidatedPaths];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientIdentity(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentity];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientInterface];
}

id objc_msgSend_collectDiagnostic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectDiagnostic:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionPool(void *a1, const char *a2, ...)
{
  return _[a1 connectionPool];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentDatabaseVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentDatabaseVersion];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentLockReason(void *a1, const char *a2, ...)
{
  return _[a1 currentLockReason];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTransactionID(void *a1, const char *a2, ...)
{
  return _[a1 currentTransactionID];
}

id objc_msgSend_daemonClient(void *a1, const char *a2, ...)
{
  return _[a1 daemonClient];
}

id objc_msgSend_databaseConnectionAllowingWrites_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseConnectionAllowingWrites:withBlock:");
}

id objc_msgSend_databaseOperationLimitedQueue(void *a1, const char *a2, ...)
{
  return _[a1 databaseOperationLimitedQueue];
}

id objc_msgSend_databaseOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 databaseOperationQueue];
}

id objc_msgSend_databaseOperationSerialQueue(void *a1, const char *a2, ...)
{
  return _[a1 databaseOperationSerialQueue];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return _[a1 databasePath];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableAutomaticDatabaseValidation(void *a1, const char *a2, ...)
{
  return _[a1 disableAutomaticDatabaseValidation];
}

id objc_msgSend_disableSharedLibrary(void *a1, const char *a2, ...)
{
  return _[a1 disableSharedLibrary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return _[a1 endTransaction];
}

id objc_msgSend_endTransaction_shouldCommit_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction:shouldCommit:error:");
}

id objc_msgSend_endTransactionOnDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransactionOnDate:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateArtworkRelativePathsWithConnection:matchingRelativePathContainer:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateRowsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRowsWithBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeQuery_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withParameters:");
}

id objc_msgSend_executeUntrustedQuery_withParameters_options_onTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeUntrustedQuery:withParameters:options:onTransaction:error:");
}

id objc_msgSend_executeUntrustedUpdate_withParameters_onTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeUntrustedUpdate:withParameters:onTransaction:error:");
}

id objc_msgSend_executeUpdate_withParameters_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeUpdate:withParameters:error:");
}

id objc_msgSend_faultForQuery_fromClientBundleID_onTrustError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faultForQuery:fromClientBundleID:onTrustError:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _[a1 finish];
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getCFRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 getCFRunLoop];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_importOperationWithIdentifier_didUpdateWithProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importOperationWithIdentifier:didUpdateWithProgress:");
}

id objc_msgSend_indexSchemaSQL(void *a1, const char *a2, ...)
{
  return _[a1 indexSchemaSQL];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithClientIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentity:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithDatabaseFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseFilePath:");
}

id objc_msgSend_initWithDatabaseImport_library_writer_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseImport:library:writer:client:");
}

id objc_msgSend_initWithDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabasePath:");
}

id objc_msgSend_initWithDatabasePath_repairFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabasePath:repairFaults:");
}

id objc_msgSend_initWithFaultString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFaultString:");
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFireDate:interval:target:selector:userInfo:repeats:");
}

id objc_msgSend_initWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIndex:");
}

id objc_msgSend_initWithLibraries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLibraries:");
}

id objc_msgSend_initWithLibrary_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLibrary:activity:");
}

id objc_msgSend_initWithLibrary_connection_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLibrary:connection:client:");
}

id objc_msgSend_initWithLibrary_connection_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLibrary:connection:configuration:");
}

id objc_msgSend_initWithLibrary_delegate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLibrary:delegate:completion:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_pid_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:pid:bundleID:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithPersistentID_inLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:inLibrary:");
}

id objc_msgSend_initWithPrivacyContext_path_priorityLevel_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivacyContext:path:priorityLevel:options:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithSuccess_resultingDatabasePersistentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuccess:resultingDatabasePersistentIDs:");
}

id objc_msgSend_initWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:selector:object:");
}

id objc_msgSend_initWithURL_readonly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:readonly:");
}

id objc_msgSend_int64ForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "int64ForColumnIndex:");
}

id objc_msgSend_intForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intForColumnIndex:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return _[a1 isDaemon];
}

id objc_msgSend_isDatabaseLocked(void *a1, const char *a2, ...)
{
  return _[a1 isDatabaseLocked];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidatedPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidatedPath:");
}

id objc_msgSend_languageChangeNotificationToken(void *a1, const char *a2, ...)
{
  return _[a1 languageChangeNotificationToken];
}

id objc_msgSend_lastImportError(void *a1, const char *a2, ...)
{
  return _[a1 lastImportError];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_libraryPath(void *a1, const char *a2, ...)
{
  return _[a1 libraryPath];
}

id objc_msgSend_libraryPathForContainerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryPathForContainerPath:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logDatabasePrivacyAccess(void *a1, const char *a2, ...)
{
  return _[a1 logDatabasePrivacyAccess];
}

id objc_msgSend_logDatabasePrivacyAccessWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDatabasePrivacyAccessWithAuditToken:");
}

id objc_msgSend_longDescription(void *a1, const char *a2, ...)
{
  return _[a1 longDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mediaFolderPath(void *a1, const char *a2, ...)
{
  return _[a1 mediaFolderPath];
}

id objc_msgSend_mediaFolderPathByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaFolderPathByAppendingPathComponent:");
}

id objc_msgSend_minimumPurgeableStorage(void *a1, const char *a2, ...)
{
  return _[a1 minimumPurgeableStorage];
}

id objc_msgSend_ml_errorWithCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ml_errorWithCode:description:");
}

id objc_msgSend_ml_setValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ml_setValid:");
}

id objc_msgSend_msv_errorWithDomain_code_debugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msv_errorWithDomain:code:debugDescription:");
}

id objc_msgSend_msv_errorWithDomain_code_underlyingErrors_debugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msv_errorWithDomain:code:underlyingErrors:debugDescription:");
}

id objc_msgSend_msv_stringByResolvingRealPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msv_stringByResolvingRealPath");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_notifyContentsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyContentsDidChange];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRanges];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return _[a1 operationCount];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_operationsCount(void *a1, const char *a2, ...)
{
  return _[a1 operationsCount];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_originalArtworkDirectory(void *a1, const char *a2, ...)
{
  return _[a1 originalArtworkDirectory];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResourceFileOrFolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResourceFileOrFolder:");
}

id objc_msgSend_performDatabaseOperation_onLibrary_withAttributes_options_fromClient_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDatabaseOperation:onLibrary:withAttributes:options:fromClient:completionHandler:");
}

id objc_msgSend_performDatabaseOperation_withAttributes_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDatabaseOperation:withAttributes:options:completionHandler:");
}

id objc_msgSend_performImport_fromSource_progressBlock_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performImport:fromSource:progressBlock:withCompletionHandler:");
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:onThread:withObject:waitUntilDone:");
}

id objc_msgSend_priorityLevel(void *a1, const char *a2, ...)
{
  return _[a1 priorityLevel];
}

id objc_msgSend_privacyContext(void *a1, const char *a2, ...)
{
  return _[a1 privacyContext];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return _[a1 processID];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_purgeableStorageSizeWithUrgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeableStorageSizeWithUrgency:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readerAvailableConnections(void *a1, const char *a2, ...)
{
  return _[a1 readerAvailableConnections];
}

id objc_msgSend_readerBusyConnections(void *a1, const char *a2, ...)
{
  return _[a1 readerBusyConnections];
}

id objc_msgSend_reconcilePurgeableArtworkForLibrary_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconcilePurgeableArtworkForLibrary:withCompletion:");
}

id objc_msgSend_reconnectToDatabase(void *a1, const char *a2, ...)
{
  return _[a1 reconnectToDatabase];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeTrack_persistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTrack:persistentID:");
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return _[a1 resources];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeSuspendedImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 resumeSuspendedImportOperations];
}

id objc_msgSend_resumeValidations(void *a1, const char *a2, ...)
{
  return _[a1 resumeValidations];
}

id objc_msgSend_rootArtworkCacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 rootArtworkCacheDirectory];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runValidation(void *a1, const char *a2, ...)
{
  return _[a1 runValidation];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_serviceInterface(void *a1, const char *a2, ...)
{
  return _[a1 serviceInterface];
}

id objc_msgSend_serviceTerminatedTransactionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceTerminatedTransactionWithIdentifier:error:");
}

id objc_msgSend_sessionDidUpdateProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidUpdateProgress:");
}

id objc_msgSend_sessionFailedToAddItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionFailedToAddItem:completion:");
}

id objc_msgSend_sessionFailedToUpdateItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionFailedToUpdateItem:completion:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActiveClients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveClients:");
}

id objc_msgSend_setActiveImportOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveImportOperations:");
}

id objc_msgSend_setActiveTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveTransactions:");
}

id objc_msgSend_setActiveXPCTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveXPCTransactions:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCurrentLockReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentLockReason:");
}

id objc_msgSend_setDatabaseFileDiagnostics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseFileDiagnostics:");
}

id objc_msgSend_setDatabaseLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseLocked:");
}

id objc_msgSend_setDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabasePath:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnqueuedConcurrentOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnqueuedConcurrentOperations:");
}

id objc_msgSend_setEnqueuedLimitedQueueOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnqueuedLimitedQueueOperations:");
}

id objc_msgSend_setEnqueuedSerialOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnqueuedSerialOperations:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaults:");
}

id objc_msgSend_setFireDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFireDate:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastImportError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastImportError:");
}

id objc_msgSend_setLibraryConnectionDiagnostics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryConnectionDiagnostics:");
}

id objc_msgSend_setLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocked:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPrivacyContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyContext:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setSuspendedImportOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspendedImportOperations:");
}

id objc_msgSend_setTaskAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskAssertion:");
}

id objc_msgSend_setTerminable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTerminable:");
}

id objc_msgSend_setTruncateBeforeValidating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTruncateBeforeValidating:");
}

id objc_msgSend_setUseDistantWriterConnections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseDistantWriterConnections:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWriterSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWriterSuspended:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedProxy(void *a1, const char *a2, ...)
{
  return _[a1 sharedProxy];
}

id objc_msgSend_sharedResourceManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedResourceManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_shouldOptimizeStorage(void *a1, const char *a2, ...)
{
  return _[a1 shouldOptimizeStorage];
}

id objc_msgSend_shouldValidateDatabaseForLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldValidateDatabaseForLibrary:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_suspendImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 suspendImportOperations];
}

id objc_msgSend_suspendValidations(void *a1, const char *a2, ...)
{
  return _[a1 suspendValidations];
}

id objc_msgSend_suspendedOperationsCount(void *a1, const char *a2, ...)
{
  return _[a1 suspendedOperationsCount];
}

id objc_msgSend_suspendedValidations(void *a1, const char *a2, ...)
{
  return _[a1 suspendedValidations];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_totalSizeForAllNonRedownloadableTracks(void *a1, const char *a2, ...)
{
  return _[a1 totalSizeForAllNonRedownloadableTracks];
}

id objc_msgSend_totalSizeForAllRedownloadableNonCacheTracks(void *a1, const char *a2, ...)
{
  return _[a1 totalSizeForAllRedownloadableNonCacheTracks];
}

id objc_msgSend_totalSizeForArtwork(void *a1, const char *a2, ...)
{
  return _[a1 totalSizeForArtwork];
}

id objc_msgSend_transactionMap(void *a1, const char *a2, ...)
{
  return _[a1 transactionMap];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateBestArtworkTokenForEntityPersistentID_entityType_artworkType_retrievalTime_preserveExistingAvailableToken_usingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:");
}

id objc_msgSend_updateSiriIndexMetadataForAllLibrariesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSiriIndexMetadataForAllLibrariesWithCompletion:");
}

id objc_msgSend_updateSpotlightIndexForBundleID_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSpotlightIndexForBundleID:withCompletion:");
}

id objc_msgSend_updateTrack_persistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrack:persistentID:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateDatabaseAtPath_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDatabaseAtPath:withCompletionHandler:");
}

id objc_msgSend_validateMusicLibrary_shouldTruncateDatabase_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateMusicLibrary:shouldTruncateDatabase:completion:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_writeToFile_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:error:");
}

id objc_msgSend_writerAvailableConnections(void *a1, const char *a2, ...)
{
  return _[a1 writerAvailableConnections];
}

id objc_msgSend_writerBusyConnections(void *a1, const char *a2, ...)
{
  return _[a1 writerBusyConnections];
}

id objc_msgSend_writerErrorWithCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writerErrorWithCode:description:");
}