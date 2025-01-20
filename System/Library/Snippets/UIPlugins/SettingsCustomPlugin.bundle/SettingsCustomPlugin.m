uint64_t SettingsControlSliderView.init(model:)()
{
  return sub_5DFC();
}

uint64_t type metadata accessor for ViewData(uint64_t a1)
{
  return sub_699C(a1, (uint64_t *)&unk_10710);
}

uint64_t SettingsControlSliderView.body.getter()
{
  uint64_t v0 = sub_226C(&qword_100C0);
  uint64_t v1 = sub_971C(v0);
  __chkstk_darwin(v1);
  uint64_t v2 = sub_9C08();
  type metadata accessor for ViewData(v2);
  sub_9E78();
  sub_9478(v3, v4, v5);
  sub_226C(&qword_100C8);
  sub_7F04(&qword_100D0, &qword_100C8);
  return sub_A130();
}

uint64_t sub_226C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_22B0(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_A040();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_226C(&qword_10488);
  sub_2348();
}

uint64_t sub_2300(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_2348()
{
  sub_9B04();
  uint64_t v1 = v0;
  uint64_t v82 = v2;
  uint64_t v3 = type metadata accessor for ViewData(0);
  uint64_t v4 = sub_971C(v3);
  __chkstk_darwin(v4);
  sub_9930();
  uint64_t v68 = v5;
  uint64_t v74 = type metadata accessor for SettingsSliderView(0);
  sub_96D4();
  __chkstk_darwin(v6);
  sub_9930();
  uint64_t v69 = v7;
  uint64_t v78 = sub_226C(&qword_10490);
  sub_96A4();
  uint64_t v73 = v8;
  __chkstk_darwin(v9);
  sub_9930();
  uint64_t v70 = v10;
  uint64_t v77 = sub_226C(&qword_10498);
  sub_96A4();
  uint64_t v75 = v11;
  __chkstk_darwin(v12);
  sub_9930();
  uint64_t v72 = v13;
  sub_226C(&qword_104A0);
  sub_96A4();
  uint64_t v80 = v15;
  uint64_t v81 = v14;
  __chkstk_darwin(v14);
  sub_9A1C();
  v79 = v16;
  sub_9D54();
  __chkstk_darwin(v17);
  v76 = (char *)v66 - v18;
  uint64_t v19 = sub_226C(&qword_100F0);
  uint64_t v20 = sub_971C(v19);
  __chkstk_darwin(v20);
  sub_9A4C();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = sub_226C(&qword_104A8);
  sub_96A4();
  v66[0] = v25;
  __chkstk_darwin(v26);
  sub_9CC4();
  uint64_t v27 = sub_226C(&qword_104B0);
  sub_96A4();
  v66[1] = v28;
  __chkstk_darwin(v29);
  sub_9944();
  sub_226C(&qword_104B8);
  sub_96A4();
  v66[2] = v30;
  __chkstk_darwin(v31);
  sub_9A4C();
  uint64_t v32 = sub_226C(&qword_104C0);
  uint64_t v33 = sub_971C(v32);
  __chkstk_darwin(v33);
  sub_9A1C();
  uint64_t v67 = v34;
  sub_9D54();
  uint64_t v36 = __chkstk_darwin(v35);
  v38 = (char *)v66 - v37;
  __chkstk_darwin(v36);
  v40 = (char *)v66 - v39;
  uint64_t v71 = v1;
  sub_9478(v1, v23, &qword_100F0);
  uint64_t v41 = sub_9F30();
  if (sub_98F8(v41) == 1)
  {
    sub_94C4(v23, &qword_100F0);
    uint64_t v42 = 1;
  }
  else
  {
    sub_9F20();
    sub_96E4();
    sub_9968();
    v43();
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_A060();
    sub_9968();
    v45();
    uint64_t v83 = v24;
    uint64_t v84 = OpaqueTypeConformance2;
    uint64_t v46 = sub_9E4C();
    sub_A0B0();
    sub_9968();
    v47();
    uint64_t v83 = v27;
    uint64_t v84 = v46;
    sub_9E4C();
    sub_A090();
    sub_9968();
    v48();
    uint64_t v42 = 0;
  }
  uint64_t v49 = sub_226C(&qword_104C8);
  sub_5CA8((uint64_t)v38, v42, 1, v49);
  sub_93D8((uint64_t)v38, (uint64_t)v40, &qword_104C0);
  sub_5DA8();
  uint64_t v50 = v69;
  SettingsSliderView.init(model:)();
  uint64_t v51 = sub_3D60(&qword_104D0, (void (*)(uint64_t))type metadata accessor for SettingsSliderView);
  uint64_t v52 = v74;
  sub_9E78();
  sub_A060();
  sub_9424(v50, (void (*)(void))type metadata accessor for SettingsSliderView);
  uint64_t v83 = v52;
  uint64_t v84 = v51;
  uint64_t v53 = sub_9E4C();
  uint64_t v54 = v78;
  sub_9E78();
  sub_A0B0();
  sub_9968();
  v55();
  uint64_t v83 = v54;
  uint64_t v84 = v53;
  sub_9E4C();
  v56 = v79;
  sub_A090();
  sub_9968();
  v57();
  uint64_t v59 = v80;
  uint64_t v58 = v81;
  v60 = v76;
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v76, v56, v81);
  uint64_t v61 = v67;
  sub_9478((uint64_t)v40, v67, &qword_104C0);
  v62 = *(void (**)(uint64_t, char *, uint64_t))(v59 + 16);
  v62((uint64_t)v56, v60, v58);
  uint64_t v63 = v82;
  sub_9478(v61, v82, &qword_104C0);
  uint64_t v64 = sub_226C(&qword_104D8);
  v62(v63 + *(int *)(v64 + 48), v56, v58);
  v65 = *(void (**)(char *, uint64_t))(v59 + 8);
  v65(v60, v58);
  sub_94C4((uint64_t)v40, &qword_104C0);
  v65(v56, v58);
  sub_94C4(v61, &qword_104C0);
  sub_9AD8();
}

void SettingsSliderView.init(model:)()
{
  sub_9A88();
  uint64_t v43 = v0;
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for ViewData(0);
  sub_96D4();
  __chkstk_darwin();
  sub_9A1C();
  uint64_t v45 = v4;
  sub_9D54();
  __chkstk_darwin();
  v44 = (char *)&v41 - v5;
  uint64_t v6 = sub_9FD0();
  sub_96A4();
  v48 = v7;
  __chkstk_darwin();
  sub_9A1C();
  uint64_t v42 = v8;
  sub_9D54();
  __chkstk_darwin();
  uint64_t v10 = (char *)&v41 - v9;
  sub_8CC0(0, &qword_100D8);
  unint64_t v49 = sub_9EB8();
  *uint64_t v2 = sub_A1E0();
  uint64_t v11 = (int *)type metadata accessor for SettingsSliderView(0);
  uint64_t v12 = (uint64_t *)((char *)v2 + v11[9]);
  sub_A180();
  sub_3D60(&qword_100E0, (void (*)(uint64_t))&type metadata accessor for Context);
  *uint64_t v12 = sub_A030();
  v12[1] = v13;
  uint64_t v14 = (uint64_t *)((char *)v2 + v11[10]);
  sub_A160();
  sub_3D60(&qword_100E8, (void (*)(uint64_t))&type metadata accessor for Form);
  *uint64_t v14 = sub_A030();
  v14[1] = v15;
  uint64_t v16 = v11[11];
  uint64_t v17 = v43;
  uint64_t v18 = (void *)sub_A1E0();
  *(uint64_t *)((char *)v2 + v16) = (uint64_t)v18;
  uint64_t v19 = (void (*)(void))*((void *)v48 + 2);
  sub_9CF4();
  v19();
  sub_9CF4();
  v19();
  uint64_t v20 = (uint64_t *)(v17 + *(int *)(v3 + 24));
  uint64_t v21 = *v20;
  uint64_t v22 = v20[1];
  uint64_t v23 = (uint64_t *)((char *)v2 + v11[6]);
  *uint64_t v23 = v21;
  v23[1] = v22;
  uint64_t v41 = v3;
  uint64_t v24 = *(int *)(v3 + 28);
  uint64_t v25 = v42;
  *(uint64_t *)((char *)v2 + v11[7]) = *(void *)(v17 + v24);
  os_log_t v47 = v18;
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_9F80();
  LOBYTE(v22) = v27;
  uint64_t v46 = v10;
  unint64_t v49 = v6;
  sub_9CF4();
  v19();
  if (v22)
  {
    sub_9FC0();
    uint64_t v28 = v29;
  }
  else
  {
    uint64_t v28 = v26;
  }
  uint64_t v30 = (void (*)(uint64_t, unint64_t))*((void *)v48 + 1);
  v30(v25, v49);
  uint64_t v31 = (uint64_t *)((char *)v2 + v11[8]);
  *uint64_t v31 = v28;
  v31[1] = 0;
  os_log_type_t v32 = sub_A1C0();
  uint64_t v33 = (uint64_t)v44;
  sub_5DA8();
  uint64_t v34 = v45;
  sub_5DA8();
  os_log_type_t v35 = v32;
  os_log_t v36 = v47;
  if (os_log_type_enabled(v47, v35))
  {
    uint64_t v37 = sub_9D60();
    *(_DWORD *)uint64_t v37 = 134218496;
    v48 = v30;
    sub_9FC0();
    uint64_t v50 = v38;
    sub_A200();
    sub_9424(v33, (void (*)(void))type metadata accessor for ViewData);
    *(_WORD *)(v37 + 12) = 2048;
    uint64_t v30 = v48;
    sub_9FB0();
    uint64_t v50 = v39;
    sub_A200();
    sub_9424(v34, (void (*)(void))type metadata accessor for ViewData);
    *(_WORD *)(v37 + 22) = 2048;
    uint64_t v50 = v28;
    sub_A200();
    os_log_t v40 = v47;
    _os_log_impl(&dword_0, v47, v35, "[SettingsSliderView] Slider initialize with min: %f, max: %f, initialValue: %f", (uint8_t *)v37, 0x20u);
    sub_9AA4(v37);
  }
  else
  {

    sub_9424(v34, (void (*)(void))type metadata accessor for ViewData);
    sub_9424(v33, (void (*)(void))type metadata accessor for ViewData);
  }
  sub_9424(v17, (void (*)(void))type metadata accessor for ViewData);
  v30((uint64_t)v46, v49);
  sub_9ABC();
}

