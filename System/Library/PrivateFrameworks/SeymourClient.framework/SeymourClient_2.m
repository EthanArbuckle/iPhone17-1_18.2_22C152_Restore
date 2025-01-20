uint64_t dispatch thunk of AssetClientProtocol.queryAllAssetBundles()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of AssetClientProtocol.insertDemoAssetBundle(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 176))();
}

uint64_t dispatch thunk of AssetClientProtocol.filterAssetBundlesOnCurrentDevice(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of AssetClientProtocol.queryStandardImageBestMatches(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of AssetClientProtocol.evaluateStandardImageURLs(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 200))();
}

uint64_t dispatch thunk of AssetClientProtocol.evaluateStandardImageMatches(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of AssetClientProtocol.queryPreferredStreamingURL(workout:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t dispatch thunk of AssetClientProtocol.queryLocalURL(remoteURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 224))();
}

uint64_t dispatch thunk of AssetClientProtocol.fetchLocalURL(type:remoteURL:priority:expirationPolicy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a7 + 232))(a1, a2, a3, a4, a5 & 1);
}

uint64_t dispatch thunk of AssetClientProtocol.fetchImageData(remoteURL:priority:expirationPolicy:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a6 + 240))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of AssetClientProtocol.fetchImageData(remoteURL:priority:pixelWidth:pixelHeight:cropCode:fileType:expirationPolicy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a13 + 248))(a1, a2);
}

void *AssetClient.__allocating_init(eventHub:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  id v7 = a3;
  v8 = (void *)sub_1D5AB4DE0();
  id v9 = objc_msgSend(v6, sel_initWithMachServiceName_options_, v8, 0);

  type metadata accessor for XPCClient();
  swift_allocObject();
  uint64_t v10 = sub_1D59968E8(v9, v7);
  uint64_t v11 = *(void *)(v10 + 32);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  if (*(unsigned char *)(v10 + 48) == 1)
  {
    *(unsigned char *)(v10 + 48) = 2;
    objc_msgSend(*(id *)(v10 + 24), sel_resume);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
  type metadata accessor for AssetClient();
  v12 = (void *)swift_allocObject();
  uint64_t v13 = swift_retain();
  v14 = sub_1D5A9A004(v13, a1, a2, v12);

  swift_release_n();
  return v14;
}

uint64_t AssetClient.__allocating_init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5A95554(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5A9A320);
}

uint64_t type metadata accessor for AssetClient()
{
  return self;
}

uint64_t AssetClient.init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5A95554(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5A9A198);
}

uint64_t sub_1D5A95554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = a6(a1, a4, a5, v6, ObjectType, a2, a3);
  swift_unknownObjectRelease();
  return v14;
}

uint64_t sub_1D5A955D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t a5, uint64_t (*a6)(void))
{
  uint64_t v10 = a3(0);
  MEMORY[0x1F4188790](v10);
  v12 = (char *)&v17 - v11;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v14 = *(void *)(result + 48);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v16 = a4(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v12, a1, v16);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(v12, v10, a5, ObjectType, v14);
    sub_1D5A9B3B4((uint64_t)v12, a6);
    return swift_release();
  }
  return result;
}

uint64_t AssetClient.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t AssetClient.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t AssetClient.deleteAllAssets()()
{
  return sub_1D5A962FC(0xD000000000000011, (void *)0x80000001D5ACBA80, 13);
}

uint64_t AssetClient.requestAssetBundleOnCurrentDevice(workoutIdentifier:)(uint64_t a1, unint64_t a2)
{
  return sub_1D5A95C84(a1, a2, "requestAssetBundleOnCurrentDevice - workout identifier: %{public}s", 34);
}

uint64_t AssetClient.requestAssetBundleOnActivePairedDevice(workoutIdentifier:)(uint64_t a1, unint64_t a2)
{
  return sub_1D5A95C84(a1, a2, "requestAssetBundleOnActivePairedDevice - workout identifier: %{public}s", 35);
}

uint64_t AssetClient.insertDemoAssetBundle(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1D5AB3680();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1D5AB4B50();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBDE3878);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t v11 = sub_1D5AB4B30();
  os_log_type_t v12 = sub_1D5AB5430();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v23 = v2;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = a1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v27 = v15;
    uint64_t v24 = a2;
    *(_DWORD *)uint64_t v14 = 136446210;
    sub_1D5A9AC6C(&qword_1EA728158, MEMORY[0x1E4F9DAE0]);
    uint64_t v16 = sub_1D5AB5AB0();
    uint64_t v26 = sub_1D5951500(v16, v17, &v27);
    uint64_t v3 = v23;
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_1D5947000, v11, v12, "insertDemoAssetBundle request: %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v15, -1, -1);
    v18 = v14;
    a1 = v25;
    MEMORY[0x1D945AAC0](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  uint64_t v19 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  LOWORD(v27) = 39;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v19 + 16))(&v27, a1, v6, MEMORY[0x1E4F9DAD0], MEMORY[0x1E4F9DAD8], ObjectType, v19);
}

uint64_t AssetClient.renewKeys()()
{
  return sub_1D5A95AF4("renewKeys", 36);
}

uint64_t AssetClient.validateAssets()()
{
  return sub_1D5A95AF4("validateAssets", 37);
}

uint64_t sub_1D5A95AF4(const char *a1, __int16 a2)
{
  uint64_t v5 = v2;
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1D5AB4B50();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBDE3878);
  uint64_t v7 = sub_1D5AB4B30();
  os_log_type_t v8 = sub_1D5AB5430();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1D5947000, v7, v8, a1, v9, 2u);
    MEMORY[0x1D945AAC0](v9, -1, -1);
  }

  uint64_t v10 = *(void *)(v5 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v13 = a2;
  return (*(uint64_t (**)(__int16 *, uint64_t, uint64_t))(v10 + 8))(&v13, ObjectType, v10);
}

uint64_t AssetClient.pauseAssetBundleOnCurrentDevice(workoutIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1D5A95EC8(a1, a2, 0xD000000000000033, (void *)0x80000001D5ACBAA0, 19);
}

uint64_t AssetClient.pauseAssetBundleOnActivePairedDevice(workoutIdentifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1D5A95EC8(a1, a2, 0xD000000000000038, (void *)0x80000001D5ACBAE0, 20);
}

uint64_t AssetClient.cancelAssetBundleOnCurrentDevice(workoutIdentifier:)(uint64_t a1, unint64_t a2)
{
  return sub_1D5A95C84(a1, a2, "cancelAssetBundleOnCurrentDevice - workoutIdentifier: %{public}s", 10);
}

uint64_t AssetClient.cancelAssetBundleOnActivePairedDevice(workoutIdentifier:)(uint64_t a1, unint64_t a2)
{
  return sub_1D5A95C84(a1, a2, "cancelAssetBundleOnActivePairedDevice - workoutIdentifier: %{public}s", 11);
}

uint64_t sub_1D5A95C84(uint64_t a1, unint64_t a2, char *a3, __int16 a4)
{
  uint64_t v7 = v4;
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1D5AB4B50();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBDE3878);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1D5AB4B30();
  os_log_type_t v12 = sub_1D5AB5430();
  if (os_log_type_enabled(v11, v12))
  {
    format = a3;
    __int16 v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v20[0] = v14;
    *(_DWORD *)__int16 v13 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1D5951500(a1, a2, v20);
    sub_1D5AB5680();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D5947000, v11, v12, format, v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v14, -1, -1);
    MEMORY[0x1D945AAC0](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v15 = *(void *)(v7 + 24);
  uint64_t ObjectType = swift_getObjectType();
  LOWORD(v19) = a4;
  v20[0] = a1;
  v20[1] = a2;
  return (*(uint64_t (**)(uint64_t *, uint64_t *, void, void, void, uint64_t, uint64_t))(v15 + 16))(&v19, v20, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], ObjectType, v15);
}

uint64_t AssetClient.cancelAssetRequest(identifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1D5A95EC8(a1, a2, 0xD00000000000001FLL, (void *)0x80000001D5ACBB20, 12);
}

uint64_t sub_1D5A95EC8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, __int16 a5)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1D5AB4B50();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EBDE3878);
  v12._object = (void *)0x80000001D5ACBA10;
  v12._countAndFlagsBits = 0xD000000000000063;
  v13._countAndFlagsBits = a3;
  v13._object = a4;
  Logger.trace(file:function:)(v12, v13);
  uint64_t v14 = *(void *)(v5 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v18 = a5;
  v17[0] = a1;
  v17[1] = a2;
  return (*(uint64_t (**)(__int16 *, void *, void, void, void, uint64_t, uint64_t))(v14 + 16))(&v18, v17, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], ObjectType, v14);
}

uint64_t AssetClient.failAssetEntry(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1D5AB1BB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1D5AB4B50();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBDE3878);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t v11 = sub_1D5AB4B30();
  os_log_type_t v12 = sub_1D5AB5430();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = a2;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v15;
    *(_DWORD *)uint64_t v14 = 141558274;
    uint64_t v26 = 1752392040;
    uint64_t v27 = v15;
    uint64_t v25 = a1;
    sub_1D5AB5680();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v16 = sub_1D5AB1B70();
    uint64_t v26 = sub_1D5951500(v16, v17, &v27);
    a1 = v25;
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_1D5947000, v11, v12, "Client - failAssetEntry for %{mask.hash}s", (uint8_t *)v14, 0x16u);
    uint64_t v18 = v23;
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v18, -1, -1);
    MEMORY[0x1D945AAC0](v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  uint64_t v19 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  LOWORD(v27) = 14;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v19 + 16))(&v27, a1, v6, MEMORY[0x1E4F9BDB0], MEMORY[0x1E4F9BDB8], ObjectType, v19);
}

uint64_t AssetClient.loadIncompleteAssetBundles()()
{
  return sub_1D5A962FC(0xD00000000000001CLL, (void *)0x80000001D5ACBB40, 18);
}

uint64_t AssetClient.prefetchAssetBundles()()
{
  return sub_1D5A962FC(0xD000000000000016, (void *)0x80000001D5ACBB60, 21);
}

uint64_t sub_1D5A962FC(uint64_t a1, void *a2, __int16 a3)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D5AB4B50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE3878);
  v8._object = (void *)0x80000001D5ACBA10;
  v8._countAndFlagsBits = 0xD000000000000063;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Logger.trace(file:function:)(v8, v9);
  uint64_t v10 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v13 = a3;
  return (*(uint64_t (**)(__int16 *, uint64_t, uint64_t))(v10 + 8))(&v13, ObjectType, v10);
}

uint64_t AssetClient.queryCompletedAssetBundlesOnCurrentDevice()()
{
  return sub_1D5A96528(0xD00000000000002BLL, (void *)0x80000001D5ACBB80, 27);
}

uint64_t AssetClient.queryCompletedAssetBundleCountOnCurrentDevice()()
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE3878);
  v2._countAndFlagsBits = 0xD000000000000063;
  v2._object = (void *)0x80000001D5ACBA10;
  v3._object = (void *)0x80000001D5ACBBB0;
  v3._countAndFlagsBits = 0xD00000000000002FLL;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v7 = 40;
  return (*(uint64_t (**)(__int16 *, void, void, void, uint64_t, uint64_t))(v4 + 24))(&v7, MEMORY[0x1E4FBB550], MEMORY[0x1E4F9F120], MEMORY[0x1E4F9F128], ObjectType, v4);
}

uint64_t AssetClient.queryCompletedAssetBundlesOnActivePairedDevice()()
{
  return sub_1D5A96528(0xD000000000000030, (void *)0x80000001D5ACBBE0, 28);
}

uint64_t sub_1D5A96528(uint64_t a1, void *a2, __int16 a3)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D5AB4B50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE3878);
  v8._object = (void *)0x80000001D5ACBA10;
  v8._countAndFlagsBits = 0xD000000000000063;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Logger.trace(file:function:)(v8, v9);
  uint64_t v10 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v17 = a3;
  os_log_type_t v12 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v10 + 24);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3220);
  uint64_t v14 = sub_1D59A3114(&qword_1EBDE3228, &qword_1EBDE3220);
  unint64_t v15 = sub_1D5A9A3A0();
  return v12(&v17, v13, v14, v15, ObjectType, v10);
}

uint64_t AssetClient.queryAssetBundles(workoutIdentifiers:)(uint64_t a1)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3878);
  v4._countAndFlagsBits = 0xD000000000000063;
  v4._object = (void *)0x80000001D5ACBA10;
  v5._object = (void *)0x80000001D5ACBC20;
  v5._countAndFlagsBits = 0xD000000000000026;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v17 = 30;
  uint64_t v16 = a1;
  Swift::String v8 = *(uint64_t (**)(__int16 *, uint64_t *, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4898);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3220);
  uint64_t v11 = sub_1D59A3114(&qword_1EBDE48A0, &qword_1EBDE4898);
  unint64_t v12 = sub_1D5A9A444();
  uint64_t v13 = sub_1D59A3114(&qword_1EBDE3228, &qword_1EBDE3220);
  unint64_t v14 = sub_1D5A9A3A0();
  return v8(&v17, &v16, v9, v10, v11, v12, v13, v14, ObjectType, v6);
}

uint64_t AssetClient.queryAllAssetEntries()()
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE3878);
  v2._countAndFlagsBits = 0xD000000000000063;
  v2._object = (void *)0x80000001D5ACBA10;
  v3._object = (void *)0x80000001D5ACBC50;
  v3._countAndFlagsBits = 0xD000000000000016;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 23;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728160);
  uint64_t v8 = sub_1D59A3114(&qword_1EA728168, &qword_1EA728160);
  unint64_t v9 = sub_1D5A9A4B8();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t AssetClient.queryAllAssetRequests()()
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE3878);
  v2._countAndFlagsBits = 0xD000000000000063;
  v2._object = (void *)0x80000001D5ACBA10;
  v3._object = (void *)0x80000001D5ACBC70;
  v3._countAndFlagsBits = 0xD000000000000017;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 25;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728180);
  uint64_t v8 = sub_1D59A3114(&qword_1EA728188, &qword_1EA728180);
  unint64_t v9 = sub_1D5A9A55C();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t AssetClient.queryAllAssetResumableLoads()()
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE3878);
  v2._countAndFlagsBits = 0xD000000000000063;
  v2._object = (void *)0x80000001D5ACBA10;
  v3._object = (void *)0x80000001D5ACBC90;
  v3._countAndFlagsBits = 0xD00000000000001DLL;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 26;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7281A0);
  uint64_t v8 = sub_1D59A3114(&qword_1EA7281A8, &qword_1EA7281A0);
  unint64_t v9 = sub_1D5A9A600();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t AssetClient.queryAllAssetBundles()()
{
  return sub_1D5A96528(0xD000000000000016, (void *)0x80000001D5ACBCB0, 22);
}

uint64_t AssetClient.queryAllAssetLoadFailures()()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v8 = 24;
  Swift::String v3 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v1 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7281C0);
  uint64_t v5 = sub_1D59A3114(&qword_1EA7281C8, &qword_1EA7281C0);
  unint64_t v6 = sub_1D5A9A6A4();
  return v3(&v8, v4, v5, v6, ObjectType, v1);
}

uint64_t AssetClient.queryLocalURL(remoteURL:)(uint64_t a1)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3878);
  v4._countAndFlagsBits = 0xD000000000000063;
  v4._object = (void *)0x80000001D5ACBA10;
  v5._object = (void *)0x80000001D5ACBCD0;
  v5._countAndFlagsBits = 0xD000000000000019;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 29;
  __int16 v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB1BB0();
  return v8(&v11, a1, v9, v9, MEMORY[0x1E4F9BDB0], MEMORY[0x1E4F9BDB8], MEMORY[0x1E4F9BDB0], MEMORY[0x1E4F9BDB8], ObjectType, v6);
}

uint64_t AssetClient.queryPreferredStreamingURL(workout:)(uint64_t a1)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3878);
  v4._countAndFlagsBits = 0xD000000000000063;
  v4._object = (void *)0x80000001D5ACBA10;
  v5._object = (void *)0x80000001D5ACBCF0;
  v5._countAndFlagsBits = 0xD000000000000024;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v12 = 38;
  __int16 v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB2AC0();
  uint64_t v10 = sub_1D5AB1BB0();
  return v8(&v12, a1, v9, v10, MEMORY[0x1E4F9C748], MEMORY[0x1E4F9C750], MEMORY[0x1E4F9BDB0], MEMORY[0x1E4F9BDB8], ObjectType, v6);
}

uint64_t AssetClient.evaluateStandardImageURLs(for:)(uint64_t a1, uint64_t a2)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D5AB4B50();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBDE3878);
  v6._countAndFlagsBits = 0xD000000000000063;
  v6._object = (void *)0x80000001D5ACBA10;
  v7._object = (void *)0x80000001D5ACBD20;
  v7._countAndFlagsBits = 0xD00000000000001FLL;
  Logger.trace(file:function:)(v6, v7);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v16 = 32;
  v15[0] = a1;
  v15[1] = a2;
  uint64_t v10 = *(uint64_t (**)(__int16 *, void *, void, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v8 + 32);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7281E0);
  uint64_t v12 = sub_1D59A3114(&qword_1EA7281E8, &qword_1EA7281E0);
  unint64_t v13 = sub_1D5A9A748();
  return v10(&v16, v15, MEMORY[0x1E4FBB1A0], v11, MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], v12, v13, ObjectType, v8);
}

uint64_t AssetClient.evaluateStandardImageMatches(for:)(uint64_t a1)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3878);
  v4._countAndFlagsBits = 0xD000000000000063;
  v4._object = (void *)0x80000001D5ACBA10;
  v5._object = (void *)0x80000001D5ACBD40;
  v5._countAndFlagsBits = 0xD000000000000022;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 31;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB4300();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728200);
  uint64_t v11 = sub_1D597B6AC(&qword_1EA728208, &qword_1EA728200);
  unint64_t v12 = sub_1D5A9A7EC();
  return v8(&v14, a1, v9, v10, MEMORY[0x1E4F9E9A0], MEMORY[0x1E4F9E9A8], v11, v12, ObjectType, v6);
}

uint64_t AssetClient.filterAssetBundlesOnCurrentDevice(_:)(uint64_t a1)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3878);
  v4._countAndFlagsBits = 0xD000000000000063;
  v4._object = (void *)0x80000001D5ACBA10;
  v5._object = (void *)0x80000001D5ACBD70;
  v5._countAndFlagsBits = 0xD000000000000025;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 41;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB3050();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3220);
  uint64_t v11 = sub_1D59A3114(&qword_1EBDE3228, &qword_1EBDE3220);
  unint64_t v12 = sub_1D5A9A3A0();
  return v8(&v14, a1, v9, v10, MEMORY[0x1E4F9CF98], MEMORY[0x1E4F9CFA0], v11, v12, ObjectType, v6);
}

uint64_t AssetClient.queryStandardImageBestMatches(for:)(uint64_t a1)
{
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3878);
  v4._countAndFlagsBits = 0xD000000000000063;
  v4._object = (void *)0x80000001D5ACBA10;
  v5._object = (void *)0x80000001D5ACBDA0;
  v5._countAndFlagsBits = 0xD000000000000023;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 33;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB4410();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7281E0);
  uint64_t v11 = sub_1D59A3114(&qword_1EA7281E8, &qword_1EA7281E0);
  unint64_t v12 = sub_1D5A9A748();
  return v8(&v14, a1, v9, v10, MEMORY[0x1E4F9EAF8], MEMORY[0x1E4F9EB00], v11, v12, ObjectType, v6);
}

uint64_t AssetClient.fetchLocalURL(type:remoteURL:priority:expirationPolicy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  int v41 = a5;
  uint64_t v43 = a4;
  uint64_t v44 = a3;
  uint64_t v50 = a6;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2FF8);
  uint64_t v8 = *(void *)(v51 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v51);
  uint64_t v46 = v10;
  v47 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v42 = (char *)&v39 - v11;
  uint64_t v12 = sub_1D5AB1BB0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  unint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1D5AB2EE0();
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1D5AB2250();
  uint64_t v45 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1D5AB4B50();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EBDE3878);
  v22._countAndFlagsBits = 0xD000000000000063;
  v22._object = (void *)0x80000001D5ACBA10;
  v23._object = (void *)0x80000001D5ACBDD0;
  v23._countAndFlagsBits = 0xD000000000000038;
  Logger.trace(file:function:)(v22, v23);
  sub_1D5AB1C40();
  sub_1D5AB4E20();
  sub_1D5A9A890(a1, (uint64_t)v18);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v49 = v12;
  v24(v15, a2, v12);
  if ((v41 & 1) != 0 && !v43) {
    sub_1D5AB5320();
  }
  else {
    sub_1D5AB5310();
  }
  sub_1D5AB2240();
  uint64_t v25 = (uint64_t (*)(uint64_t))v48;
  uint64_t v26 = *(void *)(v48 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v52 = 15;
  v28 = *(void (**)(__int16 *, char *, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t))(v26 + 32);
  uint64_t v29 = sub_1D5AB24D0();
  v30 = v42;
  uint64_t v31 = v40;
  v28(&v52, v20, v40, v29, MEMORY[0x1E4F9C2D8], MEMORY[0x1E4F9C2E0], MEMORY[0x1E4F9C4D8], MEMORY[0x1E4F9C4E0], ObjectType, v26);
  v32 = v47;
  uint64_t v33 = v51;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v47, v30, v51);
  unint64_t v34 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v35 = (v46 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v36 + v34, v32, v33);
  v37 = (uint64_t (**)(uint64_t))(v36 + v35);
  *v37 = sub_1D5A9A8F4;
  v37[1] = v25;
  swift_retain();
  sub_1D5AB4540();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v30, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v20, v31);
}

uint64_t sub_1D5A979B8(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB24D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_1D5AB1BB0();
  return sub_1D5AB4550();
}

uint64_t AssetClient.fetchImageData(remoteURL:priority:expirationPolicy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v39 = a5;
  int v31 = a4;
  uint64_t v32 = a3;
  uint64_t v33 = a2;
  uint64_t v30 = a1;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2FF8);
  uint64_t v5 = *(void *)(v40 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v40);
  uint64_t v35 = v7;
  uint64_t v36 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v37 = (char *)&v30 - v8;
  uint64_t v9 = sub_1D5AB1BB0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1D5AB2EE0();
  MEMORY[0x1F4188790](v13);
  uint64_t v14 = sub_1D5AB2250();
  uint64_t v34 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5AB1C40();
  sub_1D5AB4E20();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v30, v9);
  if ((v31 & 1) != 0 && !v32) {
    sub_1D5AB5320();
  }
  else {
    sub_1D5AB5310();
  }
  sub_1D5AB2240();
  uint64_t v17 = (uint64_t (*)(uint64_t))v38;
  uint64_t v18 = *(void *)(v38 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v41 = 15;
  v20 = *(void (**)(__int16 *, char *, uint64_t, uint64_t, void, void, void, void, uint64_t, uint64_t))(v18 + 32);
  uint64_t v21 = sub_1D5AB24D0();
  Swift::String v22 = v37;
  v20(&v41, v16, v14, v21, MEMORY[0x1E4F9C2D8], MEMORY[0x1E4F9C2E0], MEMORY[0x1E4F9C4D8], MEMORY[0x1E4F9C4E0], ObjectType, v18);
  Swift::String v23 = v36;
  uint64_t v24 = v40;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v36, v22, v40);
  unint64_t v25 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v26 = (v35 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v27 + v25, v23, v24);
  v28 = (uint64_t (**)(uint64_t))(v27 + v26);
  *v28 = sub_1D5A9A928;
  v28[1] = v17;
  swift_retain();
  sub_1D5AB4540();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v22, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v16, v14);
}

uint64_t sub_1D5A97F40(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB24D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  return sub_1D5AB4550();
}

uint64_t AssetClient.fetchImageData(remoteURL:priority:pixelWidth:pixelHeight:cropCode:fileType:expirationPolicy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void (*a8)(char *, char *, uint64_t)@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v66 = a6;
  v61 = a8;
  uint64_t v57 = a3;
  uint64_t v64 = a9;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2FF0);
  uint64_t v60 = *(void *)(v56 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v56);
  v58 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v67 = (uint64_t)&v49 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4740);
  MEMORY[0x1F4188790](v20 - 8);
  Swift::String v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1D5AB1BB0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 64);
  uint64_t v26 = MEMORY[0x1F4188790](v23);
  uint64_t v51 = (char *)&v49 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  v62 = (char *)&v49 - v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v52 = a1;
  uint64_t v63 = a2;
  int v53 = a4;
  int v55 = a5;
  uint64_t v59 = a7;
  URL.init(templateURLString:pixelWidth:pixelHeight:cropCode:fileType:)(a1, a2, a4, a5, v66, a7, (uint64_t)v61, a10, (uint64_t)v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_1D59C8ABC((uint64_t)v22);
    uint64_t v28 = sub_1D5AB1DC0();
    sub_1D5A9AC6C(&qword_1EA728218, MEMORY[0x1E4F9BFA0]);
    uint64_t v29 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v28 - 8) + 104))(v30, *MEMORY[0x1E4F9BF18], v28);
    *(void *)(swift_allocObject() + 16) = v29;
    return sub_1D5AB4550();
  }
  else
  {
    uint64_t v50 = a11;
    int v32 = a12 & 1;
    v61 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    uint64_t v33 = (uint64_t)v62;
    v61(v62, v22, v23);
    uint64_t v34 = v33;
    uint64_t v35 = v57;
    uint64_t v36 = v65;
    AssetClient.fetchImageData(remoteURL:priority:expirationPolicy:)(v33, v57, a11, v32, v67);
    v37 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v51, v34, v23);
    unint64_t v38 = (*(unsigned __int8 *)(v24 + 80) + 81) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    uint64_t v39 = swift_allocObject();
    uint64_t v40 = v63;
    *(void *)(v39 + 16) = v52;
    *(void *)(v39 + 24) = v40;
    LODWORD(v40) = v55;
    *(_DWORD *)(v39 + 32) = v53;
    *(_DWORD *)(v39 + 36) = v40;
    uint64_t v41 = v59;
    *(void *)(v39 + 40) = v66;
    *(void *)(v39 + 48) = v41;
    *(void *)(v39 + 56) = v36;
    *(void *)(v39 + 64) = v35;
    *(void *)(v39 + 72) = v50;
    *(unsigned char *)(v39 + 80) = v32;
    v61((char *)(v39 + v38), v37, v23);
    uint64_t v42 = v60;
    uint64_t v43 = v58;
    uint64_t v44 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v58, v67, v56);
    unint64_t v45 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    unint64_t v46 = (v54 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v47 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v47 + v45, v43, v44);
    uint64_t v48 = (uint64_t (**)@<X0>(void *@<X0>, uint64_t@<X8>))(v47 + v46);
    *uint64_t v48 = sub_1D5A9AAFC;
    v48[1] = (uint64_t (*)@<X0>(void *@<X0>, uint64_t@<X8>))v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1D5AB4540();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v67, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v62, v23);
  }
}

uint64_t sub_1D5A985D8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13)
{
  uint64_t v81 = a6;
  uint64_t v82 = a7;
  int v80 = a5;
  int v79 = a4;
  uint64_t v78 = a3;
  uint64_t v77 = a2;
  uint64_t v89 = a9;
  uint64_t v88 = sub_1D5AB1BB0();
  uint64_t v86 = *(void *)(v88 - 8);
  MEMORY[0x1F4188790](v88);
  uint64_t v83 = v15;
  v84 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA725708);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  v87 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v68 - v20;
  uint64_t v22 = sub_1D5AB4410();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  v91 = (char *)&v68 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getErrorValue();
  uint64_t v25 = sub_1D5AB5B90();
  uint64_t v27 = v26;
  if (v25 == sub_1D5AB4DF0() && v27 == v28)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v30 = sub_1D5AB5AF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      *(void *)(swift_allocObject() + 16) = a1;
      id v31 = a1;
      return sub_1D5AB4550();
    }
  }
  uint64_t v73 = v23;
  uint64_t v76 = a8;
  uint64_t v70 = a13;
  if (qword_1EBDE3898 != -1) {
    swift_once();
  }
  uint64_t v74 = v17;
  uint64_t v90 = v22;
  uint64_t v75 = v16;
  int v72 = a12;
  uint64_t v71 = a11;
  uint64_t v69 = a10;
  uint64_t v33 = sub_1D5AB4B50();
  __swift_project_value_buffer(v33, (uint64_t)qword_1EBDE3878);
  id v34 = a1;
  id v35 = a1;
  uint64_t v36 = sub_1D5AB4B30();
  os_log_type_t v37 = sub_1D5AB5410();
  BOOL v38 = os_log_type_enabled(v36, v37);
  v68 = a1;
  if (v38)
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v95 = v40;
    *(_DWORD *)uint64_t v39 = 136446210;
    swift_getErrorValue();
    uint64_t v41 = MEMORY[0x1D9459FA0](v93, v94);
    uint64_t v92 = sub_1D5951500(v41, v42, &v95);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D5947000, v36, v37, "Fallback - querying completed closest match due to error: %{public}s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v40, -1, -1);
    MEMORY[0x1D945AAC0](v39, -1, -1);
  }
  else
  {
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v43 = v91;
  sub_1D5AB4400();
  v44._countAndFlagsBits = 0xD000000000000063;
  v44._object = (void *)0x80000001D5ACBA10;
  v45._object = (void *)0x80000001D5ACBDA0;
  v45._countAndFlagsBits = 0xD000000000000023;
  Logger.trace(file:function:)(v44, v45);
  uint64_t v46 = v76;
  uint64_t v47 = *(void *)(v76 + 24);
  uint64_t ObjectType = swift_getObjectType();
  LOWORD(v95) = 33;
  uint64_t v49 = *(void (**)(uint64_t *, char *, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v47 + 32);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7281E0);
  uint64_t v51 = sub_1D59A3114(&qword_1EA7281E8, &qword_1EA7281E0);
  unint64_t v52 = sub_1D5A9A748();
  v49(&v95, v43, v90, v50, MEMORY[0x1E4F9EAF8], MEMORY[0x1E4F9EB00], v51, v52, ObjectType, v47);
  uint64_t v53 = v86;
  uint64_t v54 = v84;
  uint64_t v55 = v88;
  (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v84, v70, v88);
  unint64_t v56 = (*(unsigned __int8 *)(v53 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  uint64_t v57 = swift_allocObject();
  v58 = v68;
  *(void *)(v57 + 16) = v68;
  *(void *)(v57 + 24) = v46;
  uint64_t v59 = v71;
  *(void *)(v57 + 32) = v69;
  *(void *)(v57 + 40) = v59;
  *(unsigned char *)(v57 + 48) = v72 & 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v53 + 32))(v57 + v56, v54, v55);
  uint64_t v60 = v74;
  v61 = v87;
  uint64_t v62 = v75;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v87, v21, v75);
  unint64_t v63 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  unint64_t v64 = (v85 + v63 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v65 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v60 + 32))(v65 + v63, v61, v62);
  uint64_t v66 = (uint64_t (**)@<X0>(uint64_t *@<X0>, uint64_t@<X8>))(v65 + v64);
  *uint64_t v66 = sub_1D5A9ADEC;
  v66[1] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t@<X8>))v57;
  id v67 = v58;
  swift_retain();
  sub_1D5AB4540();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v21, v62);
  return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v91, v90);
}

uint64_t sub_1D5A98D78@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v55 = a7;
  LODWORD(v51) = a6;
  uint64_t v52 = a4;
  uint64_t v53 = a5;
  uint64_t v59 = a8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2FF0);
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v56 = v12;
  uint64_t v57 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v60 = (uint64_t)&v49 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4740);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1D5AB1BB0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v49 - v23;
  MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v49 - v25;
  sub_1D5971288(*a1, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_1D59C8ABC((uint64_t)v16);
    if (qword_1EBDE3898 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1D5AB4B50();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EBDE3878);
    uint64_t v28 = sub_1D5AB4B30();
    os_log_type_t v29 = sub_1D5AB5410();
    if (os_log_type_enabled(v28, v29))
    {
      char v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v30 = 0;
      _os_log_impl(&dword_1D5947000, v28, v29, "Fallback - no close match found", v30, 2u);
      MEMORY[0x1D945AAC0](v30, -1, -1);
    }

    *(void *)(swift_allocObject() + 16) = a2;
    id v31 = a2;
    return sub_1D5AB4550();
  }
  else
  {
    int v33 = v51 & 1;
    uint64_t v51 = v10;
    uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v49(v26, v16, v17);
    uint64_t v50 = v26;
    AssetClient.fetchImageData(remoteURL:priority:expirationPolicy:)((uint64_t)v26, v52, v53, v33, v60);
    id v34 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    v34(v24, v55, v17);
    v34(v21, (uint64_t)v26, v17);
    uint64_t v35 = *(unsigned __int8 *)(v18 + 80);
    uint64_t v36 = (v35 + 16) & ~v35;
    uint64_t v37 = v58;
    uint64_t v38 = (v19 + v35 + v36) & ~v35;
    uint64_t v39 = swift_allocObject();
    uint64_t v40 = v39 + v36;
    uint64_t v41 = (void (*)(uint64_t, char *, uint64_t))v49;
    v49((char *)v40, v24, v17);
    v41(v39 + v38, v21, v17);
    unint64_t v42 = v57;
    uint64_t v43 = v60;
    uint64_t v44 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v57, v60, v51);
    unint64_t v45 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    unint64_t v46 = (v56 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v47 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v47 + v45, v42, v44);
    uint64_t v48 = (void (**)(uint64_t))(v47 + v46);
    *uint64_t v48 = sub_1D5A9AF68;
    v48[1] = (void (*)(uint64_t))v39;
    sub_1D5AB4540();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v43, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v50, v17);
  }
}

void sub_1D5A9929C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D5AB1BB0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v26 - v11;
  if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    if (qword_1EBDE3898 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1D5AB4B50();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EBDE3878);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v14(v12, a2, v6);
    v14(v10, a3, v6);
    uint64_t v15 = sub_1D5AB4B30();
    os_log_type_t v16 = sub_1D5AB5430();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v27 = v18;
      *(_DWORD *)uint64_t v17 = 141558786;
      uint64_t v28 = 1752392040;
      uint64_t v29 = v18;
      sub_1D5AB5680();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v19 = sub_1D5AB1B70();
      uint64_t v28 = sub_1D5951500(v19, v20, &v29);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
      v21(v12, v6);
      *(_WORD *)(v17 + 22) = 2160;
      uint64_t v28 = 1752392040;
      sub_1D5AB5680();
      *(_WORD *)(v17 + 32) = 2080;
      uint64_t v22 = sub_1D5AB1B70();
      uint64_t v28 = sub_1D5951500(v22, v23, &v29);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      v21(v10, v6);
      _os_log_impl(&dword_1D5947000, v15, v16, "Fallback - close match for %{mask.hash}s found: %{mask.hash}s", (uint8_t *)v17, 0x2Au);
      uint64_t v24 = v27;
      swift_arrayDestroy();
      MEMORY[0x1D945AAC0](v24, -1, -1);
      MEMORY[0x1D945AAC0](v17, -1, -1);
    }
    else
    {
      uint64_t v25 = *(void (**)(char *, uint64_t))(v7 + 8);
      v25(v12, v6);
      v25(v10, v6);
    }
  }
}

uint64_t sub_1D5A995EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_1D5AB1BB0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5AB24C0();
  uint64_t v7 = sub_1D5AB1BC0();
  if (v1) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *a1 = v10;
  a1[1] = v11;
  return result;
}

uint64_t AssetClient.fetchPersistableKeys(for:workoutIdentifier:userIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v23 = a3;
  uint64_t v24 = a2;
  uint64_t v21 = a1;
  uint64_t v20 = sub_1D5AB1BB0();
  uint64_t v4 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D5AB1CE0();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v22 = sub_1D5AB3840();
  uint64_t v25 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5AB4E20();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1D5AB4E20();
  sub_1D5AB1CD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v20);
  sub_1D5AB3830();
  uint64_t v10 = *(void *)(v26 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v28 = 16;
  uint64_t v12 = *(void (**)(__int16 *, char *, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v10 + 32);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728220);
  uint64_t v14 = sub_1D597B6AC(&qword_1EA728228, &qword_1EA728220);
  unint64_t v15 = sub_1D5A9ABC8();
  uint64_t v18 = ObjectType;
  uint64_t v16 = v22;
  v12(&v28, v9, v22, v13, MEMORY[0x1E4F9DD70], MEMORY[0x1E4F9DD78], v14, v15, v18, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v9, v16);
}

uint64_t sub_1D5A999CC()
{
  return AssetClient.deleteAllAssets()();
}

