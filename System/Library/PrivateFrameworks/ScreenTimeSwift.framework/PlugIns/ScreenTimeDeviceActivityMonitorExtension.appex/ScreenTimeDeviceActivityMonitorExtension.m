uint64_t type metadata accessor for DeviceActivityMonitorExtension()
{
  uint64_t result;

  result = qword_10000C1E0;
  if (!qword_10000C1E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000025D0()
{
  uint64_t result = sub_100006E30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100002668(uint64_t a1)
{
  uint64_t v3 = sub_100006CC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  v10 = (char *)&v61 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  v13 = (char *)&v61 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v61 - v14;
  uint64_t v16 = sub_100005740(&qword_10000C168);
  __chkstk_darwin(v16 - 8);
  v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006D20();
  v19 = (void (*)(uint64_t))sub_100006D30();
  v19(a1);
  uint64_t v20 = sub_100006D70();
  uint64_t v70 = v20;
  uint64_t v71 = sub_100006340(&qword_10000C170, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags);
  v21 = sub_100005784(&v68);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v20);
  LOBYTE(v20) = sub_100006BF0();
  uint64_t result = sub_1000060AC((uint64_t)&v68);
  if (v20)
  {
    uint64_t v64 = v4;
    v65 = v1;
    v62 = v10;
    v63 = v7;
    sub_100006DD0();
    swift_allocObject();
    uint64_t v23 = sub_100006DC0();
    if (sub_100006C00())
    {
      v24 = v65;
      v25 = sub_100006E10();
      os_log_type_t v26 = sub_100006EB0();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Downtime User Notification Requested", v27, 2u);
        swift_slowDealloc();
      }

      uint64_t v28 = sub_100006E90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v18, 1, 1, v28);
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = 0;
      *(void *)(v29 + 24) = 0;
      *(void *)(v29 + 32) = v24;
      v30 = v24;
      sub_100003E0C((uint64_t)v18, (uint64_t)&unk_10000C1C0, v29);
      swift_release();
      LOBYTE(v29) = sub_100006388();
      v31 = sub_100006E10();
      os_log_type_t v32 = sub_100006EB0();
      BOOL v33 = os_log_type_enabled(v31, v32);
      if (v29)
      {
        if (v33)
        {
          v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v34 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Downtime override is currently active. Ignoring Scheduled Downtime DeviceActivityMonitorExtension intervalDidStart.", v34, 2u);
          swift_slowDealloc();
        }

        return swift_release();
      }
      if (v33)
      {
        v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Scheduled Downtime DeviceActivityMonitorExtension intervalDidStart.", v40, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      uint64_t v61 = v23;
      sub_100006C90();
      sub_100006340(&qword_10000C1A0, (void (*)(uint64_t))&type metadata accessor for DeviceActivityName);
      uint64_t v35 = v3;
      sub_100006E60();
      sub_100006E60();
      if (v68 == v66 && v69 == v67) {
        char v36 = 1;
      }
      else {
        char v36 = sub_100006F20();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37 = *(void (**)(char *, uint64_t))(v64 + 8);
      v37(v15, v3);
      if (v36)
      {
        v31 = sub_100006E10();
        os_log_type_t v38 = sub_100006EB0();
        if (os_log_type_enabled(v31, v38))
        {
          v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v39 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v38, "Downtime Enable Override DeviceActivityMonitorExtension intervalDidStart.", v39, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        sub_100006CA0();
        sub_100006E60();
        sub_100006E60();
        if (v68 == v66 && v69 == v67)
        {
          swift_bridgeObjectRelease_n();
          v37(v13, v3);
        }
        else
        {
          char v41 = sub_100006F20();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v37(v13, v3);
          if ((v41 & 1) == 0)
          {
            char v44 = sub_100006C10();
            v45 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
            if (v44)
            {
              uint64_t v46 = a1;
              v47 = v62;
              v45(v62, v46, v3);
              v48 = sub_100006E10();
              os_log_type_t v49 = sub_100006EB0();
              if (os_log_type_enabled(v48, v49))
              {
                uint64_t v50 = swift_slowAlloc();
                v65 = v37;
                v51 = (uint8_t *)v50;
                uint64_t v68 = swift_slowAlloc();
                *(_DWORD *)v51 = 136446210;
                uint64_t v52 = sub_100006CB0();
                uint64_t v66 = sub_100005A54(v52, v53, &v68);
                sub_100006EC0();
                swift_bridgeObjectRelease();
                v65(v47, v35);
                _os_log_impl((void *)&_mh_execute_header, v48, v49, "Usage Limit DeviceActivityMonitorExtension intervalDidStart %{public}s", v51, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {

                v37(v47, v35);
              }
              sub_100006DB0();
            }
            else
            {
              v65 = v37;
              v54 = v63;
              v45(v63, a1, v3);
              v55 = sub_100006E10();
              os_log_type_t v56 = sub_100006EB0();
              if (os_log_type_enabled(v55, v56))
              {
                uint64_t v57 = swift_slowAlloc();
                uint64_t v64 = a1;
                v58 = (uint8_t *)v57;
                uint64_t v68 = swift_slowAlloc();
                *(_DWORD *)v58 = 136446210;
                uint64_t v59 = sub_100006CB0();
                uint64_t v66 = sub_100005A54(v59, v60, &v68);
                sub_100006EC0();
                swift_bridgeObjectRelease();
                v65(v54, v3);
                _os_log_impl((void *)&_mh_execute_header, v55, v56, "Override DeviceActivityMonitorExtension intervalDidStart %{public}s", v58, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {

                v65(v54, v3);
              }
              sub_100006CB0();
              sub_100006D90();
              swift_bridgeObjectRelease();
            }
            return swift_release();
          }
        }
        v31 = sub_100006E10();
        os_log_type_t v42 = sub_100006EB0();
        if (os_log_type_enabled(v31, v42))
        {
          v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v42, "Downtime Disable Override DeviceActivityMonitorExtension intervalDidStart.", v43, 2u);
          swift_slowDealloc();
        }
      }
    }

    sub_100006D80();
    return swift_release();
  }
  return result;
}

uint64_t sub_100003040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_100006DE0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  sub_100005740(&qword_10000C1A8);
  v4[11] = swift_task_alloc();
  sub_100005740(&qword_10000C1C8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_100006B80();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_100006CC0();
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  uint64_t v8 = sub_100006BA0();
  v4[19] = v8;
  v4[20] = *(void *)(v8 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v9 = sub_100006BC0();
  v4[22] = v9;
  v4[23] = *(void *)(v9 - 8);
  v4[24] = swift_task_alloc();
  uint64_t v10 = sub_100006BE0();
  v4[25] = v10;
  v4[26] = *(void *)(v10 - 8);
  v4[27] = swift_task_alloc();
  uint64_t v11 = sub_100006D10();
  v4[28] = v11;
  v4[29] = *(void *)(v11 - 8);
  v4[30] = swift_task_alloc();
  return _swift_task_switch(sub_100003388, 0, 0);
}

uint64_t sub_100003388()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[23];
  uint64_t v35 = v0[22];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[21];
  uint64_t v36 = v0[19];
  uint64_t v37 = v0[25];
  sub_100006E40();
  sub_100006E40();
  sub_100006CF0();
  sub_100006BB0();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for Calendar.Component.weekday(_:), v35);
  sub_100006B90();
  uint64_t v7 = sub_100006BD0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v36);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v35);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v37);
  switch(v7)
  {
    case 1:
      sub_100006C20();
      break;
    case 2:
      sub_100006C30();
      break;
    case 3:
      sub_100006C40();
      break;
    case 4:
      sub_100006C50();
      break;
    case 5:
      sub_100006C60();
      break;
    case 6:
      sub_100006C70();
      break;
    case 7:
      sub_100006C80();
      break;
    default:
      sub_100006C90();
      break;
  }
  uint64_t v8 = v0[11];
  sub_100006D00();
  uint64_t v9 = sub_100006D60();
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[14];
  uint64_t v14 = v0[11];
  uint64_t v15 = v0[12];
  if (v11 == 1)
  {
    sub_100006B00(v0[11], &qword_10000C1A8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v15, 1, 1, v12);
LABEL_13:
    sub_100006B00(v0[12], &qword_10000C1C8);
    uint64_t v16 = sub_100006E10();
    os_log_type_t v17 = sub_100006EB0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "No interval end time for the notification.", v18, 2u);
      swift_slowDealloc();
    }
    uint64_t v20 = v0[29];
    uint64_t v19 = v0[30];
    uint64_t v21 = v0[28];
    uint64_t v23 = v0[17];
    uint64_t v22 = v0[18];
    uint64_t v24 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
  sub_100006D40();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v9);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v12) == 1) {
    goto LABEL_13;
  }
  uint64_t v28 = v0[14];
  uint64_t v27 = v0[15];
  uint64_t v29 = v0[13];
  uint64_t v31 = v0[9];
  uint64_t v30 = v0[10];
  uint64_t v32 = v0[8];
  (*(void (**)(uint64_t, void, uint64_t))(v28 + 32))(v27, v0[12], v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v30, v27, v29);
  (*(void (**)(uint64_t, void, uint64_t))(v31 + 104))(v30, enum case for STUserNotifications.NotificationType.downtime(_:), v32);
  BOOL v33 = (void *)swift_task_alloc();
  v0[31] = v33;
  *BOOL v33 = v0;
  v33[1] = sub_1000038CC;
  uint64_t v34 = v0[10];
  return static STUserNotifications.post(notification:)(v34);
}

