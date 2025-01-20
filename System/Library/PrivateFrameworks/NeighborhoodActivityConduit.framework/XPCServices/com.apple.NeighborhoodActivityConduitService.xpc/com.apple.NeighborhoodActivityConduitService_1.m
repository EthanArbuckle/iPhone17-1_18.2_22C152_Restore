uint64_t sub_1000B5D04()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  NSString v20;
  uint64_t (*v21)(void);
  uint64_t v23;
  void *v24;
  uint64_t v25;

  v24 = v0;
  v1 = (void *)v0[4];
  v2 = v1[16];
  if (v2)
  {
    v3 = v1[15];
    v4 = v0[3];
    v6 = v1[21];
    v5 = (void *)v1[22];
    v8 = v1[19];
    v7 = v1[20];
    v10 = v1[17];
    v9 = v1[18];
    sub_10009E618(v3, v2, v10, v9, v8, v7, v6, v5);
    swift_bridgeObjectRetain();
    sub_10009E690(v3, v2, v10, v9, v8, v7, v6, v5);
    v12 = *(void *)(v4 + 16);
    v11 = *(void *)(v4 + 24);
    if (v3 == v12 && v2 == v11)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_1000E2C80();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_15;
      }
    }
    if (qword_1001161B0 != -1) {
      swift_once();
    }
    v15 = sub_1000E2030();
    sub_10000AD90(v15, (uint64_t)qword_100118E60);
    swift_retain();
    v16 = sub_1000E2010();
    v17 = sub_1000E2700();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v0[2] = sub_1000DACC8(v12, v11, &v23);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Camera session with %s is being torn down - exiting discovery session.", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    v19 = *(void **)(v0[4] + 232);
    v20 = sub_1000E23E0();
    [v19 exitDiscoverySessionWithReason:v20];
  }
LABEL_15:
  v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_1000B5FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  uint64_t v5 = sub_1000E1140();
  v4[20] = v5;
  v4[21] = *(void *)(v5 - 8);
  v4[22] = swift_task_alloc();
  uint64_t v6 = sub_1000E1C40();
  v4[23] = v6;
  v4[24] = *(void *)(v6 - 8);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  return _swift_task_switch(sub_1000B611C, v3, 0);
}

uint64_t sub_1000B611C()
{
  v12 = v0;
  if (qword_1001161B0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000E2030();
  v0[27] = sub_10000AD90(v1, (uint64_t)qword_100118E60);
  swift_retain();
  v2 = sub_1000E2010();
  os_log_type_t v3 = sub_1000E2700();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[18];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = *(void *)(v5 + 16);
    unint64_t v7 = *(void *)(v5 + 24);
    swift_bridgeObjectRetain();
    v0[15] = sub_1000DACC8(v8, v7, &v11);
    sub_1000E2880();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Requesting to start Laguna session with %s.", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  v9 = (void *)swift_task_alloc();
  v0[28] = v9;
  void *v9 = v0;
  v9[1] = sub_1000B6344;
  return sub_10000E1F0();
}

uint64_t sub_1000B6344(uint64_t a1)
{
  os_log_type_t v3 = (void *)*v2;
  v3[29] = a1;
  v3[30] = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v4 = (uint64_t (*)(void))v3[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v3[19];
    return _swift_task_switch(sub_1000B64A0, v6, 0);
  }
}

uint64_t sub_1000B64A0()
{
  uint64_t v1 = v0[30];
  sub_1000CC00C();
  v0[31] = v1;
  if (v1)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  uint64_t v4 = v0[18];
  uint64_t v5 = (void *)v0[19];
  uint64_t v6 = *(void *)(v4 + 16);
  v0[32] = v6;
  uint64_t v7 = *(void *)(v4 + 24);
  v0[33] = v7;
  uint64_t v8 = v5[16];
  if (!v8)
  {
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = v5[15];
  v65 = (void *)v5[22];
  uint64_t v63 = v5[21];
  uint64_t v11 = v5[19];
  uint64_t v10 = v5[20];
  uint64_t v12 = v5[17];
  uint64_t v13 = v5[18];
  sub_10009E618(v9, v8, v12, v13, v11, v10, v63, v65);
  swift_bridgeObjectRetain();
  sub_10009E690(v9, v8, v12, v13, v11, v10, v63, v65);
  if (v9 == v6 && v8 == v7)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_1000E2C80();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = 0;
      uint64_t v8 = 0;
LABEL_13:
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      v22 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v16 = v5[15];
  uint64_t v8 = v5[16];
  uint64_t v17 = v5[17];
  uint64_t v18 = v5[18];
  uint64_t v19 = v5[19];
  uint64_t v20 = v5[20];
  v22 = (void *)v5[22];
  uint64_t v21 = v5[21];
  sub_10009E618(v16, v8, v17, v18, v19, v20, v21, v22);
LABEL_16:
  v54 = v22;
  uint64_t v55 = v18;
  v0[40] = v21;
  v0[41] = v22;
  v0[38] = v19;
  v0[39] = v20;
  v0[36] = v17;
  v0[37] = v18;
  uint64_t v57 = v17;
  uint64_t v58 = v8;
  v0[34] = v16;
  v0[35] = v8;
  uint64_t v56 = v16;
  uint64_t v23 = sub_1000E1C50();
  uint64_t v24 = *(void *)(v23 + 16);
  if (!v24)
  {
    uint64_t v36 = 3;
LABEL_30:
    v37 = *(void **)(v0[19] + 200);
    id v38 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:v36];
    id v39 = [v37 objectForKey:v38];

    if (v39)
    {
      swift_bridgeObjectRelease();
      if (v8)
      {
LABEL_32:
        sub_10009E618(v56, v8, v57, v55, v19, v20, v21, v54);

        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
LABEL_35:
        v0[43] = v20;
        v0[44] = v39;
        v0[42] = v19;
        if (qword_100116188 != -1) {
          swift_once();
        }
        uint64_t v50 = qword_10011BF78;
        return _swift_task_switch(sub_1000B6A18, v50, 0);
      }
    }
    else
    {
      id v40 = [self callHistoryControllerWithCoalescingStrategy:2 options:v36 shouldUpdateMetadataCache:0];
      id v41 = objc_allocWithZone((Class)NSNumber);
      id v39 = v40;
      uint64_t v42 = v21;
      id v43 = [v41 initWithUnsignedInteger:v36];
      [v37 setObject:v39 forKey:v43];
      swift_bridgeObjectRelease();

      uint64_t v21 = v42;
      uint64_t v8 = v58;
      if (v58) {
        goto LABEL_32;
      }
    }
    uint64_t v44 = v0[21];
    uint64_t v45 = v0[22];
    uint64_t v46 = v0[20];
    sub_1000E1130();
    uint64_t v19 = sub_1000E10E0();
    uint64_t v48 = v47;
    uint64_t v49 = v46;
    uint64_t v20 = v48;
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v49);
    goto LABEL_35;
  }
  uint64_t v52 = v20;
  uint64_t v53 = v19;
  uint64_t v25 = v0[24];
  v28 = *(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 16);
  uint64_t v26 = v25 + 16;
  v27 = v28;
  unint64_t v29 = v23 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  int v64 = enum case for NCProtoStartLagunaSessionRequest.RecentCallFetchType.UNRECOGNIZED(_:);
  int v62 = enum case for NCProtoStartLagunaSessionRequest.RecentCallFetchType.default(_:);
  int v60 = enum case for NCProtoStartLagunaSessionRequest.RecentCallFetchType.faceTime(_:);
  int v59 = enum case for NCProtoStartLagunaSessionRequest.RecentCallFetchType.telephony(_:);
  uint64_t v61 = *(void *)(v26 + 56);
  swift_bridgeObjectRetain();
  uint64_t v66 = 0;
  while (1)
  {
    uint64_t v32 = v0[25];
    unint64_t v31 = v0[26];
    uint64_t v33 = v0[23];
    v27(v31, v29, v33);
    v27(v32, v31, v33);
    int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 72))(v32, v33);
    if (v34 == v64 || v34 == v62) {
      goto LABEL_20;
    }
    if (v34 != v60) {
      break;
    }
    uint64_t v30 = 3;
LABEL_19:
    v66 |= v30;
LABEL_20:
    (*(void (**)(void, void))(v26 - 8))(v0[26], v0[23]);
    v29 += v61;
    if (!--v24)
    {
      swift_bridgeObjectRelease();
      uint64_t v20 = v52;
      uint64_t v19 = v53;
      uint64_t v36 = v66;
      goto LABEL_30;
    }
  }
  if (v34 == v59)
  {
    uint64_t v30 = 4;
    goto LABEL_19;
  }
  uint64_t v51 = v0[23];
  return _diagnoseUnexpectedEnumCase<A>(type:)(v51, v51);
}

uint64_t sub_1000B6A18()
{
  if (*(void *)(*(void *)(v0 + 144) + 96))
  {
    swift_bridgeObjectRetain();
    v6._countAndFlagsBits = 0x5654656C707041;
    v6._object = (void *)0xE700000000000000;
    BOOL v1 = sub_1000E24C0(v6);
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void *)(v0 + 152);
    if (v1) {
      os_log_type_t v3 = sub_1000B6C64;
    }
    else {
      os_log_type_t v3 = sub_1000B6AE4;
    }
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 152);
    os_log_type_t v3 = sub_1000CE358;
  }
  return _swift_task_switch(v3, v2, 0);
}

uint64_t sub_1000B6AE4()
{
  swift_bridgeObjectRelease();
  BOOL v1 = sub_1000E2010();
  os_log_type_t v2 = sub_1000E26E0();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Rejecting start laguna session request because sender device type is unknown.", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[40];
  uint64_t v13 = (void *)v0[41];
  v14 = (void *)v0[44];
  uint64_t v6 = v0[38];
  uint64_t v5 = v0[39];
  uint64_t v8 = v0[36];
  uint64_t v7 = v0[37];
  uint64_t v9 = v0[34];
  uint64_t v10 = v0[35];

  (id)TUMakeNeighborhoodConduitError();
  swift_willThrow();
  sub_10009E690(v9, v10, v8, v7, v6, v5, v4, v13);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_1000B6C64()
{
  BOOL v1 = *(void **)(*(void *)(v0 + 152) + 232);
  id v2 = [v1 peerDeviceIdentifier];
  if (!v2) {
    goto LABEL_7;
  }
  os_log_type_t v3 = v2;
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = sub_1000E23F0();
  uint64_t v8 = v7;

  if (v6 == v4 && v8 == v5)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_1000E2C80();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      uint64_t v11 = sub_1000E2010();
      os_log_type_t v12 = sub_1000E2700();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Rejecting start laguna session request because we're not currently connected via remote display discovery.", v13, 2u);
        swift_slowDealloc();
      }
      uint64_t v56 = *(void **)(v0 + 328);
      uint64_t v58 = *(void **)(v0 + 352);
      uint64_t v14 = *(void *)(v0 + 312);
      uint64_t v53 = *(void *)(v0 + 320);
      uint64_t v16 = *(void *)(v0 + 296);
      uint64_t v15 = *(void *)(v0 + 304);
      uint64_t v18 = *(void *)(v0 + 280);
      uint64_t v17 = *(void *)(v0 + 288);
      uint64_t v19 = *(void *)(v0 + 272);

      (id)TUMakeNeighborhoodConduitError();
      swift_willThrow();
      sub_10009E690(v19, v18, v17, v16, v15, v14, v53, v56);
      swift_release();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
      return v20();
    }
  }
  swift_bridgeObjectRetain_n();
  swift_retain();
  id v22 = [v1 dedicatedDevice];
  uint64_t v57 = v5;
  if (v22)
  {
    uint64_t v23 = v22;
    id v24 = [v22 idsDeviceIdentifier];
    uint64_t v25 = *(void *)(v0 + 264);
    if (v24)
    {
      uint64_t v26 = v24;
      uint64_t v27 = *(void *)(v0 + 256);
      uint64_t v28 = sub_1000E23F0();
      uint64_t v30 = v29;

      if (v27 == v28 && v25 == v30) {
        char v32 = 1;
      }
      else {
        char v32 = sub_1000E2C80();
      }
      swift_bridgeObjectRelease();
    }
    else
    {

      char v32 = 0;
    }
  }
  else
  {
    char v32 = 0;
  }
  char v54 = v32;
  swift_bridgeObjectRelease();
  char v33 = v32 & 1;
  *(unsigned char *)(v0 + 428) = v32 & 1;
  uint64_t v34 = *(void *)(v0 + 344);
  uint64_t v35 = *(void *)(v0 + 336);
  uint64_t v36 = *(void *)(v0 + 256);
  uint64_t v37 = *(void *)(v0 + 264);
  uint64_t v38 = *(void *)(v0 + 232);
  id v39 = *(void **)(v0 + 152);
  id v40 = *(id *)(v0 + 352);
  unint64_t v41 = sub_100005878((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(v0 + 360) = v41;
  *(void *)(v0 + 16) = v36;
  *(void *)(v0 + 24) = v37;
  *(void *)(v0 + 32) = v38;
  *(unsigned char *)(v0 + 40) = v33;
  *(void *)(v0 + 48) = v35;
  *(void *)(v0 + 56) = v34;
  *(void *)(v0 + 64) = v41;
  *(void *)(v0 + 72) = v40;
  uint64_t v42 = v54 & 1;
  uint64_t v43 = v39[15];
  uint64_t v44 = v39[16];
  uint64_t v52 = v39[18];
  uint64_t v55 = v39[17];
  uint64_t v50 = v39[20];
  uint64_t v51 = v39[19];
  uint64_t v48 = (void *)v39[22];
  uint64_t v49 = v39[21];
  v39[15] = v36;
  v39[16] = v57;
  v39[17] = v38;
  v39[18] = v42;
  v39[19] = v35;
  v39[20] = v34;
  v39[21] = v41;
  v39[22] = v40;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v45 = v40;
  sub_10009E690(v43, v44, v55, v52, v51, v50, v49, v48);
  sub_1000B0BA0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  [v45 boostQualityOfService];
  uint64_t v46 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v46;
  *uint64_t v46 = v0;
  v46[1] = sub_1000B70F4;
  uint64_t v47 = *(void *)(v0 + 152);
  v46[2] = v0 + 16;
  return _swift_task_switch(sub_1000BCDC0, v47, 0);
}

uint64_t sub_1000B70F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)v3;
  uint64_t v5 = *(void *)(*(void *)v3 + 152);
  v4[47] = a1;
  v4[48] = a2;
  v4[49] = a3;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000B7210, v5, 0);
}

uint64_t sub_1000B7210()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  *(void *)(v0 + 400) = sub_1000BD828((void *)(v0 + 16));
  if ([*(id *)(v1 + 224) isGreenTea])
  {
    uint64_t v42 = *(void **)(v0 + 352);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v3 = v42;
    uint64_t v4 = sub_1000E2010();
    os_log_type_t v5 = sub_1000E2700();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v43 = *(void *)(v0 + 400);
    uint64_t v7 = *(void *)(v0 + 376);
    uint64_t v8 = *(void *)(v0 + 384);
    if (v6)
    {
      int v33 = *(unsigned __int8 *)(v0 + 428);
      unint64_t v31 = *(void **)(v0 + 352);
      uint64_t v9 = *(void *)(v0 + 256);
      unint64_t v10 = *(void *)(v0 + 264);
      uint64_t v11 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136316162;
      os_log_type_t type = v5;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 88) = sub_1000DACC8(v9, v10, &v44);
      sub_1000E2880();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 1024;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v0 + 424) = v33;
      sub_1000E2880();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 18) = 2048;
      uint64_t v12 = *(void *)(v7 + 16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v0 + 96) = v12;
      sub_1000E2880();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 28) = 2048;
      uint64_t v13 = *(void *)(v8 + 16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v0 + 104) = v13;
      sub_1000E2880();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 38) = 2048;
      uint64_t v14 = *(void *)(v43 + 16);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 112) = v14;
      sub_1000E2880();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, type, "Starting laguna session with %s. isDedicatedSession:%{BOOL}d. Returning %ld recent calls and %ld contacts and %ld favorites.", (uint8_t *)v11, 0x30u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v21 = *(void **)(v0 + 352);

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v22 = *(void *)(v0 + 392);
    uint64_t v23 = *(void *)(v0 + 400);
    uint64_t v24 = *(void *)(v0 + 376);
    uint64_t v25 = *(void *)(v0 + 384);
    uint64_t v26 = *(void **)(v0 + 352);
    uint64_t v39 = *(void *)(v0 + 320);
    typea = *(void **)(v0 + 328);
    uint64_t v37 = *(void *)(v0 + 304);
    uint64_t v38 = *(void *)(v0 + 312);
    uint64_t v35 = *(void *)(v0 + 288);
    uint64_t v36 = *(void *)(v0 + 296);
    uint64_t v32 = *(void *)(v0 + 272);
    uint64_t v34 = *(void *)(v0 + 280);
    uint64_t v27 = *(void *)(v0 + 152);
    sub_1000E1CE0();
    uint64_t v28 = (void *)swift_task_alloc();
    v28[2] = v27;
    v28[3] = v24;
    v28[4] = v25;
    v28[5] = v22;
    v28[6] = v23;
    v28[7] = _swiftEmptyArrayStorage;
    sub_1000CAD74(&qword_100119020, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoStartLagunaSessionResponse);
    sub_1000E1210();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    sub_10009E690(v32, v34, v35, v36, v37, v38, v39, typea);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  else
  {
    char v15 = *(unsigned char *)(v0 + 428);
    uint64_t v16 = *(void *)(v0 + 152);
    uint64_t v17 = sub_1000CAD74(&qword_100119010, v2, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v18 = swift_task_alloc();
    *(void *)(v0 + 408) = v18;
    *(void *)(v18 + 16) = v16;
    *(unsigned char *)(v18 + 24) = 0;
    *(unsigned char *)(v18 + 25) = v15;
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 416) = v19;
    uint64_t v20 = sub_100004D9C(&qword_100119018);
    *uint64_t v19 = v0;
    v19[1] = sub_1000B7950;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 80, v16, v17, 0xD000000000000015, 0x80000001000EA5E0, sub_1000CC3E8, v18, v20);
  }
}

uint64_t sub_1000B7950()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_1000B7A7C, v1, 0);
}

uint64_t sub_1000B7A7C()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  unint64_t v2 = *(void *)(v0 + 80);
  swift_retain();
  uint64_t v37 = sub_1000CB51C(v2, v1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v36 = *(void **)(v0 + 352);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v36;
  uint64_t v4 = sub_1000E2010();
  os_log_type_t v5 = sub_1000E2700();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 384);
    uint64_t v33 = *(void *)(v0 + 400);
    os_log_type_t type = v5;
    uint64_t v7 = *(void *)(v0 + 376);
    int v28 = *(unsigned __int8 *)(v0 + 428);
    uint64_t v26 = *(void **)(v0 + 352);
    uint64_t v9 = *(void *)(v0 + 256);
    unint64_t v8 = *(void *)(v0 + 264);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136316162;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 88) = sub_1000DACC8(v9, v8, &v38);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v10 + 12) = 1024;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    *(_DWORD *)(v0 + 424) = v28;
    sub_1000E2880();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 18) = 2048;
    uint64_t v11 = *(void *)(v7 + 16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 96) = v11;
    sub_1000E2880();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 28) = 2048;
    uint64_t v12 = *(void *)(v6 + 16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 104) = v12;
    sub_1000E2880();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 38) = 2048;
    uint64_t v13 = *(void *)(v33 + 16);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 112) = v13;
    sub_1000E2880();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, type, "Starting laguna session with %s. isDedicatedSession:%{BOOL}d. Returning %ld recent calls and %ld contacts and %ld favorites.", (uint8_t *)v10, 0x30u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 352);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_release_n();
  }
  uint64_t v16 = *(void *)(v0 + 392);
  uint64_t v15 = *(void *)(v0 + 400);
  uint64_t v17 = *(void *)(v0 + 376);
  uint64_t v18 = *(void *)(v0 + 384);
  uint64_t v32 = *(void *)(v0 + 320);
  uint64_t v34 = *(void **)(v0 + 328);
  uint64_t v30 = *(void *)(v0 + 304);
  uint64_t v31 = *(void *)(v0 + 312);
  uint64_t v27 = *(void **)(v0 + 352);
  uint64_t v29 = *(void *)(v0 + 296);
  uint64_t v25 = *(void *)(v0 + 288);
  uint64_t v24 = *(void *)(v0 + 280);
  uint64_t v23 = *(void *)(v0 + 272);
  uint64_t v19 = *(void *)(v0 + 152);
  sub_1000E1CE0();
  uint64_t v20 = (void *)swift_task_alloc();
  v20[2] = v19;
  v20[3] = v17;
  v20[4] = v18;
  v20[5] = v16;
  v20[6] = v15;
  v20[7] = v37;
  sub_1000CAD74(&qword_100119020, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoStartLagunaSessionResponse);
  sub_1000E1210();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10009E690(v23, v24, v25, v29, v30, v31, v32, v34);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_1000B809C()
{
  return sub_1000E1CB0();
}

void sub_1000B812C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2[15];
  uint64_t v3 = v2[16];
  os_log_type_t v5 = v2 + 15;
  if (v3)
  {
    uint64_t v6 = v2;
    uint64_t v9 = v2[17];
    uint64_t v10 = v2[18];
    uint64_t v11 = v2[19];
    uint64_t v12 = v5[5];
    BOOL v13 = v4 == a1 && v3 == a2;
    uint64_t v31 = v5[6];
    uint64_t v32 = (void *)v5[7];
    if (v13 || (sub_1000E2C80() & 1) != 0)
    {
      uint64_t v30 = v11;
      uint64_t v14 = qword_1001161B0;
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v29 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v28 = v32;
      if (v14 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_1000E2030();
      sub_10000AD90(v15, (uint64_t)qword_100118E60);
      swift_bridgeObjectRetain_n();
      uint64_t v16 = sub_1000E2010();
      os_log_type_t v17 = sub_1000E2700();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v27 = v10;
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        v33[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 136315138;
        swift_bridgeObjectRetain();
        sub_1000DACC8(a1, a2, v33);
        sub_1000E2880();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Ending camera session with %s.", v18, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v10 = v27;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v19 = v6[15];
      uint64_t v20 = v6[16];
      uint64_t v21 = v6[17];
      uint64_t v22 = v6[18];
      uint64_t v23 = v6[19];
      uint64_t v24 = v6[20];
      uint64_t v25 = v6[21];
      uint64_t v26 = (void *)v6[22];
      *(_OWORD *)os_log_type_t v5 = 0u;
      *((_OWORD *)v5 + 1) = 0u;
      *((_OWORD *)v5 + 2) = 0u;
      *((_OWORD *)v5 + 3) = 0u;
      sub_10009E690(v19, v20, v21, v22, v23, v24, v25, v26);
      sub_1000B0BA0();
      v33[0] = v4;
      v33[1] = v3;
      v33[2] = v9;
      char v34 = v10 & 1;
      uint64_t v35 = v30;
      uint64_t v36 = v29;
      uint64_t v37 = v31;
      id v38 = v28;
      sub_1000E20E0();
      sub_10009E690(v4, v3, v9, v10, v30, v29, v31, v32);
    }
  }
}

uint64_t sub_1000B83F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[28] = a3;
  v4[29] = v3;
  v4[26] = a1;
  v4[27] = a2;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  v4[30] = swift_task_alloc();
  uint64_t v5 = sub_1000E2B00();
  v4[31] = v5;
  v4[32] = *(void *)(v5 - 8);
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  uint64_t v6 = sub_1000E2B20();
  v4[35] = v6;
  v4[36] = *(void *)(v6 - 8);
  v4[37] = swift_task_alloc();
  uint64_t v7 = sub_1000E1BE0();
  v4[38] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[39] = v8;
  v4[40] = *(void *)(v8 + 64);
  v4[41] = swift_task_alloc();
  v4[42] = swift_task_alloc();
  v4[43] = swift_task_alloc();
  uint64_t v9 = sub_1000E1140();
  v4[44] = v9;
  v4[45] = *(void *)(v9 - 8);
  v4[46] = swift_task_alloc();
  v4[47] = swift_task_alloc();
  v4[48] = swift_task_alloc();
  v4[49] = swift_task_alloc();
  v4[50] = swift_task_alloc();
  return _swift_task_switch(sub_1000B8660, v3, 0);
}

uint64_t sub_1000B8660()
{
  uint64_t v128 = v0;
  sub_1000E1130();
  if (qword_1001161B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v2 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v6 = *(void *)(v0 + 304);
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 216);
  uint64_t v9 = sub_1000E2030();
  *(void *)(v0 + 408) = sub_10000AD90(v9, (uint64_t)qword_100118E60);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 416) = v10;
  *(void *)(v0 + 424) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v1, v2, v3);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  *(void *)(v0 + 432) = v11;
  *(void *)(v0 + 440) = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v11(v5, v8, v6);
  uint64_t v12 = sub_1000E2010();
  os_log_type_t v13 = sub_1000E2700();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = *(void *)(v0 + 392);
  uint64_t v16 = *(void *)(v0 + 352);
  uint64_t v17 = *(void *)(v0 + 360);
  uint64_t v18 = *(void *)(v0 + 344);
  uint64_t v19 = *(void *)(v0 + 304);
  uint64_t v20 = *(void *)(v0 + 312);
  if (v14)
  {
    uint64_t v120 = *(void *)(v0 + 304);
    uint64_t v21 = swift_slowAlloc();
    v127[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315394;
    sub_1000CAD74(&qword_100118340, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v22 = sub_1000E2C30();
    *(void *)(v0 + 192) = sub_1000DACC8(v22, v23, v127);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v24(v15, v16);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_1000E1BD0();
    *(void *)(v0 + 200) = sub_1000DACC8(v25, v26, v127);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v27(v18, v120);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[GetContactImage][%s] Received request for contact image for %s.", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v24(*(void *)(v0 + 392), *(void *)(v0 + 352));
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v27(v18, v19);
  }
  *(void *)(v0 + 448) = v27;
  *(void *)(v0 + 456) = v24;
  os_log_type_t type = v27;
  uint64_t v28 = *(void *)(v0 + 224);
  uint64_t v29 = *(void **)(v0 + 232);
  uint64_t v31 = *(void *)(v28 + 16);
  unint64_t v30 = *(void *)(v28 + 24);
  uint64_t v32 = v29[16];
  v125 = v24;
  if (!v32) {
    goto LABEL_16;
  }
  uint64_t v33 = v29[15];
  uint64_t v35 = v29[21];
  char v34 = (void *)v29[22];
  os_log_t log = *(os_log_t *)(v28 + 16);
  unint64_t v121 = *(void *)(v28 + 24);
  uint64_t v37 = v29[19];
  uint64_t v36 = v29[20];
  uint64_t v38 = v29[17];
  uint64_t v39 = v29[18];
  sub_10009E618(v33, v32, v38, v39, v37, v36, v35, v34);
  swift_bridgeObjectRetain();
  uint64_t v40 = v38;
  uint64_t v41 = v36;
  uint64_t v31 = (uint64_t)log;
  unint64_t v30 = v121;
  sub_10009E690(v33, v32, v40, v39, v37, v41, v35, v34);
  if ((os_log_t)v33 == log && v32 == v121)
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = v125;
  }
  else
  {
    char v42 = sub_1000E2C80();
    swift_bridgeObjectRelease();
    uint64_t v24 = v125;
    if ((v42 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (v29[16])
  {
    swift_beginAccess();
    *(void *)(v0 + 464) = 0;
    *(void *)(v0 + 472) = 1;
    uint64_t v43 = *(void *)(v0 + 232);
    if (*(void *)(*(void *)(v43 + 288) + 16) < 0xAuLL)
    {
      uint64_t v44 = (uint64_t *)(v43 + 288);
      v124 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
      uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 432);
      uint64_t v115 = *(void *)(v0 + 400);
      typea = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 416);
      uint64_t v113 = *(void *)(v0 + 352);
      uint64_t v114 = *(void *)(v0 + 368);
      uint64_t v46 = *(void *)(v0 + 328);
      uint64_t v48 = *(void *)(v0 + 304);
      uint64_t v47 = *(void *)(v0 + 312);
      uint64_t v49 = *(void *)(v0 + 240);
      uint64_t v122 = *(void *)(v0 + 360) + 8;
      uint64_t v50 = *(void *)(v0 + 216);
      uint64_t v51 = sub_1000E25E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v49, 1, 1, v51);
      v45(v46, v50, v48);
      unint64_t v52 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = 0;
      *(void *)(v53 + 24) = 0;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v47 + 32))(v53 + v52, v46, v48);
      uint64_t v54 = sub_1000A84D4(v49, (uint64_t)&unk_100118FE0, v53, (uint64_t)&unk_10010D750, &qword_100118FE8);
      *(void *)(v0 + 528) = v54;
      typea(v114, v115, v113);
      swift_beginAccess();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v127[0] = *v44;
      *uint64_t v44 = 0x8000000000000000;
      sub_1000C7C1C(v54, v114, isUniquelyReferenced_nonNull_native);
      *uint64_t v44 = v127[0];
      swift_bridgeObjectRelease();
      *(void *)(v0 + 536) = v122 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v124(v114, v113);
      swift_endAccess();
      uint64_t v56 = (void *)swift_task_alloc();
      *(void *)(v0 + 544) = v56;
      uint64_t v57 = sub_100004D9C(&qword_100118FE8);
      *uint64_t v56 = v0;
      v56[1] = sub_1000BA084;
      uint64_t v58 = v0 + 144;
      uint64_t v59 = v54;
      return Task<>.value.getter(v58, v59, v57);
    }
    uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 432);
    uint64_t v68 = *(void *)(v0 + 336);
    uint64_t v69 = *(void *)(v0 + 304);
    uint64_t v70 = *(void *)(v0 + 216);
    (*(void (**)(void, void, void))(v0 + 416))(*(void *)(v0 + 376), *(void *)(v0 + 400), *(void *)(v0 + 352));
    v67(v68, v70, v69);
    v71 = sub_1000E2010();
    os_log_type_t v72 = sub_1000E2700();
    if (os_log_type_enabled(v71, v72))
    {
      v126 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
      uint64_t v73 = *(void *)(v0 + 376);
      uint64_t v74 = *(void *)(v0 + 352);
      uint64_t v75 = *(void *)(v0 + 336);
      uint64_t v123 = *(void *)(v0 + 304);
      os_log_t loga = *(os_log_t *)(v0 + 456);
      uint64_t v76 = swift_slowAlloc();
      v127[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v76 = 136315394;
      sub_1000CAD74(&qword_100118340, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v77 = sub_1000E2C30();
      *(void *)(v76 + 4) = sub_1000DACC8(v77, v78, v127);
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, uint64_t))loga)(v73, v74);
      *(_WORD *)(v76 + 12) = 2080;
      uint64_t v79 = sub_1000E1BD0();
      *(void *)(v76 + 14) = sub_1000DACC8(v79, v80, v127);
      swift_bridgeObjectRelease();
      v126(v75, v123);
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "[GetContactImage][%s] Too many concurrent image requests, backing off for %s.", (uint8_t *)v76, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v82 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
      uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    }
    else
    {
      uint64_t v83 = *(void *)(v0 + 336);
      uint64_t v84 = *(void *)(v0 + 304);
      v24(*(void *)(v0 + 376), *(void *)(v0 + 352));
      uint64_t v85 = v83;
      v82 = type;
      type(v85, v84);
    }
    *(void *)(v0 + 480) = v82;
    *(void *)(v0 + 488) = v24;
    sub_1000E2840(v81, 2);
    sub_1000E1020(v88, v86, v87);
    int v90 = v89;
    __int16 v92 = v91;
    __int16 v94 = v93;
    unint64_t v95 = HIDWORD(v89);
    unint64_t v96 = HIWORD(v89);
    unint64_t v97 = v91 >> 16;
    unint64_t v98 = HIDWORD(v91);
    unint64_t v99 = HIWORD(v91);
    unsigned int v100 = HIWORD(v93);
    id v101 = objc_allocWithZone((Class)NSDecimalNumber);
    *(_DWORD *)(v0 + 108) = v90;
    *(_WORD *)(v0 + 112) = v95;
    *(_WORD *)(v0 + 114) = v96;
    *(_WORD *)(v0 + 116) = v92;
    *(_WORD *)(v0 + 118) = v97;
    *(_WORD *)(v0 + 120) = v98;
    *(_WORD *)(v0 + 122) = v99;
    *(_WORD *)(v0 + 124) = v94;
    *(_WORD *)(v0 + 126) = v100;
    id v102 = [v101 initWithDecimal:v0 + 108];
    uint64_t v103 = (uint64_t)[v102 integerValue];

    uint64_t v104 = 500 * v103;
    if ((unsigned __int128)(v103 * (__int128)500) >> 64 == (500 * v103) >> 63)
    {
      if ((v104 & 0x8000000000000000) == 0)
      {
        unint64_t v105 = v104 | 1;
        *(void *)(v0 + 176) = 0;
        uint64_t v58 = swift_stdlib_random();
        uint64_t v106 = (*(unint64_t *)(v0 + 176) * (unsigned __int128)(v104 | 1uLL)) >> 64;
        unint64_t v107 = *(void *)(v0 + 176) * (v104 | 1);
        if ((v104 | 1uLL) > v107)
        {
          unint64_t v108 = -(uint64_t)v105 % v105;
          if (v108 > v107)
          {
            v109 = (void *)(v0 + 168);
            do
            {
              void *v109 = 0;
              uint64_t v58 = swift_stdlib_random();
            }
            while (v108 > *v109 * v105);
            uint64_t v106 = ((unint64_t)*v109 * (unsigned __int128)v105) >> 64;
          }
        }
        uint64_t v110 = v104 + v106;
        if (!__OFADD__(v104, v106))
        {
          uint64_t v111 = 1000000000000000 * v110;
          uint64_t v112 = ((v110 >> 63) & 0xFFFC72815B398000)
               + (((unint64_t)v110 * (unsigned __int128)0x38D7EA4C68000uLL) >> 64);
          sub_1000E2B10();
          *(void *)(v0 + 128) = v111;
          *(void *)(v0 + 136) = v112;
          *(void *)(v0 + 88) = 0;
          *(void *)(v0 + 96) = 0;
          *(unsigned char *)(v0 + 104) = 1;
          return _swift_task_switch(sub_1000B92B8, 0, 0);
        }
LABEL_38:
        __break(1u);
        return Task<>.value.getter(v58, v59, v57);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_38;
  }
LABEL_16:
  swift_retain();
  int v60 = sub_1000E2010();
  os_log_type_t v61 = sub_1000E2700();
  if (os_log_type_enabled(v60, v61))
  {
    int v62 = (uint8_t *)swift_slowAlloc();
    v127[0] = swift_slowAlloc();
    *(_DWORD *)int v62 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 184) = sub_1000DACC8(v31, v30, v127);
    uint64_t v24 = v125;
    sub_1000E2880();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "[GetContactImage] Rejecting request for contact image from device with which we do not have a laguna session %s.", v62, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  uint64_t v63 = *(void *)(v0 + 400);
  uint64_t v64 = *(void *)(v0 + 352);
  (id)TUMakeNeighborhoodConduitError();
  swift_willThrow();
  v24(v63, v64);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v65 = *(uint64_t (**)(void))(v0 + 8);
  return v65();
}

uint64_t sub_1000B92B8()
{
  uint64_t v2 = v0[32];
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = sub_1000CAD74(&qword_100118FC0, 255, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_1000E2CF0();
  sub_1000CAD74((unint64_t *)&unk_100118FC8, 255, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_1000E2B30();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[62] = v5;
  v0[63] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[64] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000B9454;
  uint64_t v8 = v0[34];
  uint64_t v7 = v0[35];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 11, v7, v4);
}

uint64_t sub_1000B9454()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 520) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 496))(*(void *)(v2 + 272), *(void *)(v2 + 248));
    uint64_t v3 = sub_1000B9EE8;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 496);
    uint64_t v7 = *(void *)(v2 + 288);
    uint64_t v6 = *(void *)(v2 + 296);
    uint64_t v8 = *(void *)(v2 + 272);
    uint64_t v9 = *(void *)(v2 + 280);
    uint64_t v10 = *(void *)(v2 + 248);
    uint64_t v11 = *(void *)(v2 + 232);
    v5(v8, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v9);
    uint64_t v3 = sub_1000B95B8;
    uint64_t v4 = v11;
  }
  return _swift_task_switch(v3, v4, 0);
}

uint64_t sub_1000B95B8()
{
  uint64_t v89 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 472) + 1;
  uint64_t v3 = *(void (**)(void, void))(v0 + 488);
  *(void *)(v0 + 464) = *(void *)(v0 + 520);
  *(void *)(v0 + 472) = v2;
  uint64_t v4 = *(void *)(v0 + 232);
  if (*(void *)(*(void *)(v4 + 288) + 16) < 0xAuLL)
  {
    uint64_t v5 = (uint64_t *)(v4 + 288);
    uint64_t v85 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 432);
    uint64_t v79 = *(void *)(v0 + 400);
    unint64_t v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 416);
    uint64_t v77 = *(void *)(v0 + 352);
    uint64_t v78 = *(void *)(v0 + 368);
    uint64_t v7 = *(void *)(v0 + 328);
    uint64_t v9 = *(void *)(v0 + 304);
    uint64_t v8 = *(void *)(v0 + 312);
    uint64_t v10 = *(void *)(v0 + 240);
    uint64_t v83 = *(void *)(v0 + 360) + 8;
    uint64_t v11 = *(void *)(v0 + 216);
    uint64_t v12 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
    v6(v7, v11, v9);
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = 0;
    *(void *)(v14 + 24) = 0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32))(v14 + v13, v7, v9);
    uint64_t v15 = sub_1000A84D4(v10, (uint64_t)&unk_100118FE0, v14, (uint64_t)&unk_10010D750, &qword_100118FE8);
    *(void *)(v0 + 528) = v15;
    v80(v78, v79, v77);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v88[0] = *v5;
    *uint64_t v5 = 0x8000000000000000;
    sub_1000C7C1C(v15, v78, isUniquelyReferenced_nonNull_native);
    *uint64_t v5 = v88[0];
    swift_bridgeObjectRelease();
    *(void *)(v0 + 536) = v83 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v85(v78, v77);
    swift_endAccess();
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v17;
    uint64_t v18 = sub_100004D9C(&qword_100118FE8);
    *uint64_t v17 = v0;
    v17[1] = sub_1000BA084;
    uint64_t v19 = v0 + 144;
    uint64_t v20 = v15;
    return Task<>.value.getter(v19, v20, v18);
  }
  uint64_t v21 = (void *)(v0 + 168);
  if (v2 == 4)
  {
    (*(void (**)(void, void, void))(v0 + 416))(*(void *)(v0 + 384), *(void *)(v0 + 400), *(void *)(v0 + 352));
    uint64_t v22 = sub_1000E2010();
    os_log_type_t v23 = sub_1000E26E0();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v25 = *(void *)(v0 + 384);
    uint64_t v26 = *(void *)(v0 + 352);
    if (v24)
    {
      Swift::Int v87 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      v88[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      sub_1000CAD74(&qword_100118340, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v28 = sub_1000E2C30();
      *(void *)(v0 + 160) = sub_1000DACC8(v28, v29, v88);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      v87(v25, v26);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[GetContactImage][%s] Failed to fulfill contact image request due to too many concurrent requests.", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v0 + 456))(*(void *)(v0 + 384), *(void *)(v0 + 352));
    }

    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    uint64_t v46 = *(void *)(v0 + 400);
    uint64_t v47 = *(void *)(v0 + 352);
    (id)TUMakeNeighborhoodConduitError();
    swift_willThrow();
    v45(v46, v47);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
    return v48();
  }
  unint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 432);
  uint64_t v31 = *(void *)(v0 + 336);
  uint64_t v32 = *(void *)(v0 + 304);
  uint64_t v33 = *(void *)(v0 + 216);
  (*(void (**)(void, void, void))(v0 + 416))(*(void *)(v0 + 376), *(void *)(v0 + 400), *(void *)(v0 + 352));
  v30(v31, v33, v32);
  char v34 = sub_1000E2010();
  os_log_type_t v35 = sub_1000E2700();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v84 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
    uint64_t v36 = *(void *)(v0 + 376);
    uint64_t v37 = *(void *)(v0 + 352);
    uint64_t v38 = *(void *)(v0 + 336);
    uint64_t v82 = *(void *)(v0 + 304);
    v81 = *(void (**)(uint64_t, uint64_t))(v0 + 456);
    uint64_t v39 = swift_slowAlloc();
    v88[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 136315394;
    sub_1000CAD74(&qword_100118340, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v40 = sub_1000E2C30();
    *(void *)(v39 + 4) = sub_1000DACC8(v40, v41, v88);
    swift_bridgeObjectRelease();
    v81(v36, v37);
    *(_WORD *)(v39 + 12) = 2080;
    uint64_t v42 = sub_1000E1BD0();
    *(void *)(v39 + 14) = sub_1000DACC8(v42, v43, v88);
    swift_bridgeObjectRelease();
    v84(v38, v82);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "[GetContactImage][%s] Too many concurrent image requests, backing off for %s.", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
    uint64_t v3 = *(void (**)(void, void))(v0 + 456);
  }
  else
  {
    uint64_t v50 = *(void *)(v0 + 336);
    uint64_t v51 = *(void *)(v0 + 304);
    v3(*(void *)(v0 + 376), *(void *)(v0 + 352));
    v1(v50, v51);
  }
  *(void *)(v0 + 480) = v1;
  *(void *)(v0 + 488) = v3;
  sub_1000E2840(v44, 2);
  sub_1000E1020(v54, v52, v53);
  int v56 = v55;
  __int16 v58 = v57;
  __int16 v60 = v59;
  unint64_t v61 = HIDWORD(v55);
  unint64_t v62 = HIWORD(v55);
  unint64_t v63 = v57 >> 16;
  unint64_t v64 = HIDWORD(v57);
  unint64_t v86 = HIWORD(v57);
  unsigned int v65 = HIWORD(v59);
  id v66 = objc_allocWithZone((Class)NSDecimalNumber);
  *(_DWORD *)(v0 + 108) = v56;
  *(_WORD *)(v0 + 112) = v61;
  *(_WORD *)(v0 + 114) = v62;
  *(_WORD *)(v0 + 116) = v58;
  *(_WORD *)(v0 + 118) = v63;
  *(_WORD *)(v0 + 120) = v64;
  *(_WORD *)(v0 + 122) = v86;
  *(_WORD *)(v0 + 124) = v60;
  *(_WORD *)(v0 + 126) = v65;
  id v67 = [v66 initWithDecimal:v0 + 108];
  uint64_t v68 = (uint64_t)[v67 integerValue];

  uint64_t v69 = 500 * v68;
  if ((unsigned __int128)(v68 * (__int128)500) >> 64 != (500 * v68) >> 63)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v69 < 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    return Task<>.value.getter(v19, v20, v18);
  }
  unint64_t v70 = v69 | 1;
  *(void *)(v0 + 176) = 0;
  uint64_t v19 = swift_stdlib_random();
  uint64_t v71 = (*(unint64_t *)(v0 + 176) * (unsigned __int128)(v69 | 1uLL)) >> 64;
  unint64_t v72 = *(void *)(v0 + 176) * (v69 | 1);
  if ((v69 | 1uLL) > v72)
  {
    unint64_t v73 = -(uint64_t)v70 % v70;
    if (v73 > v72)
    {
      do
      {
        *uint64_t v21 = 0;
        uint64_t v19 = swift_stdlib_random();
      }
      while (v73 > *v21 * v70);
      uint64_t v71 = ((unint64_t)*v21 * (unsigned __int128)v70) >> 64;
    }
  }
  uint64_t v74 = v69 + v71;
  if (__OFADD__(v69, v71)) {
    goto LABEL_27;
  }
  uint64_t v75 = 1000000000000000 * v74;
  uint64_t v76 = ((v74 >> 63) & 0xFFFC72815B398000) + (((unint64_t)v74 * (unsigned __int128)0x38D7EA4C68000uLL) >> 64);
  sub_1000E2B10();
  *(void *)(v0 + 128) = v75;
  *(void *)(v0 + 136) = v76;
  *(void *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0;
  *(unsigned char *)(v0 + 104) = 1;
  return _swift_task_switch(sub_1000B92B8, 0, 0);
}

uint64_t sub_1000B9EE8()
{
  uint64_t v1 = v0[29];
  (*(void (**)(void, void))(v0[36] + 8))(v0[37], v0[35]);
  return _swift_task_switch(sub_1000B9F64, v1, 0);
}

uint64_t sub_1000B9F64()
{
  (*(void (**)(void, void))(v0 + 456))(*(void *)(v0 + 400), *(void *)(v0 + 352));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000BA084()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 232);
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BA194, v1, 0);
}

uint64_t sub_1000BA194()
{
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[57];
  uint64_t v1 = v0[50];
  uint64_t v2 = v0[44];
  uint64_t v3 = v0[18];
  unint64_t v4 = v0[19];
  swift_beginAccess();
  sub_1000C4DA0(v1);
  swift_endAccess();
  swift_release();
  sub_1000E1C80();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  sub_1000CAD74(&qword_100118FF0, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoGetImageForContactResponse);
  sub_1000E1210();
  swift_release();
  swift_task_dealloc();
  v8(v1, v2);
  sub_10000F0D4(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1000BA3B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return _swift_task_switch(sub_1000BA3D0, 0, 0);
}

uint64_t sub_1000BA3D0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  uint64_t v2 = sub_1000E1BD0();
  uint64_t v4 = sub_10001A86C(v2, v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *uint64_t v1 = v4;
  v1[1] = v6;
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1000BA454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[8] = a1;
  return _swift_task_switch(sub_1000BA478, v3, 0);
}

uint64_t sub_1000BA478()
{
  uint64_t v146 = v0;
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void **)(v0 + 80);
  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = v2[16];
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = v2[15];
  uint64_t v8 = v2[21];
  uint64_t v7 = (void *)v2[22];
  uint64_t v10 = v2[19];
  uint64_t v9 = v2[20];
  uint64_t v12 = v2[17];
  uint64_t v11 = v2[18];
  v133 = v2;
  sub_10009E618(v6, v5, v12, v11, v10, v9, v8, v7);
  swift_bridgeObjectRetain();
  sub_10009E690(v6, v5, v12, v11, v10, v9, v8, v7);
  if (v6 != v3 || v5 != v4)
  {
    char v14 = sub_1000E2C80();
    swift_bridgeObjectRelease();
    uint64_t v15 = v133;
    if (v14)
    {
      uint64_t v16 = v133[16];
      if (v16) {
        goto LABEL_8;
      }
    }
LABEL_11:
    if (qword_1001161B0 != -1) {
      goto LABEL_100;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = v133;
  uint64_t v16 = v133[16];
  if (!v16) {
    goto LABEL_11;
  }
LABEL_8:
  unint64_t v17 = (unint64_t)v138;
  v134 = v138 + 6;
  uint64_t v18 = v15[15];
  uint64_t v19 = v15[19];
  uint64_t v20 = (void *)v15[20];
  uint64_t v22 = v15[21];
  uint64_t v21 = (void *)v15[22];
  uint64_t v23 = v15[17];
  uint64_t v24 = v15[18];
  swift_bridgeObjectRetain_n();
  uint64_t v120 = v18;
  uint64_t v142 = v19;
  sub_10009E618(v18, v16, v23, v24, v19, (uint64_t)v20, v22, v21);
  uint64_t v121 = v22;
  swift_bridgeObjectRetain();
  uint64_t v125 = v16;
  swift_bridgeObjectRetain();
  uint64_t v124 = v23;
  swift_retain();
  v119 = v21;
  uint64_t v3 = v21;
  char v118 = v24;
  if (v24) {
    uint64_t v25 = sub_10001B07C();
  }
  else {
    uint64_t v25 = (uint64_t)sub_10001AC54();
  }
  unint64_t v131 = v25;
  uint64_t v32 = &_swiftEmptySetSingleton;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0) {
    goto LABEL_104;
  }
  while (1)
  {
    void *v134 = v32;
    unint64_t v33 = sub_100005878((uint64_t)_swiftEmptyArrayStorage);
    char v34 = (void *)v33;
    unint64_t v35 = v131;
    if (v131 >> 62)
    {
      unint64_t v117 = v33;
      swift_bridgeObjectRetain();
      char v34 = (void *)v117;
      uint64_t v36 = sub_1000E2B70();
      swift_bridgeObjectRelease();
      unint64_t v35 = v131;
    }
    else
    {
      uint64_t v36 = *(void *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v129 = (void **)(v17 + 56);
    v141 = v20;
    v130 = (void *)v3;
    if (!v36)
    {
LABEL_81:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v96 = swift_bridgeObjectRetain();
      uint64_t v97 = sub_1000BB8B0(v96, v121);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v98 = v133[16];
      if (v98)
      {
        uint64_t v140 = v97;
        uint64_t v99 = v133[15];
        uint64_t v101 = v133[21];
        unsigned int v100 = (void *)v133[22];
        uint64_t v103 = v133[19];
        uint64_t v102 = v133[20];
        uint64_t v104 = v133[17];
        uint64_t v105 = v133[18];
        sub_10009E618(v99, v98, v104, v105, v103, v102, v101, v100);
        swift_bridgeObjectRetain();
        sub_10009E690(v99, v98, v104, v105, v103, v102, v101, v100);
        if (v99 == v120 && v98 == v125)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v106 = sub_1000E2C80();
          swift_bridgeObjectRelease();
          if ((v106 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v3 = (uint64_t)v130;
            goto LABEL_89;
          }
        }
        uint64_t v107 = v133[15];
        uint64_t v108 = v133[17];
        uint64_t v109 = v133[18];
        uint64_t v110 = v133[19];
        uint64_t v135 = v133[20];
        uint64_t v137 = v133[16];
        uint64_t v132 = v133[21];
        uint64_t v128 = (void *)v133[22];
        v133[15] = v120;
        v133[16] = v125;
        v133[17] = v124;
        v133[18] = v118 & 1;
        v133[19] = v142;
        v133[20] = v141;
        v133[21] = v140;
        v133[22] = v119;
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v3 = (uint64_t)v130;
        id v111 = v130;
        sub_10009E690(v107, v137, v108, v109, v110, v135, v132, v128);
        sub_1000B0BA0();

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_release_n();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
      }
LABEL_89:
      swift_bridgeObjectRelease();

      if (qword_1001161B0 != -1) {
        swift_once();
      }
      uint64_t v112 = sub_1000E2030();
      sub_10000AD90(v112, (uint64_t)qword_100118E60);
      uint64_t v113 = sub_1000E2010();
      os_log_type_t v114 = sub_1000E2700();
      if (os_log_type_enabled(v113, v114))
      {
        uint64_t v115 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v115 = 134217984;
        swift_beginAccess();
        if ((*v134 & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v116 = sub_1000E2950();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v116 = *(void *)(*v134 + 16);
        }
        v138[7] = v116;
        sub_1000E2880();
        _os_log_impl((void *)&_mh_execute_header, v113, v114, "[GetContacts] Successfully retrieved and cached contacts; count=%ld",
          v115,
          0xCu);
        swift_slowDealloc();
      }

      sub_1000E1EA0();
      *(void *)(swift_task_alloc() + 16) = v134;
      sub_1000CAD74(&qword_100117F18, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoGetAddressableContactsResponse);
      sub_1000E1210();
      swift_task_dealloc();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v30 = (uint64_t (*)(void))v138[1];
      goto LABEL_16;
    }
    unint64_t v17 = 0;
    unint64_t v127 = v35 & 0xC000000000000001;
    unint64_t v122 = v35 + 32;
    uint64_t v123 = v35 & 0xFFFFFFFFFFFFFF8;
    uint64_t v126 = v36;
LABEL_27:
    if (v127)
    {
      id v46 = (id)sub_1000E2A80();
    }
    else
    {
      if (v17 >= *(void *)(v123 + 16)) {
        goto LABEL_103;
      }
      id v46 = *(id *)(v122 + 8 * v17);
    }
    id v47 = v46;
    BOOL v48 = __OFADD__(v17, 1);
    unint64_t v4 = v17 + 1;
    if (v48)
    {
LABEL_99:
      __break(1u);
LABEL_100:
      swift_once();
LABEL_12:
      uint64_t v26 = sub_1000E2030();
      sub_10000AD90(v26, (uint64_t)qword_100118E60);
      swift_retain();
      uint64_t v27 = sub_1000E2010();
      os_log_type_t v28 = sub_1000E26E0();
      if (os_log_type_enabled(v27, v28))
      {
        unint64_t v29 = (uint8_t *)swift_slowAlloc();
        v145[0] = (id)swift_slowAlloc();
        *(_DWORD *)unint64_t v29 = 136315138;
        swift_bridgeObjectRetain();
        v138[2] = sub_1000DACC8(v3, v4, (uint64_t *)v145);
        sub_1000E2880();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[GetContacts] Rejecting request to brows contacts from a device with which we do not have a session: %s", v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      (id)TUMakeNeighborhoodConduitError();
      swift_willThrow();
      unint64_t v30 = (uint64_t (*)(void))v138[1];
LABEL_16:
      return v30();
    }
    unint64_t v136 = v4;
    v143 = v34;
    id v49 = [v46 phoneNumbers];
    sub_100004D9C(&qword_100118F58);
    unint64_t v17 = sub_1000E2520();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_1000E2B70();
      swift_bridgeObjectRelease();
      v139 = v47;
      if (!v3)
      {
LABEL_44:
        swift_bridgeObjectRelease();
        uint64_t v20 = _swiftEmptyArrayStorage;
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v139 = v47;
      if (!v3) {
        goto LABEL_44;
      }
    }
    v145[0] = _swiftEmptyArrayStorage;
    sub_1000DB2D8(0, v3 & ~(v3 >> 63), 0);
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
LABEL_104:
    if (sub_1000E2B70()) {
      sub_1000DC36C((unint64_t)_swiftEmptyArrayStorage);
    }
    else {
      uint64_t v32 = &_swiftEmptySetSingleton;
    }
  }
  uint64_t v50 = 0;
  uint64_t v20 = v145[0];
  do
  {
    if ((v17 & 0xC000000000000001) != 0) {
      id v51 = (id)sub_1000E2A80();
    }
    else {
      id v51 = *(id *)(v17 + 8 * v50 + 32);
    }
    id v52 = v51;
    v145[0] = v20;
    unint64_t v54 = v20[2];
    unint64_t v53 = v20[3];
    if (v54 >= v53 >> 1)
    {
      sub_1000DB2D8(v53 > 1, v54 + 1, 1);
      uint64_t v20 = v145[0];
    }
    ++v50;
    v20[2] = v54 + 1;
    unint64_t v55 = &v20[2 * v54];
    v55[4] = v52;
    *((unsigned char *)v55 + 40) = 0;
  }
  while (v3 != v50);
  swift_bridgeObjectRelease();
LABEL_45:
  id v56 = [v139 emailAddresses];
  unint64_t v17 = sub_1000E2520();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000E2B70();
    swift_bridgeObjectRelease();
    if (!v3)
    {
LABEL_57:
      swift_bridgeObjectRelease();
      __int16 v58 = _swiftEmptyArrayStorage;
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_57;
    }
  }
  v145[0] = _swiftEmptyArrayStorage;
  sub_1000DB2D8(0, v3 & ~(v3 >> 63), 0);
  if (v3 < 0) {
    goto LABEL_102;
  }
  uint64_t v57 = 0;
  __int16 v58 = v145[0];
  do
  {
    if ((v17 & 0xC000000000000001) != 0) {
      id v59 = (id)sub_1000E2A80();
    }
    else {
      id v59 = *(id *)(v17 + 8 * v57 + 32);
    }
    id v60 = v59;
    v145[0] = v58;
    unint64_t v62 = v58[2];
    unint64_t v61 = v58[3];
    if (v62 >= v61 >> 1)
    {
      sub_1000DB2D8(v61 > 1, v62 + 1, 1);
      __int16 v58 = v145[0];
    }
    ++v57;
    v58[2] = v62 + 1;
    unint64_t v63 = &v58[2 * v62];
    v63[4] = v60;
    *((unsigned char *)v63 + 40) = 1;
  }
  while (v3 != v57);
  swift_bridgeObjectRelease();
LABEL_58:
  v145[0] = v20;
  sub_1000C98B0((uint64_t)v58);
  uint64_t v64 = *((void *)v145[0] + 2);
  if (!v64)
  {
    uint64_t v20 = v141;
LABEL_26:
    swift_bridgeObjectRelease();
    [v139 mutableCopy];
    sub_1000E28B0();
    swift_unknownObjectRelease();
    sub_100006C20(0, (unint64_t *)&qword_100118F60);
    swift_dynamicCast();
    uint64_t v37 = *v129;
    Class isa = sub_1000E2510().super.isa;
    [v37 setPhoneNumbers:isa];

    Class v39 = sub_1000E2510().super.isa;
    [v37 setEmailAddresses:v39];

    id v40 = v37;
    id v41 = [v139 identifier];
    sub_1000E23F0();

    id v42 = objc_allocWithZone((Class)TUContinuitySessionContact);
    NSString v43 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    sub_100006C20(0, (unint64_t *)&unk_100118240);
    sub_10001494C((unint64_t *)&unk_100118F70, (unint64_t *)&unk_100118240);
    Class v44 = sub_1000E2650().super.isa;
    swift_bridgeObjectRelease();
    id v45 = [v42 initWithContact:v40 contactIdentifier:v43 anonyms:v44];

    sub_1000C43D0(v145, v45, (unint64_t *)&unk_100119A20, (uint64_t)TUContinuitySessionContact_ptr, (uint64_t *)&unk_100118FB0);
    unint64_t v17 = v136;
    uint64_t v3 = (uint64_t)v130;
    char v34 = v143;
    if (v136 == v126) {
      goto LABEL_81;
    }
    goto LABEL_27;
  }
  unsigned int v65 = (char *)v145[0] + 40;
  uint64_t v20 = v141;
  while (1)
  {
    char v66 = *v65;
    id v67 = (void *)*((void *)v65 - 1);
    id v68 = v67;
    id v69 = sub_1000BB504(v142, v20, v67, v66);
    if (v69) {
      break;
    }

LABEL_61:
    v65 += 16;
    if (!--v64) {
      goto LABEL_26;
    }
  }
  id v70 = v69;
  sub_1000C43D0(v145, v70, (unint64_t *)&unk_100118240, (uint64_t)TUContinuityHandleAnonym_ptr, &qword_100118F98);

  id v71 = [v70 identifier];
  uint64_t v144 = sub_1000E23F0();
  uint64_t v3 = v72;

  id v73 = v68;
  id v74 = [v73 value];
  uint64_t v75 = v74;
  if (v66)
  {
    uint64_t v76 = 3;
  }
  else
  {
    id v77 = [v74 stringValue];

    uint64_t v75 = v77;
    uint64_t v76 = 2;
  }
  sub_1000E23F0();

  id v78 = objc_allocWithZone((Class)TUHandle);
  NSString v79 = sub_1000E23E0();
  swift_bridgeObjectRelease();
  id v80 = [v78 initWithType:v76 value:v79];

  v81 = v143;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v145[0] = v143;
  unint64_t v4 = sub_1000064DC(v144, v3);
  uint64_t v84 = v143[2];
  BOOL v85 = (v83 & 1) == 0;
  uint64_t v86 = v84 + v85;
  if (__OFADD__(v84, v85))
  {
    __break(1u);
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  char v87 = v83;
  if (v143[3] >= v86)
  {
    if (isUniquelyReferenced_nonNull_native)
    {
      if ((v83 & 1) == 0) {
        goto LABEL_75;
      }
    }
    else
    {
      sub_1000C8654(&qword_100116490);
      v81 = v145[0];
      v143 = v145[0];
      if ((v87 & 1) == 0) {
        goto LABEL_75;
      }
    }
    goto LABEL_73;
  }
  sub_1000C5740(v86, isUniquelyReferenced_nonNull_native, &qword_100116490);
  v88 = v145[0];
  unint64_t v89 = sub_1000064DC(v144, v3);
  if ((v87 & 1) == (v90 & 1))
  {
    unint64_t v4 = v89;
    v81 = v88;
    v143 = v88;
    if ((v87 & 1) == 0)
    {
LABEL_75:
      v81[(v4 >> 6) + 8] |= 1 << v4;
      unsigned int v93 = (uint64_t *)(v81[6] + 16 * v4);
      *unsigned int v93 = v144;
      v93[1] = v3;
      *(void *)(v81[7] + 8 * v4) = v80;
      uint64_t v94 = v81[2];
      BOOL v48 = __OFADD__(v94, 1);
      uint64_t v95 = v94 + 1;
      if (v48) {
        goto LABEL_98;
      }
      v81[2] = v95;
      swift_bridgeObjectRetain();
      goto LABEL_77;
    }
LABEL_73:
    uint64_t v91 = v81[7];
    uint64_t v92 = 8 * v4;

    *(void *)(v91 + v92) = v80;
LABEL_77:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = v141;
    goto LABEL_61;
  }
  return sub_1000E2CE0();
}

id sub_1000BB504(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a3;
  id v8 = [v7 value];
  uint64_t v9 = v8;
  if ((a4 & 1) == 0)
  {
    id v10 = [v8 stringValue];

    uint64_t v9 = v10;
  }
  uint64_t v11 = sub_1000E23F0();
  uint64_t v13 = v12;

  sub_100019C24(v11, v13, a1, a2);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (!v15) {
    return 0;
  }
  id v16 = v7;
  id v17 = [v16 label];
  uint64_t v18 = v17;
  if (a4)
  {
    if (v17)
    {
      sub_1000E23F0();
      uint64_t v23 = v22;
    }
    else
    {
      uint64_t v23 = 0;
    }
    id v26 = [v16 label];
    if (v26)
    {
      uint64_t v27 = v26;
      sub_1000E23F0();
    }
    else
    {
      sub_1000E23F0();
    }
    unint64_t v33 = self;
    NSString v34 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    id v35 = [v33 localizedStringForLabel:v34];

    sub_1000E23F0();
    NSString v31 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    if (v23)
    {
      NSString v32 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v32 = 0;
    }
    id v39 = objc_allocWithZone((Class)TUContinuityHandleAnonym);
    NSString v37 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    id v38 = [v39 initWithIdentifier:v31 label:v32 localizedDisplayName:v37 type:2];
  }
  else
  {
    if (v17)
    {
      sub_1000E23F0();
      uint64_t v20 = v19;
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v24 = [v16 label];
    if (v24)
    {
      uint64_t v25 = v24;
      sub_1000E23F0();
    }
    else
    {
      sub_1000E23F0();
    }
    os_log_type_t v28 = self;
    NSString v29 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    id v30 = [v28 localizedStringForLabel:v29];

    sub_1000E23F0();
    NSString v31 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    if (v20)
    {
      NSString v32 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v32 = 0;
    }
    id v36 = objc_allocWithZone((Class)TUContinuityHandleAnonym);
    NSString v37 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    id v38 = [v36 initWithIdentifier:v31 label:v32 localizedDisplayName:v37 type:1];
  }
  id v21 = v38;

  return v21;
}

uint64_t sub_1000BB8B0(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_1000CA4D0(a1, (uint64_t)sub_1000CAE3C, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1000BB93C(uint64_t a1, uint64_t *a2)
{
  v34[1] = a1;
  uint64_t v3 = sub_1000E1820();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  id v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = *a2;
  unint64_t v9 = *a2 & 0xC000000000000001;
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000E2950();
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_23:
    sub_1000E1E90();
    id v33 = [self sharedDefaults];
    [v33 sortOrder];

    return sub_1000E1E80();
  }
  uint64_t v10 = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  Class v44 = _swiftEmptyArrayStorage;
  sub_1000DB390(0, v10 & ~(v10 >> 63), 0);
  if (v9)
  {
    uint64_t result = sub_1000E28F0();
    unsigned __int8 v13 = 1;
  }
  else
  {
    uint64_t result = sub_1000DBE6C(v8);
    unsigned __int8 v13 = v14 & 1;
  }
  uint64_t v41 = result;
  uint64_t v42 = v12;
  unsigned __int8 v43 = v13;
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v15 = v8 & 0xFFFFFFFFFFFFFF8;
    if (v8 < 0) {
      uint64_t v15 = v8;
    }
    uint64_t v38 = v15;
    uint64_t v39 = v4 + 32;
    id v36 = v7;
    uint64_t v37 = v4;
    unint64_t v35 = v9;
    do
    {
      while (1)
      {
        sub_1000DBE58(v41, v42, v43, v8);
        os_log_type_t v28 = v27;
        sub_1000981D8((uint64_t)v7);

        NSString v29 = v44;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000DB390(0, v29[2] + 1, 1);
          NSString v29 = v44;
        }
        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1)
        {
          sub_1000DB390(v30 > 1, v31 + 1, 1);
          NSString v29 = v44;
        }
        v29[2] = v31 + 1;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v29+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v31, v7, v3);
        Class v44 = v29;
        if (v9) {
          break;
        }
        uint64_t v16 = v41;
        uint64_t v17 = v42;
        char v18 = v43;
        uint64_t v19 = sub_1000DBA74(v41, v42, v43, v8);
        uint64_t v20 = v3;
        uint64_t v22 = v21;
        uint64_t v23 = v8;
        char v25 = v24;
        sub_10001A820(v16, v17, v18);
        uint64_t v41 = v19;
        uint64_t v42 = v22;
        uint64_t v3 = v20;
        unint64_t v9 = v35;
        id v7 = v36;
        unsigned __int8 v26 = v25 & 1;
        uint64_t v8 = v23;
        uint64_t v4 = v37;
        unsigned __int8 v43 = v26;
        if (!--v10) {
          goto LABEL_22;
        }
      }
      if ((v43 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_1000E2910()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_100004D9C((uint64_t *)&unk_100118FA0);
      NSString v32 = (void (*)(char *, void))sub_1000E2690();
      sub_1000E29C0();
      v32(v40, 0);
      --v10;
    }
    while (v10);
LABEL_22:
    sub_10001A820(v41, v42, v43);
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

void sub_1000BBCE8(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v76 = a2;
  uint64_t v7 = sub_1000E2030();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v4[16];
  if (v12)
  {
    uint64_t v13 = v4[15];
    uint64_t v15 = v4[17];
    uint64_t v14 = v4[18];
    uint64_t v16 = v4[19];
    uint64_t v17 = v4[20];
    uint64_t v19 = v4[21];
    char v18 = (void *)v4[22];
    v81[1] = v13;
    v81[2] = v12;
    id v77 = v18;
    uint64_t v78 = v15;
    v81[3] = v15;
    uint64_t v74 = v16;
    uint64_t v75 = v14;
    char v82 = v14 & 1;
    uint64_t v83 = v16;
    uint64_t v84 = v17;
    uint64_t v85 = v19;
    uint64_t v86 = v18;
    if (!a1)
    {
      uint64_t v46 = qword_1001161B0;
      swift_bridgeObjectRetain_n();
      uint64_t v47 = v78;
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      BOOL v48 = v77;
      if (v46 != -1) {
        swift_once();
      }
      sub_10000AD90(v7, (uint64_t)qword_100118E60);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v49 = v48;
      uint64_t v50 = sub_1000E2010();
      uint64_t v51 = v17;
      os_log_type_t v52 = sub_1000E2700();
      if (os_log_type_enabled(v50, v52))
      {
        unint64_t v53 = (uint8_t *)swift_slowAlloc();
        uint64_t v76 = swift_slowAlloc();
        uint64_t v79 = v76;
        *(_DWORD *)unint64_t v53 = 136315138;
        swift_bridgeObjectRetain();
        v81[0] = sub_1000DACC8(v13, v12, &v79);
        sub_1000E2880();
        swift_bridgeObjectRelease();
        uint64_t v55 = v74;
        uint64_t v54 = v75;
        uint64_t v56 = v51;
        uint64_t v73 = v51;
        uint64_t v57 = v77;
        sub_10009E690(v13, v12, v78, v75, v74, v56, v19, v77);
        _os_log_impl((void *)&_mh_execute_header, v50, v52, "Disconnecting camera session (%s because rapport is now out of session.", v53, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v47 = v78;
        swift_slowDealloc();

        uint64_t v17 = v73;
      }
      else
      {
        uint64_t v55 = v74;
        uint64_t v54 = v75;
        uint64_t v58 = v51;
        uint64_t v17 = v51;
        uint64_t v57 = v77;
        sub_10009E690(v13, v12, v47, v75, v74, v58, v19, v77);
      }
      goto LABEL_21;
    }
    if (a1 == 1 && (!a3 || (v13 != v76 || v12 != a3) && (sub_1000E2C80() & 1) == 0))
    {
      uint64_t v73 = a3;
      uint64_t v71 = v8;
      uint64_t v20 = qword_1001161B0;
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v68 = v77;
      uint64_t v21 = v19;
      if (v20 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_10000AD90(v7, (uint64_t)qword_100118E60);
      (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v11, v22, v7);
      uint64_t v23 = v78;
      uint64_t v25 = v74;
      uint64_t v24 = v75;
      uint64_t v26 = v21;
      uint64_t v72 = v11;
      uint64_t v27 = v21;
      os_log_type_t v28 = v77;
      sub_10009E618(v13, v12, v78, v75, v74, v17, v26, v77);
      uint64_t v69 = v7;
      swift_bridgeObjectRetain();
      uint64_t v70 = v13;
      sub_10009E618(v13, v12, v23, v24, v25, v17, v27, v28);
      swift_bridgeObjectRetain();
      NSString v29 = sub_1000E2010();
      int v30 = sub_1000E2700();
      uint64_t v31 = v27;
      if (os_log_type_enabled(v29, (os_log_type_t)v30))
      {
        int v65 = v30;
        os_log_t v66 = v29;
        NSString v32 = (_DWORD *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        v81[0] = v64;
        id v67 = (uint8_t *)v32;
        *NSString v32 = 136315394;
        unint64_t v63 = v32 + 1;
        swift_bridgeObjectRetain();
        uint64_t v33 = v78;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        NSString v34 = v68;
        id v68 = (void *)sub_1000B0A08();
        unint64_t v36 = v35;
        uint64_t v13 = v70;
        uint64_t v37 = v31;
        uint64_t v39 = v74;
        uint64_t v38 = v75;
        id v40 = v77;
        sub_10009E690(v70, v12, v33, v75, v74, v17, v37, v77);
        uint64_t v79 = sub_1000DACC8((uint64_t)v68, v36, v81);
        id v68 = &v80;
        sub_1000E2880();
        swift_bridgeObjectRelease();
        sub_10009E690(v13, v12, v33, v38, v39, v17, v37, v40);
        uint64_t v41 = v38;
        uint64_t v19 = v37;
        sub_10009E690(v13, v12, v33, v41, v39, v17, v37, v40);
        uint64_t v42 = v67;
        *((_WORD *)v67 + 6) = 2080;
        if (v73)
        {
          uint64_t v79 = v76;
          uint64_t v80 = v73;
          swift_bridgeObjectRetain();
          uint64_t v43 = sub_1000E2420();
          unint64_t v45 = v44;
        }
        else
        {
          unint64_t v45 = 0xE300000000000000;
          uint64_t v43 = 7104878;
        }
        uint64_t v61 = v71;
        uint64_t v79 = sub_1000DACC8(v43, v45, v81);
        sub_1000E2880();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        os_log_t v62 = v66;
        _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v65, "Disconnecting camera session because rapport and conduit session devices are mismatched: [%s and %s]", v42, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v61 + 8))(v72, v69);
        uint64_t v55 = v74;
        uint64_t v54 = v75;
        uint64_t v57 = v77;
        uint64_t v47 = v78;
      }
      else
      {
        uint64_t v13 = v70;
        uint64_t v57 = v77;
        uint64_t v59 = v78;
        uint64_t v55 = v74;
        uint64_t v60 = v75;
        sub_10009E690(v70, v12, v78, v75, v74, v17, v31, v77);
        sub_10009E690(v13, v12, v59, v60, v55, v17, v31, v57);
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v69);
        uint64_t v54 = v60;
        uint64_t v19 = v31;
        uint64_t v47 = v78;
      }
LABEL_21:
      sub_1000B812C(v13, v12);
      sub_10009E690(v13, v12, v47, v54, v55, v17, v19, v57);
      sub_10009E690(v13, v12, v47, v54, v55, v17, v19, v57);
    }
  }
}

uint64_t sub_1000BC518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v8 = sub_1000E1C10();
  v5[7] = v8;
  v5[8] = *(void *)(v8 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v9 = (void *)swift_task_alloc();
  v5[10] = v9;
  void *v9 = v5;
  v9[1] = sub_1000BC624;
  v9[2] = a5;
  return _swift_task_switch(sub_1000BCDC0, a4, 0);
}

uint64_t sub_1000BC624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)v3;
  uint64_t v5 = *(void *)(*(void *)v3 + 40);
  v4[11] = a1;
  v4[12] = a2;
  v4[13] = a3;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BC740, v5, 0);
}

uint64_t sub_1000BC740()
{
  uint64_t v24 = v0;
  if (qword_1001161B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = sub_1000E2030();
  sub_10000AD90(v2, (uint64_t)qword_100118E60);
  sub_10009D484(v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1000E2010();
  os_log_type_t v4 = sub_1000E2700();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 48);
  if (v5)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315906;
    os_log_type_t type = v4;
    uint64_t v11 = *(void *)v8;
    unint64_t v10 = *(void *)(v8 + 8);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_1000DACC8(v11, v10, &v23);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v0 + 24) = *(void *)(v7 + 16);
    sub_1000E2880();
    *(_WORD *)(v9 + 22) = 2048;
    *(void *)(v0 + 32) = *(void *)(v6 + 16);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 32) = 1024;
    *(_DWORD *)(v0 + 136) = *(unsigned char *)(v8 + 24) & 1;
    sub_1000E2880();
    sub_10009D614(v8);
    _os_log_impl((void *)&_mh_execute_header, v3, type, "Recents calls data changed, sending %s new recent calls (%ld and contacts %ld isDedicatedInfo:%{BOOL}d.", (uint8_t *)v9, 0x26u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10009D614(v8);
  }

  uint64_t v13 = *(void *)(v0 + 96);
  uint64_t v12 = *(void *)(v0 + 104);
  uint64_t v14 = *(void *)(v0 + 88);
  uint64_t v15 = *(uint64_t **)(v0 + 48);
  uint64_t v16 = (void *)swift_task_alloc();
  v16[2] = v14;
  v16[3] = v13;
  v16[4] = v12;
  sub_1000CAD74(&qword_1001191A0, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoRecentCallsDidChangeEvent);
  sub_1000E1210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v17 = *v15;
  uint64_t v18 = v15[1];
  if (qword_100116188 != -1) {
    swift_once();
  }
  *(void *)(v0 + 112) = qword_10011BF78;
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_1000BCB40;
  uint64_t v20 = *(void *)(v0 + 72);
  return sub_1000AF104(9, v20, v17, v18, 0);
}

uint64_t sub_1000BCB40()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  if (v0) {
    os_log_type_t v4 = sub_1000BCC6C;
  }
  else {
    os_log_type_t v4 = sub_10007D0C4;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000BCC6C()
{
  uint64_t v1 = v0[5];
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  return _swift_task_switch(sub_1000BCCE8, v1, 0);
}

uint64_t sub_1000BCCE8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000BCD4C()
{
  return sub_1000E1C00();
}

uint64_t sub_1000BCDA0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  return _swift_task_switch(sub_1000BCDC0, v1, 0);
}

uint64_t sub_1000BCDC0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if ((*(unsigned char *)(v1 + 24) & 1) == 0)
  {
    id v2 = [*(id *)(v1 + 56) recentCalls];
    if (v2)
    {
      uint64_t v3 = v2;
      sub_100006C20(0, &qword_100118F28);
      unint64_t v4 = sub_1000E2520();
    }
    else
    {
      unint64_t v4 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_1000E2B70();
      uint64_t v8 = result;
      if (result) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_8:
        if (v8 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v21 = v0;
        for (uint64_t i = 0; i != v8; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v11 = (id)sub_1000E2A80();
          }
          else {
            id v11 = *(id *)(v4 + 8 * i + 32);
          }
          uint64_t v12 = v11;
          id v13 = objc_msgSend(v11, "remoteParticipantHandles", v21);
          if (v13)
          {
            uint64_t v14 = v13;
            sub_100006C20(0, &qword_100118F18);
            sub_10001494C(&qword_100118F20, &qword_100118F18);
            unint64_t v15 = sub_1000E2660();

            sub_1000A8848(v15, &qword_100118F18, (uint64_t)CHHandle_ptr, &qword_100118F20, (uint64_t *)&unk_100118F30);
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v0 = v21;
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
LABEL_19:
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = sub_1000A7B40(v16);
    uint64_t v18 = sub_1000CBD5C((uint64_t)v17);
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_1000198B0(v18, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v19) {
      uint64_t v19 = sub_100005884((uint64_t)&_swiftEmptyArrayStorage);
    }
    BOOL v5 = sub_1000A7908(v4);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)sub_1000C93F4(v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = _swiftEmptyDictionarySingleton;
    goto LABEL_22;
  }
  BOOL v5 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v6 = (void *)sub_1000059A8((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v7 = _swiftEmptyDictionarySingleton;
LABEL_22:
  uint64_t v20 = *(uint64_t (**)(char *, void *, void *))(v0 + 8);
  return v20(v5, v7, v6);
}

uint64_t sub_1000BD0A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000BD828(a1);
  if (qword_1001161B0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000E2030();
  sub_10000AD90(v9, (uint64_t)qword_100118E60);
  swift_bridgeObjectRetain();
  sub_10009D484((uint64_t)a1);
  unint64_t v10 = sub_1000E2010();
  os_log_type_t v11 = sub_1000E2700();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = v7;
    uint64_t v13 = v12;
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v15 = *a1;
    unint64_t v14 = a1[1];
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1000DACC8(v15, v14, &v26);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    sub_10009D614((uint64_t)a1);
    *(_WORD *)(v13 + 12) = 2048;
    uint64_t v25 = v8[2];
    sub_1000E2880();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Favorites data changed, sending %s new favorites (%ld.", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v24;
    swift_slowDealloc();
  }
  else
  {
    sub_10009D614((uint64_t)a1);
    swift_bridgeObjectRelease();
  }

  uint64_t v16 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
  uint64_t v18 = sub_1000CAD74(&qword_100119010, v17, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = v18;
  *(void *)(v19 + 32) = a2;
  *(void *)(v19 + 40) = v8;
  long long v20 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v19 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v19 + 64) = v20;
  long long v21 = *((_OWORD *)a1 + 3);
  *(_OWORD *)(v19 + 80) = *((_OWORD *)a1 + 2);
  *(_OWORD *)(v19 + 96) = v21;
  swift_retain();
  sub_10009D484((uint64_t)a1);
  swift_retain();
  sub_1000A75C4((uint64_t)v7, (uint64_t)&unk_100119168, v19);
  return swift_release();
}

uint64_t sub_1000BD3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  uint64_t v8 = sub_1000E1AC0();
  v6[5] = v8;
  v6[6] = *(void *)(v8 - 8);
  v6[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000BD494, a4, 0);
}

uint64_t sub_1000BD494()
{
  uint64_t v1 = (uint64_t *)v0[4];
  uint64_t v2 = v0[3];
  *(void *)(swift_task_alloc() + 16) = v2;
  sub_1000CAD74(&qword_100119170, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoFavoritesDidChangeEvent);
  sub_1000E1210();
  swift_task_dealloc();
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  if (qword_100116188 != -1) {
    swift_once();
  }
  v0[8] = qword_10011BF78;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000BD620;
  uint64_t v6 = v0[7];
  return sub_1000B03D4(14, v6, v3, v4, 0);
}

uint64_t sub_1000BD620()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_1000BD748;
  }
  else {
    uint64_t v3 = sub_10006D5D0;
  }
  return _swift_task_switch(v3, v2, 0);
}

uint64_t sub_1000BD748()
{
  uint64_t v1 = v0[2];
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  return _swift_task_switch(sub_1000BD7C4, v1, 0);
}

uint64_t sub_1000BD7C4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t *sub_1000BD828(void *a1)
{
  uint64_t v106 = sub_1000E18B0();
  uint64_t v103 = *(void *)(v106 - 8);
  __chkstk_darwin(v106, v3);
  uint64_t v105 = (uint64_t)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((unsigned char *)a1 + 24) != 1) {
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  id v5 = (id)*((void *)a1 + 5);
  uint64_t v107 = *((void *)a1 + 4);
  unint64_t v6 = *((void *)a1 + 6);
  sub_10009D484((uint64_t)a1);
  uint64_t v7 = qword_100116170;
  swift_bridgeObjectRetain();
  if (v7 != -1) {
LABEL_76:
  }
    swift_once();
  uint64_t v101 = v1;
  uint64_t v109 = v5;
  id v8 = [(id)qword_100117228 entries];
  sub_100006C20(0, (unint64_t *)&unk_100117280);
  unint64_t v9 = sub_1000E2520();

  unint64_t v104 = sub_100005878((uint64_t)&_swiftEmptyArrayStorage);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1000E2B70();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_5;
    }
LABEL_78:
    swift_bridgeObjectRelease();
    uint64_t v108 = (unint64_t *)&_swiftEmptyArrayStorage;
LABEL_79:
    unint64_t v67 = *(void *)a1;
    unint64_t v66 = *((void *)a1 + 1);
    uint64_t v68 = *((void *)a1 + 2);
    uint64_t v69 = (void *)*((void *)a1 + 7);
    uint64_t v70 = swift_bridgeObjectRetain();
    uint64_t v71 = sub_1000BB8B0(v70, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v72 = v101;
    uint64_t v74 = v101[15];
    uint64_t v73 = v101[16];
    id v75 = v69;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v73)
    {
      uint64_t v111 = v68;
      unint64_t v112 = v71;
      unint64_t v113 = (unint64_t)v75;
      uint64_t v77 = v72[21];
      uint64_t v76 = (void *)v72[22];
      uint64_t v78 = v72;
      uint64_t v79 = v72[19];
      uint64_t v80 = v72[20];
      uint64_t v81 = v72[18];
      uint64_t v82 = v78[17];
      sub_10009E618(v74, v73, v82, v81, v79, v80, v77, v76);
      swift_bridgeObjectRetain();
      sub_10009E690(v74, v73, v82, v81, v79, v80, v77, v76);
      if (v74 == v67 && v73 == v66)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v83 = sub_1000E2C80();
        swift_bridgeObjectRelease();
        if ((v83 & 1) == 0)
        {
          swift_release_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          int v65 = v108;
          id v75 = (id)v113;
          goto LABEL_87;
        }
      }
      uint64_t v84 = v101;
      uint64_t v110 = v101[15];
      uint64_t v85 = v101[16];
      uint64_t v105 = v101[17];
      uint64_t v106 = v85;
      unint64_t v86 = v101[18];
      uint64_t v87 = v101[20];
      uint64_t v103 = v101[19];
      unint64_t v104 = v86;
      uint64_t v88 = v101[21];
      unint64_t v89 = (void *)v101[22];
      v101[15] = v67;
      v84[16] = v66;
      unint64_t v90 = v112;
      v84[17] = v111;
      v84[18] = 1;
      unint64_t v91 = (unint64_t)v109;
      v84[19] = v107;
      v84[20] = v91;
      id v75 = (id)v113;
      v84[21] = v90;
      v84[22] = (unint64_t)v75;
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v92 = v75;
      sub_10009E690(v110, v106, v105, v104, v103, v87, v88, v89);
      sub_1000B0BA0();
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      int v65 = v108;
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      int v65 = v108;
    }
LABEL_87:

    swift_bridgeObjectRelease_n();
    return v65;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    goto LABEL_78;
  }
LABEL_5:
  unint64_t v94 = v6;
  unint64_t v6 = 0;
  uint64_t v102 = 0;
  unint64_t v113 = v9 & 0xC000000000000001;
  uint64_t v110 = v9 + 32;
  uint64_t v111 = v9 & 0xFFFFFFFFFFFFFF8;
  uint64_t v95 = a1;
  uint64_t v96 = v103 + 32;
  uint64_t v108 = (unint64_t *)&_swiftEmptyArrayStorage;
  unint64_t v112 = v9;
  while (1)
  {
    if (v113)
    {
      os_log_type_t v11 = (unint64_t *)sub_1000E2A80();
    }
    else
    {
      if (v6 >= *(void *)(v111 + 16)) {
        goto LABEL_74;
      }
      os_log_type_t v11 = (unint64_t *)*(id *)(v110 + 8 * v6);
    }
    uint64_t v1 = v11;
    if (__OFADD__(v6++, 1))
    {
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    if (qword_1001161C0 != -1) {
      swift_once();
    }
    uint64_t v13 = off_100118E78;
    swift_bridgeObjectRetain();
    id v14 = [v1 bundleIdentifier];
    id v5 = (id)sub_1000E23F0();
    a1 = v15;

    uint64_t v16 = v13[2];
    if (v16) {
      break;
    }
LABEL_6:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
LABEL_7:
    if (v6 == v10)
    {
      swift_bridgeObjectRelease();
      a1 = v95;
      unint64_t v6 = v94;
      goto LABEL_79;
    }
  }
  BOOL v17 = (id)v13[4] == v5 && v13[5] == (void)a1;
  if (!v17 && (sub_1000E2C80() & 1) == 0)
  {
    if (v16 != 1)
    {
      if (id)v13[6] == v5 && (void *)v13[7] == a1 || (sub_1000E2C80()) {
        goto LABEL_21;
      }
      if (v16 != 2)
      {
        os_log_type_t v28 = v13 + 9;
        uint64_t v29 = 2;
        while (1)
        {
          uint64_t v30 = v29 + 1;
          if (__OFADD__(v29, 1)) {
            goto LABEL_75;
          }
          BOOL v31 = (id)*(v28 - 1) == v5 && *v28 == (void)a1;
          if (v31 || (sub_1000E2C80() & 1) != 0) {
            goto LABEL_21;
          }
          v28 += 2;
          ++v29;
          if (v30 == v16) {
            goto LABEL_6;
          }
        }
      }
    }
    goto LABEL_6;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v18 = [v1 contactProperty];
  if (!v18) {
    goto LABEL_67;
  }
  uint64_t v19 = v18;
  NSString v20 = [v1 value];
  if (!v20)
  {
    sub_1000E23F0();
    id v5 = v21;
    NSString v20 = sub_1000E23E0();
    swift_bridgeObjectRelease();
  }
  id v22 = [self normalizedHandleWithDestinationID:v20];

  if (!v22)
  {

    goto LABEL_7;
  }
  id v23 = [v22 type];
  if (v23 == (id)2)
  {
    id v32 = [v19 label];
    if (v32)
    {
      uint64_t v33 = v32;
      sub_1000E23F0();
      uint64_t v35 = v34;
    }
    else
    {
      uint64_t v35 = 0;
    }
    id v37 = [v22 value];
    sub_1000E23F0();

    id v38 = objc_allocWithZone((Class)CNPhoneNumber);
    NSString v39 = sub_1000E23E0();
    swift_bridgeObjectRelease();
    id v5 = [v38 initWithStringValue:v39];

    if (v35)
    {
      a1 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      a1 = 0;
    }
    id v40 = [objc_allocWithZone((Class)CNLabeledValue) initWithLabel:a1 value:v5];
    char v41 = 0;
LABEL_58:

    id v42 = sub_1000BB504(v107, v109, v40, v41);
    if (v42)
    {
      uint64_t v43 = v42;
      a1 = (void *)sub_100006C20(0, &qword_100118F08);
      unint64_t v44 = v1;
      id v45 = v43;
      id v5 = v44;
      id v46 = v45;
      uint64_t v47 = v44;
      uint64_t v1 = (unint64_t *)a1;
      id v48 = sub_1000D9634(v47, v46);
      if (v48)
      {
        id v99 = v5;
        id v98 = (id)__chkstk_darwin(v48, v49);
        *(&v93 - 2) = (uint64_t)v98;
        sub_1000CAD74(&qword_100118F10, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoContinuityFavorite);
        uint64_t v50 = v102;
        sub_1000E1210();
        uint64_t v102 = v50;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v108 = (unint64_t *)sub_1000187B8(0, v108[2] + 1, 1, (unint64_t)v108);
        }
        unint64_t v52 = v108[2];
        unint64_t v51 = v108[3];
        if (v52 >= v51 >> 1) {
          uint64_t v108 = (unint64_t *)sub_1000187B8(v51 > 1, v52 + 1, 1, (unint64_t)v108);
        }
        unint64_t v53 = v108;
        v108[2] = v52 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v103 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80))+ *(void *)(v103 + 72) * v52, v105, v106);
        id v54 = [v46 identifier];
        uint64_t v97 = sub_1000E23F0();
        a1 = v55;

        id v56 = v40;
        id v57 = [v56 value];
        uint64_t v58 = v57;
        id v100 = v46;
        if (v41)
        {
          uint64_t v59 = 3;
        }
        else
        {
          id v60 = [v57 stringValue];

          uint64_t v58 = v60;
          uint64_t v59 = 2;
        }
        sub_1000E23F0();

        id v61 = objc_allocWithZone((Class)TUHandle);
        NSString v62 = sub_1000E23E0();
        swift_bridgeObjectRelease();
        id v5 = [v61 initWithType:v59 value:v62];

        unint64_t v63 = v104;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v114 = v63;
        uint64_t v1 = &v114;
        sub_1000C7750((uint64_t)v5, v97, (uint64_t)a1, isUniquelyReferenced_nonNull_native, &qword_100116490);
        unint64_t v104 = v114;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
      }
      goto LABEL_7;
    }

LABEL_67:
    goto LABEL_7;
  }
  if (v23 != (id)3)
  {

    goto LABEL_67;
  }
  id v24 = [v19 label];
  if (v24)
  {
    uint64_t v25 = v24;
    sub_1000E23F0();
    uint64_t v27 = v26;
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t result = (unint64_t *)[v22 value];
  if (result)
  {
    id v5 = result;
    if (v27)
    {
      a1 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      a1 = 0;
    }
    id v40 = [objc_allocWithZone((Class)CNLabeledValue) initWithLabel:a1 value:v5];
    char v41 = 1;
    goto LABEL_58;
  }
  __break(1u);
  return result;
}

void sub_1000BE404(void *a1)
{
  if ([a1 status] == 1 || objc_msgSend(a1, "status") == 3)
  {
    uint64_t v3 = *(void **)(v1 + 232);
    if ([v3 currentState] == 1)
    {
      if (qword_1001161B0 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_1000E2030();
      sub_10000AD90(v4, (uint64_t)qword_100118E60);
      id v5 = a1;
      unint64_t v6 = sub_1000E2010();
      os_log_type_t v7 = sub_1000E2700();
      if (os_log_type_enabled(v6, v7))
      {
        id v8 = (uint8_t *)swift_slowAlloc();
        unint64_t v9 = (void *)swift_slowAlloc();
        *(_DWORD *)id v8 = 138412290;
        id v10 = v5;
        sub_1000E2880();
        void *v9 = v5;

        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Call active on phone while inSession. Calling exitSession. %@", v8, 0xCu);
        sub_100004D9C(&qword_100117180);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      NSString v11 = sub_1000E23E0();
      [v3 exitDiscoverySessionWithReason:v11];
    }
  }
}

uint64_t sub_1000BE61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  uint64_t v7 = sub_1000E1DC0();
  v5[6] = v7;
  v5[7] = *(void *)(v7 - 8);
  v5[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000BE6E0, a4, 0);
}

uint64_t sub_1000BE6E0()
{
  if ([*(id *)(v0[4] + 224) isGreenTea])
  {
    if (qword_1001161B0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000E2030();
    sub_10000AD90(v2, (uint64_t)qword_100118E60);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000E2010();
    os_log_type_t v4 = sub_1000E2700();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v5 = 134217984;
      v0[3] = _swiftEmptyArrayStorage[2];
      sub_1000E2880();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[ContinuityCalls] Sending updated calls of count %ld", v5, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v12 = (uint64_t *)v0[5];
    *(void *)(swift_task_alloc() + 16) = _swiftEmptyArrayStorage;
    sub_1000CAD74(&qword_1001190F8, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoContinuityCallsDidChangeEvent);
    sub_1000E1210();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    if (qword_100116188 != -1) {
      swift_once();
    }
    v0[11] = qword_10011BF78;
    uint64_t v15 = (void *)swift_task_alloc();
    v0[12] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_1000BEEB4;
    uint64_t v16 = v0[8];
    return sub_1000AFF20(13, v16, v14, v13, 0);
  }
  else
  {
    uint64_t v6 = v0[4];
    char v7 = *(unsigned char *)(v0[5] + 24);
    uint64_t v8 = sub_1000CAD74(&qword_100119010, v1, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v9 = swift_task_alloc();
    v0[9] = v9;
    *(void *)(v9 + 16) = v6;
    *(unsigned char *)(v9 + 24) = 0;
    *(unsigned char *)(v9 + 25) = v7;
    id v10 = (void *)swift_task_alloc();
    v0[10] = v10;
    uint64_t v11 = sub_100004D9C(&qword_100119018);
    *id v10 = v0;
    v10[1] = sub_1000BEABC;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, v6, v8, 0xD000000000000015, 0x80000001000EA5E0, sub_1000CE2D8, v9, v11);
  }
}

uint64_t sub_1000BEABC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BEBE8, v1, 0);
}

uint64_t sub_1000BEBE8()
{
  uint64_t v1 = v0[4];
  unint64_t v2 = v0[2];
  swift_retain();
  uint64_t v3 = sub_1000CB51C(v2, v1);
  swift_release();
  swift_bridgeObjectRelease();
  if (qword_1001161B0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000E2030();
  sub_10000AD90(v4, (uint64_t)qword_100118E60);
  swift_bridgeObjectRetain();
  id v5 = sub_1000E2010();
  os_log_type_t v6 = sub_1000E2700();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v7 = 134217984;
    v0[3] = v3[2];
    sub_1000E2880();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[ContinuityCalls] Sending updated calls of count %ld", v7, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v8 = (uint64_t *)v0[5];
  *(void *)(swift_task_alloc() + 16) = v3;
  sub_1000CAD74(&qword_1001190F8, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoContinuityCallsDidChangeEvent);
  sub_1000E1210();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (qword_100116188 != -1) {
    swift_once();
  }
  v0[11] = qword_10011BF78;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[12] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_1000BEEB4;
  uint64_t v12 = v0[8];
  return sub_1000AFF20(13, v12, v10, v9, 0);
}

uint64_t sub_1000BEEB4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v4 = sub_1000BF058;
  }
  else {
    uint64_t v4 = sub_1000BEFE0;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000BEFE0()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000BF058()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[4];
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_10006CA20, v4, 0);
}

uint64_t sub_1000BF0EC(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v25 = a3;
  int v26 = a4;
  uint64_t v6 = sub_1000E21D0();
  uint64_t v29 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E2200();
  uint64_t v27 = *(void *)(v10 - 8);
  uint64_t v28 = v10;
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004D9C((uint64_t *)&unk_100119048);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  __chkstk_darwin(v14, v17);
  uint64_t v18 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [*(id *)(a2 + 192) queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v14);
  unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 26) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a2;
  *(unsigned char *)(v21 + 24) = v25;
  *(unsigned char *)(v21 + 25) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v21 + v20, v18, v14);
  aBlock[4] = sub_1000CC524;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10005489C;
  aBlock[3] = &unk_10010D790;
  id v22 = _Block_copy(aBlock);
  swift_retain();
  sub_1000E21F0();
  uint64_t v30 = _swiftEmptyArrayStorage;
  sub_1000CAD74((unint64_t *)&qword_100117080, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004D9C(&qword_100116BF0);
  sub_1000CC5AC();
  sub_1000E28C0();
  sub_1000E2770();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
  return swift_release();
}

uint64_t sub_1000BF484(uint64_t a1, char a2, int a3, uint64_t a4)
{
  LODWORD(v27) = a3;
  id v30 = *(id *)(a1 + 192);
  id v6 = [v30 currentAudioAndVideoCalls];
  sub_100006C20(0, &qword_100119058);
  unint64_t v7 = sub_1000E2520();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000E2B70();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    unint64_t v4 = (unint64_t)_swiftEmptyArrayStorage;
    if ((v27 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v8) {
    goto LABEL_20;
  }
LABEL_3:
  if (v8 < 1) {
    goto LABEL_41;
  }
  uint64_t v25 = a4;
  for (uint64_t i = 0; i != v8; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v10 = (id)sub_1000E2A80();
    }
    else {
      id v10 = *(id *)(v7 + 8 * i + 32);
    }
    uint64_t v11 = v10;
    if (objc_msgSend(v10, "isScreening", v25))
    {
LABEL_5:

      continue;
    }
    id v12 = [v11 provider];
    unsigned __int8 v13 = [v12 isTelephonyProvider];

    if (v13)
    {
      if ((a2 & 1) == 0) {
        goto LABEL_5;
      }
    }
    else if ([v11 status] != 4 && objc_msgSend(v11, "status") != 1)
    {
      goto LABEL_5;
    }
    sub_1000E2AB0();
    sub_1000E2AE0();
    sub_1000E2AF0();
    sub_1000E2AC0();
  }
  swift_bridgeObjectRelease();
  unint64_t v4 = (unint64_t)_swiftEmptyArrayStorage;
  if (v27)
  {
LABEL_21:
    uint64_t v27 = (uint64_t)sub_10001B2D4();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0
      || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
    {
      goto LABEL_42;
    }
    uint64_t v14 = _swiftEmptyArrayStorage[2];
    swift_retain();
    if (!v14)
    {
LABEL_43:
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      sub_100004D9C((uint64_t *)&unk_100119048);
      return sub_1000E25A0();
    }
LABEL_24:
    unint64_t v15 = 0;
    unint64_t v29 = v4 & 0xC000000000000001;
    int v26 = (void *)v4;
    while (1)
    {
      if (v29)
      {
        id v16 = (id)sub_1000E2A80();
      }
      else
      {
        if (v15 >= *(void *)(v4 + 16))
        {
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          swift_retain();
          uint64_t v14 = sub_1000E2B70();
          if (!v14) {
            goto LABEL_43;
          }
          goto LABEL_24;
        }
        id v16 = *(id *)(v4 + 8 * v15 + 32);
      }
      uint64_t v17 = v16;
      unint64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_40;
      }
      id v19 = [v30 activeConversationForCall:v16];
      if (v19)
      {
        unint64_t v20 = v19;
        id v21 = [v19 remoteMembers];
        sub_100006C20(0, (unint64_t *)&unk_100119060);
        sub_10001494C((unint64_t *)&unk_100118290, (unint64_t *)&unk_100119060);
        uint64_t v22 = sub_1000E2660();

        id v23 = sub_1000A7E20(v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        LOBYTE(v22) = sub_1000CBC48((unint64_t)v23, v27);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        if (v22)
        {
          sub_1000E2AB0();
          sub_1000E2AE0();
          sub_1000E2AF0();
          sub_1000E2AC0();
        }
        else
        {
        }
        unint64_t v4 = (unint64_t)v26;
      }
      else
      {
      }
      ++v15;
      if (v18 == v14) {
        goto LABEL_43;
      }
    }
  }
LABEL_37:
  sub_100004D9C((uint64_t *)&unk_100119048);
  return sub_1000E25A0();
}

uint64_t sub_1000BF8E8(uint64_t a1, void *a2, void *a3)
{
  id v42 = a3;
  uint64_t v4 = sub_100004D9C(&qword_100118640);
  __chkstk_darwin(v4 - 8, v5);
  id v48 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1000E1280();
  __chkstk_darwin(v44, v7);
  uint64_t v43 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000E1140();
  uint64_t v46 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  uint64_t v11 = __chkstk_darwin(v9, v10);
  char v41 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v13);
  unint64_t v15 = (char *)&v40 - v14;
  uint64_t v16 = sub_1000E14E0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  unint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = [a2 callUUID];
  sub_1000E23F0();

  sub_1000E1450();
  unsigned int v22 = [a2 status];
  if (v22 > 6) {
    id v23 = (unsigned int *)&enum case for NCProtoContinuityCall.Status.unknown(_:);
  }
  else {
    id v23 = (unsigned int *)*(&off_10010DFA0 + (int)v22);
  }
  uint64_t v24 = v42;
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v20, *v23, v16);
  sub_1000E1500();
  [a2 isUplinkMuted];
  sub_1000E1510();
  [a2 isSendingVideo];
  sub_1000E1480();
  if (v24)
  {
    id v25 = v24;
    id v26 = [v25 displayName];
    sub_1000E23F0();

    sub_1000E1470();
    id v27 = [v25 UUID];
    sub_1000E1110();

    sub_1000E10E0();
    uint64_t v29 = v46;
    uint64_t v28 = v47;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v47);
    sub_1000E14B0();

    uint64_t v32 = (uint64_t)v48;
  }
  else
  {
    id v33 = [a2 displayName];
    sub_1000E23F0();

    uint64_t v30 = sub_1000E1470();
    uint64_t v32 = (uint64_t)v48;
    uint64_t v29 = v46;
    uint64_t v28 = v47;
  }
  __chkstk_darwin(v30, v31);
  *(&v40 - 2) = (uint64_t)a2;
  sub_1000CAD74(&qword_100119040, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoCallInfo);
  uint64_t v34 = v45;
  sub_1000E1210();
  id v48 = v34;
  sub_1000E14C0();
  id v35 = [a2 callGroupUUID];
  if (v35)
  {
    unint64_t v36 = v35;
    sub_1000E1110();

    id v37 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
    v37(v32, v15, v28);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v32, 0, 1, v28);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v32, 1, v28) != 1)
    {
      id v38 = v41;
      v37((uint64_t)v41, (char *)v32, v28);
      sub_1000E10E0();
      sub_1000E1490();
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v38, v28);
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v32, 1, 1, v28);
  }
  return sub_100015EAC(v32, &qword_100118640);
}

uint64_t sub_1000BFE5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  uint64_t v7 = sub_1000E1EF0();
  v5[5] = v7;
  v5[6] = *(void *)(v7 - 8);
  v5[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000BFF24, a4, 0);
}

uint64_t sub_1000BFF24()
{
  uint64_t v1 = (uint64_t *)v0[4];
  sub_1000CAD74(&qword_100119200, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoActiveConversationsDidChangeEvent);
  sub_1000E1210();
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  if (qword_100116188 != -1) {
    swift_once();
  }
  v0[8] = qword_10011BF78;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  void *v4 = v0;
  v4[1] = sub_1000C0090;
  uint64_t v5 = v0[7];
  return sub_1000AFA6C(12, v5, v2, v3, 0);
}

uint64_t sub_1000C0090()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_1000C02A8;
  }
  else {
    uint64_t v3 = sub_1000C01B8;
  }
  return _swift_task_switch(v3, v2, 0);
}

uint64_t sub_1000C01B8()
{
  uint64_t v1 = v0[3];
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  return _swift_task_switch(sub_1000C0234, v1, 0);
}

uint64_t sub_1000C0234()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 80) != 0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C02A8()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[3];
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_1000CE348, v4, 0);
}

Swift::Int sub_1000C033C()
{
  uint64_t v1 = 0;
  uint64_t v2 = sub_1000E17D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  unint64_t v53 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [*(id *)(v0 + 208) activeConversations];
  sub_100006C20(0, (unint64_t *)&unk_100118EE0);
  sub_10001494C((unint64_t *)&qword_100117540, (unint64_t *)&unk_100118EE0);
  uint64_t v7 = sub_1000E2660();

  if ((v7 & 0xC000000000000001) == 0)
  {
    uint64_t v25 = sub_1000CA7DC(v7, v8);
    id v26 = v53;
    unint64_t v27 = v25 & 0xC000000000000001;
    if ((v25 & 0xC000000000000001) != 0) {
      goto LABEL_28;
    }
LABEL_24:
    uint64_t v28 = *(void *)(v25 + 16);
    if (v28) {
      goto LABEL_29;
    }
LABEL_25:
    swift_release();
    return (Swift::Int)&_swiftEmptyArrayStorage;
  }
  uint64_t v9 = (uint64_t)&_swiftEmptySetSingleton;
  id v56 = &_swiftEmptySetSingleton;
  sub_1000E2900();
  uint64_t v10 = sub_1000E2990();
  if (v10)
  {
    uint64_t v55 = v2;
    do
    {
      id v60 = (void *)v10;
      swift_dynamicCast();
      id v17 = v57;
      if ([v57 state]
        && [v17 state] != (id)1
        && (([v17 isContinuitySession] & 1) != 0 || !objc_msgSend(v17, "avMode")))
      {
      }
      else
      {
        id v18 = v57;
        uint64_t v19 = v56;
        unint64_t v20 = v56[2];
        if (v56[3] <= v20)
        {
          sub_1000C3A40(v20 + 1, &qword_100118F00);
          uint64_t v19 = v56;
        }
        Swift::Int result = sub_1000E2820(v19[5]);
        uint64_t v12 = v19 + 7;
        uint64_t v13 = -1 << *((unsigned char *)v19 + 32);
        unint64_t v14 = result & ~v13;
        unint64_t v15 = v14 >> 6;
        if (((-1 << v14) & ~v19[(v14 >> 6) + 7]) != 0)
        {
          unint64_t v16 = __clz(__rbit64((-1 << v14) & ~v19[(v14 >> 6) + 7])) | v14 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v21 = 0;
          unint64_t v22 = (unint64_t)(63 - v13) >> 6;
          do
          {
            if (++v15 == v22 && (v21 & 1) != 0)
            {
              __break(1u);
              __break(1u);
              goto LABEL_45;
            }
            BOOL v23 = v15 == v22;
            if (v15 == v22) {
              unint64_t v15 = 0;
            }
            v21 |= v23;
            uint64_t v24 = v12[v15];
          }
          while (v24 == -1);
          unint64_t v16 = __clz(__rbit64(~v24)) + (v15 << 6);
        }
        *(void *)((char *)v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        *(void *)(v19[6] + 8 * v16) = v18;
        ++v19[2];
      }
      uint64_t v10 = sub_1000E2990();
    }
    while (v10);
    uint64_t v2 = v55;
    uint64_t v9 = (uint64_t)v56;
  }
  swift_release();
  id v26 = v53;
  uint64_t v25 = v9;
  unint64_t v27 = v9 & 0xC000000000000001;
  if ((v9 & 0xC000000000000001) == 0) {
    goto LABEL_24;
  }
LABEL_28:
  uint64_t v28 = sub_1000E2950();
  if (!v28) {
    goto LABEL_25;
  }
LABEL_29:
  id v60 = &_swiftEmptyArrayStorage;
  sub_1000DB354(0, v28 & ~(v28 >> 63), 0);
  if (v27)
  {
    Swift::Int result = sub_1000E28F0();
    unsigned __int8 v30 = 1;
  }
  else
  {
    Swift::Int result = sub_1000DBE6C(v25);
    unsigned __int8 v30 = v31 & 1;
  }
  id v57 = (id)result;
  uint64_t v58 = v29;
  unsigned __int8 v59 = v30;
  if (v28 < 0)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
  }
  else
  {
    uint64_t v55 = v3 + 32;
    unint64_t v52 = v27;
    do
    {
      while (1)
      {
        sub_1000DBE44((uint64_t)v57, v58, v59, v25);
        id v45 = v44;
        *(&v51 - 2) = __chkstk_darwin(v44, v46);
        sub_1000CAD74((unint64_t *)&unk_100118EF0, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoActiveConversation);
        sub_1000E1210();

        uint64_t v47 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000DB354(0, v47[2] + 1, 1);
          uint64_t v47 = v60;
        }
        unint64_t v49 = v47[2];
        unint64_t v48 = v47[3];
        if (v49 >= v48 >> 1)
        {
          sub_1000DB354(v48 > 1, v49 + 1, 1);
          uint64_t v47 = v60;
        }
        v47[2] = v49 + 1;
        Swift::Int result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))((unint64_t)v47+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v49, v26, v2);
        id v60 = v47;
        if (v27) {
          break;
        }
        uint64_t v32 = (uint64_t)v57;
        uint64_t v33 = v58;
        unsigned __int8 v34 = v59;
        uint64_t v35 = v25;
        unint64_t v36 = (void *)sub_1000DBA74(v57, v58, v59, v25);
        uint64_t v54 = v1;
        uint64_t v37 = v3;
        uint64_t v38 = v2;
        uint64_t v40 = v39;
        char v42 = v41;
        char v43 = v34;
        unint64_t v27 = v52;
        sub_10001A820(v32, v33, v43);
        id v57 = v36;
        uint64_t v58 = v40;
        uint64_t v25 = v35;
        uint64_t v2 = v38;
        uint64_t v3 = v37;
        id v26 = v53;
        uint64_t v1 = v54;
        unsigned __int8 v59 = v42 & 1;
        if (!--v28) {
          goto LABEL_44;
        }
      }
      if ((v59 & 1) == 0) {
        goto LABEL_46;
      }
      if (sub_1000E2910()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_100004D9C((uint64_t *)&unk_1001199F0);
      uint64_t v50 = (void (*)(void **, void))sub_1000E2690();
      sub_1000E29C0();
      v50(&v56, 0);
      --v28;
    }
    while (v28);
LABEL_44:
    sub_10001A820((uint64_t)v57, v58, v59);
    swift_release();
    return (Swift::Int)v60;
  }
  return result;
}

uint64_t sub_1000C0948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000C09E0, a4, 0);
}

uint64_t sub_1000C09E0()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[16];
  if (v2)
  {
    uint64_t v3 = v0[3];
    uint64_t v4 = v1[21];
    unint64_t v15 = (void *)v1[22];
    uint64_t v6 = v1[19];
    uint64_t v5 = v1[20];
    uint64_t v7 = v1[17];
    uint64_t v16 = v1[18];
    uint64_t v17 = v3;
    uint64_t v8 = v1[15];
    uint64_t v9 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v11 = sub_1000CAD74(&qword_100119010, v10, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v1;
    *(void *)(v12 + 40) = v8;
    *(void *)(v12 + 48) = v2;
    *(void *)(v12 + 56) = v7;
    *(unsigned char *)(v12 + 64) = v16 & 1;
    *(void *)(v12 + 72) = v6;
    *(void *)(v12 + 80) = v5;
    *(void *)(v12 + 88) = v4;
    *(void *)(v12 + 96) = v15;
    swift_retain_n();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_retain();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    sub_1000A84D4(v17, (uint64_t)&unk_1001192A8, v12, (uint64_t)&unk_10010DB88, &qword_1001191D0);
    swift_release();
    sub_10009E690(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1000C0C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000C0CF8, a4, 0);
}

uint64_t sub_1000C0CF8()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[16];
  if (v2)
  {
    uint64_t v3 = v0[3];
    uint64_t v4 = v1[21];
    unint64_t v15 = (void *)v1[22];
    uint64_t v6 = v1[19];
    uint64_t v5 = v1[20];
    uint64_t v7 = v1[17];
    uint64_t v16 = v1[18];
    uint64_t v17 = v3;
    uint64_t v8 = v1[15];
    uint64_t v9 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v11 = sub_1000CAD74(&qword_100119010, v10, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v1;
    *(void *)(v12 + 40) = v8;
    *(void *)(v12 + 48) = v2;
    *(void *)(v12 + 56) = v7;
    *(unsigned char *)(v12 + 64) = v16 & 1;
    *(void *)(v12 + 72) = v6;
    *(void *)(v12 + 80) = v5;
    *(void *)(v12 + 88) = v4;
    *(void *)(v12 + 96) = v15;
    swift_retain_n();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_retain();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    sub_1000A84D4(v17, (uint64_t)&unk_100119288, v12, (uint64_t)&unk_10010DB88, &qword_1001191D0);
    swift_release();
    sub_10009E690(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1000C0F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000C1010, a4, 0);
}

uint64_t sub_1000C1010()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[16];
  if (v2)
  {
    uint64_t v3 = v0[3];
    uint64_t v4 = v1[21];
    unint64_t v15 = (void *)v1[22];
    uint64_t v6 = v1[19];
    uint64_t v5 = v1[20];
    uint64_t v7 = v1[17];
    uint64_t v16 = v1[18];
    uint64_t v17 = v3;
    uint64_t v8 = v1[15];
    uint64_t v9 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v11 = sub_1000CAD74(&qword_100119010, v10, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v1;
    *(void *)(v12 + 40) = v8;
    *(void *)(v12 + 48) = v2;
    *(void *)(v12 + 56) = v7;
    *(unsigned char *)(v12 + 64) = v16 & 1;
    *(void *)(v12 + 72) = v6;
    *(void *)(v12 + 80) = v5;
    *(void *)(v12 + 88) = v4;
    *(void *)(v12 + 96) = v15;
    swift_retain_n();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_retain();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    sub_1000A84D4(v17, (uint64_t)&unk_100119268, v12, (uint64_t)&unk_10010DB88, &qword_1001191D0);
    swift_release();
    sub_10009E690(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1000C1290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000C1328, a4, 0);
}

uint64_t sub_1000C1328()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[16];
  if (v2)
  {
    uint64_t v3 = v0[3];
    uint64_t v4 = v1[21];
    unint64_t v15 = (void *)v1[22];
    uint64_t v6 = v1[19];
    uint64_t v5 = v1[20];
    uint64_t v7 = v1[17];
    uint64_t v16 = v1[18];
    uint64_t v17 = v3;
    uint64_t v8 = v1[15];
    uint64_t v9 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v11 = sub_1000CAD74(&qword_100119010, v10, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v1;
    *(void *)(v12 + 40) = v8;
    *(void *)(v12 + 48) = v2;
    *(void *)(v12 + 56) = v7;
    *(unsigned char *)(v12 + 64) = v16 & 1;
    *(void *)(v12 + 72) = v6;
    *(void *)(v12 + 80) = v5;
    *(void *)(v12 + 88) = v4;
    *(void *)(v12 + 96) = v15;
    swift_retain_n();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_retain();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    sub_1000A84D4(v17, (uint64_t)&unk_100119248, v12, (uint64_t)&unk_10010DB88, &qword_1001191D0);
    swift_release();
    sub_10009E690(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1000C15A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000C1640, a4, 0);
}

uint64_t sub_1000C1640()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[16];
  if (v2)
  {
    uint64_t v3 = v0[3];
    uint64_t v4 = v1[21];
    unint64_t v15 = (void *)v1[22];
    uint64_t v6 = v1[19];
    uint64_t v5 = v1[20];
    uint64_t v7 = v1[17];
    uint64_t v16 = v1[18];
    uint64_t v17 = v3;
    uint64_t v8 = v1[15];
    uint64_t v9 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v11 = sub_1000CAD74(&qword_100119010, v10, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v1;
    *(void *)(v12 + 40) = v8;
    *(void *)(v12 + 48) = v2;
    *(void *)(v12 + 56) = v7;
    *(unsigned char *)(v12 + 64) = v16 & 1;
    *(void *)(v12 + 72) = v6;
    *(void *)(v12 + 80) = v5;
    *(void *)(v12 + 88) = v4;
    *(void *)(v12 + 96) = v15;
    swift_retain_n();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_retain();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    sub_1000A84D4(v17, (uint64_t)&unk_100119228, v12, (uint64_t)&unk_10010DB88, &qword_1001191D0);
    swift_release();
    sub_10009E690(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1000C18C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000C1958, a4, 0);
}

uint64_t sub_1000C1958()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[16];
  if (v2)
  {
    uint64_t v3 = v0[3];
    uint64_t v4 = v1[21];
    unint64_t v15 = (void *)v1[22];
    uint64_t v6 = v1[19];
    uint64_t v5 = v1[20];
    uint64_t v7 = v1[17];
    uint64_t v16 = v1[18];
    uint64_t v17 = v3;
    uint64_t v8 = v1[15];
    uint64_t v9 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v11 = sub_1000CAD74(&qword_100119010, v10, (void (*)(uint64_t))type metadata accessor for ContinuitySessionServer);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v1;
    *(void *)(v12 + 40) = v8;
    *(void *)(v12 + 48) = v2;
    *(void *)(v12 + 56) = v7;
    *(unsigned char *)(v12 + 64) = v16 & 1;
    *(void *)(v12 + 72) = v6;
    *(void *)(v12 + 80) = v5;
    *(void *)(v12 + 88) = v4;
    *(void *)(v12 + 96) = v15;
    swift_retain_n();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_retain();
    sub_10009E618(v8, v2, v7, v16, v6, v5, v4, v15);
    sub_1000A84D4(v17, (uint64_t)&unk_1001191F8, v12, (uint64_t)&unk_10010DB88, &qword_1001191D0);
    swift_release();
    sub_10009E690(v8, v2, v7, v16, v6, v5, v4, v15);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

void sub_1000C1BD8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v12 = a3;
  id v11 = a4;
  swift_retain();
  sub_1000CD448(a5, a6, a7);
  swift_release();
}

uint64_t sub_1000C1C7C()
{
  swift_release();
  sub_10009E690(*(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 144), *(void *)(v0 + 152), *(void *)(v0 + 160), *(void *)(v0 + 168), *(void **)(v0 + 176));
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1000C1D28()
{
  sub_1000C1C7C();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for ContinuitySessionServer()
{
  return self;
}

void destroy for ContinuitySessionServer.Session(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t initializeWithCopy for ContinuitySessionServer.Session(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void **)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ContinuitySessionServer.Session(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 56);
  uint64_t v5 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for ContinuitySessionServer.Session(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ContinuitySessionServer.Session(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);

  return a1;
}

uint64_t getEnumTagSinglePayload for ContinuitySessionServer.Session(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContinuitySessionServer.Session(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContinuitySessionServer.Session()
{
  return &type metadata for ContinuitySessionServer.Session;
}

uint64_t sub_1000C2040(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000CE360;
  return v6(a1);
}

uint64_t sub_1000C211C(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000C21F8;
  return v6(a1);
}

uint64_t sub_1000C21F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000C22F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_1000E2B00();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_1000C23F4, 0, 0);
}

uint64_t sub_1000C23F4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_1000E2B20();
  uint64_t v5 = sub_1000CAD74(&qword_100118FC0, 255, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_1000E2CF0();
  sub_1000CAD74((unint64_t *)&unk_100118FC8, 255, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_1000E2B30();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000C259C;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_1000C259C()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_1000C2758, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_1000C2758()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_1000C27C4()
{
  uint64_t v1 = v0;
  sub_100004D9C((uint64_t *)&unk_100119348);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000E2A10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    __n128 result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    unsigned __int8 v21 = *(unsigned char *)(v17 + 16);
    *(void *)uint64_t v20 = *(void *)v17;
    *(void *)(v20 + 8) = v19;
    *(unsigned char *)(v20 + 16) = v21;
    __n128 result = (void *)sub_10000E8C0(v18, v19, v21);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000C2984()
{
  return sub_1000C2B5C(&qword_100119408);
}

id sub_1000C2990()
{
  return sub_1000C2B5C(&qword_100119340);
}

void *sub_1000C299C()
{
  uint64_t v1 = v0;
  sub_100004D9C(&qword_100118F50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000E2A10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    __n128 result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000C2B50()
{
  return sub_1000C2B5C(&qword_100119070);
}

id sub_1000C2B5C(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_100004D9C(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1000E2A10();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_1000C2D00()
{
  uint64_t v1 = *v0;
  sub_100004D9C((uint64_t *)&unk_100119348);
  uint64_t v2 = sub_1000E2A20();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_24:
    unint64_t result = swift_release();
    uint64_t *v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v20 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v21 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  unint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_7;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v21) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v21) {
        goto LABEL_23;
      }
      unint64_t v18 = *(void *)(v20 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v21) {
          goto LABEL_23;
        }
        unint64_t v18 = *(void *)(v20 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_7:
    uint64_t v12 = *(void *)(v1 + 48) + 24 * v11;
    uint64_t v13 = *(void *)v12;
    int64_t v14 = *(void **)(v12 + 8);
    char v15 = *(unsigned char *)(v12 + 16);
    sub_1000E2D50();
    sub_10000E8C0(v13, (uint64_t)v14, v15);
    sub_10000BB28(v13, v14, v15);
    sub_1000E2440();
    swift_bridgeObjectRelease();
    sub_1000E2D70();
    unint64_t result = sub_1000E28E0();
    *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = *(void *)(v3 + 48) + 24 * result;
    *(void *)uint64_t v16 = v13;
    *(void *)(v16 + 8) = v14;
    *(unsigned char *)(v16 + 16) = v15;
    ++*(void *)(v3 + 16);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v21)
  {
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v20 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v21) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v20 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1000C2F84()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004D9C(&qword_100118F50);
  uint64_t v3 = sub_1000E2A20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1000E2D50();
    swift_bridgeObjectRetain();
    sub_1000E2440();
    uint64_t result = sub_1000E2D70();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000C3234(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  sub_100004D9C(a2);
  uint64_t v5 = sub_1000E2A20();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  unsigned __int8 v30 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    Swift::Int v21 = *(void *)(v6 + 40);
    id v22 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_1000E2820(v21);
    uint64_t v23 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v30;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1000C34AC()
{
  uint64_t v1 = *v0;
  sub_100004D9C((uint64_t *)&unk_100119348);
  uint64_t v2 = sub_1000E2A20();
  uint64_t v3 = v2;
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
    Swift::Int v21 = (void *)(v1 + 56);
    if (v4 < 64) {
      uint64_t v5 = ~(-1 << v4);
    }
    else {
      uint64_t v5 = -1;
    }
    unint64_t v6 = v5 & *(void *)(v1 + 56);
    int64_t v22 = (unint64_t)(v4 + 63) >> 6;
    uint64_t v7 = v2 + 56;
    unint64_t result = swift_retain();
    int64_t v9 = 0;
    while (1)
    {
      if (v6)
      {
        unint64_t v10 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v17 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v17 >= v22) {
          goto LABEL_23;
        }
        unint64_t v18 = v21[v17];
        ++v9;
        if (!v18)
        {
          int64_t v9 = v17 + 1;
          if (v17 + 1 >= v22) {
            goto LABEL_23;
          }
          unint64_t v18 = v21[v9];
          if (!v18)
          {
            int64_t v9 = v17 + 2;
            if (v17 + 2 >= v22) {
              goto LABEL_23;
            }
            unint64_t v18 = v21[v9];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v22)
              {
LABEL_23:
                swift_release();
                uint64_t v20 = 1 << *(unsigned char *)(v1 + 32);
                if (v20 > 63) {
                  bzero(v21, ((unint64_t)(v20 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *Swift::Int v21 = -1 << v20;
                }
                *(void *)(v1 + 16) = 0;
                break;
              }
              unint64_t v18 = v21[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v9 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_29;
                  }
                  if (v9 >= v22) {
                    goto LABEL_23;
                  }
                  unint64_t v18 = v21[v9];
                  ++v19;
                  if (v18) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v9 = v19;
            }
          }
        }
LABEL_22:
        unint64_t v6 = (v18 - 1) & v18;
        unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
      }
      uint64_t v12 = *(void *)(v1 + 48) + 24 * v11;
      uint64_t v13 = *(void *)v12;
      int64_t v14 = *(void **)(v12 + 8);
      char v15 = *(unsigned char *)(v12 + 16);
      sub_1000E2D50();
      sub_10000BB28(v13, v14, v15);
      sub_1000E2440();
      swift_bridgeObjectRelease();
      sub_1000E2D70();
      unint64_t result = sub_1000E28E0();
      *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      uint64_t v16 = *(void *)(v3 + 48) + 24 * result;
      *(void *)uint64_t v16 = v13;
      *(void *)(v16 + 8) = v14;
      *(unsigned char *)(v16 + 16) = v15;
      ++*(void *)(v3 + 16);
    }
  }
  unint64_t result = swift_release();
  uint64_t *v0 = v3;
  return result;
}

uint64_t sub_1000C3760()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004D9C(&qword_100118F50);
  uint64_t v3 = sub_1000E2A20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unsigned __int8 v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unsigned __int8 v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1000E2D50();
      sub_1000E2440();
      uint64_t result = sub_1000E2D70();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1000C3A40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  sub_100004D9C(a2);
  uint64_t v5 = sub_1000E2A20();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    unsigned __int8 v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    int64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_1000E2820(*(void *)(v6 + 40));
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

Swift::Int sub_1000C3CDC(uint64_t a1, uint64_t a2)
{
  return sub_1000C3D14(a1, a2, &qword_100119408, &qword_100119400);
}

Swift::Int sub_1000C3CF8(uint64_t a1, uint64_t a2)
{
  return sub_1000C3D14(a1, a2, &qword_100119340, (unint64_t *)&unk_100117170);
}

Swift::Int sub_1000C3D14(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  if (a2)
  {
    sub_100004D9C(a3);
    uint64_t v6 = sub_1000E2A30();
    uint64_t v19 = v6;
    sub_1000E2900();
    if (sub_1000E2990())
    {
      sub_100006C20(0, a4);
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_1000C3A40(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        Swift::Int result = sub_1000E2820(*(void *)(v6 + 40));
        uint64_t v8 = v6 + 56;
        uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v10 = result & ~v9;
        unint64_t v11 = v10 >> 6;
        if (((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          unint64_t v12 = __clz(__rbit64((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v11 == v15;
            if (v11 == v15) {
              unint64_t v11 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          unint64_t v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(void *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(void *)(*(void *)(v6 + 48) + 8 * v12) = v18;
        ++*(void *)(v6 + 16);
      }
      while (sub_1000E2990());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v6;
}

Swift::Int sub_1000C3F18(uint64_t a1, uint64_t a2)
{
  return sub_1000C3D14(a1, a2, &qword_100119070, (unint64_t *)&unk_100117230);
}

unint64_t sub_1000C3F34(uint64_t a1, void *a2)
{
  sub_1000E2820(a2[5]);
  unint64_t result = sub_1000E28E0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t sub_1000C3FB8(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v9 = *v4;
  sub_1000E2D50();
  swift_bridgeObjectRetain();
  sub_10000BB28(a2, a3, a4);
  sub_1000E2440();
  swift_bridgeObjectRelease();
  Swift::Int v10 = sub_1000E2D70();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v13 = ~v11;
    uint64_t v14 = *(void *)(v9 + 48);
    do
    {
      unint64_t v15 = (uint64_t *)(v14 + 24 * v12);
      uint64_t v16 = *v15;
      uint64_t v17 = (void *)v15[1];
      int v18 = *((unsigned __int8 *)v15 + 16);
      if (v18)
      {
        if (v18 == 1)
        {
          if (a4 != 1) {
            goto LABEL_4;
          }
        }
        else if (a4 != 2)
        {
          goto LABEL_4;
        }
      }
      else if (a4)
      {
        goto LABEL_4;
      }
      BOOL v19 = v16 == a2 && v17 == a3;
      if (v19 || (sub_1000E2C80() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_10000E8E8(a2, (uint64_t)a3, a4);
        uint64_t v20 = *(void *)(*v4 + 48) + 24 * v12;
        uint64_t v21 = *(void *)v20;
        uint64_t v22 = *(void *)(v20 + 8);
        *(void *)a1 = *(void *)v20;
        *(void *)(a1 + 8) = v22;
        unsigned __int8 v23 = *(unsigned char *)(v20 + 16);
        *(unsigned char *)(a1 + 16) = v23;
        sub_10000E8C0(v21, v22, v23);
        return 0;
      }
LABEL_4:
      unint64_t v12 = (v12 + 1) & v13;
    }
    while (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v26 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  sub_10000E8C0(a2, (uint64_t)a3, a4);
  sub_1000C469C(a2, a3, a4, v12, isUniquelyReferenced_nonNull_native);
  uint64_t *v4 = v26;
  swift_bridgeObjectRelease();
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  uint64_t result = 1;
  *(unsigned char *)(a1 + 16) = a4;
  return result;
}

uint64_t sub_1000C41CC(void *a1, void *a2)
{
  return sub_1000C43D0(a1, a2, &qword_100119400, (uint64_t)NSXPCConnection_ptr, &qword_100119408);
}

uint64_t sub_1000C41E8(void *a1, void *a2)
{
  return sub_1000C43D0(a1, a2, (unint64_t *)&unk_100117170, (uint64_t)TUNearbyDeviceHandle_ptr, &qword_100119340);
}

uint64_t sub_1000C4204(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1000E2D50();
  swift_bridgeObjectRetain();
  sub_1000E2440();
  Swift::Int v8 = sub_1000E2D70();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1000E2C80() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      int v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1000E2C80() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000C4A14(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000C43B4(void *a1, void *a2)
{
  return sub_1000C43D0(a1, a2, &qword_100118330, (uint64_t)TUConversationParticipant_ptr, (uint64_t *)&unk_1001192F8);
}

uint64_t sub_1000C43D0(void *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  Swift::Int v8 = v5;
  uint64_t v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0) {
      uint64_t v12 = *v5;
    }
    else {
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v13 = a2;
    uint64_t v14 = sub_1000E2960();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_100006C20(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v37;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1000E2950();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v27 = sub_1000C3D14(v12, result + 1, a5, a3);
    uint64_t v38 = (void *)v27;
    unint64_t v28 = *(void *)(v27 + 16);
    if (*(void *)(v27 + 24) <= v28)
    {
      uint64_t v33 = v28 + 1;
      id v34 = v13;
      sub_1000C3A40(v33, a5);
      uint64_t v29 = v38;
    }
    else
    {
      uint64_t v29 = (void *)v27;
      id v30 = v13;
    }
    sub_1000C3F34((uint64_t)v13, v29);
    *Swift::Int v8 = (uint64_t)v29;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    Swift::Int v16 = *(void *)(v11 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v17 = sub_1000E2820(v16);
    uint64_t v18 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v19 = v17 & ~v18;
    if ((*(void *)(v11 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
    {
      sub_100006C20(0, a3);
      id v20 = *(id *)(*(void *)(v11 + 48) + 8 * v19);
      char v21 = sub_1000E2830();

      if (v21)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        char v25 = *(void **)(*(void *)(*v8 + 48) + 8 * v19);
        *a1 = v25;
        id v26 = v25;
        return 0;
      }
      uint64_t v22 = ~v18;
      while (1)
      {
        unint64_t v19 = (v19 + 1) & v22;
        if (((*(void *)(v11 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
          break;
        }
        id v23 = *(id *)(*(void *)(v11 + 48) + 8 * v19);
        char v24 = sub_1000E2830();

        if (v24) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *v8;
    *Swift::Int v8 = 0x8000000000000000;
    id v32 = a2;
    sub_1000C4880((uint64_t)v32, v19, isUniquelyReferenced_nonNull_native, a5, a3);
    *Swift::Int v8 = v39;
    swift_bridgeObjectRelease();
    *a1 = v32;
  }
  return 1;
}

Swift::Int sub_1000C469C(Swift::Int result, void *a2, char a3, unint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = result;
  unint64_t v11 = *(void *)(*v5 + 16);
  unint64_t v12 = *(void *)(*v5 + 24);
  if (v12 > v11 && (a5 & 1) != 0) {
    goto LABEL_23;
  }
  if (a5)
  {
    sub_1000C34AC();
  }
  else
  {
    if (v12 > v11)
    {
      uint64_t result = (Swift::Int)sub_1000C27C4();
      goto LABEL_23;
    }
    sub_1000C2D00();
  }
  uint64_t v13 = *v5;
  sub_1000E2D50();
  sub_10000BB28(v10, a2, a3);
  sub_1000E2440();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1000E2D70();
  uint64_t v14 = -1 << *(unsigned char *)(v13 + 32);
  a4 = result & ~v14;
  uint64_t v15 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
  {
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v13 + 48);
    do
    {
      uint64_t v18 = v17 + 24 * a4;
      uint64_t result = *(void *)v18;
      unint64_t v19 = *(void **)(v18 + 8);
      int v20 = *(unsigned __int8 *)(v18 + 16);
      if (v20)
      {
        if (v20 == 1)
        {
          if (a3 != 1) {
            goto LABEL_11;
          }
        }
        else if (a3 != 2)
        {
          goto LABEL_11;
        }
      }
      else if (a3)
      {
        goto LABEL_11;
      }
      BOOL v21 = result == v10 && v19 == a2;
      if (v21 || (uint64_t result = sub_1000E2C80(), (result & 1) != 0))
      {
        uint64_t result = sub_1000E2CD0();
        __break(1u);
        break;
      }
LABEL_11:
      a4 = (a4 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
  }
LABEL_23:
  uint64_t v22 = *v6;
  *(void *)(*v6 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v23 = *(void *)(v22 + 48) + 24 * a4;
  *(void *)uint64_t v23 = v10;
  *(void *)(v23 + 8) = a2;
  *(unsigned char *)(v23 + 16) = a3;
  uint64_t v24 = *(void *)(v22 + 16);
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25) {
    __break(1u);
  }
  else {
    *(void *)(v22 + 16) = v26;
  }
  return result;
}

void sub_1000C4880(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  unint64_t v9 = *(void *)(*v5 + 16);
  unint64_t v10 = *(void *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v11 = v9 + 1;
  if (a3)
  {
    sub_1000C3A40(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_1000C2B5C(a4);
      goto LABEL_14;
    }
    sub_1000C3234(v11, a4);
  }
  uint64_t v12 = *v5;
  Swift::Int v13 = sub_1000E2820(*(void *)(*v5 + 40));
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100006C20(0, a5);
    id v15 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
    char v16 = sub_1000E2830();

    if (v16)
    {
LABEL_13:
      sub_1000E2CD0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
        char v19 = sub_1000E2830();

        if (v19) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v20 + 48) + 8 * a2) = a1;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v23;
  }
}

Swift::Int sub_1000C4A14(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1000C3760();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_1000C299C();
      goto LABEL_22;
    }
    sub_1000C2F84();
  }
  uint64_t v11 = *v4;
  sub_1000E2D50();
  sub_1000E2440();
  uint64_t result = sub_1000E2D70();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    id v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1000E2C80(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1000E2CD0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        id v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1000E2C80();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_1000C4BB0(uint64_t a1)
{
  return sub_1000C4C98(a1, &qword_1001165C0);
}

uint64_t sub_1000C4BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000064DC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000C880C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1000C6DA0(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000C4C8C(uint64_t a1)
{
  return sub_1000C4C98(a1, &qword_1001164E0);
}

uint64_t sub_1000C4C98(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100006444(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v4;
  uint64_t v14 = *v4;
  uint64_t *v4 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000C89C4(a2);
    uint64_t v9 = v14;
  }
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t v11 = sub_1000E1140();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
  uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1000C6F78(v6, v9);
  uint64_t *v4 = v9;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1000C4DA0(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100006444(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000C8C58();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_1000E1140();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_1000C6F78(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000C4E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100006444(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000C90D8();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_1000E1140();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_100004D9C(&qword_100116580);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_100006C5C(v12 + *(void *)(v20 + 72) * v6, a2);
    sub_1000C7274(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_100004D9C(&qword_100116580);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_1000C5058(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v50 = sub_1000E11C0();
  uint64_t v5 = *(void *)(v50 - 8);
  __chkstk_darwin(v50, v6);
  unint64_t v49 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100004D9C(&qword_1001165B0);
  int v48 = a2;
  uint64_t v9 = sub_1000E2B90();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  id v45 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  char v43 = v2;
  int64_t v44 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v46 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v47 = v5;
  uint64_t v15 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v16 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v21 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v44) {
      break;
    }
    uint64_t v24 = v45;
    unint64_t v25 = v45[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v44) {
        goto LABEL_34;
      }
      unint64_t v25 = v45[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v44)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v43;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v45[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v44) {
              goto LABEL_34;
            }
            unint64_t v25 = v45[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v8 + 56);
    uint64_t v28 = v8;
    uint64_t v29 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v22);
    uint64_t v30 = *v29;
    uint64_t v31 = v29[1];
    uint64_t v32 = *(void *)(v47 + 72);
    uint64_t v33 = v27 + v32 * v22;
    if (v48)
    {
      (*v15)(v49, v33, v50);
    }
    else
    {
      (*v46)(v49, v33, v50);
      swift_bridgeObjectRetain();
    }
    sub_1000E2D50();
    sub_1000E2440();
    uint64_t result = sub_1000E2D70();
    uint64_t v34 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v16 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v35) & ~*(void *)(v16 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v16 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v19 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = (void *)(*(void *)(v10 + 48) + 16 * v19);
    *uint64_t v20 = v30;
    v20[1] = v31;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v15)(*(void *)(v10 + 56) + v32 * v19, v49, v50);
    ++*(void *)(v10 + 16);
    uint64_t v8 = v28;
  }
  swift_release();
  uint64_t v3 = v43;
  uint64_t v24 = v45;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v8 + 32);
  if (v41 >= 64) {
    bzero(v24, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v41;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_1000C5440(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004D9C(&qword_100119358);
  char v38 = a2;
  uint64_t v6 = sub_1000E2B90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = *(void **)(*(void *)(v5 + 48) + 8 * v21);
    uint64_t v31 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v21);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    if ((v38 & 1) == 0)
    {
      id v34 = v30;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_1000E2820(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v30;
    unint64_t v19 = (void *)(*(void *)(v7 + 56) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  int64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000C5728(uint64_t a1, char a2)
{
  return sub_1000C5740(a1, a2, &qword_1001164A8);
}

uint64_t sub_1000C5734(uint64_t a1, char a2)
{
  return sub_1000C5740(a1, a2, &qword_1001193C0);
}

uint64_t sub_1000C5740(uint64_t a1, char a2, uint64_t *a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_100004D9C(a3);
  char v39 = a2;
  uint64_t v7 = sub_1000E2B90();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  unint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          unint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_1000E2D50();
    sub_1000E2440();
    uint64_t result = sub_1000E2D70();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v4 = v36;
  int64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_1000C5A4C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004D9C(&qword_1001164E8);
  char v36 = a2;
  uint64_t v6 = sub_1000E2B90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1000E2D50();
    sub_1000E2440();
    uint64_t result = sub_1000E2D70();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000C5D64(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_1000E1140();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v3;
  sub_100004D9C(a3);
  int v49 = a2;
  uint64_t v13 = sub_1000E2B90();
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  if (!*(void *)(v14 + 16)) {
    goto LABEL_41;
  }
  uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v17 = *(void *)(v14 + 64);
  id v45 = (void *)(v14 + 64);
  if (v16 < 64) {
    uint64_t v18 = ~(-1 << v16);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v17;
  char v43 = v5;
  int64_t v44 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v8;
  unint64_t v20 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v21 = v13 + 64;
  uint64_t result = swift_retain();
  int64_t v23 = 0;
  for (i = v14; ; uint64_t v14 = i)
  {
    if (v19)
    {
      unint64_t v25 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v26 = v25 | (v23 << 6);
      goto LABEL_22;
    }
    int64_t v27 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v27 >= v44) {
      break;
    }
    uint64_t v28 = v45;
    unint64_t v29 = v45[v27];
    ++v23;
    if (!v29)
    {
      int64_t v23 = v27 + 1;
      if (v27 + 1 >= v44) {
        goto LABEL_34;
      }
      unint64_t v29 = v45[v23];
      if (!v29)
      {
        int64_t v30 = v27 + 2;
        if (v30 >= v44)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v43;
          if ((v49 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v29 = v45[v30];
        if (!v29)
        {
          while (1)
          {
            int64_t v23 = v30 + 1;
            if (__OFADD__(v30, 1)) {
              goto LABEL_43;
            }
            if (v23 >= v44) {
              goto LABEL_34;
            }
            unint64_t v29 = v45[v23];
            ++v30;
            if (v29) {
              goto LABEL_21;
            }
          }
        }
        int64_t v23 = v30;
      }
    }
LABEL_21:
    unint64_t v19 = (v29 - 1) & v29;
    unint64_t v26 = __clz(__rbit64(v29)) + (v23 << 6);
LABEL_22:
    uint64_t v31 = *(void *)(v48 + 72);
    unint64_t v32 = *(void *)(v14 + 48) + v31 * v26;
    if (v49)
    {
      (*v20)(v11, v32, v7);
      uint64_t v33 = *(void *)(*(void *)(v14 + 56) + 8 * v26);
    }
    else
    {
      (*v46)(v11, v32, v7);
      uint64_t v33 = *(void *)(*(void *)(v14 + 56) + 8 * v26);
      swift_retain();
    }
    sub_1000CAD74((unint64_t *)&unk_1001164B0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_1000E2390();
    uint64_t v34 = -1 << *(unsigned char *)(v15 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v21 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v35) & ~*(void *)(v21 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v21 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v24 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v21 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v20)(*(void *)(v15 + 48) + v31 * v24, v11, v7);
    *(void *)(*(void *)(v15 + 56) + 8 * v24) = v33;
    ++*(void *)(v15 + 16);
  }
  swift_release();
  uint64_t v5 = v43;
  uint64_t v28 = v45;
  if ((v49 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v14 + 32);
  if (v41 >= 64) {
    bzero(v28, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v28 = -1 << v41;
  }
  *(void *)(v14 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v15;
  return result;
}

uint64_t sub_1000C6190(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1000E1140();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_100004D9C(&qword_1001164D0);
  int v47 = a2;
  uint64_t v11 = sub_1000E2B90();
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v15 = *(void *)(v12 + 64);
  char v43 = (void *)(v12 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v41 = v3;
  int64_t v42 = (unint64_t)(v14 + 63) >> 6;
  int64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v46 = v6;
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v19 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v12; ; uint64_t v12 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v42) {
      break;
    }
    unint64_t v26 = v43;
    unint64_t v27 = v43[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v27 = v43[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v42)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v43[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v42) {
              goto LABEL_34;
            }
            unint64_t v27 = v43[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v46 + 72);
    unint64_t v30 = *(void *)(v12 + 48) + v29 * v24;
    if (v47)
    {
      (*v18)(v9, v30, v5);
      uint64_t v31 = *(void *)(*(void *)(v12 + 56) + 8 * v24);
    }
    else
    {
      (*v44)(v9, v30, v5);
      uint64_t v31 = *(void *)(*(void *)(v12 + 56) + 8 * v24);
      swift_retain();
    }
    sub_1000CAD74((unint64_t *)&unk_1001164B0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_1000E2390();
    uint64_t v32 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1 << v33) & ~*(void *)(v19 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v33) & ~*(void *)(v19 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v19 + 8 * v34);
      }
      while (v38 == -1);
      unint64_t v22 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v18)(*(void *)(v13 + 48) + v29 * v22, v9, v5);
    *(void *)(*(void *)(v13 + 56) + 8 * v22) = v31;
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v41;
  unint64_t v26 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v39 = 1 << *(unsigned char *)(v12 + 32);
  if (v39 >= 64) {
    bzero(v26, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v26 = -1 << v39;
  }
  *(void *)(v12 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_1000C65B8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004D9C((uint64_t *)&unk_100118450);
  uint64_t v6 = sub_1000E2B90();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100006598(v24, v35);
      }
      else
      {
        sub_100051230((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1000E2D50();
      sub_1000E2440();
      uint64_t result = sub_1000E2D70();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100006598(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000C68B8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100004D9C(&qword_100116580);
  uint64_t v51 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v56 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E1140();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  unint64_t v53 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v2;
  sub_100004D9C(&qword_100116578);
  int v52 = a2;
  uint64_t v13 = v12;
  uint64_t v14 = sub_1000E2B90();
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v16 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v17 = *(void *)(v13 + 64);
  uint64_t v48 = (void *)(v13 + 64);
  if (v16 < 64) {
    uint64_t v18 = ~(-1 << v16);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v17;
  uint64_t v46 = v2;
  int64_t v47 = (unint64_t)(v16 + 63) >> 6;
  int v49 = (void (**)(char *, unint64_t, uint64_t))(v9 + 16);
  uint64_t v54 = (void (**)(char *, unint64_t, uint64_t))(v9 + 32);
  uint64_t v55 = v8;
  uint64_t v20 = v14 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  uint64_t v50 = v13;
  uint64_t v23 = v53;
  while (1)
  {
    if (v19)
    {
      unint64_t v25 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v26 = v25 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v27 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v27 >= v47) {
      break;
    }
    char v28 = v48;
    unint64_t v29 = v48[v27];
    ++v22;
    if (!v29)
    {
      int64_t v22 = v27 + 1;
      if (v27 + 1 >= v47) {
        goto LABEL_34;
      }
      unint64_t v29 = v48[v22];
      if (!v29)
      {
        int64_t v30 = v27 + 2;
        if (v30 >= v47)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v46;
          if ((v52 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v29 = v48[v30];
        if (!v29)
        {
          while (1)
          {
            int64_t v22 = v30 + 1;
            if (__OFADD__(v30, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v47) {
              goto LABEL_34;
            }
            unint64_t v29 = v48[v22];
            ++v30;
            if (v29) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v30;
      }
    }
LABEL_21:
    unint64_t v19 = (v29 - 1) & v29;
    unint64_t v26 = __clz(__rbit64(v29)) + (v22 << 6);
    uint64_t v23 = v53;
LABEL_22:
    uint64_t v31 = v9;
    uint64_t v32 = *(void *)(v9 + 72);
    unint64_t v33 = *(void *)(v13 + 48) + v32 * v26;
    if (v52)
    {
      (*v54)(v23, v33, v55);
      uint64_t v34 = *(void *)(v13 + 56);
      uint64_t v35 = *(void *)(v51 + 72);
      sub_100006C5C(v34 + v35 * v26, v56);
    }
    else
    {
      (*v49)(v23, v33, v55);
      uint64_t v36 = *(void *)(v13 + 56);
      uint64_t v35 = *(void *)(v51 + 72);
      sub_1000CDC8C(v36 + v35 * v26, v56);
    }
    sub_1000CAD74((unint64_t *)&unk_1001164B0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_1000E2390();
    uint64_t v37 = -1 << *(unsigned char *)(v15 + 32);
    unint64_t v38 = result & ~v37;
    unint64_t v39 = v38 >> 6;
    if (((-1 << v38) & ~*(void *)(v20 + 8 * (v38 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v38) & ~*(void *)(v20 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v23 = v53;
    }
    else
    {
      char v40 = 0;
      unint64_t v41 = (unint64_t)(63 - v37) >> 6;
      uint64_t v23 = v53;
      do
      {
        if (++v39 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v42 = v39 == v41;
        if (v39 == v41) {
          unint64_t v39 = 0;
        }
        v40 |= v42;
        uint64_t v43 = *(void *)(v20 + 8 * v39);
      }
      while (v43 == -1);
      unint64_t v24 = __clz(__rbit64(~v43)) + (v39 << 6);
    }
    *(void *)(v20 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    (*v54)((char *)(*(void *)(v15 + 48) + v32 * v24), (unint64_t)v23, v55);
    uint64_t result = sub_100006C5C(v56, *(void *)(v15 + 56) + v35 * v24);
    ++*(void *)(v15 + 16);
    uint64_t v13 = v50;
    uint64_t v9 = v31;
  }
  swift_release();
  uint64_t v3 = v46;
  char v28 = v48;
  if ((v52 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v44 = 1 << *(unsigned char *)(v13 + 32);
  if (v44 >= 64) {
    bzero(v28, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v28 = -1 << v44;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v15;
  return result;
}

unint64_t sub_1000C6DA0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1000E28D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1000E2D50();
        swift_bridgeObjectRetain();
        sub_1000E2440();
        Swift::Int v9 = sub_1000E2D70();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1000C6F78(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E1140();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4, v6);
  Swift::Int v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    uint64_t v35 = a2 + 64;
    unint64_t result = sub_1000E28D0();
    uint64_t v13 = v35;
    if ((*(void *)(v35 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v32 = (result + 1) & v12;
      unint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v34 = v5 + 16;
      uint64_t v14 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v15 = *(void *)(v5 + 72);
      do
      {
        uint64_t v16 = v15;
        int64_t v17 = v15 * v11;
        v33(v9, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_1000CAD74((unint64_t *)&unk_1001164B0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v18 = sub_1000E2390();
        unint64_t result = (*v14)(v9, v4);
        unint64_t v19 = v18 & v12;
        if (a1 >= (uint64_t)v32)
        {
          if (v19 >= v32 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            uint64_t v22 = *(void *)(a2 + 48);
            uint64_t v15 = v16;
            unint64_t result = v22 + v16 * a1;
            if (v16 * a1 < v17 || result >= v22 + v17 + v16)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v16 * a1 != v17)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            unint64_t v24 = (void *)(v23 + 8 * a1);
            unint64_t v25 = (void *)(v23 + 8 * v11);
            uint64_t v13 = v35;
            if (a1 != v11 || (a1 = v11, v24 >= v25 + 1))
            {
              *unint64_t v24 = *v25;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v32 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        uint64_t v13 = v35;
        uint64_t v15 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v13 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    unint64_t v26 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v26 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  *unint64_t v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1000C7274(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E1140();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4, v6);
  Swift::Int v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2 + 64;
  uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v12 = (a1 + 1) & ~v11;
  if (((1 << v12) & *(void *)(a2 + 64 + 8 * (v12 >> 6))) != 0)
  {
    uint64_t v13 = ~v11;
    unint64_t result = sub_1000E28D0();
    if ((*(void *)(v10 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
    {
      unint64_t v40 = (result + 1) & v13;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v14 = v5 + 16;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v41 = v14;
      unint64_t v38 = (uint64_t (**)(char *, uint64_t))(v14 - 8);
      unint64_t v39 = v15;
      uint64_t v37 = v13;
      do
      {
        uint64_t v17 = v10;
        uint64_t v18 = v16;
        int64_t v19 = v16 * v12;
        v39(v9, *(void *)(a2 + 48) + v16 * v12, v4);
        sub_1000CAD74((unint64_t *)&unk_1001164B0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v20 = sub_1000E2390();
        unint64_t result = (*v38)(v9, v4);
        unint64_t v21 = v20 & v13;
        if (a1 >= (uint64_t)v40)
        {
          if (v21 >= v40 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            if (v18 * a1 < v19
              || *(void *)(a2 + 48) + v18 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v19 + v18))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v18 * a1 != v19)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v24 = *(void *)(a2 + 56);
            uint64_t v25 = *(void *)(*(void *)(sub_100004D9C(&qword_100116580) - 8) + 72);
            int64_t v26 = v25 * a1;
            unint64_t result = v24 + v25 * a1;
            int64_t v27 = v25 * v12;
            unint64_t v28 = v24 + v25 * v12 + v25;
            BOOL v29 = v26 < v27 || result >= v28;
            uint64_t v10 = v17;
            if (v29)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v12;
              uint64_t v13 = v37;
            }
            else
            {
              a1 = v12;
              uint64_t v13 = v37;
              if (v26 != v27)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v12;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v40 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v10 = v17;
LABEL_5:
        unint64_t v12 = (v12 + 1) & v13;
        uint64_t v16 = v18;
      }
      while (((*(void *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
    }
    BOOL v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *BOOL v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1000C75C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000064DC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1000C81CC();
      goto LABEL_7;
    }
    sub_1000C5058(v15, a4 & 1);
    unint64_t v26 = sub_1000064DC(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1000E2CE0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_1000E11C0();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_1000C7F18(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

void sub_1000C7744(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_1000C7750(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1000064DC(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_1000C8654(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000C5740(v17, a4 & 1, a5);
  unint64_t v22 = sub_1000064DC(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_1000E2CE0();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;

  swift_bridgeObjectRetain();
}

uint64_t sub_1000C78D8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1000C7A60(a1, a2, a3, &qword_1001165C0);
}

uint64_t sub_1000C78E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000064DC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000C880C();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000C5A4C(v15, a4 & 1);
  unint64_t v21 = sub_1000064DC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1000E2CE0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  *char v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000C7A54(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1000C7A60(a1, a2, a3, &qword_1001164E0);
}

uint64_t sub_1000C7A60(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  uint64_t v6 = (void **)v4;
  uint64_t v28 = a1;
  uint64_t v9 = sub_1000E1140();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v14 = (void *)*v4;
  unint64_t v16 = sub_100006444(a2);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= v19 && (a3 & 1) != 0)
  {
LABEL_7:
    char v22 = *v6;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_release();
      *(void *)(v23 + 8 * v16) = v28;
      return result;
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a3 & 1) == 0)
  {
    sub_1000C89C4(a4);
    goto LABEL_7;
  }
  sub_1000C5D64(v19, a3 & 1, a4);
  unint64_t v25 = sub_100006444(a2);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_14:
    uint64_t result = sub_1000E2CE0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  char v22 = *v6;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  return sub_1000C7FC8(v16, (uint64_t)v13, v28, v22);
}

uint64_t sub_1000C7C1C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_1000E1140();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v3;
  unint64_t v15 = sub_100006444(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v21 = *v4;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7];
      uint64_t result = swift_release();
      *(void *)(v22 + 8 * v15) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_1000C8C58();
    goto LABEL_7;
  }
  sub_1000C6190(v18, a3 & 1);
  unint64_t v24 = sub_100006444(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = sub_1000E2CE0();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  uint64_t v21 = *v4;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
  return sub_1000C7FC8(v15, (uint64_t)v12, a1, v21);
}

_OWORD *sub_1000C7DC4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000064DC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1000C8EF0();
      goto LABEL_7;
    }
    sub_1000C65B8(v15, a4 & 1);
    unint64_t v21 = sub_1000064DC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1000E2CE0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000EC60((uint64_t)v19);
    return sub_100006598(a1, v19);
  }
LABEL_13:
  sub_1000C8080(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_1000C7F18(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1000E11C0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_1000C7FC8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1000E1140();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

_OWORD *sub_1000C8080(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100006598(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_1000C80EC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1000E1140();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_100004D9C(&qword_100116580);
  uint64_t result = sub_100006C5C(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_1000C81CC()
{
  uint64_t v36 = sub_1000E11C0();
  uint64_t v1 = *(void *)(v36 - 8);
  __chkstk_darwin(v36, v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D9C(&qword_1001165B0);
  uint64_t v31 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1000E2B80();
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v37 = v6;
  if (!v7)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v29 = v37;
    uint64_t v28 = v31;
LABEL_25:
    *uint64_t v28 = v29;
    return result;
  }
  uint64_t v8 = v6;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    uint64_t v8 = v37;
  }
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v32 = v5 + 64;
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v34 = v1 + 32;
  uint64_t v35 = v1 + 16;
  uint64_t v15 = v36;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v33) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_23;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 16 * v17;
    char v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    unint64_t v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v4, *(void *)(v5 + 56) + v22, v15);
    uint64_t v23 = v37;
    unint64_t v24 = (void *)(*(void *)(v37 + 48) + v18);
    *unint64_t v24 = v20;
    v24[1] = v21;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v4, v15);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v31;
    uint64_t v29 = v37;
    goto LABEL_25;
  }
  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    int64_t v11 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1000C8490()
{
  uint64_t v1 = v0;
  sub_100004D9C(&qword_100119358);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000E2B80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    char v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    unint64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    void *v22 = v20;
    v22[1] = v21;
    id v23 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1000C8648()
{
  return sub_1000C8654(&qword_1001193C0);
}

id sub_1000C8654(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_100004D9C(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1000E2B80();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000C8800()
{
  return sub_1000C89C4(&qword_1001165C0);
}

void *sub_1000C880C()
{
  uint64_t v1 = v0;
  sub_100004D9C(&qword_1001164E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000E2B80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000C89C4(uint64_t *a1)
{
  uint64_t v3 = sub_1000E1140();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  unint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D9C(a1);
  int64_t v27 = v1;
  uint64_t v8 = *v1;
  uint64_t v9 = sub_1000E2B80();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *int64_t v27 = v10;
    return result;
  }
  id result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    id result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v28 = v8 + 64;
  int64_t v29 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v30 = v4 + 32;
  uint64_t v31 = v4 + 16;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v29) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v14);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v19 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_12:
    unint64_t v20 = *(void *)(v4 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v7, *(void *)(v8 + 48) + v20, v3);
    uint64_t v21 = 8 * v19;
    uint64_t v22 = *(void *)(*(void *)(v8 + 56) + 8 * v19);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v10 + 48) + v20, v7, v3);
    *(void *)(*(void *)(v10 + 56) + v21) = v22;
    id result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v29) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v14 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v14 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v14);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000C8C58()
{
  uint64_t v1 = sub_1000E1140();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D9C(&qword_1001164D0);
  unint64_t v24 = v0;
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1000E2B80();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *unint64_t v24 = v8;
    return result;
  }
  id result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  uint64_t v25 = v6 + 64;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v27 = v2 + 32;
  uint64_t v28 = v2 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v5, *(void *)(v6 + 48) + v17, v1);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v6 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v8 + 48) + v17, v5, v1);
    *(void *)(*(void *)(v8 + 56) + v18) = v19;
    id result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_23;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1000C8EF0()
{
  uint64_t v1 = v0;
  sub_100004D9C((uint64_t *)&unk_100118450);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000E2B80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100051230(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_100006598(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1000C90D8()
{
  uint64_t v1 = sub_100004D9C(&qword_100116580);
  uint64_t v31 = *(void *)(v1 - 8);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E1140();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  int64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D9C(&qword_100116578);
  int64_t v26 = v0;
  uint64_t v10 = *v0;
  uint64_t v11 = sub_1000E2B80();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v26 = v12;
    return result;
  }
  id result = (void *)(v11 + 64);
  unint64_t v14 = (unint64_t)((1 << *(unsigned char *)(v12 + 32)) + 63) >> 6;
  if (v12 != v10 || (unint64_t)result >= v10 + 64 + 8 * v14) {
    id result = memmove(result, (const void *)(v10 + 64), 8 * v14);
  }
  int64_t v15 = 0;
  *(void *)(v12 + 16) = *(void *)(v10 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v10 + 64);
  uint64_t v27 = v10 + 64;
  int64_t v28 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v29 = v6 + 32;
  uint64_t v30 = v6 + 16;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v23 >= v28) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v27 + 8 * v23);
    ++v15;
    if (!v24)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v28) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v27 + 8 * v15);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v18 = (v24 - 1) & v24;
    unint64_t v20 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_9:
    unint64_t v21 = *(void *)(v6 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, *(void *)(v10 + 48) + v21, v5);
    unint64_t v22 = *(void *)(v31 + 72) * v20;
    sub_1000CDC8C(*(void *)(v10 + 56) + v22, (uint64_t)v4);
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(void *)(v12 + 48) + v21, v9, v5);
    id result = (void *)sub_100006C5C((uint64_t)v4, *(void *)(v12 + 56) + v22);
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v28) {
    goto LABEL_23;
  }
  unint64_t v24 = *(void *)(v27 + 8 * v25);
  if (v24)
  {
    int64_t v15 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v15 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v15 >= v28) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v27 + 8 * v15);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000C93F4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v43 = sub_1000E1430();
  uint64_t v4 = *(void *)(v43 - 8);
  __chkstk_darwin(v43, v5);
  unint64_t v40 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004D9C(&qword_100118300);
  uint64_t result = sub_1000E2B80();
  uint64_t v9 = result;
  int64_t v10 = 0;
  uint64_t v44 = a1;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v12 = a1 + 64;
  uint64_t v11 = v13;
  uint64_t v14 = 1 << *(unsigned char *)(v12 - 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v11;
  uint64_t v36 = v12;
  int64_t v37 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v41 = result;
  uint64_t v42 = v4;
  uint64_t v38 = v4 + 32;
  uint64_t v39 = result + 64;
  uint64_t v17 = v40;
  if ((v15 & v11) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v47 = v2;
  unint64_t v18 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  int64_t v45 = v10;
  for (unint64_t i = v18 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v21 << 6))
  {
    uint64_t v24 = *(void *)(v44 + 56);
    int64_t v25 = (uint64_t *)(*(void *)(v44 + 48) + 16 * i);
    uint64_t v26 = v25[1];
    uint64_t v46 = *v25;
    uint64_t v27 = *(void **)(v24 + 8 * i);
    __chkstk_darwin(result, v8);
    *(&v35 - 2) = (uint64_t)v27;
    sub_1000CAD74((unint64_t *)&qword_100118F40, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoContactInfo);
    swift_bridgeObjectRetain();
    id v28 = v27;
    uint64_t v29 = v43;
    uint64_t v30 = v47;
    sub_1000E1210();
    uint64_t v2 = v30;

    *(void *)(v39 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v9 = v41;
    uint64_t v31 = v42;
    uint64_t v32 = (void *)(*(void *)(v41 + 48) + 16 * i);
    *uint64_t v32 = v46;
    v32[1] = v26;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32))(*(void *)(v9 + 56) + *(void *)(v31 + 72) * i, v17, v29);
    uint64_t v33 = *(void *)(v9 + 16);
    BOOL v20 = __OFADD__(v33, 1);
    uint64_t v34 = v33 + 1;
    if (v20)
    {
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    *(void *)(v9 + 16) = v34;
    int64_t v10 = v45;
    if (v16) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v20 = __OFADD__(v10, 1);
    int64_t v21 = v10 + 1;
    if (v20) {
      goto LABEL_25;
    }
    if (v21 >= v37) {
      return v9;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    if (!v22) {
      break;
    }
LABEL_15:
    uint64_t v47 = v2;
    unint64_t v16 = (v22 - 1) & v22;
    int64_t v45 = v21;
  }
  int64_t v23 = v21 + 1;
  if (v21 + 1 >= v37) {
    return v9;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22) {
    goto LABEL_14;
  }
  int64_t v23 = v21 + 2;
  if (v21 + 2 >= v37) {
    return v9;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22) {
    goto LABEL_14;
  }
  int64_t v23 = v21 + 3;
  if (v21 + 3 >= v37) {
    return v9;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22)
  {
LABEL_14:
    int64_t v21 = v23;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v21 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v21 >= v37) {
      return v9;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    ++v23;
    if (v22) {
      goto LABEL_15;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1000C975C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100018598(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

uint64_t sub_1000C98B0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_100018A80(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

uint64_t sub_1000C9A08(uint64_t result)
{
  int64_t v4 = v2;
  uint64_t v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_1000E2950();
    uint64_t v6 = result;
  }
  else
  {
    uint64_t v6 = *(void *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1000E2B70();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = v18 + v6;
    if (!__OFADD__(v18, v6)) {
      goto LABEL_6;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v6;
  if (__OFADD__(v7, v6)) {
    goto LABEL_21;
  }
LABEL_6:
  unint64_t v9 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v4 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1000E2B70();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1000E2A90();
    swift_bridgeObjectRelease();
    uint64_t *v4 = v12;
    uint64_t v11 = v12 & 0xFFFFFFFFFFFFFF8;
  }
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v14 = (*(void *)(v11 + 24) >> 1) - v13;
  uint64_t result = (uint64_t)sub_1000193B0(&v42, (void *)(v11 + 8 * v13 + 32), v14, v5);
  if (result < v6) {
    goto LABEL_22;
  }
  if (result >= 1)
  {
    uint64_t v15 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v16 = __OFADD__(v15, result);
    uint64_t v17 = v15 + result;
    if (v16)
    {
      __break(1u);
LABEL_29:
      if (!sub_1000E2990()) {
        goto LABEL_18;
      }
      sub_100006C20(0, (unint64_t *)&unk_100117230);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      unint64_t v22 = v41;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v22) {
          goto LABEL_18;
        }
        while (1)
        {
          uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(void *)(v24 + 0x18) >> 1)
          {
            sub_1000E2550();
            uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          uint64_t v25 = *(void *)(v24 + 24) >> 1;
          if (v3 < v25) {
            break;
          }
LABEL_33:
          *(void *)(v24 + 16) = v3;
        }
        uint64_t v26 = v24 + 32;
        while (1)
        {
          *(void *)(v26 + 8 * v3++) = v22;
          int64_t v27 = v45;
          if (v42 < 0)
          {
            if (!sub_1000E2990()) {
              goto LABEL_70;
            }
            sub_100006C20(0, (unint64_t *)&unk_100117230);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            unint64_t v22 = v41;
            swift_unknownObjectRelease();
            goto LABEL_45;
          }
          if (!v46) {
            break;
          }
          unint64_t v28 = (v46 - 1) & v46;
          unint64_t v29 = __clz(__rbit64(v46)) | (v45 << 6);
LABEL_41:
          unint64_t v22 = *(void **)(*(void *)(v42 + 48) + 8 * v29);
          id v30 = v22;
LABEL_42:
          int64_t v45 = v27;
          unint64_t v46 = v28;
LABEL_45:
          if (!v22)
          {
LABEL_70:
            *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_18;
          }
          if (v3 >= v25)
          {
            uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_33;
          }
        }
        int64_t v31 = v45 + 1;
        if (__OFADD__(v45, 1))
        {
          __break(1u);
LABEL_94:
          unint64_t v22 = 0;
          unint64_t v20 = 0;
          int64_t v19 = v1;
LABEL_27:
          int64_t v45 = v19;
          unint64_t v46 = v20;
          continue;
        }
        break;
      }
      int64_t v32 = (unint64_t)(v44 + 64) >> 6;
      if (v31 >= v32)
      {
        unint64_t v22 = 0;
        unint64_t v28 = 0;
        goto LABEL_42;
      }
      unint64_t v33 = *(void *)(v43 + 8 * v31);
      if (!v33)
      {
        int64_t v34 = v45 + 2;
        if (v45 + 2 >= v32) {
          goto LABEL_67;
        }
        unint64_t v33 = *(void *)(v43 + 8 * v34);
        if (!v33)
        {
          int64_t v1 = v45 + 3;
          if (v45 + 3 >= v32) {
            goto LABEL_68;
          }
          unint64_t v33 = *(void *)(v43 + 8 * v1);
          if (v33)
          {
            int64_t v31 = v45 + 3;
            goto LABEL_51;
          }
          int64_t v34 = v45 + 4;
          if (v45 + 4 >= v32)
          {
            unint64_t v22 = 0;
            unint64_t v28 = 0;
            int64_t v27 = v45 + 3;
            goto LABEL_42;
          }
          unint64_t v33 = *(void *)(v43 + 8 * v34);
          if (!v33)
          {
            int64_t v31 = v45 + 5;
            if (v45 + 5 >= v32)
            {
LABEL_68:
              unint64_t v22 = 0;
              unint64_t v28 = 0;
              int64_t v27 = v34;
              goto LABEL_42;
            }
            unint64_t v33 = *(void *)(v43 + 8 * v31);
            if (!v33)
            {
              int64_t v31 = v32 - 1;
              uint64_t v35 = v45 + 6;
              while (v32 != v35)
              {
                unint64_t v33 = *(void *)(v43 + 8 * v35++);
                if (v33)
                {
                  int64_t v31 = v35 - 1;
                  goto LABEL_51;
                }
              }
LABEL_67:
              unint64_t v22 = 0;
              unint64_t v28 = 0;
              int64_t v27 = v31;
              goto LABEL_42;
            }
            goto LABEL_51;
          }
        }
        int64_t v31 = v34;
      }
LABEL_51:
      unint64_t v28 = (v33 - 1) & v33;
      unint64_t v29 = __clz(__rbit64(v33)) + (v31 << 6);
      int64_t v27 = v31;
      goto LABEL_41;
    }
    *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v17;
  }
  if (result != v14)
  {
LABEL_18:
    sub_10001499C();
    return sub_1000E2540();
  }
LABEL_23:
  uint64_t v3 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int64_t v19 = v45;
  if (v42 < 0) {
    goto LABEL_29;
  }
  if (v46)
  {
    unint64_t v20 = (v46 - 1) & v46;
    unint64_t v21 = __clz(__rbit64(v46)) | (v45 << 6);
LABEL_26:
    unint64_t v22 = *(void **)(*(void *)(v42 + 48) + 8 * v21);
    id v23 = v22;
    goto LABEL_27;
  }
  int64_t v36 = v45 + 1;
  if (!__OFADD__(v45, 1))
  {
    int64_t v37 = (unint64_t)(v44 + 64) >> 6;
    if (v36 >= v37)
    {
      unint64_t v22 = 0;
      unint64_t v20 = 0;
      goto LABEL_27;
    }
    unint64_t v38 = *(void *)(v43 + 8 * v36);
    if (v38) {
      goto LABEL_75;
    }
    int64_t v39 = v45 + 2;
    if (v45 + 2 >= v37)
    {
LABEL_91:
      unint64_t v22 = 0;
      unint64_t v20 = 0;
      int64_t v19 = v36;
      goto LABEL_27;
    }
    unint64_t v38 = *(void *)(v43 + 8 * v39);
    if (v38) {
      goto LABEL_79;
    }
    int64_t v1 = v45 + 3;
    if (v45 + 3 < v37)
    {
      unint64_t v38 = *(void *)(v43 + 8 * v1);
      if (v38)
      {
        int64_t v36 = v45 + 3;
        goto LABEL_75;
      }
      int64_t v39 = v45 + 4;
      if (v45 + 4 >= v37) {
        goto LABEL_94;
      }
      unint64_t v38 = *(void *)(v43 + 8 * v39);
      if (v38)
      {
LABEL_79:
        int64_t v36 = v39;
LABEL_75:
        unint64_t v20 = (v38 - 1) & v38;
        unint64_t v21 = __clz(__rbit64(v38)) + (v36 << 6);
        int64_t v19 = v36;
        goto LABEL_26;
      }
      int64_t v36 = v45 + 5;
      if (v45 + 5 < v37)
      {
        unint64_t v38 = *(void *)(v43 + 8 * v36);
        if (!v38)
        {
          int64_t v36 = v37 - 1;
          uint64_t v40 = v45 + 6;
          do
          {
            if (v37 == v40) {
              goto LABEL_91;
            }
            unint64_t v38 = *(void *)(v43 + 8 * v40++);
          }
          while (!v38);
          int64_t v36 = v40 - 1;
        }
        goto LABEL_75;
      }
    }
    unint64_t v22 = 0;
    unint64_t v20 = 0;
    int64_t v19 = v39;
    goto LABEL_27;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000CA008(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    swift_release();
    return (unint64_t)&_swiftEmptySetSingleton;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_100004D9C((uint64_t *)&unk_100119348);
  unint64_t result = sub_1000E2A40();
  unint64_t v6 = result;
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  unint64_t v26 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v11 << 6);
    }
    else
    {
      uint64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_30;
      }
      if (v14 >= v25)
      {
LABEL_27:
        swift_release();
        return v6;
      }
      unint64_t v15 = v24[v14];
      ++v11;
      if (!v15)
      {
        uint64_t v11 = v14 + 1;
        if (v14 + 1 >= v25) {
          goto LABEL_27;
        }
        unint64_t v15 = v24[v11];
        if (!v15)
        {
          uint64_t v11 = v14 + 2;
          if (v14 + 2 >= v25) {
            goto LABEL_27;
          }
          unint64_t v15 = v24[v11];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v25) {
              goto LABEL_27;
            }
            unint64_t v15 = v24[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_31;
                }
                if (v11 >= v25) {
                  goto LABEL_27;
                }
                unint64_t v15 = v24[v11];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    }
    uint64_t v17 = v4;
    uint64_t v18 = *(void *)(v4 + 48) + 24 * v13;
    uint64_t v19 = *(void *)v18;
    unint64_t v20 = *(void **)(v18 + 8);
    char v21 = *(unsigned char *)(v18 + 16);
    sub_1000E2D50();
    sub_10000E8C0(v19, (uint64_t)v20, v21);
    sub_10000BB28(v19, v20, v21);
    sub_1000E2440();
    swift_bridgeObjectRelease();
    sub_1000E2D70();
    unint64_t result = sub_1000E28E0();
    *(void *)(v26 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v22 = *(void *)(v6 + 48) + 24 * result;
    *(void *)uint64_t v22 = v19;
    *(void *)(v22 + 8) = v20;
    *(unsigned char *)(v22 + 16) = v21;
    ++*(void *)(v6 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t v4 = v17;
    if (!v5) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1000CA268(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000CA274(a1, a2, a3, a4, &qword_100119070);
}

uint64_t sub_1000CA274(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a4;
  if (!a3)
  {
    unint64_t v10 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v10;
  }
  uint64_t v6 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v5;
  }
  sub_100004D9C(a5);
  uint64_t result = sub_1000E2A40();
  unint64_t v10 = (void *)result;
  id v30 = a1;
  if (a2 < 1) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = *a1;
  }
  uint64_t v12 = 0;
  uint64_t v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    uint64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_39;
    }
    if (v16 >= a2) {
      goto LABEL_36;
    }
    unint64_t v17 = v30[v16];
    ++v12;
    if (!v17)
    {
      uint64_t v12 = v16 + 1;
      if (v16 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v17 = v30[v12];
      if (!v17)
      {
        uint64_t v12 = v16 + 2;
        if (v16 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v17 = v30[v12];
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = v10[5];
    id v20 = *(id *)(*(void *)(v5 + 48) + 8 * v15);
    uint64_t result = sub_1000E2820(v19);
    uint64_t v21 = -1 << *((unsigned char *)v10 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v13 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v13 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(void *)(v10[6] + 8 * v24) = v20;
    ++v10[2];
    if (__OFSUB__(v6--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v6) {
      goto LABEL_36;
    }
  }
  uint64_t v18 = v16 + 3;
  if (v18 >= a2) {
    goto LABEL_36;
  }
  unint64_t v17 = v30[v18];
  if (v17)
  {
    uint64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= a2) {
      goto LABEL_36;
    }
    unint64_t v17 = v30[v12];
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000CA4D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000CAE88();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_1000064DC(v7, v8);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      unint64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1000C8654(&qword_100116490);
      unint64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    char v25 = (uint64_t *)(v22[6] + 16 * v15);
    *char v25 = v10;
    v25[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v28;
LABEL_13:
    sub_1000CAE88();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = v31;
      do
      {
        uint64_t v40 = (void *)*a5;
        unint64_t v42 = sub_1000064DC(v32, v33);
        uint64_t v43 = v40[2];
        BOOL v44 = (v41 & 1) == 0;
        uint64_t v45 = v43 + v44;
        if (__OFADD__(v43, v44)) {
          goto LABEL_25;
        }
        char v46 = v41;
        if (v40[3] < v45)
        {
          sub_1000C5740(v45, 1, &qword_100116490);
          unint64_t v47 = sub_1000064DC(v32, v33);
          if ((v46 & 1) != (v48 & 1)) {
            goto LABEL_27;
          }
          unint64_t v42 = v47;
        }
        int v49 = (void *)*a5;
        if (v46)
        {
          swift_bridgeObjectRelease();
          uint64_t v35 = v49[7];
          uint64_t v36 = 8 * v42;

          *(void *)(v35 + v36) = v34;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          uint64_t v50 = (uint64_t *)(v49[6] + 16 * v42);
          *uint64_t v50 = v32;
          v50[1] = v33;
          *(void *)(v49[7] + 8 * v42) = v34;
          uint64_t v51 = v49[2];
          BOOL v27 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v27) {
            goto LABEL_26;
          }
          v49[2] = v52;
        }
        sub_1000CAE88();
        uint64_t v32 = v37;
        uint64_t v33 = v38;
        uint64_t v34 = v39;
      }
      while (v38);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_10001499C();
    return swift_release();
  }
  sub_1000C5740(v18, a4 & 1, &qword_100116490);
  unint64_t v20 = sub_1000064DC(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    unint64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v23 = v22[7];
    uint64_t v24 = 8 * v15;

    *(void *)(v23 + v24) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_1000E2CE0();
  __break(1u);
  return result;
}

uint64_t sub_1000CA7DC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, a2);
    bzero((char *)&v12 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    sub_1000CA940((unint64_t *)((char *)&v12 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3);
    uint64_t v8 = v7;
    swift_release();
    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v6);
    sub_1000CA940((unint64_t *)v9, v5, v3);
    uint64_t v8 = v10;
    swift_release();
    swift_slowDealloc();
  }
  return v8;
}

void sub_1000CA940(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_21;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v9) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        goto LABEL_30;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          goto LABEL_30;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_21:
    id v15 = *(id *)(*(void *)(a3 + 48) + 8 * v11);
    if (![v15 state] || objc_msgSend(v15, "state") == (id)1)
    {

LABEL_27:
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v20++, 1))
      {
        __break(1u);
LABEL_30:
        swift_retain();
        sub_1000CA274(a1, a2, v20, a3, &qword_100118F00);
        return;
      }
    }
    else if ([v15 isContinuitySession])
    {
    }
    else
    {
      id v16 = [v15 avMode];

      if (v16) {
        goto LABEL_27;
      }
    }
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v9) {
    goto LABEL_30;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_32:
  __break(1u);
}

uint64_t sub_1000CAB48(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000CAC28;
  return v5(v2 + 16);
}

uint64_t sub_1000CAC28()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  void *v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_1000CAD58(uint64_t a1)
{
  return sub_1000CF44C(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000CAD74(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_1000CADBC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000CAE20(uint64_t a1)
{
  return sub_1000D9874(a1, *(void **)(v1 + 16));
}

id sub_1000CAE3C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  id v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();

  return v4;
}

void sub_1000CAE88()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    unint64_t v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    int64_t v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    int64_t v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      id v15 = v0[1];
      id v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        id v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          unint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          id v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            unint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            id v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            unint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              id v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                id v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  unint64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_1000CB01C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *int64_t v3 = v2;
  v3[1] = sub_1000CB0FC;
  return v5(v2 + 32);
}

uint64_t sub_1000CB0FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  int64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_1000CB210(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v7 = a1;
  uint64_t v8 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(a1 + 64);
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  uint64_t v32 = result;
  uint64_t v31 = v8;
  while (v11)
  {
    unint64_t v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v15 = v14 | (v13 << 6);
LABEL_22:
    uint64_t v19 = *(void *)(*(void *)(v7 + 56) + 8 * v15);
    uint64_t result = swift_beginAccess();
    uint64_t v20 = *(void *)(v19 + 64);
    if (*(void *)(v20 + 16))
    {
      int64_t v34 = v13;
      sub_1000E2D50();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_10000BB28(a2, a3, a4);
      sub_1000E2440();
      swift_bridgeObjectRelease();
      Swift::Int v21 = sub_1000E2D70();
      uint64_t v22 = -1 << *(unsigned char *)(v20 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v20 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        uint64_t v24 = ~v22;
        uint64_t v25 = *(void *)(v20 + 48);
        while (1)
        {
          uint64_t v26 = (uint64_t *)(v25 + 24 * v23);
          uint64_t v27 = *v26;
          uint64_t v28 = (void *)v26[1];
          int v29 = *((unsigned __int8 *)v26 + 16);
          if (v29)
          {
            if (v29 == 1)
            {
              if (a4 != 1) {
                goto LABEL_26;
              }
            }
            else if (a4 != 2)
            {
              goto LABEL_26;
            }
          }
          else if (a4)
          {
            goto LABEL_26;
          }
          BOOL v30 = v27 == a2 && v28 == a3;
          if (v30 || (sub_1000E2C80() & 1) != 0)
          {
            swift_release();
            swift_bridgeObjectRelease();
            return v19;
          }
LABEL_26:
          unint64_t v23 = (v23 + 1) & v24;
          if (((*(void *)(v20 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          {
            swift_release();
            uint64_t v7 = v32;
            uint64_t v8 = v31;
            goto LABEL_40;
          }
        }
      }
      swift_release();
LABEL_40:
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v13 = v34;
    }
  }
  int64_t v16 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
LABEL_45:
    __break(1u);
    return result;
  }
  if (v16 >= v33) {
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v16);
  ++v13;
  if (v17) {
    goto LABEL_21;
  }
  int64_t v13 = v16 + 1;
  if (v16 + 1 >= v33) {
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v13);
  if (v17) {
    goto LABEL_21;
  }
  int64_t v13 = v16 + 2;
  if (v16 + 2 >= v33) {
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v13);
  if (v17) {
    goto LABEL_21;
  }
  int64_t v13 = v16 + 3;
  if (v16 + 3 >= v33) {
    goto LABEL_43;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v13);
  if (v17)
  {
LABEL_21:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
    goto LABEL_22;
  }
  int64_t v18 = v16 + 4;
  if (v18 < v33)
  {
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    int64_t v13 = v18;
    if (!v17)
    {
      while (1)
      {
        int64_t v13 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          goto LABEL_45;
        }
        if (v13 >= v33) {
          goto LABEL_43;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v13);
        ++v18;
        if (v17) {
          goto LABEL_21;
        }
      }
    }
    goto LABEL_21;
  }
LABEL_43:
  swift_release();
  return 0;
}

void *sub_1000CB51C(unint64_t a1, uint64_t a2)
{
  int64_t v3 = v2;
  uint64_t v6 = sub_100004D9C(&qword_100119028);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E1520();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10, v11);
  char v41 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v14);
  uint64_t v32 = (char *)&v31 - v15;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v16; uint64_t v16 = sub_1000E2B70())
  {
    uint64_t v43 = v3;
    unint64_t v40 = a1 & 0xC000000000000001;
    unint64_t v17 = *(void **)(a2 + 192);
    uint64_t v36 = (void (**)(char *, void, uint64_t, uint64_t))(v33 + 56);
    id v37 = v17;
    int64_t v34 = (void (**)(char *, char *, uint64_t))(v33 + 32);
    uint64_t v35 = (unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
    int64_t v3 = &_swiftEmptyArrayStorage;
    uint64_t v18 = 4;
    uint64_t v38 = v9;
    uint64_t v39 = v16;
    while (1)
    {
      id v19 = v40 ? (id)sub_1000E2A80() : *(id *)(a1 + 8 * v18);
      uint64_t v20 = v19;
      a2 = v18 - 3;
      if (__OFADD__(v18 - 4, 1)) {
        break;
      }
      unint64_t v42 = v3;
      unint64_t v21 = a1;
      id v22 = [v37 activeConversationForCall:v19];
      uint64_t v24 = __chkstk_darwin(v22, v23);
      *(&v31 - 2) = (uint64_t)v20;
      *(&v31 - 1) = v24;
      sub_1000CAD74((unint64_t *)&unk_100119030, 255, (void (*)(uint64_t))&type metadata accessor for NCProtoContinuityCall);
      uint64_t v9 = v38;
      uint64_t v25 = v43;
      sub_1000E1210();
      uint64_t v43 = v25;

      (*v36)(v9, 0, 1, v10);
      if ((*v35)(v9, 1, v10) == 1)
      {
        sub_100015EAC((uint64_t)v9, &qword_100119028);
        int64_t v3 = v42;
      }
      else
      {
        uint64_t v26 = *v34;
        uint64_t v27 = v32;
        (*v34)(v32, v9, v10);
        v26(v41, v27, v10);
        int64_t v3 = v42;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v3 = (void *)sub_100018A5C(0, v3[2] + 1, 1, (unint64_t)v3);
        }
        unint64_t v29 = v3[2];
        unint64_t v28 = v3[3];
        uint64_t v9 = (char *)(v29 + 1);
        if (v29 >= v28 >> 1) {
          int64_t v3 = (void *)sub_100018A5C(v28 > 1, v29 + 1, 1, (unint64_t)v3);
        }
        v3[2] = v9;
        v26((char *)v3+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v29, v41, v10);
        a1 = v21;
      }
      ++v18;
      if (a2 == v39)
      {
        swift_bridgeObjectRelease();
        return v3;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

void sub_1000CB944(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1000E2900();
    sub_100006C20(0, (unint64_t *)&unk_100117230);
    sub_10001494C(&qword_1001170C0, (unint64_t *)&unk_100117230);
    sub_1000E26A0();
    uint64_t v3 = v20;
    uint64_t v19 = v21;
    uint64_t v4 = v22;
    uint64_t v5 = v23;
    unint64_t v6 = v24;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v18 = (unint64_t)(v4 + 64) >> 6;
  while (1)
  {
    uint64_t v14 = v5;
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_1000E2990()) {
      goto LABEL_31;
    }
    sub_100006C20(0, (unint64_t *)&unk_100117230);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v25;
    swift_unknownObjectRelease();
    if (!v25) {
      goto LABEL_31;
    }
LABEL_10:
    unsigned int v13 = [v12 isEquivalentToHandle:a2];

    if (v13) {
      goto LABEL_31;
    }
  }
  if (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v5 << 6);
LABEL_9:
    id v12 = *(id *)(*(void *)(v3 + 48) + 8 * v11);
    if (!v12) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  int64_t v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v18) {
      goto LABEL_31;
    }
    unint64_t v16 = *(void *)(v19 + 8 * v15);
    ++v5;
    if (!v16)
    {
      uint64_t v5 = v14 + 2;
      if (v14 + 2 >= v18) {
        goto LABEL_31;
      }
      unint64_t v16 = *(void *)(v19 + 8 * v5);
      if (!v16)
      {
        uint64_t v5 = v14 + 3;
        if (v14 + 3 >= v18) {
          goto LABEL_31;
        }
        unint64_t v16 = *(void *)(v19 + 8 * v5);
        if (!v16)
        {
          uint64_t v5 = v14 + 4;
          if (v14 + 4 >= v18) {
            goto LABEL_31;
          }
          unint64_t v16 = *(void *)(v19 + 8 * v5);
          if (!v16)
          {
            uint64_t v5 = v14 + 5;
            if (v14 + 5 >= v18) {
              goto LABEL_31;
            }
            unint64_t v16 = *(void *)(v19 + 8 * v5);
            if (!v16)
            {
              uint64_t v17 = v14 + 6;
              while (v18 != v17)
              {
                unint64_t v16 = *(void *)(v19 + 8 * v17++);
                if (v16)
                {
                  uint64_t v5 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_10001499C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v5 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_1000CBC48(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000E2B70();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      while (1)
      {
        uint64_t v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v7 = (id)sub_1000E2A80();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_12;
          }
        }
        else
        {
          id v7 = *(id *)(a1 + 8 * v5);
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_12:
            __break(1u);
            goto LABEL_13;
          }
        }
        id v9 = v7;
        sub_1000CB944(a2, (uint64_t)v9);
        char v11 = v10;

        if ((v11 & 1) == 0)
        {
          ++v5;
          if (v8 != v4) {
            continue;
          }
        }
        goto LABEL_15;
      }
    }
  }
  char v11 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_1000CBD5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1000E2680();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000C4204(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000CBDF4(unint64_t a1)
{
  return sub_1000CBE3C(a1, (unint64_t *)&unk_100119060, (uint64_t)TUConversationMember_ptr, (unint64_t *)&unk_100118290, &qword_1001193A0);
}

uint64_t sub_1000CBE18(unint64_t a1)
{
  return sub_1000CBE3C(a1, (unint64_t *)&unk_100118F80, (uint64_t)CNContact_ptr, (unint64_t *)&unk_100117290, &qword_100118F90);
}

uint64_t sub_1000CBE3C(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, uint64_t *a5)
{
  unint64_t v10 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1000E2B70();
    swift_bridgeObjectRelease();
  }
  sub_100006C20(0, a2);
  sub_10001494C(a4, a2);
  uint64_t result = sub_1000E2680();
  uint64_t v18 = result;
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1000E2B70();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v12) {
      return v18;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v12) {
      return v18;
    }
  }
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = (void *)sub_1000E2A80();
        sub_1000C43D0(&v17, v14, a2, a3, a5);
      }
    }
    else
    {
      int64_t v15 = (void **)(a1 + 32);
      do
      {
        unint64_t v16 = *v15++;
        sub_1000C43D0(&v17, v16, a2, a3, a5);

        --v12;
      }
      while (v12);
    }
    return v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000CBFCC(unint64_t a1)
{
  return sub_1000CBE3C(a1, (unint64_t *)&unk_100117230, (uint64_t)TUHandle_ptr, &qword_1001170C0, &qword_100119070);
}

uint64_t sub_1000CBFF0(uint64_t a1)
{
  return sub_1000BB93C(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_1000CC00C()
{
  uint64_t result = sub_100053ECC();
  if (!v0)
  {
    uint64_t result = TUIsIDSAvailableForFaceTime();
    if (!result)
    {
      if (qword_1001161B0 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_1000E2030();
      sub_10000AD90(v2, (uint64_t)qword_100118E60);
      uint64_t v3 = sub_1000E2010();
      os_log_type_t v4 = sub_1000E2700();
      if (os_log_type_enabled(v3, v4))
      {
        Swift::Int v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::Int v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Rejecting start laguna session because iOS device is not signed into FaceTime.", v5, 2u);
        swift_slowDealloc();
      }

      (id)TUMakeNeighborhoodConduitError();
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_1000CC11C()
{
  uint64_t v1 = sub_1000E1BE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000CC1E8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1000E1BE0() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[2] = a1;
  v6[3] = v5;
  v6[1] = sub_100015FB4;
  return _swift_task_switch(sub_1000BA3D0, 0, 0);
}

uint64_t sub_1000CC2D0()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15)
  {
    sub_10000B344(*(void *)(v0 + 16), v1);
    return sub_1000E1C70();
  }
  return result;
}

uint64_t sub_1000CC330(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100015FB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100118FF8 + dword_100118FF8);
  return v6(a1, v4);
}

uint64_t sub_1000CC3E8(uint64_t a1)
{
  return sub_1000BF0EC(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(unsigned __int8 *)(v1 + 25));
}

uint64_t sub_1000CC3F8()
{
  return sub_1000B809C();
}

uint64_t sub_1000CC41C(uint64_t a1)
{
  return sub_1000BF8E8(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

void sub_1000CC438(uint64_t a1)
{
  sub_1000CEF04(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000CC454()
{
  uint64_t v1 = sub_100004D9C((uint64_t *)&unk_100119048);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 26) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000CC524()
{
  uint64_t v1 = *(void *)(sub_100004D9C((uint64_t *)&unk_100119048) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  int v4 = *(unsigned __int8 *)(v0 + 25);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 26) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000BF484(v2, v3, v4, v5);
}

uint64_t sub_1000CC594(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000CC5A4()
{
  return swift_release();
}

unint64_t sub_1000CC5AC()
{
  unint64_t result = qword_100117090;
  if (!qword_100117090)
  {
    sub_100004E3C(&qword_100116BF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100117090);
  }
  return result;
}

uint64_t sub_1000CC608(uint64_t a1)
{
  return sub_1000B5A38(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1000CC630(uint64_t a1)
{
  return sub_1000CDF4C(a1, &qword_100119098, (uint64_t)&unk_10010D7C8, (uint64_t)sub_1000CC6D0);
}

uint64_t sub_1000CC658(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000CC6AC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000CC6C4()
{
  return sub_1000CDF98(&qword_100119098);
}

uint64_t sub_1000CC6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_100004D9C(&qword_100119098) - 8);
  return sub_1000AB458(a1, a2, a3, *(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), v3 + ((*(unsigned __int8 *)(v7 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), (uint64_t (*)(void))&type metadata accessor for NCProtoLagunaConnectionResponse, &qword_100119098, (unint64_t *)&unk_1001190B8, (void (*)(uint64_t))&type metadata accessor for NCProtoLagunaConnectionResponse, (unint64_t)&protocol conformance descriptor for NCProtoLagunaConnectionResponse);
}

uint64_t sub_1000CC7B4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000CC7EC(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1000B18B8(a1, a2, a3);
}

uint64_t sub_1000CC7F4(uint64_t a1)
{
  return sub_1000B322C(a1, v1, (uint64_t)&unk_10010DB10, (uint64_t)&unk_100119188, (void (*)(char *, uint64_t, void *))sub_1000A75C4);
}

uint64_t sub_1000CC840(uint64_t a1)
{
  return sub_1000B322C(a1, v1, (uint64_t)&unk_10010DAC0, (uint64_t)&unk_100119158, (void (*)(char *, uint64_t, void *))sub_1000A75C4);
}

uint64_t sub_1000CC88C(uint64_t a1)
{
  return sub_1000B28FC(a1, v1, (uint64_t)&unk_10010DA70, (uint64_t)&unk_100119140);
}

uint64_t sub_1000CC8C4(uint64_t a1)
{
  return sub_1000B28FC(a1, v1, (uint64_t)&unk_10010DA20, (uint64_t)&unk_100119128);
}

uint64_t sub_1000CC8FC(uint64_t a1)
{
  return sub_1000B322C(a1, v1, (uint64_t)&unk_10010D9D0, (uint64_t)&unk_100119110, (void (*)(char *, uint64_t, void *))sub_1000A82D8);
}

uint64_t sub_1000CC948(uint64_t a1)
{
  return sub_1000B322C(a1, v1, (uint64_t)&unk_10010D958, (uint64_t)&unk_1001190D0, (void (*)(char *, uint64_t, void *))sub_1000A82D8);
}

uint64_t sub_1000CC998(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000B3384(a1, v4, v5, v6);
}

uint64_t sub_1000CCA4C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000CCA84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100015FB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1001190D8 + dword_1001190D8);
  return v6(a1, v4);
}

uint64_t sub_1000CCB40(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000BE61C(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_1000CCC04(uint64_t a1)
{
  return sub_1000CD090(a1, (uint64_t (*)(uint64_t))&NCProtoContinuityCallsDidChangeEvent.continuityCalls.setter);
}

uint64_t sub_1000CCC34(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000B2E40(a1, v4, v5, v6);
}

uint64_t sub_1000CCCF0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100015FB4;
  return sub_1000B2AB4(a1, v4, v5, v7, v6);
}

uint64_t sub_1000CCDB8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100015FB4;
  return sub_1000B2508(a1, v4, v5, v7, v6);
}

uint64_t sub_1000CCE80()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100015FB4;
  v3[13] = v2;
  return _swift_task_switch(sub_1000B22C0, 0, 0);
}

uint64_t sub_1000CCF2C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_1000CCF9C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000AFA4;
  return sub_1000BD3CC(a1, v4, v5, v6, v7, (uint64_t)(v1 + 6));
}

uint64_t sub_1000CD064(uint64_t a1)
{
  return sub_1000CD090(a1, (uint64_t (*)(uint64_t))&NCProtoFavoritesDidChangeEvent.favorites.setter);
}

uint64_t sub_1000CD090(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = swift_bridgeObjectRetain();
  return a2(v3);
}

uint64_t sub_1000CD0DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000B1DB4(a1, v4, v5, v6);
}

uint64_t sub_1000CD194(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000BC518(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_1000CD258()
{
  return sub_1000BCD4C();
}

uint64_t sub_1000CD278()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000CD2C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  char v5 = *(unsigned char *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v6 = *(void *)(v1 + 56);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *(void *)uint64_t v8 = v2;
  *(void *)(v8 + 8) = sub_100015FB4;
  *(void *)(v8 + 56) = v7;
  *(void *)(v8 + 64) = v6;
  *(unsigned char *)(v8 + 80) = v5;
  *(void *)(v8 + 40) = a1;
  *(void *)(v8 + 48) = v4;
  return _swift_task_switch(sub_1000B1A80, 0, 0);
}

uint64_t sub_1000CD390(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_100015FB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1001191C0 + dword_1001191C0);
  return v6(a1, v4);
}

uint64_t sub_1000CD448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v6 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E25E0();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v5;
  int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  swift_retain();
  if (v13 == 1)
  {
    sub_100015EAC((uint64_t)v9, (uint64_t *)&unk_1001170B0);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    sub_1000E25D0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (v12[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_1000E2580();
      uint64_t v15 = v16;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
  }
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = v12;
  if (v15 | v14)
  {
    v19[0] = 0;
    v19[1] = 0;
    v19[2] = v14;
    v19[3] = v15;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1000CD680(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000C18C0(a1, v4, v5, v6);
}

uint64_t sub_1000CD738(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000BFE5C(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_1000CD7FC()
{
  return sub_1000E1EE0();
}

uint64_t sub_1000CD83C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000AFA4;
  return sub_1000C15A8(a1, v4, v5, v6);
}

uint64_t sub_1000CD8F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000C1290(a1, v4, v5, v6);
}

uint64_t sub_1000CD9B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000C0F78(a1, v4, v5, v6);
}

uint64_t sub_1000CDA70(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000C0C60(a1, v4, v5, v6);
}

uint64_t sub_1000CDB2C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000CDB6C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015FB4;
  return sub_1000C0948(a1, v4, v5, v6);
}

uint64_t sub_1000CDC24()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_1000CDC8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004D9C(&qword_100116580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CDCF4(uint64_t a1)
{
  return sub_1000CDF4C(a1, &qword_1001192C0, (uint64_t)&unk_10010DE80, (uint64_t)sub_1000CDD28);
}

uint64_t sub_1000CDD1C()
{
  return sub_1000CDF98(&qword_1001192C0);
}

uint64_t sub_1000CDD28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_100004D9C(&qword_1001192C0) - 8);
  return sub_1000AB458(a1, a2, a3, *(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), v3 + ((*(unsigned __int8 *)(v7 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), (uint64_t (*)(void))&type metadata accessor for NCProtoDisconnectResponse, &qword_1001192C0, &qword_1001192C8, (void (*)(uint64_t))&type metadata accessor for NCProtoDisconnectResponse, (unint64_t)&protocol conformance descriptor for NCProtoDisconnectResponse);
}

uint64_t sub_1000CDE0C(uint64_t a1)
{
  return sub_1000CDF4C(a1, &qword_100119390, (uint64_t)&unk_10010DEA8, (uint64_t)sub_1000CDE40);
}

uint64_t sub_1000CDE34()
{
  return sub_1000CDF98(&qword_100119390);
}

uint64_t sub_1000CDE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_100004D9C(&qword_100119390) - 8);
  return sub_1000AB458(a1, a2, a3, *(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), v3 + ((*(unsigned __int8 *)(v7 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), (uint64_t (*)(void))&type metadata accessor for NCProtoDeviceTokenResponse, &qword_100119390, &qword_100119398, (void (*)(uint64_t))&type metadata accessor for NCProtoDeviceTokenResponse, (unint64_t)&protocol conformance descriptor for NCProtoDeviceTokenResponse);
}

uint64_t sub_1000CDF24(uint64_t a1)
{
  return sub_1000CDF4C(a1, &qword_1001193D8, (uint64_t)&unk_10010DED0, (uint64_t)sub_1000CE060);
}

uint64_t sub_1000CDF4C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000AAE9C(a1, *(void *)(v4 + 16), *(unsigned __int8 *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), a2, a3, a4);
}

uint64_t sub_1000CDF8C()
{
  return sub_1000CDF98(&qword_1001193D8);
}

uint64_t sub_1000CDF98(uint64_t *a1)
{
  uint64_t v2 = sub_100004D9C(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 25) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_1000CE060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_100004D9C(&qword_1001193D8) - 8);
  return sub_1000AB458(a1, a2, a3, *(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), v3 + ((*(unsigned __int8 *)(v7 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), (uint64_t (*)(void))&type metadata accessor for NCProtoCallStateResponse, &qword_1001193D8, &qword_1001193E0, (void (*)(uint64_t))&type metadata accessor for NCProtoCallStateResponse, (unint64_t)&protocol conformance descriptor for NCProtoCallStateResponse);
}

uint64_t sub_1000CE144(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100015FB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1001193E8 + dword_1001193E8);
  return v6(a1, v4);
}

uint64_t initializeBufferWithCopyOfBuffer for ContinuitySessionServer.ContinuityHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for ContinuitySessionServer.ContinuityHandle(id *a1)
{
}

uint64_t assignWithCopy for ContinuitySessionServer.ContinuityHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t assignWithTake for ContinuitySessionServer.ContinuityHandle(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

ValueMetadata *type metadata accessor for ContinuitySessionServer.ContinuityHandle()
{
  return &type metadata for ContinuitySessionServer.ContinuityHandle;
}

uint64_t sub_1000CE364@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000CE370(uint64_t a1, void *a2, uint64_t a3)
{
  sub_1000E2A60(68);
  v7._object = (void *)0x80000001000EA6D0;
  v7._countAndFlagsBits = 0xD000000000000019;
  sub_1000E2450(v7);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = a1;
  v8._object = a2;
  sub_1000E2450(v8);
  swift_bridgeObjectRelease();
  v9._object = (void *)0xEB00000000203A74;
  v9._countAndFlagsBits = 0x736575716572283ELL;
  sub_1000E2450(v9);
  v10._countAndFlagsBits = sub_1000E2DE0();
  sub_1000E2450(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x6E6F70736572202CLL;
  v11._object = (void *)0xEC000000203A6573;
  sub_1000E2450(v11);
  v12._countAndFlagsBits = sub_1000E2DE0();
  sub_1000E2450(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 0x6E6F6974706F202CLL;
  v13._object = (void *)0xEB00000000203A73;
  sub_1000E2450(v13);
  if (!a3) {
    sub_1000055C8((uint64_t)_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = sub_1000E2380();
  sub_1000E2450(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 41;
  v15._object = (void *)0xE100000000000000;
  sub_1000E2450(v15);
  return 0;
}

uint64_t sub_1000CE53C()
{
  return sub_1000CE370(*(void *)v0, *(void **)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t sub_1000CE550(uint64_t a1, void *a2, uint64_t a3)
{
  sub_1000E2A60(54);
  v7._object = (void *)0x80000001000EA6F0;
  v7._countAndFlagsBits = 0xD00000000000001BLL;
  sub_1000E2450(v7);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = a1;
  v8._object = a2;
  sub_1000E2450(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x3A746E657665283ELL;
  v9._object = (void *)0xE900000000000020;
  sub_1000E2450(v9);
  v10._countAndFlagsBits = sub_1000E2DE0();
  sub_1000E2450(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x6E6F6974706F202CLL;
  v11._object = (void *)0xEB00000000203A73;
  sub_1000E2450(v11);
  if (!a3) {
    sub_1000055C8((uint64_t)_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = sub_1000E2380();
  sub_1000E2450(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 41;
  v13._object = (void *)0xE100000000000000;
  sub_1000E2450(v13);
  return 0;
}

uint64_t sub_1000CE6CC()
{
  return sub_1000CE550(*(void *)v0, *(void **)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t sub_1000CE6E0()
{
  sub_10000EC60(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for CompanionRpcMessenger()
{
  return self;
}

uint64_t sub_1000CE73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

__n128 sub_1000CE750(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for CompanionRpcDefinition()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000CE788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_1000CE790()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1000CE7CC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1000CE80C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000CE874(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000CE8BC(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000CE904(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for CompanionEventDefinition()
{
  return sub_1000A71F0();
}

void *sub_1000CE95C()
{
  return &protocol witness table for String;
}

void *sub_1000CE96C(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1000E2900();
    sub_100006C20(0, (unint64_t *)&unk_100117230);
    sub_10001494C(&qword_1001170C0, (unint64_t *)&unk_100117230);
    __n128 result = (void *)sub_1000E26A0();
    uint64_t v1 = v21;
    uint64_t v19 = v22;
    uint64_t v3 = v23;
    uint64_t v4 = v24;
    unint64_t v5 = v25;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    __n128 result = (void *)swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_29;
    }
    int64_t v15 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v19 + 8 * v15);
    uint64_t v12 = v4 + 1;
    if (!v16)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v19 + 8 * v12);
      if (!v16)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v19 + 8 * v12);
        if (!v16)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = *(void *)(v19 + 8 * v12);
          if (!v16)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v9) {
              goto LABEL_32;
            }
            unint64_t v16 = *(void *)(v19 + 8 * v12);
            if (!v16)
            {
              uint64_t v17 = v4 + 6;
              while (v9 != v17)
              {
                unint64_t v16 = *(void *)(v19 + 8 * v17++);
                if (v16)
                {
                  uint64_t v12 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_10001499C();
              return &_swiftEmptyArrayStorage;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v12 << 6);
LABEL_29:
    id v14 = *(id *)(*(void *)(v1 + 48) + 8 * v11);
    Swift::String v13 = v14;
    if (!v14) {
      goto LABEL_32;
    }
    while (1)
    {
      uint64_t v18 = sub_1000592CC(v14);

      __n128 result = (void *)sub_1000C975C(v18);
      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_1000E2990())
      {
        sub_100006C20(0, (unint64_t *)&unk_100117230);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        Swift::String v13 = v20;
        id v14 = (id)swift_unknownObjectRelease();
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v20) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

uint64_t NCProtoContinuityCall.description.getter()
{
  uint64_t v0 = sub_1000E14E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_1000E2A60(88);
  v10._countAndFlagsBits = 0xD000000000000022;
  v10._object = (void *)0x80000001000EA710;
  sub_1000E2450(v10);
  v11._countAndFlagsBits = sub_1000E1440();
  sub_1000E2450(v11);
  swift_bridgeObjectRelease();
  v12._object = (void *)0x80000001000EA740;
  v12._countAndFlagsBits = 0xD000000000000018;
  sub_1000E2450(v12);
  v13._countAndFlagsBits = sub_1000E14A0();
  sub_1000E2450(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x79616C7073696420;
  v14._object = (void *)0xED00003D656D614ELL;
  sub_1000E2450(v14);
  v15._countAndFlagsBits = sub_1000E1460();
  sub_1000E2450(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0x3D73757461747320;
  v16._object = (void *)0xE800000000000000;
  sub_1000E2450(v16);
  sub_1000E14F0();
  uint64_t v5 = sub_1000E14D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v7[1] = v5;
  v17._countAndFlagsBits = sub_1000E2C30();
  sub_1000E2450(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 62;
  v18._object = (void *)0xE100000000000000;
  sub_1000E2450(v18);
  return v8;
}

uint64_t sub_1000CEE58(int a1, id a2)
{
  id v3 = [a2 localizedShortName];
  sub_1000E23F0();

  sub_1000E1540();
  id v4 = [a2 localizedName];
  sub_1000E23F0();

  return sub_1000E1530();
}

void sub_1000CEF04(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1000E1550();
  __chkstk_darwin(v3, v4);
  id v5 = [a2 callUUID];
  sub_1000E23F0();

  sub_1000E1230();
  id v6 = [a2 localizedLabel];
  if (v6)
  {
    uint64_t v7 = v6;
    sub_1000E23F0();

    sub_1000E1250();
  }
  id v8 = [a2 displayName];
  sub_1000E23F0();

  sub_1000E1220();
  sub_1000CF248();
  sub_1000E1270();
  id v9 = [a2 remoteParticipantHandles];
  sub_100006C20(0, (unint64_t *)&unk_100117230);
  sub_10001494C(&qword_1001170C0, (unint64_t *)&unk_100117230);
  uint64_t v10 = sub_1000E2660();

  Swift::String v11 = sub_1000CE96C(v10);
  uint64_t v12 = sub_1000CBD5C((uint64_t)v11);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1000198B0(v12, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    sub_1000CF930(v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100005BD0((uint64_t)&_swiftEmptyArrayStorage);
  }
  sub_1000E1260();
  id v14 = [a2 provider];
  id v15 = [v14 prioritizedSenderIdentities];

  uint64_t v16 = (uint64_t)[v15 count];
  if (v16 >= 2)
  {
    id v17 = [a2 localSenderIdentity];
    if (v17)
    {
      uint64_t v19 = v17;
      *(&v20 - 2) = __chkstk_darwin(v17, v18);
      sub_1000CFB84();
      sub_1000E1210();
      sub_1000E1240();
    }
  }
}

uint64_t sub_1000CF248()
{
  uint64_t v1 = sub_1000E1010();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004D9C(&qword_1001189C8);
  __chkstk_darwin(v6 - 8, v7);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [v0 imageURL];
  if (!v10)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v9, 1, 1, v1);
    goto LABEL_7;
  }
  Swift::String v11 = v10;
  sub_1000E1000();

  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v9, v5, v1);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v9, 0, 1, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) == 1)
  {
LABEL_7:
    sub_1000CFBDC((uint64_t)v9);
    return 0;
  }
  sub_1000CFBDC((uint64_t)v9);
  uint64_t result = (uint64_t)[v0 localizedLabel];
  if (!result) {
    return result;
  }

  id v13 = [v0 callDirectoryName];
  if (!v13) {
    return 1;
  }

  return 0;
}

uint64_t sub_1000CF44C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1000E1ED0();
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v35 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E18C0();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v34 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v32 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000E16D0();
  uint64_t v9 = *(void *)(v31 - 8);
  __chkstk_darwin(v31, v10);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000E1140();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  id v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = [a2 UUID];
  sub_1000E1110();

  sub_1000E10E0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  sub_1000E1760();
  id v19 = [a2 displayName];
  sub_1000E23F0();

  sub_1000E1770();
  id v20 = [a2 state];
  if ((unint64_t)v20 > 4) {
    uint64_t v21 = (unsigned int *)&enum case for NCProtoConversationState.unknownState(_:);
  }
  else {
    uint64_t v21 = (unsigned int *)*(&off_10010E088 + (void)v20);
  }
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *v21, v31);
  sub_1000E17B0();
  id v22 = [a2 resolvedAudioVideoMode];
  uint64_t v23 = (unsigned int *)&enum case for NCProtoConversationAVMode.audio(_:);
  uint64_t v24 = (unsigned int *)&enum case for NCProtoConversationAVMode.none(_:);
  if (v22) {
    uint64_t v24 = (unsigned int *)&enum case for NCProtoConversationAVMode.video(_:);
  }
  if (v22 != (id)1) {
    uint64_t v23 = v24;
  }
  (*(void (**)(char *, void, uint64_t))(v33 + 104))(v32, *v23, v34);
  sub_1000E17C0();
  id v25 = [a2 letMeInRequestState];
  if ((unint64_t)v25 > 3) {
    uint64_t v26 = (unsigned int *)&enum case for NCProtoConversationLetMeInRequestState.unknownLmiState(_:);
  }
  else {
    uint64_t v26 = (unsigned int *)*(&off_10010E0B0 + (void)v25);
  }
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v35, *v26, v37);
  sub_1000E1790();
  id v27 = [a2 mergedRemoteMembers];
  sub_100006C20(0, (unint64_t *)&unk_100119060);
  sub_10001494C((unint64_t *)&unk_100118290, (unint64_t *)&unk_100119060);
  uint64_t v28 = sub_1000E2660();

  if ((v28 & 0xC000000000000001) != 0 && sub_1000E2950() < 0)
  {
    sub_1000E2B50();
    __break(1u);
  }
  sub_1000E1780();
  sub_10001A3A8(v28);
  swift_bridgeObjectRelease();
  return sub_1000E17A0();
}

uint64_t sub_1000CF930(uint64_t a1)
{
  sub_100004D9C(&qword_1001164C0);
  uint64_t result = sub_1000E2B80();
  int64_t v3 = 0;
  uint64_t v33 = (void *)result;
  uint64_t v34 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v5 = a1 + 64;
  uint64_t v4 = v6;
  uint64_t v7 = 1 << *(unsigned char *)(v5 - 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v4;
  uint64_t v30 = v5;
  int64_t v31 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v32 = result + 64;
  if ((v8 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  int64_t v35 = v3;
  for (unint64_t i = v10 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(v34 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    id v19 = *(void **)(*(void *)(v34 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    id v20 = v19;
    id v21 = [v20 identifier];
    uint64_t v22 = sub_1000E23F0();
    uint64_t v24 = v23;

    uint64_t result = (uint64_t)v33;
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    id v25 = (void *)(v33[6] + 16 * i);
    *id v25 = v17;
    v25[1] = v18;
    uint64_t v26 = (uint64_t *)(v33[7] + 16 * i);
    *uint64_t v26 = v22;
    v26[1] = v24;
    uint64_t v27 = v33[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v33[2] = v29;
    int64_t v3 = v35;
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v31) {
      return result;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v12);
    int64_t v14 = v3 + 1;
    if (!v13)
    {
      int64_t v14 = v3 + 2;
      if (v3 + 2 >= v31) {
        return result;
      }
      unint64_t v13 = *(void *)(v30 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v3 + 3;
        if (v3 + 3 >= v31) {
          return result;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v14);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v9 = (v13 - 1) & v13;
    int64_t v35 = v14;
  }
  uint64_t v15 = v3 + 4;
  if (v3 + 4 >= v31) {
    return result;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v3 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v31) {
      return result;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000CFB68(int a1)
{
  return sub_1000CEE58(a1, *(id *)(v1 + 16));
}

unint64_t sub_1000CFB84()
{
  unint64_t result = qword_1001195B0;
  if (!qword_1001195B0)
  {
    sub_1000E1550();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001195B0);
  }
  return result;
}

uint64_t sub_1000CFBDC(uint64_t a1)
{
  uint64_t v2 = sub_100004D9C(&qword_1001189C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000CFC3C()
{
  type metadata accessor for Defaults();
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = &type metadata for ConversationServerBag;
  *(void *)(result + 48) = &off_10010E580;
  qword_10011BFB8 = result;
  return result;
}

uint64_t type metadata accessor for Defaults()
{
  return self;
}

uint64_t sub_1000CFCA0(char a1)
{
  id v2 = [self standardUserDefaults];
  NSString v3 = sub_1000E23E0();
  swift_bridgeObjectRelease();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    sub_1000E28B0();
    swift_unknownObjectRelease();
    sub_1000A6D64((uint64_t)v8);
    switch(a1)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        NSString v6 = sub_1000E23E0();
        swift_bridgeObjectRelease();
        id v5 = [v2 BOOLForKey:v6];

        break;
      default:
        JUMPOUT(0);
    }
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_1000A6D64((uint64_t)v8);

    return 2;
  }
  return (uint64_t)v5;
}

id sub_1000CFF04(char a1)
{
  id v2 = [self standardUserDefaults];
  NSString v3 = sub_1000E23E0();
  swift_bridgeObjectRelease();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    sub_1000E28B0();
    swift_unknownObjectRelease();
    sub_1000A6D64((uint64_t)v8);
    switch(a1)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        NSString v6 = sub_1000E23E0();
        swift_bridgeObjectRelease();
        id v5 = [v2 integerForKey:v6];

        break;
      default:
        JUMPOUT(0);
    }
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_1000A6D64((uint64_t)v8);

    return 0;
  }
  return v5;
}

uint64_t sub_1000D0170(uint64_t a1)
{
  v12[3] = &type metadata for Int;
  v12[0] = a1;
  id v1 = [self standardUserDefaults];
  sub_1000A6DC4((uint64_t)v12, (uint64_t)v10);
  uint64_t v2 = v11;
  if (v11)
  {
    NSString v3 = sub_10000EC1C(v10, v11);
    uint64_t v4 = *(void *)(v2 - 8);
    __chkstk_darwin(v3, v3);
    NSString v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    uint64_t v7 = sub_1000E2C60();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    sub_10000EC60((uint64_t)v10);
  }
  else
  {
    uint64_t v7 = 0;
  }
  NSString v8 = sub_1000E23E0();
  [v1 setValue:v7 forKey:v8];

  swift_unknownObjectRelease();
  return sub_1000A6D64((uint64_t)v12);
}

char *os_log_type_t.errorWithState.unsafeMutableAddressor()
{
  if (qword_100116208 != -1) {
    swift_once();
  }
  return &static os_log_type_t.errorWithState;
}

uint64_t sub_1000D0360(uint64_t a1)
{
  return sub_1000D0448(a1, qword_10011BFC0);
}

uint64_t sub_1000D0384(uint64_t a1)
{
  return sub_1000D0448(a1, qword_10011BFD8);
}

uint64_t sub_1000D03A8(uint64_t a1)
{
  return sub_1000D0448(a1, qword_10011BFF0);
}

uint64_t sub_1000D03D4(uint64_t a1)
{
  return sub_1000D0448(a1, qword_10011C008);
}

uint64_t sub_1000D0400(uint64_t a1)
{
  return sub_1000D0448(a1, qword_10011C020);
}

uint64_t sub_1000D0424(uint64_t a1)
{
  return sub_1000D0448(a1, qword_10011C038);
}

uint64_t sub_1000D0448(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000E2030();
  sub_1000CADBC(v3, a2);
  sub_10000AD90(v3, (uint64_t)a2);
  return sub_1000E2020();
}

uint64_t sub_1000D04C0()
{
  uint64_t v0 = sub_1000E2030();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E1FB0();
  sub_1000CADBC(v5, qword_1001196C0);
  sub_10000AD90(v5, (uint64_t)qword_1001196C0);
  if (qword_1001161D0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000AD90(v0, (uint64_t)qword_10011BFC0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v6, v0);
  return sub_1000E1F90();
}

uint64_t sub_1000D05FC()
{
  uint64_t result = sub_1000E26E0();
  static os_log_type_t.errorWithState = result | 0x80;
  return result;
}

uint64_t static os_log_type_t.errorWithState.getter()
{
  if (qword_100116208 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static os_log_type_t.errorWithState;
}

uint64_t static os_log_type_t.errorWithState.setter(char a1)
{
  if (qword_100116208 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  static os_log_type_t.errorWithState = a1;
  return result;
}

uint64_t (*static os_log_type_t.errorWithState.modify())()
{
  if (qword_100116208 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

char *sub_1000D0798(char *__src, char *__dst, uint64_t a3)
{
  if (__dst) {
    return strncpy(__dst, __src, a3 - (void)__dst);
  }
  __break(1u);
  return __src;
}

uint64_t sub_1000D07C8(char a1)
{
  uint64_t v2 = sub_1000E1F80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  unint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = sub_1000E1FB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100116200 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_10000AD90(v11, (uint64_t)qword_1001196C0);
  uint64_t v29 = v12;
  uint64_t v30 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v16, v11);
  uint64_t v17 = off_10010E110[a1];
  sub_1000E1F70();
  uint64_t v18 = sub_1000E1FA0();
  os_signpost_type_t v19 = sub_1000E2800();
  if (sub_1000E2850())
  {
    id v20 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v27 = v17;
    uint64_t v21 = v3;
    v20(v7, v10, v2);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = v2;
    uint64_t v23 = v22;
    *(_WORD *)uint64_t v22 = 0;
    os_signpost_id_t v24 = sub_1000E1F60();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, v19, v24, v27, "", v23, 2u);
    uint64_t v2 = v28;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
  else
  {

    uint64_t v21 = v3;
    id v20 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  }
  v20(v7, v10, v2);
  sub_1000E1FF0();
  swift_allocObject();
  uint64_t v25 = sub_1000E1FE0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v2);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
  return v25;
}

uint64_t sub_1000D0AEC(char a1)
{
  uint64_t v2 = (const char *)sub_1000E1FC0();
  uint64_t v32 = *((void *)v2 - 1);
  uint64_t v33 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v5 = &v29[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000E1F80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v34 = &v29[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9, v11);
  uint64_t v13 = &v29[-v12];
  uint64_t v14 = sub_1000E1FB0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = &v29[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100116200 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_10000AD90(v14, (uint64_t)qword_1001196C0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v18, v19, v14);
  int64_t v31 = off_10010E110[a1];
  id v20 = sub_1000E1FA0();
  sub_1000E1FD0();
  int v30 = sub_1000E27F0();
  if (sub_1000E2850())
  {
    swift_retain();
    sub_1000E2000();
    swift_release();
    uint64_t v22 = v32;
    uint64_t v21 = v33;
    if ((*(unsigned int (**)(unsigned char *, const char *))(v32 + 88))(v5, v33) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v23 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unsigned char *, const char *))(v22 + 8))(v5, v21);
      uint64_t v23 = "";
    }
    uint64_t v33 = v23;
    uint64_t v25 = v34;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v34, v13, v6);
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    os_signpost_id_t v27 = sub_1000E1F60();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, (os_signpost_type_t)v30, v27, v31, v33, v26, 2u);
    swift_slowDealloc();

    uint64_t v28 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v28(v13, v6);
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v18, v14);
    return ((uint64_t (*)(unsigned char *, uint64_t))v28)(v25, v6);
  }
  else
  {

    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v13, v6);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v15 + 8))(v18, v14);
  }
}

uint64_t NeighborhoodActivityPublisherService.firstValue<A, B>(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = sub_1000E1140();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  return _swift_task_switch(sub_1000D0FA0, 0, 0);
}

uint64_t sub_1000D0FA0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 24);
  long long v11 = *(_OWORD *)(v0 + 32);
  sub_1000E1130();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 88) = v5;
  *(_OWORD *)(v5 + 16) = v11;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
  *(void *)(v5 + 48) = v1;
  *(void *)(v5 + 56) = v4;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000D10D4;
  uint64_t v8 = *(void *)(v0 + 32);
  uint64_t v9 = *(void *)(v0 + 16);
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)(v9, &unk_1001196E8, v5, sub_1000503BC, v6, 0, 0, v8);
}

uint64_t sub_1000D10D4()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000D12A8;
  }
  else {
    uint64_t v2 = sub_1000D1228;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000D1228()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000D12A8()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000D1328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  void v7[2] = a1;
  return _swift_task_switch(sub_1000D1354, 0, 0);
}

uint64_t sub_1000D1354()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 48);
  *(void *)(v3 + 32) = v1;
  *(_OWORD *)(v3 + 40) = v4;
  *(void *)(v3 + 56) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000D1460;
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 16);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v7, 0, 0, 0xD000000000000011, 0x80000001000E93D0, sub_1000D3794, v3, v6);
}

uint64_t sub_1000D1460()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_1000D159C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1000D159C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000D1600(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 40);
  long long v8 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_10000AFA4;
  *(void *)(v6 + 64) = v4;
  *(_OWORD *)(v6 + 48) = v8;
  *(void *)(v6 + 40) = v5;
  *(_OWORD *)(v6 + 24) = v7;
  *(void *)(v6 + 16) = a1;
  return _swift_task_switch(sub_1000D1354, 0, 0);
}

uint64_t sub_1000D16D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v38 = a6;
  uint64_t v39 = a7;
  uint64_t v34 = a5;
  uint64_t v35 = a1;
  uint64_t v41 = a4;
  uint64_t v36 = a3;
  uint64_t v43 = sub_1000E21D0();
  uint64_t v46 = *(void *)(v43 - 8);
  __chkstk_darwin(v43, v8);
  unint64_t v42 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E2200();
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  __chkstk_darwin(v10, v11);
  unint64_t v40 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E3C(&qword_1001182E0);
  uint64_t v13 = sub_1000E25B0();
  uint64_t v33 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v33 - v17;
  uint64_t v19 = sub_1000E1140();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  __chkstk_darwin(v19, v22);
  uint64_t v23 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = *(void *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v36, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v35, v13);
  unint64_t v24 = (*(unsigned __int8 *)(v20 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v25 = (v21 + v24 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v26 = (char *)swift_allocObject();
  uint64_t v27 = v38;
  *((void *)v26 + 2) = v34;
  *((void *)v26 + 3) = v27;
  *((void *)v26 + 4) = v39;
  *((void *)v26 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v26[v24], v23, v19);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v26[v25], v18, v33);
  *(void *)&v26[(v15 + v25 + 7) & 0xFFFFFFFFFFFFFFF8] = v41;
  aBlock[4] = sub_1000D3930;
  aBlock[5] = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10005489C;
  aBlock[3] = &unk_10010E1B0;
  uint64_t v28 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  uint64_t v29 = v40;
  sub_1000E21F0();
  unint64_t v47 = _swiftEmptyArrayStorage;
  sub_1000D3EAC((unint64_t *)&qword_100117080, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004D9C(&qword_100116BF0);
  sub_10000AE60((unint64_t *)&qword_100117090, &qword_100116BF0);
  int64_t v31 = v42;
  uint64_t v30 = v43;
  sub_1000E28C0();
  sub_1000E2770();
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v30);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v45);
  return swift_release();
}

uint64_t sub_1000D1B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v119 = a6;
  uint64_t v120 = a7;
  uint64_t v117 = a3;
  uint64_t v122 = a1;
  sub_100004E3C(&qword_1001182E0);
  uint64_t v121 = a5;
  uint64_t v100 = sub_1000E25B0();
  uint64_t v123 = *(void *)(v100 - 8);
  uint64_t v111 = *(void *)(v123 + 64);
  uint64_t v11 = __chkstk_darwin(v100, v10);
  unint64_t v104 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v13);
  uint64_t v116 = (char *)&v92 - v14;
  uint64_t v15 = sub_100004D9C(&qword_100117C28);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000E2090();
  unint64_t v20 = sub_1000D360C();
  unint64_t v113 = (void (*)(char *, uint64_t, uint64_t))v20;
  uint64_t v114 = v19;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v112 = WitnessTable;
  uint64_t v110 = sub_1000D3EAC(&qword_100117C50, (void (*)(uint64_t))sub_1000D360C);
  uint64_t v125 = v19;
  unint64_t v126 = v20;
  uint64_t v127 = WitnessTable;
  uint64_t v128 = v110;
  uint64_t v97 = sub_1000E2060();
  uint64_t v99 = *(void *)(v97 - 8);
  __chkstk_darwin(v97, v22);
  uint64_t v105 = (char *)&v92 - v23;
  uint64_t v96 = swift_getWitnessTable();
  uint64_t v101 = sub_1000E2040();
  uint64_t v103 = *(void *)(v101 - 8);
  __chkstk_darwin(v101, v24);
  char v118 = (char *)&v92 - v25;
  uint64_t v26 = sub_1000E1140();
  uint64_t v115 = *(void *)(v26 - 8);
  uint64_t v27 = *(void *)(v115 + 64);
  uint64_t v29 = __chkstk_darwin(v26, v28);
  id v98 = (char *)&v92 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29, v30);
  uint64_t v33 = (char *)&v92 - v32;
  __chkstk_darwin(v31, v34);
  uint64_t v102 = (uint64_t)&v92 - v35;
  uint64_t v38 = v36 + 16;
  uint64_t v37 = *(void (**)(void))(v36 + 16);
  uint64_t v93 = a2;
  v37();
  uint64_t v94 = v38;
  uint64_t v39 = v37;
  uint64_t v95 = v37;
  id v124 = *(id *)(v122 + 16);
  id v40 = v124;
  uint64_t v125 = a4;
  uint64_t v41 = sub_1000E2740();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v18, 1, 1, v41);
  id v42 = v40;
  sub_1000E2190();
  sub_1000D3A64((uint64_t)v18);

  uint64_t v43 = v33;
  uint64_t v44 = v26;
  ((void (*)(char *, uint64_t, uint64_t))v39)(v33, a2, v26);
  uint64_t v45 = v123;
  unint64_t v113 = *(void (**)(char *, uint64_t, uint64_t))(v123 + 16);
  uint64_t v114 = v123 + 16;
  uint64_t v46 = v116;
  uint64_t v47 = v100;
  v113(v116, v117, v100);
  uint64_t v48 = v115;
  uint64_t v49 = *(unsigned __int8 *)(v115 + 80);
  uint64_t v50 = (v49 + 48) & ~v49;
  uint64_t v51 = *(unsigned __int8 *)(v45 + 80);
  uint64_t v52 = (v27 + v50 + v51) & ~v51;
  v111 += v52;
  uint64_t v112 = v50;
  uint64_t v108 = v52;
  uint64_t v110 = v49 | v51 | 7;
  unint64_t v53 = (void *)swift_allocObject();
  uint64_t v54 = v122;
  uint64_t v55 = v119;
  v53[2] = v121;
  v53[3] = v55;
  v53[4] = v120;
  v53[5] = v54;
  uint64_t v56 = (char *)v53 + v50;
  id v57 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  uint64_t v107 = v48 + 32;
  uint64_t v109 = v57;
  uint64_t v58 = v43;
  unsigned __int8 v59 = v43;
  uint64_t v60 = v44;
  v57(v56, v58, v44);
  id v61 = (char *)v53 + v52;
  NSString v62 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  uint64_t v123 = v45 + 32;
  uint64_t v106 = v62;
  unint64_t v63 = v46;
  uint64_t v64 = v47;
  v62(v61, v46, v47);
  swift_retain();
  uint64_t v65 = v97;
  unint64_t v66 = v105;
  sub_1000E2150();
  swift_release();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v66, v65);
  unint64_t v67 = v59;
  uint64_t v68 = v59;
  uint64_t v69 = v93;
  uint64_t v70 = v60;
  uint64_t v71 = v95;
  ((void (*)(char *, uint64_t, uint64_t))v95)(v68, v93, v60);
  uint64_t v72 = v63;
  uint64_t v73 = v117;
  uint64_t v74 = v64;
  v113(v72, v117, v64);
  id v75 = (char *)swift_allocObject();
  uint64_t v76 = v120;
  uint64_t v77 = v119;
  *((void *)v75 + 2) = v121;
  *((void *)v75 + 3) = v77;
  uint64_t v78 = v122;
  *((void *)v75 + 4) = v76;
  *((void *)v75 + 5) = v78;
  v109(&v75[v112], v67, v70);
  v106(&v75[v108], v116, v74);
  uint64_t v79 = v98;
  uint64_t v80 = v69;
  uint64_t v81 = v70;
  ((void (*)(char *, uint64_t, uint64_t))v71)(v98, v80, v70);
  uint64_t v82 = v104;
  v113(v104, v73, v74);
  char v83 = (char *)swift_allocObject();
  *((void *)v83 + 2) = v121;
  *((void *)v83 + 3) = v77;
  uint64_t v84 = v122;
  *((void *)v83 + 4) = v76;
  *((void *)v83 + 5) = v84;
  uint64_t v85 = v81;
  v109(&v83[v112], v79, v81);
  v106(&v83[v108], v82, v74);
  swift_retain_n();
  uint64_t v86 = v101;
  swift_getWitnessTable();
  uint64_t v87 = v118;
  uint64_t v88 = sub_1000E2170();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v103 + 8))(v87, v86);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  id v124 = *(id *)(v84 + 24);
  *(void *)(v84 + 24) = 0x8000000000000000;
  uint64_t v90 = v102;
  sub_1000C78D8(v88, v102, isUniquelyReferenced_nonNull_native);
  *(void *)(v84 + 24) = v124;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v90, v85);
  return swift_endAccess();
}

uint64_t sub_1000D2498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a2 + 24);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100006444(a3);
  LOBYTE(a3) = v7;
  swift_bridgeObjectRelease();
  if ((a3 & 1) == 0) {
    return swift_endAccess();
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v5;
  uint64_t v14 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_1000C8800();
    uint64_t v9 = v14;
  }
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t v11 = sub_1000E1140();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
  sub_1000C6D9C(v6, v14);
  *uint64_t v5 = v14;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_1000E20B0();
  sub_100004E3C(&qword_1001182E0);
  uint64_t v12 = sub_1000E25B0();
  sub_1000D2614(a1, v12);
  return swift_release();
}

uint64_t sub_1000D2614(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(a1, a2);
  char v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v5, v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000E2D80();
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v19 - v15, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v16, v9);
    return sub_1000E2590();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v16, v3);
    return sub_1000E25A0();
  }
}

uint64_t sub_1000D2850(uint64_t a1, uint64_t a2)
{
  sub_100004E3C(&qword_1001182E0);
  uint64_t v4 = sub_1000E2D80();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (uint64_t *)((char *)&v11 - v7);
  sub_1000E25C0();
  sub_1000D3EAC(&qword_100117C68, (void (*)(uint64_t))&type metadata accessor for CancellationError);
  uint64_t v9 = swift_allocError();
  sub_1000E2350();
  *uint64_t v8 = v9;
  swift_storeEnumTagMultiPayload();
  sub_1000D2498((uint64_t)v8, a1, a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_1000D29E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  uint64_t v45 = a2;
  uint64_t v43 = a1;
  sub_100004E3C(&qword_1001182E0);
  uint64_t v10 = sub_1000E2D80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v15 = (uint64_t *)((char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __chkstk_darwin(v13, v16);
  uint64_t v19 = (uint64_t *)((char *)&v40 - v18);
  uint64_t v20 = *(void *)(a6 - 8);
  uint64_t v22 = __chkstk_darwin(v17, v21);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v25);
  uint64_t v27 = (char *)&v40 - v26;
  uint64_t v44 = a7;
  uint64_t v28 = sub_1000E2070();
  __chkstk_darwin(v28, v29);
  uint64_t v31 = (char *)&v40 - v30;
  (*(void (**)(char *, uint64_t))(v32 + 16))((char *)&v40 - v30, v43);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v31, 1, a6) == 1)
  {
    *uint64_t v15 = (id)TUMakeNeighborhoodConduitError();
    swift_storeEnumTagMultiPayload();
    sub_1000D2498((uint64_t)v15, v45, v46);
    return (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v15, v10);
  }
  else
  {
    uint64_t v41 = v11;
    uint64_t v42 = v10;
    uint64_t v43 = a5;
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v34(v27, v31, a6);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v27, a6);
    uint64_t v35 = sub_1000E2C50();
    if (v35)
    {
      uint64_t v36 = v35;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v24, a6);
    }
    else
    {
      uint64_t v36 = swift_allocError();
      v34(v37, v24, a6);
    }
    uint64_t v39 = v41;
    uint64_t v38 = v42;
    *uint64_t v19 = v36;
    swift_storeEnumTagMultiPayload();
    sub_1000D2498((uint64_t)v19, v45, v46);
    (*(void (**)(uint64_t *, uint64_t))(v39 + 8))(v19, v38);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v27, a6);
  }
}

uint64_t sub_1000D2DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100004E3C(&qword_1001182E0);
  uint64_t v9 = sub_1000E2D80();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v15 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))((char *)&v15 - v12, a1, a5);
  swift_storeEnumTagMultiPayload();
  sub_1000D2498((uint64_t)v13, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t sub_1000D2F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E21D0();
  uint64_t v23 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E2200();
  uint64_t v21 = *(void *)(v8 - 8);
  uint64_t v22 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E1140();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12, v15);
  v20[1] = *(void *)(a1 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v12);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v17 + v16, (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  aBlock[4] = sub_1000D3718;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10005489C;
  aBlock[3] = &unk_10010E160;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  sub_1000E21F0();
  uint64_t v24 = _swiftEmptyArrayStorage;
  sub_1000D3EAC((unint64_t *)&qword_100117080, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004D9C(&qword_100116BF0);
  sub_10000AE60((unint64_t *)&qword_100117090, &qword_100116BF0);
  sub_1000E28C0();
  sub_1000E2770();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
  return swift_release();
}

uint64_t sub_1000D3298(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)(a1 + 24) + 16))
  {
    swift_bridgeObjectRetain();
    sub_100006444(a2);
    if (v5)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      sub_1000E20B0();
      return swift_release();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t NeighborhoodActivityPublisherService.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t NeighborhoodActivityPublisherService.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for NeighborhoodActivityPublisherService()
{
  return self;
}

uint64_t sub_1000D33B8()
{
  uint64_t v1 = sub_1000E2750();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E2720();
  __chkstk_darwin();
  sub_1000E2200();
  __chkstk_darwin();
  v6[0] = sub_1000D360C();
  sub_1000E21F0();
  v6[1] = &_swiftEmptyArrayStorage;
  sub_1000D3EAC(&qword_100116238, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004D9C(&qword_100116240);
  sub_10000AE60((unint64_t *)&qword_100116248, &qword_100116240);
  sub_1000E28C0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)(v0 + 16) = sub_1000E2780();
  *(void *)(v0 + 24) = sub_100004FB4((uint64_t)&_swiftEmptyArrayStorage);
  return v0;
}

unint64_t sub_1000D360C()
{
  unint64_t result = qword_100116230;
  if (!qword_100116230)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100116230);
  }
  return result;
}

uint64_t sub_1000D364C()
{
  uint64_t v1 = sub_1000E1140();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000D3718()
{
  uint64_t v1 = *(void *)(sub_1000E1140() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000D3298(v2, v3);
}

uint64_t sub_1000D377C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D378C()
{
  return swift_release();
}

uint64_t sub_1000D3794(uint64_t a1)
{
  return sub_1000D16D4(a1, v1[5], v1[6], v1[7], v1[2], v1[3], v1[4]);
}

uint64_t sub_1000D37A4()
{
  uint64_t v1 = sub_1000E1140();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  sub_100004E3C(&qword_1001182E0);
  uint64_t v6 = sub_1000E25B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();

  return _swift_deallocObject(v0, v11, v10);
}

uint64_t sub_1000D3930()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(sub_1000E1140() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = v5 + *(void *)(v4 + 64);
  sub_100004E3C(&qword_1001182E0);
  uint64_t v7 = *(void *)(sub_1000E25B0() - 8);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v0[5];
  uint64_t v10 = *(void *)((char *)v0 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000D1B7C(v9, (uint64_t)v0 + v5, (uint64_t)v0 + v8, v10, v1, v2, v3);
}

uint64_t sub_1000D3A64(uint64_t a1)
{
  uint64_t v2 = sub_100004D9C(&qword_100117C28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000D3AC8()
{
  uint64_t v1 = *(void *)(sub_1000E1140() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_100004E3C(&qword_1001182E0);
  sub_1000E25B0();
  uint64_t v3 = *(void *)(v0 + 40);

  return sub_1000D2850(v3, v0 + v2);
}

uint64_t sub_1000D3BD4(uint64_t a1)
{
  return sub_1000D3D80(a1, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t))sub_1000D29E4);
}

uint64_t sub_1000D3BF0()
{
  uint64_t v1 = sub_1000E1140();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  sub_100004E3C(&qword_1001182E0);
  uint64_t v6 = sub_1000E25B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_1000D3D68(uint64_t a1)
{
  return sub_1000D3D80(a1, (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t))sub_1000D2DBC);
}

uint64_t sub_1000D3D80(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *((void *)v2 + 2);
  uint64_t v5 = *((void *)v2 + 3);
  uint64_t v6 = *((void *)v2 + 4);
  uint64_t v7 = *(void *)(sub_1000E1140() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = v8 + *(void *)(v7 + 64);
  sub_100004E3C(&qword_1001182E0);
  uint64_t v10 = *(void *)(sub_1000E25B0() - 8);
  uint64_t v11 = *((void *)v2 + 5);
  uint64_t v12 = &v2[(v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)];

  return a2(a1, v11, &v2[v8], v12, v4, v5, v6);
}

uint64_t sub_1000D3EAC(unint64_t *a1, void (*a2)(uint64_t))
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

id (*sub_1000D3EFC(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = [v3 flags];
  return sub_1000D3F50;
}

id sub_1000D3F50(uint64_t a1)
{
  return [*(id *)a1 setFlags:*(unsigned int *)(a1 + 8)];
}

id sub_1000D3F68(uint64_t a1)
{
  return [*v1 setControlFlags:a1];
}

id (*sub_1000D3F7C(void *a1))(uint64_t a1)
{
  uint64_t v3 = *v1;
  a1[1] = *v1;
  *a1 = [v3 controlFlags];
  return sub_1000D3FD0;
}

id sub_1000D3FD0(uint64_t a1)
{
  return [*(id *)(a1 + 8) setControlFlags:*(void *)a1];
}

uint64_t sub_1000D3FE4()
{
  id v1 = [*v0 activeDevices];
  sub_1000D5138();
  uint64_t v2 = sub_1000E2520();

  return v2;
}

void sub_1000D403C(void *a1)
{
  [*v1 setDestinationDevice:a1];
}

void sub_1000D4084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1000D4098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_1000D40AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  unint64_t v8 = *v6;
  if (a1)
  {
    v10[4] = a1;
    v10[5] = a2;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_10001D678;
    void v10[3] = a5;
    unint64_t v9 = _Block_copy(v10);
    swift_release();
  }
  else
  {
    unint64_t v9 = 0;
  }
  objc_msgSend(v8, *a6, v9);
  _Block_release(v9);
}

id sub_1000D4158()
{
  return [*v0 invalidate];
}

uint64_t sub_1000D4168()
{
  uint64_t v2 = *v0;
  v1[2] = v1;
  v1[3] = sub_1000D425C;
  uint64_t v3 = swift_continuation_init();
  v1[10] = _NSConcreteStackBlock;
  v1[11] = 0x40000000;
  v1[12] = sub_10002F904;
  v1[13] = &unk_10010E4D8;
  v1[14] = v3;
  [v2 activateWithCompletion:v1 + 10];
  return _swift_continuation_await(v1 + 2);
}

uint64_t sub_1000D425C()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48)) {
    swift_willThrow();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

uint64_t sub_1000D4364(uint64_t a1, uint64_t a2, objc_class *a3, uint64_t a4, uint64_t a5)
{
  return sub_1000D4388(a1, a2, a3, a4, a5);
}

uint64_t sub_1000D4388(uint64_t a1, uint64_t a2, Class isa, uint64_t a4, uint64_t a5)
{
  NSString v9 = sub_1000E23E0();
  if (isa) {
    Class isa = sub_1000E2360().super.isa;
  }
  void v12[4] = a4;
  v12[5] = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1000D448C;
  v12[3] = &unk_10010E488;
  uint64_t v10 = _Block_copy(v12);
  swift_retain();
  [v5 registerRequestID:v9 options:isa handler:v10];
  _Block_release(v10);

  return swift_release();
}

uint64_t sub_1000D448C(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, objc_class *, uint64_t), uint64_t))(a1 + 32);
  uint64_t v7 = sub_1000E2370();
  if (a3) {
    a3 = sub_1000E2370();
  }
  unint64_t v8 = _Block_copy(a4);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_retain();
  v6(v7, a3, sub_1000D5130, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1000D459C(uint64_t a1, objc_class *a2, uint64_t a3, uint64_t a4)
{
  Class isa = a2;
  if (a1)
  {
    v7.super.Class isa = sub_1000E2360().super.isa;
    if (!isa) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v7.super.Class isa = 0;
  if (a2) {
LABEL_3:
  }
    Class isa = sub_1000E2360().super.isa;
LABEL_4:
  if (a3) {
    uint64_t v8 = sub_1000E0FB0();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  (*(void (**)(uint64_t, Class, Class))(a4 + 16))(a4, v7.super.isa, isa);
}

uint64_t sub_1000D4684(uint64_t a1, uint64_t a2, objc_class *a3, uint64_t a4, uint64_t a5)
{
  return sub_1000D46A8(a1, a2, a3, a4, a5);
}

uint64_t sub_1000D46A8(uint64_t a1, uint64_t a2, Class isa, uint64_t a4, uint64_t a5)
{
  NSString v9 = sub_1000E23E0();
  if (isa) {
    Class isa = sub_1000E2360().super.isa;
  }
  void v12[4] = a4;
  v12[5] = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1000D47AC;
  v12[3] = &unk_10010E460;
  uint64_t v10 = _Block_copy(v12);
  swift_retain();
  [v5 registerEventID:v9 options:isa handler:v10];
  _Block_release(v10);

  return swift_release();
}

uint64_t sub_1000D47AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v5 = sub_1000E2370();
  if (a3) {
    a3 = sub_1000E2370();
  }
  swift_retain();
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D4870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, objc_class *a6, uint64_t a7, uint64_t a8)
{
  return sub_1000D4894(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000D4894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, Class isa, uint64_t a7, uint64_t a8)
{
  NSString v12 = sub_1000E23E0();
  v13.super.Class isa = sub_1000E2360().super.isa;
  NSString v14 = sub_1000E23E0();
  if (isa) {
    Class isa = sub_1000E2360().super.isa;
  }
  v17[4] = a7;
  v17[5] = a8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_1000D49F8;
  v17[3] = &unk_10010E438;
  uint64_t v15 = _Block_copy(v17);
  swift_retain();
  [v8 sendRequestID:v12 request:v13.super.isa destinationID:v14 options:isa responseHandler:v15];
  _Block_release(v15);

  return swift_release();
}

uint64_t sub_1000D49F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_1000E2370();
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a3) {
LABEL_3:
  }
    uint64_t v5 = sub_1000E2370();
LABEL_4:
  swift_retain();
  id v8 = a4;
  v6(v7, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D4ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, objc_class *a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Class))((char *)&dword_1001197D0
                                                                                   + dword_1001197D0);
  NSDictionary v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *NSDictionary v13 = v6;
  v13[1] = sub_10000AFA4;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1000D4BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, Class isa)
{
  NSString v9 = (objc_class *)sub_1000E23E0();
  v7[15].super.Class isa = v9;
  v10.super.Class isa = sub_1000E2360().super.isa;
  v7[16].super.Class isa = v10.super.isa;
  uint64_t v11 = (objc_class *)sub_1000E23E0();
  v7[17].super.Class isa = v11;
  if (isa) {
    Class isa = sub_1000E2360().super.isa;
  }
  v7[18].super.Class isa = isa;
  v7[2].super.Class isa = (Class)v7;
  v7[3].super.Class isa = (Class)sub_1000D4D60;
  uint64_t v12 = swift_continuation_init();
  v7[10].super.Class isa = (Class)_NSConcreteStackBlock;
  v7[11].super.Class isa = (Class)0x40000000;
  v7[12].super.Class isa = (Class)sub_10002F904;
  v7[13].super.Class isa = (Class)&unk_10010E420;
  v7[14].super.Class isa = (Class)v12;
  [v6 sendEventID:v9 event:v10.super.isa destinationID:v11 options:isa completion:&v7[10]];
  return _swift_continuation_await(&v7[2]);
}

uint64_t sub_1000D4D60()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void **)(*v0 + 144);
  uint64_t v4 = *(void **)(*v0 + 136);
  uint64_t v5 = *(void **)(*v0 + 128);
  uint64_t v6 = *(void **)(*v0 + 120);
  if (*(void *)(v1 + 48)) {
    swift_willThrow();
  }

  uint64_t v7 = *(uint64_t (**)(void))(v2 + 8);
  return v7();
}

uint64_t sub_1000D4ED8()
{
  id v1 = [*v0 peerDeviceIdentifier];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1000E23F0();

  return v3;
}

void sub_1000D4F40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000B0888;
    v5[3] = &unk_10010E3F8;
    uint64_t v4 = _Block_copy(v5);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setDiscoverySessionStateChangedHandler:v4];
  _Block_release(v4);
}

uint64_t sub_1000D4FEC()
{
  uint64_t v2 = *v0;
  v1[2] = v1;
  v1[3] = sub_1000D5178;
  uint64_t v3 = swift_continuation_init();
  v1[10] = _NSConcreteStackBlock;
  v1[11] = 0x40000000;
  v1[12] = sub_10002F904;
  v1[13] = &unk_10010E3E0;
  v1[14] = v3;
  [v2 activateWithCompletion:v1 + 10];
  return _swift_continuation_await(v1 + 2);
}

uint64_t sub_1000D50E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D50F0()
{
  return swift_release();
}

uint64_t sub_1000D50F8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000D5130(uint64_t a1, objc_class *a2, uint64_t a3)
{
  sub_1000D459C(a1, a2, a3, *(void *)(v3 + 16));
}

unint64_t sub_1000D5138()
{
  unint64_t result = qword_100116EA8;
  if (!qword_100116EA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100116EA8);
  }
  return result;
}

void sub_1000D51A4()
{
  sub_1000D51E0(0xD000000000000025, 0x80000001000EAA90, 15.0);
  qword_1001197D8 = v0;
}

void sub_1000D51E0(uint64_t a1, unint64_t a2, double a3)
{
  id v6 = [self sharedInstance];
  if (v6)
  {
    uint64_t v7 = v6;
    NSString v8 = sub_1000E23E0();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      sub_1000E28B0();
      swift_unknownObjectRelease();
      sub_100006598(v22, v23);
    }
    else
    {
      memset(v23, 0, sizeof(v23));
    }
    sub_100004D9C(&qword_100117188);
    if (swift_dynamicCast())
    {
      uint64_t v10 = *(void *)&v22[0];
      sub_1000D5A14();
      swift_bridgeObjectRetain_n();
      uint64_t v11 = sub_1000E2860();
      os_log_type_t v12 = sub_1000E2700();
      if (!os_log_type_enabled(v11, v12))
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_14;
      }
      uint64_t v13 = swift_slowAlloc();
      *(void *)&v23[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)&v22[0] = sub_1000DACC8(a1, a2, (uint64_t *)v23);
      sub_1000E2880();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2080;
      *(void *)&v22[0] = v10;
      uint64_t v14 = sub_1000E2420();
      *(void *)&v22[0] = sub_1000DACC8(v14, v15, (uint64_t *)v23);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      uint64_t v16 = "Got %s from server bag with a value of: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v16, (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
LABEL_14:

      return;
    }
    if (qword_1001161D0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1000E2030();
    sub_10000AD90(v17, (uint64_t)qword_10011BFC0);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_1000E2010();
    os_log_type_t v12 = sub_1000E2700();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      *(void *)&v22[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)&v23[0] = a1;
      *((void *)&v23[0] + 1) = a2;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1000E2420();
      *(void *)&v23[0] = sub_1000DACC8(v18, v19, (uint64_t *)v22);
      sub_1000E2880();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      *(double *)uint64_t v23 = a3;
      uint64_t v20 = sub_1000E2420();
      *(void *)&v23[0] = sub_1000DACC8(v20, v21, (uint64_t *)v22);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      uint64_t v16 = "Server bag does not have a value for %s, so returning the default one of %s seconds.";
      goto LABEL_12;
    }

    swift_bridgeObjectRelease_n();
  }
  else
  {
    __break(1u);
  }
}

id sub_1000D55DC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v7 = result;
    NSString v8 = sub_1000E23E0();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      sub_1000E28B0();
      swift_unknownObjectRelease();
      sub_100006598(v21, v22);
    }
    else
    {
      memset(v22, 0, sizeof(v22));
    }
    sub_100004D9C(&qword_100117188);
    if (swift_dynamicCast())
    {
      a3 = *(void *)&v21[0];
      sub_1000D5A14();
      swift_bridgeObjectRetain_n();
      uint64_t v10 = sub_1000E2860();
      os_log_type_t v11 = sub_1000E2700();
      if (!os_log_type_enabled(v10, v11))
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_14;
      }
      uint64_t v12 = swift_slowAlloc();
      *(void *)&v22[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)&v21[0] = sub_1000DACC8(a1, a2, (uint64_t *)v22);
      sub_1000E2880();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      *(void *)&v21[0] = a3;
      uint64_t v13 = sub_1000E2420();
      *(void *)&v21[0] = sub_1000DACC8(v13, v14, (uint64_t *)v22);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      unint64_t v15 = "Got %s from server bag with a value of: %s";
    }
    else
    {
      if (qword_1001161D0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1000E2030();
      sub_10000AD90(v16, (uint64_t)qword_10011BFC0);
      swift_bridgeObjectRetain_n();
      uint64_t v10 = sub_1000E2010();
      os_log_type_t v11 = sub_1000E2700();
      if (!os_log_type_enabled(v10, v11))
      {

        swift_bridgeObjectRelease_n();
        return (id)a3;
      }
      uint64_t v12 = swift_slowAlloc();
      *(void *)&v21[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      *(void *)&v22[0] = a1;
      *((void *)&v22[0] + 1) = a2;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1000E2420();
      *(void *)&v22[0] = sub_1000DACC8(v17, v18, (uint64_t *)v21);
      sub_1000E2880();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      *(void *)&v22[0] = a3;
      uint64_t v19 = sub_1000E2420();
      *(void *)&v22[0] = sub_1000DACC8(v19, v20, (uint64_t *)v21);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      unint64_t v15 = "Server bag does not have a value for %s, so returning the default one of %s seconds.";
    }
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v15, (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_14:

    return (id)a3;
  }
  __break(1u);
  return result;
}

id sub_1000D59D8()
{
  id result = sub_1000D55DC(0xD00000000000001ELL, 0x80000001000EAAC0, 5);
  qword_1001197E0 = (uint64_t)result;
  return result;
}

unint64_t sub_1000D5A14()
{
  unint64_t result = qword_1001197E8;
  if (!qword_1001197E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1001197E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationServerBag()
{
  return &type metadata for ConversationServerBag;
}

uint64_t sub_1000D5A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  uint64_t v7 = sub_1000E1AB0();
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for HandoffState(0);
  v6[12] = v8;
  v6[13] = *(void *)(v8 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  sub_100004D9C(&qword_1001182D0);
  v6[16] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for HandoffInfo(0);
  v6[17] = v9;
  v6[18] = *(void *)(v9 - 8);
  v6[19] = swift_task_alloc();
  if (qword_1001161A0 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10011BF88;
  v6[20] = qword_10011BF88;
  return _swift_task_switch(sub_1000D5C58, v10, 0);
}

uint64_t sub_1000D5C58()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[6] + OBJC_IVAR___CSDNeighborhoodActivityConduit_handoffState;
  swift_beginAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1))
  {
    uint64_t v4 = v0[16];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[18] + 56))(v4, 1, 1, v0[17]);
    sub_1000D7274(v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    sub_1000155E4(v3, v0[15]);
    return _swift_task_switch(sub_1000D5DB0, 0, 0);
  }
}

uint64_t sub_1000D5DB0()
{
  sub_1000155E4(v0[15], v0[14]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100051DC0(v0[14], v0[16]);
    v0[24] = 0;
    uint64_t v1 = v0[20];
    sub_1000D738C(v0[15], type metadata accessor for HandoffState);
    return _swift_task_switch(sub_1000D6200, v1, 0);
  }
  else
  {
    uint64_t v2 = *(void *)v0[14];
    v0[21] = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[22] = (uint64_t)v3;
    uint64_t v4 = sub_100004D9C(&qword_1001182E0);
    *uint64_t v3 = v0;
    v3[1] = sub_1000D5EFC;
    uint64_t v5 = v0[16];
    uint64_t v6 = v0[17];
    return Task.value.getter(v5, v2, v6, v4, &protocol self-conformance witness table for Error);
  }
}

uint64_t sub_1000D5EFC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000D60A0;
  }
  else {
    uint64_t v2 = sub_1000D6010;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000D6010()
{
  swift_release();
  v0[24] = v0[23];
  uint64_t v1 = v0[20];
  sub_1000D738C(v0[15], type metadata accessor for HandoffState);
  return _swift_task_switch(sub_1000D6200, v1, 0);
}

uint64_t sub_1000D60A0()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 120);
  swift_release();
  swift_errorRelease();
  sub_1000D738C(v2, type metadata accessor for HandoffState);
  return _swift_task_switch(sub_1000D613C, v1, 0);
}

uint64_t sub_1000D613C()
{
  uint64_t v1 = v0[16];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[18] + 56))(v1, 1, 1, v0[17]);
  sub_1000D7274(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1000D6200()
{
  uint64_t v30 = v0;
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, uint64_t, void))(*(void *)(v0 + 144) + 56))(v3, 0, 1, *(void *)(v0 + 136));
  sub_100051DC0(v3, v2);
  id v4 = [*(id *)(v1 + OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationManager) activityAuthorizedBundleIdentifiers];
  sub_1000D72D4();
  uint64_t v5 = sub_1000E2370();

  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t v6 = *(void *)(v0 + 64);
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_1000064DC(v7, v6);
    if (v9)
    {
      id v10 = *(id *)(*(void *)(v5 + 56) + 8 * v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v11 = [v10 BOOLValue];

      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unsigned int v11 = 0;
LABEL_7:
  if (qword_1001161D0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000E2030();
  sub_10000AD90(v12, (uint64_t)qword_10011BFC0);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_1000E2010();
  os_log_type_t v14 = sub_1000E26D0();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v16 = *(void *)(v0 + 64);
  if (v15)
  {
    uint64_t v17 = *(void *)(v0 + 56);
    uint64_t v18 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 40) = sub_1000DACC8(v17, v16, &v29);
    sub_1000E2880();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 1024;
    *(_DWORD *)(v0 + 232) = v11;
    sub_1000E2880();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Sending updated policy for %s: %{BOOL}d", (uint8_t *)v18, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v19 = *(void *)(v0 + 152);
  uint64_t v20 = *(void *)(v0 + 64);
  uint64_t v21 = *(void *)(v0 + 56);
  uint64_t v22 = swift_task_alloc();
  *(void *)(v22 + 16) = v21;
  *(void *)(v22 + 24) = v20;
  *(unsigned char *)(v22 + 32) = v11;
  sub_1000D7334();
  sub_1000E1210();
  swift_task_dealloc();
  uint64_t v23 = *(void *)(v19 + 8);
  uint64_t v24 = *(void *)(v19 + 16);
  *(void *)(v0 + 200) = v24;
  uint64_t v25 = qword_100116188;
  swift_bridgeObjectRetain();
  if (v25 != -1) {
    swift_once();
  }
  *(void *)(v0 + 208) = qword_10011BF78;
  uint64_t v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_1000D6624;
  uint64_t v27 = *(void *)(v0 + 88);
  return sub_1000AEC50(6, v27, v23, v24, 0);
}

uint64_t sub_1000D6624()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 208);
  if (v0) {
    id v4 = sub_1000D688C;
  }
  else {
    id v4 = sub_1000D6750;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000D6750()
{
  uint64_t v1 = v0[20];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000D67D8, v1, 0);
}

uint64_t sub_1000D67D8()
{
  sub_1000D738C(*(void *)(v0 + 152), type metadata accessor for HandoffInfo);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000D688C()
{
  uint64_t v1 = v0[20];
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000D6914, v1, 0);
}

uint64_t sub_1000D6914()
{
  sub_1000D738C(*(void *)(v0 + 152), type metadata accessor for HandoffInfo);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000D69D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_100004D9C(&qword_1001197F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000EDF60;
  *(void *)(inited + 32) = a2;
  *(void *)(inited + 40) = a3;
  *(unsigned char *)(inited + 48) = a4;
  swift_bridgeObjectRetain();
  sub_100005CF4(inited);
  return sub_1000E1AA0();
}

uint64_t sub_1000D6A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = sub_1000E1AB0();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  if (qword_1001161A0 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_10011BF88;
  v6[9] = qword_10011BF88;
  return _swift_task_switch(sub_1000D6B60, v8, 0);
}

uint64_t sub_1000D6B60()
{
  uint64_t v22 = v0;
  id v1 = [*(id *)(v0[3] + OBJC_IVAR___CSDNeighborhoodActivityConduit_conversationManager) activityAuthorizedBundleIdentifiers];
  sub_1000D72D4();
  uint64_t v2 = sub_1000E2370();

  uint64_t v3 = sub_1000D73EC(v2);
  swift_bridgeObjectRelease();
  if (v3[2])
  {
    if (qword_1001161D0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1000E2030();
    sub_10000AD90(v4, (uint64_t)qword_10011BFC0);
    swift_retain_n();
    uint64_t v5 = sub_1000E2010();
    os_log_type_t v6 = sub_1000E26D0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_retain();
      uint64_t v8 = sub_1000E2380();
      unint64_t v10 = v9;
      swift_release();
      v0[2] = sub_1000DACC8(v8, v10, &v21);
      sub_1000E2880();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Sending policy infos: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    uint64_t v17 = v0[5];
    *(void *)(swift_task_alloc() + 16) = v3;
    sub_1000D7334();
    sub_1000E1210();
    swift_release();
    swift_task_dealloc();
    if (qword_100116188 != -1) {
      swift_once();
    }
    v0[10] = qword_10011BF78;
    uint64_t v18 = (void *)swift_task_alloc();
    v0[11] = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_1000D6FF0;
    uint64_t v19 = v0[8];
    uint64_t v20 = v0[4];
    return sub_1000AEC50(6, v19, v20, v17, 0);
  }
  else
  {
    swift_release();
    if (qword_1001161D0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000E2030();
    sub_10000AD90(v11, (uint64_t)qword_10011BFC0);
    uint64_t v12 = sub_1000E2010();
    os_log_type_t v13 = sub_1000E26C0();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "No policy info to send, skipping", v14, 2u);
      swift_slowDealloc();
    }

    swift_task_dealloc();
    BOOL v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

uint64_t sub_1000D6FF0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v4 = sub_1000D7198;
  }
  else {
    uint64_t v4 = sub_1000D711C;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000D711C()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  id v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000D7198()
{
  uint64_t v1 = v0[9];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  return _swift_task_switch(sub_1000D7210, v1, 0);
}

uint64_t sub_1000D7210()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000D7274(uint64_t a1)
{
  uint64_t v2 = sub_100004D9C(&qword_1001182D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000D72D4()
{
  unint64_t result = qword_100116508;
  if (!qword_100116508)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100116508);
  }
  return result;
}

uint64_t sub_1000D7314(uint64_t a1)
{
  return sub_1000D69D4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

unint64_t sub_1000D7334()
{
  unint64_t result = qword_1001192E8;
  if (!qword_1001192E8)
  {
    sub_1000E1AB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001192E8);
  }
  return result;
}

uint64_t sub_1000D738C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1000D73EC(uint64_t a1)
{
  sub_100004D9C((uint64_t *)&unk_1001164F0);
  unint64_t result = (void *)sub_1000E2B80();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v23 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  unint64_t v9 = (char *)(result + 8);
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    BOOL v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    unint64_t result = [v18 BOOLValue];
    *(void *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    uint64_t v19 = (void *)(v3[6] + 16 * i);
    *uint64_t v19 = v17;
    v19[1] = v16;
    *(unsigned char *)(v3[7] + i) = (_BYTE)result;
    uint64_t v20 = v3[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v22;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v24) {
      return v3;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v24) {
        return v3;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v24) {
          return v3;
        }
        unint64_t v13 = *(void *)(v23 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v24) {
    return v3;
  }
  unint64_t v13 = *(void *)(v23 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v24) {
      return v3;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1000D75F0()
{
  return sub_1000E1AA0();
}

char *sub_1000D7628(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = *((void *)a2 + 2);
      *((void *)a1 + 1) = *((void *)a2 + 1);
      *((void *)a1 + 2) = v6;
      uint64_t v7 = (int *)type metadata accessor for HandoffInfo(0);
      uint64_t v8 = v7[6];
      unint64_t v9 = &a1[v8];
      unint64_t v10 = &a2[v8];
      uint64_t v11 = sub_1000E1140();
      int64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
      swift_bridgeObjectRetain();
      v12(v9, v10, v11);
      v12(&a1[v7[7]], &a2[v7[7]], v11);
      *(void *)&a1[v7[8]] = *(void *)&a2[v7[8]];
      uint64_t v13 = v7[9];
      int64_t v14 = *(void **)&a2[v13];
      *(void *)&a1[v13] = v14;
      *(void *)&a1[v7[10]] = *(void *)&a2[v7[10]];
      swift_retain();
      id v15 = v14;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for HandoffInfo(uint64_t a1)
{
  return sub_100007280(a1, qword_100119908);
}

uint64_t sub_1000D77E4(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = (int *)type metadata accessor for HandoffInfo(0);
    uint64_t v3 = a1 + v2[6];
    uint64_t v4 = sub_1000E1140();
    int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    v5(v3, v4);
    v5(a1 + v2[7], v4);
    swift_release();

    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000D78E8(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v4 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v4;
    int v5 = (int *)type metadata accessor for HandoffInfo(0);
    uint64_t v6 = v5[6];
    uint64_t v7 = a1 + v6;
    uint64_t v8 = a2 + v6;
    uint64_t v9 = sub_1000E1140();
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
    v10(a1 + v5[7], a2 + v5[7], v9);
    *(void *)(a1 + v5[8]) = *(void *)(a2 + v5[8]);
    uint64_t v11 = v5[9];
    int64_t v12 = *(void **)(a2 + v11);
    *(void *)(a1 + v11) = v12;
    *(void *)(a1 + v5[10]) = *(void *)(a2 + v5[10]);
    swift_retain();
    id v13 = v12;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1000D7A2C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1000D738C(a1, type metadata accessor for HandoffState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v4 = (int *)type metadata accessor for HandoffInfo(0);
      uint64_t v5 = v4[6];
      uint64_t v6 = a1 + v5;
      uint64_t v7 = a2 + v5;
      uint64_t v8 = sub_1000E1140();
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
      swift_bridgeObjectRetain();
      v9(v6, v7, v8);
      v9(a1 + v4[7], a2 + v4[7], v8);
      *(void *)(a1 + v4[8]) = *(void *)(a2 + v4[8]);
      uint64_t v10 = v4[9];
      uint64_t v11 = *(void **)(a2 + v10);
      *(void *)(a1 + v10) = v11;
      *(void *)(a1 + v4[10]) = *(void *)(a2 + v4[10]);
      swift_retain();
      id v12 = v11;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for HandoffState(uint64_t a1)
{
  return sub_100007280(a1, qword_100119878);
}

char *sub_1000D7BBC(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    uint64_t v6 = (int *)type metadata accessor for HandoffInfo(0);
    uint64_t v7 = v6[6];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = sub_1000E1140();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
    v11(v8, v9, v10);
    v11(&a1[v6[7]], &a2[v6[7]], v10);
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    *(void *)&a1[v6[9]] = *(void *)&a2[v6[9]];
    *(void *)&a1[v6[10]] = *(void *)&a2[v6[10]];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_1000D7CF8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000D738C((uint64_t)a1, type metadata accessor for HandoffState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      uint64_t v6 = (int *)type metadata accessor for HandoffInfo(0);
      uint64_t v7 = v6[6];
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = sub_1000E1140();
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
      v11(v8, v9, v10);
      v11(&a1[v6[7]], &a2[v6[7]], v10);
      *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
      *(void *)&a1[v6[9]] = *(void *)&a2[v6[9]];
      *(void *)&a1[v6[10]] = *(void *)&a2[v6[10]];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000D7E58()
{
  uint64_t result = type metadata accessor for HandoffInfo(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_1000D7EF0(char *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000E1140();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[7]], (char *)a2 + a3[7], v11);
    uint64_t v13 = a3[9];
    *(void *)&v4[a3[8]] = *(uint64_t *)((char *)a2 + a3[8]);
    int64_t v14 = *(void **)((char *)a2 + v13);
    *(void *)&v4[v13] = v14;
    *(void *)&v4[a3[10]] = *(uint64_t *)((char *)a2 + a3[10]);
    swift_retain();
    id v15 = v14;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1000D803C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_1000E1140();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[7], v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D8104(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000E1140();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  uint64_t v12 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v13 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v13;
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_retain();
  id v14 = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000D8200(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000E1140();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(a1 + a3[7], a2 + a3[7], v9);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  uint64_t v11 = a3[9];
  uint64_t v12 = *(void **)(a2 + v11);
  uint64_t v13 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = v12;
  id v14 = v12;

  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000D8324(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000E1140();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[7], a2 + a3[7], v9);
  uint64_t v11 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1000D8400(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000E1140();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  uint64_t v12 = a3[9];
  uint64_t v13 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);

  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000D8500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D8514);
}

uint64_t sub_1000D8514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000E1140();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000D85C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D85D8);
}

uint64_t sub_1000D85D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000E1140();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000D8680()
{
  uint64_t result = sub_1000E1140();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000D874C()
{
  v1[3] = v0;
  sub_100004D9C((uint64_t *)&unk_1001170B0);
  v1[4] = swift_task_alloc();
  type metadata accessor for HandoffInfo(0);
  v1[5] = swift_task_alloc();
  v1[6] = type metadata accessor for HandoffState(0);
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000D883C, 0, 0);
}

uint64_t sub_1000D883C()
{
  sub_1000155E4(v0[3], v0[7]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = v0[4];
    uint64_t v1 = v0[5];
    sub_100051DC0(v0[7], v1);
    uint64_t v4 = *(void *)(v1 + 8);
    uint64_t v3 = *(void *)(v1 + 16);
    uint64_t v5 = sub_1000E25E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    uint64_t v6 = qword_100116188;
    swift_bridgeObjectRetain();
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[4];
    uint64_t v8 = qword_10011BF78;
    uint64_t v9 = sub_1000D91C0(&qword_100119090, (void (*)(uint64_t))type metadata accessor for ConduitDeviceActor);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v8;
    void v10[3] = v9;
    v10[4] = v4;
    v10[5] = v3;
    swift_retain();
    uint64_t v11 = sub_1000A8484(v7, (uint64_t)&unk_100119968, (uint64_t)v10);
    v0[8] = v11;
    uint64_t v12 = (void *)swift_task_alloc();
    v0[9] = v12;
    uint64_t v13 = sub_100004D9C(&qword_1001193F8);
    void *v12 = v0;
    v12[1] = sub_1000D8AB0;
    return Task<>.value.getter(v0 + 2, v11, v13);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v14 = (uint64_t (*)(void))v0[1];
    return v14(0);
  }
}

uint64_t sub_1000D8AB0()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1000D8BC8, 0, 0);
}

uint64_t sub_1000D8BC8()
{
  uint64_t v1 = v0[2];
  sub_1000D738C(v0[5], type metadata accessor for HandoffInfo);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_1000D8C68(char a1)
{
  if (a1) {
    return 0x616E7567616C2ELL;
  }
  else {
    return 0x65736E617078652ELL;
  }
}

uint64_t sub_1000D8CA0()
{
  return sub_1000D8C68(*v0);
}

uint64_t sub_1000D8CA8()
{
  sub_1000E2A60(64);
  v6._object = (void *)0x80000001000EAB20;
  v6._countAndFlagsBits = 0xD000000000000012;
  sub_1000E2450(v6);
  if (*(unsigned char *)v0) {
    v1._countAndFlagsBits = 0x616E7567616C2ELL;
  }
  else {
    v1._countAndFlagsBits = 0x65736E617078652ELL;
  }
  if (*(unsigned char *)v0) {
    uint64_t v2 = (void *)0xE700000000000000;
  }
  else {
    uint64_t v2 = (void *)0xE800000000000000;
  }
  v1._object = v2;
  sub_1000E2450(v1);
  swift_bridgeObjectRelease();
  v7._object = (void *)0x80000001000EAB40;
  v7._countAndFlagsBits = 0xD000000000000012;
  sub_1000E2450(v7);
  type metadata accessor for HandoffInfo(0);
  sub_1000E1140();
  sub_1000D91C0(&qword_100118340, (void (*)(uint64_t))&type metadata accessor for UUID);
  v8._countAndFlagsBits = sub_1000E2C30();
  sub_1000E2450(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0xD000000000000015;
  v9._object = (void *)0x80000001000EAB60;
  sub_1000E2450(v9);
  uint64_t v4 = *(void *)(v0 + 8);
  uint64_t v3 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v4;
  v10._object = v3;
  sub_1000E2450(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 62;
  v11._object = (void *)0xE100000000000000;
  sub_1000E2450(v11);
  return 0;
}

unint64_t sub_1000D8E50()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000014;
  uint64_t v3 = type metadata accessor for HandoffInfo(0);
  __chkstk_darwin(v3 - 8, v4);
  Swift::String v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for HandoffState(0);
  __chkstk_darwin(v7, v8);
  Swift::String v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000155E4(v1, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100051DC0((uint64_t)v10, (uint64_t)v6);
    unint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
    sub_1000E2A60(23);
    swift_bridgeObjectRelease();
    unint64_t v12 = 0xD000000000000014;
    unint64_t v13 = 0x80000001000EAAE0;
    v14._countAndFlagsBits = sub_1000D8CA8();
    sub_1000E2450(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 41;
    v15._object = (void *)0xE100000000000000;
    sub_1000E2450(v15);
    unint64_t v2 = v12;
    sub_1000D738C((uint64_t)v6, type metadata accessor for HandoffInfo);
  }
  else
  {
    swift_release();
  }
  return v2;
}

uint64_t sub_1000D8FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  if (qword_100116188 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_10011BF78;
  return _swift_task_switch(sub_1000D9088, v6, 0);
}

uint64_t sub_1000D9088()
{
  if (qword_100116190 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = qword_10011BF80;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v1;
  *(unsigned char *)(v5 + 32) = 0;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_10002E60C(sub_10002A5B0, v5, v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v6)
  {
    uint64_t v7 = sub_10000C770();
    swift_release();
  }
  else
  {
    uint64_t v7 = 0;
  }
  **(void **)(v0 + 40) = v7;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1000D91C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000D9208()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000D9248(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000AFA4;
  return sub_1000D8FEC(a1, v4, v5, v7, v6);
}

unsigned char *storeEnumTagSinglePayload for HandoffType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000D93D4);
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

ValueMetadata *type metadata accessor for HandoffType()
{
  return &type metadata for HandoffType;
}

unint64_t sub_1000D9410()
{
  unint64_t result = qword_100119970;
  if (!qword_100119970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100119970);
  }
  return result;
}

id sub_1000D9464()
{
  uint64_t v1 = sub_1000E1960();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E19B0();
  id v6 = [v0 identifier];
  sub_1000E23F0();

  sub_1000E1970();
  id v7 = [v0 localizedDisplayName];
  sub_1000E23F0();

  sub_1000E1980();
  id v8 = [v0 label];
  if (v8)
  {
    uint64_t v9 = v8;
    sub_1000E23F0();
  }
  sub_1000E19A0();
  id result = [v0 type];
  if (result == (id)1)
  {
    Swift::String v11 = (unsigned int *)&enum case for NCProtoContactHandleAnonym.AnonymType.phoneNumber(_:);
  }
  else
  {
    if (result != (id)2) {
      return result;
    }
    Swift::String v11 = (unsigned int *)&enum case for NCProtoContactHandleAnonym.AnonymType.emailAddress(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *v11, v1);
  return (id)sub_1000E1990();
}

id sub_1000D9634(void *a1, void *a2)
{
  id v4 = [a1 contactProperty];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [v4 contact];
    [v6 mutableCopy];
    sub_1000E28B0();
    swift_unknownObjectRelease();
    sub_1000D9AF4();
    swift_dynamicCast();
    sub_100004D9C(&qword_100118F58);
    Class isa = sub_1000E2510().super.isa;
    [v15 setPhoneNumbers:isa];

    Class v8 = sub_1000E2510().super.isa;
    [v15 setEmailAddresses:v8];

    id v9 = [v5 contact];
    NSString v10 = [v9 identifier];

    if (!v10)
    {
      sub_1000E23F0();
      NSString v10 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    id v11 = [a1 actionType];
    NSString v12 = [a1 bundleIdentifier];
    if (!v12)
    {
      sub_1000E23F0();
      NSString v12 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithContact:v15 contactIdentifier:v10 anonym:a2 actionType:v11 bundleIdentifier:v12];
  }
  else
  {

    return 0;
  }
  return v13;
}

uint64_t sub_1000D9874(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1000E19C0();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v5 = sub_1000E1430();
  __chkstk_darwin(v5, v6);
  id v12 = [a2 contact];
  sub_1000D9A9C();
  sub_1000E1210();

  sub_1000E1870();
  id v7 = [a2 contactIdentifier];
  sub_1000E23F0();

  sub_1000E1890();
  id v8 = [a2 anonym];
  sub_1000D9464();

  sub_1000E18A0();
  id v9 = [a2 actionType];
  sub_1000E23F0();

  sub_1000E1860();
  id v10 = [a2 bundleIdentifier];
  sub_1000E23F0();

  return sub_1000E1880();
}

unint64_t sub_1000D9A9C()
{
  unint64_t result = qword_100118F40;
  if (!qword_100118F40)
  {
    sub_1000E1430();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100118F40);
  }
  return result;
}

unint64_t sub_1000D9AF4()
{
  unint64_t result = qword_100118F60;
  if (!qword_100118F60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100118F60);
  }
  return result;
}

void sub_1000D9B34(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1000E2900();
    sub_100006C20(0, (unint64_t *)&unk_100118EE0);
    sub_1000DCDCC();
    sub_1000E26A0();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  uint64_t v16 = v2;
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v8)
    {
      unint64_t v14 = *(void *)(v17 + 8 * v13);
      uint64_t v11 = v3 + 1;
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v11);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            if (objc_msgSend(v12, "state", v16) == (id)3) {
              break;
            }

            uint64_t v3 = v11;
            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!sub_1000E2990()) {
              break;
            }
            sub_100006C20(0, (unint64_t *)&unk_100118EE0);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v12 = v23;
            swift_unknownObjectRelease();
            uint64_t v11 = v3;
            uint64_t v9 = v4;
          }
          while (v23);
        }
        goto LABEL_33;
      }
      uint64_t v11 = v3 + 5;
      if (v3 + 5 < v8)
      {
        unint64_t v14 = *(void *)(v17 + 8 * v11);
        if (!v14)
        {
          uint64_t v15 = v3 + 6;
          while (v8 != v15)
          {
            unint64_t v14 = *(void *)(v17 + 8 * v15++);
            if (v14)
            {
              uint64_t v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_10001499C();
    return;
  }
  __break(1u);
}

uint64_t sub_1000D9DF8()
{
  uint64_t v0 = sub_1000E2030();
  sub_1000CADBC(v0, qword_100119980);
  sub_10000AD90(v0, (uint64_t)qword_100119980);
  return sub_1000E2020();
}

id sub_1000D9E7C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ConversationPublishers()) init];
  qword_10011C058 = (uint64_t)result;
  return result;
}

char *sub_1000D9EAC()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_1000E21E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationJoinedSubject;
  sub_100004D9C((uint64_t *)&unk_100119A00);
  swift_allocObject();
  int64_t v8 = v0;
  *(void *)&v0[v7] = sub_1000E20F0();
  uint64_t v9 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationLeftSubject;
  swift_allocObject();
  *(void *)&v8[v9] = sub_1000E20F0();
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_1000E2B70()) {
    sub_1000DC388((unint64_t)_swiftEmptyArrayStorage, &qword_100118F00, (unint64_t *)&unk_100118EE0);
  }
  else {
    unint64_t v10 = &_swiftEmptySetSingleton;
  }
  uint64_t v11 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_activeConversationsSubject;
  uint64_t v26 = v10;
  sub_100004D9C(&qword_1001186E8);
  swift_allocObject();
  *(void *)&v8[v11] = sub_1000E2120();
  uint64_t v12 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_joinedConversationSubject;
  uint64_t v26 = 0;
  sub_100004D9C(&qword_100118400);
  swift_allocObject();
  *(void *)&v8[v12] = sub_1000E2120();
  uint64_t v13 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager;
  id v14 = [self sharedInstance];
  id v15 = [v14 conversationManager];

  *(void *)&v8[v13] = v15;
  v25.receiver = v8;
  v25.super_class = ObjectType;
  uint64_t v16 = (char *)objc_msgSendSuper2(&v25, "init");
  uint64_t v17 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager;
  uint64_t v18 = *(void **)&v16[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager];
  sub_100006C20(0, (unint64_t *)&qword_100116230);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for DispatchQoS.QoSClass.userInteractive(_:), v2);
  uint64_t v19 = v16;
  id v20 = v18;
  uint64_t v21 = (void *)sub_1000E2790();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  [v20 addDelegate:v19 queue:v21];

  id v22 = *(id *)&v16[v17];
  [v22 registerWithCompletionHandler:0];

  return v19;
}

uint64_t type metadata accessor for ConversationPublishers()
{
  return self;
}

void sub_1000DA288(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v74 = sub_1000E1140();
  uint64_t v4 = *(void *)(v74 - 8);
  __chkstk_darwin(v74, v5);
  uint64_t v7 = (char *)v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E2030();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [a1 activeConversations];
  uint64_t v14 = sub_100006C20(0, (unint64_t *)&unk_100118EE0);
  sub_1000DCDCC();
  uint64_t v71 = v14;
  uint64_t v15 = sub_1000E2660();

  sub_1000D9B34(v15);
  uint64_t v17 = v16;
  if (qword_100116220 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_10000AD90(v8, (uint64_t)qword_100119980);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v18, v8);
  id v19 = v17;
  swift_bridgeObjectRetain_n();
  id v20 = v19;
  uint64_t v21 = sub_1000E2010();
  int v73 = sub_1000E2700();
  if (!os_log_type_enabled(v21, (os_log_type_t)v73))
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
LABEL_34:
    uint64_t v78 = v15;
    sub_1000E2100();
    swift_bridgeObjectRelease();
    uint64_t v78 = (uint64_t)v17;
    sub_1000E2100();

    return;
  }
  uint64_t v69 = v9;
  id v70 = v20;
  uint64_t v72 = v17;
  uint64_t v68 = v12;
  id v22 = (_DWORD *)swift_slowAlloc();
  uint64_t v65 = swift_slowAlloc();
  v84[0] = v65;
  unint64_t v66 = v22;
  _DWORD *v22 = 136315394;
  unint64_t v77 = v15 & 0xC000000000000001;
  os_log_t v67 = v21;
  if ((v15 & 0xC000000000000001) != 0) {
    uint64_t v23 = sub_1000E2950();
  }
  else {
    uint64_t v23 = *(void *)(v15 + 16);
  }
  uint64_t v24 = v74;
  if (!v23)
  {
LABEL_30:
    uint64_t v54 = v66;
    uint64_t v55 = sub_1000E2530();
    unint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_1000DACC8(v55, v57, v84);
    sub_1000E2880();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v54 + 6) = 2080;
    id v20 = v70;
    if (v72)
    {
      uint64_t v78 = (uint64_t)v70;
      id v58 = v70;
      uint64_t v59 = sub_1000E2420();
      unint64_t v61 = v60;
    }
    else
    {
      unint64_t v61 = 0xE300000000000000;
      uint64_t v59 = 7104878;
    }
    os_log_type_t v62 = v73;
    uint64_t v78 = sub_1000DACC8(v59, v61, v84);
    sub_1000E2880();

    swift_bridgeObjectRelease();
    os_log_t v63 = v67;
    _os_log_impl((void *)&_mh_execute_header, v67, v62, "Conversations changed with active conversations: %s, joinedConversation: %s", (uint8_t *)v54, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v8);
    uint64_t v17 = v72;
    goto LABEL_34;
  }
  char v83 = _swiftEmptyArrayStorage;
  sub_1000DB2B8(0, v23 & ~(v23 >> 63), 0);
  if (v77)
  {
    uint64_t v25 = sub_1000E28F0();
    char v27 = 1;
  }
  else
  {
    uint64_t v25 = sub_1000DBE70(v15);
    char v27 = v28 & 1;
  }
  uint64_t v80 = v25;
  uint64_t v81 = v26;
  char v82 = v27;
  if ((v23 & 0x8000000000000000) == 0)
  {
    v64[0] = v8;
    v64[1] = v2;
    uint64_t v29 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v30 = v15 & 0xFFFFFFFFFFFFFF8;
    if (v15 < 0) {
      uint64_t v30 = v15;
    }
    uint64_t v75 = v30;
    uint64_t v76 = v15;
    do
    {
      while (1)
      {
        sub_1000DBB84(v80, v81, v82, v15, (unint64_t *)&unk_100118EE0);
        uint64_t v41 = v40;
        uint64_t v78 = 91;
        unint64_t v79 = 0xE100000000000000;
        id v42 = [v40 UUID];
        sub_1000E1110();

        sub_1000DCE34(&qword_100118340, (void (*)(uint64_t))&type metadata accessor for UUID);
        v85._countAndFlagsBits = sub_1000E2C30();
        sub_1000E2450(v85);
        swift_bridgeObjectRelease();
        (*v29)(v7, v24);
        v86._countAndFlagsBits = 8250;
        v86._object = (void *)0xE200000000000000;
        sub_1000E2450(v86);
        unint64_t v43 = (unint64_t)[v41 state];
        if (v43 > 4)
        {
          uint64_t v46 = (void *)0xE900000000000029;
          v45._countAndFlagsBits = 0x6E776F6E6B6E5528;
        }
        else
        {
          uint64_t v44 = 8 * v43;
          v45._countAndFlagsBits = *(void *)&aWaitingPrepari_1[8 * v43];
          uint64_t v46 = *(void **)&aWaitingPrepari_1[v44 + 40];
        }
        v45._object = v46;
        sub_1000E2450(v45);
        swift_bridgeObjectRelease();
        v87._countAndFlagsBits = 93;
        v87._object = (void *)0xE100000000000000;
        sub_1000E2450(v87);

        uint64_t v47 = v78;
        unint64_t v48 = v79;
        uint64_t v49 = v83;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000DB2B8(0, v49[2] + 1, 1);
          uint64_t v49 = v83;
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1)
        {
          sub_1000DB2B8(v50 > 1, v51 + 1, 1);
          uint64_t v49 = v83;
        }
        v49[2] = v51 + 1;
        uint64_t v52 = &v49[2 * v51];
        v52[4] = v47;
        v52[5] = v48;
        if (v77) {
          break;
        }
        uint64_t v31 = v80;
        uint64_t v32 = v81;
        char v33 = v82;
        uint64_t v15 = v76;
        int64_t v34 = sub_1000DBA78(v80, v81, v82, v76);
        uint64_t v36 = v35;
        char v38 = v37;
        sub_10001A820(v31, v32, v33);
        uint64_t v80 = v34;
        uint64_t v81 = v36;
        char v39 = v38 & 1;
        uint64_t v24 = v74;
        char v82 = v39;
        if (!--v23) {
          goto LABEL_29;
        }
      }
      uint64_t v15 = v76;
      if ((v82 & 1) == 0) {
        goto LABEL_36;
      }
      if (sub_1000E2910()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_100004D9C((uint64_t *)&unk_1001199F0);
      unint64_t v53 = (void (*)(uint64_t *, void))sub_1000E2690();
      sub_1000E29C0();
      v53(&v78, 0);
      --v23;
    }
    while (v23);
LABEL_29:
    sub_10001A820(v80, v81, v82);
    uint64_t v8 = v64[0];
    goto LABEL_30;
  }
  __break(1u);
LABEL_36:
  swift_bridgeObjectRelease();

  __break(1u);
}

void *sub_1000DABE4(uint64_t a1, uint64_t a2)
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
  sub_100004D9C(&qword_1001199E8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000DAC4C(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000E24B0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_1000E2480();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1000DACC8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000DAD9C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100051230((uint64_t)v12, *a3);
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
      sub_100051230((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000EC60((uint64_t)v12);
  return v7;
}

uint64_t sub_1000DAD9C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1000E2890();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000DAF58(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1000E2AA0();
  if (!v8)
  {
    sub_1000E2B50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000E2BB0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000DAF58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000DAFF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000DB168(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000DB168(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000DAFF0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1000DABE4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000E2A70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000E2B50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000E2460();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000E2BB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000E2B50();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_1000DB168(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004D9C(&qword_1001199E8);
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
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

uint64_t sub_1000DB2B8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000DB3CC(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000DB2D8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000DB538(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000DB2F8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000DB6A0(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1000DB318(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000DB82C(a1, a2, a3, (void *)*v3, &qword_100119A30, (uint64_t (*)(void))&type metadata accessor for NCProtoContactHandleAnonym);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1000DB354(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000DB82C(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_100119A10, (uint64_t (*)(void))&type metadata accessor for NCProtoActiveConversation);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1000DB390(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000DB82C(a1, a2, a3, (void *)*v3, &qword_100119A38, (uint64_t (*)(void))&type metadata accessor for NCProtoAddressableContact);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1000DB3CC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004D9C(&qword_100117620);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

uint64_t sub_1000DB538(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004D9C((uint64_t *)&unk_100119A40);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

uint64_t sub_1000DB6A0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004D9C((uint64_t *)&unk_100119A70);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    void v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100004D9C(&qword_100117D18);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

uint64_t sub_1000DB82C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004D9C(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  id v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_1000E2BB0();
  __break(1u);
  return result;
}

int64_t sub_1000DBA78(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_1000DBB5C(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBB70(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBB84(uint64_t a1, int a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_1000E2970();
      sub_100006C20(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_1000E2930() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_1000E2940();
  sub_100006C20(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v17;
  swift_unknownObjectRelease();
  Swift::Int v8 = sub_1000E2820(*(void *)(a4 + 40));
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v11 = sub_1000E2830();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v7 = (v7 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_23;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v14 = sub_1000E2830();
    }
    while ((v14 & 1) == 0);
  }

LABEL_17:
  unint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v7);

  id v16 = v15;
}

void sub_1000DBDF4(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBE08(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBE1C(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBE30(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBE44(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_1000DBE58(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

uint64_t sub_1000DBE70(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

unint64_t sub_1000DBEF8(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000E2B70();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100004D9C(&qword_100119A50);
      uint64_t result = sub_1000E2A40();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1000E2B70();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  unint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    uint64_t result = sub_1000E2A80();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    sub_1000E20C0();
    sub_1000DCE34(&qword_100119A58, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = sub_1000E2390();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_1000DCE34((unint64_t *)&unk_100119A60, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        uint64_t result = sub_1000E23D0();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

Swift::Int sub_1000DC1AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100004D9C(&qword_100118F50);
    uint64_t v3 = sub_1000E2A40();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_1000E2D50();
      swift_bridgeObjectRetain();
      sub_1000E2440();
      Swift::Int result = sub_1000E2D70();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_1000E2C80(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          unint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_1000E2C80();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_1000DC350(unint64_t a1)
{
}

void sub_1000DC36C(unint64_t a1)
{
}

void sub_1000DC388(unint64_t a1, uint64_t *a2, unint64_t *a3)
{
  unint64_t v5 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000E2B70();
    swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_3:
      sub_100004D9C(a2);
      uint64_t v6 = (void *)sub_1000E2A40();
      uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v5) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1000E2B70();
      swift_bridgeObjectRelease();
      if (!v8) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v6 = &_swiftEmptySetSingleton;
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    return;
  }
LABEL_9:
  uint64_t v10 = (char *)(v6 + 7);
  uint64_t v46 = v8;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = sub_1000E2A80();
      BOOL v13 = __OFADD__(v11++, 1);
      if (v13)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v14 = v12;
      Swift::Int v15 = sub_1000E2820(v6[5]);
      uint64_t v16 = -1 << *((unsigned char *)v6 + 32);
      unint64_t v17 = v15 & ~v16;
      unint64_t v18 = v17 >> 6;
      uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
      uint64_t v20 = 1 << v17;
      if (((1 << v17) & v19) != 0)
      {
        sub_100006C20(0, a3);
        id v21 = *(id *)(v6[6] + 8 * v17);
        char v22 = sub_1000E2830();

        if (v22)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v23 = ~v16;
        while (1)
        {
          unint64_t v17 = (v17 + 1) & v23;
          unint64_t v18 = v17 >> 6;
          uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
          uint64_t v20 = 1 << v17;
          if ((v19 & (1 << v17)) == 0) {
            break;
          }
          id v24 = *(id *)(v6[6] + 8 * v17);
          char v25 = sub_1000E2830();

          if (v25) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v10[8 * v18] = v20 | v19;
      *(void *)(v6[6] + 8 * v17) = v14;
      uint64_t v26 = v6[2];
      BOOL v13 = __OFADD__(v26, 1);
      uint64_t v27 = v26 + 1;
      if (v13) {
        goto LABEL_37;
      }
      void v6[2] = v27;
LABEL_12:
      if (v11 == v46) {
        return;
      }
    }
  }
  uint64_t v28 = 0;
  uint64_t v44 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v28 != v44)
  {
    Swift::Int v29 = v6[5];
    id v30 = *(id *)(a1 + 32 + 8 * v28);
    Swift::Int v31 = sub_1000E2820(v29);
    uint64_t v32 = -1 << *((unsigned char *)v6 + 32);
    unint64_t v33 = v31 & ~v32;
    unint64_t v34 = v33 >> 6;
    uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
    uint64_t v36 = 1 << v33;
    if (((1 << v33) & v35) != 0)
    {
      sub_100006C20(0, a3);
      id v37 = *(id *)(v6[6] + 8 * v33);
      char v38 = sub_1000E2830();

      if (v38) {
        goto LABEL_23;
      }
      uint64_t v39 = ~v32;
      unint64_t v33 = (v33 + 1) & v39;
      unint64_t v34 = v33 >> 6;
      uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
      uint64_t v36 = 1 << v33;
      if ((v35 & (1 << v33)) != 0)
      {
        while (1)
        {
          id v40 = *(id *)(v6[6] + 8 * v33);
          char v41 = sub_1000E2830();

          if (v41) {
            break;
          }
          unint64_t v33 = (v33 + 1) & v39;
          unint64_t v34 = v33 >> 6;
          uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
          uint64_t v36 = 1 << v33;
          if ((v35 & (1 << v33)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v8 = v46;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v8 = v46;
    }
    *(void *)&v10[8 * v34] = v36 | v35;
    *(void *)(v6[6] + 8 * v33) = v30;
    uint64_t v42 = v6[2];
    BOOL v13 = __OFADD__(v42, 1);
    uint64_t v43 = v42 + 1;
    if (v13) {
      goto LABEL_38;
    }
    void v6[2] = v43;
LABEL_24:
    if (++v28 == v8) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void sub_1000DC6EC(unint64_t a1)
{
}

uint64_t sub_1000DC708(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000E1140();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v39 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000E2030();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  BOOL v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = (unint64_t)[a1 state];
  unint64_t v15 = (unint64_t)[a2 state];
  if (qword_100116220 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_10000AD90(v9, (uint64_t)qword_100119980);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v16, v9);
  id v17 = a1;
  unint64_t v18 = sub_1000E2010();
  int v19 = sub_1000E2700();
  if (os_log_type_enabled(v18, (os_log_type_t)v19))
  {
    int v35 = v19;
    os_log_t v36 = v18;
    unint64_t v42 = v14;
    uint64_t v38 = v3;
    unint64_t v20 = 0xE900000000000029;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v44 = v34;
    *(_DWORD *)uint64_t v21 = 136315650;
    uint64_t v22 = 0x6E776F6E6B6E5528;
    unint64_t v23 = 0xE900000000000029;
    if (v15 <= 4)
    {
      uint64_t v22 = *(void *)&aWaitingPrepari_1[8 * v15];
      unint64_t v23 = *(void *)&aWaitingPrepari_1[8 * v15 + 40];
    }
    unint64_t v37 = v15;
    uint64_t v43 = sub_1000DACC8(v22, v23, &v44);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v24 = 0x6E776F6E6B6E5528;
    if (v42 <= 4)
    {
      uint64_t v24 = *(void *)&aWaitingPrepari_1[8 * v42];
      unint64_t v20 = *(void *)&aWaitingPrepari_1[8 * v42 + 40];
    }
    uint64_t v43 = sub_1000DACC8(v24, v20, &v44);
    sub_1000E2880();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2080;
    id v25 = objc_msgSend(v17, "UUID", v21 + 24, v34);
    uint64_t v26 = v39;
    sub_1000E1110();

    sub_1000DCE34(&qword_100118340, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v27 = v41;
    uint64_t v28 = sub_1000E2C30();
    unint64_t v30 = v29;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v27);
    uint64_t v43 = sub_1000DACC8(v28, v30, &v44);
    sub_1000E2880();

    swift_bridgeObjectRelease();
    os_log_t v31 = v36;
    _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v35, "Conversation state changed from %s to %s for %s", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    unint64_t v15 = v37;
    unint64_t v14 = v42;
    if (v42 != 3) {
      goto LABEL_12;
    }
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    if (v14 != 3) {
      goto LABEL_12;
    }
  }
  if (v15 != 3)
  {
LABEL_15:
    uint64_t v44 = (uint64_t)v17;
    return sub_1000E20E0();
  }
LABEL_12:
  if ((v15 == 3 || v15 == 2) && (v14 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_15;
  }
  return result;
}

uint64_t sub_1000DCC10(void *a1)
{
  if (qword_100116220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000E2030();
  sub_10000AD90(v2, (uint64_t)qword_100119980);
  id v3 = a1;
  uint64_t v4 = sub_1000E2010();
  os_log_type_t v5 = sub_1000E2700();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v3;
    sub_1000E2880();
    *uint64_t v7 = v3;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removed active conversation %@.", v6, 0xCu);
    sub_100004D9C(&qword_100117180);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return sub_1000E20E0();
}

unint64_t sub_1000DCDCC()
{
  unint64_t result = qword_100117540;
  if (!qword_100117540)
  {
    sub_100006C20(255, (unint64_t *)&unk_100118EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100117540);
  }
  return result;
}

uint64_t sub_1000DCE34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000DCE7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

uint64_t sub_1000DCEDC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = v1 + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_uuid;
  sub_1000E1130();
  if (([a1 flags] & 1) == 0)
  {
    (id)TUMakeNeighborhoodConduitError();
    swift_willThrow();

    uint64_t v6 = sub_1000E1140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    swift_deallocPartialClassInstance();
    return v3;
  }
  uint64_t v89 = v2;
  *(void *)(v1 + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_device) = a1;
  id v91 = a1;
  uint64_t v7 = sub_10000D688();
  uint64_t v90 = v1;
  *(void *)(v1
            + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_identifiers) = v7;
  uint64_t v92 = v7 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v7 + 56);
  int64_t v93 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v94 = v7;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  if (v10) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v18 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  if (v18 >= v93) {
    goto LABEL_63;
  }
  unint64_t v19 = *(void *)(v92 + 8 * v18);
  ++v11;
  if (v19)
  {
LABEL_24:
    unint64_t v10 = (v19 - 1) & v19;
    for (unint64_t i = __clz(__rbit64(v19)) + (v11 << 6); ; unint64_t i = v16 | (v11 << 6))
    {
      uint64_t v21 = *(void *)(v94 + 48) + 24 * i;
      uint64_t v23 = *(void *)v21;
      uint64_t v22 = *(void *)(v21 + 8);
      int v24 = *(unsigned __int8 *)(v21 + 16);
      if (v24)
      {
        if (v24 == 1)
        {
          id v25 = objc_allocWithZone((Class)NSNumber);
          sub_10000E8C0(v23, v22, 1u);
          swift_bridgeObjectRetain();
          id v26 = [v25 initWithInteger:1];
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v29 = sub_1000065A8((uint64_t)v26);
          uint64_t v30 = _swiftEmptyDictionarySingleton[2];
          BOOL v31 = (v28 & 1) == 0;
          uint64_t v32 = v30 + v31;
          if (__OFADD__(v30, v31)) {
            goto LABEL_75;
          }
          char v33 = v28;
          if (_swiftEmptyDictionarySingleton[3] >= v32)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              if ((v28 & 1) == 0) {
                goto LABEL_44;
              }
            }
            else
            {
              sub_1000C8490();
              if ((v33 & 1) == 0) {
                goto LABEL_44;
              }
            }
          }
          else
          {
            sub_1000C5440(v32, isUniquelyReferenced_nonNull_native);
            unint64_t v34 = sub_1000065A8((uint64_t)v26);
            if ((v33 & 1) != (v35 & 1)) {
              goto LABEL_82;
            }
            unint64_t v29 = v34;
            if ((v33 & 1) == 0)
            {
LABEL_44:
              _swiftEmptyDictionarySingleton[(v29 >> 6) + 8] |= 1 << v29;
              *(void *)(_swiftEmptyDictionarySingleton[6] + 8 * v29) = v26;
              id v58 = (uint64_t *)(_swiftEmptyDictionarySingleton[7] + 16 * v29);
              *id v58 = v23;
              v58[1] = v22;
              uint64_t v59 = _swiftEmptyDictionarySingleton[2];
              BOOL v60 = __OFADD__(v59, 1);
              uint64_t v61 = v59 + 1;
              if (v60) {
                goto LABEL_78;
              }
              _swiftEmptyDictionarySingleton[2] = v61;
              id v62 = v26;
LABEL_8:

              swift_bridgeObjectRelease();
              uint64_t v13 = v23;
              uint64_t v14 = v22;
              unsigned __int8 v15 = 1;
LABEL_9:
              sub_10000E8E8(v13, v14, v15);
              if (!v10) {
                goto LABEL_11;
              }
              goto LABEL_10;
            }
          }
          uint64_t v12 = (uint64_t *)(_swiftEmptyDictionarySingleton[7] + 16 * v29);
          swift_bridgeObjectRelease();
          uint64_t *v12 = v23;
          v12[1] = v22;
          goto LABEL_8;
        }
        id v47 = objc_allocWithZone((Class)NSNumber);
        sub_10000E8C0(v23, v22, 2u);
        swift_bridgeObjectRetain();
        id v48 = [v47 initWithInteger:0];
        char v49 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v51 = sub_1000065A8((uint64_t)v48);
        uint64_t v52 = _swiftEmptyDictionarySingleton[2];
        BOOL v53 = (v50 & 1) == 0;
        uint64_t v54 = v52 + v53;
        if (__OFADD__(v52, v53)) {
          goto LABEL_77;
        }
        char v55 = v50;
        if (_swiftEmptyDictionarySingleton[3] >= v54)
        {
          if (v49)
          {
            if ((v50 & 1) == 0) {
              goto LABEL_60;
            }
          }
          else
          {
            sub_1000C8490();
            if ((v55 & 1) == 0) {
              goto LABEL_60;
            }
          }
        }
        else
        {
          sub_1000C5440(v54, v49);
          unint64_t v56 = sub_1000065A8((uint64_t)v48);
          if ((v55 & 1) != (v57 & 1)) {
            goto LABEL_82;
          }
          unint64_t v51 = v56;
          if ((v55 & 1) == 0)
          {
LABEL_60:
            _swiftEmptyDictionarySingleton[(v51 >> 6) + 8] |= 1 << v51;
            *(void *)(_swiftEmptyDictionarySingleton[6] + 8 * v51) = v48;
            uint64_t v69 = (uint64_t *)(_swiftEmptyDictionarySingleton[7] + 16 * v51);
            *uint64_t v69 = v23;
            v69[1] = v22;
            uint64_t v70 = _swiftEmptyDictionarySingleton[2];
            BOOL v60 = __OFADD__(v70, 1);
            uint64_t v71 = v70 + 1;
            if (v60) {
              goto LABEL_80;
            }
            _swiftEmptyDictionarySingleton[2] = v71;
            id v72 = v48;
            goto LABEL_62;
          }
        }
        uint64_t v64 = (uint64_t *)(_swiftEmptyDictionarySingleton[7] + 16 * v51);
        swift_bridgeObjectRelease();
        *uint64_t v64 = v23;
        v64[1] = v22;
LABEL_62:

        swift_bridgeObjectRelease();
        uint64_t v13 = v23;
        uint64_t v14 = v22;
        unsigned __int8 v15 = 2;
        goto LABEL_9;
      }
      id v36 = objc_allocWithZone((Class)NSNumber);
      sub_10000E8C0(v23, v22, 0);
      swift_bridgeObjectRetain();
      id v37 = objc_msgSend(v36, "initWithInteger:", 2, v89);
      char v38 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v40 = sub_1000065A8((uint64_t)v37);
      uint64_t v41 = _swiftEmptyDictionarySingleton[2];
      BOOL v42 = (v39 & 1) == 0;
      uint64_t v43 = v41 + v42;
      if (__OFADD__(v41, v42)) {
        goto LABEL_76;
      }
      char v44 = v39;
      if (_swiftEmptyDictionarySingleton[3] >= v43)
      {
        if (v38)
        {
          if (v39) {
            goto LABEL_48;
          }
        }
        else
        {
          sub_1000C8490();
          if (v44) {
            goto LABEL_48;
          }
        }
      }
      else
      {
        sub_1000C5440(v43, v38);
        unint64_t v45 = sub_1000065A8((uint64_t)v37);
        if ((v44 & 1) != (v46 & 1)) {
          goto LABEL_82;
        }
        unint64_t v40 = v45;
        if (v44)
        {
LABEL_48:
          os_log_t v63 = (uint64_t *)(_swiftEmptyDictionarySingleton[7] + 16 * v40);
          swift_bridgeObjectRelease();
          *os_log_t v63 = v23;
          v63[1] = v22;
          goto LABEL_57;
        }
      }
      _swiftEmptyDictionarySingleton[(v40 >> 6) + 8] |= 1 << v40;
      *(void *)(_swiftEmptyDictionarySingleton[6] + 8 * v40) = v37;
      uint64_t v65 = (uint64_t *)(_swiftEmptyDictionarySingleton[7] + 16 * v40);
      uint64_t *v65 = v23;
      v65[1] = v22;
      uint64_t v66 = _swiftEmptyDictionarySingleton[2];
      BOOL v60 = __OFADD__(v66, 1);
      uint64_t v67 = v66 + 1;
      if (v60) {
        goto LABEL_79;
      }
      _swiftEmptyDictionarySingleton[2] = v67;
      id v68 = v37;
LABEL_57:

      swift_bridgeObjectRelease();
      sub_10000E8E8(v23, v22, 0);
      if (!v10) {
        goto LABEL_11;
      }
LABEL_10:
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
    }
  }
  int64_t v11 = v18 + 1;
  if (v18 + 1 >= v93)
  {
LABEL_63:
    swift_release();
    id v73 = [v91 name];
    if (v73)
    {
      uint64_t v74 = v73;
      sub_1000E23F0();
      uint64_t v76 = v75;
    }
    else
    {
      uint64_t v76 = 0;
    }
    id v77 = objc_msgSend(v91, "model", v89);
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = sub_1000E23F0();
      uint64_t v81 = v80;
    }
    else
    {
      uint64_t v79 = 0;
      uint64_t v81 = 0;
    }
    uint64_t v82 = sub_10009C078(v79, v81);
    id v83 = sub_10000CF90();
    if (v76)
    {
      NSString v84 = sub_1000E23E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v84 = 0;
    }
    id v85 = objc_allocWithZone((Class)TUNearbyDeviceHandle);
    sub_100006C20(0, (unint64_t *)&qword_100116508);
    sub_10000EDB8();
    Class isa = sub_1000E2360().super.isa;
    swift_bridgeObjectRelease();
    id v87 = [v85 initWithName:v84 knownIdentifiers:isa deviceModel:v82 capabilities:v83];

    uint64_t v3 = v90;
    *(void *)(v90
              + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_nearbyDeviceHandle) = v87;
    return v3;
  }
  unint64_t v19 = *(void *)(v92 + 8 * v11);
  if (v19) {
    goto LABEL_24;
  }
  int64_t v11 = v18 + 2;
  if (v18 + 2 >= v93) {
    goto LABEL_63;
  }
  unint64_t v19 = *(void *)(v92 + 8 * v11);
  if (v19) {
    goto LABEL_24;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v93) {
    goto LABEL_63;
  }
  unint64_t v19 = *(void *)(v92 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v93) {
      goto LABEL_63;
    }
    unint64_t v19 = *(void *)(v92 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_81:
  __break(1u);
LABEL_82:
  sub_100006C20(0, (unint64_t *)&qword_100116508);
  uint64_t result = sub_1000E2CE0();
  __break(1u);
  return result;
}

uint64_t sub_1000DD740(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v41 = a3;
  uint64_t v4 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v4 - 8, v5);
  BOOL v42 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100004D9C(&qword_100118630);
  uint64_t v7 = *(void *)(v40 - 8);
  __chkstk_darwin(v40, v8);
  v39[3] = v9;
  unint64_t v10 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001161F8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000E2030();
  sub_10000AD90(v11, (uint64_t)qword_10011C038);
  swift_retain_n();
  uint64_t v12 = sub_1000E2010();
  os_log_type_t v13 = sub_1000E2700();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    unsigned __int8 v15 = (void **)swift_slowAlloc();
    v39[2] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    aBlock = v15;
    v39[1] = v14 + 4;
    sub_1000E1140();
    sub_1000E0BE8(&qword_100118340, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v16 = sub_1000E2C30();
    uint64_t v43 = sub_1000DACC8(v16, v17, (uint64_t *)&aBlock);
    sub_1000E2880();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[Auth][%s] Authentication requested, activating client.", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v18 = swift_allocObject();
  *(unsigned char *)(v18 + 16) = 0;
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v40);
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = (char *)swift_allocObject();
  uint64_t v23 = v41;
  *((void *)v22 + 2) = v18;
  *((void *)v22 + 3) = v23;
  *((void *)v22 + 4) = v19;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v22[v21], v10, v20);
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  id v25 = (void *)swift_allocObject();
  v25[2] = v24;
  v25[3] = v23;
  v25[4] = sub_1000E06B8;
  v25[5] = v22;
  id v48 = sub_1000E078C;
  char v49 = v25;
  aBlock = _NSConcreteStackBlock;
  uint64_t v45 = 1107296256;
  char v46 = sub_1000DCE7C;
  id v47 = &unk_10010E710;
  id v26 = _Block_copy(&aBlock);
  id v27 = v23;
  swift_retain();
  swift_retain();
  swift_release();
  [v27 setPromptForPasswordHandler:v26];
  _Block_release(v26);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_1000E06B8;
  *(void *)(v28 + 24) = v22;
  id v48 = sub_1000E07E8;
  char v49 = (void *)v28;
  aBlock = _NSConcreteStackBlock;
  uint64_t v45 = 1107296256;
  char v46 = sub_10005489C;
  id v47 = &unk_10010E760;
  unint64_t v29 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v27 setInvalidationHandler:v29];
  _Block_release(v29);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_1000E06B8;
  *(void *)(v30 + 24) = v22;
  id v48 = sub_1000E07F0;
  char v49 = (void *)v30;
  aBlock = _NSConcreteStackBlock;
  uint64_t v45 = 1107296256;
  char v46 = sub_1000A7558;
  id v47 = &unk_10010E7B0;
  BOOL v31 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v27 setAuthCompletionHandler:v31];
  _Block_release(v31);
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_1000E06B8;
  *(void *)(v32 + 24) = v22;
  id v48 = sub_1000E07F8;
  char v49 = (void *)v32;
  aBlock = _NSConcreteStackBlock;
  uint64_t v45 = 1107296256;
  char v46 = sub_1000A7558;
  id v47 = &unk_10010E800;
  char v33 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v27 activateWithCompletion:v33];
  _Block_release(v33);
  uint64_t v34 = sub_1000E25E0();
  uint64_t v35 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v42, 1, 1, v34);
  id v36 = (void *)swift_allocObject();
  v36[2] = 0;
  v36[3] = 0;
  v36[4] = sub_1000E06B8;
  v36[5] = v22;
  v36[6] = v27;
  id v37 = v27;
  sub_1000A75C4(v35, (uint64_t)&unk_100119B68, (uint64_t)v36);
  swift_release();
  return swift_release();
}

uint64_t sub_1000DDE60(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v86 = a6;
  uint64_t v87 = a5;
  uint64_t v85 = a1;
  uint64_t v9 = sub_1000E1140();
  uint64_t v82 = *(void *)(v9 - 8);
  uint64_t v83 = v9;
  uint64_t v11 = __chkstk_darwin(v9, v10);
  uint64_t v80 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v81 = (char *)&v78 - v15;
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v78 - v17;
  uint64_t v19 = sub_100004D9C(&qword_100118640);
  uint64_t v21 = __chkstk_darwin(v19 - 8, v20);
  uint64_t v23 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v21, v24);
  id v27 = (char *)&v78 - v26;
  uint64_t v29 = __chkstk_darwin(v25, v28);
  BOOL v31 = (char *)&v78 - v30;
  __chkstk_darwin(v29, v32);
  uint64_t v34 = (char *)&v78 - v33;
  uint64_t v35 = sub_1000E2030();
  uint64_t v88 = *(void *)(v35 - 8);
  uint64_t v89 = v35;
  uint64_t v37 = __chkstk_darwin(v35, v36);
  NSString v84 = (char *)&v78 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37, v39);
  uint64_t v41 = (char *)&v78 - v40;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a3 + 16) & 1) == 0)
  {
    swift_beginAccess();
    *(unsigned char *)(a3 + 16) = 1;
    [a4 invalidate];
    if (a2)
    {
      uint64_t v53 = v85;
      swift_errorRetain();
      uint64_t v55 = v88;
      uint64_t v54 = v89;
      if (qword_1001161F8 != -1) {
        swift_once();
      }
      uint64_t v56 = sub_10000AD90(v54, (uint64_t)qword_10011C038);
      char v57 = v84;
      (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v84, v56, v54);
      swift_retain();
      sub_1000E0C84(v53, 1);
      swift_retain();
      sub_1000E0C84(v53, 1);
      id v58 = sub_1000E2010();
      int v59 = sub_1000E2700();
      if (os_log_type_enabled(v58, (os_log_type_t)v59))
      {
        int v79 = v59;
        uint64_t v60 = swift_slowAlloc();
        uint64_t v78 = (void *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        id v91 = (char *)v61;
        *(_DWORD *)uint64_t v60 = 136315394;
        swift_beginAccess();
        uint64_t Strong = swift_weakLoadStrong();
        if (Strong)
        {
          uint64_t v63 = v82;
          uint64_t v64 = v83;
          (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v27, Strong + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_uuid, v83);
          swift_release();
          uint64_t v65 = 0;
        }
        else
        {
          uint64_t v65 = 1;
          uint64_t v63 = v82;
          uint64_t v64 = v83;
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v27, v65, 1, v64);
        sub_10002BAFC((uint64_t)v27, (uint64_t)v23);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48))(v23, 1, v64) == 1)
        {
          uint64_t v69 = 7104878;
          sub_1000E0C9C((uint64_t)v23);
          unint64_t v70 = 0xE300000000000000;
        }
        else
        {
          uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v63 + 32);
          uint64_t v83 = v61;
          id v72 = v80;
          v71(v80, v23, v64);
          (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v81, v72, v64);
          uint64_t v73 = sub_1000E2420();
          uint64_t v74 = v64;
          uint64_t v69 = v73;
          unint64_t v70 = v75;
          (*(void (**)(char *, uint64_t))(v63 + 8))(v72, v74);
        }
        sub_1000E0C9C((uint64_t)v27);
        uint64_t v90 = sub_1000DACC8(v69, v70, (uint64_t *)&v91);
        sub_1000E2880();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2112;
        uint64_t v76 = v85;
        sub_1000E0C84(v85, 1);
        uint64_t v77 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v90 = v77;
        sub_1000E2880();
        *uint64_t v78 = v77;
        sub_1000E0C90(v76, 1);
        sub_1000E0C90(v76, 1);
        _os_log_impl((void *)&_mh_execute_header, v58, (os_log_type_t)v79, "[Auth][%s] Authentication failed due to %@.", (uint8_t *)v60, 0x16u);
        sub_100004D9C(&qword_100117180);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v53 = v76;
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v55 + 8))(v84, v54);
      }
      else
      {
        swift_release_n();
        sub_1000E0C90(v53, 1);
        sub_1000E0C90(v53, 1);

        (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
      }
      id v91 = (char *)v53;
      sub_100004D9C(&qword_100118630);
      return sub_1000E2590();
    }
    else
    {
      uint64_t v44 = v88;
      uint64_t v43 = v89;
      if (qword_1001161F8 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_10000AD90(v43, (uint64_t)qword_10011C038);
      (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v41, v45, v43);
      swift_retain_n();
      char v46 = sub_1000E2010();
      int v47 = sub_1000E2700();
      if (os_log_type_enabled(v46, (os_log_type_t)v47))
      {
        LODWORD(v85) = v47;
        id v48 = (uint8_t *)swift_slowAlloc();
        NSString v84 = (char *)swift_slowAlloc();
        id v91 = v84;
        *(_DWORD *)id v48 = 136315138;
        swift_beginAccess();
        uint64_t v49 = swift_weakLoadStrong();
        if (v49)
        {
          uint64_t v50 = v82;
          uint64_t v51 = v83;
          (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v34, v49 + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_uuid, v83);
          swift_release();
          uint64_t v52 = 0;
        }
        else
        {
          uint64_t v52 = 1;
          uint64_t v50 = v82;
          uint64_t v51 = v83;
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v34, v52, 1, v51);
        sub_10002BAFC((uint64_t)v34, (uint64_t)v31);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v31, 1, v51) == 1)
        {
          uint64_t v66 = 7104878;
          sub_1000E0C9C((uint64_t)v31);
          unint64_t v67 = 0xE300000000000000;
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v18, v31, v51);
          (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v81, v18, v51);
          uint64_t v66 = sub_1000E2420();
          unint64_t v67 = v68;
          (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v51);
        }
        sub_1000E0C9C((uint64_t)v34);
        uint64_t v90 = sub_1000DACC8(v66, v67, (uint64_t *)&v91);
        sub_1000E2880();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v85, "[Auth][%s] Authentication succeeded", v48, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v88 + 8))(v41, v89);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
      }
      sub_100004D9C(&qword_100118630);
      return sub_1000E25A0();
    }
  }
  return result;
}

uint64_t sub_1000DE848(int a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v17 = sub_1000E25E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = 0;
    *(void *)(v18 + 24) = 0;
    *(void *)(v18 + 32) = a4;
    *(void *)(v18 + 40) = v16;
    *(_DWORD *)(v18 + 48) = a1;
    *(_DWORD *)(v18 + 52) = a2;
    *(void *)(v18 + 56) = a5;
    *(void *)(v18 + 64) = a6;
    id v19 = a4;
    swift_retain();
    sub_1000A82D8((uint64_t)v14, (uint64_t)&unk_100119B80, v18);
    return swift_release();
  }
  return result;
}

uint64_t sub_1000DE9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8)
{
  v8[3] = a8;
  v8[4] = v15;
  _OWORD v8[2] = a4;
  uint64_t v12 = swift_task_alloc();
  v8[5] = v12;
  *(void *)uint64_t v12 = v8;
  *(void *)(v12 + 8) = sub_1000DEA74;
  *(void *)(v12 + 32) = a5;
  *(_DWORD *)(v12 + 72) = a6;
  *(_DWORD *)(v12 + 76) = a7;
  return _swift_task_switch(sub_1000DED04, 0, 0);
}

uint64_t sub_1000DEA74(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 48) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_1000DEC3C;
  }
  else
  {
    *(void *)(v6 + 56) = a2;
    *(void *)(v6 + 64) = a1;
    uint64_t v7 = sub_1000DEBA8;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_1000DEBA8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  NSString v2 = sub_1000E23E0();
  swift_bridgeObjectRelease();
  [v1 tryPassword:v2];

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000DEC3C()
{
  uint64_t v1 = v0[6];
  NSString v2 = (void (*)(uint64_t, uint64_t))v0[3];
  uint64_t v3 = (void *)v0[2];
  swift_errorRetain();
  v2(v1, 1);
  swift_errorRelease();
  [v3 invalidate];
  swift_errorRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000DECE0(int a1, int a2)
{
  *(void *)(v3 + 32) = v2;
  *(_DWORD *)(v3 + 72) = a1;
  *(_DWORD *)(v3 + 76) = a2;
  return _swift_task_switch(sub_1000DED04, 0, 0);
}

uint64_t sub_1000DED04()
{
  int v1 = *(_DWORD *)(v0 + 72);
  if ((v1 & 0x10000) != 0)
  {
    if (qword_1001161F8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1000E2030();
    sub_10000AD90(v7, (uint64_t)qword_10011C038);
    uint64_t v8 = sub_1000E2010();
    os_log_type_t v9 = sub_1000E2700();
    if (!os_log_type_enabled(v8, v9))
    {
      char v11 = 0;
      goto LABEL_16;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Auth] Incorrect password provided - aborting.", v10, 2u);
    char v11 = 0;
  }
  else
  {
    if ((v1 & 0x20000) == 0)
    {
      id v2 = [*(id *)(*(void *)(v0 + 32)+ OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_device) name];
      if (v2)
      {
        uint64_t v3 = v2;
        uint64_t v4 = sub_1000E23F0();
        uint64_t v6 = v5;
      }
      else
      {
        uint64_t v4 = 0;
        uint64_t v6 = 0;
      }
      *(void *)(v0 + 40) = v6;
      int v18 = *(_DWORD *)(v0 + 76);
      uint64_t v19 = swift_task_alloc();
      *(void *)(v0 + 48) = v19;
      *(void *)(v19 + 16) = v4;
      *(void *)(v19 + 24) = v6;
      *(_DWORD *)(v19 + 32) = v18;
      uint64_t v20 = (void *)swift_task_alloc();
      *(void *)(v0 + 56) = v20;
      *uint64_t v20 = v0;
      v20[1] = sub_1000DF038;
      return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000022, 0x80000001000EAEE0, sub_1000E0AA0, v19, &type metadata for String);
    }
    if (qword_1001161F8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1000E2030();
    sub_10000AD90(v12, (uint64_t)qword_10011C038);
    uint64_t v8 = sub_1000E2010();
    os_log_type_t v13 = sub_1000E2700();
    if (!os_log_type_enabled(v8, v13))
    {
      char v11 = 1;
      goto LABEL_16;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v13, "[Auth] Pairing request throttled - aborting.", v14, 2u);
    char v11 = 1;
  }
  swift_slowDealloc();
LABEL_16:

  sub_1000E0910();
  swift_allocError();
  *uint64_t v15 = v11;
  swift_willThrow();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_1000DF038()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_1000DF178;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    id v2 = sub_1000DF15C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000DF15C()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000DF178()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000DF1E4(void (*a1)(uint64_t, uint64_t))
{
  sub_1000E0910();
  uint64_t v2 = swift_allocError();
  *uint64_t v3 = 2;
  a1(v2, 1);

  return swift_errorRelease();
}

uint64_t sub_1000DF258(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  if (!a1) {
    return a2(0, 0);
  }
  swift_errorRetain();
  a2(a1, 1);

  return swift_errorRelease();
}

uint64_t sub_1000DF2D0(uint64_t result, void (*a2)(uint64_t, uint64_t))
{
  if (result)
  {
    uint64_t v3 = result;
    swift_errorRetain();
    a2(v3, 1);
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_1000DF330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  void v6[2] = a4;
  uint64_t v7 = sub_1000E2B20();
  v6[5] = v7;
  v6[6] = *(void *)(v7 - 8);
  v6[7] = swift_task_alloc();
  return _swift_task_switch(sub_1000DF3F4, 0, 0);
}

uint64_t sub_1000DF3F4()
{
  sub_1000E2B10();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100119008 + dword_100119008);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000DF4BC;
  return v3(0xA055690D9DB80000, 1, 0, 0, 1);
}

uint64_t sub_1000DF4BC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56);
  uint64_t v3 = *(void *)(*(void *)v1 + 48);
  uint64_t v4 = *(void *)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_10004FA48;
  }
  else {
    uint64_t v5 = sub_1000DF62C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000DF62C()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = (void (*)(void))v0[2];
  sub_1000E0910();
  swift_allocError();
  *uint64_t v3 = 3;
  v2();
  swift_errorRelease();
  [v1 invalidate];
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000DF6F8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v31 = a4;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v28 = a1;
  uint64_t v32 = sub_1000E21D0();
  uint64_t v35 = *(void *)(v32 - 8);
  __chkstk_darwin(v32, v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E2200();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004D9C(&qword_100119B90);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11, v14);
  uint64_t v15 = sub_1000E21E0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006C20(0, (unint64_t *)&qword_100116230);
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v19, enum case for DispatchQoS.QoSClass.userInteractive(_:), v15);
  uint64_t v27 = sub_1000E2790();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v11);
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = v30;
  *(void *)(v21 + 16) = v29;
  *(void *)(v21 + 24) = v22;
  *(_DWORD *)(v21 + 32) = v31;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v21 + v20, (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  aBlock[4] = sub_1000E0B7C;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10005489C;
  aBlock[3] = &unk_10010E8A0;
  uint64_t v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_1000E21F0();
  uint64_t v36 = _swiftEmptyArrayStorage;
  sub_1000E0BE8((unint64_t *)&qword_100117080, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004D9C(&qword_100116BF0);
  sub_1000CC5AC();
  uint64_t v24 = v32;
  sub_1000E28C0();
  uint64_t v25 = (void *)v27;
  sub_1000E2770();
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v24);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v34);
  return swift_release();
}

void sub_1000DFB50(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v70._object = a4;
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (objc_class *)(id)TUBundle();
    if (v6)
    {
      uint64_t v7 = v6;
      v78._countAndFlagsBits = 0xD00000000000001ELL;
      v70._countAndFlagsBits = 0xE000000000000000;
      v78._object = (void *)0x80000001000EAFD0;
      v84.value._object = (void *)0x80000001000E9C20;
      v84.value._countAndFlagsBits = 0xD000000000000012;
      v8.super.CFDictionaryRef isa = v7;
      v90._countAndFlagsBits = 0;
      v90._object = (void *)0xE000000000000000;
      sub_1000E0F60(v78, v84, v8, v90, v70);

      sub_100004D9C((uint64_t *)&unk_100118230);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1000EDF60;
      *(void *)(v9 + 56) = &type metadata for String;
      *(void *)(v9 + 64) = sub_1000E0C30();
      *(void *)(v9 + 32) = a1;
      *(void *)(v9 + 40) = a2;
      uint64_t v10 = sub_1000E2400();
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    return;
  }
  uint64_t v13 = (objc_class *)(id)TUBundle();
  if (!v13) {
    goto LABEL_49;
  }
  uint64_t v14 = v13;
  v79._countAndFlagsBits = 0xD00000000000001ALL;
  v70._countAndFlagsBits = 0xE000000000000000;
  v79._object = (void *)0x80000001000EAF10;
  v85.value._object = (void *)0x80000001000E9C20;
  v85.value._countAndFlagsBits = 0xD000000000000012;
  v15.super.CFDictionaryRef isa = v14;
  v91._countAndFlagsBits = 0;
  v91._object = (void *)0xE000000000000000;
  uint64_t v10 = sub_1000E0F60(v79, v85, v15, v91, v70);
  uint64_t v12 = v16;

LABEL_6:
  sub_100004D9C(&qword_100119B98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000EF630;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v18 = (void *)inited;
  *(void *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
  CFStringRef v19 = (id)kCFUserNotificationAlertHeaderKey;
  unint64_t v20 = (objc_class *)(id)TUBundle();
  if (!v20)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v21 = v20;
  v71._countAndFlagsBits = 0xE000000000000000;
  v80._object = (void *)0x80000001000EAF30;
  v86.value._object = (void *)0x80000001000E9C20;
  v80._countAndFlagsBits = 0xD000000000000012;
  v86.value._countAndFlagsBits = 0xD000000000000012;
  v22.super.CFDictionaryRef isa = v21;
  v92._countAndFlagsBits = 0;
  v92._object = (void *)0xE000000000000000;
  uint64_t v23 = sub_1000E0F60(v80, v86, v22, v92, v71);
  uint64_t v25 = v24;

  v18[8] = &type metadata for String;
  v18[5] = v23;
  v18[6] = v25;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v18[13] = &type metadata for String;
  v18[9] = kCFUserNotificationAlertMessageKey;
  v18[10] = v10;
  v18[11] = v12;
  if (!kCFUserNotificationTextFieldTitlesKey)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v18[14] = kCFUserNotificationTextFieldTitlesKey;
  sub_100004D9C(&qword_100117620);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1000EDF60;
  CFStringRef v27 = (id)kCFUserNotificationAlertMessageKey;
  CFStringRef v28 = (id)kCFUserNotificationTextFieldTitlesKey;
  uint64_t v29 = (objc_class *)(id)TUBundle();
  if (!v29)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v30 = v29;
  v81._countAndFlagsBits = 0xD000000000000017;
  v72._countAndFlagsBits = 0xE000000000000000;
  v81._object = (void *)0x80000001000EAF50;
  v87.value._object = (void *)0x80000001000E9C20;
  v87.value._countAndFlagsBits = 0xD000000000000012;
  v31.super.CFDictionaryRef isa = v30;
  v93._countAndFlagsBits = 0;
  v93._object = (void *)0xE000000000000000;
  uint64_t v32 = sub_1000E0F60(v81, v87, v31, v93, v72);
  uint64_t v34 = v33;

  *(void *)(v26 + 32) = v32;
  *(void *)(v26 + 40) = v34;
  uint64_t v35 = sub_100004D9C(&qword_100117260);
  v18[18] = v35;
  v18[15] = v26;
  if (!kCFUserNotificationTextFieldValuesKey)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v18[23] = v35;
  v18[19] = kCFUserNotificationTextFieldValuesKey;
  v18[20] = &off_10010A760;
  if (!kCFUserNotificationKeyboardTypesKey)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v18[24] = kCFUserNotificationKeyboardTypesKey;
  v18[28] = sub_100004D9C(&qword_100119BA0);
  v18[25] = &off_10010A790;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v18[29] = kCFUserNotificationDefaultButtonTitleKey;
  CFStringRef v36 = (id)kCFUserNotificationTextFieldValuesKey;
  CFStringRef v37 = (id)kCFUserNotificationKeyboardTypesKey;
  CFStringRef v38 = (id)kCFUserNotificationDefaultButtonTitleKey;
  uint64_t v39 = (objc_class *)(id)TUBundle();
  if (!v39)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v40 = v39;
  v82._countAndFlagsBits = 0xD000000000000020;
  v73._countAndFlagsBits = 0xE000000000000000;
  v82._object = (void *)0x80000001000EAF70;
  v88.value._object = (void *)0x80000001000E9C20;
  v88.value._countAndFlagsBits = 0xD000000000000012;
  v41.super.CFDictionaryRef isa = v40;
  v94._countAndFlagsBits = 0;
  v94._object = (void *)0xE000000000000000;
  uint64_t v42 = sub_1000E0F60(v82, v88, v41, v94, v73);
  uint64_t v44 = v43;

  v18[33] = &type metadata for String;
  v18[30] = v42;
  v18[31] = v44;
  if (!kCFUserNotificationAlternateButtonTitleKey)
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
  }
  v18[34] = kCFUserNotificationAlternateButtonTitleKey;
  CFStringRef v45 = (id)kCFUserNotificationAlternateButtonTitleKey;
  char v46 = (objc_class *)(id)TUBundle();
  if (!v46) {
    goto LABEL_47;
  }
  int v47 = v46;
  v83._countAndFlagsBits = 0xD000000000000020;
  v74._countAndFlagsBits = 0xE000000000000000;
  v83._object = (void *)0x80000001000EAFA0;
  v89.value._object = (void *)0x80000001000E9C20;
  v89.value._countAndFlagsBits = 0xD000000000000012;
  v48.super.CFDictionaryRef isa = v47;
  v95._countAndFlagsBits = 0;
  v95._object = (void *)0xE000000000000000;
  uint64_t v49 = sub_1000E0F60(v83, v89, v48, v95, v74);
  uint64_t v51 = v50;

  v18[38] = &type metadata for String;
  v18[35] = v49;
  v18[36] = v51;
  sub_100005E08((uint64_t)v18);
  SInt32 error = 0;
  type metadata accessor for CFString(0);
  sub_1000E0BE8((unint64_t *)&unk_1001165F0, type metadata accessor for CFString);
  CFDictionaryRef isa = sub_1000E2360().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v53 = CFUserNotificationCreate(kCFAllocatorDefault, (double)a3, 2uLL, &error, isa);

  if (v53)
  {
    if (qword_1001161F8 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_1000E2030();
    sub_10000AD90(v54, (uint64_t)qword_10011C038);
    uint64_t v55 = sub_1000E2010();
    os_log_type_t v56 = sub_1000E2700();
    if (os_log_type_enabled(v55, v56))
    {
      char v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "[Auth] Presenting password entry alert.", v57, 2u);
      swift_slowDealloc();
    }

    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v53, (double)a3, &responseFlags);
    if (responseFlags == 1)
    {
      unint64_t v67 = sub_1000E2010();
      os_log_type_t v68 = sub_1000E2700();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v69 = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "[Auth] Alert cancelled, aborting authentication.", v69, 2u);
        swift_slowDealloc();
      }

      CFUserNotificationCancel(v53);
      (id)TUMakeNeighborhoodConduitError();
      sub_100004D9C(&qword_100119B90);
      sub_1000E2590();
      goto LABEL_36;
    }
    if (responseFlags)
    {
LABEL_36:

      return;
    }
    id v58 = sub_1000E2010();
    os_log_type_t v59 = sub_1000E2700();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "[Auth] Password entered, trying with client.", v60, 2u);
      swift_slowDealloc();
    }

    CFStringRef v61 = (id)CFUserNotificationGetResponseValue(v53, v36, 0);
    if (v61)
    {
      id v62 = (__CFString *)v61;
      sub_1000E23F0();

      sub_100004D9C(&qword_100119B90);
      sub_1000E25A0();
      goto LABEL_36;
    }
    goto LABEL_50;
  }
  if (qword_1001161F8 != -1) {
    swift_once();
  }
  uint64_t v63 = sub_1000E2030();
  sub_10000AD90(v63, (uint64_t)qword_10011C038);
  uint64_t v64 = sub_1000E2010();
  os_log_type_t v65 = sub_1000E26E0();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v66 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "[Auth] Failed to create user notification for password entry.", v66, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000E03C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_uuid;
  uint64_t v2 = sub_1000E1140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_nearbyDeviceHandle));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService28UnauthenticatedConduitDevice_device));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000E0490()
{
  return type metadata accessor for UnauthenticatedConduitDevice();
}

uint64_t type metadata accessor for UnauthenticatedConduitDevice()
{
  uint64_t result = qword_100119AC0;
  if (!qword_100119AC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000E04E4()
{
  uint64_t result = sub_1000E1140();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000E0590()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000E05A0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000E05D8()
{
  uint64_t v1 = sub_100004D9C(&qword_100118630);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000E06B8(uint64_t a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = *(void *)(sub_100004D9C(&qword_100118630) - 8);
  uint64_t v6 = v2[2];
  uint64_t v7 = (void *)v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000DDE60(a1, v4, v6, v7, v8, v9);
}

uint64_t sub_1000E0744()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000E078C(int a1, int a2)
{
  return sub_1000DE848(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_1000E0798(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000E07A8()
{
  return swift_release();
}

uint64_t sub_1000E07B0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000E07E8()
{
  return sub_1000DF1E4(*(void (**)(uint64_t, uint64_t))(v0 + 16));
}

uint64_t sub_1000E07F0(uint64_t a1)
{
  return sub_1000DF258(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_1000E07F8(uint64_t a1)
{
  return sub_1000DF2D0(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_1000E0800()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000E0848(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10000AFA4;
  return sub_1000DF330(a1, v4, v5, v6, v7, v8);
}

unint64_t sub_1000E0910()
{
  unint64_t result = qword_100119B70;
  if (!qword_100119B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100119B70);
  }
  return result;
}

uint64_t sub_1000E0964()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000E09B4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  int v8 = *(_DWORD *)(v1 + 48);
  int v9 = *(_DWORD *)(v1 + 52);
  uint64_t v10 = *(void *)(v1 + 56);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000AFA4;
  return sub_1000DE9A4(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000E0AA0(uint64_t a1)
{
  return sub_1000DF6F8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(_DWORD *)(v1 + 32));
}

uint64_t sub_1000E0AAC()
{
  uint64_t v1 = sub_100004D9C(&qword_100119B90);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 36) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000E0B7C()
{
  uint64_t v1 = *(void *)(sub_100004D9C(&qword_100119B90) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  int v4 = *(_DWORD *)(v0 + 32);
  uint64_t v5 = (void *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  sub_1000DFB50(v2, v3, v4, v5);
}

uint64_t sub_1000E0BE8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000E0C30()
{
  unint64_t result = qword_100119BA8;
  if (!qword_100119BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100119BA8);
  }
  return result;
}

uint64_t sub_1000E0C84(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_1000E0C90(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_1000E0C9C(uint64_t a1)
{
  uint64_t v2 = sub_100004D9C(&qword_100118640);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for AuthenticationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1000E0DC8);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationError()
{
  return &type metadata for AuthenticationError;
}

unint64_t sub_1000E0E04()
{
  unint64_t result = qword_100119BB0;
  if (!qword_100119BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100119BB0);
  }
  return result;
}

uint64_t sub_1000E0E80()
{
  return POSIXError._nsError.getter();
}

uint64_t sub_1000E0E90()
{
  return type metadata accessor for POSIXError();
}

uint64_t sub_1000E0EA0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E0EB0()
{
  return Notification.object.getter();
}

uint64_t sub_1000E0EC0()
{
  return type metadata accessor for Notification();
}

uint64_t sub_1000E0ED0()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_1000E0EE0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_1000E0EF0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_1000E0F00()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1000E0F10()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_1000E0F60(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000E0F70()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_1000E0F80()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_1000E0F90()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_1000E0FA0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_1000E0FB0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000E0FC0()
{
  return _convertNSErrorToError(_:)();
}

void sub_1000E0FD0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000E0FE0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000E0FF0()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_1000E1000()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E1010()
{
  return type metadata accessor for URL();
}

void sub_1000E1020(NSDecimal *retstr@<X8>, NSDecimal *a2@<X0>, Swift::Int a3@<X1>)
{
}

uint64_t sub_1000E1030()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_1000E1040()
{
  return type metadata accessor for Data.RangeReference();
}

NSData sub_1000E1050()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000E1060()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E1070()
{
  return Data.hash(into:)();
}

uint64_t sub_1000E1080()
{
  return Data.copyBytes(to:count:)();
}

uint64_t sub_1000E1090()
{
  return Data.hashValue.getter();
}

NSDate sub_1000E10A0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000E10B0()
{
  return Date.init()();
}

uint64_t sub_1000E10C0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000E10D0()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_1000E10E0()
{
  return UUID.uuidString.getter();
}

NSUUID sub_1000E10F0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_1000E1100()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_1000E1110()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E1120()
{
  return UUID.uuid.getter();
}

uint64_t sub_1000E1130()
{
  return UUID.init()();
}

uint64_t sub_1000E1140()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000E1150()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000E1160()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_1000E1170()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_1000E1180()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000E1190()
{
  return Google_Protobuf_Value.init(BOOLValue:)();
}

uint64_t sub_1000E11A0()
{
  return Google_Protobuf_Value.init(numberValue:)();
}

uint64_t sub_1000E11B0()
{
  return Google_Protobuf_Value.init(stringValue:)();
}

uint64_t sub_1000E11C0()
{
  return type metadata accessor for Google_Protobuf_Value();
}

uint64_t sub_1000E11D0()
{
  return BinaryDecodingOptions.init()();
}

uint64_t sub_1000E11E0()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t sub_1000E11F0()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t sub_1000E1200()
{
  return Message.serializedData(partial:)();
}

uint64_t sub_1000E1210()
{
  return static Message.with(_:)();
}

uint64_t sub_1000E1220()
{
  return NCProtoCallInfo.displayName.setter();
}

uint64_t sub_1000E1230()
{
  return NCProtoCallInfo.callIdentifier.setter();
}

uint64_t sub_1000E1240()
{
  return NCProtoCallInfo.senderIdentity.setter();
}

uint64_t sub_1000E1250()
{
  return NCProtoCallInfo.callerIDSubstring.setter();
}

uint64_t sub_1000E1260()
{
  return NCProtoCallInfo.contactIdentifiersByHandle.setter();
}

uint64_t sub_1000E1270()
{
  return NCProtoCallInfo.isBranded.setter();
}

uint64_t sub_1000E1280()
{
  return type metadata accessor for NCProtoCallInfo();
}

uint64_t sub_1000E1290()
{
  return NCProtoCallState.isAudioEnabled.getter();
}

uint64_t sub_1000E12A0()
{
  return NCProtoCallState.isAudioEnabled.setter();
}

uint64_t sub_1000E12B0()
{
  return NCProtoCallState.isVideoEnabled.getter();
}

uint64_t sub_1000E12C0()
{
  return NCProtoCallState.isVideoEnabled.setter();
}

uint64_t sub_1000E12D0()
{
  return NCProtoCallState.hasIsAudioEnabled.getter();
}

uint64_t sub_1000E12E0()
{
  return NCProtoCallState.hasIsVideoEnabled.getter();
}

uint64_t sub_1000E12F0()
{
  return NCProtoCallState.isCaptioningEnabled.getter();
}

uint64_t sub_1000E1300()
{
  return NCProtoCallState.isCaptioningEnabled.setter();
}

uint64_t sub_1000E1310()
{
  return NCProtoCallState.hasIsCaptioningEnabled.getter();
}

uint64_t sub_1000E1320()
{
  return NCProtoCallState.avMode.getter();
}

uint64_t sub_1000E1330()
{
  return NCProtoCallState.avMode.setter();
}

uint64_t sub_1000E1340()
{
  return NCProtoCallState.hasAvMode.getter();
}

uint64_t sub_1000E1350()
{
  return type metadata accessor for NCProtoCallState();
}

uint64_t sub_1000E1360()
{
  return NCProtoJoinEvent.policyInfos.setter();
}

uint64_t sub_1000E1370()
{
  return NCProtoJoinEvent.identifierHash.setter();
}

uint64_t sub_1000E1380()
{
  return NCProtoJoinEvent.userAccountInfoData.setter();
}

uint64_t sub_1000E1390()
{
  return type metadata accessor for NCProtoJoinEvent();
}

uint64_t sub_1000E13A0()
{
  return NCProtoContactInfo.familyName.setter();
}

uint64_t sub_1000E13B0()
{
  return NCProtoContactInfo.identifier.setter();
}

uint64_t sub_1000E13C0()
{
  return NCProtoContactInfo.middleName.setter();
}

uint64_t sub_1000E13D0()
{
  return NCProtoContactInfo.namePrefix.setter();
}

uint64_t sub_1000E13E0()
{
  return NCProtoContactInfo.nameSuffix.setter();
}

uint64_t sub_1000E13F0()
{
  return NCProtoContactInfo.organizationName.setter();
}

uint64_t sub_1000E1400()
{
  return NCProtoContactInfo.nickname.setter();
}

uint64_t sub_1000E1410()
{
  return NCProtoContactInfo.givenName.setter();
}

uint64_t sub_1000E1420()
{
  return NCProtoContactInfo.imageData.setter();
}

uint64_t sub_1000E1430()
{
  return type metadata accessor for NCProtoContactInfo();
}

uint64_t sub_1000E1440()
{
  return NCProtoContinuityCall.uuidString.getter();
}

uint64_t sub_1000E1450()
{
  return NCProtoContinuityCall.uuidString.setter();
}

uint64_t sub_1000E1460()
{
  return NCProtoContinuityCall.displayName.getter();
}

uint64_t sub_1000E1470()
{
  return NCProtoContinuityCall.displayName.setter();
}

uint64_t sub_1000E1480()
{
  return NCProtoContinuityCall.isCameraEnabled.setter();
}

uint64_t sub_1000E1490()
{
  return NCProtoContinuityCall.callGroupUuidString.setter();
}

uint64_t sub_1000E14A0()
{
  return NCProtoContinuityCall.conversationUuidString.getter();
}

uint64_t sub_1000E14B0()
{
  return NCProtoContinuityCall.conversationUuidString.setter();
}

uint64_t sub_1000E14C0()
{
  return NCProtoContinuityCall.info.setter();
}

uint64_t sub_1000E14D0()
{
  return NCProtoContinuityCall.Status.rawValue.getter();
}

uint64_t sub_1000E14E0()
{
  return type metadata accessor for NCProtoContinuityCall.Status();
}

uint64_t sub_1000E14F0()
{
  return NCProtoContinuityCall.status.getter();
}

uint64_t sub_1000E1500()
{
  return NCProtoContinuityCall.status.setter();
}

uint64_t sub_1000E1510()
{
  return NCProtoContinuityCall.isMuted.setter();
}

uint64_t sub_1000E1520()
{
  return type metadata accessor for NCProtoContinuityCall();
}

uint64_t sub_1000E1530()
{
  return NCProtoSenderIdentity.name.setter();
}

uint64_t sub_1000E1540()
{
  return NCProtoSenderIdentity.shortName.setter();
}

uint64_t sub_1000E1550()
{
  return type metadata accessor for NCProtoSenderIdentity();
}

uint64_t sub_1000E1560()
{
  return NCProtoIDSProxyMessage.Resource.resourceData.setter();
}

uint64_t sub_1000E1570()
{
  return NCProtoIDSProxyMessage.Resource.fromID.setter();
}

uint64_t sub_1000E1580()
{
  return NCProtoIDSProxyMessage.Resource.context.setter();
}

uint64_t sub_1000E1590()
{
  return NCProtoIDSProxyMessage.Resource.metadata.setter();
}

uint64_t sub_1000E15A0()
{
  return type metadata accessor for NCProtoIDSProxyMessage.Resource();
}

uint64_t sub_1000E15B0()
{
  return NCProtoIDSProxyMessage.resource.setter();
}

uint64_t sub_1000E15C0()
{
  return type metadata accessor for NCProtoIDSProxyMessage();
}

uint64_t sub_1000E15D0()
{
  return type metadata accessor for NCProtoTVLaunchedEvent();
}

uint64_t sub_1000E15E0()
{
  return NCProtoAddMemberRequest.memberToken.getter();
}

uint64_t sub_1000E15F0()
{
  return NCProtoAddMemberRequest.associationVoucherData.getter();
}

uint64_t sub_1000E1600()
{
  return NCProtoAddMemberRequest.conversationIdentifier.getter();
}

uint64_t sub_1000E1610()
{
  return NCProtoAddMemberRequest.hasAssociationVoucherData.getter();
}

uint64_t sub_1000E1620()
{
  return NCProtoAddMemberRequest.NearbyConversationPullContext.rawValue.getter();
}

uint64_t sub_1000E1630()
{
  return type metadata accessor for NCProtoAddMemberRequest.NearbyConversationPullContext();
}

uint64_t sub_1000E1640()
{
  return NCProtoAddMemberRequest.context.getter();
}

uint64_t sub_1000E1650()
{
  return type metadata accessor for NCProtoAddMemberRequest();
}

uint64_t sub_1000E1660()
{
  return NCProtoCallStateRequest.identifierHash.setter();
}

uint64_t sub_1000E1670()
{
  return type metadata accessor for NCProtoCallStateRequest();
}

uint64_t sub_1000E1680()
{
  return NCProtoAddMemberResponse.policyInfos.setter();
}

uint64_t sub_1000E1690()
{
  return NCProtoAddMemberResponse.identifierHash.setter();
}

uint64_t sub_1000E16A0()
{
  return type metadata accessor for NCProtoAddMemberResponse();
}

uint64_t sub_1000E16B0()
{
  return NCProtoCallStateResponse.callState.getter();
}

uint64_t sub_1000E16C0()
{
  return type metadata accessor for NCProtoCallStateResponse();
}

uint64_t sub_1000E16D0()
{
  return type metadata accessor for NCProtoConversationState();
}

uint64_t sub_1000E16E0()
{
  return NCProtoDisconnectRequest.DisconnectReason.rawValue.getter();
}

uint64_t sub_1000E16F0()
{
  return type metadata accessor for NCProtoDisconnectRequest.DisconnectReason();
}

uint64_t sub_1000E1700()
{
  return NCProtoDisconnectRequest.identifierHash.setter();
}

uint64_t sub_1000E1710()
{
  return NCProtoDisconnectRequest.disconnectReason.setter();
}

uint64_t sub_1000E1720()
{
  return NCProtoDisconnectRequest.isPullingBackToPhone.setter();
}

uint64_t sub_1000E1730()
{
  return type metadata accessor for NCProtoDisconnectRequest();
}

uint64_t sub_1000E1740()
{
  return NCProtoEndedSessionEvent.identifier.setter();
}

uint64_t sub_1000E1750()
{
  return type metadata accessor for NCProtoEndedSessionEvent();
}

uint64_t sub_1000E1760()
{
  return NCProtoActiveConversation.uuidString.setter();
}

uint64_t sub_1000E1770()
{
  return NCProtoActiveConversation.displayName.setter();
}

uint64_t sub_1000E1780()
{
  return NCProtoActiveConversation.remoteMemberCount.setter();
}

uint64_t sub_1000E1790()
{
  return NCProtoActiveConversation.letMeInRequestState.setter();
}

uint64_t sub_1000E17A0()
{
  return NCProtoActiveConversation.remoteMemberContactIdentifiers.setter();
}

uint64_t sub_1000E17B0()
{
  return NCProtoActiveConversation.state.setter();
}

uint64_t sub_1000E17C0()
{
  return NCProtoActiveConversation.avMode.setter();
}

uint64_t sub_1000E17D0()
{
  return type metadata accessor for NCProtoActiveConversation();
}

uint64_t sub_1000E17E0()
{
  return NCProtoAddressableContact.contactInfo.setter();
}

uint64_t sub_1000E17F0()
{
  return NCProtoAddressableContact.handleAnonyms.setter();
}

uint64_t sub_1000E1800()
{
  return NCProtoAddressableContact.contactIdentifier.setter();
}

uint64_t sub_1000E1810()
{
  return NCProtoAddressableContact.init()();
}

uint64_t sub_1000E1820()
{
  return type metadata accessor for NCProtoAddressableContact();
}

uint64_t sub_1000E1830()
{
  return NCProtoContactUpdateEvent.identifierHash.setter();
}

uint64_t sub_1000E1840()
{
  return NCProtoContactUpdateEvent.contacts.setter();
}

uint64_t sub_1000E1850()
{
  return type metadata accessor for NCProtoContactUpdateEvent();
}

uint64_t sub_1000E1860()
{
  return NCProtoContinuityFavorite.actionType.setter();
}

uint64_t sub_1000E1870()
{
  return NCProtoContinuityFavorite.contactInfo.setter();
}

uint64_t sub_1000E1880()
{
  return NCProtoContinuityFavorite.bundleIdentifier.setter();
}

uint64_t sub_1000E1890()
{
  return NCProtoContinuityFavorite.contactIdentifier.setter();
}

uint64_t sub_1000E18A0()
{
  return NCProtoContinuityFavorite.anonym.setter();
}

uint64_t sub_1000E18B0()
{
  return type metadata accessor for NCProtoContinuityFavorite();
}

uint64_t sub_1000E18C0()
{
  return type metadata accessor for NCProtoConversationAVMode();
}

uint64_t sub_1000E18D0()
{
  return NCProtoDeviceTokenRequest.shouldLaunchFaceTime.setter();
}

uint64_t sub_1000E18E0()
{
  return NCProtoDeviceTokenRequest.conversationIdentifier.setter();
}

uint64_t sub_1000E18F0()
{
  return type metadata accessor for NCProtoDeviceTokenRequest.ConversationHandoffType();
}

uint64_t sub_1000E1900()
{
  return NCProtoDeviceTokenRequest.conversationHandoffType.setter();
}

uint64_t sub_1000E1910()
{
  return NCProtoDeviceTokenRequest.memberAssociationPrimaryInfo.setter();
}

uint64_t sub_1000E1920()
{
  return NCProtoDeviceTokenRequest.callState.setter();
}

uint64_t sub_1000E1930()
{
  return type metadata accessor for NCProtoDeviceTokenRequest();
}

uint64_t sub_1000E1940()
{
  return NCProtoDisconnectResponse.success.getter();
}

uint64_t sub_1000E1950()
{
  return type metadata accessor for NCProtoDisconnectResponse();
}

uint64_t sub_1000E1960()
{
  return type metadata accessor for NCProtoContactHandleAnonym.AnonymType();
}

uint64_t sub_1000E1970()
{
  return NCProtoContactHandleAnonym.identifier.setter();
}

uint64_t sub_1000E1980()
{
  return NCProtoContactHandleAnonym.localizedLabel.setter();
}

uint64_t sub_1000E1990()
{
  return NCProtoContactHandleAnonym.type.setter();
}

uint64_t sub_1000E19A0()
{
  return NCProtoContactHandleAnonym.label.setter();
}

uint64_t sub_1000E19B0()
{
  return NCProtoContactHandleAnonym.init()();
}

uint64_t sub_1000E19C0()
{
  return type metadata accessor for NCProtoContactHandleAnonym();
}

uint64_t sub_1000E19D0()
{
  return NCProtoDeviceLaunchedEvent.init()();
}

uint64_t sub_1000E19E0()
{
  return type metadata accessor for NCProtoDeviceLaunchedEvent();
}

uint64_t sub_1000E19F0()
{
  return NCProtoDeviceTokenResponse.deviceToken.getter();
}

uint64_t sub_1000E1A00()
{
  return NCProtoDeviceTokenResponse.associationVoucherData.getter();
}

uint64_t sub_1000E1A10()
{
  return NCProtoDeviceTokenResponse.hasAssociationVoucherData.getter();
}

uint64_t sub_1000E1A20()
{
  return type metadata accessor for NCProtoDeviceTokenResponse();
}

uint64_t sub_1000E1A30()
{
  return NCProtoStartedSessionEvent.identifier.setter();
}

uint64_t sub_1000E1A40()
{
  return NCProtoStartedSessionEvent.userAccountInfoData.setter();
}

uint64_t sub_1000E1A50()
{
  return NCProtoStartedSessionEvent.memberAssociationPrimaryInfo.setter();
}

uint64_t sub_1000E1A60()
{
  return NCProtoStartedSessionEvent.avMode.setter();
}

uint64_t sub_1000E1A70()
{
  return type metadata accessor for NCProtoStartedSessionEvent();
}

uint64_t sub_1000E1A80()
{
  return type metadata accessor for NCProtoCancelAddMemberEvent();
}

uint64_t sub_1000E1A90()
{
  return type metadata accessor for NCProtoEndLagunaSessionEvent();
}

uint64_t sub_1000E1AA0()
{
  return NCProtoPolicyInfoUpdatedEvent.policyInfos.setter();
}

uint64_t sub_1000E1AB0()
{
  return type metadata accessor for NCProtoPolicyInfoUpdatedEvent();
}

uint64_t sub_1000E1AC0()
{
  return type metadata accessor for NCProtoFavoritesDidChangeEvent();
}

uint64_t sub_1000E1AD0()
{
  return NCProtoLagunaConnectionRequest.recentCalls.setter();
}

uint64_t sub_1000E1AE0()
{
  return NCProtoLagunaConnectionRequest.contactInfos.setter();
}

uint64_t sub_1000E1AF0()
{
  return NCProtoLagunaConnectionRequest.continuityCalls.setter();
}

uint64_t sub_1000E1B00()
{
  return NCProtoLagunaConnectionRequest.activeConversations.setter();
}

uint64_t sub_1000E1B10()
{
  return NCProtoLagunaConnectionRequest.callState.setter();
}

uint64_t sub_1000E1B20()
{
  return NCProtoLagunaConnectionRequest.favorites.setter();
}

uint64_t sub_1000E1B30()
{
  return type metadata accessor for NCProtoLagunaConnectionRequest();
}

uint64_t sub_1000E1B40()
{
  return NCProtoSuggestionAdvertisement.SuggestionType.init(rawValue:)();
}

uint64_t sub_1000E1B50()
{
  return type metadata accessor for NCProtoSuggestionAdvertisement.SuggestionType();
}

uint64_t sub_1000E1B60()
{
  return NCProtoSuggestionAdvertisement.deviceIdentifier.setter();
}

uint64_t sub_1000E1B70()
{
  return NCProtoSuggestionAdvertisement.suggestionIdentifier.setter();
}

uint64_t sub_1000E1B80()
{
  return NCProtoSuggestionAdvertisement.type.setter();
}

uint64_t sub_1000E1B90()
{
  return type metadata accessor for NCProtoSuggestionAdvertisement();
}

uint64_t sub_1000E1BA0()
{
  return type metadata accessor for NCProtoLagunaConnectionResponse();
}

uint64_t sub_1000E1BB0()
{
  return NCProtoStartConversationRequest.avMode.getter();
}

uint64_t sub_1000E1BC0()
{
  return type metadata accessor for NCProtoStartConversationRequest();
}

uint64_t sub_1000E1BD0()
{
  return NCProtoGetImageForContactRequest.contactIdentifier.getter();
}

uint64_t sub_1000E1BE0()
{
  return type metadata accessor for NCProtoGetImageForContactRequest();
}

uint64_t sub_1000E1BF0()
{
  return NCProtoRecentCallsDidChangeEvent.recentCalls.setter();
}

uint64_t sub_1000E1C00()
{
  return NCProtoRecentCallsDidChangeEvent.contactInfos.setter();
}

uint64_t sub_1000E1C10()
{
  return type metadata accessor for NCProtoRecentCallsDidChangeEvent();
}

uint64_t sub_1000E1C20()
{
  return NCProtoStartConversationResponse.init()();
}

uint64_t sub_1000E1C30()
{
  return type metadata accessor for NCProtoStartConversationResponse();
}

uint64_t sub_1000E1C40()
{
  return type metadata accessor for NCProtoStartLagunaSessionRequest.RecentCallFetchType();
}

uint64_t sub_1000E1C50()
{
  return NCProtoStartLagunaSessionRequest.recentCallFetchTypes.getter();
}

uint64_t sub_1000E1C60()
{
  return type metadata accessor for NCProtoStartLagunaSessionRequest();
}

uint64_t sub_1000E1C70()
{
  return NCProtoGetImageForContactResponse.imageData.setter();
}

uint64_t sub_1000E1C80()
{
  return type metadata accessor for NCProtoGetImageForContactResponse();
}

uint64_t sub_1000E1C90()
{
  return NCProtoStartLagunaSessionResponse.recentCalls.setter();
}

uint64_t sub_1000E1CA0()
{
  return NCProtoStartLagunaSessionResponse.contactInfos.setter();
}

uint64_t sub_1000E1CB0()
{
  return NCProtoStartLagunaSessionResponse.continuityCalls.setter();
}

uint64_t sub_1000E1CC0()
{
  return NCProtoStartLagunaSessionResponse.activeConversations.setter();
}

uint64_t sub_1000E1CD0()
{
  return NCProtoStartLagunaSessionResponse.favorites.setter();
}

uint64_t sub_1000E1CE0()
{
  return type metadata accessor for NCProtoStartLagunaSessionResponse();
}

uint64_t sub_1000E1CF0()
{
  return NCProtoDeclineContinuityCallRequest.uuidString.getter();
}

uint64_t sub_1000E1D00()
{
  return type metadata accessor for NCProtoDeclineContinuityCallRequest();
}

uint64_t sub_1000E1D10()
{
  return type metadata accessor for NCProtoMemberAssociationPrimaryInfo.MemberAssociationType();
}

uint64_t sub_1000E1D20()
{
  return NCProtoMemberAssociationPrimaryInfo.handleData.setter();
}

uint64_t sub_1000E1D30()
{
  return NCProtoMemberAssociationPrimaryInfo.identifier.setter();
}

uint64_t sub_1000E1D40()
{
  return NCProtoMemberAssociationPrimaryInfo.avcIdentifier.setter();
}

uint64_t sub_1000E1D50()
{
  return NCProtoMemberAssociationPrimaryInfo.supportedTypes.setter();
}

uint64_t sub_1000E1D60()
{
  return NCProtoMemberAssociationPrimaryInfo.conversationGroupUuidString.setter();
}

uint64_t sub_1000E1D70()
{
  return type metadata accessor for NCProtoMemberAssociationPrimaryInfo();
}

uint64_t sub_1000E1D80()
{
  return type metadata accessor for NCProtoPullLagunaSessionToTVRequest.Reason();
}

uint64_t sub_1000E1D90()
{
  return NCProtoPullLagunaSessionToTVRequest.reason.getter();
}

uint64_t sub_1000E1DA0()
{
  return NCProtoPullLagunaSessionToTVRequest.hasReason.getter();
}

uint64_t sub_1000E1DB0()
{
  return type metadata accessor for NCProtoPullLagunaSessionToTVRequest();
}

uint64_t sub_1000E1DC0()
{
  return type metadata accessor for NCProtoContinuityCallsDidChangeEvent();
}

uint64_t sub_1000E1DD0()
{
  return NCProtoDeclineContinuityCallResponse.init()();
}

uint64_t sub_1000E1DE0()
{
  return type metadata accessor for NCProtoDeclineContinuityCallResponse();
}

uint64_t sub_1000E1DF0()
{
  return type metadata accessor for NCProtoGetAddressableContactsRequest();
}

uint64_t sub_1000E1E00()
{
  return NCProtoJoinActiveConversationRequest.activeConversationUuidString.getter();
}

uint64_t sub_1000E1E10()
{
  return NCProtoJoinActiveConversationRequest.isAudioEnabled.getter();
}

uint64_t sub_1000E1E20()
{
  return NCProtoJoinActiveConversationRequest.isVideoEnabled.getter();
}

uint64_t sub_1000E1E30()
{
  return NCProtoJoinActiveConversationRequest.hasIsAudioEnabled.getter();
}

uint64_t sub_1000E1E40()
{
  return NCProtoJoinActiveConversationRequest.hasIsVideoEnabled.getter();
}

uint64_t sub_1000E1E50()
{
  return type metadata accessor for NCProtoJoinActiveConversationRequest();
}

uint64_t sub_1000E1E60()
{
  return NCProtoPullLagunaSessionToTVResponse.init()();
}

uint64_t sub_1000E1E70()
{
  return type metadata accessor for NCProtoPullLagunaSessionToTVResponse();
}

uint64_t sub_1000E1E80()
{
  return NCProtoGetAddressableContactsResponse.contactSortOrder.setter();
}

uint64_t sub_1000E1E90()
{
  return NCProtoGetAddressableContactsResponse.contacts.setter();
}

uint64_t sub_1000E1EA0()
{
  return type metadata accessor for NCProtoGetAddressableContactsResponse();
}

uint64_t sub_1000E1EB0()
{
  return NCProtoJoinActiveConversationResponse.init()();
}

uint64_t sub_1000E1EC0()
{
  return type metadata accessor for NCProtoJoinActiveConversationResponse();
}

uint64_t sub_1000E1ED0()
{
  return type metadata accessor for NCProtoConversationLetMeInRequestState();
}

uint64_t sub_1000E1EE0()
{
  return NCProtoActiveConversationsDidChangeEvent.activeConversations.setter();
}

uint64_t sub_1000E1EF0()
{
  return type metadata accessor for NCProtoActiveConversationsDidChangeEvent();
}

uint64_t sub_1000E1F00()
{
  return NCProtoAddConversationParticipantsRequest.handleValues.getter();
}

uint64_t sub_1000E1F10()
{
  return type metadata accessor for NCProtoAddConversationParticipantsRequest();
}

uint64_t sub_1000E1F20()
{
  return NCProtoAddConversationParticipantsResponse.init()();
}

uint64_t sub_1000E1F30()
{
  return type metadata accessor for NCProtoAddConversationParticipantsResponse();
}

uint64_t sub_1000E1F40()
{
  return NCProtoSuggestionAdvertisementDidChangeEvent.advertisement.setter();
}

uint64_t sub_1000E1F50()
{
  return type metadata accessor for NCProtoSuggestionAdvertisementDidChangeEvent();
}

uint64_t sub_1000E1F60()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_1000E1F70()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_1000E1F80()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_1000E1F90()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_1000E1FA0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_1000E1FB0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_1000E1FC0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_1000E1FD0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_1000E1FE0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_1000E1FF0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_1000E2000()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_1000E2010()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000E2020()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000E2030()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000E2040()
{
  return type metadata accessor for Publishers.HandleEvents();
}

uint64_t sub_1000E2050()
{
  return Publishers.Filter.filter(_:)();
}

uint64_t sub_1000E2060()
{
  return type metadata accessor for Publishers.ReceiveOn();
}

uint64_t sub_1000E2070()
{
  return type metadata accessor for Subscribers.Completion();
}

uint64_t sub_1000E2080()
{
  return static Subscribers.Demand.unlimited.getter();
}

uint64_t sub_1000E2090()
{
  return type metadata accessor for AnyPublisher();
}

uint64_t sub_1000E20A0()
{
  return AnyCancellable.store(in:)();
}

void sub_1000E20B0()
{
}

uint64_t sub_1000E20C0()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_1000E20D0()
{
  return PassthroughSubject.send(completion:)();
}

uint64_t sub_1000E20E0()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_1000E20F0()
{
  return PassthroughSubject.init()();
}

uint64_t sub_1000E2100()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t sub_1000E2110()
{
  return CurrentValueSubject.value.getter();
}

uint64_t sub_1000E2120()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t sub_1000E2130()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_1000E2140()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t sub_1000E2150()
{
  return Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
}

uint64_t sub_1000E2160()
{
  return Publisher.scan<A>(_:_:)();
}

uint64_t sub_1000E2170()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_1000E2180()
{
  return Publisher.filter(_:)();
}

uint64_t sub_1000E2190()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_1000E21A0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1000E21B0()
{
  return Publisher<>.flatMap<A>(maxPublishers:_:)();
}

uint64_t sub_1000E21C0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000E21D0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000E21E0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1000E21F0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000E2200()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000E2210()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000E2220()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000E2230()
{
  return static DispatchWallTime.now()();
}

uint64_t sub_1000E2240()
{
  return type metadata accessor for DispatchWallTime();
}

uint64_t sub_1000E2250()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_1000E2260()
{
  return + infix(_:_:)();
}

uint64_t sub_1000E2270()
{
  return + infix(_:_:)();
}

uint64_t sub_1000E2280()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_1000E2290()
{
  return SHA256Digest.withUnsafeBytes<A>(_:)();
}

uint64_t sub_1000E22A0()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_1000E22B0()
{
  return SHA512Digest.withUnsafeBytes<A>(_:)();
}

uint64_t sub_1000E22C0()
{
  return type metadata accessor for SHA512Digest();
}

uint64_t sub_1000E22D0()
{
  return SHA256.update(bufferPointer:)();
}

uint64_t sub_1000E22E0()
{
  return SHA256.finalize()();
}

uint64_t sub_1000E22F0()
{
  return SHA256.init()();
}

uint64_t sub_1000E2300()
{
  return type metadata accessor for SHA256();
}

uint64_t sub_1000E2310()
{
  return SHA512.update(bufferPointer:)();
}

uint64_t sub_1000E2320()
{
  return SHA512.finalize()();
}

uint64_t sub_1000E2330()
{
  return SHA512.init()();
}

uint64_t sub_1000E2340()
{
  return type metadata accessor for SHA512();
}

uint64_t sub_1000E2350()
{
  return CancellationError.init()();
}

NSDictionary sub_1000E2360()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000E2370()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E2380()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000E2390()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000E23A0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_1000E23B0()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_1000E23C0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000E23D0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000E23E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000E23F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E2400()
{
  return String.init(format:_:)();
}

uint64_t sub_1000E2410()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000E2420()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_1000E2430()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_1000E2440()
{
  return String.hash(into:)();
}

void sub_1000E2450(Swift::String a1)
{
}

Swift::Int sub_1000E2460()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000E2470()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_1000E2480()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000E24A0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_1000E24B0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_1000E24C0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_1000E24D0()
{
  return String.subscript.getter();
}

uint64_t sub_1000E24E0()
{
  return Sequence.publisher.getter();
}

uint64_t sub_1000E24F0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000E2500()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000E2510()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000E2520()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E2530()
{
  return Array.description.getter();
}

uint64_t sub_1000E2540()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000E2550()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000E2560()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000E2570()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000E2580()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000E2590()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_1000E25A0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000E25B0()
{
  return type metadata accessor for CheckedContinuation();
}

uint64_t sub_1000E25C0()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_1000E25D0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000E25E0()
{
  return type metadata accessor for TaskPriority();
}

void sub_1000E2600()
{
}

uint64_t sub_1000E2620()
{
  return static Task<>.checkCancellation()();
}

void sub_1000E2640()
{
}

NSSet sub_1000E2650()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000E2660()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E2670()
{
  return Set.description.getter();
}

uint64_t sub_1000E2680()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000E2690()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_1000E26A0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_1000E26B0()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_1000E26C0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000E26D0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000E26E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000E26F0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000E2700()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000E2710()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_1000E2720()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1000E2730()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_1000E2740()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_1000E2750()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_1000E2760()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_1000E2770()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000E2780()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000E2790()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_1000E27A0()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags();
}

uint64_t sub_1000E27B0()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t sub_1000E27C0()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

void sub_1000E27D0()
{
}

void sub_1000E27E0()
{
}

uint64_t sub_1000E27F0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_1000E2800()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_1000E2810()
{
  return OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)();
}

Swift::Int sub_1000E2820(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000E2830()
{
  return static NSObject.== infix(_:_:)();
}

void sub_1000E2840(NSDecimal *retstr@<X8>, Swift::Int a2@<X0>)
{
}

uint64_t sub_1000E2850()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_1000E2860()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1000E2870()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000E2880()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000E2890()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000E28A0()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t sub_1000E28B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000E28C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000E28D0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000E28E0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000E28F0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_1000E2900()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000E2910()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_1000E2920()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_1000E2930()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_1000E2940()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_1000E2950()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000E2960()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_1000E2970()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_1000E2990()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_1000E29A0()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_1000E29B0()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_1000E29C0()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int sub_1000E29D0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000E29E0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000E29F0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000E2A10()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000E2A20()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000E2A30()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_1000E2A40()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_1000E2A50()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

void sub_1000E2A60(Swift::Int a1)
{
}

uint64_t sub_1000E2A70()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000E2A80()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000E2A90()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000E2AA0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000E2AB0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000E2AC0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000E2AD0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000E2AE0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000E2AF0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000E2B00()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_1000E2B10()
{
  return ContinuousClock.init()();
}

uint64_t sub_1000E2B20()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_1000E2B30()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_1000E2B40()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000E2B50()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000E2B60()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000E2B70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000E2B80()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000E2B90()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000E2BA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000E2BB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000E2BD0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000E2BE0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000E2BF0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000E2C00()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_1000E2C20(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000E2C30()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000E2C50()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_1000E2C60()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000E2C80()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000E2CA0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000E2CC0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_1000E2CD0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000E2CE0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000E2CF0()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_1000E2D10()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000E2D20()
{
  return Error._code.getter();
}

uint64_t sub_1000E2D30()
{
  return Error._domain.getter();
}

uint64_t sub_1000E2D40()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000E2D50()
{
  return Hasher.init(_seed:)();
}

void sub_1000E2D60(Swift::UInt a1)
{
}

Swift::Int sub_1000E2D70()
{
  return Hasher._finalize()();
}

uint64_t sub_1000E2D80()
{
  return type metadata accessor for Result();
}

uint64_t sub_1000E2D90()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000E2DA0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_1000E2DB0()
{
  return static Duration.seconds(_:)();
}

uint64_t sub_1000E2DE0()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return _CFUserNotificationGetResponseValue(userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return _IDSCopyAddressDestinationForDestination();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return _IDSCopyIDForTokenWithID();
}

uint64_t IRCandidateClassificationToString()
{
  return _IRCandidateClassificationToString();
}

uint64_t TUBundle()
{
  return _TUBundle();
}

uint64_t TUCopyIDSFromIDForHandle()
{
  return _TUCopyIDSFromIDForHandle();
}

uint64_t TUIsIDSAvailableForFaceTime()
{
  return _TUIsIDSAvailableForFaceTime();
}

uint64_t TULockdownModeEnabled()
{
  return _TULockdownModeEnabled();
}

uint64_t TUMakeNeighborhoodConduitError()
{
  return _TUMakeNeighborhoodConduitError();
}

uint64_t TUOpenURLWithCompletion()
{
  return _TUOpenURLWithCompletion();
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return _TUPreferredFaceTimeBundleIdentifier();
}

uint64_t TURegisterIDSAvailabilityListener()
{
  return _TURegisterIDSAvailabilityListener();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _TUIsInternalInstall()
{
  return __TUIsInternalInstall();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_state_remove_handler()
{
  return _os_state_remove_handler();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}