uint64_t sub_1D5A999F0(uint64_t a1, unint64_t a2)
{
  return AssetClient.requestAssetBundleOnCurrentDevice(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5A99A14(uint64_t a1, unint64_t a2)
{
  return AssetClient.requestAssetBundleOnActivePairedDevice(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5A99A38(uint64_t a1, uint64_t a2)
{
  return AssetClient.pauseAssetBundleOnCurrentDevice(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5A99A5C(uint64_t a1, uint64_t a2)
{
  return AssetClient.pauseAssetBundleOnActivePairedDevice(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5A99A80(uint64_t a1, uint64_t a2)
{
  return AssetClient.cancelAssetRequest(identifier:)(a1, a2);
}

uint64_t sub_1D5A99AA4(uint64_t a1, unint64_t a2)
{
  return AssetClient.cancelAssetBundleOnCurrentDevice(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5A99AC8(uint64_t a1, unint64_t a2)
{
  return AssetClient.cancelAssetBundleOnActivePairedDevice(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5A99AEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return AssetClient.failAssetEntry(for:)(a1, a2);
}

uint64_t sub_1D5A99B10()
{
  return AssetClient.loadIncompleteAssetBundles()();
}

uint64_t sub_1D5A99B34()
{
  return AssetClient.prefetchAssetBundles()();
}

uint64_t sub_1D5A99B58()
{
  return AssetClient.renewKeys()();
}

uint64_t sub_1D5A99B7C()
{
  return AssetClient.validateAssets()();
}

uint64_t sub_1D5A99BA0()
{
  return AssetClient.queryCompletedAssetBundlesOnCurrentDevice()();
}

uint64_t sub_1D5A99BC4()
{
  return AssetClient.queryCompletedAssetBundleCountOnCurrentDevice()();
}

uint64_t sub_1D5A99BE8()
{
  return AssetClient.queryCompletedAssetBundlesOnActivePairedDevice()();
}

uint64_t sub_1D5A99C0C(uint64_t a1)
{
  return AssetClient.queryAssetBundles(workoutIdentifiers:)(a1);
}

uint64_t sub_1D5A99C30()
{
  return AssetClient.queryAllAssetEntries()();
}

uint64_t sub_1D5A99C54()
{
  return AssetClient.queryAllAssetRequests()();
}

uint64_t sub_1D5A99C78()
{
  return AssetClient.queryAllAssetResumableLoads()();
}

uint64_t sub_1D5A99C9C()
{
  return AssetClient.queryAllAssetBundles()();
}

uint64_t sub_1D5A99CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return AssetClient.insertDemoAssetBundle(_:)(a1, a2);
}

uint64_t sub_1D5A99CE4(uint64_t a1)
{
  return AssetClient.filterAssetBundlesOnCurrentDevice(_:)(a1);
}

uint64_t sub_1D5A99D08(uint64_t a1)
{
  return AssetClient.queryStandardImageBestMatches(for:)(a1);
}

uint64_t sub_1D5A99D2C(uint64_t a1, uint64_t a2)
{
  return AssetClient.evaluateStandardImageURLs(for:)(a1, a2);
}

uint64_t sub_1D5A99D50(uint64_t a1)
{
  return AssetClient.evaluateStandardImageMatches(for:)(a1);
}

uint64_t sub_1D5A99D74(uint64_t a1)
{
  return AssetClient.queryPreferredStreamingURL(workout:)(a1);
}

uint64_t sub_1D5A99D98(uint64_t a1)
{
  return AssetClient.queryLocalURL(remoteURL:)(a1);
}

uint64_t sub_1D5A99DBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  return AssetClient.fetchLocalURL(type:remoteURL:priority:expirationPolicy:)(a1, a2, a3, a4, a5 & 1, a6);
}

uint64_t sub_1D5A99DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return AssetClient.fetchImageData(remoteURL:priority:expirationPolicy:)(a1, a2, a3, a4 & 1, a5);
}

uint64_t sub_1D5A99E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void (*a8)(char *, char *, uint64_t)@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  return AssetClient.fetchImageData(remoteURL:priority:pixelWidth:pixelHeight:cropCode:fileType:expirationPolicy:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12 & 1);
}

uint64_t sub_1D5A99E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EBDE4E10, (uint64_t)&unk_1F2DF5998, (uint64_t)sub_1D5A9B434);
}

uint64_t sub_1D5A99E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA725240, (uint64_t)&unk_1F2DF5970, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA725248, (uint64_t)&unk_1F2DF5948, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA725250, (uint64_t)&unk_1F2DF5920, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA7252E8, (uint64_t)&unk_1F2DF58F8, (uint64_t)sub_1D5A9B434);
}

uint64_t sub_1D5A99F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA7253B8, (uint64_t)&unk_1F2DF58D0, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA7253F0, (uint64_t)&unk_1F2DF58A8, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA7253F8, (uint64_t)&unk_1F2DF5880, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA7254D8, (uint64_t)&unk_1F2DF5858, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA725508, (uint64_t)&unk_1F2DF5830, (uint64_t)sub_1D5A9B418);
}

uint64_t sub_1D5A99FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5987020(a1, a2, a3, a4, a5, &qword_1EA7254F8, (uint64_t)&unk_1F2DF5808, (uint64_t)sub_1D5A9B418);
}

void *sub_1D5A9A004(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[2] = a1;
  a4[3] = &protocol witness table for XPCClient;
  a4[4] = &protocol witness table for XPCClient;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = a1;
  char v12 = 1;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = sub_1D5AB32E0();
  swift_retain();
  swift_unknownObjectRetain();
  TransportDispatching.register<A>(event:handler:)(&v12, (uint64_t)sub_1D5A9B2F4, v7, ObjectType, v8, (uint64_t)&protocol witness table for XPCClient, MEMORY[0x1E4F9D300], MEMORY[0x1E4F9D308]);
  swift_release();
  uint64_t v13 = a1;
  char v12 = 2;
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = sub_1D5AB1EA0();
  TransportDispatching.register<A>(event:handler:)(&v12, (uint64_t)sub_1D5A9B354, v9, ObjectType, v10, (uint64_t)&protocol witness table for XPCClient, MEMORY[0x1E4F9C0F8], MEMORY[0x1E4F9C100]);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5A9A198(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  a4[2] = a1;
  a4[3] = a6;
  a4[4] = a7;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v17 = a1;
  char v16 = 1;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = sub_1D5AB32E0();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  TransportDispatching.register<A>(event:handler:)(&v16, (uint64_t)sub_1D5A9B2F4, v11, ObjectType, v12, a7, MEMORY[0x1E4F9D300], MEMORY[0x1E4F9D308]);
  swift_release();
  uint64_t v17 = a1;
  char v16 = 2;
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = sub_1D5AB1EA0();
  TransportDispatching.register<A>(event:handler:)(&v16, (uint64_t)sub_1D5A9B354, v13, ObjectType, v14, a7, MEMORY[0x1E4F9C0F8], MEMORY[0x1E4F9C100]);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5A9A320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  type metadata accessor for AssetClient();
  uint64_t v13 = (void *)swift_allocObject();
  return sub_1D5A9A198(a1, a2, a3, v13, a5, a6, a7);
}

unint64_t sub_1D5A9A3A0()
{
  unint64_t result = qword_1EBDE3230;
  if (!qword_1EBDE3230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBDE3220);
    sub_1D5A9AC6C(&qword_1EBDE2F78, MEMORY[0x1E4F9C110]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDE3230);
  }
  return result;
}

unint64_t sub_1D5A9A444()
{
  unint64_t result = qword_1EBDE48A8[0];
  if (!qword_1EBDE48A8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBDE4898);
    sub_1D59A2F78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBDE48A8);
  }
  return result;
}

unint64_t sub_1D5A9A4B8()
{
  unint64_t result = qword_1EA728170;
  if (!qword_1EA728170)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728160);
    sub_1D5A9AC6C(&qword_1EA728178, MEMORY[0x1E4F9BEA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728170);
  }
  return result;
}

unint64_t sub_1D5A9A55C()
{
  unint64_t result = qword_1EA728190;
  if (!qword_1EA728190)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728180);
    sub_1D5A9AC6C(&qword_1EA728198, MEMORY[0x1E4F9C2F0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728190);
  }
  return result;
}

unint64_t sub_1D5A9A600()
{
  unint64_t result = qword_1EA7281B0;
  if (!qword_1EA7281B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA7281A0);
    sub_1D5A9AC6C(&qword_1EA7281B8, MEMORY[0x1E4F9D1F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7281B0);
  }
  return result;
}

unint64_t sub_1D5A9A6A4()
{
  unint64_t result = qword_1EA7281D0;
  if (!qword_1EA7281D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA7281C0);
    sub_1D5A9AC6C(&qword_1EA7281D8, MEMORY[0x1E4F9CBA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7281D0);
  }
  return result;
}

unint64_t sub_1D5A9A748()
{
  unint64_t result = qword_1EA7281F0;
  if (!qword_1EA7281F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA7281E0);
    sub_1D5A9AC6C(&qword_1EA7281F8, MEMORY[0x1E4F276F0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7281F0);
  }
  return result;
}

unint64_t sub_1D5A9A7EC()
{
  unint64_t result = qword_1EA728210;
  if (!qword_1EA728210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728200);
    sub_1D5A9AC6C(&qword_1EA7281F8, MEMORY[0x1E4F276F0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728210);
  }
  return result;
}

uint64_t sub_1D5A9A890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D5A9A8F4(uint64_t a1)
{
  return sub_1D5A979B8(a1);
}

uint64_t sub_1D5A9A8FC()
{
  return objectdestroy_7Tm(&qword_1EBDE2FF8);
}

uint64_t sub_1D5A9A908(uint64_t a1, uint64_t a2)
{
  return sub_1D5A9A95C(a1, a2, &qword_1EBDE2FF8, sub_1D5986FD0);
}

uint64_t sub_1D5A9A928(uint64_t a1)
{
  return sub_1D5A97F40(a1);
}

uint64_t sub_1D5A9A930()
{
  return objectdestroy_7Tm(&qword_1EBDE2FF8);
}

uint64_t sub_1D5A9A93C(uint64_t a1, uint64_t a2)
{
  return sub_1D5A9A95C(a1, a2, &qword_1EBDE2FF8, sub_1D5986FA8);
}

uint64_t sub_1D5A9A95C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v4 + v8;
  uint64_t v10 = (uint64_t *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  return a4(a1, a2, v9, v11, v12);
}

uint64_t sub_1D5A9AA20()
{
  uint64_t v1 = sub_1D5AB1BB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 81) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1D5A9AAFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1D5AB1BB0() - 8);
  return sub_1D5A985D8(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(_DWORD *)(v2 + 32), *(_DWORD *)(v2 + 36), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), a2, *(void *)(v2 + 64), *(void *)(v2 + 72), *(unsigned char *)(v2 + 80), v2 + ((*(unsigned __int8 *)(v5 + 80) + 81) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
}

uint64_t sub_1D5A9AB9C()
{
  return objectdestroy_7Tm(&qword_1EBDE2FF0);
}

uint64_t sub_1D5A9ABA8(uint64_t a1, uint64_t a2)
{
  return sub_1D5A9A95C(a1, a2, &qword_1EBDE2FF0, sub_1D5A2B748);
}

unint64_t sub_1D5A9ABC8()
{
  unint64_t result = qword_1EA728230;
  if (!qword_1EA728230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728220);
    sub_1D5A9AC6C(&qword_1EA728238, MEMORY[0x1E4F9C4F0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728230);
  }
  return result;
}

uint64_t sub_1D5A9AC6C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for AssetClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssetClient);
}

uint64_t dispatch thunk of AssetClient.__allocating_init(connection:eventHub:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1D5A9ACE0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D5A9AD18()
{
  uint64_t v1 = sub_1D5AB1BB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 49) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1D5A9ADEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1D5AB1BB0() - 8);
  uint64_t v6 = *(void **)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = *(void *)(v2 + 32);
  uint64_t v9 = *(void *)(v2 + 40);
  int v10 = *(unsigned __int8 *)(v2 + 48);
  uint64_t v11 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_1D5A98D78(a1, v6, v7, v8, v9, v10, v11, a2);
}

uint64_t sub_1D5A9AE78()
{
  return objectdestroy_7Tm(&qword_1EA725708);
}

uint64_t sub_1D5A9AE84(uint64_t a1, uint64_t a2)
{
  return sub_1D5A9A95C(a1, a2, &qword_1EA725708, sub_1D5986FF8);
}

uint64_t sub_1D5A9AEA4()
{
  uint64_t v1 = sub_1D5AB1BB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = v4 | 7;
  uint64_t v8 = (v6 + v4 + v5) & ~v4;
  uint64_t v9 = v8 + v6;
  v3(v0 + v5, v1);
  v3(v0 + v8, v1);
  return MEMORY[0x1F4186498](v0, v9, v7);
}

void sub_1D5A9AF68(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1D5AB1BB0() - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v1 + ((*(void *)(v3 + 64) + v4 + v5) & ~v4);
  sub_1D5A9929C(a1, v1 + v5, v6);
}

uint64_t sub_1D5A9B004()
{
  return objectdestroy_7Tm(&qword_1EBDE2FF0);
}

uint64_t sub_1D5A9B010(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2FF0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1D5987020(a1, a2, v2 + v6, *(void *)(v2 + v7), *(void *)(v2 + v7 + 8), &qword_1EBDE2FF0, (uint64_t)&unk_1F2DF5768, (uint64_t)sub_1D5A9B0E0);
}

uint64_t sub_1D5A9B0E0(long long *a1)
{
  uint64_t v2 = *(void (**)(long long *))(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(long long *))(v1 + 32);
  char v4 = *((unsigned char *)a1 + 16);
  long long v6 = *a1;
  char v7 = v4;
  v2(&v6);
  return v3(&v6);
}

uint64_t sub_1D5A9B148@<X0>(uint64_t *a1@<X8>)
{
  return sub_1D5A995EC(a1);
}

uint64_t objectdestroy_40Tm()
{
  uint64_t v1 = sub_1D5AB24D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1D5A9B248()
{
  return sub_1D5AB24C0();
}

uint64_t sub_1D5A9B2BC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D5A9B2F4(uint64_t a1)
{
  return sub_1D5A955D8(a1, v1, (uint64_t (*)(void))type metadata accessor for AssetBundleProgressUpdated, MEMORY[0x1E4F9D310], (uint64_t)&protocol witness table for AssetBundleProgressUpdated, (uint64_t (*)(void))type metadata accessor for AssetBundleProgressUpdated);
}

uint64_t sub_1D5A9B354(uint64_t a1)
{
  return sub_1D5A955D8(a1, v1, (uint64_t (*)(void))type metadata accessor for AssetBundleUpdated, MEMORY[0x1E4F9C110], (uint64_t)&protocol witness table for AssetBundleUpdated, (uint64_t (*)(void))type metadata accessor for AssetBundleUpdated);
}

uint64_t sub_1D5A9B3B4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D5A9B444(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 32);
  (*(void (**)(void))(v1 + 16))();
  return v3(a1);
}

uint64_t sub_1D5A9B494(uint64_t *a1)
{
  uint64_t v2 = *(void (**)(uint64_t *))(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v6 = *a1;
  char v7 = v4;
  v2(&v6);
  return v3(&v6);
}

uint64_t ActivityTracer.trace<A>(_:dso:telemetryEnabled:promise:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X3>, int a5@<W4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  int v22 = a5;
  uint64_t v21 = a4;
  uint64_t v14 = sub_1D5AB45D0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v20 - v17;
  a6(v16);
  ActivityTracer.trace<A>(_:dso:telemetryEnabled:promise:)(a1, a2, a3, v21, v22, (uint64_t)v18, a7, a8);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

Swift::Void __swiftcall ActivityTracing.endTrace()()
{
  (*(void (**)(void))(v0 + 8))(0);
}

uint64_t sub_1D5A9B654()
{
  return (*v0)();
}

uint64_t sub_1D5A9B67C()
{
  uint64_t v0 = sub_1D5AB4B50();
  __swift_allocate_value_buffer(v0, qword_1EBDE5DB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EBDE5DB8);
  return sub_1D5AB4B40();
}

uint64_t ActivityTracer.trace<A>(_:dso:telemetryEnabled:block:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 96) = a8;
  *(void *)(v9 + 104) = v8;
  *(void *)(v9 + 80) = a5;
  *(void *)(v9 + 88) = a7;
  *(unsigned char *)(v9 + 129) = a6;
  *(unsigned char *)(v9 + 128) = a4;
  *(void *)(v9 + 64) = a2;
  *(void *)(v9 + 72) = a3;
  *(void *)(v9 + 56) = a1;
  return MEMORY[0x1F4188298](sub_1D5A9B728, 0, 0);
}

uint64_t sub_1D5A9B728()
{
  uint64_t v1 = *(int **)(v0 + 88);
  ActivityTracer.beginTrace(_:dso:telemetryEnabled:)(*(char **)(v0 + 64), *(void *)(v0 + 72), *(unsigned __int8 *)(v0 + 128), *(void **)(v0 + 80), *(unsigned __int8 *)(v0 + 129), (void (**)(void *))(v0 + 16));
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1D5A9B81C;
  uint64_t v3 = *(void *)(v0 + 56);
  return v5(v3);
}

uint64_t sub_1D5A9B81C()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5A9B9D4;
  }
  else {
    uint64_t v2 = sub_1D5A9B930;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5A9B930()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  (*(void (**)(void, uint64_t, uint64_t))(v2 + 8))(0, v1, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1D5A9B9D4()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 8))(0, v2, v3);
  swift_willThrow();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(v1, v4, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t ActivityTracer.beginTrace(_:dso:telemetryEnabled:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X3>, int a5@<W4>, void (**a6)(void *a1)@<X8>)
{
  uint64_t v7 = v6;
  LODWORD(v62) = a5;
  char v9 = a3;
  int v71 = a3;
  uint64_t v70 = a1;
  id v67 = a6;
  uint64_t v12 = sub_1D5AB1CE0();
  uint64_t v65 = *(void *)(v12 - 8);
  uint64_t v66 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v63 = v14;
  unint64_t v64 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v69 = (char *)&v59 - v15;
  uint64_t v16 = sub_1D5AB4AD0();
  unint64_t v60 = *(void *)(v16 - 8);
  unint64_t v17 = v60;
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1D5AB4AA0();
  uint64_t v20 = *(void *)(v61 - 8);
  MEMORY[0x1F4188790](v61);
  int v22 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ActivityTrace();
  swift_allocObject();
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = sub_1D5A0DFE0(v23, a2, v9, a4);
  swift_retain();
  uint64_t v26 = v7;
  sub_1D5AB4AC0();
  sub_1D5AB4A80();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v27(v19, v26, v16);
  type metadata accessor for Signpost();
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v28 + OBJC_IVAR____TtC13SeymourClient8Signpost_identifier;
  *(void *)uint64_t v29 = v70;
  *(void *)(v29 + 8) = v24;
  uint64_t v68 = v24;
  *(unsigned char *)(v29 + 16) = v71;
  uint64_t v30 = v61;
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v28 + OBJC_IVAR____TtC13SeymourClient8Signpost_signpostID, v22, v61);
  *(unsigned char *)(v28 + OBJC_IVAR____TtC13SeymourClient8Signpost_telemetryEnabled) = v62;
  v27((char *)(v28 + OBJC_IVAR____TtC13SeymourClient8Signpost_poster), (uint64_t)v19, v16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE3DB0);
  uint64_t v31 = swift_allocObject();
  *(_DWORD *)(v31 + 24) = 0;
  *(void *)(v31 + 16) = 0;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v19, v16);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v30);
  *(void *)(v28 + OBJC_IVAR____TtC13SeymourClient8Signpost_state) = v31;
  uint64_t v73 = v25;
  uint64_t v32 = sub_1D5AB4E10();
  unint64_t v34 = v33;
  sub_1D5AB1CC0();
  uint64_t v62 = v25;
  uint64_t v35 = *(os_unfair_lock_s **)(v25 + 40);
  uint64_t v36 = (uint64_t)&v35[4];
  uint64_t v37 = v35 + 11;
  os_unfair_lock_lock(v35 + 11);
  sub_1D5A0E3F0(v36);
  os_unfair_lock_unlock(v37);
  os_unfair_lock_lock((os_unfair_lock_t)(v31 + 24));
  uint64_t v61 = v28;
  sub_1D5A9CFE8((uint64_t *)(v31 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v31 + 24));
  if (qword_1EBDE4100 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_1D5AB4B50();
  __swift_project_value_buffer(v38, (uint64_t)qword_1EBDE5DB8);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1D5AB4B30();
  os_log_type_t v40 = sub_1D5AB5430();
  BOOL v41 = os_log_type_enabled(v39, v40);
  unint64_t v60 = v34;
  if (v41)
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v73 = v43;
    *(_DWORD *)uint64_t v42 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_1D5951500(v32, v34, &v73);
    sub_1D5AB5680();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v42 + 12) = 2082;
    uint64_t v44 = v70;
    uint64_t v45 = sub_1D5AB5810();
    uint64_t v72 = sub_1D5951500(v45, v46, &v73);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5947000, v39, v40, "[%{public}s] %{public}s begin", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v43, -1, -1);
    MEMORY[0x1D945AAC0](v42, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v44 = v70;
  }
  uint64_t v47 = v32;
  uint64_t v49 = v64;
  uint64_t v48 = v65;
  uint64_t v50 = v69;
  uint64_t v51 = v66;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v64, v69, v66);
  unint64_t v52 = (*(unsigned __int8 *)(v48 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  unint64_t v53 = (v63 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v54 = swift_allocObject();
  unint64_t v55 = v60;
  *(void *)(v54 + 16) = v47;
  *(void *)(v54 + 24) = v55;
  uint64_t v56 = v68;
  *(void *)(v54 + 32) = v44;
  *(void *)(v54 + 40) = v56;
  *(unsigned char *)(v54 + 48) = v71;
  (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v54 + v52, v49, v51);
  *(void *)(v54 + v53) = v61;
  *(void *)(v54 + ((v53 + 15) & 0xFFFFFFFFFFFFFFF8)) = v62;
  uint64_t v57 = v67;
  v67[3] = (void (*)(void *))&type metadata for ActivityTracer.Trace;
  v57[4] = (void (*)(void *))&off_1F2DF5AA8;
  *uint64_t v57 = sub_1D5A9D0FC;
  v57[1] = (void (*)(void *))v54;
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v50, v51);
}

uint64_t ActivityTracer.trace<A>(_:dso:telemetryEnabled:block:)(char *a1, uint64_t a2, int a3, void *a4, int a5, void (*a6)(uint64_t))
{
  uint64_t v8 = ActivityTracer.beginTrace(_:dso:telemetryEnabled:)(a1, a2, a3, a4, a5, v14);
  a6(v8);
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  (*(void (**)(void, uint64_t, uint64_t))(v10 + 8))(0, v9, v10);
  if (v6)
  {
    swift_willThrow();
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 8))(v6, v11, v12);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
}

void sub_1D5A9C268(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v65 = a6;
  uint64_t v63 = a4;
  uint64_t v64 = a5;
  uint64_t v62 = a2;
  uint64_t v13 = a9;
  uint64_t v14 = sub_1D5AB1CE0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v66 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v60 - v19;
  MEMORY[0x1F4188790](v18);
  int v22 = (char *)&v60 - v21;
  if (a1)
  {
    id v23 = a1;
    if (qword_1EBDE4100 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1D5AB4B50();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EBDE5DB8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v20, a7, v14);
    swift_bridgeObjectRetain();
    id v25 = a1;
    swift_bridgeObjectRetain();
    id v26 = a1;
    uint64_t v27 = sub_1D5AB4B30();
    os_log_type_t v28 = sub_1D5AB5410();
    int v29 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v61 = a9;
      uint64_t v31 = v30;
      uint64_t v60 = swift_slowAlloc();
      v68[0] = v60;
      *(_DWORD *)uint64_t v31 = 136446978;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1D5951500(v62, a3, v68);
      uint64_t v62 = a8;
      sub_1D5AB5680();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v31 + 12) = 2082;
      uint64_t v32 = sub_1D5AB5810();
      uint64_t v67 = sub_1D5951500(v32, v33, v68);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 22) = 2048;
      unint64_t v34 = v66;
      sub_1D5AB1CC0();
      sub_1D5AB1C70();
      uint64_t v36 = v35;
      int v65 = v29;
      uint64_t v37 = *(void (**)(char *, uint64_t))(v15 + 8);
      v37(v34, v14);
      uint64_t v67 = v36;
      a8 = v62;
      sub_1D5AB5680();
      v37(v20, v14);
      *(_WORD *)(v31 + 32) = 2082;
      uint64_t v67 = (uint64_t)a1;
      id v38 = a1;
      __swift_instantiateConcreteTypeFromMangledName(qword_1EBDE5130);
      uint64_t v39 = sub_1D5AB4E10();
      uint64_t v67 = sub_1D5951500(v39, v40, v68);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D5947000, v27, (os_log_type_t)v65, "[%{public}s] %{public}s ended in %fs -> %{public}s", (uint8_t *)v31, 0x2Au);
      uint64_t v41 = v60;
      swift_arrayDestroy();
      MEMORY[0x1D945AAC0](v41, -1, -1);
      uint64_t v42 = v31;
      uint64_t v13 = v61;
      MEMORY[0x1D945AAC0](v42, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
    }
  }
  else
  {
    if (qword_1EBDE4100 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1D5AB4B50();
    __swift_project_value_buffer(v43, (uint64_t)qword_1EBDE5DB8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v22, a7, v14);
    swift_bridgeObjectRetain_n();
    uint64_t v44 = sub_1D5AB4B30();
    os_log_type_t v45 = sub_1D5AB5430();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      uint64_t v61 = a9;
      v68[0] = v60;
      *(_DWORD *)uint64_t v46 = 136446722;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1D5951500(v62, a3, v68);
      uint64_t v62 = a8;
      sub_1D5AB5680();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v46 + 12) = 2082;
      uint64_t v47 = sub_1D5AB5810();
      uint64_t v67 = sub_1D5951500(v47, v48, v68);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 22) = 2048;
      uint64_t v49 = v66;
      sub_1D5AB1CC0();
      sub_1D5AB1C70();
      uint64_t v51 = v50;
      unint64_t v52 = *(void (**)(char *, uint64_t))(v15 + 8);
      v52(v49, v14);
      uint64_t v67 = v51;
      a8 = v62;
      sub_1D5AB5680();
      v52(v22, v14);
      _os_log_impl(&dword_1D5947000, v44, v45, "[%{public}s] %{public}s ended in %fs", (uint8_t *)v46, 0x20u);
      uint64_t v53 = v60;
      swift_arrayDestroy();
      uint64_t v13 = v61;
      MEMORY[0x1D945AAC0](v53, -1, -1);
      MEMORY[0x1D945AAC0](v46, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
    }
  }
  uint64_t v54 = *(os_unfair_lock_s **)(a8 + OBJC_IVAR____TtC13SeymourClient8Signpost_state);
  unint64_t v55 = v54 + 4;
  uint64_t v56 = v54 + 6;
  os_unfair_lock_lock(v54 + 6);
  sub_1D596E0C4(v55);
  os_unfair_lock_unlock(v56);
  uint64_t v57 = *(os_unfair_lock_s **)(v13 + 40);
  uint64_t v58 = (uint64_t *)&v57[4];
  uint64_t v59 = v57 + 11;
  os_unfair_lock_lock(v57 + 11);
  sub_1D5A0E484(v58);
  os_unfair_lock_unlock(v59);
}

uint64_t ActivityTracer.trace<A>(_:dso:telemetryEnabled:promise:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v9 = v8;
  uint64_t v60 = a7;
  uint64_t v61 = a6;
  int v55 = a5;
  uint64_t v64 = a8;
  uint64_t v63 = sub_1D5AB45D0();
  uint64_t v65 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  uint64_t v72 = (char *)&v52 - v14;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4E10);
  uint64_t v62 = *(void *)(v73 - 8);
  MEMORY[0x1F4188790](v73);
  int v71 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1D5AB1CE0();
  uint64_t v58 = *(void *)(v16 - 8);
  uint64_t v59 = v16;
  uint64_t v57 = *(void *)(v58 + 64);
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v56 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v70 = (char *)&v52 - v19;
  uint64_t v20 = sub_1D5AB4AD0();
  uint64_t v52 = *(void *)(v20 - 8);
  uint64_t v21 = v52;
  MEMORY[0x1F4188790](v20);
  id v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1D5AB4AA0();
  uint64_t v66 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  id v25 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ActivityTrace();
  swift_allocObject();
  uint64_t v69 = a1;
  uint64_t v67 = a2;
  int v68 = a3;
  uint64_t v26 = sub_1D5A0DFE0(a1, a2, a3, a4);
  swift_retain();
  sub_1D5AB4AC0();
  sub_1D5AB4A80();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v28 = v20;
  v27(v23, v9, v20);
  type metadata accessor for Signpost();
  uint64_t v29 = swift_allocObject();
  uint64_t v30 = v29 + OBJC_IVAR____TtC13SeymourClient8Signpost_identifier;
  *(void *)uint64_t v30 = a1;
  *(void *)(v30 + 8) = a2;
  *(unsigned char *)(v30 + 16) = a3;
  uint64_t v31 = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v29 + OBJC_IVAR____TtC13SeymourClient8Signpost_signpostID, v25, v54);
  *(unsigned char *)(v29 + OBJC_IVAR____TtC13SeymourClient8Signpost_telemetryEnabled) = v55;
  uint64_t v32 = v28;
  v27((char *)(v29 + OBJC_IVAR____TtC13SeymourClient8Signpost_poster), (uint64_t)v23, v28);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE3DB0);
  uint64_t v33 = swift_allocObject();
  *(_DWORD *)(v33 + 24) = 0;
  *(void *)(v33 + 16) = 0;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v23, v32);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v25, v31);
  *(void *)(v29 + OBJC_IVAR____TtC13SeymourClient8Signpost_state) = v33;
  uint64_t v74 = v26;
  uint64_t v34 = sub_1D5AB4E10();
  uint64_t v66 = v34;
  uint64_t v36 = v35;
  uint64_t v37 = v70;
  sub_1D5AB1CC0();
  uint64_t v38 = swift_allocObject();
  uint64_t v53 = v26;
  *(void *)(v38 + 16) = v26;
  *(void *)(v38 + 24) = v29;
  *(void *)(v38 + 32) = v34;
  *(void *)(v38 + 40) = v36;
  uint64_t v39 = v67;
  *(void *)(v38 + 48) = v69;
  *(void *)(v38 + 56) = v39;
  *(unsigned char *)(v38 + 64) = v68;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1D5AB4540();
  uint64_t v40 = v60;
  sub_1D5AB4580();
  uint64_t v41 = v58;
  uint64_t v42 = v59;
  uint64_t v43 = v56;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v56, v37, v59);
  unint64_t v44 = (*(unsigned __int8 *)(v41 + 80) + 57) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  unint64_t v45 = (v57 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = v66;
  *(void *)(v46 + 16) = v40;
  *(void *)(v46 + 24) = v47;
  unint64_t v48 = v69;
  *(void *)(v46 + 32) = v36;
  *(void *)(v46 + 40) = v48;
  *(void *)(v46 + 48) = v67;
  *(unsigned char *)(v46 + 56) = v68;
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v46 + v44, v43, v42);
  *(void *)(v46 + v45) = v29;
  *(void *)(v46 + ((v45 + 15) & 0xFFFFFFFFFFFFFFF8)) = v53;
  swift_retain();
  swift_retain();
  uint64_t v49 = v63;
  uint64_t v50 = v72;
  sub_1D5AB4570();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v50, v49);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v71, v73);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v70, v42);
  return swift_release();
}

uint64_t sub_1D5A9CFE8(uint64_t *a1)
{
  return sub_1D5A06808(a1, v1);
}

uint64_t sub_1D5A9D004()
{
  uint64_t v1 = sub_1D5AB1CE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 49) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

void sub_1D5A9D0FC(void *a1)
{
  uint64_t v3 = *(void *)(sub_1D5AB1CE0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 49) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1D5A9C268(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned __int8 *)(v1 + 48), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_1D5A9D1B0(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10 = *(os_unfair_lock_s **)(a3 + 40);
  uint64_t v11 = (uint64_t)&v10[4];
  uint64_t v12 = v10 + 11;
  os_unfair_lock_lock(v10 + 11);
  sub_1D5A0E3F0(v11);
  os_unfair_lock_unlock(v12);
  uint64_t v13 = *(os_unfair_lock_s **)(a4 + OBJC_IVAR____TtC13SeymourClient8Signpost_state);
  uint64_t v14 = (uint64_t *)&v13[4];
  uint64_t v15 = v13 + 6;
  os_unfair_lock_lock(v13 + 6);
  sub_1D5A9CFE8(v14);
  os_unfair_lock_unlock(v15);
  if (qword_1EBDE4100 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1D5AB4B50();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EBDE5DB8);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_1D5AB4B30();
  os_log_type_t v18 = sub_1D5AB5430();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v27 = (void *)v20;
    *(_DWORD *)uint64_t v19 = 136446466;
    swift_bridgeObjectRetain();
    sub_1D5951500(a5, a6, (uint64_t *)&v27);
    sub_1D5AB5680();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2082;
    uint64_t v21 = sub_1D5AB5810();
    uint64_t v25 = sub_1D5951500(v21, v22, (uint64_t *)&v27);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5947000, v17, v18, "[%{public}s] %{public}s begin", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v20, -1, -1);
    MEMORY[0x1D945AAC0](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBDE5130);
  sub_1D5AB5CA0();
  id v23 = v27;
  char v24 = v28;
  uint64_t v25 = (uint64_t)v27;
  char v26 = v28;
  a1(&v25);
  sub_1D596EA00(v23, v24);
}

void sub_1D5A9D47C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v72 = a6;
  uint64_t v70 = a4;
  uint64_t v71 = a5;
  uint64_t v69 = a2;
  uint64_t v74 = a8;
  uint64_t v75 = a9;
  uint64_t v12 = sub_1D5AB1CE0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = &v65[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  uint64_t v73 = &v65[-v18];
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = &v65[-v19];
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EBDE5130);
  uint64_t v21 = sub_1D5AB5CB0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  char v24 = (void **)&v65[-v23];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v22 + 16))(&v65[-v23], a1, v21);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = *v24;
    if (qword_1EBDE4100 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1D5AB4B50();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EBDE5DB8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(v16, a7, v12);
    swift_bridgeObjectRetain();
    id v27 = v25;
    swift_bridgeObjectRetain();
    id v28 = v25;
    uint64_t v29 = sub_1D5AB4B30();
    os_log_type_t v30 = sub_1D5AB5410();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      os_log_t v67 = (os_log_t)swift_slowAlloc();
      v77[0] = (uint64_t)v67;
      *(_DWORD *)uint64_t v32 = 136446978;
      int v66 = v31;
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_1D5951500(v69, a3, v77);
      sub_1D5AB5680();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v32 + 12) = 2082;
      uint64_t v33 = sub_1D5AB5810();
      uint64_t v76 = sub_1D5951500(v33, v34, v77);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 22) = 2048;
      uint64_t v35 = v73;
      sub_1D5AB1CC0();
      sub_1D5AB1C70();
      uint64_t v37 = v36;
      uint64_t v38 = *(void (**)(unsigned char *, uint64_t))(v13 + 8);
      v38(v35, v12);
      uint64_t v76 = v37;
      sub_1D5AB5680();
      v38(v16, v12);
      *(_WORD *)(v32 + 32) = 2082;
      uint64_t v76 = (uint64_t)v25;
      id v39 = v25;
      uint64_t v40 = sub_1D5AB4E10();
      uint64_t v76 = sub_1D5951500(v40, v41, v77);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D5947000, v29, (os_log_type_t)v66, "[%{public}s] %{public}s ended in %fs -> %{public}s", (uint8_t *)v32, 0x2Au);
      os_log_t v42 = v67;
      swift_arrayDestroy();
      MEMORY[0x1D945AAC0](v42, -1, -1);
      MEMORY[0x1D945AAC0](v32, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v16, v12);
    }
  }
  else
  {
    if (qword_1EBDE4100 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1D5AB4B50();
    __swift_project_value_buffer(v43, (uint64_t)qword_1EBDE5DB8);
    uint64_t v44 = v12;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(v20, a7, v12);
    swift_bridgeObjectRetain_n();
    unint64_t v45 = sub_1D5AB4B30();
    os_log_type_t v46 = sub_1D5AB5430();
    int v47 = v46;
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v48 = swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      v77[0] = v68;
      *(_DWORD *)uint64_t v48 = 136446722;
      os_log_t v67 = v45;
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_1D5951500(v69, a3, v77);
      uint64_t v69 = v44;
      sub_1D5AB5680();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v48 + 12) = 2082;
      uint64_t v49 = sub_1D5AB5810();
      uint64_t v76 = sub_1D5951500(v49, v50, v77);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 22) = 2048;
      uint64_t v51 = v73;
      sub_1D5AB1CC0();
      sub_1D5AB1C70();
      uint64_t v53 = v52;
      int v72 = v47;
      uint64_t v54 = *(void (**)(unsigned char *, uint64_t))(v13 + 8);
      int v55 = v51;
      uint64_t v56 = v69;
      v54(v55, v69);
      uint64_t v76 = v53;
      sub_1D5AB5680();
      v54(v20, v56);
      os_log_t v57 = v67;
      _os_log_impl(&dword_1D5947000, v67, (os_log_type_t)v72, "[%{public}s] %{public}s ended in %fs", (uint8_t *)v48, 0x20u);
      uint64_t v58 = v68;
      swift_arrayDestroy();
      MEMORY[0x1D945AAC0](v58, -1, -1);
      MEMORY[0x1D945AAC0](v48, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v20, v12);
    }
    (*(void (**)(void **, uint64_t))(v22 + 8))(v24, v21);
  }
  uint64_t v59 = *(os_unfair_lock_s **)(v74 + OBJC_IVAR____TtC13SeymourClient8Signpost_state);
  uint64_t v60 = v59 + 4;
  uint64_t v61 = v59 + 6;
  os_unfair_lock_lock(v59 + 6);
  sub_1D596E0C4(v60);
  os_unfair_lock_unlock(v61);
  uint64_t v62 = *(os_unfair_lock_s **)(v75 + 40);
  uint64_t v63 = (uint64_t *)&v62[4];
  uint64_t v64 = v62 + 11;
  os_unfair_lock_lock(v62 + 11);
  sub_1D5A0E484(v63);
  os_unfair_lock_unlock(v64);
}