uint64_t variable initialization expression of ViewData.text1()
{
  sub_9F30();
  sub_9C40();

  return sub_5CA8(v0, v1, v2, v3);
}

uint64_t ViewData.text1.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_9478(v1, a1, &qword_100F0);
}

uint64_t ViewData.text1.setter(uint64_t a1)
{
  return sub_5CD0(a1, v1, &qword_100F0);
}

uint64_t (*ViewData.text1.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of ViewData.action()
{
  sub_9F40();
  sub_9C40();

  return sub_5CA8(v0, v1, v2, v3);
}

uint64_t ViewData.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ViewData(0);
  return sub_9478(v1 + *(int *)(v3 + 20), a1, &qword_100C0);
}

uint64_t ViewData.action.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ViewData(0);
  return sub_5CD0(a1, v1 + *(int *)(v3 + 20), &qword_100C0);
}

uint64_t (*ViewData.action.modify())(void)
{
  return nullsub_1;
}

uint64_t ViewData.numericSettingId.getter()
{
  return sub_4278(type metadata accessor for ViewData);
}

uint64_t ViewData.inDeviceCategory.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ViewData(0) + 28));
}

uint64_t ViewData.sliderModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ViewData(0) + 32);
  sub_9FD0();
  sub_96D4();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

BOOL sub_3188(char a1, char a2)
{
  return a1 == a2;
}

void sub_3198(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_31C0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x3174786574 && a2 == 0xE500000000000000;
  if (v3 || (sub_9A30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
    if (v6 || (sub_9A30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000000000B220 || (sub_9A30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x800000000000B240 || (sub_9A30() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0x6F4D726564696C73 && a2 == 0xEB000000006C6564)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      char v8 = sub_9A30();
      swift_bridgeObjectRelease();
      if (v8) {
        return 4;
      }
      else {
        return 5;
      }
    }
  }
}

Swift::Int sub_337C(unsigned __int8 a1)
{
  return sub_A3B0();
}

unint64_t sub_33C4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F69746361;
      break;
    case 2:
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6F4D726564696C73;
      break;
    default:
      unint64_t result = 0x3174786574;
      break;
  }
  return result;
}

BOOL sub_3474(char *a1, char *a2)
{
  return sub_3188(*a1, *a2);
}

Swift::Int sub_3480()
{
  return sub_337C(*v0);
}

void sub_3488(uint64_t a1)
{
  sub_3198(a1, *v1);
}

Swift::Int sub_3490()
{
  Swift::UInt v1 = *v0;
  sub_A390();
  sub_A3A0(v1);
  return sub_A3B0();
}

unint64_t sub_34D4()
{
  return sub_33C4(*v0);
}

uint64_t sub_34DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_31C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_3504()
{
  return 0;
}

void sub_3510(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_351C()
{
  sub_5D5C();
  uint64_t v0 = sub_9E0C();

  return CodingKey.description.getter(v0);
}

uint64_t sub_3554()
{
  sub_5D5C();
  uint64_t v0 = sub_9E0C();

  return CodingKey.debugDescription.getter(v0);
}

uint64_t ViewData.encode(to:)(void *a1)
{
  sub_226C(&qword_100F8);
  sub_96A4();
  __chkstk_darwin(v3);
  sub_9868();
  sub_5D18(a1, a1[3]);
  sub_5D5C();
  sub_A3D0();
  sub_9F30();
  sub_3D60(&qword_10100, (void (*)(uint64_t))&type metadata accessor for TextProperty);
  sub_A2F0();
  if (!v1)
  {
    type metadata accessor for ViewData(0);
    sub_9F40();
    sub_3D60(&qword_10108, (void (*)(uint64_t))&type metadata accessor for ActionProperty);
    sub_A2F0();
    sub_A300();
    sub_A310();
    sub_9FD0();
    sub_3D60(&qword_10110, (void (*)(uint64_t))&type metadata accessor for Slider);
    sub_A320();
  }
  uint64_t v4 = sub_9E00();
  return v5(v4);
}

uint64_t ViewData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v50 = sub_9FD0();
  sub_96A4();
  uint64_t v47 = v4;
  __chkstk_darwin(v5);
  sub_9930();
  uint64_t v49 = v6;
  uint64_t v7 = sub_226C(&qword_100C0);
  uint64_t v8 = sub_971C(v7);
  __chkstk_darwin(v8);
  sub_9A4C();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_226C(&qword_100F0);
  uint64_t v13 = sub_971C(v12);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_226C(&qword_10118);
  sub_96A4();
  uint64_t v51 = v16;
  __chkstk_darwin(v17);
  sub_9A4C();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = type metadata accessor for ViewData(0);
  sub_96D4();
  __chkstk_darwin(v22);
  sub_9C08();
  uint64_t v23 = sub_9F30();
  sub_9C40();
  sub_5CA8(v24, v25, v26, v23);
  uint64_t v53 = v21;
  uint64_t v27 = v2 + *(int *)(v21 + 20);
  uint64_t v28 = sub_9F40();
  uint64_t v56 = v27;
  sub_9C40();
  sub_5CA8(v29, v30, v31, v28);
  uint64_t v32 = a1[3];
  v55 = a1;
  sub_5D18(a1, v32);
  sub_5D5C();
  uint64_t v52 = v20;
  uint64_t v33 = v57;
  sub_A3C0();
  if (v33)
  {
    uint64_t v34 = v56;
    sub_8C10((uint64_t)v55);
    sub_94C4(v2, &qword_100F0);
    return sub_94C4(v34, &qword_100C0);
  }
  else
  {
    char v62 = 0;
    sub_3D60(&qword_10120, (void (*)(uint64_t))&type metadata accessor for TextProperty);
    sub_A2B0();
    sub_5CD0((uint64_t)v15, v2, &qword_100F0);
    char v61 = 1;
    sub_3D60(&qword_10128, (void (*)(uint64_t))&type metadata accessor for ActionProperty);
    sub_A2B0();
    sub_5CD0(v11, v56, &qword_100C0);
    char v60 = 2;
    uint64_t v35 = sub_A2C0();
    uint64_t v36 = v53;
    uint64_t v37 = (uint64_t *)(v2 + *(int *)(v53 + 24));
    *uint64_t v37 = v35;
    v37[1] = v38;
    char v59 = 3;
    *(void *)(v2 + *(int *)(v36 + 28)) = sub_A2D0();
    char v58 = 4;
    sub_3D60(&qword_10130, (void (*)(uint64_t))&type metadata accessor for Slider);
    uint64_t v40 = v49;
    uint64_t v39 = v50;
    sub_A2E0();
    uint64_t v41 = sub_9C80();
    v42(v41);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v2 + *(int *)(v36 + 32), v40, v39);
    sub_5DA8();
    sub_8C10((uint64_t)v55);
    uint64_t v43 = sub_9E00();
    return sub_9424(v43, v44);
  }
}

uint64_t sub_3D10@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ViewData.init(from:)(a1, a2);
}

uint64_t sub_3D28(void *a1)
{
  return ViewData.encode(to:)(a1);
}

uint64_t type metadata accessor for SettingsSliderView(uint64_t a1)
{
  return sub_699C(a1, qword_10720);
}

uint64_t sub_3D60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3DA8()
{
  return 1;
}

void sub_3DB0()
{
}

Swift::Int sub_3DD8()
{
  return sub_A3B0();
}

Swift::Int sub_3E24()
{
  return sub_A3B0();
}