uint64_t sub_1000038CC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(*(void *)v1 + 72);
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_100003B64;
  }
  else {
    uint64_t v5 = sub_100003A3C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100003A3C()
{
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v6 = v0[16];
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100003B64()
{
  uint64_t v16 = v0;
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v6 = v0[16];
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v7 = sub_100006E10();
  os_log_type_t v8 = sub_100006EA0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v15 = v10;
    swift_getErrorValue();
    uint64_t v11 = sub_100006F30();
    v0[6] = sub_100005A54(v11, v12, &v15);
    sub_100006EC0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Posting downtime user notification failed with error: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_100003E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006E90();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100006E80();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100006B00(a1, &qword_10000C168);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100006E70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100003FB8(uint64_t a1)
{
  uint64_t v2 = sub_100006CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v48 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v48 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v48 - v13;
  sub_100006D20();
  uint64_t v15 = (void (*)(uint64_t))sub_100006D30();
  v15(a1);
  uint64_t v16 = sub_100006D70();
  uint64_t v56 = v16;
  uint64_t v57 = sub_100006340(&qword_10000C170, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags);
  uint64_t v17 = sub_100005784(&v54);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v17, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v16);
  LOBYTE(v16) = sub_100006BF0();
  uint64_t result = sub_1000060AC((uint64_t)&v54);
  if (v16)
  {
    uint64_t v51 = v3;
    sub_100006DD0();
    swift_allocObject();
    uint64_t v19 = sub_100006DC0();
    if (sub_100006C00())
    {
      char v20 = sub_100006388();
      uint64_t v21 = sub_100006E10();
      os_log_type_t v22 = sub_100006EB0();
      BOOL v23 = os_log_type_enabled(v21, v22);
      if (v20)
      {
        if (v23)
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Downtime override is currently present. Ignoring Scheduled Downtime DeviceActivityMonitorExtension intervalDidEnd.", v24, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        if (v23)
        {
          uint64_t v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Scheduled Downtime DeviceActivityMonitorExtension intervalDidEnd.", v32, 2u);
          swift_slowDealloc();
        }

        sub_100006D80();
        id v33 = [objc_allocWithZone((Class)STDeviceDowntimeUserNotificationContext) init];
        sub_100006DF0();
      }
      return swift_release();
    }
    v48 = v6;
    uint64_t v50 = v19;
    sub_100006C90();
    sub_100006340(&qword_10000C1A0, (void (*)(uint64_t))&type metadata accessor for DeviceActivityName);
    sub_100006E60();
    sub_100006E60();
    if (v54 == v52 && v55 == v53) {
      char v25 = 1;
    }
    else {
      char v25 = sub_100006F20();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = v51 + 8;
    uint64_t v27 = *(void (**)(char *, uint64_t))(v51 + 8);
    v27(v14, v2);
    if (v25)
    {
      uint64_t v28 = sub_100006E10();
      os_log_type_t v29 = sub_100006EB0();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        uint64_t v31 = "Downtime Enable Override DeviceActivityMonitorExtension intervalDidEnd.";
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v28, v29, v31, v30, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      os_log_type_t v49 = v27;
      sub_100006CA0();
      sub_100006E60();
      sub_100006E60();
      if (v54 == v52 && v55 == v53)
      {
        swift_bridgeObjectRelease_n();
        v49(v12, v2);
      }
      else
      {
        char v34 = sub_100006F20();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v49(v12, v2);
        if ((v34 & 1) == 0)
        {
          char v35 = sub_100006C10();
          uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
          if (v35)
          {
            v36(v9, a1, v2);
            uint64_t v37 = sub_100006E10();
            os_log_type_t v38 = sub_100006EB0();
            if (os_log_type_enabled(v37, v38))
            {
              v39 = (uint8_t *)swift_slowAlloc();
              uint64_t v54 = swift_slowAlloc();
              *(_DWORD *)v39 = 136446210;
              uint64_t v40 = sub_100006CB0();
              uint64_t v52 = sub_100005A54(v40, v41, &v54);
              sub_100006EC0();
              swift_bridgeObjectRelease();
              v49(v9, v2);
              _os_log_impl((void *)&_mh_execute_header, v37, v38, "Usage Limit DeviceActivityMonitorExtension intervalDidEnd %{public}s", v39, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              v49(v9, v2);
            }
            sub_100006DB0();
          }
          else
          {
            os_log_type_t v42 = v48;
            v36(v48, a1, v2);
            v43 = sub_100006E10();
            os_log_type_t v44 = sub_100006EB0();
            if (os_log_type_enabled(v43, v44))
            {
              v45 = (uint8_t *)swift_slowAlloc();
              uint64_t v54 = swift_slowAlloc();
              uint64_t v51 = v26;
              *(_DWORD *)v45 = 136446210;
              uint64_t v46 = sub_100006CB0();
              uint64_t v52 = sub_100005A54(v46, v47, &v54);
              sub_100006EC0();
              swift_bridgeObjectRelease();
              v49(v42, v2);
              _os_log_impl((void *)&_mh_execute_header, v43, v44, "Override DeviceActivityMonitorExtension intervalDidEnd %{public}s", v45, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              v49(v42, v2);
            }
            sub_100006CB0();
            sub_100006D90();
            swift_bridgeObjectRelease();
          }
          return swift_release();
        }
      }
      uint64_t v28 = sub_100006E10();
      os_log_type_t v29 = sub_100006EB0();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        uint64_t v31 = "Downtime Disable Override DeviceActivityMonitorExtension intervalDidEnd.";
        goto LABEL_23;
      }
    }

    sub_100006D80();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000048E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006CE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006D20();
  uint64_t v8 = (void (*)(uint64_t, uint64_t))sub_100006D30();
  v8(a1, a2);
  uint64_t v9 = sub_100006D70();
  v20[3] = v9;
  v20[4] = sub_100006340(&qword_10000C170, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags);
  uint64_t v10 = sub_100005784(v20);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v9);
  LOBYTE(v9) = sub_100006BF0();
  uint64_t result = sub_1000060AC((uint64_t)v20);
  if (v9)
  {
    sub_100006DD0();
    swift_allocObject();
    sub_100006DC0();
    if (sub_100006C10())
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
      unint64_t v12 = sub_100006E10();
      os_log_type_t v13 = sub_100006EB0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        v20[0] = v18;
        *(_DWORD *)uint64_t v14 = 136446210;
        uint64_t v17 = v14 + 4;
        uint64_t v15 = sub_100006CD0();
        uint64_t v19 = sub_100005A54(v15, v16, v20);
        sub_100006EC0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Usage Limit DeviceActivityMonitorExtension eventDidReachThreshold %{public}s", v14, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      sub_100006CD0();
      sub_100006DA0();
      swift_bridgeObjectRelease();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_100004C34(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005740(&qword_10000C168);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006CC0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006D20();
  uint64_t v11 = (void (*)(uint64_t))sub_100006D30();
  v11(a1);
  uint64_t v12 = sub_100006D70();
  v26[3] = v12;
  v26[4] = sub_100006340(&qword_10000C170, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags);
  os_log_type_t v13 = sub_100005784(v26);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v13, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v12);
  LOBYTE(v12) = sub_100006BF0();
  uint64_t result = sub_1000060AC((uint64_t)v26);
  if (v12)
  {
    uint64_t result = sub_100006C00();
    if (result)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
      uint64_t v15 = sub_100006E10();
      os_log_type_t v16 = sub_100006EB0();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        v26[0] = v24;
        *(_DWORD *)uint64_t v17 = 136446210;
        BOOL v23 = v17 + 4;
        uint64_t v18 = sub_100006CB0();
        uint64_t v25 = sub_100005A54(v18, v19, v26);
        sub_100006EC0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Downtime DeviceActivityMonitorExtension intervalWillStartWarning %{public}s", v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
      notify_post(STCommunicationPolicyWarningNotification);
      uint64_t v20 = sub_100006E90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 1, 1, v20);
      uint64_t v21 = (void *)swift_allocObject();
      v21[2] = 0;
      v21[3] = 0;
      v21[4] = v2;
      id v22 = v2;
      sub_100003E0C((uint64_t)v6, (uint64_t)&unk_10000C180, (uint64_t)v21);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_100005014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_100006DE0();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_1000050D4, 0, 0);
}

uint64_t sub_1000050D4()
{
  (*(void (**)(void, void, void))(v0[9] + 104))(v0[10], enum case for STUserNotifications.NotificationType.downtimeWarning(_:), v0[8]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[11] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005190;
  uint64_t v2 = v0[10];
  return static STUserNotifications.post(notification:)(v2);
}

uint64_t sub_100005190()
{
  uint64_t v2 = *(void *)(*v1 + 80);
  uint64_t v3 = *(void *)(*v1 + 72);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 96) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return _swift_task_switch(sub_100005338, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_100005338()
{
  uint64_t v10 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100006E10();
  os_log_type_t v2 = sub_100006EA0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v9 = v4;
    swift_getErrorValue();
    uint64_t v5 = sub_100006F30();
    *(void *)(v0 + 48) = sub_100005A54(v5, v6, &v9);
    sub_100006EC0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Posting downtime warning user notification failed with error: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

void sub_100005530(void *a1)
{
  os_log_type_t v2 = self;
  id v3 = a1;
  id v4 = [v2 mainBundle];
  id v5 = [v4 bundleIdentifier];

  if (v5)
  {
    sub_100006E40();

    sub_100006E20();
    v6.receiver = v3;
    v6.super_class = (Class)type metadata accessor for DeviceActivityMonitorExtension();
    objc_msgSendSuper2(&v6, "init");
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100005628()
{
  uint64_t v1 = v0 + qword_10000C1D8;
  uint64_t v2 = sub_100006E30();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

id sub_100005694()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceActivityMonitorExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000056CC(uint64_t a1)
{
  uint64_t v1 = a1 + qword_10000C1D8;
  uint64_t v2 = sub_100006E30();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t sub_100005738()
{
  return type metadata accessor for DeviceActivityMonitorExtension();
}

uint64_t sub_100005740(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100005784(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000057EC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_100006B5C;
  return sub_100005014((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100005880(uint64_t a1, int *a2)
{
  objc_super v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000595C;
  return v6(a1);
}

uint64_t sub_10000595C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005A54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005B28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000060FC((uint64_t)v12, *a3);
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
      sub_1000060FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000060AC((uint64_t)v12);
  return v7;
}

uint64_t sub_100005B28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006ED0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005CE4(a5, a6);
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
  uint64_t v8 = sub_100006EF0();
  if (!v8)
  {
    sub_100006F00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006F10();
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

uint64_t sub_100005CE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005D7C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005F5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005F5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005D7C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005EF4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006EE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006F00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006E50();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006F10();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006F00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005EF4(uint64_t a1, uint64_t a2)
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
  sub_100005740(&qword_10000C188);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005F5C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005740(&qword_10000C188);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_100006F10();
  __break(1u);
  return result;
}

uint64_t sub_1000060AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000060FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000615C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006194(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_10000624C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C190 + dword_10000C190);
  return v6(a1, v4);
}

uint64_t sub_10000624C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006340(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006388()
{
  uint64_t v0 = sub_100006CC0();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005740(&qword_10000C1A8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v45 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v36 - v6;
  uint64_t v8 = sub_100005740(&qword_10000C1B0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v48 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = sub_100006B70();
  uint64_t v40 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v37 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v36 = (char *)&v36 - v16;
  uint64_t v17 = sub_100006BA0();
  uint64_t v43 = *(void *)(v17 - 8);
  uint64_t v44 = v17;
  __chkstk_darwin(v17);
  unint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100006D10();
  uint64_t v41 = *(void *)(v20 - 8);
  uint64_t v42 = v20;
  __chkstk_darwin(v20);
  id v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006E40();
  sub_100006E40();
  sub_100006CF0();
  os_log_type_t v49 = v19;
  sub_100006B90();
  sub_100006C90();
  sub_100006D00();
  BOOL v23 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v46 = v1 + 8;
  uint64_t v47 = v0;
  os_log_type_t v38 = v23;
  v23(v3, v0);
  uint64_t v24 = sub_100006D60();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v26(v7, 1, v24) == 1)
  {
    sub_100006B00((uint64_t)v7, &qword_10000C1A8);
    uint64_t v27 = v40;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v12, 1, 1, v13);
LABEL_4:
    sub_100006B00((uint64_t)v12, &qword_10000C1B0);
    int v39 = 0;
    goto LABEL_6;
  }
  sub_100006D50();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v24);
  uint64_t v27 = v40;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v12, 1, v13) == 1) {
    goto LABEL_4;
  }
  uint64_t v28 = v36;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v36, v12, v13);
  int v39 = sub_100006B60();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v13);
LABEL_6:
  sub_100006CA0();
  uint64_t v29 = (uint64_t)v45;
  sub_100006D00();
  v38(v3, v47);
  if (v26((char *)v29, 1, v24) == 1)
  {
    sub_100006B00(v29, &qword_10000C1A8);
    uint64_t v30 = (uint64_t)v48;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v48, 1, 1, v13);
  }
  else
  {
    uint64_t v30 = (uint64_t)v48;
    sub_100006D50();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v24);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v30, 1, v13) != 1)
    {
      uint64_t v32 = v37;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v37, v30, v13);
      id v33 = v49;
      char v34 = sub_100006B60();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v32, v13);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v44);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v42);
      char v31 = v34 | v39;
      return v31 & 1;
    }
  }
  (*(void (**)(char *, uint64_t))(v43 + 8))(v49, v44);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v42);
  sub_100006B00(v30, &qword_10000C1B0);
  char v31 = v39;
  return v31 & 1;
}