uint64_t sub_1D5A9DC40()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 65, 7);
}

uint64_t sub_1D5A9DC88()
{
  uint64_t v1 = sub_1D5AB1CE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 57) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

void sub_1D5A9DD80(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1D5AB1CE0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 57) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1D5A9D47C(a1, *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(unsigned __int8 *)(v1 + 56), v1 + v4, *(void *)(v1 + v5), *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t dispatch thunk of ActivityTracing.endTrace(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityTracer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for ActivityTracer(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB4AD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for ActivityTracer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ActivityTracer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ActivityTracer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ActivityTracer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityTracer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D5A9E0C8);
}

uint64_t sub_1D5A9E0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ActivityTracer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D5A9E148);
}

uint64_t sub_1D5A9E148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4AD0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ActivityTracer()
{
  uint64_t result = qword_1EBDE4D30;
  if (!qword_1EBDE4D30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D5A9E204()
{
  uint64_t result = sub_1D5AB4AD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ActivityTracer.Trace(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ActivityTracer.Trace()
{
  return swift_release();
}

void *assignWithCopy for ActivityTracer.Trace(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for ActivityTracer.Trace(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityTracer.Trace(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityTracer.Trace(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityTracer.Trace()
{
  return &type metadata for ActivityTracer.Trace;
}

SeymourClient::StorefrontLanguageUpdated __swiftcall StorefrontLanguageUpdated.init(languageCode:)(SeymourClient::StorefrontLanguageUpdated languageCode)
{
  *unint64_t v1 = languageCode;
  return languageCode;
}

uint64_t StorefrontLanguageUpdated.languageCode.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void static StorefrontLanguageUpdated.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

ValueMetadata *type metadata accessor for StorefrontLanguageUpdated()
{
  return &type metadata for StorefrontLanguageUpdated;
}

uint64_t RemoteDisplayConnection.applyingTimestampOffset(_:)()
{
  sub_1D5AB39E0();
  return sub_1D5AB39F0();
}

uint64_t sub_1D5A9E484()
{
  sub_1D5AB39E0();
  return sub_1D5AB39F0();
}

uint64_t FetchedGatedResource.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  FetchedGatedResource.init(logger:)(a1);
  return v2;
}

uint64_t FetchedGatedResource.init(logger:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1D5AB4B50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v1 + qword_1EBDE5D50, a1, v4);
  v11[0] = 0;
  v11[1] = 0;
  type metadata accessor for FetchedGatedResource.State();
  *(void *)(v1 + qword_1EBDE5D48) = sub_1D5984638();
  type metadata accessor for GatedResource();
  v8((uint64_t)v7, a1, v4);
  uint64_t v9 = GatedResource.__allocating_init(logger:)((uint64_t)v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v2 + qword_1EBDE5D40) = v9;
  return v2;
}

uint64_t FetchedGatedResource.deinit()
{
  FetchedGatedResource.deactivate()();
  uint64_t v1 = v0 + qword_1EBDE5D50;
  uint64_t v2 = sub_1D5AB4B50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

Swift::Void __swiftcall FetchedGatedResource.deactivate()()
{
  uint64_t v1 = *(void *)(v0 + qword_1EBDE5D48);
  type metadata accessor for FetchedGatedResource.State();
  sub_1D5982D50((void (*)(uint64_t))sub_1D5A9F4C8, v0, v1);
}

uint64_t FetchedGatedResource.__deallocating_deinit()
{
  FetchedGatedResource.deinit();
  return swift_deallocClassInstance();
}

void sub_1D5A9E808(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + qword_1EBDE5D48);
  v3[3] = a1;
  type metadata accessor for FetchedGatedResource.State();
  sub_1D5982D50((void (*)(uint64_t))sub_1D5A9F95C, (uint64_t)v3, v2);
}

uint64_t sub_1D5A9E894(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE4C10);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D5AB51C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  v9[6] = v2;
  swift_retain();
  swift_retain();
  sub_1D59F48C8((uint64_t)v7, (uint64_t)&unk_1EA728260, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1D5A9E9AC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a6;
  uint64_t v8 = *(void *)(*(void *)a6 + 80);
  v6[3] = v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EBDE5130);
  uint64_t v9 = sub_1D5AB5CB0();
  v6[4] = v9;
  v6[5] = *(void *)(v9 - 8);
  v6[6] = swift_task_alloc();
  v6[7] = *(void *)(v8 - 8);
  uint64_t v10 = swift_task_alloc();
  v6[8] = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v11 = (void *)swift_task_alloc();
  v6[9] = v11;
  *uint64_t v11 = v6;
  v11[1] = sub_1D5A9EB74;
  return v13(v10);
}

uint64_t sub_1D5A9EB74()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5A9ED84;
  }
  else {
    uint64_t v2 = sub_1D5A9EC88;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5A9EC88()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v6);
  swift_storeEnumTagMultiPayload();
  sub_1D5A9E808(v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1D5A9ED84()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v3 = v0[5];
  uint64_t v2 = (void *)v0[6];
  uint64_t v4 = v0[4];
  *uint64_t v2 = v1;
  swift_storeEnumTagMultiPayload();
  id v5 = v1;
  sub_1D5A9E808((uint64_t)v2);

  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void FetchedGatedResource.activate(fetching:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + qword_1EBDE5D48);
  v4[3] = a1;
  v4[4] = a2;
  type metadata accessor for FetchedGatedResource.State();
  sub_1D5982D50((void (*)(uint64_t))sub_1D5A9F4E4, (uint64_t)v4, v3);
}

uint64_t sub_1D5A9EEE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)result;
  if (*(void *)result)
  {
    if (*(void *)result != 2) {
      return result;
    }
    GatedResource.reset()();
  }
  v7._countAndFlagsBits = 0xD000000000000077;
  v7._object = (void *)0x80000001D5ACBE50;
  v8._object = (void *)0x80000001D5ACBED0;
  v8._countAndFlagsBits = 0xD000000000000013;
  Logger.trace(file:function:)(v7, v8);
  *uint64_t v6 = a3;
  v6[1] = a4;
  swift_retain();
  uint64_t result = GatedResource.queueCount.getter();
  if ((v9 & 1) == 0 && result >= 1)
  {
    swift_release();
    *(_OWORD *)uint64_t v6 = xmmword_1D5AC2790;
    return sub_1D5A9E894(a3, a4);
  }
  return result;
}

unint64_t sub_1D5A9EFE0(unint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EBDE5130);
  uint64_t v2 = sub_1D5AB5CB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (uint64_t *)((char *)&v11 - v4);
  unint64_t result = *a1;
  if (*a1 >= 2)
  {
    if (*a1 == 2) {
      return result;
    }
    sub_1D5A9F838(result);
  }
  v7._object = (void *)0x80000001D5ACBE50;
  v7._countAndFlagsBits = 0xD000000000000077;
  v8._countAndFlagsBits = 0x6176697463616564;
  v8._object = (void *)0xEC00000029286574;
  Logger.trace(file:function:)(v7, v8);
  *(_OWORD *)a1 = xmmword_1D5AC27A0;
  sub_1D5985730();
  uint64_t v9 = swift_allocError();
  *uint64_t v10 = 1;
  *id v5 = v9;
  swift_storeEnumTagMultiPayload();
  GatedResource.release(with:)();
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
}

void FetchedGatedResource.query()(uint64_t a1@<X8>)
{
}

uint64_t FetchedGatedResource.fetch()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return MEMORY[0x1F4188298](sub_1D5A9F20C, 0, 0);
}

uint64_t sub_1D5A9F20C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + qword_1EBDE5D48);
  type metadata accessor for FetchedGatedResource.State();
  sub_1D5982D50((void (*)(uint64_t))sub_1D5A9F504, v1, v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1D5A648A4;
  uint64_t v4 = v0[2];
  return GatedResource.fetch()(v4);
}

unint64_t *sub_1D5A9F308(unint64_t *result)
{
  unint64_t v1 = *result;
  if (*result >= 3)
  {
    uint64_t v2 = result[1];
    *(_OWORD *)unint64_t result = xmmword_1D5AC2790;
    sub_1D5A9E894(v1, v2);
    return (unint64_t *)sub_1D5A9F838(v1);
  }
  return result;
}

void sub_1D5A9F36C(uint64_t a1@<X8>)
{
}

uint64_t sub_1D5A9F390(uint64_t a1)
{
  uint64_t v4 = *v1;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_1D5984480;
  v5[4] = *v4;
  return MEMORY[0x1F4188298](sub_1D5A9F20C, 0, 0);
}

void sub_1D5A9F468(uint64_t a1, uint64_t a2)
{
}

void sub_1D5A9F48C()
{
}

uint64_t type metadata accessor for FetchedGatedResource.State()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_1D5A9F4C8(unint64_t *a1)
{
  return sub_1D5A9EFE0(a1);
}

uint64_t sub_1D5A9F4E4(uint64_t a1)
{
  return sub_1D5A9EEE4(a1, v1[2], v1[3], v1[4]);
}

unint64_t *sub_1D5A9F504(unint64_t *a1)
{
  return sub_1D5A9F308(a1);
}

uint64_t sub_1D5A9F520()
{
  uint64_t result = sub_1D5AB4B50();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for FetchedGatedResource()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for FetchedGatedResource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FetchedGatedResource);
}

uint64_t dispatch thunk of FetchedGatedResource.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void *sub_1D5A9F608(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1D5A9F624(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *sub_1D5A9F670(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_1D5A9F700(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t sub_1D5A9F76C(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D5A9F7C8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 2;
    }
  }
  return result;
}

void *sub_1D5A9F818(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *uint64_t result = v2;
  return result;
}

unint64_t sub_1D5A9F838(unint64_t result)
{
  if (result >= 3) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1D5A9F84C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D5A9F894(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1D5984480;
  return sub_1D5A9E9AC(a1, v4, v5, v6, v7, v8);
}

void sub_1D5A9F95C(_OWORD *a1)
{
  if (*(void *)a1 == 1)
  {
    *a1 = xmmword_1D5AC27A0;
    GatedResource.release(with:)();
  }
}

SeymourClient::AssetDevice_optional __swiftcall AssetDevice.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    v1.value = SeymourClient_AssetDevice_activePaired;
  }
  else {
    v1.value = SeymourClient_AssetDevice_unknownDefault;
  }
  if (rawValue) {
    return v1;
  }
  else {
    return 0;
  }
}

void *static AssetDevice.allCases.getter()
{
  return &unk_1F2DEC2F8;
}

uint64_t AssetDevice.rawValue.getter(char a1)
{
  return a1 & 1;
}

unint64_t sub_1D5A9F9E0()
{
  unint64_t result = qword_1EA728268;
  if (!qword_1EA728268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728268);
  }
  return result;
}

void *sub_1D5A9FA34@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

unint64_t sub_1D5A9FA58()
{
  unint64_t result = qword_1EA728270;
  if (!qword_1EA728270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728278);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728270);
  }
  return result;
}

void sub_1D5A9FAB4(void *a1@<X8>)
{
  *a1 = &unk_1F2DEC320;
}

unsigned char *storeEnumTagSinglePayload for AssetDevice(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D5A9FB90);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetDevice()
{
  return &type metadata for AssetDevice;
}

uint64_t dispatch thunk of AnalyticsEvent.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnalyticsEvent.payload.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t WatchConnectionRejection.applyingTimestampOffset(_:)()
{
  sub_1D5AB3B30();
  return sub_1D5AB3B40();
}

uint64_t sub_1D5A9FC4C()
{
  sub_1D5AB3B30();
  return sub_1D5AB3B40();
}

uint64_t sub_1D5A9FCA8(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return MindfulSessionAccumulating.finalize(heartRate:)(a1, a2 & 1, a3, a4);
}

uint64_t MindfulSessionAccumulating.finalize(heartRate:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 24))(a1, a2 & 1);
}

uint64_t MindfulSessionAccumulator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  type metadata accessor for UnfairLock();
  uint64_t v3 = swift_allocObject();
  unsigned int v4 = (_DWORD *)swift_slowAlloc();
  *(void *)(v3 + 16) = v4;
  *unsigned int v4 = 0;
  *(void *)(v0 + 16) = MEMORY[0x1E4FBC870];
  *(void *)(v0 + 24) = v3;
  return v0;
}

uint64_t MindfulSessionAccumulator.init()()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  type metadata accessor for UnfairLock();
  uint64_t v3 = swift_allocObject();
  unsigned int v4 = (_DWORD *)swift_slowAlloc();
  *(void *)(v3 + 16) = v4;
  *unsigned int v4 = 0;
  *(void *)(v0 + 16) = MEMORY[0x1E4FBC870];
  *(void *)(v0 + 24) = v3;
  return v0;
}

uint64_t MindfulSessionAccumulator.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D5A9FE64(v0 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state);
  return v0;
}

uint64_t sub_1D5A9FE64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MindfulSessionAccumulator.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for MindfulSessionAccumulator.State(uint64_t a1)
{
  return sub_1D5AA1204(a1, (uint64_t *)&unk_1EBDE3060);
}

uint64_t MindfulSessionAccumulator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D5A9FE64(v0 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state);
  return swift_deallocClassInstance();
}

void MindfulSessionAccumulator.startAccumulating(startDate:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v3 + 16));
  sub_1D5A9FFB4(v1, a1);
  unsigned int v4 = *(os_unfair_lock_s **)(v3 + 16);
  os_unfair_lock_unlock(v4);
}

void sub_1D5A9FFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MindfulSessionAccumulator.State(0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = &v21[-v8];
  uint64_t v10 = a1 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state;
  swift_beginAccess();
  sub_1D5AA1DB0(v10, (uint64_t)v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v12 = *(void *)(v11 - 8);
  LODWORD(a1) = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11);
  sub_1D5A9FE64((uint64_t)v9);
  if (a1 == 1)
  {
    if (qword_1EBDE3740 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1D5AB4B50();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EBDE37B0);
    v14._countAndFlagsBits = 0xD00000000000007ALL;
    v14._object = (void *)0x80000001D5ACBEF0;
    v15._object = (void *)0x80000001D5ACC000;
    v15._countAndFlagsBits = 0xD00000000000001DLL;
    Logger.trace(file:function:)(v14, v15);
    uint64_t v16 = sub_1D5AB1CE0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v7, a2, v16);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
    swift_beginAccess();
    sub_1D5AA1E14((uint64_t)v7, v10);
    swift_endAccess();
  }
  else
  {
    if (qword_1EBDE3740 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1D5AB4B50();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBDE37B0);
    uint64_t v18 = sub_1D5AB4B30();
    os_log_type_t v19 = sub_1D5AB5410();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1D5947000, v18, v19, "Repeat calls to start accumulating, ignoring", v20, 2u);
      MEMORY[0x1D945AAC0](v20, -1, -1);
    }
  }
}

void MindfulSessionAccumulator.stopAccumulating(endDate:heartRate:)(uint64_t a1, uint64_t a2, char a3)
{
  int v6 = a3 & 1;
  uint64_t v7 = *(void *)(v3 + 24);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v7 + 16));
  sub_1D5AA032C(v3, a1, a2, v6);
  uint64_t v8 = *(os_unfair_lock_s **)(v7 + 16);
  os_unfair_lock_unlock(v8);
}

void sub_1D5AA032C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v54 = a4;
  uint64_t v60 = a3;
  uint64_t v55 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA727900);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v56 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D5AB3980();
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v58 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v57 = (uint64_t)&v50 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v62 = (char *)&v50 - v13;
  uint64_t v14 = type metadata accessor for MindfulSessionAccumulator.State(0);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v59 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v50 - v17;
  uint64_t v65 = sub_1D5AB1CE0();
  uint64_t v19 = *(void *)(v65 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v65);
  uint64_t v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  uint64_t v25 = (char *)&v50 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v64 = (char *)&v50 - v26;
  uint64_t v61 = a1;
  uint64_t v27 = a1 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state;
  swift_beginAccess();
  sub_1D5AA1DB0(v27, (uint64_t)v18);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v18, 1, v28) == 1)
  {
    sub_1D5A9FE64((uint64_t)v18);
    if (qword_1EBDE3740 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1D5AB4B50();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EBDE37B0);
    int v31 = sub_1D5AB4B30();
    os_log_type_t v32 = sub_1D5AB5410();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_1D5947000, v31, v32, "Stop accumulating called in incorrect state", v33, 2u);
      MEMORY[0x1D945AAC0](v33, -1, -1);
    }
  }
  else
  {
    uint64_t v51 = v27;
    uint64_t v52 = v8;
    uint64_t v53 = v4;
    v54 &= 1u;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v64, v18, v65);
    if (qword_1EBDE3740 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1D5AB4B50();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EBDE37B0);
    v35._countAndFlagsBits = 0xD00000000000007ALL;
    v35._object = (void *)0x80000001D5ACBEF0;
    v36._object = (void *)0x80000001D5ACBFD0;
    v36._countAndFlagsBits = 0xD000000000000024;
    Logger.trace(file:function:)(v35, v36);
    uint64_t v50 = sub_1D5AB4E20();
    uint64_t v37 = v19;
    uint64_t v38 = *(void (**)(char *, char *))(v19 + 16);
    id v39 = v25;
    uint64_t v40 = v65;
    v38(v39, v64);
    ((void (*)(char *, uint64_t, uint64_t))v38)(v22, v55, v40);
    uint64_t v41 = sub_1D5AB2DF0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v56, 1, 1, v41);
    os_log_t v42 = v62;
    sub_1D5AB3970();
    uint64_t v43 = v63;
    uint64_t v44 = v58;
    uint64_t v45 = v52;
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v58, v42, v52);
    swift_beginAccess();
    uint64_t v46 = v57;
    sub_1D5A7EEF8(v57, v44);
    int v47 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v47(v46, v45);
    swift_endAccess();
    uint64_t v48 = (uint64_t)v59;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v59, 1, 1, v28);
    uint64_t v49 = v51;
    swift_beginAccess();
    sub_1D5AA1E14(v48, v49);
    swift_endAccess();
    v47((uint64_t)v42, v45);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v64, v65);
  }
}

uint64_t MindfulSessionAccumulator.finalize(heartRate:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1D5AB1CE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  int v10 = a2 & 1;
  uint64_t v11 = sub_1D5AB4B50();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EBDE37B0);
  v12._countAndFlagsBits = 0xD00000000000007ALL;
  v12._object = (void *)0x80000001D5ACBEF0;
  v13._object = (void *)0x80000001D5ACBF70;
  v13._countAndFlagsBits = 0xD000000000000014;
  Logger.trace(file:function:)(v12, v13);
  sub_1D5AB1CD0();
  uint64_t v14 = *(void *)(v3 + 24);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v14 + 16));
  sub_1D5AA0B14(v3, v9, a1, v10, &v18);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v14 + 16));
  uint64_t v15 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

uint64_t sub_1D5AA0B14@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, void *a5@<X8>)
{
  LODWORD(v59) = a4;
  uint64_t v56 = a3;
  uint64_t v53 = a2;
  uint64_t v62 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA727900);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D5AB3980();
  uint64_t v57 = *(void *)(v9 - 8);
  uint64_t v58 = v9;
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  int v54 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)v46 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v55 = (char *)v46 - v15;
  uint64_t v61 = sub_1D5AB1CE0();
  uint64_t v16 = *(void *)(v61 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v61);
  uint64_t v52 = (char *)v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v51 = (char *)v46 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v22 = (char *)v46 - v21;
  uint64_t v23 = type metadata accessor for MindfulSessionAccumulator.State(0);
  uint64_t v24 = MEMORY[0x1F4188790](v23 - 8);
  uint64_t v60 = (char *)v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  uint64_t v27 = (char *)v46 - v26;
  uint64_t v28 = a1 + OBJC_IVAR____TtC13SeymourClient25MindfulSessionAccumulator_state;
  swift_beginAccess();
  sub_1D5AA1DB0(v28, (uint64_t)v27);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v27, 1, v29) != 1)
  {
    int v47 = v59 & 1;
    int v31 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    uint64_t v50 = v22;
    v46[0] = v8;
    uint64_t v32 = v61;
    v31(v22, v27, v61);
    v46[2] = sub_1D5AB4E20();
    v46[1] = v33;
    uint64_t v59 = a1;
    uint64_t v48 = v14;
    uint64_t v49 = v29;
    uint64_t v34 = v54;
    Swift::String v35 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v35(v51, v22, v32);
    v35(v52, v53, v32);
    uint64_t v36 = sub_1D5AB2DF0();
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v46[0], 1, 1, v36);
    uint64_t v37 = v55;
    sub_1D5AB3970();
    uint64_t v39 = v57;
    uint64_t v38 = v58;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v34, v37, v58);
    swift_beginAccess();
    uint64_t v40 = (uint64_t)v48;
    uint64_t v41 = v34;
    uint64_t v29 = v49;
    sub_1D5A7EEF8((uint64_t)v48, v41);
    os_log_t v42 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v42(v40, v38);
    swift_endAccess();
    v42((uint64_t)v37, v38);
    a1 = v59;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v50, v61);
  }
  uint64_t v43 = (uint64_t)v60;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v60, 1, 1, v29);
  swift_beginAccess();
  sub_1D5AA1E14(v43, v28);
  swift_endAccess();
  uint64_t result = swift_beginAccess();
  uint64_t v45 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = MEMORY[0x1E4FBC870];
  void *v62 = v45;
  return result;
}

void sub_1D5AA1064(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(v3 + 24);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v4 + 16));
  sub_1D5A9FFB4(v3, a1);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 16);
  os_unfair_lock_unlock(v5);
}

void sub_1D5AA10C8(uint64_t a1, uint64_t a2, char a3)
{
  int v6 = a3 & 1;
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(v7 + 24);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v8 + 16));
  sub_1D5AA032C(v7, a1, a2, v6);
  uint64_t v9 = *(os_unfair_lock_s **)(v8 + 16);
  os_unfair_lock_unlock(v9);
}

uint64_t sub_1D5AA1144(uint64_t a1, char a2)
{
  return MindfulSessionAccumulator.finalize(heartRate:)(a1, a2 & 1);
}

uint64_t MindfulSessionAccumulating.stopAccumulating(date:heartRate:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a5 + 16))(a1, a2, a3 & 1);
}

uint64_t MindfulSessionAccumulating.startAccumulating(date:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MindfulSessionAccumulating.startAccumulating(startDate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MindfulSessionAccumulating.stopAccumulating(endDate:heartRate:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a5 + 16))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of MindfulSessionAccumulating.finalize(heartRate:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 24))(a1, a2 & 1);
}

uint64_t sub_1D5AA11DC()
{
  return type metadata accessor for MindfulSessionAccumulator(0);
}

uint64_t type metadata accessor for MindfulSessionAccumulator(uint64_t a1)
{
  return sub_1D5AA1204(a1, (uint64_t *)&unk_1EBDE3070);
}

uint64_t sub_1D5AA1204(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D5AA123C()
{
  uint64_t result = type metadata accessor for MindfulSessionAccumulator.State(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MindfulSessionAccumulator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MindfulSessionAccumulator);
}

uint64_t dispatch thunk of MindfulSessionAccumulator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t *sub_1D5AA1314(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_1D5AB1CE0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_1D5AA1480(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_1D5AB1CE0();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *sub_1D5AA1534(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_1D5AB1CE0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_1D5AA1664(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_1D5AB1CE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_1D5AA1808((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_1D5AB1CE0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_1D5AA1808(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1D5AA1868(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_1D5AB1CE0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_1D5AA1998(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_1D5AB1CE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_1D5AA1808((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_1D5AB1CE0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_1D5AA1B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D5AA1B50);
}

uint64_t sub_1D5AA1B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D5AA1BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D5AA1BD4);
}

uint64_t sub_1D5AA1BD4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_1D5AA1C58(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_1D5AA1CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE2F58);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_1D5AA1D38()
{
  uint64_t result = sub_1D5AB1CE0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_1D5AA1DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MindfulSessionAccumulator.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D5AA1E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MindfulSessionAccumulator.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t CountdownStarted.countdown.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1D5AB4A30();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t CountdownStarted.init(countdown:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1D5AB4A30();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

void static CountdownStarted.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t initializeBufferWithCopyOfBuffer for CountdownStarted(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for CountdownStarted(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB4A30();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for CountdownStarted(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CountdownStarted(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CountdownStarted(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CountdownStarted(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CountdownStarted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D5AA21D0);
}

uint64_t sub_1D5AA21D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CountdownStarted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D5AA2250);
}

uint64_t sub_1D5AA2250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB4A30();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CountdownStarted()
{
  uint64_t result = qword_1EA728280;
  if (!qword_1EA728280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D5AA230C()
{
  uint64_t result = sub_1D5AB4A30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *SearchClient.__allocating_init(eventHub:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  id v7 = a3;
  uint64_t v8 = (void *)sub_1D5AB4DE0();
  id v9 = objc_msgSend(v6, sel_initWithMachServiceName_options_, v8, 0);

  type metadata accessor for XPCClient();
  swift_allocObject();
  uint64_t v10 = sub_1D59968E8(v9, v7);
  uint64_t v11 = *(void *)(v10 + 32);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  if (*(unsigned char *)(v10 + 48) == 1)
  {
    *(unsigned char *)(v10 + 48) = 2;
    objc_msgSend(*(id *)(v10 + 24), sel_resume);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
  type metadata accessor for SearchClient();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = swift_retain();
  uint64_t v14 = sub_1D5AA3D6C(v13, a1, a2, v12);

  swift_release_n();
  return v14;
}

uint64_t SearchClient.__allocating_init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5AA2520(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5AA3F78);
}

uint64_t type metadata accessor for SearchClient()
{
  return self;
}

uint64_t SearchClient.init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5AA2520(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5AA3E78);
}

uint64_t sub_1D5AA2520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = a6(a1, a4, a5, v6, ObjectType, a2, a3);
  swift_unknownObjectRelease();
  return v14;
}

uint64_t sub_1D5AA25A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecentSearchTermsUpdated();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = *(void *)(result + 48);
    swift_unknownObjectRetain();
    swift_release();
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = sub_1D5AB3C00();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v4, a1, v8);
    (*(void (**)(char *, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v6 + 8))(v4, v2, &protocol witness table for RecentSearchTermsUpdated, ObjectType, v6);
    swift_unknownObjectRelease();
    return sub_1D5AA4328((uint64_t)v4);
  }
  return result;
}

uint64_t SearchClient.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t SearchClient.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t SearchClient.fetchSearchLandingShelfTileDescriptors()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x1F4188298](sub_1D5AA2778, 0, 0);
}

uint64_t sub_1D5AA2778()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_1D5AB4B50();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBDE3748);
  v3._countAndFlagsBits = 0xD000000000000064;
  v3._object = (void *)0x80000001D5ACC020;
  v4._object = (void *)0x80000001D5ACC090;
  v4._countAndFlagsBits = 0xD000000000000028;
  Logger.trace(file:function:)(v3, v4);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  *(_WORD *)(v0 + 48) = 339;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v5 + 56) + **(int **)(v5 + 56));
  id v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728298);
  unint64_t v9 = sub_1D5AA3FF8();
  unint64_t v10 = sub_1D5AA4064();
  *id v7 = v0;
  v7[1] = sub_1D5A21BC4;
  return v12(v0 + 16, v0 + 48, v8, v9, v10, ObjectType, v5);
}

uint64_t SearchClient.fetchSearchResults(request:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1D5AA2978, 0, 0);
}

void sub_1D5AA2978()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = sub_1D5AB4B50();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBDE3748);
  v3._countAndFlagsBits = 0xD000000000000064;
  v3._object = (void *)0x80000001D5ACC020;
  v4._object = (void *)0x80000001D5ACC0C0;
  v4._countAndFlagsBits = 0xD00000000000001CLL;
  Logger.trace(file:function:)(v3, v4);
  uint64_t v5 = *(void *)(v1 + 24);
  swift_getObjectType();
  *(_WORD *)(v0 + 56) = 334;
  uint64_t v7 = *(void *)(v5 + 64) + **(int **)(v5 + 64);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v6;
  sub_1D5AB25F0();
  sub_1D5AB2B70();
  *uint64_t v6 = v0;
  v6[1] = sub_1D5983170;
  __asm { BRAA            X9, X16 }
}

uint64_t SearchClient.fetchSearchSuggestions(term:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return MEMORY[0x1F4188298](sub_1D5AA2B84, 0, 0);
}

void sub_1D5AA2B84()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = sub_1D5AB4B50();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBDE3748);
  v5._countAndFlagsBits = 0xD000000000000064;
  v5._object = (void *)0x80000001D5ACC020;
  v6._object = (void *)0x80000001D5ACC0E0;
  v6._countAndFlagsBits = 0xD00000000000001DLL;
  Logger.trace(file:function:)(v5, v6);
  uint64_t v7 = *(void *)(v1 + 24);
  swift_getObjectType();
  *(_WORD *)(v0 + 80) = 338;
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v2;
  uint64_t v9 = *(void *)(v7 + 64) + **(int **)(v7 + 64);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v8;
  sub_1D5AB3E20();
  void *v8 = v0;
  v8[1] = sub_1D5AA2D80;
  __asm { BRAA            X9, X16 }
}

uint64_t sub_1D5AA2D80()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1D5AA2EB4, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1D5AA2EB4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SearchClient.insertRecentSearchTerm(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_1D5AA2EEC, 0, 0);
}

uint64_t sub_1D5AA2EEC()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_1D5AB4B50();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBDE3748);
  v3._countAndFlagsBits = 0xD000000000000064;
  v3._object = (void *)0x80000001D5ACC020;
  v4._object = (void *)0x80000001D5ACC100;
  v4._countAndFlagsBits = 0xD00000000000001ALL;
  Logger.trace(file:function:)(v3, v4);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  *(_WORD *)(v0 + 48) = 335;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 48)
                                                                                              + **(int **)(v5 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v7;
  uint64_t v8 = sub_1D5AB2FF0();
  *uint64_t v7 = v0;
  v7[1] = sub_1D5A1FCD4;
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v10 = MEMORY[0x1E4F9CE28];
  uint64_t v11 = MEMORY[0x1E4F9CE30];
  return v13(v0 + 48, v9, v8, v10, v11, ObjectType, v5);
}

uint64_t SearchClient.deleteRecentSearchTerms(_:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x1F4188298](sub_1D5AA30C8, 0, 0);
}

uint64_t sub_1D5AA30C8()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3748);
  v4._countAndFlagsBits = 0xD000000000000064;
  v4._object = (void *)0x80000001D5ACC020;
  v5._object = (void *)0x80000001D5ACC120;
  v5._countAndFlagsBits = 0xD00000000000001BLL;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  *(_WORD *)(v0 + 56) = 336;
  *(void *)(v0 + 16) = v2;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v6 + 48) + **(int **)(v6 + 48));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7282D8);
  uint64_t v10 = sub_1D59A3114(&qword_1EA7282E0, &qword_1EA7282D8);
  unint64_t v11 = sub_1D5AA4108();
  void *v8 = v0;
  v8[1] = sub_1D5983170;
  return v13(v0 + 56, v0 + 16, v9, v10, v11, ObjectType, v6);
}

uint64_t SearchClient.deleteAllRecentSearchTerms(for:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x1F4188298](sub_1D5AA32E8, 0, 0);
}

uint64_t sub_1D5AA32E8()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3748);
  v4._countAndFlagsBits = 0xD000000000000064;
  v4._object = (void *)0x80000001D5ACC020;
  v5._object = (void *)0x80000001D5ACC140;
  v5._countAndFlagsBits = 0xD000000000000020;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  *(_WORD *)(v0 + 56) = 340;
  *(void *)(v0 + 16) = v2;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v6 + 48) + **(int **)(v6 + 48));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728300);
  uint64_t v10 = sub_1D59A3114(&qword_1EA728308, &qword_1EA728300);
  unint64_t v11 = sub_1D5AA41F4();
  void *v8 = v0;
  v8[1] = sub_1D5A1F7D0;
  return v13(v0 + 56, v0 + 16, v9, v10, v11, ObjectType, v6);
}

uint64_t SearchClient.queryRecentSearchTerms(for:)(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return MEMORY[0x1F4188298](sub_1D5AA350C, 0, 0);
}

void sub_1D5AA350C()
{
  if (qword_1EBDE3760 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE3748);
  v4._countAndFlagsBits = 0xD000000000000064;
  v4._object = (void *)0x80000001D5ACC020;
  v5._object = (void *)0x80000001D5ACC170;
  v5._countAndFlagsBits = 0xD00000000000001CLL;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  swift_getObjectType();
  *(_WORD *)(v0 + 64) = 337;
  *(void *)(v0 + 24) = v2;
  uint64_t v8 = *(void *)(v6 + 64) + **(int **)(v6 + 64);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728300);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7282D8);
  sub_1D59A3114(&qword_1EA728308, &qword_1EA728300);
  sub_1D5AA41F4();
  sub_1D59A3114(&qword_1EA7282E0, &qword_1EA7282D8);
  sub_1D5AA4108();
  *uint64_t v7 = v0;
  v7[1] = sub_1D5AA376C;
  __asm { BRAA            X9, X16 }
}

uint64_t sub_1D5AA376C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5A24978;
  }
  else {
    uint64_t v2 = sub_1D5A21CD8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5AA3880()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1D5A27F80;
  v3[3] = v2;
  return MEMORY[0x1F4188298](sub_1D5AA2778, 0, 0);
}

uint64_t sub_1D5AA392C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[3] = a2;
  v7[4] = v6;
  v7[1] = sub_1D598AF68;
  v7[2] = a1;
  return MEMORY[0x1F4188298](sub_1D5AA2978, 0, 0);
}

uint64_t sub_1D5AA39E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1D598AF68;
  v9[6] = a3;
  v9[7] = v8;
  v9[4] = a1;
  v9[5] = a2;
  return MEMORY[0x1F4188298](sub_1D5AA2B84, 0, 0);
}

uint64_t sub_1D5AA3AAC(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_1D598AF68;
  return MEMORY[0x1F4188298](sub_1D5AA2EEC, 0, 0);
}

uint64_t sub_1D5AA3B5C(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D5984480;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x1F4188298](sub_1D5AA30C8, 0, 0);
}

uint64_t sub_1D5AA3C0C(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D598AF68;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x1F4188298](sub_1D5AA32E8, 0, 0);
}

uint64_t sub_1D5AA3CBC(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D596ECDC;
  v5[4] = a1;
  v5[5] = v4;
  return MEMORY[0x1F4188298](sub_1D5AA350C, 0, 0);
}

void *sub_1D5AA3D6C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[2] = a1;
  a4[3] = &protocol witness table for XPCClient;
  a4[4] = &protocol witness table for XPCClient;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = a1;
  char v10 = 49;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = sub_1D5AB3C00();
  swift_retain();
  swift_unknownObjectRetain();
  TransportDispatching.register<A>(event:handler:)(&v10, (uint64_t)sub_1D5AA4320, v7, ObjectType, v8, (uint64_t)&protocol witness table for XPCClient, MEMORY[0x1E4F9E398], MEMORY[0x1E4F9E3A0]);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5AA3E78(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  a4[2] = a1;
  a4[3] = a6;
  a4[4] = a7;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v15 = a1;
  char v14 = 49;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = sub_1D5AB3C00();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  TransportDispatching.register<A>(event:handler:)(&v14, (uint64_t)sub_1D5AA4320, v11, ObjectType, v12, a7, MEMORY[0x1E4F9E398], MEMORY[0x1E4F9E3A0]);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5AA3F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  type metadata accessor for SearchClient();
  uint64_t v13 = (void *)swift_allocObject();
  return sub_1D5AA3E78(a1, a2, a3, v13, a5, a6, a7);
}

unint64_t sub_1D5AA3FF8()
{
  unint64_t result = qword_1EA7282A0;
  if (!qword_1EA7282A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7282A0);
  }
  return result;
}

unint64_t sub_1D5AA4064()
{
  unint64_t result = qword_1EA7282A8;
  if (!qword_1EA7282A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728298);
    sub_1D5AA41AC(&qword_1EA7282B0, MEMORY[0x1E4F9D568]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7282A8);
  }
  return result;
}

unint64_t sub_1D5AA4108()
{
  unint64_t result = qword_1EA7282E8;
  if (!qword_1EA7282E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA7282D8);
    sub_1D5AA41AC(&qword_1EA7282F0, MEMORY[0x1E4F9CE40]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7282E8);
  }
  return result;
}

uint64_t sub_1D5AA41AC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1D5AA41F4()
{
  unint64_t result = qword_1EA728310;
  if (!qword_1EA728310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728300);
    sub_1D5AA4268();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728310);
  }
  return result;
}

unint64_t sub_1D5AA4268()
{
  unint64_t result = qword_1EA728318;
  if (!qword_1EA728318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728318);
  }
  return result;
}

uint64_t method lookup function for SearchClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchClient);
}