uint64_t sub_3E74(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v17 = a1;
  uint64_t v4 = type metadata accessor for SettingsControlSliderView(0);
  sub_96D4();
  __chkstk_darwin(v5);
  sub_9868();
  uint64_t v6 = sub_226C(&qword_10400);
  uint64_t v7 = sub_971C(v6);
  __chkstk_darwin(v7);
  sub_9944();
  uint64_t v8 = type metadata accessor for ViewData(0);
  sub_96D4();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9F00();
  swift_allocObject();
  sub_9EF0();
  sub_3D60(&qword_10408, (void (*)(uint64_t))type metadata accessor for ViewData);
  sub_9EE0();
  if (v2)
  {
    swift_errorRelease();
    swift_release();
    sub_9C40();
    sub_5CA8(v12, v13, v14, v8);
    sub_94C4(v3, &qword_10400);
    sub_81E4();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    swift_release();
    sub_5CA8(v3, 0, 1, v8);
    sub_5DFC();
    if (v17 == 0xD000000000000014 && v18 == 0x800000000000B260 || (sub_A330() & 1) != 0)
    {
      sub_5DA8();
      sub_3D60(&qword_10418, (void (*)(uint64_t))type metadata accessor for SettingsControlSliderView);
      sub_9E00();
      uint64_t v4 = sub_A110();
      sub_9424((uint64_t)v11, (void (*)(void))type metadata accessor for ViewData);
    }
    else
    {
      sub_81E4();
      swift_allocError();
      swift_willThrow();
      sub_9424((uint64_t)v11, (void (*)(void))type metadata accessor for ViewData);
    }
  }
  return v4;
}

uint64_t sub_419C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_41AC()
{
  return swift_allocObject();
}

uint64_t sub_41BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_41AC();
  *a1 = result;
  return result;
}

uint64_t sub_41E4(uint64_t a1, uint64_t a2)
{
  return sub_3E74(a1, a2);
}

uint64_t variable initialization expression of SettingsSliderView.settingsLog()
{
  return sub_A1E0();
}

uint64_t SettingsSliderView.numericSettingId.getter()
{
  return sub_4278(type metadata accessor for SettingsSliderView);
}

uint64_t sub_4278(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1(0) + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SettingsSliderView.inDeviceCategory.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SettingsSliderView(0) + 28));
}

uint64_t property wrapper backing initializer of SettingsSliderView.value()
{
  sub_A0C0();
  return v1;
}

uint64_t variable initialization expression of SettingsSliderView._context()
{
  return sub_43B0((void (*)(void))&type metadata accessor for Context, &qword_100E0, (void (*)(uint64_t))&type metadata accessor for Context);
}

uint64_t variable initialization expression of SettingsSliderView._form()
{
  return sub_43B0((void (*)(void))&type metadata accessor for Form, &qword_100E8, (void (*)(uint64_t))&type metadata accessor for Form);
}

uint64_t sub_43B0(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  a1(0);
  sub_3D60(a2, a3);

  return sub_A030();
}

void SettingsSliderView.body.getter()
{
  sub_9A88();
  uint64_t v15 = v1;
  type metadata accessor for SettingsSliderView(0);
  sub_9974();
  __chkstk_darwin(v2);
  uint64_t v3 = sub_226C(&qword_10138);
  uint64_t v4 = sub_971C(v3);
  __chkstk_darwin(v4);
  sub_9944();
  uint64_t v5 = sub_226C(&qword_10140);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  sub_9A4C();
  uint64_t v9 = v8 - v7;
  sub_46BC();
  sub_226C(&qword_10148);
  sub_A0D0();
  sub_5DA8();
  uint64_t v10 = swift_allocObject();
  sub_5DFC();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_5E4C;
  *(void *)(v11 + 24) = v10;
  sub_9478(v0, v9, &qword_10138);
  uint64_t v12 = (void *)(v9 + *(int *)(v6 + 44));
  *uint64_t v12 = v16;
  v12[1] = sub_5ED0;
  v12[2] = v11;
  sub_94C4(v0, &qword_10138);
  sub_5DA8();
  uint64_t v13 = swift_allocObject();
  sub_5DFC();
  sub_9478(v9, v15, &qword_10140);
  uint64_t v14 = (void (**)())(v15 + *(int *)(sub_226C(&qword_10150) + 36));
  *uint64_t v14 = sub_6004;
  v14[1] = (void (*)())v13;
  v14[2] = 0;
  v14[3] = 0;
  sub_94C4(v9, &qword_10140);
  sub_9ABC();
}

void sub_46BC()
{
  sub_9A88();
  sub_226C(&qword_10448);
  sub_96D4();
  __chkstk_darwin(v1);
  sub_9868();
  uint64_t v2 = sub_226C(&qword_103E8);
  sub_96A4();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_9BE0();
  sub_9FA0();
  if (v6)
  {
    sub_226C(&qword_10148);
    sub_A0E0();
    sub_9FC0();
    double v22 = v21;
    uint64_t v23 = sub_9FB0();
    if (v22 <= v24)
    {
      __chkstk_darwin(v23);
      sub_9C68();
      __chkstk_darwin(v25);
      sub_9D40();
      uint64_t v26 = sub_9C24();
      sub_4F54(v26, v27, v28, v29, v30, v31, v32);
      uint64_t v33 = sub_9B74();
      v34(v33);
      goto LABEL_6;
    }
  }
  else
  {
    sub_226C(&qword_10148);
    sub_A0E0();
    sub_9FC0();
    double v8 = v7;
    uint64_t v9 = sub_9FB0();
    if (v8 <= v10)
    {
      __chkstk_darwin(v9);
      sub_9C68();
      __chkstk_darwin(v11);
      sub_9D40();
      uint64_t v12 = sub_9C24();
      sub_4D68(v12, v13, v14, v15, v16, v17, v18);
      uint64_t v19 = sub_9B74();
      v20(v19);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      sub_7F04(&qword_103E0, &qword_103E8);
      sub_A050();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
      sub_9ABC();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_49E0()
{
  uint64_t v2 = sub_9F10();
  sub_96A4();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_9CC4();
  char v6 = *(void **)(v0 + *(int *)(type metadata accessor for SettingsSliderView(0) + 36));
  if (v6)
  {
    id v7 = v6;
    sub_A170();

    sub_A1D0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v1, v2);
    if (result != enum case for _ProtoIdiom.watch(_:)) {
      return (*(uint64_t (**)(uint64_t, uint64_t, double))(v4 + 8))(v1, v2, 20.0);
    }
  }
  else
  {
    sub_A180();
    uint64_t v9 = sub_3D60(&qword_100E0, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_9DE0(v9);
    __break(1u);
  }
  return result;
}

void sub_4B28()
{
  sub_9B04();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_226C(&qword_10478);
  sub_96A4();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_9868();
  uint64_t v11 = sub_226C(&qword_10480);
  uint64_t v12 = sub_971C(v11);
  __chkstk_darwin(v12);
  sub_9944();
  uint64_t v13 = sub_226C(&qword_10450);
  uint64_t v14 = sub_971C(v13);
  __chkstk_darwin(v14);
  sub_9BE0();
  v4();
  uint64_t v15 = sub_9F60();
  if (sub_6210(v2, 1, v15) == 1)
  {
    sub_94C4(v2, &qword_10480);
    sub_226C(&qword_10468);
    sub_9C40();
  }
  else
  {
    sub_9F50();
    sub_96E4();
    sub_9968();
    v20();
    sub_49E0();
    sub_49E0();
    sub_A120();
    sub_A010();
    sub_9E78();
    v21();
    uint64_t v22 = sub_226C(&qword_10468);
    uint64_t v23 = (_OWORD *)(v1 + *(int *)(v22 + 36));
    *uint64_t v23 = v24;
    v23[1] = v25;
    v23[2] = v26;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v7);
    uint64_t v16 = v1;
    uint64_t v17 = 0;
    uint64_t v18 = 1;
    uint64_t v19 = v22;
  }
  sub_5CA8(v16, v17, v18, v19);
  sub_93D8(v1, v6, &qword_10450);
  sub_9AD8();
}

uint64_t sub_4D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v9 = sub_226C(&qword_10450);
  uint64_t v10 = __chkstk_darwin(v9);
  __chkstk_darwin(v10);
  swift_retain();
  uint64_t v11 = swift_retain();
  uint64_t v12 = a5(v11);
  a7(v12);
  sub_928C(&qword_10458, &qword_10450, (void (*)(void))sub_92F8);
  sub_938C();
  sub_A100();
  swift_release();
  return swift_release();
}

uint64_t sub_4F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v9 = sub_226C(&qword_10450);
  uint64_t v10 = __chkstk_darwin(v9);
  __chkstk_darwin(v10);
  swift_retain();
  uint64_t v11 = swift_retain();
  uint64_t v12 = a5(v11);
  a7(v12);
  sub_928C(&qword_10458, &qword_10450, (void (*)(void))sub_92F8);
  sub_938C();
  sub_A0F0();
  swift_release();
  return swift_release();
}