uint64_t sub_100006A2C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006A6C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000624C;
  return sub_100003040((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100006B00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005740(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006B60()
{
  return DateInterval.contains(_:)();
}

uint64_t sub_100006B70()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_100006B80()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100006B90()
{
  return Date.init()();
}

uint64_t sub_100006BA0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100006BB0()
{
  return static Calendar.current.getter();
}

uint64_t sub_100006BC0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100006BD0()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_100006BE0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100006BF0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100006C00()
{
  return DeviceActivityName.isDowntime.getter();
}

uint64_t sub_100006C10()
{
  return DeviceActivityName.isUsageLimit.getter();
}

uint64_t sub_100006C20()
{
  return static DeviceActivityName.downtime_weekday_1.getter();
}

uint64_t sub_100006C30()
{
  return static DeviceActivityName.downtime_weekday_2.getter();
}

uint64_t sub_100006C40()
{
  return static DeviceActivityName.downtime_weekday_3.getter();
}

uint64_t sub_100006C50()
{
  return static DeviceActivityName.downtime_weekday_4.getter();
}

uint64_t sub_100006C60()
{
  return static DeviceActivityName.downtime_weekday_5.getter();
}

uint64_t sub_100006C70()
{
  return static DeviceActivityName.downtime_weekday_6.getter();
}

uint64_t sub_100006C80()
{
  return static DeviceActivityName.downtime_weekday_7.getter();
}

uint64_t sub_100006C90()
{
  return static DeviceActivityName.downtime_enable_override.getter();
}

uint64_t sub_100006CA0()
{
  return static DeviceActivityName.downtime_disable_override.getter();
}

uint64_t sub_100006CB0()
{
  return DeviceActivityName.rawValue.getter();
}

uint64_t sub_100006CC0()
{
  return type metadata accessor for DeviceActivityName();
}

uint64_t sub_100006CD0()
{
  return DeviceActivityEvent.Name.rawValue.getter();
}

uint64_t sub_100006CE0()
{
  return type metadata accessor for DeviceActivityEvent.Name();
}

uint64_t sub_100006CF0()
{
  return DeviceActivityCenter.init(clientIdentifier:extensionIdentifier:)();
}

uint64_t sub_100006D00()
{
  return DeviceActivityCenter.schedule(for:)();
}

uint64_t sub_100006D10()
{
  return type metadata accessor for DeviceActivityCenter();
}

uint64_t sub_100006D20()
{
  return type metadata accessor for DeviceActivityMonitor();
}

uint64_t sub_100006D30()
{
  return method lookup function for DeviceActivityMonitor();
}

uint64_t sub_100006D40()
{
  return DeviceActivitySchedule.intervalEnd.getter();
}

uint64_t sub_100006D50()
{
  return DeviceActivitySchedule.nextInterval.getter();
}

uint64_t sub_100006D60()
{
  return type metadata accessor for DeviceActivitySchedule();
}

uint64_t sub_100006D70()
{
  return type metadata accessor for ScreenTimeFeatureFlags();
}

uint64_t sub_100006D80()
{
  return dispatch thunk of LocalRestrictions.updateDowntime(state:)();
}

uint64_t sub_100006D90()
{
  return dispatch thunk of LocalRestrictions.updateOverride(with:enabled:)();
}

uint64_t sub_100006DA0()
{
  return dispatch thunk of LocalRestrictions.updateUsageLimit(with:enabled:)();
}

uint64_t sub_100006DB0()
{
  return dispatch thunk of LocalRestrictions.disableAllUsageLimits()();
}

uint64_t sub_100006DC0()
{
  return LocalRestrictions.init()();
}

uint64_t sub_100006DD0()
{
  return type metadata accessor for LocalRestrictions();
}

uint64_t sub_100006DE0()
{
  return type metadata accessor for STUserNotifications.NotificationType();
}

uint64_t sub_100006DF0()
{
  return static STUserNotifications.removeNotification(context:)();
}

uint64_t sub_100006E10()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006E20()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006E30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006E40()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100006E50()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006E60()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100006E70()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006E80()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100006E90()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100006EA0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006EB0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006EC0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006ED0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006EE0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006EF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006F00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006F10()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006F20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006F30()
{
  return Error.localizedDescription.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}