uint64_t dispatch thunk of SearchClient.__allocating_init(connection:eventHub:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1D5AA42E8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D5AA4320(uint64_t a1)
{
  return sub_1D5AA25A4(a1);
}

uint64_t sub_1D5AA4328(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecentSearchTermsUpdated();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *AnalyticsEventMonitor.__allocating_init(eventHub:reporter:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  uint64_t v6 = sub_1D5AA4530(a1, a2, a3);
  swift_unknownObjectRelease();
  return v6;
}

void *AnalyticsEventMonitor.init(eventHub:reporter:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1D5AA4530(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

void *sub_1D5AA441C(uint64_t a1)
{
  swift_beginAccess();
  unint64_t result = (void *)swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result[8];
    uint64_t v4 = result[9];
    __swift_project_boxed_opaque_existential_1(result + 5, v3);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
    return (void *)swift_release();
  }
  return result;
}

uint64_t AnalyticsEventMonitor.deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  return v0;
}

uint64_t AnalyticsEventMonitor.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  return swift_deallocClassInstance();
}

void *sub_1D5AA4530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v12)(void *__return_ptr, ValueMetadata *, uint64_t, void *(*)(uint64_t), uint64_t, ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t);
  void v14[5];

  uint64_t v4 = v3;
  v4[2] = a1;
  v4[3] = a2;
  type metadata accessor for SubscriptionToken();
  uint64_t v8 = swift_allocObject();
  uint64_t ObjectType = swift_getObjectType();
  v4[4] = sub_1D5958664(a1, v8, ObjectType, a2);
  sub_1D5979948(a3, (uint64_t)(v4 + 5));
  uint64_t v10 = v4[4];
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = *(void (**)(void *__return_ptr, ValueMetadata *, uint64_t, void *(*)(uint64_t), uint64_t, ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(a2 + 32);
  swift_unknownObjectRetain();
  v12(v14, &type metadata for AnalyticsEventOccurred, v10, sub_1D5AA46F4, v11, &type metadata for AnalyticsEventOccurred, &protocol witness table for AnalyticsEventOccurred, ObjectType, a2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  return v4;
}

uint64_t type metadata accessor for AnalyticsEventMonitor()
{
  return self;
}

uint64_t method lookup function for AnalyticsEventMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AnalyticsEventMonitor);
}

uint64_t dispatch thunk of AnalyticsEventMonitor.__allocating_init(eventHub:reporter:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1D5AA46BC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void *sub_1D5AA46F4(uint64_t a1)
{
  return sub_1D5AA441C(a1);
}

void *ArchivedSessionClient.__allocating_init(eventHub:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  id v7 = a3;
  uint64_t v8 = (void *)sub_1D5AB4DE0();
  id v9 = objc_msgSend(v6, sel_initWithMachServiceName_options_, v8, 0);

  type metadata accessor for XPCClient();
  swift_allocObject();
  uint64_t v10 = sub_1D59968E8(v9, v7);
  uint64_t v11 = *(void *)(v10 + 32);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  if (*(unsigned char *)(v10 + 48) == 1)
  {
    *(unsigned char *)(v10 + 48) = 2;
    objc_msgSend(*(id *)(v10 + 24), sel_resume);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
  type metadata accessor for ArchivedSessionClient();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = swift_retain();
  char v14 = sub_1D5AA5774(v13, a1, a2, v12);

  swift_release_n();
  return v14;
}

uint64_t ArchivedSessionClient.__allocating_init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5AA4884(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5AA59C8);
}

uint64_t type metadata accessor for ArchivedSessionClient()
{
  return self;
}

uint64_t ArchivedSessionClient.init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5AA4884(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5AA58A4);
}

uint64_t sub_1D5AA4884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = a6(a1, a4, a5, v6, ObjectType, a2, a3);
  swift_unknownObjectRelease();
  return v14;
}

uint64_t sub_1D5AA4908(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if (qword_1EBDE5420 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1D5AB4B50();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EBDE5400);
    v5._countAndFlagsBits = 0xD000000000000078;
    v5._object = (void *)0x80000001D5ACC200;
    v6._object = (void *)0x80000001D5ACC440;
    v6._countAndFlagsBits = 0xD000000000000032;
    Logger.trace(file:function:)(v5, v6);
    uint64_t v7 = *(void *)(v3 + 48);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = v1;
    id v9 = *(void (**)(uint64_t *, ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(v7 + 8);
    swift_bridgeObjectRetain();
    v9(&v10, &type metadata for ArchivedSessionsUpdated, &protocol witness table for ArchivedSessionsUpdated, ObjectType, v7);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ArchivedSessionClient.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t ArchivedSessionClient.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t ArchivedSessionClient.insertArchivedSession(_:)(uint64_t a1)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE5400);
  v4._countAndFlagsBits = 0xD000000000000078;
  v4._object = (void *)0x80000001D5ACC200;
  v5._object = (void *)0x80000001D5ACC280;
  v5._countAndFlagsBits = 0xD000000000000019;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 2;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = sub_1D5AB2BE0();
  return v8(&v11, a1, v9, MEMORY[0x1E4F9C898], MEMORY[0x1E4F9C8A0], ObjectType, v6);
}

uint64_t ArchivedSessionClient.deleteAllArchivedSessions()()
{
  return sub_1D5AA4E9C(0xD00000000000001BLL, (void *)0x80000001D5ACC2A0, 0);
}

uint64_t ArchivedSessionClient.queryAllArchivedSessions()()
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE5400);
  v2._countAndFlagsBits = 0xD000000000000078;
  v2._object = (void *)0x80000001D5ACC200;
  v3._object = (void *)0x80000001D5ACC2C0;
  v3._countAndFlagsBits = 0xD00000000000001ALL;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 3;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728360);
  uint64_t v8 = sub_1D59A3114(&qword_1EA728368, &qword_1EA728360);
  unint64_t v9 = sub_1D5AA5A48();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t ArchivedSessionClient.queryArchivedSession(sessionIdentifier:)(uint64_t a1, uint64_t a2)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D5AB4B50();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBDE5400);
  v6._countAndFlagsBits = 0xD000000000000078;
  v6._object = (void *)0x80000001D5ACC200;
  v7._object = (void *)0x80000001D5ACC2E0;
  v7._countAndFlagsBits = 0xD000000000000028;
  Logger.trace(file:function:)(v6, v7);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 4;
  v13[0] = a1;
  v13[1] = a2;
  uint64_t v10 = *(uint64_t (**)(__int16 *, void *, void, uint64_t, void, void, void, void, uint64_t, uint64_t))(v8 + 32);
  uint64_t v11 = sub_1D5AB2BE0();
  return v10(&v14, v13, MEMORY[0x1E4FBB1A0], v11, MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], MEMORY[0x1E4F9C898], MEMORY[0x1E4F9C8A0], ObjectType, v8);
}

uint64_t ArchivedSessionClient.requireArchivedSessions()()
{
  return sub_1D5AA4E9C(0xD000000000000019, (void *)0x80000001D5ACC310, 8);
}

uint64_t sub_1D5AA4E9C(uint64_t a1, void *a2, __int16 a3)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D5AB4B50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE5400);
  v8._object = (void *)0x80000001D5ACC200;
  v8._countAndFlagsBits = 0xD000000000000078;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Logger.trace(file:function:)(v8, v9);
  uint64_t v10 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v13 = a3;
  return (*(uint64_t (**)(__int16 *, uint64_t, uint64_t))(v10 + 8))(&v13, ObjectType, v10);
}

uint64_t ArchivedSessionClient.deleteArchivedSession(sessionIdentifier:)(uint64_t a1, uint64_t a2)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D5AB4B50();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBDE5400);
  v6._countAndFlagsBits = 0xD000000000000078;
  v6._object = (void *)0x80000001D5ACC200;
  v7._object = (void *)0x80000001D5ACC330;
  v7._countAndFlagsBits = 0xD000000000000029;
  Logger.trace(file:function:)(v6, v7);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v12 = 1;
  v11[0] = a1;
  v11[1] = a2;
  return (*(uint64_t (**)(__int16 *, void *, void, void, void, uint64_t, uint64_t))(v8 + 16))(&v12, v11, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], ObjectType, v8);
}

uint64_t ArchivedSessionClient.queryAllResumableSessions()()
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE5400);
  v2._countAndFlagsBits = 0xD000000000000078;
  v2._object = (void *)0x80000001D5ACC200;
  v3._object = (void *)0x80000001D5ACC360;
  v3._countAndFlagsBits = 0xD00000000000001BLL;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 6;
  Swift::String v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728380);
  uint64_t v8 = sub_1D59A3114(&qword_1EA728388, &qword_1EA728380);
  unint64_t v9 = sub_1D5AA5AEC();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t ArchivedSessionClient.queryResumableSession(workoutIdentifier:)(uint64_t a1, uint64_t a2)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D5AB4B50();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBDE5400);
  v6._countAndFlagsBits = 0xD000000000000078;
  v6._object = (void *)0x80000001D5ACC200;
  v7._object = (void *)0x80000001D5ACC380;
  v7._countAndFlagsBits = 0xD000000000000029;
  Logger.trace(file:function:)(v6, v7);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 5;
  v13[0] = a1;
  v13[1] = a2;
  uint64_t v10 = *(uint64_t (**)(__int16 *, void *, void, uint64_t, void, void, void, void, uint64_t, uint64_t))(v8 + 32);
  uint64_t v11 = sub_1D5AB3010();
  return v10(&v14, v13, MEMORY[0x1E4FBB1A0], v11, MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], MEMORY[0x1E4F9CE60], MEMORY[0x1E4F9CE68], ObjectType, v8);
}

uint64_t ArchivedSessionClient.queryResumableSessions(workoutIdentifiers:)(uint64_t a1)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE5400);
  v4._countAndFlagsBits = 0xD000000000000078;
  v4._object = (void *)0x80000001D5ACC200;
  v5._object = (void *)0x80000001D5ACC3B0;
  v5._countAndFlagsBits = 0xD00000000000002BLL;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v17 = 7;
  uint64_t v16 = a1;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t *, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4898);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA728380);
  uint64_t v11 = sub_1D59A3114(&qword_1EBDE48A0, &qword_1EBDE4898);
  unint64_t v12 = sub_1D5A9A444();
  uint64_t v13 = sub_1D59A3114(&qword_1EA728388, &qword_1EA728380);
  unint64_t v14 = sub_1D5AA5AEC();
  return v8(&v17, &v16, v9, v10, v11, v12, v13, v14, ObjectType, v6);
}

uint64_t ArchivedSessionClient.queryAllCompletedWorkoutIdentifiers()()
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE5400);
  v2._countAndFlagsBits = 0xD000000000000078;
  v2._object = (void *)0x80000001D5ACC200;
  v3._object = (void *)0x80000001D5ACC3E0;
  v3._countAndFlagsBits = 0xD000000000000025;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 9;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4898);
  uint64_t v8 = sub_1D59A3114(&qword_1EBDE48A0, &qword_1EBDE4898);
  unint64_t v9 = sub_1D5A9A444();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t sub_1D5AA560C(uint64_t a1)
{
  return ArchivedSessionClient.insertArchivedSession(_:)(a1);
}

uint64_t sub_1D5AA5630()
{
  return ArchivedSessionClient.deleteAllArchivedSessions()();
}

uint64_t sub_1D5AA5654(uint64_t a1, uint64_t a2)
{
  return ArchivedSessionClient.deleteArchivedSession(sessionIdentifier:)(a1, a2);
}

uint64_t sub_1D5AA5678()
{
  return ArchivedSessionClient.queryAllArchivedSessions()();
}

uint64_t sub_1D5AA569C(uint64_t a1, uint64_t a2)
{
  return ArchivedSessionClient.queryArchivedSession(sessionIdentifier:)(a1, a2);
}

uint64_t sub_1D5AA56C0(uint64_t a1, uint64_t a2)
{
  return ArchivedSessionClient.queryResumableSession(workoutIdentifier:)(a1, a2);
}

uint64_t sub_1D5AA56E4(uint64_t a1)
{
  return ArchivedSessionClient.queryResumableSessions(workoutIdentifiers:)(a1);
}

uint64_t sub_1D5AA5708()
{
  return ArchivedSessionClient.queryAllResumableSessions()();
}

uint64_t sub_1D5AA572C()
{
  return ArchivedSessionClient.queryAllCompletedWorkoutIdentifiers()();
}

uint64_t sub_1D5AA5750()
{
  return ArchivedSessionClient.requireArchivedSessions()();
}

void *sub_1D5AA5774(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[2] = a1;
  a4[3] = &protocol witness table for XPCClient;
  a4[4] = &protocol witness table for XPCClient;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = a1;
  char v12 = 0;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4898);
  uint64_t v9 = sub_1D59A3114(&qword_1EBDE48A0, &qword_1EBDE4898);
  unint64_t v10 = sub_1D5A9A444();
  TransportDispatching.register<A>(event:handler:)(&v12, (uint64_t)sub_1D5AA5D04, v7, ObjectType, v8, (uint64_t)&protocol witness table for XPCClient, v9, v10);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5AA58A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  a4[2] = a1;
  a4[3] = a6;
  a4[4] = a7;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v17 = a1;
  char v16 = 0;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4898);
  uint64_t v13 = sub_1D59A3114(&qword_1EBDE48A0, &qword_1EBDE4898);
  unint64_t v14 = sub_1D5A9A444();
  TransportDispatching.register<A>(event:handler:)(&v16, (uint64_t)sub_1D5AA5D04, v11, ObjectType, v12, a7, v13, v14);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5AA59C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  type metadata accessor for ArchivedSessionClient();
  uint64_t v13 = (void *)swift_allocObject();
  return sub_1D5AA58A4(a1, a2, a3, v13, a5, a6, a7);
}

unint64_t sub_1D5AA5A48()
{
  unint64_t result = qword_1EA728370;
  if (!qword_1EA728370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728360);
    sub_1D5AA5B90(&qword_1EA728378, MEMORY[0x1E4F9C8B0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728370);
  }
  return result;
}

unint64_t sub_1D5AA5AEC()
{
  unint64_t result = qword_1EA728390;
  if (!qword_1EA728390)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA728380);
    sub_1D5AA5B90(&qword_1EA728398, MEMORY[0x1E4F9CE78]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA728390);
  }
  return result;
}

uint64_t sub_1D5AA5B90(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.insertArchivedSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.deleteAllArchivedSessions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.deleteArchivedSession(sessionIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryAllArchivedSessions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryArchivedSession(sessionIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryResumableSession(workoutIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryResumableSessions(workoutIdentifiers:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryAllResumableSessions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryAllCompletedWorkoutIdentifiers()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.requireArchivedSessions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t method lookup function for ArchivedSessionClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArchivedSessionClient);
}

uint64_t dispatch thunk of ArchivedSessionClient.__allocating_init(connection:eventHub:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1D5AA5CCC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D5AA5D04(uint64_t *a1)
{
  return sub_1D5AA4908(a1);
}

unint64_t Platform.appBundle(for:)(char a1, char a2)
{
  unint64_t v2 = 0x6C7070612E6D6F63;
  if (a1 != 2) {
    unint64_t v2 = 0xD00000000000001BLL;
  }
  if (a2 == 2) {
    return v2;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t Platform.supportedFeatures.getter(char a1)
{
  return sub_1D5979ABC((uint64_t)*(&off_1E6A5BD38 + a1));
}

BOOL static EventDispatchStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EventDispatchStrategy.hash(into:)()
{
  return sub_1D5AB5C30();
}

uint64_t EventDispatchStrategy.hashValue.getter()
{
  return sub_1D5AB5C60();
}

unint64_t sub_1D5AA5E24()
{
  unint64_t result = qword_1EA7283A0;
  if (!qword_1EA7283A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7283A0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for EventDispatchStrategy(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D5AA5F44);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventDispatchStrategy()
{
  return &type metadata for EventDispatchStrategy;
}

uint64_t MeditationUpdated.meditation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1D5AB1E10();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MeditationUpdated.init(meditation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1D5AB1E10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

void static MeditationUpdated.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t initializeBufferWithCopyOfBuffer for MeditationUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for MeditationUpdated(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB1E10();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for MeditationUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for MeditationUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for MeditationUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for MeditationUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MeditationUpdated(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D5AA62D4);
}

uint64_t sub_1D5AA62D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MeditationUpdated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D5AA6354);
}

uint64_t sub_1D5AA6354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB1E10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MeditationUpdated()
{
  uint64_t result = qword_1EA7283A8;
  if (!qword_1EA7283A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D5AA6410()
{
  uint64_t result = sub_1D5AB1E10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t MetricPlayback.playbackTopic.getter()
{
  return sub_1D5AB2B00() & 1;
}

uint64_t MediaPlayerSyncUpdated.syncUpdate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1D5AB3630();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

void static MediaPlayerSyncUpdated.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t initializeBufferWithCopyOfBuffer for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for MediaPlayerSyncUpdated(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB3630();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D5AA67A4);
}

uint64_t sub_1D5AA67A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MediaPlayerSyncUpdated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D5AA6824);
}

uint64_t sub_1D5AA6824(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3630();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MediaPlayerSyncUpdated()
{
  uint64_t result = qword_1EA7283B8;
  if (!qword_1EA7283B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D5AA68E0()
{
  uint64_t result = sub_1D5AB3630();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void static HealthKitWorkoutsUpdated.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

ValueMetadata *type metadata accessor for HealthKitWorkoutsUpdated()
{
  return &type metadata for HealthKitWorkoutsUpdated;
}

void *HealthDataClient.__allocating_init(eventHub:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  id v7 = a3;
  uint64_t v8 = (void *)sub_1D5AB4DE0();
  id v9 = objc_msgSend(v6, sel_initWithMachServiceName_options_, v8, 0);

  type metadata accessor for XPCClient();
  swift_allocObject();
  uint64_t v10 = sub_1D59968E8(v9, v7);
  uint64_t v11 = *(void *)(v10 + 32);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  if (*(unsigned char *)(v10 + 48) == 1)
  {
    *(unsigned char *)(v10 + 48) = 2;
    objc_msgSend(*(id *)(v10 + 24), sel_resume);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
  type metadata accessor for HealthDataClient();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = swift_retain();
  unint64_t v14 = sub_1D5AA79FC(v13, a1, a2, v12);

  swift_release_n();
  return v14;
}

uint64_t HealthDataClient.__allocating_init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5AA6B18(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5AA7DB8);
}

uint64_t type metadata accessor for HealthDataClient()
{
  return self;
}

uint64_t HealthDataClient.init(connection:eventHub:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1D5AA6B18(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D5AA7BE0);
}

uint64_t sub_1D5AA6B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = a6(a1, a4, a5, v6, ObjectType, a2, a3);
  swift_unknownObjectRelease();
  return v14;
}

uint64_t sub_1D5AA6B9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    if (qword_1EBDE3740 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1D5AB4B50();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EBDE37B0);
    v12._object = (void *)0x80000001D5ACC480;
    v12._countAndFlagsBits = 0xD00000000000006DLL;
    v13._countAndFlagsBits = a2;
    v13._object = a3;
    Logger.trace(file:function:)(v12, v13);
    uint64_t v14 = *(void *)(v10 + 48);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8))(ObjectType, a4, a5, ObjectType, v14);
    return swift_release();
  }
  return result;
}

uint64_t sub_1D5AA6CB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MindfulMinutesMetricUpdated();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result;
    if (qword_1EBDE3740 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1D5AB4B50();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE37B0);
    v8._countAndFlagsBits = 0xD00000000000006DLL;
    v8._object = (void *)0x80000001D5ACC480;
    v9._object = (void *)0x80000001D5ACC680;
    v9._countAndFlagsBits = 0xD000000000000037;
    Logger.trace(file:function:)(v8, v9);
    uint64_t v10 = *(void *)(v6 + 48);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = sub_1D5AB35D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v4, a1, v12);
    (*(void (**)(char *, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v10 + 8))(v4, v2, &protocol witness table for MindfulMinutesMetricUpdated, ObjectType, v10);
    sub_1D5AA80BC((uint64_t)v4);
    return swift_release();
  }
  return result;
}

uint64_t HealthDataClient.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t HealthDataClient.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t HealthDataClient.queryAllHealthKitWorkouts()()
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE37B0);
  v2._countAndFlagsBits = 0xD00000000000006DLL;
  v2._object = (void *)0x80000001D5ACC480;
  v3._object = (void *)0x80000001D5ACC4F0;
  v3._countAndFlagsBits = 0xD00000000000001BLL;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 130;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7283C8);
  uint64_t v8 = sub_1D59A3114(&qword_1EA7283D0, &qword_1EA7283C8);
  unint64_t v9 = sub_1D5AA7E38();
  return v6(&v11, v7, v8, v9, ObjectType, v4);
}

uint64_t HealthDataClient.queryHealthKitWorkoutsUsingThreshold(_:)(uint64_t a1)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE37B0);
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x80000001D5ACC480;
  v5._object = (void *)0x80000001D5ACC510;
  v5._countAndFlagsBits = 0xD000000000000028;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 131;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB3BC0();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7283C8);
  uint64_t v11 = sub_1D59A3114(&qword_1EA7283D0, &qword_1EA7283C8);
  unint64_t v12 = sub_1D5AA7E38();
  return v8(&v14, a1, v9, v10, MEMORY[0x1E4F9E300], MEMORY[0x1E4F9E308], v11, v12, ObjectType, v6);
}

uint64_t HealthDataClient.queryHealthKitWorkout(sessionIdentifier:)(uint64_t a1, uint64_t a2)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D5AB4B50();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBDE37B0);
  v6._countAndFlagsBits = 0xD00000000000006DLL;
  v6._object = (void *)0x80000001D5ACC480;
  v7._object = (void *)0x80000001D5ACC540;
  v7._countAndFlagsBits = 0xD000000000000029;
  Logger.trace(file:function:)(v6, v7);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 134;
  v13[0] = a1;
  v13[1] = a2;
  uint64_t v10 = *(uint64_t (**)(__int16 *, void *, void, uint64_t, void, void, void, void, uint64_t, uint64_t))(v8 + 32);
  uint64_t v11 = sub_1D5AB2F80();
  return v10(&v14, v13, MEMORY[0x1E4FBB1A0], v11, MEMORY[0x1E4F9F0B8], MEMORY[0x1E4F9F0C0], MEMORY[0x1E4F9CC98], MEMORY[0x1E4F9CCA0], ObjectType, v8);
}

uint64_t HealthDataClient.insertHealthKitStandaloneWorkoutJob(_:)(uint64_t a1)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE37B0);
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x80000001D5ACC480;
  v5._object = (void *)0x80000001D5ACC570;
  v5._countAndFlagsBits = 0xD000000000000027;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 132;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = sub_1D5AB4110();
  return v8(&v11, a1, v9, MEMORY[0x1E4F9E7D0], MEMORY[0x1E4F9E7D8], ObjectType, v6);
}

uint64_t HealthDataClient.insertHealthKitWorkout(_:)(uint64_t a1)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE37B0);
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x80000001D5ACC480;
  v5._object = (void *)0x80000001D5ACC5A0;
  v5._countAndFlagsBits = 0xD00000000000001ALL;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 133;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = sub_1D5AB2F80();
  return v8(&v11, a1, v9, MEMORY[0x1E4F9CC98], MEMORY[0x1E4F9CCA0], ObjectType, v6);
}

uint64_t HealthDataClient.insertHealthKitMindfulSession(_:)(uint64_t a1)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE37B0);
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x80000001D5ACC480;
  v5._object = (void *)0x80000001D5ACC5C0;
  v5._countAndFlagsBits = 0xD000000000000021;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 135;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = sub_1D5AB3980();
  return v8(&v11, a1, v9, MEMORY[0x1E4F9DEF8], MEMORY[0x1E4F9DF00], ObjectType, v6);
}

uint64_t HealthDataClient.insertHealthKitStandaloneMindfulSessionJob(_:)(uint64_t a1)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE37B0);
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x80000001D5ACC480;
  v5._object = (void *)0x80000001D5ACC5F0;
  v5._countAndFlagsBits = 0xD00000000000002ELL;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v11 = 137;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = sub_1D5AB4460();
  return v8(&v11, a1, v9, MEMORY[0x1E4F9EB98], MEMORY[0x1E4F9EBA0], ObjectType, v6);
}

uint64_t HealthDataClient.queryHealthKitMindfulSessionsUsingThreshold(_:)(uint64_t a1)
{
  if (qword_1EBDE3740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE37B0);
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x80000001D5ACC480;
  v5._object = (void *)0x80000001D5ACC620;
  v5._countAndFlagsBits = 0xD00000000000002FLL;
  Logger.trace(file:function:)(v4, v5);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v14 = 136;
  uint64_t v8 = *(uint64_t (**)(__int16 *, uint64_t, uint64_t, uint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v9 = sub_1D5AB4320();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7283E8);
  uint64_t v11 = sub_1D59A3114(&qword_1EA7283F0, &qword_1EA7283E8);
  unint64_t v12 = sub_1D5AA7EDC();
  return v8(&v14, a1, v9, v10, MEMORY[0x1E4F9E9D0], MEMORY[0x1E4F9E9D8], v11, v12, ObjectType, v6);
}

uint64_t sub_1D5AA78DC()
{
  return HealthDataClient.queryAllHealthKitWorkouts()();
}

uint64_t sub_1D5AA7900(uint64_t a1)
{
  return HealthDataClient.queryHealthKitWorkoutsUsingThreshold(_:)(a1);
}

uint64_t sub_1D5AA7924(uint64_t a1)
{
  return HealthDataClient.insertHealthKitWorkout(_:)(a1);
}

uint64_t sub_1D5AA7948(uint64_t a1)
{
  return HealthDataClient.insertHealthKitStandaloneWorkoutJob(_:)(a1);
}

uint64_t sub_1D5AA796C(uint64_t a1, uint64_t a2)
{
  return HealthDataClient.queryHealthKitWorkout(sessionIdentifier:)(a1, a2);
}

uint64_t sub_1D5AA7990(uint64_t a1)
{
  return HealthDataClient.insertHealthKitMindfulSession(_:)(a1);
}

uint64_t sub_1D5AA79B4(uint64_t a1)
{
  return HealthDataClient.insertHealthKitStandaloneMindfulSessionJob(_:)(a1);
}

uint64_t sub_1D5AA79D8(uint64_t a1)
{
  return HealthDataClient.queryHealthKitMindfulSessionsUsingThreshold(_:)(a1);
}

void *sub_1D5AA79FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[2] = a1;
  a4[3] = &protocol witness table for XPCClient;
  a4[4] = &protocol witness table for XPCClient;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = a1;
  char v12 = 43;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  TransportDispatching.register(event:handler:)(&v12, (uint64_t)sub_1D5AA802C, v7, ObjectType, (uint64_t)&protocol witness table for XPCClient);
  swift_release_n();
  uint64_t v13 = a1;
  char v12 = 44;
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  TransportDispatching.register(event:handler:)(&v12, (uint64_t)sub_1D5AA8070, v8, ObjectType, (uint64_t)&protocol witness table for XPCClient);
  swift_release_n();
  uint64_t v13 = a1;
  char v12 = 45;
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = sub_1D5AB35D0();
  TransportDispatching.register<A>(event:handler:)(&v12, (uint64_t)sub_1D5AA80B4, v9, ObjectType, v10, (uint64_t)&protocol witness table for XPCClient, MEMORY[0x1E4F9D760], MEMORY[0x1E4F9D768]);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5AA7BE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  a4[2] = a1;
  a4[3] = a6;
  a4[4] = a7;
  a4[5] = a2;
  a4[6] = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v17 = a1;
  char v16 = 43;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  TransportDispatching.register(event:handler:)(&v16, (uint64_t)sub_1D5AA802C, v11, ObjectType, a7);
  swift_release_n();
  uint64_t v17 = a1;
  char v16 = 44;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  TransportDispatching.register(event:handler:)(&v16, (uint64_t)sub_1D5AA8070, v12, ObjectType, a7);
  swift_release_n();
  uint64_t v17 = a1;
  char v16 = 45;
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = sub_1D5AB35D0();
  TransportDispatching.register<A>(event:handler:)(&v16, (uint64_t)sub_1D5AA80B4, v13, ObjectType, v14, a7, MEMORY[0x1E4F9D760], MEMORY[0x1E4F9D768]);
  swift_release();
  swift_unknownObjectRelease();
  return a4;
}

void *sub_1D5AA7DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  type metadata accessor for HealthDataClient();
  uint64_t v13 = (void *)swift_allocObject();
  return sub_1D5AA7BE0(a1, a2, a3, v13, a5, a6, a7);
}

unint64_t sub_1D5AA7E38()
{
  unint64_t result = qword_1EA7283D8;
  if (!qword_1EA7283D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA7283C8);
    sub_1D5AA7F80(&qword_1EA7283E0, MEMORY[0x1E4F9CCB0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7283D8);
  }
  return result;
}

unint64_t sub_1D5AA7EDC()
{
  unint64_t result = qword_1EA7283F8;
  if (!qword_1EA7283F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA7283E8);
    sub_1D5AA7F80(&qword_1EA728400, MEMORY[0x1E4F9DF10]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7283F8);
  }
  return result;
}

uint64_t sub_1D5AA7F80(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for HealthDataClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthDataClient);
}

uint64_t dispatch thunk of HealthDataClient.__allocating_init(connection:eventHub:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1D5AA7FF4()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D5AA802C()
{
  return sub_1D5AA6B9C(v0, 0xD000000000000020, (void *)0x80000001D5ACC6F0, (uint64_t)&type metadata for HealthKitWorkoutsUpdated, (uint64_t)&protocol witness table for HealthKitWorkoutsUpdated);
}

uint64_t sub_1D5AA8070()
{
  return sub_1D5AA6B9C(v0, 0xD000000000000027, (void *)0x80000001D5ACC6C0, (uint64_t)&type metadata for HealthKitMindfulSessionsUpdated, (uint64_t)&protocol witness table for HealthKitMindfulSessionsUpdated);
}

uint64_t sub_1D5AA80B4(uint64_t a1)
{
  return sub_1D5AA6CB0(a1);
}

uint64_t sub_1D5AA80BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MindfulMinutesMetricUpdated();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t GymKitConnection.applyingTimestampOffset(_:)()
{
  sub_1D5AB2F10();
  return sub_1D5AB2F20();
}

uint64_t sub_1D5AA816C()
{
  sub_1D5AB2F10();
  return sub_1D5AB2F20();
}

uint64_t DaemonSessionUpdate.update.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1D5AB27E0();
  Swift::String v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t DaemonSessionUpdate.init(update:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1D5AB27E0();
  Swift::String v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

void static DaemonSessionUpdate.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t initializeBufferWithCopyOfBuffer for DaemonSessionUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  Swift::String v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for DaemonSessionUpdate(uint64_t a1)
{
  uint64_t v2 = sub_1D5AB27E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DaemonSessionUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DaemonSessionUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DaemonSessionUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DaemonSessionUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DaemonSessionUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D5AA8518);
}

uint64_t sub_1D5AA8518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  Swift::String v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DaemonSessionUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D5AA8598);
}

uint64_t sub_1D5AA8598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB27E0();
  Swift::String v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DaemonSessionUpdate()
{
  uint64_t result = qword_1EBDE3560;
  if (!qword_1EBDE3560) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D5AA8654()
{
  uint64_t result = sub_1D5AB27E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t AudioFocusSelectionChanged.currentFocusSelection.getter()
{
  return *v0;
}

uint64_t AudioFocusSelectionChanged.init(currentFocusSelection:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result & 1;
  return result;
}

void static AudioFocusSelectionChanged.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

unsigned char *storeEnumTagSinglePayload for AudioFocusSelectionChanged(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D5AA87D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioFocusSelectionChanged()
{
  return &type metadata for AudioFocusSelectionChanged;
}

void sub_1D5AA8808(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    unsigned int v6 = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_1D5AB1B40();
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v6 = (void *)sub_1D5AB1C10();
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

void *TransportDispatchService.__allocating_init(queue:label:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (void *)swift_allocObject();
  uint64_t v7 = MEMORY[0x1E4FBC868];
  v6[6] = MEMORY[0x1E4FBC868];
  v6[7] = v7;
  v6[2] = a1;
  v6[4] = a2;
  v6[5] = a3;
  type metadata accessor for UnfairLock();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = (_DWORD *)swift_slowAlloc();
  *(void *)(v8 + 16) = v9;
  *uint64_t v9 = 0;
  v6[3] = v8;
  return v6;
}

Swift::Void __swiftcall TransportDispatchService.unregisterAll()()
{
  uint64_t v1 = v0[3];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + 16));
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1E4FBC868];
  v0[6] = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v0[7] = v2;
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 16));
}

void TransportDispatchService.dispatchRequest(_:data:completion:)(Swift::Int a1, uint64_t a2, unint64_t a3, void (*a4)(void, unint64_t, void *), uint64_t a5)
{
  os_log_t v42 = a4;
  uint64_t v43 = a5;
  uint64_t v9 = sub_1D5AB4C50();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1D5AB4C70();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  char v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  TransportRequest.init(rawValue:)(a1);
  __int16 v17 = aBlock[0];
  if (LOWORD(aBlock[0]) == 341)
  {
    uint64_t v18 = sub_1D5AB2B90();
    sub_1D5AB11A4((unint64_t *)&qword_1EA727E10, MEMORY[0x1E4F9C878]);
    uint64_t v19 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x1E4F9C850], v18);
    v42(0, 0xF000000000000000, v19);
  }
  else
  {
    uint64_t v37 = v12;
    uint64_t v39 = v13;
    uint64_t v41 = v10;
    uint64_t v21 = *(void *)(v5 + 24);
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v21 + 16));
    swift_beginAccess();
    uint64_t v22 = v5;
    uint64_t v23 = *(void *)(v5 + 48);
    uint64_t v24 = *(void *)(v23 + 16);
    uint64_t v40 = v14;
    uint64_t v38 = v16;
    if (v24)
    {
      unint64_t v25 = sub_1D5952680(v17);
      uint64_t v26 = v9;
      if (v27)
      {
        uint64_t v28 = *(void *)(v23 + 56) + 16 * v25;
        uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))v28;
        uint64_t v29 = *(void *)(v28 + 8);
        swift_retain();
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v29 = 0;
      }
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v29 = 0;
      uint64_t v26 = v9;
    }
    int v31 = v37;
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v21 + 16));
    if (v30)
    {
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = v30;
      *(void *)(v32 + 24) = v29;
      uint64_t v30 = sub_1D5AAF50C;
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v30;
    *(void *)(v33 + 24) = v32;
    *(void *)(v33 + 32) = v22;
    *(_WORD *)(v33 + 40) = v17;
    uint64_t v34 = v43;
    *(void *)(v33 + 48) = v42;
    *(void *)(v33 + 56) = v34;
    *(void *)(v33 + 64) = a2;
    *(void *)(v33 + 72) = a3;
    aBlock[4] = sub_1D5AAF508;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D598EA50;
    aBlock[3] = &block_descriptor_20;
    Swift::String v35 = _Block_copy(aBlock);
    sub_1D5A0A740((uint64_t)v30);
    swift_retain();
    swift_retain();
    sub_1D59A0188(a2, a3);
    uint64_t v36 = v38;
    sub_1D5AB4C60();
    uint64_t v44 = MEMORY[0x1E4FBC860];
    sub_1D5AB11A4((unint64_t *)&qword_1EBDE50F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE5100);
    sub_1D5990440();
    sub_1D5AB56F0();
    MEMORY[0x1D94598A0](0, v36, v31, v35);
    _Block_release(v35);
    sub_1D5A0A7B0((uint64_t)v30);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v31, v26);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v39);
    swift_release();
  }
}

void TransportDispatchService.dispatchEvent(_:data:)(Swift::Int a1, uint64_t a2, NSObject *a3)
{
  unsigned int v4 = v3;
  uint64_t v44 = a3;
  uint64_t v7 = sub_1D5AB4C50();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D5AB4C70();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  TransportEvent.init(rawValue:)(a1);
  char v15 = aBlock[0];
  if (LOBYTE(aBlock[0]) == 54)
  {
    if (qword_1EBDE5420 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1D5AB4B50();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EBDE5400);
    uint64_t v44 = sub_1D5AB4B30();
    os_log_type_t v17 = sub_1D5AB5410();
    if (os_log_type_enabled(v44, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134349056;
      aBlock[0] = a1;
      sub_1D5AB5680();
      _os_log_impl(&dword_1D5947000, v44, v17, "Invalid eventIdentifier: %{public}ld", v18, 0xCu);
      MEMORY[0x1D945AAC0](v18, -1, -1);
    }
    else
    {
      int v31 = v44;
    }
  }
  else
  {
    uint64_t v43 = v8;
    uint64_t v19 = v4[3];
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v19 + 16));
    swift_beginAccess();
    uint64_t v20 = v4[7];
    uint64_t v21 = *(void *)(v20 + 16);
    uint64_t v42 = v12;
    if (v21 && (unint64_t v22 = sub_1D59526F8(v15), (v23 & 1) != 0))
    {
      uint64_t v24 = (uint64_t *)(*(void *)(v20 + 56) + 16 * v22);
      uint64_t v26 = *v24;
      uint64_t v25 = v24[1];
      swift_retain();
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v25 = 0;
    }
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v19 + 16));
    if (v26)
    {
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = v26;
      *(void *)(v27 + 24) = v25;
      uint64_t v28 = (void *)swift_allocObject();
      v28[2] = sub_1D5AAF568;
      v28[3] = v27;
      uint64_t v29 = v44;
      v28[4] = a2;
      v28[5] = v29;
      aBlock[4] = (uint64_t)sub_1D5AAF5F0;
      aBlock[5] = (uint64_t)v28;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1D598EA50;
      aBlock[3] = (uint64_t)&block_descriptor_12_0;
      uint64_t v30 = _Block_copy(aBlock);
      swift_retain_n();
      sub_1D59A0188(a2, (unint64_t)v29);
      sub_1D5AB4C60();
      uint64_t v46 = MEMORY[0x1E4FBC860];
      sub_1D5AB11A4((unint64_t *)&qword_1EBDE50F0, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE5100);
      sub_1D5990440();
      sub_1D5AB56F0();
      MEMORY[0x1D94598A0](0, v14, v10, v30);
      _Block_release(v30);
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v7);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v11);
    }
    else
    {
      if (qword_1EBDE5420 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_1D5AB4B50();
      __swift_project_value_buffer(v32, (uint64_t)qword_1EBDE5400);
      swift_retain();
      uint64_t v33 = sub_1D5AB4B30();
      os_log_type_t v34 = sub_1D5AB5410();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        aBlock[0] = v36;
        *(_DWORD *)uint64_t v35 = 136446466;
        uint64_t v37 = v4[4];
        unint64_t v38 = v4[5];
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_1D5951500(v37, v38, aBlock);
        sub_1D5AB5680();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v35 + 12) = 2082;
        LOBYTE(v46) = v15;
        unint64_t v39 = sub_1D5AAF514();
        uint64_t v40 = MEMORY[0x1D9458E50](&type metadata for TransportEvent, v39);
        uint64_t v46 = sub_1D5951500(v40, v41, aBlock);
        sub_1D5AB5680();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D5947000, v33, v34, "No dispatch handler on %{public}s found for event: %{public}s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D945AAC0](v36, -1, -1);
        MEMORY[0x1D945AAC0](v35, -1, -1);

        return;
      }
    }
    swift_release();
  }
}