void sub_512C()
{
  sub_9A88();
  uint64_t v1 = v0;
  double v3 = v2;
  uint64_t v4 = (int *)type metadata accessor for SettingsSliderView(0);
  sub_96A4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v43 = v8;
  v44 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_9F90();
  v45[0] = sub_9F70();
  v45[1] = v9;
  sub_A240();
  v45[3] = &type metadata for Double;
  *(double *)uint64_t v45 = v3;
  sub_54CC((uint64_t)v45, (uint64_t)&v46);
  uint64_t v10 = *(void *)(v0 + v4[7]);
  id v11 = objc_allocWithZone((Class)INSettingDevice);
  uint64_t v12 = sub_9E84();
  id v41 = sub_5B20(v12, v13, 0, 0, v10);
  id v14 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v3];
  id v15 = objc_allocWithZone((Class)INNumericSettingValue);
  id v42 = v14;
  id v16 = [v15 initWithValue:v14 unit:1];
  os_log_type_t v17 = sub_A1C0();
  uint64_t v18 = *(NSObject **)(v0 + v4[11]);
  os_log_type_t v19 = v17;
  if (os_log_type_enabled(v18, v17))
  {
    id v20 = v16;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = v6;
    uint64_t v22 = v21;
    uint64_t v39 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 134218242;
    double v46 = v3;
    sub_A200();
    *(_WORD *)(v22 + 12) = 2112;
    double v46 = *(double *)&v20;
    id v23 = v20;
    os_log_t v38 = v18;
    id v24 = v23;
    sub_A200();
    uint64_t v25 = (uint64_t)v39;
    *uint64_t v39 = v20;

    _os_log_impl(&dword_0, v38, v19, "[updateForm] Slider update to new value %f, inNumbericSettingValue: %@.", (uint8_t *)v22, 0x16u);
    sub_226C(&qword_10420);
    swift_arrayDestroy();
    sub_9AA4(v25);
    uint64_t v26 = v22;
    uint64_t v6 = v40;
    sub_9AA4(v26);
  }
  else
  {
    id v20 = v16;
  }
  uint64_t v27 = (uint64_t *)(v1 + v4[6]);
  uint64_t v28 = *v27;
  unint64_t v29 = v27[1];
  id v30 = v16;
  id v31 = v41;
  id v32 = v41;
  id v33 = sub_5554(v28, v29, v31, v20, 0, 0);

  sub_A000();
  uint64_t v34 = (void *)sub_9FF0();
  sub_5DA8();
  uint64_t v35 = v47;
  unint64_t v36 = (v43 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = swift_allocObject();
  sub_5DFC();
  *(void *)(v37 + v36) = v35;
  sub_9FE0();
  swift_release();

  sub_9ABC();
}

uint64_t sub_54CC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_8E80((_OWORD *)a1, v4);
    sub_8E90(v4, a2);
    return sub_8E2C(a2);
  }
  else
  {
    sub_94C4(a1, &qword_10438);
    sub_8CFC(a2, v4);
    sub_8E2C(a2);
    return sub_94C4((uint64_t)v4, &qword_10438);
  }
}

id sub_5554(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v13 = sub_A1C0();
  id v14 = *(NSObject **)(v6 + *(int *)(type metadata accessor for SettingsSliderView(0) + 44));
  if (os_log_type_enabled(v14, v13))
  {
    uint64_t v26 = a3;
    uint64_t v27 = a6;
    id v15 = a4;
    swift_bridgeObjectRetain_n();
    id v16 = v15;
    uint64_t v17 = sub_9D60();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v25 = sub_9D60();
    uint64_t v28 = v25;
    *(_DWORD *)uint64_t v17 = 136315650;
    swift_bridgeObjectRetain();
    sub_840C(a1, a2, &v28);
    sub_A200();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2048;
    sub_A200();
    *(_WORD *)(v17 + 22) = 2112;
    if (a4) {
      id v19 = v16;
    }
    sub_A200();
    *uint64_t v18 = a4;

    _os_log_impl(&dword_0, v14, v13, "[getSetNumericIntent] settingsIdentifier: %s, boundedValue: %ld, numericValue: %@", (uint8_t *)v17, 0x20u);
    sub_226C(&qword_10420);
    swift_arrayDestroy();
    sub_9AA4((uint64_t)v18);
    swift_arrayDestroy();
    sub_9AA4(v25);
    sub_9AA4(v17);
    a6 = v27;
    a3 = v26;
  }
  id v20 = objc_allocWithZone((Class)INSettingMetadata);
  id v21 = a3;
  swift_bridgeObjectRetain();
  id v22 = sub_5BC8(a1, a2, a3, 0);
  sub_8CC0(0, &qword_10430);
  id v23 = a4;
  return sub_5A80(v22, a4, a5, a6, 0);
}

void sub_57F4()
{
  sub_9B04();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_A150();
  sub_96A4();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_9868();
  if ([v6 code] != (char *)&dword_0 + 3)
  {
    os_log_type_t v13 = sub_A1C0();
    id v14 = *v4;
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      id v16 = v6;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = sub_9D60();
      uint64_t v22 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      [v16 code];
      type metadata accessor for INSetNumericSettingIntentResponseCode();
      uint64_t v19 = sub_A1A0();
      sub_840C(v19, v20, &v22);
      sub_A200();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v14, v15, "Settings slider not updated due to failure code %s", v17, 0xCu);
      swift_arrayDestroy();
      sub_9AA4(v18);
      sub_9AA4((uint64_t)v17);
    }
    goto LABEL_6;
  }
  if (*(NSObject **)((char *)v4 + *(int *)(type metadata accessor for SettingsSliderView(0) + 40)))
  {
    swift_retain();
    sub_9F70();
    *uint64_t v0 = v2;
    (*(void (**)(void *, void, uint64_t))(v9 + 104))(v0, enum case for Form.State.valid(_:), v7);
    swift_bridgeObjectRetain();
    sub_A140();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_9E00();
    v12(v11);
LABEL_6:
    sub_9AD8();
    return;
  }
  sub_A160();
  uint64_t v21 = sub_3D60(&qword_100E8, (void (*)(uint64_t))&type metadata accessor for Form);
  sub_9DE0(v21);
  __break(1u);
}

id sub_5A80(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithSettingMetadata:a1 numericValue:a2 boundedValue:a3 action:a4 temporalEventTrigger:a5];

  return v8;
}

uint64_t sub_5B00()
{
  return sub_A0A0();
}

id sub_5B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    NSString v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v9 = 0;
    goto LABEL_6;
  }
  NSString v8 = sub_A190();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v9 = sub_A190();
  swift_bridgeObjectRelease();
LABEL_6:
  id v10 = [v5 initWithDeviceName:v8 deviceModel:v9 deviceCategory:a5];

  return v10;
}

id sub_5BC8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSString v7 = sub_A190();
  swift_bridgeObjectRelease();
  id v8 = [v4 initWithSettingId:v7 targetDevice:a3 targetApp:a4];

  return v8;
}

void sub_5C40(uint64_t a1@<X8>)
{
  sub_5C74();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_5C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_5CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_5CD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_9CA8(a1, a2, a3);
  sub_96D4();
  sub_9C98();
  v4();
  return v3;
}

void *sub_5D18(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_5D5C()
{
  unint64_t result = qword_104F0[0];
  if (!qword_104F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_104F0);
  }
  return result;
}

uint64_t sub_5DA8()
{
  uint64_t v1 = sub_9E64();
  v2(v1);
  sub_96D4();
  sub_98EC();
  v3();
  return v0;
}

uint64_t sub_5DFC()
{
  uint64_t v1 = sub_9E64();
  v2(v1);
  sub_96D4();
  sub_995C();
  v3();
  return v0;
}

void sub_5E4C()
{
  uint64_t v0 = type metadata accessor for SettingsSliderView(0);
  sub_9A5C(v0);
  sub_512C();
}

uint64_t sub_5E98()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5ED0(double *a1)
{
  return (*(uint64_t (**)(double))(v1 + 16))(*a1);
}

uint64_t sub_5F00()
{
  type metadata accessor for SettingsSliderView(0);
  sub_9974();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  uint64_t v10 = v1 + v7;

  sub_9FD0();
  sub_96D4();
  sub_9968();
  v11();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();

  return _swift_deallocObject(v1, v8, v9);
}

void sub_6004()
{
  uint64_t v0 = type metadata accessor for SettingsSliderView(0);
  sub_9A5C(v0);
  sub_226C(&qword_10148);
  sub_A0D0();
  sub_512C();
}

uint64_t sub_6080()
{
  return sub_9BD8();
}

uint64_t sub_6098()
{
  return sub_9BD8();
}

void initializeBufferWithCopyOfBuffer for SettingsControlSliderView()
{
  sub_9AF0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  type metadata accessor for ViewData(0);
  sub_96C0();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    sub_9BB0();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_9F30();
    if (sub_98F8(v7))
    {
      uint64_t v8 = sub_226C(&qword_100F0);
      uint64_t v9 = sub_971C(v8);
      sub_99EC(v9, v11, *(void *)(v10 + 64));
    }
    else
    {
      sub_96E4();
      sub_98EC();
      v12();
      sub_989C();
    }
    sub_9830();
    if (sub_984C())
    {
      uint64_t v13 = sub_226C(&qword_100C0);
      uint64_t v14 = sub_971C(v13);
      sub_9A04(v14, v16, *(void *)(v15 + 64));
    }
    else
    {
      sub_96E4();
      uint64_t v17 = sub_9818();
      v18(v17);
      sub_9728();
    }
    uint64_t v19 = *(int *)(v6 + 24);
    unint64_t v20 = (void *)(v3 + v19);
    uint64_t v21 = (void *)(v1 + v19);
    uint64_t v22 = v21[1];
    *unint64_t v20 = *v21;
    v20[1] = v22;
    sub_96F0();
    sub_96D4();
    id v24 = *(void (**)(uint64_t))(v23 + 16);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_9EA4();
    v24(v25);
  }
  sub_9B1C();
}

uint64_t sub_6210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t destroy for SettingsControlSliderView(uint64_t a1)
{
  uint64_t v2 = sub_9F30();
  if (!sub_6210(a1, 1, v2))
  {
    sub_96E4();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  uint64_t v4 = a1 + *(int *)(type metadata accessor for ViewData(0) + 20);
  uint64_t v5 = sub_9F40();
  if (!sub_9A70(v4))
  {
    sub_96E4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  sub_9FD0();
  sub_96D4();
  uint64_t v7 = sub_9E0C();

  return v8(v7);
}

void initializeWithCopy for SettingsControlSliderView()
{
  sub_9AF0();
  uint64_t v2 = sub_9880();
  if (sub_9E18(v2))
  {
    uint64_t v3 = sub_226C(&qword_100F0);
    uint64_t v4 = sub_971C(v3);
    sub_99EC(v4, v6, *(void *)(v5 + 64));
  }
  else
  {
    sub_96E4();
    sub_98EC();
    v7();
    sub_99CC();
  }
  uint64_t v8 = type metadata accessor for ViewData(0);
  sub_9830();
  if (sub_984C())
  {
    uint64_t v9 = sub_226C(&qword_100C0);
    uint64_t v10 = sub_971C(v9);
    sub_9A04(v10, v12, *(void *)(v11 + 64));
  }
  else
  {
    sub_96E4();
    uint64_t v13 = sub_9818();
    v14(v13);
    sub_9728();
  }
  uint64_t v15 = *(int *)(v8 + 24);
  uint64_t v16 = (void *)(v0 + v15);
  uint64_t v17 = (void *)(v1 + v15);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  sub_96F0();
  sub_96D4();
  unint64_t v20 = *(void (**)(uint64_t))(v19 + 16);
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_9CDC();
  v20(v21);
  sub_9B1C();
}

void assignWithCopy for SettingsControlSliderView()
{
  sub_9AF0();
  uint64_t v2 = sub_9880();
  int v3 = sub_9B30(v2);
  if (v0)
  {
    if (!v3)
    {
      sub_96E4();
      sub_98EC();
      v4();
      sub_99CC();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_96C0();
  if (v5)
  {
    uint64_t v6 = sub_9D2C();
    v7(v6);
LABEL_6:
    uint64_t v8 = sub_226C(&qword_100F0);
    uint64_t v9 = sub_971C(v8);
    sub_99EC(v9, v11, *(void *)(v10 + 64));
    goto LABEL_7;
  }
  uint64_t v25 = sub_9DAC();
  v26(v25);
LABEL_7:
  type metadata accessor for ViewData(0);
  uint64_t v12 = sub_9830();
  int v13 = sub_9768(v12);
  if (!v1)
  {
    sub_96C0();
    if (!v16)
    {
      uint64_t v27 = sub_9B94();
      v28(v27);
      goto LABEL_13;
    }
    uint64_t v17 = sub_99B8();
    v18(v17);
    goto LABEL_12;
  }
  if (v13)
  {
LABEL_12:
    uint64_t v19 = sub_226C(&qword_100C0);
    uint64_t v20 = sub_971C(v19);
    sub_9A04(v20, v22, *(void *)(v21 + 64));
    goto LABEL_13;
  }
  sub_96E4();
  uint64_t v14 = sub_9818();
  v15(v14);
  sub_9728();
LABEL_13:
  sub_98BC();
  swift_bridgeObjectRelease();
  sub_96F0();
  sub_96D4();
  uint64_t v23 = sub_9E90();
  v24(v23);
  sub_9B1C();
}

uint64_t initializeWithTake for SettingsControlSliderView()
{
  uint64_t v2 = sub_9880();
  if (sub_9E18(v2))
  {
    uint64_t v3 = sub_226C(&qword_100F0);
    uint64_t v4 = sub_971C(v3);
    sub_99EC(v4, v6, *(void *)(v5 + 64));
  }
  else
  {
    sub_96E4();
    sub_995C();
    v7();
    sub_99CC();
  }
  uint64_t v8 = type metadata accessor for ViewData(0);
  sub_9830();
  if (sub_984C())
  {
    uint64_t v9 = sub_226C(&qword_100C0);
    uint64_t v10 = sub_971C(v9);
    sub_9A04(v10, v12, *(void *)(v11 + 64));
  }
  else
  {
    sub_96E4();
    uint64_t v13 = sub_9918();
    v14(v13);
    sub_9728();
  }
  *(_OWORD *)(v0 + *(int *)(v8 + 24)) = *(_OWORD *)(v1 + *(int *)(v8 + 24));
  sub_96F0();
  sub_96D4();
  sub_995C();
  v15();
  return v0;
}

void assignWithTake for SettingsControlSliderView()
{
  sub_9AF0();
  uint64_t v2 = sub_9880();
  int v3 = sub_9B30(v2);
  if (v0)
  {
    if (!v3)
    {
      sub_96E4();
      sub_995C();
      v4();
      sub_99CC();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_96C0();
  if (v5)
  {
    uint64_t v6 = sub_9D2C();
    v7(v6);
LABEL_6:
    uint64_t v8 = sub_226C(&qword_100F0);
    uint64_t v9 = sub_971C(v8);
    sub_99EC(v9, v11, *(void *)(v10 + 64));
    goto LABEL_7;
  }
  uint64_t v24 = sub_9DAC();
  v25(v24);
LABEL_7:
  type metadata accessor for ViewData(0);
  uint64_t v12 = sub_9830();
  int v13 = sub_9768(v12);
  if (!v1)
  {
    sub_96C0();
    if (!v16)
    {
      uint64_t v26 = sub_9C4C();
      v27(v26);
      goto LABEL_13;
    }
    uint64_t v17 = sub_99B8();
    v18(v17);
    goto LABEL_12;
  }
  if (v13)
  {
LABEL_12:
    uint64_t v19 = sub_226C(&qword_100C0);
    uint64_t v20 = sub_971C(v19);
    sub_9A04(v20, v22, *(void *)(v21 + 64));
    goto LABEL_13;
  }
  sub_96E4();
  uint64_t v14 = sub_9918();
  v15(v14);
  sub_9728();
LABEL_13:
  sub_9990();
  sub_96F0();
  sub_96D4();
  sub_9C98();
  v23();
  sub_9B1C();
}

uint64_t getEnumTagSinglePayload for SettingsControlSliderView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_68D4);
}

uint64_t sub_68D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ViewData(0);

  return sub_6210(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SettingsControlSliderView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_6930);
}

uint64_t sub_6930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ViewData(0);

  return sub_5CA8(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SettingsControlSliderView(uint64_t a1)
{
  return sub_699C(a1, (uint64_t *)&unk_10700);
}

uint64_t sub_699C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_69D0()
{
  uint64_t result = type metadata accessor for ViewData(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return sub_9E84();
  }
  return result;
}

void initializeBufferWithCopyOfBuffer for ViewData()
{
  sub_9AF0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_96C0();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    sub_9BB0();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_9F30();
    if (sub_98F8(v7))
    {
      uint64_t v8 = sub_226C(&qword_100F0);
      uint64_t v9 = sub_971C(v8);
      sub_99EC(v9, v11, *(void *)(v10 + 64));
    }
    else
    {
      sub_96E4();
      sub_98EC();
      v12();
      sub_989C();
    }
    sub_9830();
    if (sub_984C())
    {
      uint64_t v13 = sub_226C(&qword_100C0);
      uint64_t v14 = sub_971C(v13);
      sub_9A04(v14, v16, *(void *)(v15 + 64));
    }
    else
    {
      sub_96E4();
      uint64_t v17 = sub_9818();
      v18(v17);
      sub_9728();
    }
    uint64_t v19 = *(int *)(v6 + 24);
    uint64_t v20 = *(int *)(v6 + 28);
    uint64_t v21 = (void *)(v3 + v19);
    uint64_t v22 = (uint64_t *)(v1 + v19);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    uint64_t v25 = *(void *)(v1 + v20);
    *uint64_t v21 = v23;
    v21[1] = v24;
    *(void *)(v3 + v20) = v25;
    sub_9748();
    sub_96D4();
    uint64_t v27 = *(void (**)(uint64_t))(v26 + 16);
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_9EA4();
    v27(v28);
  }
  sub_9B1C();
}

uint64_t destroy for ViewData()
{
  uint64_t v2 = sub_9880();
  if (!sub_6210(v0, 1, v2))
  {
    sub_96E4();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
  }
  uint64_t v4 = v0 + *(int *)(v1 + 20);
  uint64_t v5 = sub_9F40();
  if (!sub_9A70(v4))
  {
    sub_96E4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  sub_9FD0();
  sub_96D4();
  uint64_t v7 = sub_9E0C();

  return v8(v7);
}

void initializeWithCopy for ViewData()
{
  sub_9AF0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_9880();
  if (sub_98F8(v4))
  {
    uint64_t v5 = sub_226C(&qword_100F0);
    uint64_t v6 = sub_971C(v5);
    sub_99EC(v6, v8, *(void *)(v7 + 64));
  }
  else
  {
    sub_96E4();
    sub_98EC();
    v9();
    sub_989C();
  }
  sub_9830();
  if (sub_984C())
  {
    uint64_t v10 = sub_226C(&qword_100C0);
    uint64_t v11 = sub_971C(v10);
    sub_9A04(v11, v13, *(void *)(v12 + 64));
  }
  else
  {
    sub_96E4();
    uint64_t v14 = sub_9818();
    v15(v14);
    sub_9728();
  }
  uint64_t v16 = *(int *)(v3 + 24);
  uint64_t v17 = *(int *)(v3 + 28);
  uint64_t v18 = (void *)(v0 + v16);
  uint64_t v19 = (uint64_t *)(v1 + v16);
  uint64_t v20 = *v19;
  uint64_t v21 = v19[1];
  uint64_t v22 = *(void *)(v1 + v17);
  *uint64_t v18 = v20;
  v18[1] = v21;
  *(void *)(v0 + v17) = v22;
  sub_9748();
  sub_96D4();
  uint64_t v24 = *(void (**)(uint64_t))(v23 + 16);
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_9CDC();
  v24(v25);
  sub_9B1C();
}

void assignWithCopy for ViewData()
{
  sub_9AF0();
  uint64_t v3 = sub_9880();
  int v4 = sub_6210(v0, 1, v3);
  int v5 = sub_9A70(v1);
  if (v4)
  {
    if (!v5)
    {
      sub_96E4();
      sub_98EC();
      v6();
      sub_989C();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_96C0();
  if (v7)
  {
    uint64_t v8 = sub_9D18();
    v9(v8);
LABEL_6:
    uint64_t v10 = sub_226C(&qword_100F0);
    uint64_t v11 = sub_971C(v10);
    sub_99EC(v11, v13, *(void *)(v12 + 64));
    goto LABEL_7;
  }
  uint64_t v27 = sub_9D98();
  v28(v27);
LABEL_7:
  uint64_t v14 = sub_9830();
  int v15 = sub_9768(v14);
  if (!v2)
  {
    sub_96C0();
    if (!v18)
    {
      uint64_t v29 = sub_9B94();
      v30(v29);
      goto LABEL_13;
    }
    uint64_t v19 = sub_99B8();
    v20(v19);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    uint64_t v21 = sub_226C(&qword_100C0);
    uint64_t v22 = sub_971C(v21);
    sub_9A04(v22, v24, *(void *)(v23 + 64));
    goto LABEL_13;
  }
  sub_96E4();
  uint64_t v16 = sub_9818();
  v17(v16);
  sub_9728();
LABEL_13:
  sub_98BC();
  swift_bridgeObjectRelease();
  sub_96F0();
  sub_96D4();
  uint64_t v25 = sub_9E90();
  v26(v25);
  sub_9B1C();
}

uint64_t initializeWithTake for ViewData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9880();
  if (sub_98F8(v6))
  {
    uint64_t v7 = sub_226C(&qword_100F0);
    uint64_t v8 = sub_971C(v7);
    sub_99EC(v8, v10, *(void *)(v9 + 64));
  }
  else
  {
    sub_96E4();
    sub_995C();
    v11();
    sub_989C();
  }
  sub_9830();
  if (sub_984C())
  {
    uint64_t v12 = sub_226C(&qword_100C0);
    uint64_t v13 = sub_971C(v12);
    sub_9A04(v13, v15, *(void *)(v14 + 64));
  }
  else
  {
    sub_96E4();
    uint64_t v16 = sub_9918();
    v17(v16);
    sub_9728();
  }
  uint64_t v18 = *(int *)(a3 + 28);
  *(_OWORD *)(v3 + *(int *)(a3 + 24)) = *(_OWORD *)(v4 + *(int *)(a3 + 24));
  *(void *)(v3 + v18) = *(void *)(v4 + v18);
  sub_9748();
  sub_96D4();
  sub_995C();
  v19();
  return v3;
}

void assignWithTake for ViewData()
{
  sub_9AF0();
  uint64_t v4 = v3;
  uint64_t v5 = sub_9880();
  int v6 = sub_6210(v0, 1, v5);
  int v7 = sub_9A70(v1);
  if (v6)
  {
    if (!v7)
    {
      sub_96E4();
      sub_995C();
      v8();
      sub_989C();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_96C0();
  if (v9)
  {
    uint64_t v10 = sub_9D18();
    v11(v10);
LABEL_6:
    uint64_t v12 = sub_226C(&qword_100F0);
    uint64_t v13 = sub_971C(v12);
    sub_99EC(v13, v15, *(void *)(v14 + 64));
    goto LABEL_7;
  }
  uint64_t v28 = sub_9D98();
  v29(v28);
LABEL_7:
  uint64_t v16 = sub_9830();
  int v17 = sub_9768(v16);
  if (!v2)
  {
    sub_96C0();
    if (!v20)
    {
      uint64_t v30 = sub_9C4C();
      v31(v30);
      goto LABEL_13;
    }
    uint64_t v21 = sub_99B8();
    v22(v21);
    goto LABEL_12;
  }
  if (v17)
  {
LABEL_12:
    uint64_t v23 = sub_226C(&qword_100C0);
    uint64_t v24 = sub_971C(v23);
    sub_9A04(v24, v26, *(void *)(v25 + 64));
    goto LABEL_13;
  }
  sub_96E4();
  uint64_t v18 = sub_9918();
  v19(v18);
  sub_9728();
LABEL_13:
  sub_9990();
  *(void *)(v0 + *(int *)(v4 + 28)) = *(void *)(v1 + *(int *)(v4 + 28));
  sub_9FD0();
  sub_96D4();
  sub_9C98();
  v27();
  sub_9B1C();
}

uint64_t getEnumTagSinglePayload for ViewData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7280);
}

uint64_t sub_7280(uint64_t a1, uint64_t a2, int *a3)
{
  sub_226C(&qword_100F0);
  sub_96C0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_226C(&qword_100C0);
    sub_96C0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      if (a2 == 0x7FFFFFFF) {
        return sub_9E38(*(void *)(a1 + a3[6] + 8));
      }
      uint64_t v8 = sub_9FD0();
      uint64_t v12 = a3[8];
    }
    uint64_t v9 = a1 + v12;
  }

  return sub_6210(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ViewData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7370);
}

void sub_7370(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_226C(&qword_100F0);
  sub_96C0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_226C(&qword_100C0);
    sub_96C0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(void *)(a1 + a4[6] + 8) = (a2 - 1);
        return;
      }
      uint64_t v10 = sub_9FD0();
      uint64_t v14 = a4[8];
    }
    uint64_t v11 = a1 + v14;
  }

  sub_5CA8(v11, a2, a2, v10);
}