uint64_t TransportDispatchService.register(request:handler:)(__int16 *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D5AA950C(a1, a2, a3, (uint64_t)&unk_1F2DF6220, (uint64_t)sub_1D59C796C);
}

{
  return sub_1D5AA950C(a1, a2, a3, (uint64_t)&unk_1F2DF6248, (uint64_t)sub_1D59C7974);
}

uint64_t sub_1D5AA950C(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int16 v10 = *a1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  swift_retain();
  sub_1D5AAB9C0(&v10, a5, v8);
  return swift_release();
}

uint64_t TransportDispatchService.register<A>(request:handler:)(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1D5AA9618(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F2DF6270, (uint64_t)sub_1D5AAF634);
}

{
  return sub_1D5AA9618(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F2DF6298, (uint64_t)sub_1D5AAF64C);
}

{
  return sub_1D5AA9618(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F2DF62C0, (uint64_t)sub_1D5AAF664);
}

{
  return sub_1D5AA9618(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F2DF62E8, (uint64_t)sub_1D5AAF67C);
}

uint64_t sub_1D5AA9618(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v16 = *a1;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a6;
  v14[5] = a2;
  v14[6] = a3;
  swift_retain();
  sub_1D5AAB9C0(&v16, a8, (uint64_t)v14);
  return swift_release();
}

uint64_t TransportDispatchService.register<A, B>(request:handler:)(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1D5AA9748(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t)&unk_1F2DF6310, (uint64_t)sub_1D5AAF704);
}

{
  return sub_1D5AA9748(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t)&unk_1F2DF6338, (uint64_t)sub_1D5AAF71C);
}

uint64_t sub_1D5AA9748(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __int16 v20 = *a1;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a4;
  v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = a8;
  v18[7] = a9;
  v18[8] = a2;
  v18[9] = a3;
  swift_retain();
  sub_1D5AAB9C0(&v20, a11, (uint64_t)v18);
  return swift_release();
}

uint64_t TransportDispatchService.register(event:handler:)(char *a1, uint64_t a2, uint64_t a3)
{
  char v7 = *a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  swift_retain();
  sub_1D5AAE2DC(&v7, (uint64_t)sub_1D5AAF774, v5);
  return swift_release();
}

uint64_t TransportDispatchService.register<A>(event:handler:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v13 = *a1;
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = a4;
  v11[3] = a5;
  v11[4] = a6;
  v11[5] = a2;
  v11[6] = a3;
  swift_retain();
  sub_1D5AAE2DC(&v13, (uint64_t)sub_1D5AAF7A4, (uint64_t)v11);
  return swift_release();
}

Swift::Void __swiftcall TransportDispatchService.unregister(request:)(SeymourClient::TransportRequest request)
{
  __int16 v2 = *(_WORD *)request;
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE5400);
  swift_retain();
  unsigned int v4 = sub_1D5AB4B30();
  os_log_type_t v5 = sub_1D5AB5430();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v15[0] = v7;
    *(_DWORD *)uint64_t v6 = 136446466;
    uint64_t v8 = v1[4];
    unint64_t v9 = v1[5];
    swift_bridgeObjectRetain();
    sub_1D5951500(v8, v9, v15);
    sub_1D5AB5680();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2082;
    unint64_t v10 = sub_1D5AAFBA4();
    uint64_t v11 = MEMORY[0x1D9458E50](&type metadata for TransportRequest, v10);
    sub_1D5951500(v11, v12, v15);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5947000, v4, v5, "Unregistering request handler (%{public}s): %{public}s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v7, -1, -1);
    MEMORY[0x1D945AAC0](v6, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v13 = v1[3];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v13 + 16));
  swift_beginAccess();
  uint64_t v14 = sub_1D5AAFAF8(v2);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v13 + 16));
  if (v14) {
    sub_1D5A0A7B0(v14);
  }
}

Swift::Void __swiftcall TransportDispatchService.unregister(event:)(SeymourClient::TransportEvent event)
{
  char v2 = *(unsigned char *)event;
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D5AB4B50();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBDE5400);
  swift_retain();
  unsigned int v4 = sub_1D5AB4B30();
  os_log_type_t v5 = sub_1D5AB5430();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v15[0] = v7;
    *(_DWORD *)uint64_t v6 = 136446466;
    uint64_t v8 = v1[4];
    unint64_t v9 = v1[5];
    swift_bridgeObjectRetain();
    sub_1D5951500(v8, v9, v15);
    sub_1D5AB5680();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2082;
    unint64_t v10 = sub_1D5AAF514();
    uint64_t v11 = MEMORY[0x1D9458E50](&type metadata for TransportEvent, v10);
    sub_1D5951500(v11, v12, v15);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5947000, v4, v5, "Unregistering event handler (%{public}s): %{public}s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v7, -1, -1);
    MEMORY[0x1D945AAC0](v6, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v13 = v1[3];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v13 + 16));
  swift_beginAccess();
  uint64_t v14 = sub_1D5AAFBF8(v2);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v13 + 16));
  if (v14) {
    sub_1D5A0A7B0(v14);
  }
}

uint64_t sub_1D5AA9E04()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1D5AB2B90();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  v98 = &v89[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v100 = &v89[-v7];
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  unint64_t v10 = &v89[-v9];
  MEMORY[0x1F4188790](v8);
  unint64_t v12 = &v89[-v11];
  uint64_t v13 = sub_1D5AB11A4((unint64_t *)&qword_1EA727E10, MEMORY[0x1E4F9C878]);
  uint64_t v14 = *(void *)(sub_1D5AB5BA0() + 16);
  swift_bridgeObjectRelease();
  v109 = *(NSObject **)(v3 + 16);
  ((void (*)(unsigned char *, uint64_t, uint64_t))v109)(v12, v1, v2);
  uint64_t v99 = v3 + 16;
  if (v14)
  {
    v96 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    uint64_t v97 = v3;
    v96(v12, v2);
  }
  else
  {
    char v15 = (void *)sub_1D5AB5B70();
    __int16 v16 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    v16(v12, v2);

    if (!v15)
    {
      ((void (*)(unsigned char *, uint64_t, uint64_t))v109)(v10, v1, v2);
      uint64_t v78 = sub_1D5AB5AD0();
      if (v78)
      {
        id v79 = (id)v78;
        v16(v10, v2);
      }
      else
      {
        id v79 = (id)swift_allocError();
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v3 + 32))(v88, v10, v2);
      }
      return (uint64_t)v79;
    }
    v96 = v16;
    uint64_t v97 = v3;
  }
  uint64_t v17 = sub_1D5AB5BA0();
  uint64_t v102 = v13;
  uint64_t v103 = v2;
  uint64_t v104 = v1;
  uint64_t v18 = sub_1D5AB5B70();
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = sub_1D5AB4DF0();
    uint64_t v22 = v21;
    swift_getErrorValue();
    char v23 = (void *)Error.sanitized()(v112, v113);
    swift_getErrorValue();
    uint64_t v24 = v110;
    uint64_t v25 = v111;
    *((void *)&v121 + 1) = v111;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v120);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(boxed_opaque_existential_1, v24, v25);

    sub_1D5979A10(&v120, &v118);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v117[0] = v17;
    sub_1D5975ED8(&v118, v20, v22, isUniquelyReferenced_nonNull_native);
    uint64_t v17 = *(void *)&v117[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = v109;
  uint64_t v29 = *(void *)(v17 + 64);
  uint64_t v106 = v17 + 64;
  uint64_t v30 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v31 = -1;
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  unint64_t v32 = v31 & v29;
  unint64_t v33 = (unint64_t)(v30 + 63) >> 6;
  v108 = v119;
  uint64_t v94 = *MEMORY[0x1E4F281F8];
  unint64_t v91 = v33 - 1;
  swift_bridgeObjectRetain();
  int v101 = 0;
  unint64_t v34 = 0;
  int64_t v107 = v33;
  uint64_t v92 = v17 + 112;
  unint64_t v93 = v33 - 6;
  uint64_t v95 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v105 = v17;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        if (v32)
        {
          unint64_t v36 = __clz(__rbit64(v32));
          v32 &= v32 - 1;
          unint64_t v37 = v36 | (v34 << 6);
          goto LABEL_14;
        }
        int64_t v41 = v34 + 1;
        if (__OFADD__(v34, 1))
        {
          __break(1u);
          goto LABEL_80;
        }
        if (v41 >= v107)
        {
          unint64_t v43 = v34;
        }
        else
        {
          unint64_t v42 = *(void *)(v106 + 8 * v41);
          if (v42) {
            goto LABEL_18;
          }
          int64_t v46 = v34 + 2;
          unint64_t v43 = v34 + 1;
          if ((uint64_t)(v34 + 2) < v107)
          {
            unint64_t v42 = *(void *)(v106 + 8 * v46);
            if (v42) {
              goto LABEL_27;
            }
            unint64_t v43 = v34 + 2;
            if ((uint64_t)(v34 + 3) < v107)
            {
              unint64_t v42 = *(void *)(v106 + 8 * (v34 + 3));
              if (v42)
              {
                int64_t v41 = v34 + 3;
LABEL_18:
                unint64_t v32 = (v42 - 1) & v42;
                unint64_t v37 = __clz(__rbit64(v42)) + (v41 << 6);
                unint64_t v34 = v41;
LABEL_14:
                uint64_t v38 = *(void *)(v17 + 56);
                unint64_t v39 = (void *)(*(void *)(v17 + 48) + 16 * v37);
                uint64_t v40 = v39[1];
                *(void *)&long long v118 = *v39;
                *((void *)&v118 + 1) = v40;
                sub_1D5951F00(v38 + 32 * v37, (uint64_t)v108);
                swift_bridgeObjectRetain();
                goto LABEL_21;
              }
              int64_t v46 = v34 + 4;
              unint64_t v43 = v34 + 3;
              if ((uint64_t)(v34 + 4) < v107)
              {
                unint64_t v42 = *(void *)(v106 + 8 * v46);
                if (v42)
                {
LABEL_27:
                  int64_t v41 = v46;
                  goto LABEL_18;
                }
                int64_t v41 = v34 + 5;
                unint64_t v43 = v34 + 4;
                if ((uint64_t)(v34 + 5) < v107)
                {
                  unint64_t v42 = *(void *)(v106 + 8 * v41);
                  if (v42) {
                    goto LABEL_18;
                  }
                  while (v93 != v34)
                  {
                    unint64_t v42 = *(void *)(v92 + 8 * v34++);
                    if (v42)
                    {
                      int64_t v41 = v34 + 5;
                      goto LABEL_18;
                    }
                  }
                  unint64_t v43 = v91;
                }
              }
            }
          }
        }
        unint64_t v32 = 0;
        memset(v119, 0, sizeof(v119));
        unint64_t v34 = v43;
        long long v118 = 0u;
LABEL_21:
        sub_1D59799AC((uint64_t)&v118, (uint64_t)&v120, &qword_1EBDE3700);
        uint64_t v13 = *((void *)&v120 + 1);
        if (!*((void *)&v120 + 1))
        {
          swift_release();
          uint64_t v13 = v103;
          uint64_t v17 = v104;
          if ((v101 & 1) == 0)
          {
LABEL_76:
            sub_1D5AB5B90();
            uint64_t v83 = sub_1D5AB5B80();
            id v84 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
            uint64_t v85 = (void *)sub_1D5AB4DE0();
            swift_bridgeObjectRelease();
            uint64_t v86 = (void *)sub_1D5AB4D60();
            swift_bridgeObjectRelease();
            id v79 = objc_msgSend(v84, sel_initWithDomain_code_userInfo_, v85, v83, v86);

            return (uint64_t)v79;
          }
          if (qword_1EBDE5420 == -1)
          {
LABEL_67:
            uint64_t v69 = sub_1D5AB4B50();
            __swift_project_value_buffer(v69, (uint64_t)qword_1EBDE5400);
            uint64_t v70 = v100;
            ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v100, v17, v13);
            uint64_t v71 = sub_1D5AB4B30();
            os_log_type_t v72 = sub_1D5AB5410();
            v109 = v71;
            BOOL v73 = os_log_type_enabled(v71, v72);
            uint64_t v74 = v98;
            if (v73)
            {
              uint64_t v75 = v28;
              uint64_t v76 = (uint8_t *)swift_slowAlloc();
              v108 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v76 = 138412290;
              ((void (*)(unsigned char *, unsigned char *, uint64_t))v75)(v74, v70, v13);
              if (sub_1D5AB5AD0())
              {
                uint64_t v77 = v96;
                v96(v74, v13);
              }
              else
              {
                swift_allocError();
                (*(void (**)(uint64_t, unsigned char *, uint64_t))(v97 + 32))(v80, v74, v13);
                uint64_t v77 = v96;
              }
              uint64_t v81 = _swift_stdlib_bridgeErrorToNSError();
              *(void *)&long long v120 = v81;
              sub_1D5AB5680();
              uint64_t v82 = (uint64_t)v108;
              void *v108 = v81;
              v77(v100, v13);
              _os_log_impl(&dword_1D5947000, v109, v72, "Found Errors from Core Data, original error before sanitization: %@", v76, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EA725C30);
              swift_arrayDestroy();
              MEMORY[0x1D945AAC0](v82, -1, -1);
              MEMORY[0x1D945AAC0](v76, -1, -1);
            }
            else
            {
              v96(v70, v13);
            }

            goto LABEL_76;
          }
LABEL_80:
          swift_once();
          goto LABEL_67;
        }
        uint64_t v44 = v120;
        sub_1D5979A10(&v121, v117);
        if (v44 == sub_1D5AB4DF0() && v45 == v13)
        {
          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        char v35 = sub_1D5AB5AF0();
        swift_bridgeObjectRelease();
        if (v35) {
          goto LABEL_11;
        }
        sub_1D5951F00((uint64_t)v117, (uint64_t)&v118);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE3710);
        if (!swift_dynamicCast())
        {
          sub_1D5951F00((uint64_t)v117, (uint64_t)&v118);
          goto LABEL_35;
        }
        swift_unknownObjectRelease();
        sub_1D5951F00((uint64_t)v117, (uint64_t)&v118);
        sub_1D5951F00((uint64_t)&v118, (uint64_t)v116);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3720);
        char v47 = swift_dynamicCast();
        sub_1D5951F00((uint64_t)&v118, (uint64_t)v116);
        if (v47)
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v116);
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v118);
          sub_1D5951F00((uint64_t)v117, (uint64_t)v116);
LABEL_36:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v116);
          break;
        }
        sub_1D5979A10(v116, v115);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3728);
        char v66 = swift_dynamicCast();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v118);
        sub_1D5951F00((uint64_t)v117, (uint64_t)v116);
        if (v66) {
          goto LABEL_36;
        }
        sub_1D5979A10(v116, v115);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3708);
        if (swift_dynamicCast())
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v118);
          if ((sub_1D5AAAB1C((uint64_t)v117) & 1) == 0) {
            break;
          }
        }
LABEL_11:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
        swift_bridgeObjectRelease();
        uint64_t v28 = v109;
      }
      uint64_t v48 = sub_1D5AB5B90();
      uint64_t v50 = v49;
      if (v48 == sub_1D5AB4DF0() && v50 == v51)
      {
        swift_bridgeObjectRelease_n();
        break;
      }
      int v90 = sub_1D5AB5AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v90) {
        break;
      }
      *(void *)&long long v118 = 0;
      *((void *)&v118 + 1) = 0xE000000000000000;
      sub_1D5AB58C0();
      v119[1] = MEMORY[0x1E4FBB1A0];
      sub_1D5979A10(&v118, v115);
      os_log_t v67 = (void *)v105;
      char v68 = swift_isUniquelyReferenced_nonNull_native();
      v114 = v67;
      sub_1D5975ED8(v115, v44, v13, v68);
      uint64_t v105 = (uint64_t)v114;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
      uint64_t v28 = v109;
    }
    v119[1] = MEMORY[0x1E4FBB1A0];
    *(void *)&long long v118 = 0x657070697274733CLL;
    *((void *)&v118 + 1) = 0xEA00000000003E64;
    sub_1D5979A10(&v118, v115);
    uint64_t v52 = (void *)v105;
    int v101 = swift_isUniquelyReferenced_nonNull_native();
    v114 = v52;
    unint64_t v54 = sub_1D5952584(v44, v13);
    uint64_t v55 = v52[2];
    BOOL v56 = (v53 & 1) == 0;
    uint64_t v57 = v55 + v56;
    if (__OFADD__(v55, v56)) {
      break;
    }
    if (v52[3] >= v57)
    {
      if ((v101 & 1) == 0)
      {
        LODWORD(v105) = v53;
        sub_1D59776F8();
        LOBYTE(v53) = v105;
      }
    }
    else
    {
      LODWORD(v105) = v53;
      sub_1D59748A0(v57, v101);
      unint64_t v58 = sub_1D5952584(v44, v13);
      int v59 = v53 & 1;
      LOBYTE(v53) = v105;
      if ((v105 & 1) != v59) {
        goto LABEL_83;
      }
      unint64_t v54 = v58;
    }
    uint64_t v60 = v114;
    uint64_t v105 = (uint64_t)v114;
    if (v53)
    {
      uint64_t v61 = (_OWORD *)(v114[7] + 32 * v54);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v61);
      sub_1D5979A10(v115, v61);
    }
    else
    {
      v114[(v54 >> 6) + 8] |= 1 << v54;
      uint64_t v62 = (uint64_t *)(v60[6] + 16 * v54);
      uint64_t *v62 = v44;
      v62[1] = v13;
      sub_1D5979A10(v115, (_OWORD *)(v60[7] + 32 * v54));
      uint64_t v63 = v60[2];
      BOOL v64 = __OFADD__(v63, 1);
      uint64_t v65 = v63 + 1;
      if (v64) {
        goto LABEL_82;
      }
      v60[2] = v65;
      swift_bridgeObjectRetain();
    }
    uint64_t v28 = v109;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
    int v101 = 1;
  }
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  uint64_t result = sub_1D5AB5B50();
  __break(1u);
  return result;
}

uint64_t sub_1D5AAAB1C(uint64_t a1)
{
  uint64_t v63 = sub_1D5AB2B90();
  uint64_t v2 = *(void *)(v63 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v63);
  uint64_t v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v3);
  uint64_t v60 = (void (**)(char *, uint64_t))((char *)&v53 - v7);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v53 - v8;
  sub_1D5951F00(a1, (uint64_t)&v68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE38A0);
  uint64_t v10 = MEMORY[0x1E4FBC840] + 8;
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
    sub_1D5951F00(a1, (uint64_t)&v74);
    uint64_t v62 = (void (**)(char *, uint64_t, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3708);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v67[0] = 0;
      long long v65 = 0u;
      long long v66 = 0u;
      sub_1D594F53C((uint64_t)&v65, &qword_1EA727648);
      return 1;
    }
    sub_1D5950B78(&v65, (uint64_t)&v68);
    uint64_t v38 = __swift_project_boxed_opaque_existential_1(&v68, *((uint64_t *)&v69 + 1));
    MEMORY[0x1F4188790](v38);
    (*(void (**)(char *))(v40 + 16))((char *)&v53 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
    *((void *)&v66 + 1) = swift_getAssociatedTypeWitness();
    v67[0] = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
    sub_1D5AB4F50();
    uint64_t v60 = (void (**)(char *, uint64_t))(v2 + 8);
    int64_t v61 = v2 + 16;
    uint64_t v59 = MEMORY[0x1E4FBC840] + 8;
    while (1)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v65, *((uint64_t *)&v66 + 1));
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      uint64_t v42 = sub_1D5AB5620();
      uint64_t v43 = *(void *)(v42 - 8);
      MEMORY[0x1F4188790](v42);
      uint64_t v45 = (char *)&v53 - v44;
      sub_1D5AB5670();
      uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v45, 1, AssociatedTypeWitness) == 1)
      {
        (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v42);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v68);
        return 1;
      }
      uint64_t v75 = AssociatedTypeWitness;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v74);
      (*(void (**)(uint64_t *, char *, uint64_t))(v46 + 32))(boxed_opaque_existential_1, v45, AssociatedTypeWitness);
      sub_1D5979A10(&v74, &v77);
      sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
      if (swift_dynamicCast())
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v74);
        uint64_t v48 = v63;
        (*(void (**)(char *, uint64_t, uint64_t))v61)(v5, v64, v63);
        sub_1D5951F00((uint64_t)&v77, (uint64_t)&v74);
        char v49 = sub_1D5AAAB1C(&v74);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v74);
        (*v60)(v5, v48);
        if ((v49 & 1) == 0) {
          goto LABEL_71;
        }
      }
      else
      {
        uint64_t v50 = v63;
        (*(void (**)(char *, uint64_t, uint64_t))v61)(v5, v64, v63);
        sub_1D5951F00((uint64_t)&v77, (uint64_t)&v74);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v74);
        (*v60)(v5, v50);
      }
      sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE3710);
      if (!swift_dynamicCast()) {
        break;
      }
      swift_unknownObjectRelease();
      sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
      sub_1D5951F00((uint64_t)v76, (uint64_t)v73);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3720);
      char v51 = swift_dynamicCast();
      sub_1D5951F00((uint64_t)v76, (uint64_t)v73);
      if (v51)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
        goto LABEL_70;
      }
      sub_1D5979A10(v73, v72);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3728);
      char v52 = swift_dynamicCast();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
      if (v52) {
        goto LABEL_71;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v77);
    }
    sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
LABEL_70:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
LABEL_71:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v77);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v68);
    return 0;
  }
  int64_t v61 = 0;
  uint64_t v12 = *(void *)(v65 + 64);
  uint64_t v55 = v65 + 64;
  uint64_t v59 = v65;
  uint64_t v13 = 1 << *(unsigned char *)(v65 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  uint64_t v57 = &v67[1];
  unint64_t v58 = &v71;
  uint64_t v62 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  __int16 v16 = (void (**)(char *, uint64_t))(v2 + 8);
  int64_t v56 = (unint64_t)(v13 + 63) >> 6;
  int64_t v54 = v56 - 1;
  uint64_t v17 = v63;
  if ((v14 & v12) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v18 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  unint64_t v19 = v18 | (v61 << 6);
LABEL_6:
  uint64_t v20 = v59;
  sub_1D5952D54(*(void *)(v59 + 48) + 40 * v19, (uint64_t)&v65);
  sub_1D5951F00(*(void *)(v20 + 56) + 32 * v19, (uint64_t)v57);
  while (1)
  {
    sub_1D59799AC((uint64_t)&v65, (uint64_t)&v68, (uint64_t *)&unk_1EA727650);
    if (!*((void *)&v69 + 1))
    {
      swift_release();
      return 1;
    }
    sub_1D5979A10(v58, &v74);
    uint64_t v78 = MEMORY[0x1E4FBB960];
    uint64_t v24 = swift_allocObject();
    *(void *)&long long v77 = v24;
    long long v25 = v69;
    *(_OWORD *)(v24 + 16) = v68;
    *(_OWORD *)(v24 + 32) = v25;
    *(void *)(v24 + 48) = v70;
    sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3708);
    int v26 = swift_dynamicCast();
    if (v26) {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
    }
    uint64_t v27 = v10;
    uint64_t v28 = *v62;
    (*v62)(v9, v64, v17);
    sub_1D5951F00((uint64_t)&v77, (uint64_t)&v65);
    if (v26)
    {
      char v29 = sub_1D5AAAB1C(&v65);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
      uint64_t v30 = *v16;
      (*v16)(v9, v17);
      if ((v29 & 1) == 0) {
        goto LABEL_64;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
      uint64_t v30 = *v16;
      (*v16)(v9, v17);
    }
    sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE3710);
    if (!swift_dynamicCast())
    {
      sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
LABEL_62:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
      goto LABEL_64;
    }
    swift_unknownObjectRelease();
    sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
    sub_1D5951F00((uint64_t)v76, (uint64_t)v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3720);
    char v31 = swift_dynamicCast();
    sub_1D5951F00((uint64_t)v76, (uint64_t)v73);
    if (v31)
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
      goto LABEL_62;
    }
    sub_1D5979A10(v73, v72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3728);
    char v32 = swift_dynamicCast();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v77);
    if (v32) {
      goto LABEL_65;
    }
    sub_1D5951F00((uint64_t)&v74, (uint64_t)&v77);
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
      unint64_t v33 = v60;
      uint64_t v17 = v63;
      v28((char *)v60, v64, v63);
      sub_1D5951F00((uint64_t)&v74, (uint64_t)&v65);
      char v34 = sub_1D5AAAB1C(&v65);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
      v30((char *)v33, v17);
      if ((v34 & 1) == 0) {
        goto LABEL_65;
      }
    }
    else
    {
      char v35 = v60;
      uint64_t v17 = v63;
      v28((char *)v60, v64, v63);
      sub_1D5951F00((uint64_t)&v74, (uint64_t)&v65);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v65);
      v30((char *)v35, v17);
    }
    sub_1D5951F00((uint64_t)&v74, (uint64_t)&v77);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE3710);
    if (!swift_dynamicCast()) {
      break;
    }
    swift_unknownObjectRelease();
    sub_1D5951F00((uint64_t)&v74, (uint64_t)&v77);
    sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3720);
    char v36 = swift_dynamicCast();
    sub_1D5951F00((uint64_t)&v77, (uint64_t)v76);
    if (v36) {
      goto LABEL_62;
    }
    sub_1D5979A10(v76, v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3728);
    char v37 = swift_dynamicCast();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v77);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v74);
    if (v37) {
      goto LABEL_66;
    }
    uint64_t v10 = v27;
    if (v15) {
      goto LABEL_5;
    }
LABEL_7:
    int64_t v21 = v61 + 1;
    if (__OFADD__(v61, 1))
    {
      __break(1u);
      goto LABEL_74;
    }
    if (v21 < v56)
    {
      unint64_t v22 = *(void *)(v55 + 8 * v21);
      if (v22) {
        goto LABEL_10;
      }
      int64_t v23 = v61 + 2;
      ++v61;
      if (v21 + 1 < v56)
      {
        unint64_t v22 = *(void *)(v55 + 8 * v23);
        if (v22) {
          goto LABEL_13;
        }
        int64_t v61 = v21 + 1;
        if (v21 + 2 < v56)
        {
          unint64_t v22 = *(void *)(v55 + 8 * (v21 + 2));
          if (v22)
          {
            v21 += 2;
            goto LABEL_10;
          }
          int64_t v61 = v21 + 2;
          if (v21 + 3 < v56)
          {
            unint64_t v22 = *(void *)(v55 + 8 * (v21 + 3));
            if (v22)
            {
              v21 += 3;
              goto LABEL_10;
            }
            int64_t v23 = v21 + 4;
            int64_t v61 = v21 + 3;
            if (v21 + 4 < v56)
            {
              unint64_t v22 = *(void *)(v55 + 8 * v23);
              if (!v22)
              {
                while (1)
                {
                  int64_t v21 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    break;
                  }
                  if (v21 >= v56)
                  {
                    int64_t v61 = v54;
                    goto LABEL_27;
                  }
                  unint64_t v22 = *(void *)(v55 + 8 * v21);
                  ++v23;
                  if (v22) {
                    goto LABEL_10;
                  }
                }
LABEL_74:
                __break(1u);
                return result;
              }
LABEL_13:
              int64_t v21 = v23;
LABEL_10:
              unint64_t v15 = (v22 - 1) & v22;
              unint64_t v19 = __clz(__rbit64(v22)) + (v21 << 6);
              int64_t v61 = v21;
              goto LABEL_6;
            }
          }
        }
      }
    }
LABEL_27:
    unint64_t v15 = 0;
    memset(v67, 0, 40);
    long long v65 = 0u;
    long long v66 = 0u;
  }
  sub_1D5951F00((uint64_t)&v74, (uint64_t)&v77);
LABEL_64:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v77);
LABEL_65:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v74);
LABEL_66:
  swift_release();
  return 0;
}

void *TransportDispatchService.init(queue:label:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1E4FBC868];
  void v3[6] = MEMORY[0x1E4FBC868];
  v3[7] = v4;
  v3[2] = a1;
  v3[4] = a2;
  v3[5] = a3;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = 0;
  v3[3] = v5;
  return v3;
}

uint64_t sub_1D5AAB7F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBDE4070);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  a5(v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4E10);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1) {
    return sub_1D594F53C((uint64_t)v11, qword_1EBDE4070);
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  swift_retain();
  __int16 v16 = (void (*)(uint64_t (*)(), uint64_t))sub_1D5AB45B0();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_1D5AB13D0;
  *(void *)(v17 + 24) = v15;
  swift_retain();
  v16(sub_1D598A1CC, v17);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v11, v12);
}

void sub_1D5AAB9C0(__int16 *a1, uint64_t a2, uint64_t a3)
{
  __int16 v6 = *a1;
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D5AB4B50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE5400);
  swift_retain();
  uint64_t v8 = sub_1D5AB4B30();
  os_log_type_t v9 = sub_1D5AB5430();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v19 = a3;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v20[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v13 = v3[4];
    unint64_t v12 = v3[5];
    swift_bridgeObjectRetain();
    sub_1D5951500(v13, v12, v20);
    sub_1D5AB5680();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    unint64_t v14 = sub_1D5AAFBA4();
    uint64_t v15 = MEMORY[0x1D9458E50](&type metadata for TransportRequest, v14);
    sub_1D5951500(v15, v16, v20);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5947000, v8, v9, "Registering request handler (%{public}s): %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v11, -1, -1);
    uint64_t v17 = v10;
    a3 = v19;
    MEMORY[0x1D945AAC0](v17, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v18 = v3[3];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v18 + 16));
  sub_1D5AADF10(v3, v6, a2, a3);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v18 + 16));
}

uint64_t sub_1D5AABBFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE4C10);
  MEMORY[0x1F4188790](v10 - 8);
  unint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1D5AB51C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a5;
  v14[5] = a6;
  v14[6] = a3;
  v14[7] = a4;
  swift_retain();
  swift_retain();
  sub_1D59F48C8((uint64_t)v12, (uint64_t)&unk_1EA728448, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1D5AABD1C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[16] = a6;
  v7[17] = a7;
  uint64_t v10 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[18] = v8;
  void *v8 = v7;
  v8[1] = sub_1D5AABDEC;
  return v10();
}

uint64_t sub_1D5AABDEC()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5AABF88;
  }
  else {
    uint64_t v2 = sub_1D5AABF00;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5AABF00()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 128);
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(unsigned char *)(v0 + 120) = 0;
  *(_OWORD *)(v0 + 72) = 0u;
  v1(v0 + 72);
  sub_1D5AB0CB0(v0 + 72);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1D5AABF88()
{
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 128);
  *(void *)(v0 + 16) = v1;
  *(unsigned char *)(v0 + 64) = 1;
  id v3 = v1;
  v2(v0 + 16);

  sub_1D5AB0CB0(v0 + 16);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1D5AAC024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = sub_1D5AB45D0();
  uint64_t v15 = sub_1D5AB5620();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v23 - v18;
  a5(v17);
  uint64_t v20 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v19, 1, v14) != 1)
  {
    int64_t v21 = (void *)swift_allocObject();
    v21[2] = a7;
    v21[3] = a8;
    v21[4] = a9;
    v21[5] = a3;
    v21[6] = a4;
    swift_retain();
    sub_1D5AB45A0();
    swift_release();
    uint64_t v16 = v20;
    uint64_t v15 = v14;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
}

uint64_t sub_1D5AAC1E0(uint64_t a1, void (*a2)(unsigned char *))
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EBDE5130);
  uint64_t v4 = sub_1D5AB5CB0();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 16))(&v9[-v5 - 8], a1);
  sub_1D5AB2E10();
  a2(v9);
  return sub_1D5AB0CB0((uint64_t)v9);
}

uint64_t sub_1D5AAC30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE4C10);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1D5AB51C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = a7;
  v19[5] = a8;
  v19[6] = a9;
  v19[7] = a5;
  v19[8] = a6;
  v19[9] = a3;
  v19[10] = a4;
  swift_retain();
  swift_retain();
  sub_1D59F48C8((uint64_t)v17, (uint64_t)&unk_1EA728438, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_1D5AAC450(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = v16;
  v8[20] = v17;
  v8[17] = a7;
  v8[18] = a8;
  v8[16] = a6;
  uint64_t v10 = sub_1D5AB5620();
  v8[21] = v10;
  v8[22] = *(void *)(v10 - 8);
  v8[23] = swift_task_alloc();
  uint64_t v11 = swift_task_alloc();
  v8[24] = v11;
  uint64_t v14 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  unint64_t v12 = (void *)swift_task_alloc();
  v8[25] = v12;
  void *v12 = v8;
  v12[1] = sub_1D5AAC5B8;
  return v14(v11);
}

uint64_t sub_1D5AAC5B8()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5AAC85C;
  }
  else {
    uint64_t v2 = sub_1D5AAC6CC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5AAC6CC()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 144);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 176) + 16))(v1, *(void *)(v0 + 192), *(void *)(v0 + 168));
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = *(void *)(v0 + 184);
  if (v4 == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 168));
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 160);
    long long v14 = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v0 + 96) = v14;
    *(void *)(v0 + 112) = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 72));
    (*(void (**)(uint64_t *, uint64_t, void))(v3 + 32))(boxed_opaque_existential_1, v5, v14);
  }
  uint64_t v8 = *(void *)(v0 + 192);
  uint64_t v9 = *(void *)(v0 + 168);
  uint64_t v10 = *(void *)(v0 + 176);
  uint64_t v11 = *(void (**)(uint64_t))(v0 + 128);
  *(unsigned char *)(v0 + 120) = 0;
  v11(v0 + 72);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  sub_1D5AB0CB0(v0 + 72);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_1D5AAC85C()
{
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 128);
  *(void *)(v0 + 16) = v1;
  *(unsigned char *)(v0 + 64) = 1;
  id v3 = v1;
  v2(v0 + 16);

  sub_1D5AB0CB0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  int v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1D5AAC908(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7)
{
  uint64_t v27 = a5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBDE4070);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a7 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D59A0188(a1, a2);
  sub_1D5AB3E30();
  uint64_t v26 = a4;
  v27(v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE4E10);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = v16;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v15, 1, v19) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, a7);
    return sub_1D594F53C((uint64_t)v15, qword_1EBDE4070);
  }
  else
  {
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a3;
    *(void *)(v23 + 24) = v26;
    swift_retain();
    uint64_t v24 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_1D5AB45B0();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = sub_1D5AB0E94;
    *(void *)(v25 + 24) = v23;
    swift_retain();
    v24(sub_1D59893E0, v25);
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, a7);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v15, v19);
  }
}

uint64_t sub_1D5AACC10(uint64_t a1, void (*a2)(unsigned char *))
{
  sub_1D596E9F4(*(id *)a1, *(unsigned char *)(a1 + 8));
  sub_1D5AB2E20();
  a2(v4);
  return sub_1D5AB0CB0((uint64_t)v4);
}

uint64_t sub_1D5AACC7C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v24 = a3;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE4C10);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1D5AB51C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t v20[2] = 0;
  v20[3] = 0;
  v20[4] = a7;
  v20[5] = a8;
  v20[6] = a9;
  v20[7] = a1;
  v20[8] = a2;
  v20[9] = a5;
  uint64_t v21 = v24;
  v20[10] = a6;
  v20[11] = v21;
  v20[12] = a4;
  sub_1D59A0188(a1, a2);
  swift_retain();
  swift_retain();
  sub_1D59F48C8((uint64_t)v18, (uint64_t)&unk_1EA728428, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_1D5AACDE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[22] = v12;
  v8[23] = v13;
  v8[20] = a8;
  v8[21] = v11;
  v8[18] = a6;
  v8[19] = a7;
  v8[16] = a4;
  v8[17] = a5;
  v8[24] = *(void *)(v12 - 8);
  v8[25] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D5AACEAC, 0, 0);
}