void sub_7454()
{
  sub_75A4(319, &qword_10230, (void (*)(uint64_t))&type metadata accessor for TextProperty);
  if (v0 <= 0x3F)
  {
    sub_75A4(319, (unint64_t *)&unk_10238, (void (*)(uint64_t))&type metadata accessor for ActionProperty);
    if (v1 <= 0x3F)
    {
      sub_9FD0();
      if (v2 <= 0x3F)
      {
        swift_initStructMetadata();
        sub_9E84();
      }
    }
  }
}

void sub_75A4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_A1F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for SettingsControlSliderCustomCanvasPlugin()
{
  return self;
}

void initializeBufferWithCopyOfBuffer for SettingsSliderView()
{
  sub_9B04();
  sub_96C0();
  int v4 = *(_DWORD *)(v3 + 80);
  uint64_t v5 = *v1;
  *unint64_t v0 = *v1;
  if ((v4 & 0x20000) != 0)
  {
    swift_retain();
  }
  else
  {
    uint64_t v6 = v1;
    uint64_t v7 = *(int *)(v2 + 20);
    uint64_t v8 = (char *)v0 + v7;
    uint64_t v9 = (char *)v1 + v7;
    uint64_t v10 = sub_9FD0();
    sub_96D4();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    id v13 = v5;
    v12(v8, v9, v10);
    sub_97AC();
    swift_retain();
    uint64_t v14 = v8;
    swift_retain();
    uint64_t v15 = v6;
  }
  sub_9AD8();
}

void destroy for SettingsSliderView(id *a1, uint64_t a2)
{
  sub_9FD0();
  sub_96D4();
  sub_9968();
  v4();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  uint64_t v5 = *(id *)((char *)a1 + *(int *)(a2 + 44));
}

void initializeWithCopy for SettingsSliderView()
{
  sub_9B04();
  uint64_t v3 = v2;
  int v4 = *v2;
  void *v5 = *v2;
  uint64_t v6 = sub_9DC0();
  sub_96D4();
  uint64_t v8 = *(void (**)(uint64_t, void *, uint64_t))(v7 + 16);
  id v9 = v4;
  v8(v0, v1, v6);
  sub_97AC();
  swift_retain();
  id v10 = v1;
  swift_retain();
  uint64_t v11 = v3;
  sub_9AD8();
}

uint64_t assignWithCopy for SettingsSliderView()
{
  sub_9ECC();
  uint64_t v5 = *v4;
  *int v4 = v6;
  id v7 = v6;

  sub_9D78();
  sub_96D4();
  (*(void (**)(void *, uint64_t))(v8 + 24))(v5, v3);
  sub_98BC();
  swift_bridgeObjectRelease();
  *(void *)(v0 + v2[7]) = *(void *)(v1 + v2[7]);
  uint64_t v9 = v2[8];
  id v10 = (void *)(v0 + v9);
  uint64_t v11 = (void *)(v1 + v9);
  *id v10 = *v11;
  v10[1] = v11[1];
  swift_retain();
  swift_release();
  uint64_t v12 = v2[9];
  id v13 = (void *)(v0 + v12);
  uint64_t v14 = v1 + v12;
  uint64_t v15 = *(void **)(v0 + v12);
  uint64_t v16 = *(void **)(v1 + v12);
  *id v13 = v16;
  id v17 = v16;

  v13[1] = *(void *)(v14 + 8);
  uint64_t v18 = v2[10];
  uint64_t v19 = v0 + v18;
  uint64_t v20 = v1 + v18;
  *(void *)(v0 + v18) = *(void *)(v1 + v18);
  swift_retain();
  swift_release();
  *(void *)(v19 + 8) = *(void *)(v20 + 8);
  uint64_t v21 = v2[11];
  uint64_t v22 = *(void **)(v1 + v21);
  uint64_t v23 = *(void **)(v0 + v21);
  *(void *)(v0 + v21) = v22;
  id v24 = v22;

  return v0;
}

void *initializeWithTake for SettingsSliderView(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  sub_9DC0();
  sub_96D4();
  sub_995C();
  v6();
  sub_9D04(a3[6]);
  uint64_t v7 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v7) = *(_OWORD *)((char *)a2 + v7);
  sub_9D04(a3[10]);
  return a1;
}

uint64_t assignWithTake for SettingsSliderView()
{
  sub_9ECC();
  uint64_t v6 = *v5;
  void *v5 = v7;

  sub_9D78();
  sub_96D4();
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v3, v4);
  sub_9990();
  uint64_t v9 = v2[8];
  *(void *)(v0 + v2[7]) = *(void *)(v1 + v2[7]);
  id v10 = (void *)(v0 + v9);
  uint64_t v11 = (void *)(v1 + v9);
  *id v10 = *v11;
  v10[1] = v11[1];
  swift_release();
  uint64_t v12 = v2[9];
  id v13 = (void *)(v0 + v12);
  uint64_t v14 = (void *)(v1 + v12);
  uint64_t v15 = *(void **)(v0 + v12);
  *id v13 = *v14;

  v13[1] = v14[1];
  uint64_t v16 = v2[10];
  uint64_t v17 = v0 + v16;
  uint64_t v18 = v1 + v16;
  *(void *)(v0 + v16) = *(void *)(v1 + v16);
  swift_release();
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  uint64_t v19 = v2[11];
  uint64_t v20 = *(void **)(v0 + v19);
  *(void *)(v0 + v19) = *(void *)(v1 + v19);

  return v0;
}

uint64_t getEnumTagSinglePayload for SettingsSliderView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7B08);
}

uint64_t sub_7B08(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return sub_9E38(*a1);
  }
  uint64_t v7 = sub_9FD0();
  uint64_t v8 = (uint64_t)a1 + *(int *)(a3 + 20);

  return sub_6210(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for SettingsSliderView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7B98);
}

void *sub_7B98(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_9FD0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)sub_5CA8(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_7C18()
{
  uint64_t result = sub_9FD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return sub_9E84();
  }
  return result;
}

uint64_t sub_7CD8()
{
  return sub_7F04(&qword_103A8, &qword_103B0);
}

unint64_t sub_7D18()
{
  unint64_t result = qword_103B8;
  if (!qword_103B8)
  {
    sub_2300(&qword_10150);
    sub_7D94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_103B8);
  }
  return result;
}

unint64_t sub_7D94()
{
  unint64_t result = qword_103C0;
  if (!qword_103C0)
  {
    sub_2300(&qword_10140);
    sub_928C(&qword_103C8, &qword_10138, (void (*)(void))sub_7E6C);
    sub_7F04(&qword_103F0, &qword_103F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_103C0);
  }
  return result;
}

unint64_t sub_7E6C()
{
  unint64_t result = qword_103D0;
  if (!qword_103D0)
  {
    sub_2300(&qword_103D8);
    sub_7F04(&qword_103E0, &qword_103E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_103D0);
  }
  return result;
}

uint64_t sub_7F04(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2300(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ViewData.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ViewData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ViewData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x80ACLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_80D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_80DC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ViewData.CodingKeys()
{
  return &type metadata for ViewData.CodingKeys;
}

unint64_t sub_80F8()
{
  unint64_t result = qword_10830[0];
  if (!qword_10830[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10830);
  }
  return result;
}

unint64_t sub_8148()
{
  unint64_t result = qword_109C0;
  if (!qword_109C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_109C0);
  }
  return result;
}

unint64_t sub_8198()
{
  unint64_t result = qword_109C8[0];
  if (!qword_109C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_109C8);
  }
  return result;
}

unint64_t sub_81E4()
{
  unint64_t result = qword_10410;
  if (!qword_10410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10410);
  }
  return result;
}

uint64_t sub_8230()
{
  sub_9AF0();
  unint64_t v1 = (int *)(type metadata accessor for SettingsSliderView(0) - 8);
  int v2 = (id *)(v0
            + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80)));

  sub_9FD0();
  sub_96D4();
  sub_9968();
  v3();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  sub_9B1C();
  return _swift_deallocObject(v4, v5, v6);
}

void sub_8370()
{
  type metadata accessor for SettingsSliderView(0);

  sub_57F4();
}

uint64_t sub_840C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_84E0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_8C60((uint64_t)v12, *a3);
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
      sub_8C60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_8C10((uint64_t)v12);
  return v7;
}