uint64_t sub_1D5AACEAC()
{
  sub_1D59A0188(v0[16], v0[17]);
  sub_1D5AB3E30();
  int v4 = (uint64_t (*)(uint64_t))(v0[18] + *(int *)v0[18]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[26] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D5AAD044;
  uint64_t v2 = v0[25];
  return v4(v2);
}

uint64_t sub_1D5AAD044()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5AAD218;
  }
  else {
    uint64_t v2 = sub_1D5AAD158;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5AAD158()
{
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 176);
  uint64_t v4 = *(void (**)(uint64_t))(v0 + 160);
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(unsigned char *)(v0 + 120) = 0;
  *(_OWORD *)(v0 + 72) = 0u;
  v4(v0 + 72);
  sub_1D5AB0CB0(v0 + 72);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1D5AAD218()
{
  (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 176));
  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 160);
  *(void *)(v0 + 16) = v1;
  *(unsigned char *)(v0 + 64) = 1;
  id v3 = v1;
  v2(v0 + 16);

  sub_1D5AB0CB0(v0 + 16);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1D5AAD2D4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  v28[1] = a6;
  char v29 = a5;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v30 = sub_1D5AB45D0();
  uint64_t v16 = sub_1D5AB5620();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)v28 - v19;
  uint64_t v21 = *(void *)(a7 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v23 = (char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D59A0188(a1, a2);
  sub_1D5AB3E30();
  v28[0] = v21;
  v29(v23);
  uint64_t v24 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v24 + 48))(v20, 1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v28[0] + 8))(v23, a7);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  }
  else
  {
    uint64_t v26 = (void *)swift_allocObject();
    v26[2] = a7;
    v26[3] = a8;
    v26[4] = a9;
    v26[5] = a10;
    v26[6] = a11;
    v26[7] = a12;
    v26[8] = v31;
    v26[9] = v32;
    swift_retain();
    uint64_t v27 = v30;
    sub_1D5AB45A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v28[0] + 8))(v23, a7);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v20, v27);
  }
}

uint64_t sub_1D5AAD5D8(uint64_t a1, void (*a2)(unsigned char *))
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EBDE5130);
  uint64_t v4 = sub_1D5AB5CB0();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 16))(&v9[-v5 - 8], a1);
  sub_1D5AB2E10();
  a2(v9);
  return sub_1D5AB0CB0((uint64_t)v9);
}

uint64_t sub_1D5AAD704(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11)
{
  uint64_t v24 = a5;
  uint64_t v25 = a3;
  long long v23 = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE4C10);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1D5AB51C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  *(void *)(v21 + 32) = a7;
  *(void *)(v21 + 40) = a8;
  *(_OWORD *)(v21 + 48) = v23;
  *(void *)(v21 + 64) = a10;
  *(void *)(v21 + 72) = a11;
  *(void *)(v21 + 80) = a1;
  *(void *)(v21 + 88) = a2;
  *(void *)(v21 + 96) = v24;
  *(void *)(v21 + 104) = a6;
  *(void *)(v21 + 112) = v25;
  *(void *)(v21 + 120) = a4;
  sub_1D59A0188(a1, a2);
  swift_retain();
  swift_retain();
  sub_1D59F48C8((uint64_t)v19, (uint64_t)&unk_1EA728410, v21);
  return swift_release();
}

uint64_t sub_1D5AAD878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[25] = v16;
  v8[26] = v17;
  v8[23] = v14;
  v8[24] = v15;
  v8[21] = v12;
  v8[22] = v13;
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  uint64_t v9 = sub_1D5AB5620();
  v8[27] = v9;
  v8[28] = *(void *)(v9 - 8);
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = *(void *)(v13 - 8);
  v8[32] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D5AAD9BC, 0, 0);
}

uint64_t sub_1D5AAD9BC()
{
  sub_1D59A0188(v0[16], v0[17]);
  sub_1D5AB3E30();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(v0[18] + *(int *)v0[18]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[33] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1D5AADB70;
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[30];
  return v5(v3, v2);
}

uint64_t sub_1D5AADB70()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1D5AADE40;
  }
  else {
    uint64_t v2 = sub_1D5AADC84;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D5AADC84()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 184);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 224) + 16))(v1, *(void *)(v0 + 240), *(void *)(v0 + 216));
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = *(void *)(v0 + 232);
  if (v4 == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 224) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 216));
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 184);
    *(void *)(v0 + 96) = v6;
    *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 200);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 72));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_1, v5, v6);
  }
  uint64_t v9 = *(void *)(v0 + 248);
  uint64_t v8 = *(void *)(v0 + 256);
  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v11 = *(void *)(v0 + 216);
  uint64_t v12 = *(void *)(v0 + 224);
  uint64_t v13 = *(void *)(v0 + 176);
  uint64_t v14 = *(void (**)(uint64_t))(v0 + 160);
  *(unsigned char *)(v0 + 120) = 0;
  v14(v0 + 72);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v13);
  sub_1D5AB0CB0(v0 + 72);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_1D5AADE40()
{
  (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 176));
  uint64_t v1 = *(void **)(v0 + 272);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 160);
  *(void *)(v0 + 16) = v1;
  *(unsigned char *)(v0 + 64) = 1;
  id v3 = v1;
  v2(v0 + 16);

  sub_1D5AB0CB0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1D5AADF10(void *a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a1 + 6;
  swift_beginAccess();
  if (*(void *)(a1[6] + 16))
  {
    sub_1D5952680(a2);
    char v10 = v9;
    swift_endAccess();
    if (v10)
    {
      if (qword_1EBDE5420 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1D5AB4B50();
      __swift_project_value_buffer(v11, (uint64_t)qword_1EBDE5400);
      swift_retain();
      uint64_t v12 = sub_1D5AB4B30();
      os_log_type_t v13 = sub_1D5AB5410();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        v25[0] = v24;
        *(_DWORD *)uint64_t v14 = 136446466;
        os_log_type_t type = v13;
        uint64_t v16 = a1[4];
        unint64_t v15 = a1[5];
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_1D5951500(v16, v15, v25);
        sub_1D5AB5680();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 2082;
        LOWORD(v26) = a2;
        unint64_t v17 = sub_1D5AAFBA4();
        uint64_t v18 = MEMORY[0x1D9458E50](&type metadata for TransportRequest, v17);
        uint64_t v26 = sub_1D5951500(v18, v19, v25);
        sub_1D5AB5680();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D5947000, v12, type, "Overwriting existing handler (%{public}s): %{public}s", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D945AAC0](v24, -1, -1);
        MEMORY[0x1D945AAC0](v14, -1, -1);
      }
      else
      {

        swift_release();
      }
    }
  }
  else
  {
    swift_endAccess();
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v26 = *v8;
  uint64_t *v8 = 0x8000000000000000;
  sub_1D597602C((uint64_t)sub_1D5AB1170, v20, a2, isUniquelyReferenced_nonNull_native);
  uint64_t *v8 = v26;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1D5AAE208(uint64_t *a1, uint64_t *a2, void (*a3)(uint64_t, uint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  swift_retain();
  a3(v4, v5, sub_1D5AB1178, v8);
  return swift_release();
}

uint64_t sub_1D5AAE2AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_1D5AAE2DC(char *a1, uint64_t a2, uint64_t a3)
{
  char v6 = *a1;
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D5AB4B50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE5400);
  swift_retain();
  uint64_t v8 = sub_1D5AB4B30();
  os_log_type_t v9 = sub_1D5AB5430();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v19 = a3;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v20[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v13 = v3[4];
    unint64_t v12 = v3[5];
    swift_bridgeObjectRetain();
    sub_1D5951500(v13, v12, v20);
    sub_1D5AB5680();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    unint64_t v14 = sub_1D5AAF514();
    uint64_t v15 = MEMORY[0x1D9458E50](&type metadata for TransportEvent, v14);
    sub_1D5951500(v15, v16, v20);
    sub_1D5AB5680();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5947000, v8, v9, "Registering event handler (%{public}s): %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D945AAC0](v11, -1, -1);
    uint64_t v17 = v10;
    a3 = v19;
    MEMORY[0x1D945AAC0](v17, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v18 = v3[3];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v18 + 16));
  sub_1D5AAE7DC(v3, v6, a2, a3);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v18 + 16));
}

void sub_1D5AAE518(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a5 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D59A0188(v9, v12);
  sub_1D5AB3E30();
  if (v5)
  {
    if (qword_1EBDE5420 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1D5AB4B50();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EBDE5400);
    id v14 = v5;
    id v15 = v5;
    unint64_t v16 = sub_1D5AB4B30();
    os_log_type_t v17 = sub_1D5AB5410();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v23 = v19;
      *(_DWORD *)uint64_t v18 = 136446210;
      swift_getErrorValue();
      uint64_t v20 = MEMORY[0x1D9459FA0](v22[3], v22[4]);
      v22[1] = sub_1D5951500(v20, v21, &v23);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D5947000, v16, v17, "Error deserializing event payload: %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D945AAC0](v19, -1, -1);
      MEMORY[0x1D945AAC0](v18, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    a3(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a5);
  }
}

uint64_t sub_1D5AAE7DC(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a1 + 7;
  swift_beginAccess();
  if (*(void *)(a1[7] + 16))
  {
    sub_1D59526F8(a2);
    char v10 = v9;
    swift_endAccess();
    if (v10)
    {
      if (qword_1EBDE5420 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1D5AB4B50();
      __swift_project_value_buffer(v11, (uint64_t)qword_1EBDE5400);
      swift_retain();
      unint64_t v12 = sub_1D5AB4B30();
      os_log_type_t v13 = sub_1D5AB5410();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        v25[0] = v24;
        *(_DWORD *)uint64_t v14 = 136315394;
        os_log_type_t type = v13;
        uint64_t v16 = a1[4];
        unint64_t v15 = a1[5];
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_1D5951500(v16, v15, v25);
        sub_1D5AB5680();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 2082;
        LOBYTE(v26) = a2;
        unint64_t v17 = sub_1D5AAF514();
        uint64_t v18 = MEMORY[0x1D9458E50](&type metadata for TransportEvent, v17);
        uint64_t v26 = sub_1D5951500(v18, v19, v25);
        sub_1D5AB5680();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D5947000, v12, type, "Overwriting existing handler (%s): %{public}s", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D945AAC0](v24, -1, -1);
        MEMORY[0x1D945AAC0](v14, -1, -1);
      }
      else
      {

        swift_release();
      }
    }
  }
  else
  {
    swift_endAccess();
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v26 = *v8;
  uint64_t *v8 = 0x8000000000000000;
  sub_1D597616C((uint64_t)sub_1D5AB1350, v20, a2, isUniquelyReferenced_nonNull_native);
  uint64_t *v8 = v26;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1D5AAEAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void *, void *))
{
  v11[0] = a1;
  v11[1] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  v10[0] = sub_1D5AB1224;
  v10[1] = v8;
  swift_retain();
  a5(v11, v10);
  return swift_release();
}

void sub_1D5AAEB78(void (*a1)(uint64_t, uint64_t, void (*)(uint64_t a1), uint64_t), uint64_t a2, uint64_t a3, int a4, void (*a5)(void, unint64_t, void *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = sub_1D5AB2B90();
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a5;
    *(void *)(v19 + 24) = a6;
    sub_1D5A0A740((uint64_t)a1);
    swift_retain();
    a1(a7, a8, sub_1D5AB124C, v19);
    swift_release();
    sub_1D5A0A7B0((uint64_t)a1);
  }
  else
  {
    uint64_t v33 = a6;
    uint64_t v34 = v16;
    HIDWORD(v32) = a4;
    if (qword_1EBDE5420 != -1) {
      swift_once();
    }
    char v35 = a5;
    uint64_t v20 = sub_1D5AB4B50();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EBDE5400);
    swift_retain();
    unint64_t v21 = sub_1D5AB4B30();
    os_log_type_t v22 = sub_1D5AB5410();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v37 = v24;
      *(_DWORD *)uint64_t v23 = 136446466;
      uint64_t v25 = *(void *)(a3 + 32);
      unint64_t v26 = *(void *)(a3 + 40);
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_1D5951500(v25, v26, &v37);
      sub_1D5AB5680();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      LOWORD(v36) = WORD2(v32);
      unint64_t v27 = sub_1D5AAFBA4();
      uint64_t v28 = MEMORY[0x1D9458E50](&type metadata for TransportRequest, v27);
      uint64_t v36 = sub_1D5951500(v28, v29, &v37);
      sub_1D5AB5680();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D5947000, v21, v22, "No dispatch handler on %{public}s found for request: %{public}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D945AAC0](v24, -1, -1);
      MEMORY[0x1D945AAC0](v23, -1, -1);
    }
    else
    {

      swift_release();
    }
    uint64_t v30 = v34;
    (*(void (**)(char *, void, uint64_t))(v34 + 104))(v18, *MEMORY[0x1E4F9C860], v15);
    uint64_t v31 = (void *)sub_1D5AA9E04();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v15);
    v35(0, 0xF000000000000000, v31);
  }
}

void sub_1D5AAEF28(uint64_t a1, void (*a2)(uint64_t, unint64_t, void *))
{
  sub_1D5AB1254(a1, (uint64_t)v13);
  if (v14)
  {
    id v3 = (void *)v13[0];
    swift_getErrorValue();
    uint64_t v4 = (void *)Error.sanitized()(v11, v12);
    a2(0, 0xF000000000000000, v4);
  }
  else
  {
    sub_1D59799AC((uint64_t)v13, (uint64_t)v10, &qword_1EBDE3CD8);
    sub_1D5AB12B0((uint64_t)v10, (uint64_t)v8);
    uint64_t v5 = v9;
    if (v9)
    {
      __swift_project_boxed_opaque_existential_1(v8, v9);
      uint64_t v5 = sub_1D5AB3E40();
      unint64_t v7 = v6;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
    }
    else
    {
      sub_1D594F53C((uint64_t)v8, &qword_1EBDE3CD8);
      unint64_t v7 = 0xF000000000000000;
    }
    a2(v5, v7, 0);
    sub_1D5956DE4(v5, v7);
    sub_1D594F53C((uint64_t)v10, &qword_1EBDE3CD8);
  }
}

uint64_t sub_1D5AAF24C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t TransportDispatchService.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TransportDispatchService.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1D5AAF50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAEAD4(a1, a2, a3, a4, *(void (**)(void *, void *))(v4 + 16));
}

unint64_t sub_1D5AAF514()
{
  unint64_t result = qword_1EBDE5230;
  if (!qword_1EBDE5230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDE5230);
  }
  return result;
}

uint64_t sub_1D5AAF568(uint64_t a1, uint64_t a2)
{
  v5[1] = a2;
  id v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  return v3(v5);
}

uint64_t sub_1D5AAF5A0()
{
  swift_release();
  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >> 60 != 15) {
    sub_1D5956DF8(*(void *)(v0 + 32), v1);
  }
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D5AAF5F0()
{
  return sub_1D5AAF24C(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1D5AAF5FC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D5AAF634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAF694(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))sub_1D5AAC024);
}

uint64_t sub_1D5AAF64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAF694(a1, a2, a3, a4, sub_1D5AAC30C);
}

uint64_t sub_1D5AAF664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAF694(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))sub_1D5AAC908);
}

uint64_t sub_1D5AAF67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAF694(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))sub_1D5AACC7C);
}

uint64_t sub_1D5AAF694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))
{
  return a5(a1, a2, a3, a4, v5[5], v5[6], v5[2], v5[3], v5[4]);
}

uint64_t sub_1D5AAF6CC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1D5AAF704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAF734(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1D5AAD2D4);
}

uint64_t sub_1D5AAF71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D5AAF734(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void))sub_1D5AAD704);
}

uint64_t sub_1D5AAF734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void))
{
  return a5(a1, a2, a3, a4, v5[8], v5[9], v5[2], v5[3], v5[4], v5[5], v5[6], v5[7]);
}

uint64_t sub_1D5AAF774()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1D5AAF7A4(uint64_t a1, uint64_t a2)
{
  sub_1D5AAE518(a1, a2, *(void (**)(char *))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16));
}

uint64_t sub_1D5AAF7C8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  id v3 = v2;
  uint64_t v6 = sub_1D5AB3800();
  uint64_t v18 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_1D59525FC(a1);
  LOBYTE(a1) = v10;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v19 = *v3;
    *id v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1D59767B4();
      uint64_t v12 = v19;
    }
    uint64_t v13 = *(void *)(v12 + 48);
    uint64_t v14 = sub_1D5AB3600();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13 + *(void *)(*(void *)(v14 - 8) + 72) * v9, v14);
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 32);
    v15(v8, *(void *)(v12 + 56) + *(void *)(v18 + 72) * v9, v6);
    sub_1D5AAFCF4(v9, v12);
    *id v3 = v12;
    swift_bridgeObjectRelease();
    v15(a2, (unint64_t)v8, v6);
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(a2, 0, 1, v6);
  }
  else
  {
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    return v17(a2, 1, 1, v6);
  }
}

double sub_1D5AAF9EC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1D5952584(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1D5976E2C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1D5950B78((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_1D5AB003C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1D5AAFAF8(__int16 a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1D5952680(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1D59773A4();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v5);
  sub_1D5AB0228(v5, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_1D5AAFBA4()
{
  unint64_t result = qword_1EBDE4118;
  if (!qword_1EBDE4118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDE4118);
  }
  return result;
}

uint64_t sub_1D5AAFBF8(char a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1D59526F8(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1D5977550();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v5);
  sub_1D5AB03EC(v5, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t type metadata accessor for TransportDispatchService()
{
  return self;
}

uint64_t method lookup function for TransportDispatchService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TransportDispatchService);
}

uint64_t dispatch thunk of TransportDispatchService.__allocating_init(queue:label:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_1D5AAFCF4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D5AB3600();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_1D5AB5700();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_1D5AB11A4((unint64_t *)&unk_1EA728450, MEMORY[0x1E4F9D800]);
        uint64_t v19 = sub_1D5AB4D90();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(sub_1D5AB3800() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    unint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *unint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1D5AB003C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_1D5AB5700();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1D5AB5C20();
        swift_bridgeObjectRetain();
        sub_1D5AB4E60();
        uint64_t v11 = sub_1D5AB5C60();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          int64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1D5AB0228(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_1D5AB5700();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1D5AB5C20();
        sub_1D5AB5C30();
        unint64_t result = sub_1D5AB5C60();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (_WORD *)(v10 + 2 * v3);
          unint64_t v12 = (_WORD *)(v10 + 2 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            _OWORD *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1D5AB03EC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_1D5AB5700();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1D5AB5C20();
        sub_1D5AB5C30();
        unint64_t result = sub_1D5AB5C60();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (unsigned char *)(v10 + v3);
          unint64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            _OWORD *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1D5AB05B0(Swift::Int a1, uint64_t a2, unint64_t a3, void *a4, void (**a5)(void, void, void))
{
  uint64_t v49 = a2;
  unint64_t v50 = a3;
  uint64_t v8 = sub_1D5AB4C50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1D5AB4C70();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a5;
  TransportRequest.init(rawValue:)(a1);
  if (LOWORD(aBlock[0]) == 341)
  {
    uint64_t v17 = sub_1D5AB2B90();
    sub_1D5AB11A4((unint64_t *)&qword_1EA727E10, MEMORY[0x1E4F9C878]);
    uint64_t v18 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x1E4F9C850], v17);
    _Block_copy(a5);
    BOOL v20 = (void *)sub_1D5AB1B40();
    ((void (**)(void, void, void *))a5)[2](a5, 0, v20);

    return swift_release();
  }
  else
  {
    LODWORD(v43) = LOWORD(aBlock[0]);
    uint64_t v44 = v15;
    uint64_t v45 = v11;
    uint64_t v46 = v13;
    uint64_t v47 = v12;
    uint64_t v22 = a4[3];
    BOOL v23 = *(os_unfair_lock_s **)(v22 + 16);
    _Block_copy(a5);
    os_unfair_lock_lock(v23);
    swift_beginAccess();
    uint64_t v24 = a4[6];
    uint64_t v25 = *(void *)(v24 + 16);
    uint64_t v48 = v9;
    if (v25)
    {
      __int16 v26 = v43;
      unint64_t v27 = sub_1D5952680(v43);
      uint64_t v28 = v8;
      if (v29)
      {
        uint64_t v30 = (uint64_t *)(*(void *)(v24 + 56) + 16 * v27);
        uint64_t v32 = *v30;
        uint64_t v31 = v30[1];
        swift_retain();
      }
      else
      {
        uint64_t v32 = 0;
        uint64_t v31 = 0;
      }
      uint64_t v33 = v16;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v31 = 0;
      uint64_t v28 = v8;
      uint64_t v33 = v16;
      __int16 v26 = v43;
    }
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v22 + 16));
    uint64_t v34 = v45;
    if (v32)
    {
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v32;
      *(void *)(v35 + 24) = v31;
      uint64_t v36 = sub_1D5AB1380;
    }
    else
    {
      uint64_t v36 = 0;
      uint64_t v35 = 0;
    }
    uint64_t v43 = a4[2];
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v36;
    *(void *)(v37 + 24) = v35;
    *(void *)(v37 + 32) = a4;
    *(_WORD *)(v37 + 40) = v26;
    *(void *)(v37 + 48) = sub_1D5956E88;
    *(void *)(v37 + 56) = v33;
    uint64_t v39 = v49;
    unint64_t v38 = v50;
    *(void *)(v37 + 64) = v49;
    *(void *)(v37 + 72) = v38;
    aBlock[4] = sub_1D5AAF508;
    aBlock[5] = v37;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D598EA50;
    aBlock[3] = &block_descriptor_54_0;
    uint64_t v40 = _Block_copy(aBlock);
    sub_1D5A0A740((uint64_t)v36);
    swift_retain();
    swift_retain();
    sub_1D59A0188(v39, v38);
    int64_t v41 = v44;
    sub_1D5AB4C60();
    uint64_t v51 = MEMORY[0x1E4FBC860];
    sub_1D5AB11A4((unint64_t *)&qword_1EBDE50F0, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDE5100);
    sub_1D5990440();
    sub_1D5AB56F0();
    MEMORY[0x1D94598A0](0, v41, v34, v40);
    _Block_release(v40);
    sub_1D5A0A7B0((uint64_t)v36);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v28);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v47);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_1D5AB0AE0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1D5AB0B1C()
{
  sub_1D5AAEB78(*(void (**)(uint64_t, uint64_t, void (*)(uint64_t), uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned __int16 *)(v0 + 40), *(void (**)(void, unint64_t, void *))(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

uint64_t sub_1D5AB0B34()
{
  swift_unknownObjectRelease();
  unint64_t v1 = *(void *)(v0 + 88);
  if (v1 >> 60 != 15) {
    sub_1D5956DF8(*(void *)(v0 + 80), v1);
  }
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 128, 7);
}

uint64_t sub_1D5AB0B94(uint64_t a1)
{
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v3 = v1[10];
  uint64_t v4 = v1[11];
  uint64_t v5 = v1[12];
  uint64_t v6 = v1[13];
  uint64_t v7 = v1[14];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1D5984480;
  return sub_1D5AAD878(a1, v11, v10, v3, v4, v5, v6, v7);
}

uint64_t sub_1D5AB0CB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1D5AB0D04(uint64_t a1)
{
  return sub_1D5AAD5D8(a1, *(void (**)(unsigned char *))(v1 + 64));
}

uint64_t sub_1D5AB0D38()
{
  swift_unknownObjectRelease();
  unint64_t v1 = *(void *)(v0 + 64);
  if (v1 >> 60 != 15) {
    sub_1D5956DF8(*(void *)(v0 + 56), v1);
  }
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1D5AB0D98(uint64_t a1)
{
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v3 = v1[7];
  uint64_t v4 = v1[8];
  uint64_t v5 = v1[9];
  uint64_t v6 = v1[10];
  uint64_t v7 = v1[11];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1D598AF68;
  return sub_1D5AACDE0(a1, v11, v10, v3, v4, v5, v6, v7);
}

uint64_t sub_1D5AB0E94(uint64_t a1)
{
  return sub_1D5AACC10(a1, *(void (**)(unsigned char *))(v1 + 16));
}

uint64_t sub_1D5AB0EB4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1D5AB0EFC(uint64_t a1)
{
  uint64_t v12 = v1[4];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[7];
  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  uint64_t v9 = v1[10];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_1D598AF68;
  return sub_1D5AAC450(a1, v4, v5, v6, v7, v8, v9, v12);
}

uint64_t sub_1D5AB0FF0(uint64_t a1)
{
  return sub_1D5AAC1E0(a1, *(void (**)(unsigned char *))(v1 + 40));
}

uint64_t sub_1D5AB1000()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1D5AB1048()
{
  uint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1D598AF68;
  *(_OWORD *)(v3 + 128) = v4;
  uint64_t v7 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 144) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1D5AABDEC;
  return v7();
}

uint64_t sub_1D5AB1170(uint64_t *a1, uint64_t *a2)
{
  return sub_1D5AAE208(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t (*)(), uint64_t))(v2 + 16));
}

uint64_t sub_1D5AB1178()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D5AB11A4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D5AB11EC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D5AB1224()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1D5AB124C(uint64_t a1)
{
  sub_1D5AAEF28(a1, *(void (**)(uint64_t, unint64_t, void *))(v1 + 16));
}

uint64_t sub_1D5AB1254(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1D5AB12B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDE3CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D5AB1318()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D5AB1350(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

void *ConfigurationClient.__allocating_init(queue:)(void *a1)
{
  id v2 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  id v3 = a1;
  uint64_t v4 = (void *)sub_1D5AB4DE0();
  id v5 = objc_msgSend(v2, sel_initWithMachServiceName_options_, v4, 0);

  type metadata accessor for XPCClient();
  swift_allocObject();
  uint64_t v6 = sub_1D59968E8(v5, v3);
  uint64_t v7 = *(void *)(v6 + 32);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v7 + 16));
  if (*(unsigned char *)(v6 + 48) == 1)
  {
    *(unsigned char *)(v6 + 48) = 2;
    objc_msgSend(*(id *)(v6 + 24), sel_resume);
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v7 + 16));

  type metadata accessor for ConfigurationClient();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v6;
  result[3] = &protocol witness table for XPCClient;
  result[4] = &protocol witness table for XPCClient;
  return result;
}

void *ConfigurationClient.__allocating_init(connection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return sub_1D5AB18B8(a1, v3, ObjectType, a2, a3);
}

uint64_t type metadata accessor for ConfigurationClient()
{
  return self;
}

void *ConfigurationClient.init(connection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  return sub_1D595A0B0(a1, v3, ObjectType, a2, a3);
}

uint64_t ConfigurationClient.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t ConfigurationClient.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t ConfigurationClient.fetchRemoteConfiguration()()
{
  return sub_1D5AB1764(0xD00000000000001ALL, (void *)0x80000001D5ACC800, 109);
}

uint64_t ConfigurationClient.queryConfiguration()()
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1D5AB4B50();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EBDE5400);
  v2._countAndFlagsBits = 0xD000000000000072;
  v2._object = (void *)0x80000001D5ACC780;
  v3._object = (void *)0x80000001D5ACC820;
  v3._countAndFlagsBits = 0xD000000000000014;
  Logger.trace(file:function:)(v2, v3);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v9 = 108;
  uint64_t v6 = *(uint64_t (**)(__int16 *, uint64_t, void, void, uint64_t, uint64_t))(v4 + 24);
  uint64_t v7 = sub_1D5AB25B0();
  return v6(&v9, v7, MEMORY[0x1E4F9C578], MEMORY[0x1E4F9C580], ObjectType, v4);
}

uint64_t ConfigurationClient.resetConfiguration()()
{
  return sub_1D5AB1764(0xD000000000000014, (void *)0x80000001D5ACC840, 110);
}

uint64_t sub_1D5AB1764(uint64_t a1, void *a2, __int16 a3)
{
  if (qword_1EBDE5420 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D5AB4B50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBDE5400);
  v8._object = (void *)0x80000001D5ACC780;
  v8._countAndFlagsBits = 0xD000000000000072;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Logger.trace(file:function:)(v8, v9);
  uint64_t v10 = *(void *)(v3 + 24);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v13 = a3;
  return (*(uint64_t (**)(__int16 *, uint64_t, uint64_t))(v10 + 8))(&v13, ObjectType, v10);
}

uint64_t sub_1D5AB184C()
{
  return ConfigurationClient.fetchRemoteConfiguration()();
}

uint64_t sub_1D5AB1870()
{
  return ConfigurationClient.queryConfiguration()();
}

uint64_t sub_1D5AB1894()
{
  return ConfigurationClient.resetConfiguration()();
}

void *sub_1D5AB18B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for ConfigurationClient();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a4;
  result[4] = a5;
  return result;
}

uint64_t dispatch thunk of ConfigurationClientProtocol.fetchRemoteConfiguration()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ConfigurationClientProtocol.queryConfiguration()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ConfigurationClientProtocol.resetConfiguration()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t method lookup function for ConfigurationClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConfigurationClient);
}

uint64_t dispatch thunk of ConfigurationClient.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void static ServiceSubscriptionUpdated.deliveryStyle.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionUpdated()
{
  return &type metadata for ServiceSubscriptionUpdated;
}

uint64_t dispatch thunk of ScheduledTimer.onFire.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ScheduledTimer.onFire.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ScheduledTimer.onFire.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ScheduledTimer.schedule()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ScheduledTimer.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1D5AB19F0()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1D5AB1A00()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1D5AB1A10()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1D5AB1A20()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1D5AB1A30()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1D5AB1A40()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1D5AB1A50()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1D5AB1A60()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1D5AB1A70()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1D5AB1A80()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1D5AB1A90()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1D5AB1AA0()
{
  return MEMORY[0x1F40E3778]();
}

uint64_t sub_1D5AB1AB0()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1D5AB1AC0()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1D5AB1AD0()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1D5AB1AE0()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1D5AB1AF0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1D5AB1B00()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1D5AB1B10()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1D5AB1B20()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1D5AB1B30()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1D5AB1B40()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D5AB1B50()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D5AB1B60()
{
  return MEMORY[0x1F414C128]();
}

uint64_t sub_1D5AB1B70()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1D5AB1B80()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1D5AB1B90()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1D5AB1BA0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1D5AB1BB0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D5AB1BC0()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1D5AB1BD0()
{
  return MEMORY[0x1F40E4BF0]();
}

uint64_t sub_1D5AB1BE0()
{
  return MEMORY[0x1F40E4C00]();
}

uint64_t sub_1D5AB1BF0()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1D5AB1C00()
{
  return MEMORY[0x1F40E4D30]();
}

uint64_t sub_1D5AB1C10()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1D5AB1C20()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1D5AB1C30()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1D5AB1C40()
{
  return MEMORY[0x1F40E4EF0]();
}

uint64_t sub_1D5AB1C50()
{
  return MEMORY[0x1F414C140]();
}

uint64_t sub_1D5AB1C60()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1D5AB1C70()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1D5AB1C80()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D5AB1C90()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1D5AB1CA0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1D5AB1CB0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D5AB1CC0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1D5AB1CD0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1D5AB1CE0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D5AB1CF0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D5AB1D00()
{
  return MEMORY[0x1F40E53D8]();
}

uint64_t sub_1D5AB1D10()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1D5AB1D20()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D5AB1D30()
{
  return MEMORY[0x1F40E59F8]();
}

uint64_t sub_1D5AB1D40()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1D5AB1D50()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1D5AB1D60()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1D5AB1D70()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1D5AB1D80()
{
  return MEMORY[0x1F414C190]();
}

uint64_t sub_1D5AB1D90()
{
  return MEMORY[0x1F414C1A0]();
}

uint64_t sub_1D5AB1DA0()
{
  return MEMORY[0x1F414C1B0]();
}

uint64_t sub_1D5AB1DB0()
{
  return MEMORY[0x1F414C1E0]();
}

uint64_t sub_1D5AB1DC0()
{
  return MEMORY[0x1F414C220]();
}

uint64_t sub_1D5AB1DD0()
{
  return MEMORY[0x1F414C228]();
}

uint64_t sub_1D5AB1DE0()
{
  return MEMORY[0x1F414C250]();
}

uint64_t sub_1D5AB1DF0()
{
  return MEMORY[0x1F414C258]();
}

uint64_t sub_1D5AB1E00()
{
  return MEMORY[0x1F414C268]();
}

uint64_t sub_1D5AB1E10()
{
  return MEMORY[0x1F414C270]();
}

uint64_t sub_1D5AB1E20()
{
  return MEMORY[0x1F414C2A8]();
}

uint64_t sub_1D5AB1E30()
{
  return MEMORY[0x1F414C2B8]();
}

uint64_t sub_1D5AB1E40()
{
  return MEMORY[0x1F414C310]();
}

uint64_t sub_1D5AB1E50()
{
  return MEMORY[0x1F414C318]();
}

uint64_t sub_1D5AB1E60()
{
  return MEMORY[0x1F414C320]();
}

uint64_t sub_1D5AB1E70()
{
  return MEMORY[0x1F414C328]();
}

uint64_t sub_1D5AB1E80()
{
  return MEMORY[0x1F414C338]();
}

uint64_t sub_1D5AB1E90()
{
  return MEMORY[0x1F414C350]();
}

uint64_t sub_1D5AB1EA0()
{
  return MEMORY[0x1F414C3C0]();
}

uint64_t sub_1D5AB1EB0()
{
  return MEMORY[0x1F414C400]();
}

uint64_t sub_1D5AB1EC0()
{
  return MEMORY[0x1F414C410]();
}

uint64_t sub_1D5AB1ED0()
{
  return MEMORY[0x1F414C418]();
}

uint64_t sub_1D5AB1EE0()
{
  return MEMORY[0x1F414C420]();
}

uint64_t sub_1D5AB1EF0()
{
  return MEMORY[0x1F414C428]();
}

uint64_t sub_1D5AB1F00()
{
  return MEMORY[0x1F414C430]();
}

uint64_t sub_1D5AB1F10()
{
  return MEMORY[0x1F414C438]();
}

uint64_t sub_1D5AB1F20()
{
  return MEMORY[0x1F414C440]();
}

uint64_t sub_1D5AB1F30()
{
  return MEMORY[0x1F414C448]();
}

uint64_t sub_1D5AB1F40()
{
  return MEMORY[0x1F414C450]();
}

uint64_t sub_1D5AB1F50()
{
  return MEMORY[0x1F414C458]();
}

uint64_t sub_1D5AB1F60()
{
  return MEMORY[0x1F414C460]();
}

uint64_t sub_1D5AB1F70()
{
  return MEMORY[0x1F414C468]();
}

uint64_t sub_1D5AB1F80()
{
  return MEMORY[0x1F414C470]();
}

uint64_t sub_1D5AB1F90()
{
  return MEMORY[0x1F414C478]();
}

uint64_t sub_1D5AB1FA0()
{
  return MEMORY[0x1F414C480]();
}

uint64_t sub_1D5AB1FB0()
{
  return MEMORY[0x1F414C488]();
}

uint64_t sub_1D5AB1FC0()
{
  return MEMORY[0x1F414C490]();
}

uint64_t sub_1D5AB1FD0()
{
  return MEMORY[0x1F414C498]();
}

uint64_t sub_1D5AB1FE0()
{
  return MEMORY[0x1F414C4A0]();
}

uint64_t sub_1D5AB1FF0()
{
  return MEMORY[0x1F414C4A8]();
}

uint64_t sub_1D5AB2000()
{
  return MEMORY[0x1F414C4B0]();
}

uint64_t sub_1D5AB2010()
{
  return MEMORY[0x1F414C4B8]();
}

uint64_t sub_1D5AB2020()
{
  return MEMORY[0x1F414C4C0]();
}

uint64_t sub_1D5AB2030()
{
  return MEMORY[0x1F414C4C8]();
}

uint64_t sub_1D5AB2040()
{
  return MEMORY[0x1F414C4D0]();
}

uint64_t sub_1D5AB2050()
{
  return MEMORY[0x1F414C4D8]();
}

uint64_t sub_1D5AB2060()
{
  return MEMORY[0x1F414C4E0]();
}

uint64_t sub_1D5AB2070()
{
  return MEMORY[0x1F414C518]();
}

uint64_t sub_1D5AB2080()
{
  return MEMORY[0x1F414C550]();
}

uint64_t sub_1D5AB2090()
{
  return MEMORY[0x1F414C598]();
}

uint64_t sub_1D5AB20A0()
{
  return MEMORY[0x1F414C5A0]();
}

uint64_t sub_1D5AB20B0()
{
  return MEMORY[0x1F414C5A8]();
}

uint64_t sub_1D5AB20C0()
{
  return MEMORY[0x1F414C5B0]();
}

uint64_t sub_1D5AB20D0()
{
  return MEMORY[0x1F414C5B8]();
}

uint64_t sub_1D5AB20E0()
{
  return MEMORY[0x1F414C5C0]();
}

uint64_t sub_1D5AB20F0()
{
  return MEMORY[0x1F414C5C8]();
}

uint64_t sub_1D5AB2100()
{
  return MEMORY[0x1F414C5D0]();
}

uint64_t sub_1D5AB2110()
{
  return MEMORY[0x1F414C5D8]();
}

uint64_t sub_1D5AB2120()
{
  return MEMORY[0x1F414C5E0]();
}

uint64_t sub_1D5AB2130()
{
  return MEMORY[0x1F414C5E8]();
}

uint64_t sub_1D5AB2140()
{
  return MEMORY[0x1F414C5F0]();
}

uint64_t sub_1D5AB2150()
{
  return MEMORY[0x1F414C5F8]();
}

uint64_t sub_1D5AB2160()
{
  return MEMORY[0x1F414C600]();
}

uint64_t sub_1D5AB2170()
{
  return MEMORY[0x1F414C618]();
}

uint64_t sub_1D5AB2180()
{
  return MEMORY[0x1F414C620]();
}

uint64_t sub_1D5AB2190()
{
  return MEMORY[0x1F414C628]();
}

uint64_t sub_1D5AB21A0()
{
  return MEMORY[0x1F414C638]();
}

uint64_t sub_1D5AB21B0()
{
  return MEMORY[0x1F414C650]();
}

uint64_t sub_1D5AB21C0()
{
  return MEMORY[0x1F414C658]();
}

uint64_t sub_1D5AB21D0()
{
  return MEMORY[0x1F414C660]();
}