uint64_t sub_84E0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_8638((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_A210();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_8710(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_A260();
    if (!v8)
    {
      uint64_t result = sub_A290();
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

void *sub_8638(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A2A0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_8710(uint64_t a1, unint64_t a2)
{
  int v2 = sub_87A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v2 = sub_8984(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    int v2 = sub_8984((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_87A8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_A1B0();
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
  unint64_t v3 = sub_891C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_A250();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_A2A0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_A290();
  __break(1u);
  return result;
}

void *sub_891C(uint64_t a1, uint64_t a2)
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
  sub_226C(&qword_10428);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_8984(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_226C(&qword_10428);
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
    sub_8B34(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_8A5C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_8A5C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A2A0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_8B34(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_A2A0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void type metadata accessor for INSetNumericSettingIntentResponseCode()
{
  if (!qword_104E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_104E0);
    }
  }
}

uint64_t sub_8C10(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_8C60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8CC0(uint64_t a1, unint64_t *a2)
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

double sub_8CFC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_8F10(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_226C(&qword_10440);
    sub_A270(isUniquelyReferenced_nonNull_native, v10);
    sub_8E2C(*(void *)(v12 + 48) + 40 * v6);
    sub_8E80((_OWORD *)(*(void *)(v12 + 56) + 32 * v6), a2);
    sub_A280();
    *uint64_t v3 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_8E2C(uint64_t a1)
{
  return a1;
}

_OWORD *sub_8E80(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_8E90(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *long long v2 = 0x8000000000000000;
  sub_8F54(a1, a2, isUniquelyReferenced_nonNull_native);
  *long long v2 = v7;

  return swift_bridgeObjectRelease();
}

unint64_t sub_8F10(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_A220(*(void *)(v2 + 40));

  return sub_9164(a1, v4);
}

_OWORD *sub_8F54(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  int64_t v8 = (void *)*v3;
  unint64_t v9 = sub_8F10(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_226C(&qword_10440);
  if (!sub_A270(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_8F10(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    double result = (_OWORD *)sub_A340();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v14);
    sub_8C10((uint64_t)v19);
    return sub_8E80(a1, v19);
  }
  else
  {
    sub_908C(a2, (uint64_t)v21);
    return sub_90E8(v14, (uint64_t)v21, a1, v18);
  }
}

uint64_t sub_908C(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_90E8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = sub_8E80(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_9164(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_908C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_A230();
      sub_8E2C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_922C()
{
}

void sub_925C()
{
}

uint64_t sub_928C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2300(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_92F8()
{
  unint64_t result = qword_10460;
  if (!qword_10460)
  {
    sub_2300(&qword_10468);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10460);
  }
  return result;
}

unint64_t sub_938C()
{
  unint64_t result = qword_10470;
  if (!qword_10470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10470);
  }
  return result;
}

uint64_t sub_93D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_9CA8(a1, a2, a3);
  sub_96D4();
  sub_995C();
  v4();
  return v3;
}

uint64_t sub_9424(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_96D4();
  sub_9968();
  v3();
  return a1;
}

uint64_t sub_9478(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_9CA8(a1, a2, a3);
  sub_96D4();
  sub_98EC();
  v4();
  return v3;
}

uint64_t sub_94C4(uint64_t a1, uint64_t *a2)
{
  sub_226C(a2);
  sub_96D4();
  sub_9968();
  v3();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsControlSliderCustomCanvasPlugin.Error(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SettingsControlSliderCustomCanvasPlugin.Error(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x9604);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_962C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SettingsControlSliderCustomCanvasPlugin.Error()
{
  return &type metadata for SettingsControlSliderCustomCanvasPlugin.Error;
}

unint64_t sub_9648()
{
  unint64_t result = qword_104E8;
  if (!qword_104E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_104E8);
  }
  return result;
}

uint64_t sub_96F0()
{
  *(void *)(v0 + *(int *)(v2 + 28)) = *(void *)(v1 + *(int *)(v2 + 28));
  return sub_9FD0();
}

uint64_t sub_971C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_9728()
{
  return sub_5CA8(v0, 0, 1, v1);
}

uint64_t sub_9748()
{
  return sub_9FD0();
}

uint64_t sub_9768(uint64_t a1)
{
  sub_6210(v1, 1, a1);
  return sub_6210(v2, 1, a1);
}

uint64_t sub_97AC()
{
  uint64_t v4 = v2[6];
  uint64_t v5 = v2[7];
  char v6 = (void *)(v0 + v4);
  uint64_t v7 = (void *)(v1 + v4);
  uint64_t v8 = v7[1];
  *char v6 = *v7;
  v6[1] = v8;
  *(void *)(v0 + v5) = *(void *)(v1 + v5);
  uint64_t v9 = v2[8];
  uint64_t v10 = v2[9];
  uint64_t v11 = (void *)(v0 + v9);
  BOOL v12 = (void *)(v1 + v9);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  unint64_t v14 = (void *)(v0 + v10);
  char v15 = (uint64_t *)(v1 + v10);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *unint64_t v14 = v17;
  v14[1] = v16;
  uint64_t v18 = v2[10];
  uint64_t v19 = v2[11];
  uint64_t v20 = (void *)(v0 + v18);
  uint64_t v21 = (uint64_t *)(v1 + v18);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  *(void *)(v0 + v19) = *(void *)(v1 + v19);
  return swift_bridgeObjectRetain();
}

uint64_t sub_9818()
{
  return v0;
}

uint64_t sub_9830()
{
  return sub_9F40();
}

uint64_t sub_984C()
{
  return sub_6210(v0, 1, v1);
}

uint64_t sub_9880()
{
  return sub_9F30();
}

uint64_t sub_989C()
{
  return sub_5CA8(v0, 0, 1, v1);
}

uint64_t sub_98BC()
{
  uint64_t v4 = *(int *)(v2 + 24);
  uint64_t v5 = (void *)(v0 + v4);
  char v6 = (void *)(v1 + v4);
  void *v5 = *v6;
  v5[1] = v6[1];
  return swift_bridgeObjectRetain();
}

uint64_t sub_98F8(uint64_t a1)
{
  return sub_6210(v1, 1, a1);
}

uint64_t sub_9918()
{
  return v0;
}

uint64_t sub_9990()
{
  uint64_t v4 = *(int *)(v2 + 24);
  uint64_t v5 = (void *)(v0 + v4);
  char v6 = (uint64_t *)(v1 + v4);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  void *v5 = v8;
  v5[1] = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_99B8()
{
  return v0;
}

uint64_t sub_99CC()
{
  return sub_5CA8(v0, 0, 1, v1);
}

void *sub_99EC(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

void *sub_9A04(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t sub_9A30()
{
  return sub_A330();
}

uint64_t sub_9A5C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_9A70(uint64_t a1)
{
  return sub_6210(a1, 1, v1);
}

uint64_t sub_9AA4(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_9B30(uint64_t a1)
{
  sub_6210(v1, 1, a1);
  return sub_6210(v2, 1, a1);
}

uint64_t sub_9B74()
{
  return v0;
}

uint64_t sub_9B94()
{
  return v0;
}

uint64_t sub_9BB0()
{
  *uint64_t v0 = *v1;
  return swift_retain();
}

uint64_t sub_9BD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_9BE0()
{
  return type metadata accessor for SettingsSliderView(0);
}

uint64_t sub_9C08()
{
  return 0;
}

uint64_t sub_9C24()
{
  return v0;
}

uint64_t sub_9C4C()
{
  return v0;
}

uint64_t sub_9C80()
{
  return *(void *)(v0 - 128);
}

uint64_t sub_9CA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_226C(a3);
}

uint64_t sub_9CDC()
{
  return v0;
}

__n128 sub_9D04@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v2 + a1);
  *(__n128 *)(v3 + a1) = result;
  *(void *)(v3 + v1) = *(void *)(v2 + v1);
  return result;
}

uint64_t sub_9D18()
{
  return v0;
}

uint64_t sub_9D2C()
{
  return v0;
}

uint64_t sub_9D60()
{
  return swift_slowAlloc();
}

uint64_t sub_9D78()
{
  return sub_9FD0();
}

uint64_t sub_9D98()
{
  return v0;
}

uint64_t sub_9DAC()
{
  return v0;
}

uint64_t sub_9DC0()
{
  return sub_9FD0();
}

uint64_t sub_9DE0(uint64_t a1)
{
  return EnvironmentObject.error()(0, v1, v2, a1);
}

uint64_t sub_9E00()
{
  return v0;
}

uint64_t sub_9E0C()
{
  return v0;
}

uint64_t sub_9E18(uint64_t a1)
{
  return sub_6210(v1, 1, a1);
}

uint64_t sub_9E38@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t sub_9E4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_9E64()
{
  return 0;
}

uint64_t sub_9E84()
{
  return 0;
}

uint64_t sub_9E90()
{
  return v0;
}

uint64_t sub_9EA4()
{
  return v0;
}

unint64_t sub_9EB8()
{
  return 0xD000000000000017;
}

uint64_t sub_9EE0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_9EF0()
{
  return JSONDecoder.init()();
}

uint64_t sub_9F00()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_9F10()
{
  return type metadata accessor for _ProtoIdiom();
}

uint64_t sub_9F20()
{
  return TextProperty.asView()();
}

uint64_t sub_9F30()
{
  return type metadata accessor for TextProperty();
}

uint64_t sub_9F40()
{
  return type metadata accessor for ActionProperty();
}

uint64_t sub_9F50()
{
  return VisualProperty.view.getter();
}

uint64_t sub_9F60()
{
  return type metadata accessor for VisualProperty();
}

uint64_t sub_9F70()
{
  return Slider.identifier.getter();
}

uint64_t sub_9F80()
{
  return Slider.initialValue.getter();
}

uint64_t sub_9F90()
{
  return Slider.invocationPayload.getter();
}

uint64_t sub_9FA0()
{
  return Slider.step.getter();
}

uint64_t sub_9FB0()
{
  return Slider.maximum.getter();
}

uint64_t sub_9FC0()
{
  return Slider.minimum.getter();
}

uint64_t sub_9FD0()
{
  return type metadata accessor for Slider();
}

uint64_t sub_9FE0()
{
  return dispatch thunk of SetNumericIntentHandler.handle(intent:completion:)();
}

uint64_t sub_9FF0()
{
  return static SetNumericIntentHandler.shared.getter();
}

uint64_t sub_A000()
{
  return type metadata accessor for SetNumericIntentHandler();
}

uint64_t sub_A010()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_A030()
{
  return EnvironmentObject.init()();
}

uint64_t sub_A040()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_A050()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_A060()
{
  return View.ambientDrawable(renderWithDrawingGroup:)();
}

uint64_t sub_A070()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_A080()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_A090()
{
  return View.unredacted()();
}

uint64_t sub_A0A0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_A0B0()
{
  return View.privacySensitive(_:)();
}

uint64_t sub_A0C0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_A0D0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_A0E0()
{
  return State.projectedValue.getter();
}

uint64_t sub_A0F0()
{
  return Slider.init<A>(value:in:onEditingChanged:minimumValueLabel:maximumValueLabel:label:)();
}

uint64_t sub_A100()
{
  return Slider.init<A>(value:in:step:onEditingChanged:minimumValueLabel:maximumValueLabel:label:)();
}

uint64_t sub_A110()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_A120()
{
  return static Alignment.center.getter();
}

uint64_t sub_A130()
{
  return ComponentWithAction.init(action:marginPadding:chevronPadding:content:)();
}

uint64_t sub_A140()
{
  return Form.updateControl(_:state:)();
}

uint64_t sub_A150()
{
  return type metadata accessor for Form.State();
}

uint64_t sub_A160()
{
  return type metadata accessor for Form();
}

uint64_t sub_A170()
{
  return dispatch thunk of Context.currentIdiom.getter();
}

uint64_t sub_A180()
{
  return type metadata accessor for Context();
}

NSString sub_A190()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A1A0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_A1B0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_A1C0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_A1D0()
{
  return VRXIdiom.idiom.getter();
}

uint64_t sub_A1E0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_A1F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_A200()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A210()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_A220(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_A230()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_A240()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_A250()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_A260()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_A270(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_A280()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_A290()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A2A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_A2B0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_A2C0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_A2D0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_A2E0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_A2F0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_A300()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_A310()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_A320()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_A330()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A340()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_A350()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_A360()
{
  return Error._code.getter();
}

uint64_t sub_A370()
{
  return Error._domain.getter();
}

uint64_t sub_A380()
{
  return Error._userInfo.getter();
}

uint64_t sub_A390()
{
  return Hasher.init(_seed:)();
}

void sub_A3A0(Swift::UInt a1)
{
}

Swift::Int sub_A3B0()
{
  return Hasher._finalize()();
}

uint64_t sub_A3C0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_A3D0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}