uint64_t sub_1D5AB21E0()
{
  return MEMORY[0x1F414C668]();
}

uint64_t sub_1D5AB21F0()
{
  return MEMORY[0x1F414C670]();
}

uint64_t sub_1D5AB2200()
{
  return MEMORY[0x1F414C6A0]();
}

uint64_t sub_1D5AB2210()
{
  return MEMORY[0x1F414C6A8]();
}

uint64_t sub_1D5AB2220()
{
  return MEMORY[0x1F414C708]();
}

uint64_t sub_1D5AB2230()
{
  return MEMORY[0x1F414C720]();
}

uint64_t sub_1D5AB2240()
{
  return MEMORY[0x1F414C728]();
}

uint64_t sub_1D5AB2250()
{
  return MEMORY[0x1F414C778]();
}

uint64_t sub_1D5AB2260()
{
  return MEMORY[0x1F414C780]();
}

uint64_t sub_1D5AB2270()
{
  return MEMORY[0x1F414C788]();
}

uint64_t sub_1D5AB2280()
{
  return MEMORY[0x1F414C790]();
}

uint64_t sub_1D5AB2290()
{
  return MEMORY[0x1F414C7A0]();
}

uint64_t sub_1D5AB22A0()
{
  return MEMORY[0x1F414C7C0]();
}

uint64_t sub_1D5AB22B0()
{
  return MEMORY[0x1F414C7C8]();
}

uint64_t sub_1D5AB22C0()
{
  return MEMORY[0x1F414C7D0]();
}

uint64_t sub_1D5AB22D0()
{
  return MEMORY[0x1F414C7D8]();
}

uint64_t sub_1D5AB22E0()
{
  return MEMORY[0x1F414C7E0]();
}

uint64_t sub_1D5AB22F0()
{
  return MEMORY[0x1F414C7F8]();
}

uint64_t sub_1D5AB2300()
{
  return MEMORY[0x1F414C800]();
}

uint64_t sub_1D5AB2310()
{
  return MEMORY[0x1F414C808]();
}

uint64_t sub_1D5AB2320()
{
  return MEMORY[0x1F414C820]();
}

uint64_t sub_1D5AB2330()
{
  return MEMORY[0x1F414C828]();
}

uint64_t sub_1D5AB2340()
{
  return MEMORY[0x1F414C830]();
}

uint64_t sub_1D5AB2350()
{
  return MEMORY[0x1F414C838]();
}

uint64_t sub_1D5AB2360()
{
  return MEMORY[0x1F414C840]();
}

uint64_t sub_1D5AB2370()
{
  return MEMORY[0x1F414C848]();
}

uint64_t sub_1D5AB2380()
{
  return MEMORY[0x1F414C850]();
}

uint64_t sub_1D5AB2390()
{
  return MEMORY[0x1F414C878]();
}

uint64_t sub_1D5AB23A0()
{
  return MEMORY[0x1F414C880]();
}

uint64_t sub_1D5AB23B0()
{
  return MEMORY[0x1F414C888]();
}

uint64_t sub_1D5AB23C0()
{
  return MEMORY[0x1F414C890]();
}

uint64_t sub_1D5AB23D0()
{
  return MEMORY[0x1F414C898]();
}

uint64_t sub_1D5AB23E0()
{
  return MEMORY[0x1F414C8A0]();
}

uint64_t sub_1D5AB23F0()
{
  return MEMORY[0x1F414C8A8]();
}

uint64_t sub_1D5AB2410()
{
  return MEMORY[0x1F414C8B8]();
}

uint64_t sub_1D5AB2420()
{
  return MEMORY[0x1F414C8C8]();
}

uint64_t sub_1D5AB2430()
{
  return MEMORY[0x1F414C908]();
}

uint64_t sub_1D5AB2440()
{
  return MEMORY[0x1F414C910]();
}

uint64_t sub_1D5AB2450()
{
  return MEMORY[0x1F414C918]();
}

uint64_t sub_1D5AB2460()
{
  return MEMORY[0x1F414C920]();
}

uint64_t sub_1D5AB2470()
{
  return MEMORY[0x1F414C928]();
}

uint64_t sub_1D5AB2480()
{
  return MEMORY[0x1F414C930]();
}

uint64_t sub_1D5AB2490()
{
  return MEMORY[0x1F414C938]();
}

uint64_t sub_1D5AB24A0()
{
  return MEMORY[0x1F414C948]();
}

uint64_t sub_1D5AB24B0()
{
  return MEMORY[0x1F414C950]();
}

uint64_t sub_1D5AB24C0()
{
  return MEMORY[0x1F414C960]();
}

uint64_t sub_1D5AB24D0()
{
  return MEMORY[0x1F414C970]();
}

uint64_t sub_1D5AB24E0()
{
  return MEMORY[0x1F414C980]();
}

uint64_t sub_1D5AB24F0()
{
  return MEMORY[0x1F414C988]();
}

uint64_t sub_1D5AB2500()
{
  return MEMORY[0x1F414C990]();
}

uint64_t sub_1D5AB2510()
{
  return MEMORY[0x1F414C998]();
}

uint64_t sub_1D5AB2520()
{
  return MEMORY[0x1F414C9A0]();
}

uint64_t sub_1D5AB2530()
{
  return MEMORY[0x1F414C9A8]();
}

uint64_t sub_1D5AB2540()
{
  return MEMORY[0x1F414C9B0]();
}

uint64_t sub_1D5AB2550()
{
  return MEMORY[0x1F414C9B8]();
}

uint64_t sub_1D5AB2560()
{
  return MEMORY[0x1F414C9C0]();
}

uint64_t sub_1D5AB2570()
{
  return MEMORY[0x1F414C9C8]();
}

uint64_t sub_1D5AB2580()
{
  return MEMORY[0x1F414C9F8]();
}

uint64_t sub_1D5AB2590()
{
  return MEMORY[0x1F414CA10]();
}

uint64_t sub_1D5AB25A0()
{
  return MEMORY[0x1F414CA68]();
}

uint64_t sub_1D5AB25B0()
{
  return MEMORY[0x1F414CB10]();
}

uint64_t sub_1D5AB25C0()
{
  return MEMORY[0x1F414CB18]();
}

uint64_t sub_1D5AB25D0()
{
  return MEMORY[0x1F414CB20]();
}

uint64_t sub_1D5AB25E0()
{
  return MEMORY[0x1F414CB28]();
}

uint64_t sub_1D5AB25F0()
{
  return MEMORY[0x1F414CB70]();
}

uint64_t sub_1D5AB2600()
{
  return MEMORY[0x1F414CBA8]();
}

uint64_t sub_1D5AB2610()
{
  return MEMORY[0x1F414CBB0]();
}

uint64_t sub_1D5AB2620()
{
  return MEMORY[0x1F414CBB8]();
}

uint64_t sub_1D5AB2630()
{
  return MEMORY[0x1F414CBC0]();
}

uint64_t sub_1D5AB2640()
{
  return MEMORY[0x1F414CBC8]();
}

uint64_t sub_1D5AB2650()
{
  return MEMORY[0x1F414CBD0]();
}

uint64_t sub_1D5AB2660()
{
  return MEMORY[0x1F414CBD8]();
}

uint64_t sub_1D5AB2670()
{
  return MEMORY[0x1F414CBE0]();
}

uint64_t sub_1D5AB2680()
{
  return MEMORY[0x1F414CBE8]();
}

uint64_t sub_1D5AB2690()
{
  return MEMORY[0x1F414CBF0]();
}

uint64_t sub_1D5AB26A0()
{
  return MEMORY[0x1F414CBF8]();
}

uint64_t sub_1D5AB26B0()
{
  return MEMORY[0x1F414CC00]();
}

uint64_t sub_1D5AB26C0()
{
  return MEMORY[0x1F414CC08]();
}

uint64_t sub_1D5AB26D0()
{
  return MEMORY[0x1F414CC10]();
}

uint64_t sub_1D5AB26E0()
{
  return MEMORY[0x1F414CC18]();
}

uint64_t sub_1D5AB26F0()
{
  return MEMORY[0x1F414CC20]();
}

uint64_t sub_1D5AB2700()
{
  return MEMORY[0x1F414CC28]();
}

uint64_t sub_1D5AB2710()
{
  return MEMORY[0x1F414CC30]();
}

uint64_t sub_1D5AB2720()
{
  return MEMORY[0x1F414CC38]();
}

uint64_t sub_1D5AB2730()
{
  return MEMORY[0x1F414CC40]();
}

uint64_t sub_1D5AB2740()
{
  return MEMORY[0x1F414CC48]();
}

uint64_t sub_1D5AB2750()
{
  return MEMORY[0x1F414CC50]();
}

uint64_t sub_1D5AB2760()
{
  return MEMORY[0x1F414CC58]();
}

uint64_t sub_1D5AB2770()
{
  return MEMORY[0x1F414CC60]();
}

uint64_t sub_1D5AB2780()
{
  return MEMORY[0x1F414CC68]();
}

uint64_t sub_1D5AB2790()
{
  return MEMORY[0x1F414CC70]();
}

uint64_t sub_1D5AB27A0()
{
  return MEMORY[0x1F414CC78]();
}

uint64_t sub_1D5AB27B0()
{
  return MEMORY[0x1F414CC80]();
}

uint64_t sub_1D5AB27C0()
{
  return MEMORY[0x1F414CC88]();
}

uint64_t sub_1D5AB27D0()
{
  return MEMORY[0x1F414CC90]();
}

uint64_t sub_1D5AB27E0()
{
  return MEMORY[0x1F414CC98]();
}

uint64_t sub_1D5AB27F0()
{
  return MEMORY[0x1F414CCF8]();
}

uint64_t sub_1D5AB2800()
{
  return MEMORY[0x1F414CD00]();
}

uint64_t sub_1D5AB2810()
{
  return MEMORY[0x1F414CD20]();
}

uint64_t sub_1D5AB2820()
{
  return MEMORY[0x1F414CD58]();
}

uint64_t sub_1D5AB2830()
{
  return MEMORY[0x1F414CD60]();
}

uint64_t sub_1D5AB2840()
{
  return MEMORY[0x1F414CD68]();
}

uint64_t sub_1D5AB2850()
{
  return MEMORY[0x1F414CD70]();
}

uint64_t sub_1D5AB2860()
{
  return MEMORY[0x1F414CD78]();
}

uint64_t sub_1D5AB2870()
{
  return MEMORY[0x1F414CD80]();
}

uint64_t sub_1D5AB2880()
{
  return MEMORY[0x1F414CD88]();
}

uint64_t sub_1D5AB2890()
{
  return MEMORY[0x1F414CD90]();
}

uint64_t sub_1D5AB28A0()
{
  return MEMORY[0x1F414CD98]();
}

uint64_t sub_1D5AB28B0()
{
  return MEMORY[0x1F414CDA0]();
}

uint64_t sub_1D5AB28C0()
{
  return MEMORY[0x1F414CDB0]();
}

uint64_t sub_1D5AB28D0()
{
  return MEMORY[0x1F414CDB8]();
}

uint64_t sub_1D5AB28E0()
{
  return MEMORY[0x1F414CDC0]();
}

uint64_t sub_1D5AB28F0()
{
  return MEMORY[0x1F414CDC8]();
}

uint64_t sub_1D5AB2900()
{
  return MEMORY[0x1F414CDD0]();
}

uint64_t sub_1D5AB2910()
{
  return MEMORY[0x1F414CDD8]();
}

uint64_t sub_1D5AB2920()
{
  return MEMORY[0x1F414CDE0]();
}

uint64_t sub_1D5AB2930()
{
  return MEMORY[0x1F414CDE8]();
}

uint64_t sub_1D5AB2940()
{
  return MEMORY[0x1F414CDF0]();
}

uint64_t sub_1D5AB2950()
{
  return MEMORY[0x1F414CDF8]();
}

uint64_t sub_1D5AB2960()
{
  return MEMORY[0x1F414CE00]();
}

uint64_t sub_1D5AB2970()
{
  return MEMORY[0x1F414CE08]();
}

uint64_t sub_1D5AB2980()
{
  return MEMORY[0x1F414CE10]();
}

uint64_t sub_1D5AB2990()
{
  return MEMORY[0x1F414CE18]();
}

uint64_t sub_1D5AB29A0()
{
  return MEMORY[0x1F414CE20]();
}

uint64_t sub_1D5AB29B0()
{
  return MEMORY[0x1F414CE28]();
}

uint64_t sub_1D5AB29C0()
{
  return MEMORY[0x1F414CE38]();
}

uint64_t sub_1D5AB29D0()
{
  return MEMORY[0x1F414CE40]();
}

uint64_t sub_1D5AB29E0()
{
  return MEMORY[0x1F414CE48]();
}

uint64_t sub_1D5AB29F0()
{
  return MEMORY[0x1F414CE50]();
}

uint64_t sub_1D5AB2A00()
{
  return MEMORY[0x1F414CE58]();
}

uint64_t sub_1D5AB2A10()
{
  return MEMORY[0x1F414CE60]();
}

uint64_t sub_1D5AB2A20()
{
  return MEMORY[0x1F414CE68]();
}

uint64_t sub_1D5AB2A30()
{
  return MEMORY[0x1F414CE70]();
}

uint64_t sub_1D5AB2A40()
{
  return MEMORY[0x1F414CE78]();
}

uint64_t sub_1D5AB2A50()
{
  return MEMORY[0x1F414CE80]();
}

uint64_t sub_1D5AB2A60()
{
  return MEMORY[0x1F414CE88]();
}

uint64_t sub_1D5AB2A70()
{
  return MEMORY[0x1F414CE90]();
}

uint64_t sub_1D5AB2A80()
{
  return MEMORY[0x1F414CE98]();
}

uint64_t sub_1D5AB2A90()
{
  return MEMORY[0x1F414CEA0]();
}

uint64_t sub_1D5AB2AA0()
{
  return MEMORY[0x1F414CEA8]();
}

uint64_t sub_1D5AB2AB0()
{
  return MEMORY[0x1F414CEB0]();
}

uint64_t sub_1D5AB2AC0()
{
  return MEMORY[0x1F414CEB8]();
}

uint64_t sub_1D5AB2AD0()
{
  return MEMORY[0x1F414CEC0]();
}

uint64_t sub_1D5AB2AE0()
{
  return MEMORY[0x1F414CEC8]();
}

uint64_t sub_1D5AB2AF0()
{
  return MEMORY[0x1F414CED0]();
}

uint64_t sub_1D5AB2B00()
{
  return MEMORY[0x1F414CEE0]();
}

uint64_t sub_1D5AB2B10()
{
  return MEMORY[0x1F414CF00]();
}

uint64_t sub_1D5AB2B20()
{
  return MEMORY[0x1F414CF08]();
}

uint64_t sub_1D5AB2B30()
{
  return MEMORY[0x1F414CF10]();
}

uint64_t sub_1D5AB2B40()
{
  return MEMORY[0x1F414CF30]();
}

uint64_t sub_1D5AB2B50()
{
  return MEMORY[0x1F414CF48]();
}

uint64_t sub_1D5AB2B60()
{
  return MEMORY[0x1F414CF70]();
}

uint64_t sub_1D5AB2B70()
{
  return MEMORY[0x1F414CF78]();
}

uint64_t sub_1D5AB2B80()
{
  return MEMORY[0x1F414CF98]();
}

uint64_t sub_1D5AB2B90()
{
  return MEMORY[0x1F414CFA0]();
}

uint64_t sub_1D5AB2BA0()
{
  return MEMORY[0x1F414CFD0]();
}

uint64_t sub_1D5AB2BB0()
{
  return MEMORY[0x1F414CFD8]();
}

uint64_t sub_1D5AB2BC0()
{
  return MEMORY[0x1F414CFE0]();
}

uint64_t sub_1D5AB2BD0()
{
  return MEMORY[0x1F414CFF0]();
}

uint64_t sub_1D5AB2BE0()
{
  return MEMORY[0x1F414CFF8]();
}

uint64_t sub_1D5AB2BF0()
{
  return MEMORY[0x1F414D028]();
}

uint64_t sub_1D5AB2C00()
{
  return MEMORY[0x1F414D030]();
}

uint64_t sub_1D5AB2C10()
{
  return MEMORY[0x1F414D038]();
}

uint64_t sub_1D5AB2C20()
{
  return MEMORY[0x1F414D048]();
}

uint64_t sub_1D5AB2C30()
{
  return MEMORY[0x1F414D050]();
}

uint64_t sub_1D5AB2C40()
{
  return MEMORY[0x1F414D058]();
}

uint64_t sub_1D5AB2C50()
{
  return MEMORY[0x1F414D060]();
}

uint64_t sub_1D5AB2C60()
{
  return MEMORY[0x1F414D068]();
}

uint64_t sub_1D5AB2C70()
{
  return MEMORY[0x1F414D070]();
}

uint64_t sub_1D5AB2C80()
{
  return MEMORY[0x1F414D078]();
}

uint64_t sub_1D5AB2C90()
{
  return MEMORY[0x1F414D080]();
}

uint64_t sub_1D5AB2CA0()
{
  return MEMORY[0x1F414D088]();
}

uint64_t sub_1D5AB2CB0()
{
  return MEMORY[0x1F414D090]();
}

uint64_t sub_1D5AB2CC0()
{
  return MEMORY[0x1F414D098]();
}

uint64_t sub_1D5AB2CD0()
{
  return MEMORY[0x1F414D0D8]();
}

uint64_t sub_1D5AB2CE0()
{
  return MEMORY[0x1F414D0E0]();
}

uint64_t sub_1D5AB2CF0()
{
  return MEMORY[0x1F414D0E8]();
}

uint64_t sub_1D5AB2D00()
{
  return MEMORY[0x1F414D0F0]();
}

uint64_t sub_1D5AB2D10()
{
  return MEMORY[0x1F414D0F8]();
}

uint64_t sub_1D5AB2D20()
{
  return MEMORY[0x1F414D100]();
}

uint64_t sub_1D5AB2D30()
{
  return MEMORY[0x1F414D108]();
}

uint64_t sub_1D5AB2D40()
{
  return MEMORY[0x1F414D118]();
}

uint64_t sub_1D5AB2D50()
{
  return MEMORY[0x1F414D120]();
}

uint64_t sub_1D5AB2D60()
{
  return MEMORY[0x1F414D128]();
}

uint64_t sub_1D5AB2D70()
{
  return MEMORY[0x1F414D158]();
}

uint64_t sub_1D5AB2D80()
{
  return MEMORY[0x1F414D160]();
}

uint64_t sub_1D5AB2D90()
{
  return MEMORY[0x1F414D178]();
}

uint64_t sub_1D5AB2DA0()
{
  return MEMORY[0x1F414D180]();
}

uint64_t sub_1D5AB2DB0()
{
  return MEMORY[0x1F414D188]();
}

uint64_t sub_1D5AB2DC0()
{
  return MEMORY[0x1F414D190]();
}

uint64_t sub_1D5AB2DD0()
{
  return MEMORY[0x1F414D250]();
}

uint64_t sub_1D5AB2DE0()
{
  return MEMORY[0x1F414D260]();
}

uint64_t sub_1D5AB2DF0()
{
  return MEMORY[0x1F414D270]();
}

uint64_t sub_1D5AB2E00()
{
  return MEMORY[0x1F414D2A8]();
}

uint64_t sub_1D5AB2E10()
{
  return MEMORY[0x1F414D2C8]();
}

uint64_t sub_1D5AB2E20()
{
  return MEMORY[0x1F414D2D0]();
}

uint64_t sub_1D5AB2E30()
{
  return MEMORY[0x1F414D2D8]();
}

uint64_t sub_1D5AB2E40()
{
  return MEMORY[0x1F414D2E0]();
}

uint64_t sub_1D5AB2E50()
{
  return MEMORY[0x1F414D2E8]();
}

uint64_t sub_1D5AB2E60()
{
  return MEMORY[0x1F414D2F0]();
}

uint64_t sub_1D5AB2E70()
{
  return MEMORY[0x1F414D310]();
}

uint64_t sub_1D5AB2E80()
{
  return MEMORY[0x1F414D318]();
}

uint64_t sub_1D5AB2E90()
{
  return MEMORY[0x1F414D340]();
}

uint64_t sub_1D5AB2EA0()
{
  return MEMORY[0x1F414D350]();
}

uint64_t sub_1D5AB2EB0()
{
  return MEMORY[0x1F414D370]();
}

uint64_t sub_1D5AB2EC0()
{
  return MEMORY[0x1F414D378]();
}

uint64_t sub_1D5AB2ED0()
{
  return MEMORY[0x1F414D380]();
}

uint64_t sub_1D5AB2EE0()
{
  return MEMORY[0x1F414D388]();
}

uint64_t sub_1D5AB2EF0()
{
  return MEMORY[0x1F414D418]();
}

uint64_t sub_1D5AB2F00()
{
  return MEMORY[0x1F414D420]();
}

uint64_t sub_1D5AB2F10()
{
  return MEMORY[0x1F414D428]();
}

uint64_t sub_1D5AB2F20()
{
  return MEMORY[0x1F414D438]();
}

uint64_t sub_1D5AB2F30()
{
  return MEMORY[0x1F414D440]();
}

uint64_t sub_1D5AB2F40()
{
  return MEMORY[0x1F414D448]();
}

uint64_t sub_1D5AB2F50()
{
  return MEMORY[0x1F414D460]();
}

uint64_t sub_1D5AB2F60()
{
  return MEMORY[0x1F414D470]();
}

uint64_t sub_1D5AB2F70()
{
  return MEMORY[0x1F414D478]();
}

uint64_t sub_1D5AB2F80()
{
  return MEMORY[0x1F414D480]();
}

uint64_t sub_1D5AB2F90()
{
  return MEMORY[0x1F414D508]();
}

uint64_t sub_1D5AB2FA0()
{
  return MEMORY[0x1F414D520]();
}

uint64_t sub_1D5AB2FB0()
{
  return MEMORY[0x1F414D538]();
}

uint64_t sub_1D5AB2FC0()
{
  return MEMORY[0x1F414D540]();
}

uint64_t sub_1D5AB2FD0()
{
  return MEMORY[0x1F414D548]();
}

uint64_t sub_1D5AB2FE0()
{
  return MEMORY[0x1F414D560]();
}

uint64_t sub_1D5AB2FF0()
{
  return MEMORY[0x1F414D580]();
}

uint64_t sub_1D5AB3000()
{
  return MEMORY[0x1F414D588]();
}

uint64_t sub_1D5AB3010()
{
  return MEMORY[0x1F414D598]();
}

uint64_t sub_1D5AB3030()
{
  return MEMORY[0x1F414D5D8]();
}

uint64_t sub_1D5AB3040()
{
  return MEMORY[0x1F414D5F0]();
}

uint64_t sub_1D5AB3050()
{
  return MEMORY[0x1F414D610]();
}

uint64_t sub_1D5AB3060()
{
  return MEMORY[0x1F414D618]();
}

uint64_t sub_1D5AB3070()
{
  return MEMORY[0x1F414D628]();
}

uint64_t sub_1D5AB3080()
{
  return MEMORY[0x1F414D638]();
}

uint64_t sub_1D5AB3090()
{
  return MEMORY[0x1F414D690]();
}

uint64_t sub_1D5AB30A0()
{
  return MEMORY[0x1F414D6C8]();
}

uint64_t sub_1D5AB30B0()
{
  return MEMORY[0x1F414D6F8]();
}

uint64_t sub_1D5AB30C0()
{
  return MEMORY[0x1F414D748]();
}

uint64_t sub_1D5AB30D0()
{
  return MEMORY[0x1F414D780]();
}

uint64_t sub_1D5AB30E0()
{
  return MEMORY[0x1F414D788]();
}

uint64_t sub_1D5AB30F0()
{
  return MEMORY[0x1F414D790]();
}

uint64_t sub_1D5AB3100()
{
  return MEMORY[0x1F414D7A0]();
}

uint64_t sub_1D5AB3110()
{
  return MEMORY[0x1F414D7D8]();
}

uint64_t sub_1D5AB3120()
{
  return MEMORY[0x1F414D7E0]();
}

uint64_t sub_1D5AB3130()
{
  return MEMORY[0x1F414D7E8]();
}

uint64_t sub_1D5AB3140()
{
  return MEMORY[0x1F414D808]();
}

uint64_t sub_1D5AB3150()
{
  return MEMORY[0x1F414D810]();
}

uint64_t sub_1D5AB3160()
{
  return MEMORY[0x1F414D858]();
}

uint64_t sub_1D5AB3170()
{
  return MEMORY[0x1F414D860]();
}

uint64_t sub_1D5AB3180()
{
  return MEMORY[0x1F414D890]();
}

uint64_t sub_1D5AB3190()
{
  return MEMORY[0x1F414D898]();
}

uint64_t sub_1D5AB31A0()
{
  return MEMORY[0x1F414D920]();
}

uint64_t sub_1D5AB31B0()
{
  return MEMORY[0x1F414D938]();
}

uint64_t sub_1D5AB31C0()
{
  return MEMORY[0x1F414D940]();
}

uint64_t sub_1D5AB31D0()
{
  return MEMORY[0x1F414D948]();
}

uint64_t sub_1D5AB31E0()
{
  return MEMORY[0x1F414D950]();
}

uint64_t sub_1D5AB31F0()
{
  return MEMORY[0x1F414D968]();
}

uint64_t sub_1D5AB3200()
{
  return MEMORY[0x1F414D978]();
}

uint64_t sub_1D5AB3210()
{
  return MEMORY[0x1F414D9F0]();
}

uint64_t sub_1D5AB3220()
{
  return MEMORY[0x1F414DA00]();
}

uint64_t sub_1D5AB3230()
{
  return MEMORY[0x1F414DA08]();
}

uint64_t sub_1D5AB3240()
{
  return MEMORY[0x1F414DA10]();
}

uint64_t sub_1D5AB3250()
{
  return MEMORY[0x1F414DA18]();
}

uint64_t sub_1D5AB3260()
{
  return MEMORY[0x1F414DA30]();
}

uint64_t sub_1D5AB3270()
{
  return MEMORY[0x1F414DA58]();
}

uint64_t sub_1D5AB3280()
{
  return MEMORY[0x1F414DA70]();
}

uint64_t sub_1D5AB3290()
{
  return MEMORY[0x1F414DA78]();
}

uint64_t sub_1D5AB32A0()
{
  return MEMORY[0x1F414DA80]();
}

uint64_t _s13SeymourClient26AssetBundleProgressUpdatedV18debounceIdentifierSSvg_0()
{
  return MEMORY[0x1F414DA90]();
}

uint64_t sub_1D5AB32D0()
{
  return MEMORY[0x1F414DA98]();
}

uint64_t sub_1D5AB32E0()
{
  return MEMORY[0x1F414DAA0]();
}

uint64_t sub_1D5AB32F0()
{
  return MEMORY[0x1F414DAB8]();
}

uint64_t sub_1D5AB3300()
{
  return MEMORY[0x1F414DAC8]();
}

uint64_t sub_1D5AB3310()
{
  return MEMORY[0x1F414DB20]();
}

uint64_t sub_1D5AB3320()
{
  return MEMORY[0x1F414DB28]();
}

uint64_t sub_1D5AB3330()
{
  return MEMORY[0x1F414DB30]();
}

uint64_t sub_1D5AB3340()
{
  return MEMORY[0x1F414DB38]();
}

uint64_t sub_1D5AB3350()
{
  return MEMORY[0x1F414DB40]();
}

uint64_t sub_1D5AB3360()
{
  return MEMORY[0x1F414DB48]();
}

uint64_t sub_1D5AB3370()
{
  return MEMORY[0x1F414DB60]();
}

uint64_t sub_1D5AB3380()
{
  return MEMORY[0x1F414DB78]();
}

uint64_t sub_1D5AB3390()
{
  return MEMORY[0x1F414DBB8]();
}

uint64_t sub_1D5AB33A0()
{
  return MEMORY[0x1F414DC10]();
}

uint64_t sub_1D5AB33B0()
{
  return MEMORY[0x1F414DC20]();
}

uint64_t sub_1D5AB33C0()
{
  return MEMORY[0x1F414DC28]();
}

uint64_t sub_1D5AB33D0()
{
  return MEMORY[0x1F414DC30]();
}

uint64_t sub_1D5AB33E0()
{
  return MEMORY[0x1F414DC38]();
}

uint64_t sub_1D5AB33F0()
{
  return MEMORY[0x1F414DC40]();
}

uint64_t sub_1D5AB3400()
{
  return MEMORY[0x1F414DC48]();
}

uint64_t sub_1D5AB3410()
{
  return MEMORY[0x1F414DC50]();
}

uint64_t sub_1D5AB3420()
{
  return MEMORY[0x1F414DC60]();
}

uint64_t sub_1D5AB3430()
{
  return MEMORY[0x1F414DC68]();
}

uint64_t sub_1D5AB3440()
{
  return MEMORY[0x1F414DC70]();
}

uint64_t sub_1D5AB3450()
{
  return MEMORY[0x1F414DC78]();
}

uint64_t sub_1D5AB3460()
{
  return MEMORY[0x1F414DC80]();
}

uint64_t sub_1D5AB3470()
{
  return MEMORY[0x1F414DC88]();
}

uint64_t sub_1D5AB3480()
{
  return MEMORY[0x1F414DC90]();
}

uint64_t sub_1D5AB3490()
{
  return MEMORY[0x1F414DC98]();
}

uint64_t sub_1D5AB34A0()
{
  return MEMORY[0x1F414DCA0]();
}

uint64_t sub_1D5AB34B0()
{
  return MEMORY[0x1F414DCA8]();
}

uint64_t sub_1D5AB34C0()
{
  return MEMORY[0x1F414DCB0]();
}

uint64_t sub_1D5AB34D0()
{
  return MEMORY[0x1F414DCB8]();
}

uint64_t sub_1D5AB34E0()
{
  return MEMORY[0x1F414DD50]();
}

uint64_t sub_1D5AB34F0()
{
  return MEMORY[0x1F414DD70]();
}

uint64_t sub_1D5AB3500()
{
  return MEMORY[0x1F414DD90]();
}

uint64_t sub_1D5AB3510()
{
  return MEMORY[0x1F414DDA0]();
}

uint64_t sub_1D5AB3520()
{
  return MEMORY[0x1F414DDA8]();
}

uint64_t sub_1D5AB3530()
{
  return MEMORY[0x1F414DDB0]();
}

uint64_t sub_1D5AB3540()
{
  return MEMORY[0x1F414DDC0]();
}

uint64_t sub_1D5AB3550()
{
  return MEMORY[0x1F414DDD0]();
}

uint64_t sub_1D5AB3560()
{
  return MEMORY[0x1F414DE00]();
}

uint64_t sub_1D5AB3570()
{
  return MEMORY[0x1F414DE10]();
}

uint64_t sub_1D5AB3580()
{
  return MEMORY[0x1F414DE30]();
}

uint64_t sub_1D5AB3590()
{
  return MEMORY[0x1F414DE48]();
}

uint64_t sub_1D5AB35A0()
{
  return MEMORY[0x1F414DE98]();
}

uint64_t sub_1D5AB35B0()
{
  return MEMORY[0x1F414DEA0]();
}

uint64_t sub_1D5AB35C0()
{
  return MEMORY[0x1F414DEA8]();
}

uint64_t sub_1D5AB35D0()
{
  return MEMORY[0x1F414DEB0]();
}

uint64_t sub_1D5AB35E0()
{
  return MEMORY[0x1F414DEC8]();
}

uint64_t sub_1D5AB35F0()
{
  return MEMORY[0x1F414DEF0]();
}

uint64_t sub_1D5AB3600()
{
  return MEMORY[0x1F414DF18]();
}

uint64_t sub_1D5AB3610()
{
  return MEMORY[0x1F414DFA0]();
}

uint64_t sub_1D5AB3620()
{
  return MEMORY[0x1F414DFE0]();
}

uint64_t sub_1D5AB3630()
{
  return MEMORY[0x1F414E010]();
}

uint64_t sub_1D5AB3640()
{
  return MEMORY[0x1F414E020]();
}

uint64_t sub_1D5AB3650()
{
  return MEMORY[0x1F414E068]();
}

uint64_t sub_1D5AB3660()
{
  return MEMORY[0x1F414E078]();
}

uint64_t sub_1D5AB3670()
{
  return MEMORY[0x1F414E168]();
}

uint64_t sub_1D5AB3680()
{
  return MEMORY[0x1F414E1C8]();
}

uint64_t sub_1D5AB3690()
{
  return MEMORY[0x1F414E1E0]();
}

uint64_t sub_1D5AB3700()
{
  return MEMORY[0x1F414E290]();
}

uint64_t sub_1D5AB3710()
{
  return MEMORY[0x1F414E2A0]();
}

uint64_t sub_1D5AB3720()
{
  return MEMORY[0x1F414E2A8]();
}

uint64_t sub_1D5AB3730()
{
  return MEMORY[0x1F414E2B0]();
}

uint64_t sub_1D5AB3740()
{
  return MEMORY[0x1F414E2B8]();
}

uint64_t sub_1D5AB3750()
{
  return MEMORY[0x1F414E2C0]();
}

uint64_t sub_1D5AB3760()
{
  return MEMORY[0x1F414E2D0]();
}

uint64_t sub_1D5AB3770()
{
  return MEMORY[0x1F414E2E8]();
}

uint64_t sub_1D5AB3780()
{
  return MEMORY[0x1F414E2F0]();
}

uint64_t sub_1D5AB3790()
{
  return MEMORY[0x1F414E318]();
}

uint64_t sub_1D5AB37A0()
{
  return MEMORY[0x1F414E320]();
}

uint64_t sub_1D5AB37B0()
{
  return MEMORY[0x1F414E328]();
}

uint64_t sub_1D5AB37C0()
{
  return MEMORY[0x1F414E338]();
}

uint64_t sub_1D5AB37D0()
{
  return MEMORY[0x1F414E340]();
}

uint64_t sub_1D5AB37E0()
{
  return MEMORY[0x1F414E368]();
}

uint64_t sub_1D5AB37F0()
{
  return MEMORY[0x1F414E370]();
}

uint64_t sub_1D5AB3800()
{
  return MEMORY[0x1F414E378]();
}

uint64_t sub_1D5AB3810()
{
  return MEMORY[0x1F414E390]();
}

uint64_t sub_1D5AB3820()
{
  return MEMORY[0x1F414E3A0]();
}

uint64_t sub_1D5AB3830()
{
  return MEMORY[0x1F414E3C8]();
}

uint64_t sub_1D5AB3840()
{
  return MEMORY[0x1F414E418]();
}

uint64_t sub_1D5AB3850()
{
  return MEMORY[0x1F414E438]();
}

uint64_t sub_1D5AB3860()
{
  return MEMORY[0x1F414E478]();
}

uint64_t sub_1D5AB3870()
{
  return MEMORY[0x1F414E4C8]();
}

uint64_t sub_1D5AB3880()
{
  return MEMORY[0x1F414E4D0]();
}

uint64_t sub_1D5AB3890()
{
  return MEMORY[0x1F414E4D8]();
}

uint64_t sub_1D5AB38A0()
{
  return MEMORY[0x1F414E4E0]();
}

uint64_t sub_1D5AB38B0()
{
  return MEMORY[0x1F414E4E8]();
}

uint64_t sub_1D5AB38C0()
{
  return MEMORY[0x1F414E4F0]();
}

uint64_t sub_1D5AB38D0()
{
  return MEMORY[0x1F414E4F8]();
}

uint64_t sub_1D5AB38E0()
{
  return MEMORY[0x1F414E500]();
}

uint64_t sub_1D5AB38F0()
{
  return MEMORY[0x1F414E508]();
}

uint64_t sub_1D5AB3900()
{
  return MEMORY[0x1F414E510]();
}

uint64_t sub_1D5AB3910()
{
  return MEMORY[0x1F414E518]();
}

uint64_t sub_1D5AB3920()
{
  return MEMORY[0x1F414E520]();
}

uint64_t sub_1D5AB3930()
{
  return MEMORY[0x1F414E530]();
}

uint64_t sub_1D5AB3940()
{
  return MEMORY[0x1F414E540]();
}

uint64_t sub_1D5AB3950()
{
  return MEMORY[0x1F414E548]();
}

uint64_t sub_1D5AB3960()
{
  return MEMORY[0x1F414E550]();
}

uint64_t sub_1D5AB3970()
{
  return MEMORY[0x1F414E568]();
}

uint64_t sub_1D5AB3980()
{
  return MEMORY[0x1F414E598]();
}

uint64_t sub_1D5AB3990()
{
  return MEMORY[0x1F414E5C0]();
}

uint64_t sub_1D5AB39A0()
{
  return MEMORY[0x1F414E5C8]();
}

uint64_t sub_1D5AB39B0()
{
  return MEMORY[0x1F414E5E0]();
}

uint64_t sub_1D5AB39C0()
{
  return MEMORY[0x1F414E600]();
}

uint64_t sub_1D5AB39D0()
{
  return MEMORY[0x1F414E610]();
}

uint64_t sub_1D5AB39E0()
{
  return MEMORY[0x1F414E630]();
}

uint64_t sub_1D5AB39F0()
{
  return MEMORY[0x1F414E648]();
}

uint64_t sub_1D5AB3A00()
{
  return MEMORY[0x1F414E650]();
}

uint64_t sub_1D5AB3A10()
{
  return MEMORY[0x1F414E658]();
}

uint64_t sub_1D5AB3A20()
{
  return MEMORY[0x1F414E668]();
}

uint64_t sub_1D5AB3A30()
{
  return MEMORY[0x1F414E670]();
}

uint64_t sub_1D5AB3A40()
{
  return MEMORY[0x1F414E690]();
}

uint64_t sub_1D5AB3A50()
{
  return MEMORY[0x1F414E698]();
}

uint64_t sub_1D5AB3A60()
{
  return MEMORY[0x1F414E6A8]();
}

uint64_t sub_1D5AB3A70()
{
  return MEMORY[0x1F414E6B8]();
}

uint64_t sub_1D5AB3A80()
{
  return MEMORY[0x1F414E6F0]();
}

uint64_t sub_1D5AB3A90()
{
  return MEMORY[0x1F414E6F8]();
}

uint64_t sub_1D5AB3AA0()
{
  return MEMORY[0x1F414E708]();
}

uint64_t sub_1D5AB3AB0()
{
  return MEMORY[0x1F414E760]();
}

uint64_t sub_1D5AB3AC0()
{
  return MEMORY[0x1F414E778]();
}

uint64_t sub_1D5AB3AD0()
{
  return MEMORY[0x1F414E780]();
}

uint64_t sub_1D5AB3AE0()
{
  return MEMORY[0x1F414E7C0]();
}

uint64_t sub_1D5AB3AF0()
{
  return MEMORY[0x1F414E7C8]();
}

uint64_t sub_1D5AB3B00()
{
  return MEMORY[0x1F414E7D8]();
}

uint64_t sub_1D5AB3B10()
{
  return MEMORY[0x1F414E7E0]();
}

uint64_t sub_1D5AB3B20()
{
  return MEMORY[0x1F414E808]();
}

uint64_t sub_1D5AB3B30()
{
  return MEMORY[0x1F414E810]();
}

uint64_t sub_1D5AB3B40()
{
  return MEMORY[0x1F414E820]();
}

uint64_t sub_1D5AB3B50()
{
  return MEMORY[0x1F414E828]();
}

uint64_t sub_1D5AB3B60()
{
  return MEMORY[0x1F414E8E0]();
}

uint64_t sub_1D5AB3B70()
{
  return MEMORY[0x1F414E8E8]();
}

uint64_t sub_1D5AB3B80()
{
  return MEMORY[0x1F414E930]();
}

uint64_t sub_1D5AB3B90()
{
  return MEMORY[0x1F414E938]();
}

uint64_t sub_1D5AB3BA0()
{
  return MEMORY[0x1F414E958]();
}

uint64_t sub_1D5AB3BB0()
{
  return MEMORY[0x1F414E960]();
}

uint64_t sub_1D5AB3BC0()
{
  return MEMORY[0x1F414E9C0]();
}

uint64_t sub_1D5AB3BD0()
{
  return MEMORY[0x1F414EA18]();
}

uint64_t sub_1D5AB3BE0()
{
  return MEMORY[0x1F414EA20]();
}

uint64_t sub_1D5AB3BF0()
{
  return MEMORY[0x1F414EA30]();
}

uint64_t sub_1D5AB3C00()
{
  return MEMORY[0x1F414EA40]();
}

uint64_t sub_1D5AB3C10()
{
  return MEMORY[0x1F414EA58]();
}

uint64_t sub_1D5AB3C20()
{
  return MEMORY[0x1F414EA60]();
}

uint64_t sub_1D5AB3C30()
{
  return MEMORY[0x1F414EA68]();
}

uint64_t sub_1D5AB3C40()
{
  return MEMORY[0x1F414EA70]();
}

uint64_t sub_1D5AB3C50()
{
  return MEMORY[0x1F414EA78]();
}

uint64_t sub_1D5AB3C60()
{
  return MEMORY[0x1F414EA80]();
}

uint64_t sub_1D5AB3C70()
{
  return MEMORY[0x1F414EA88]();
}

uint64_t sub_1D5AB3C80()
{
  return MEMORY[0x1F414EA90]();
}

uint64_t sub_1D5AB3C90()
{
  return MEMORY[0x1F414EA98]();
}

uint64_t sub_1D5AB3CA0()
{
  return MEMORY[0x1F414EAA0]();
}

uint64_t sub_1D5AB3CB0()
{
  return MEMORY[0x1F414EAA8]();
}

uint64_t sub_1D5AB3CC0()
{
  return MEMORY[0x1F414EAB0]();
}

uint64_t sub_1D5AB3CD0()
{
  return MEMORY[0x1F414EAB8]();
}

uint64_t sub_1D5AB3CE0()
{
  return MEMORY[0x1F414EAC0]();
}

uint64_t sub_1D5AB3CF0()
{
  return MEMORY[0x1F414EAC8]();
}

uint64_t sub_1D5AB3D00()
{
  return MEMORY[0x1F414EAD0]();
}

uint64_t sub_1D5AB3D10()
{
  return MEMORY[0x1F414EAD8]();
}

uint64_t sub_1D5AB3D20()
{
  return MEMORY[0x1F414EAE0]();
}

uint64_t sub_1D5AB3D30()
{
  return MEMORY[0x1F414EAE8]();
}

uint64_t sub_1D5AB3D40()
{
  return MEMORY[0x1F414EAF0]();
}

uint64_t sub_1D5AB3D50()
{
  return MEMORY[0x1F414EAF8]();
}

uint64_t sub_1D5AB3D60()
{
  return MEMORY[0x1F414EB00]();
}

uint64_t sub_1D5AB3D70()
{
  return MEMORY[0x1F414EB08]();
}

uint64_t sub_1D5AB3D80()
{
  return MEMORY[0x1F414EB10]();
}

uint64_t sub_1D5AB3D90()
{
  return MEMORY[0x1F414EB18]();
}

uint64_t sub_1D5AB3DA0()
{
  return MEMORY[0x1F414EB20]();
}

uint64_t sub_1D5AB3DB0()
{
  return MEMORY[0x1F414EB28]();
}

uint64_t sub_1D5AB3DC0()
{
  return MEMORY[0x1F414EB30]();
}

uint64_t sub_1D5AB3DD0()
{
  return MEMORY[0x1F414EB38]();
}

uint64_t sub_1D5AB3DE0()
{
  return MEMORY[0x1F414EB48]();
}

uint64_t sub_1D5AB3DF0()
{
  return MEMORY[0x1F414EB50]();
}

uint64_t sub_1D5AB3E00()
{
  return MEMORY[0x1F414EB60]();
}

uint64_t sub_1D5AB3E10()
{
  return MEMORY[0x1F414EB68]();
}

uint64_t sub_1D5AB3E20()
{
  return MEMORY[0x1F414EBA0]();
}

uint64_t sub_1D5AB3E30()
{
  return MEMORY[0x1F414EBA8]();
}

uint64_t sub_1D5AB3E40()
{
  return MEMORY[0x1F414EBB0]();
}

uint64_t sub_1D5AB3E50()
{
  return MEMORY[0x1F414EBE8]();
}

uint64_t sub_1D5AB3E60()
{
  return MEMORY[0x1F414EC50]();
}

uint64_t sub_1D5AB3E70()
{
  return MEMORY[0x1F414EC58]();
}

uint64_t sub_1D5AB3E80()
{
  return MEMORY[0x1F414EC70]();
}

uint64_t sub_1D5AB3E90()
{
  return MEMORY[0x1F414EC78]();
}

uint64_t sub_1D5AB3EA0()
{
  return MEMORY[0x1F414EC80]();
}

uint64_t sub_1D5AB3EB0()
{
  return MEMORY[0x1F414EC90]();
}

uint64_t sub_1D5AB3EC0()
{
  return MEMORY[0x1F414EC98]();
}

uint64_t sub_1D5AB3ED0()
{
  return MEMORY[0x1F414ECB8]();
}

uint64_t sub_1D5AB3EE0()
{
  return MEMORY[0x1F414ECC8]();
}

uint64_t sub_1D5AB3EF0()
{
  return MEMORY[0x1F414ECD8]();
}

uint64_t sub_1D5AB3F00()
{
  return MEMORY[0x1F414ED08]();
}

uint64_t sub_1D5AB3F10()
{
  return MEMORY[0x1F414ED10]();
}

uint64_t sub_1D5AB3F20()
{
  return MEMORY[0x1F414ED18]();
}

uint64_t sub_1D5AB3F30()
{
  return MEMORY[0x1F414ED20]();
}

uint64_t sub_1D5AB3F40()
{
  return MEMORY[0x1F414ED28]();
}

uint64_t sub_1D5AB3F50()
{
  return MEMORY[0x1F414ED38]();
}

uint64_t sub_1D5AB3F60()
{
  return MEMORY[0x1F414ED40]();
}

uint64_t sub_1D5AB3F70()
{
  return MEMORY[0x1F414ED50]();
}

uint64_t sub_1D5AB3F80()
{
  return MEMORY[0x1F414ED68]();
}

uint64_t sub_1D5AB3F90()
{
  return MEMORY[0x1F414ED98]();
}

uint64_t sub_1D5AB3FA0()
{
  return MEMORY[0x1F414EDB0]();
}

uint64_t sub_1D5AB3FB0()
{
  return MEMORY[0x1F414EDB8]();
}

uint64_t sub_1D5AB3FC0()
{
  return MEMORY[0x1F414EDE0]();
}

uint64_t sub_1D5AB3FD0()
{
  return MEMORY[0x1F414EDF8]();
}

uint64_t sub_1D5AB3FE0()
{
  return MEMORY[0x1F414EE00]();
}

uint64_t sub_1D5AB3FF0()
{
  return MEMORY[0x1F414EE38]();
}

uint64_t sub_1D5AB4000()
{
  return MEMORY[0x1F414EE50]();
}

uint64_t sub_1D5AB4010()
{
  return MEMORY[0x1F414EE58]();
}

uint64_t sub_1D5AB4020()
{
  return MEMORY[0x1F414EE60]();
}

uint64_t sub_1D5AB4030()
{
  return MEMORY[0x1F414EE70]();
}

uint64_t sub_1D5AB4040()
{
  return MEMORY[0x1F414EE78]();
}

uint64_t sub_1D5AB4050()
{
  return MEMORY[0x1F414EE80]();
}

uint64_t sub_1D5AB4060()
{
  return MEMORY[0x1F414EE88]();
}

uint64_t sub_1D5AB4070()
{
  return MEMORY[0x1F414EE90]();
}

uint64_t sub_1D5AB4080()
{
  return MEMORY[0x1F414EEA8]();
}

uint64_t sub_1D5AB4090()
{
  return MEMORY[0x1F414EEB8]();
}

uint64_t sub_1D5AB40A0()
{
  return MEMORY[0x1F414EEC8]();
}

uint64_t sub_1D5AB40B0()
{
  return MEMORY[0x1F414EED0]();
}

uint64_t sub_1D5AB40C0()
{
  return MEMORY[0x1F414EF20]();
}

uint64_t sub_1D5AB40D0()
{
  return MEMORY[0x1F414EF68]();
}

uint64_t sub_1D5AB40E0()
{
  return MEMORY[0x1F414EF70]();
}

uint64_t sub_1D5AB40F0()
{
  return MEMORY[0x1F414EF80]();
}

uint64_t sub_1D5AB4100()
{
  return MEMORY[0x1F414F168]();
}

uint64_t sub_1D5AB4110()
{
  return MEMORY[0x1F414F1C8]();
}

uint64_t sub_1D5AB4120()
{
  return MEMORY[0x1F414F1D0]();
}

uint64_t sub_1D5AB4130()
{
  return MEMORY[0x1F414F1D8]();
}

uint64_t sub_1D5AB4140()
{
  return MEMORY[0x1F414F1E0]();
}

uint64_t sub_1D5AB4150()
{
  return MEMORY[0x1F414F1E8]();
}

uint64_t sub_1D5AB4160()
{
  return MEMORY[0x1F414F1F0]();
}

uint64_t sub_1D5AB4170()
{
  return MEMORY[0x1F414F1F8]();
}

uint64_t sub_1D5AB4180()
{
  return MEMORY[0x1F414F200]();
}

uint64_t sub_1D5AB4190()
{
  return MEMORY[0x1F414F218]();
}

uint64_t sub_1D5AB41A0()
{
  return MEMORY[0x1F414F228]();
}

uint64_t sub_1D5AB41B0()
{
  return MEMORY[0x1F414F2F0]();
}

uint64_t sub_1D5AB41C0()
{
  return MEMORY[0x1F414F2F8]();
}

uint64_t sub_1D5AB41D0()
{
  return MEMORY[0x1F414F308]();
}

uint64_t sub_1D5AB41E0()
{
  return MEMORY[0x1F414F318]();
}

uint64_t sub_1D5AB41F0()
{
  return MEMORY[0x1F414F338]();
}

uint64_t sub_1D5AB4200()
{
  return MEMORY[0x1F414F348]();
}

uint64_t sub_1D5AB4210()
{
  return MEMORY[0x1F414F358]();
}

uint64_t sub_1D5AB4220()
{
  return MEMORY[0x1F414F370]();
}

uint64_t sub_1D5AB4230()
{
  return MEMORY[0x1F414F3C0]();
}

uint64_t sub_1D5AB4240()
{
  return MEMORY[0x1F414F3C8]();
}

uint64_t sub_1D5AB4250()
{
  return MEMORY[0x1F414F3D0]();
}

uint64_t sub_1D5AB4260()
{
  return MEMORY[0x1F414F3D8]();
}

uint64_t sub_1D5AB4270()
{
  return MEMORY[0x1F414F3E0]();
}

uint64_t sub_1D5AB4280()
{
  return MEMORY[0x1F414F3E8]();
}

uint64_t sub_1D5AB4290()
{
  return MEMORY[0x1F414F3F0]();
}

uint64_t sub_1D5AB42A0()
{
  return MEMORY[0x1F414F3F8]();
}

uint64_t sub_1D5AB42B0()
{
  return MEMORY[0x1F414F400]();
}

uint64_t sub_1D5AB42C0()
{
  return MEMORY[0x1F414F408]();
}

uint64_t sub_1D5AB42D0()
{
  return MEMORY[0x1F414F410]();
}

uint64_t sub_1D5AB42E0()
{
  return MEMORY[0x1F414F418]();
}

uint64_t sub_1D5AB42F0()
{
  return MEMORY[0x1F414F430]();
}

uint64_t sub_1D5AB4300()
{
  return MEMORY[0x1F414F440]();
}

uint64_t sub_1D5AB4310()
{
  return MEMORY[0x1F414F450]();
}

uint64_t sub_1D5AB4320()
{
  return MEMORY[0x1F414F470]();
}

uint64_t sub_1D5AB4330()
{
  return MEMORY[0x1F414F488]();
}

uint64_t sub_1D5AB4340()
{
  return MEMORY[0x1F414F490]();
}

uint64_t sub_1D5AB4350()
{
  return MEMORY[0x1F414F4B8]();
}

uint64_t sub_1D5AB4360()
{
  return MEMORY[0x1F414F4D8]();
}

uint64_t sub_1D5AB4370()
{
  return MEMORY[0x1F414F4E8]();
}

uint64_t sub_1D5AB4380()
{
  return MEMORY[0x1F414F4F0]();
}

uint64_t sub_1D5AB4390()
{
  return MEMORY[0x1F414F518]();
}

uint64_t sub_1D5AB43A0()
{
  return MEMORY[0x1F414F520]();
}

uint64_t sub_1D5AB43B0()
{
  return MEMORY[0x1F414F528]();
}

uint64_t sub_1D5AB43C0()
{
  return MEMORY[0x1F414F538]();
}

uint64_t sub_1D5AB43D0()
{
  return MEMORY[0x1F414F540]();
}

uint64_t sub_1D5AB43E0()
{
  return MEMORY[0x1F414F548]();
}

uint64_t sub_1D5AB43F0()
{
  return MEMORY[0x1F414F578]();
}

uint64_t sub_1D5AB4400()
{
  return MEMORY[0x1F414F5A8]();
}

uint64_t sub_1D5AB4410()
{
  return MEMORY[0x1F414F5B8]();
}

uint64_t sub_1D5AB4420()
{
  return MEMORY[0x1F414F5E8]();
}

uint64_t sub_1D5AB4430()
{
  return MEMORY[0x1F414F628]();
}

uint64_t sub_1D5AB4440()
{
  return MEMORY[0x1F414F638]();
}

uint64_t sub_1D5AB4450()
{
  return MEMORY[0x1F414F640]();
}

uint64_t sub_1D5AB4460()
{
  return MEMORY[0x1F414F690]();
}

uint64_t sub_1D5AB4470()
{
  return MEMORY[0x1F414F6A0]();
}

uint64_t sub_1D5AB4480()
{
  return MEMORY[0x1F414F6A8]();
}

uint64_t sub_1D5AB4490()
{
  return MEMORY[0x1F414F6B0]();
}

uint64_t sub_1D5AB44A0()
{
  return MEMORY[0x1F414F6B8]();
}

uint64_t sub_1D5AB44B0()
{
  return MEMORY[0x1F414F6D0]();
}

uint64_t sub_1D5AB44C0()
{
  return MEMORY[0x1F414F6F0]();
}

uint64_t sub_1D5AB44D0()
{
  return MEMORY[0x1F414F700]();
}

uint64_t sub_1D5AB44E0()
{
  return MEMORY[0x1F414F738]();
}

uint64_t sub_1D5AB44F0()
{
  return MEMORY[0x1F414F760]();
}

uint64_t sub_1D5AB4500()
{
  return MEMORY[0x1F414F7E8]();
}

uint64_t sub_1D5AB4510()
{
  return MEMORY[0x1F414F7F0]();
}

uint64_t sub_1D5AB4520()
{
  return MEMORY[0x1F414F7F8]();
}

uint64_t sub_1D5AB4530()
{
  return MEMORY[0x1F414F808]();
}

uint64_t sub_1D5AB4540()
{
  return MEMORY[0x1F414F840]();
}

uint64_t sub_1D5AB4550()
{
  return MEMORY[0x1F414F848]();
}

uint64_t sub_1D5AB4560()
{
  return MEMORY[0x1F414F850]();
}

uint64_t sub_1D5AB4570()
{
  return MEMORY[0x1F414F858]();
}

uint64_t sub_1D5AB4580()
{
  return MEMORY[0x1F414F860]();
}

uint64_t sub_1D5AB4590()
{
  return MEMORY[0x1F414F868]();
}

uint64_t sub_1D5AB45A0()
{
  return MEMORY[0x1F414F870]();
}

uint64_t sub_1D5AB45B0()
{
  return MEMORY[0x1F414F878]();
}

uint64_t sub_1D5AB45C0()
{
  return MEMORY[0x1F414F880]();
}

uint64_t sub_1D5AB45D0()
{
  return MEMORY[0x1F414F888]();
}

uint64_t sub_1D5AB45E0()
{
  return MEMORY[0x1F414F890]();
}

uint64_t sub_1D5AB45F0()
{
  return MEMORY[0x1F414F898]();
}

uint64_t sub_1D5AB4600()
{
  return MEMORY[0x1F414F8A0]();
}

uint64_t sub_1D5AB4610()
{
  return MEMORY[0x1F414F8A8]();
}

uint64_t sub_1D5AB4620()
{
  return MEMORY[0x1F414F8B0]();
}

uint64_t sub_1D5AB4630()
{
  return MEMORY[0x1F414F8B8]();
}

uint64_t sub_1D5AB4640()
{
  return MEMORY[0x1F414F8C0]();
}

uint64_t sub_1D5AB4650()
{
  return MEMORY[0x1F414F8C8]();
}

uint64_t sub_1D5AB4660()
{
  return MEMORY[0x1F414F8D0]();
}

uint64_t sub_1D5AB4670()
{
  return MEMORY[0x1F414F8D8]();
}

uint64_t sub_1D5AB4680()
{
  return MEMORY[0x1F414F8E0]();
}

uint64_t sub_1D5AB4690()
{
  return MEMORY[0x1F414F8E8]();
}

uint64_t sub_1D5AB46A0()
{
  return MEMORY[0x1F414F8F0]();
}

uint64_t sub_1D5AB46B0()
{
  return MEMORY[0x1F414F8F8]();
}

uint64_t sub_1D5AB46C0()
{
  return MEMORY[0x1F414F900]();
}

uint64_t sub_1D5AB46D0()
{
  return MEMORY[0x1F414F908]();
}

uint64_t sub_1D5AB46E0()
{
  return MEMORY[0x1F414F910]();
}

uint64_t sub_1D5AB46F0()
{
  return MEMORY[0x1F414F918]();
}

uint64_t sub_1D5AB4700()
{
  return MEMORY[0x1F414F920]();
}

uint64_t sub_1D5AB4710()
{
  return MEMORY[0x1F414F928]();
}

uint64_t sub_1D5AB4720()
{
  return MEMORY[0x1F414F930]();
}

uint64_t sub_1D5AB4730()
{
  return MEMORY[0x1F414F938]();
}

uint64_t sub_1D5AB4740()
{
  return MEMORY[0x1F414F940]();
}

uint64_t sub_1D5AB4750()
{
  return MEMORY[0x1F414F948]();
}

uint64_t sub_1D5AB4760()
{
  return MEMORY[0x1F414F950]();
}

uint64_t sub_1D5AB4770()
{
  return MEMORY[0x1F414F958]();
}

uint64_t sub_1D5AB4780()
{
  return MEMORY[0x1F414F960]();
}

uint64_t sub_1D5AB4790()
{
  return MEMORY[0x1F414F968]();
}

uint64_t sub_1D5AB47A0()
{
  return MEMORY[0x1F414F970]();
}

uint64_t sub_1D5AB47B0()
{
  return MEMORY[0x1F414F978]();
}

uint64_t sub_1D5AB47C0()
{
  return MEMORY[0x1F414F980]();
}

uint64_t sub_1D5AB47D0()
{
  return MEMORY[0x1F414F988]();
}

uint64_t sub_1D5AB47E0()
{
  return MEMORY[0x1F414F990]();
}

uint64_t sub_1D5AB47F0()
{
  return MEMORY[0x1F414F998]();
}

uint64_t sub_1D5AB4800()
{
  return MEMORY[0x1F414F9A0]();
}

uint64_t sub_1D5AB4810()
{
  return MEMORY[0x1F414F9A8]();
}

uint64_t sub_1D5AB4820()
{
  return MEMORY[0x1F414F9B0]();
}

uint64_t sub_1D5AB4830()
{
  return MEMORY[0x1F414F9B8]();
}

uint64_t sub_1D5AB4840()
{
  return MEMORY[0x1F414F9C0]();
}

uint64_t sub_1D5AB4850()
{
  return MEMORY[0x1F414F9C8]();
}

uint64_t sub_1D5AB4860()
{
  return MEMORY[0x1F414F9D0]();
}

uint64_t sub_1D5AB4870()
{
  return MEMORY[0x1F414F9E0]();
}

uint64_t sub_1D5AB4880()
{
  return MEMORY[0x1F414F9E8]();
}

uint64_t sub_1D5AB4890()
{
  return MEMORY[0x1F414F9F0]();
}

uint64_t sub_1D5AB48A0()
{
  return MEMORY[0x1F414FA18]();
}

uint64_t sub_1D5AB48B0()
{
  return MEMORY[0x1F414FA20]();
}

uint64_t sub_1D5AB48C0()
{
  return MEMORY[0x1F414FA30]();
}

uint64_t sub_1D5AB48D0()
{
  return MEMORY[0x1F414FA38]();
}

uint64_t sub_1D5AB48E0()
{
  return MEMORY[0x1F414FA40]();
}

uint64_t sub_1D5AB48F0()
{
  return MEMORY[0x1F414FA60]();
}

uint64_t sub_1D5AB4900()
{
  return MEMORY[0x1F414FA68]();
}

uint64_t sub_1D5AB4910()
{
  return MEMORY[0x1F414FA70]();
}

uint64_t sub_1D5AB4920()
{
  return MEMORY[0x1F414FA78]();
}

uint64_t sub_1D5AB4930()
{
  return MEMORY[0x1F414FAA0]();
}

uint64_t sub_1D5AB4940()
{
  return MEMORY[0x1F414FAA8]();
}

uint64_t sub_1D5AB4950()
{
  return MEMORY[0x1F414FAB0]();
}

uint64_t sub_1D5AB4960()
{
  return MEMORY[0x1F414FAD0]();
}

uint64_t sub_1D5AB4970()
{
  return MEMORY[0x1F414FAD8]();
}

uint64_t sub_1D5AB4980()
{
  return MEMORY[0x1F414FAE8]();
}

uint64_t sub_1D5AB4990()
{
  return MEMORY[0x1F414FAF0]();
}

uint64_t sub_1D5AB49A0()
{
  return MEMORY[0x1F414FAF8]();
}

uint64_t sub_1D5AB49B0()
{
  return MEMORY[0x1F414FB00]();
}

uint64_t sub_1D5AB49C0()
{
  return MEMORY[0x1F414FB08]();
}

uint64_t sub_1D5AB49D0()
{
  return MEMORY[0x1F414FB18]();
}

uint64_t sub_1D5AB49E0()
{
  return MEMORY[0x1F414FB40]();
}

uint64_t sub_1D5AB49F0()
{
  return MEMORY[0x1F414FB50]();
}

uint64_t sub_1D5AB4A00()
{
  return MEMORY[0x1F414FB60]();
}

uint64_t sub_1D5AB4A10()
{
  return MEMORY[0x1F414FB68]();
}

uint64_t sub_1D5AB4A20()
{
  return MEMORY[0x1F414FB70]();
}

uint64_t sub_1D5AB4A30()
{
  return MEMORY[0x1F414FB78]();
}

uint64_t sub_1D5AB4A40()
{
  return MEMORY[0x1F414FB90]();
}

uint64_t sub_1D5AB4A50()
{
  return MEMORY[0x1F414FBA0]();
}

uint64_t sub_1D5AB4A60()
{
  return MEMORY[0x1F414FBA8]();
}

uint64_t sub_1D5AB4A70()
{
  return MEMORY[0x1F41273A0]();
}

uint64_t sub_1D5AB4A80()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_1D5AB4A90()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1D5AB4AA0()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1D5AB4AB0()
{
  return MEMORY[0x1F41885A8]();
}

uint64_t sub_1D5AB4AC0()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1D5AB4AD0()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1D5AB4AE0()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1D5AB4AF0()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1D5AB4B00()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1D5AB4B10()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1D5AB4B20()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1D5AB4B30()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D5AB4B40()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1D5AB4B50()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D5AB4B60()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1D5AB4B70()
{
  return MEMORY[0x1F40F1FF0]();
}

uint64_t sub_1D5AB4B80()
{
  return MEMORY[0x1F40F2388]();
}

uint64_t sub_1D5AB4B90()
{
  return MEMORY[0x1F40F2398]();
}

uint64_t sub_1D5AB4BA0()
{
  return MEMORY[0x1F40F23A0]();
}

uint64_t sub_1D5AB4BB0()
{
  return MEMORY[0x1F40F23A8]();
}

uint64_t sub_1D5AB4BC0()
{
  return MEMORY[0x1F40F23C0]();
}

uint64_t sub_1D5AB4BD0()
{
  return MEMORY[0x1F40F23C8]();
}

uint64_t sub_1D5AB4BE0()
{
  return MEMORY[0x1F40F2690]();
}

uint64_t sub_1D5AB4BF0()
{
  return MEMORY[0x1F40F26B0]();
}

uint64_t sub_1D5AB4C00()
{
  return MEMORY[0x1F40F26E0]();
}

uint64_t sub_1D5AB4C10()
{
  return MEMORY[0x1F40F2700]();
}

uint64_t sub_1D5AB4C20()
{
  return MEMORY[0x1F40F2708]();
}

uint64_t sub_1D5AB4C30()
{
  return MEMORY[0x1F40F2718]();
}

uint64_t sub_1D5AB4C40()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1D5AB4C50()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D5AB4C60()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D5AB4C70()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D5AB4C80()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1D5AB4C90()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1D5AB4CA0()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1D5AB4CB0()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1D5AB4CC0()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1D5AB4CD0()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1D5AB4CE0()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1D5AB4CF0()
{
  return MEMORY[0x1F40DFF50]();
}

uint64_t sub_1D5AB4D00()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1D5AB4D10()
{
  return MEMORY[0x1F40E0540]();
}

uint64_t sub_1D5AB4D20()
{
  return MEMORY[0x1F40E0550]();
}

uint64_t sub_1D5AB4D30()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1D5AB4D40()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1D5AB4D50()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1D5AB4D60()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D5AB4D70()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D5AB4D80()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1D5AB4D90()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D5AB4DA0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1D5AB4DB0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1D5AB4DC0()
{
  return MEMORY[0x1F4183818]();
}

uint64_t sub_1D5AB4DD0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D5AB4DE0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D5AB4DF0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D5AB4E00()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1D5AB4E10()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1D5AB4E20()
{
  return MEMORY[0x1F414FBC0]();
}

uint64_t sub_1D5AB4E30()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1D5AB4E40()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1D5AB4E50()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1D5AB4E60()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D5AB4E70()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1D5AB4E80()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1D5AB4E90()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D5AB4EA0()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1D5AB4EB0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D5AB4EC0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1D5AB4ED0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1D5AB4EF0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1D5AB4F00()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1D5AB4F10()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1D5AB4F20()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1D5AB4F30()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1D5AB4F40()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1D5AB4F50()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1D5AB4F60()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1D5AB4F70()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1D5AB4F80()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1D5AB4F90()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1D5AB4FA0()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1D5AB4FB0()
{
  return MEMORY[0x1F414FBE8]();
}

uint64_t sub_1D5AB4FC0()
{
  return MEMORY[0x1F414FBF0]();
}

uint64_t sub_1D5AB4FD0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1D5AB4FE0()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1D5AB4FF0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1D5AB5000()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1D5AB5010()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1D5AB5020()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1D5AB5030()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D5AB5040()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D5AB5050()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D5AB5060()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D5AB5070()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1D5AB5080()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1D5AB5090()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D5AB50A0()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1D5AB50B0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1D5AB50C0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1D5AB50D0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D5AB50E0()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1D5AB50F0()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1D5AB5100()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1D5AB5110()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1D5AB5120()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D5AB5130()
{
  return MEMORY[0x1F414FC38]();
}

uint64_t sub_1D5AB5140()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1D5AB5150()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1D5AB5160()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1D5AB5170()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1D5AB5190()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1D5AB51A0()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1D5AB51B0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D5AB51C0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D5AB51D0()
{
  return MEMORY[0x1F4187D10]();
}

uint64_t sub_1D5AB51E0()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t sub_1D5AB51F0()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t sub_1D5AB5200()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1D5AB5210()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1D5AB5220()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1D5AB5230()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1D5AB5240()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1D5AB5250()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1D5AB5280()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1D5AB5290()
{
  return MEMORY[0x1F4187E60]();
}

uint64_t sub_1D5AB52A0()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1D5AB52B0()
{
  return MEMORY[0x1F4187EA8]();
}

uint64_t sub_1D5AB52C0()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1D5AB52D0()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1D5AB52E0()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1D5AB52F0()
{
  return MEMORY[0x1F414FC40]();
}

uint64_t sub_1D5AB5300()
{
  return MEMORY[0x1F414FC48]();
}

uint64_t sub_1D5AB5310()
{
  return MEMORY[0x1F414FC50]();
}

uint64_t sub_1D5AB5320()
{
  return MEMORY[0x1F414FC60]();
}

uint64_t sub_1D5AB5330()
{
  return MEMORY[0x1F414FC78]();
}

uint64_t sub_1D5AB5340()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1D5AB5350()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D5AB5360()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1D5AB5370()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1D5AB5380()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1D5AB5390()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1D5AB53A0()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1D5AB53B0()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1D5AB53C0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1D5AB53D0()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1D5AB53E0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1D5AB53F0()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1D5AB5400()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1D5AB5410()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D5AB5420()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1D5AB5430()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D5AB5440()
{
  return MEMORY[0x1F40E7960]();
}

uint64_t sub_1D5AB5450()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1D5AB5460()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1D5AB5470()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1D5AB5480()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1D5AB5490()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1D5AB54A0()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1D5AB54B0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1D5AB54C0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1D5AB54D0()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1D5AB54E0()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1D5AB54F0()
{
  return MEMORY[0x1F41871C8]();
}

uint64_t sub_1D5AB5500()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1D5AB5510()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1D5AB5520()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1D5AB5530()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1D5AB5540()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1D5AB5550()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1D5AB5560()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1D5AB5570()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1D5AB5580()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1D5AB5590()
{
  return MEMORY[0x1F41872D8]();
}

uint64_t sub_1D5AB55A0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1D5AB55B0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D5AB55C0()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1D5AB55D0()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1D5AB55E0()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1D5AB55F0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1D5AB5600()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1D5AB5610()
{
  return MEMORY[0x1F414FCC8]();
}

uint64_t sub_1D5AB5620()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1D5AB5630()
{
  return MEMORY[0x1F4184668]();
}

uint64_t sub_1D5AB5640()
{
  return MEMORY[0x1F4184680]();
}

uint64_t sub_1D5AB5650()
{
  return MEMORY[0x1F41846A0]();
}

uint64_t sub_1D5AB5660()
{
  return MEMORY[0x1F41846C0]();
}

uint64_t sub_1D5AB5670()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1D5AB5680()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D5AB5690()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D5AB56A0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1D5AB56B0()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1D5AB56C0()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1D5AB56D0()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1D5AB56E0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D5AB56F0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D5AB5700()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D5AB5710()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1D5AB5720()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1D5AB5730()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1D5AB5740()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1D5AB5750()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1D5AB5760()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1D5AB5770()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D5AB5780()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D5AB5790()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D5AB57A0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1D5AB57B0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1D5AB57C0()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1D5AB57D0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D5AB57E0()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1D5AB57F0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1D5AB5800()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D5AB5810()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1D5AB5820()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D5AB5830()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1D5AB5840()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1D5AB5850()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1D5AB5860()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1D5AB5870()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D5AB5880()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1D5AB5890()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1D5AB58A0()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1D5AB58B0()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1D5AB58C0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1D5AB58D0()
{
  return MEMORY[0x1F4185088]();
}

uint64_t sub_1D5AB58E0()
{
  return MEMORY[0x1F4185090]();
}

uint64_t sub_1D5AB58F0()
{
  return MEMORY[0x1F4185098]();
}

uint64_t sub_1D5AB5900()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1D5AB5910()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D5AB5920()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D5AB5930()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1D5AB5940()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1D5AB5950()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1D5AB5960()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1D5AB5970()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1D5AB5980()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D5AB5990()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D5AB59A0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D5AB59B0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D5AB59C0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D5AB59D0()
{
  return MEMORY[0x1F4188040]();
}

uint64_t sub_1D5AB59E0()
{
  return MEMORY[0x1F4188048]();
}

uint64_t sub_1D5AB59F0()
{
  return MEMORY[0x1F4188050]();
}

uint64_t sub_1D5AB5A00()
{
  return MEMORY[0x1F4188058]();
}

uint64_t sub_1D5AB5A10()
{
  return MEMORY[0x1F4188060]();
}

uint64_t sub_1D5AB5A20()
{
  return MEMORY[0x1F4188068]();
}

uint64_t sub_1D5AB5A30()
{
  return MEMORY[0x1F4188070]();
}

uint64_t sub_1D5AB5A40()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1D5AB5A60()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1D5AB5A70()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1D5AB5A80()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1D5AB5A90()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1D5AB5AA0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1D5AB5AB0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D5AB5AC0()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1D5AB5AD0()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1D5AB5AE0()
{
  return MEMORY[0x1F4185A18]();
}

uint64_t sub_1D5AB5AF0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D5AB5B00()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1D5AB5B10()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1D5AB5B20()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1D5AB5B40()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1D5AB5B50()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D5AB5B60()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1D5AB5B70()
{
  return MEMORY[0x1F414FCD8]();
}

uint64_t sub_1D5AB5B80()
{
  return MEMORY[0x1F414FCE0]();
}

uint64_t sub_1D5AB5B90()
{
  return MEMORY[0x1F414FCE8]();
}

uint64_t sub_1D5AB5BA0()
{
  return MEMORY[0x1F414FCF8]();
}

uint64_t sub_1D5AB5BB0()
{
  return MEMORY[0x1F414FD00]();
}

uint64_t sub_1D5AB5BC0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D5AB5BD0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D5AB5BE0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D5AB5BF0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D5AB5C00()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1D5AB5C10()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1D5AB5C20()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D5AB5C30()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D5AB5C40()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1D5AB5C50()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1D5AB5C60()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1D5AB5C70()
{
  return MEMORY[0x1F414FD08]();
}

uint64_t sub_1D5AB5C80()
{
  return MEMORY[0x1F414FD18]();
}

uint64_t sub_1D5AB5C90()
{
  return MEMORY[0x1F414FD20]();
}

uint64_t sub_1D5AB5CA0()
{
  return MEMORY[0x1F414FD28]();
}

uint64_t sub_1D5AB5CB0()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1D5AB5CC0()
{
  return MEMORY[0x1F414FD30]();
}

uint64_t sub_1D5AB5CD0()
{
  return MEMORY[0x1F40E6ED8]();
}

uint64_t sub_1D5AB5CE0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1D5AB5CF0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1D5AB5D20()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t HKWorkoutSessionStateToString()
{
  return MEMORY[0x1F40E80C8]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x1F417CE68]();
}

uint64_t MobileGestalt_copy_uniqueDeviceID_obj()
{
  return MEMORY[0x1F417CE80]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x1F417CEA0]();
}

uint64_t MobileGestalt_get_hasExtendedColorDisplay()
{
  return MEMORY[0x1F417CED0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1F41863A0]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1F41866F0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}