uint64_t sub_2597DC218(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  int v26;
  char v27;
  uint8_t *v28;
  os_signpost_id_t v29;
  void (*v30)(void);
  void (*v31)(void, void);
  uint64_t v32;
  void (*v33)(void, void);
  uint64_t v34;
  uint64_t v35;
  void (*v36)(void *@<X8>);
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  float v52;
  float v53;
  id v54;
  id v55;
  unint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  char v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  os_signpost_type_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  os_signpost_id_t v81;
  uint64_t v82;
  void (*v83)(void);
  uint64_t result;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(void, void);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  void (*v99)(char *, char *, uint64_t);
  void (*v100)(char *, char *, uint64_t);

  v87 = sub_259843A00();
  OUTLINED_FUNCTION_87();
  v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_233();
  v7 = v6 - v5;
  v8 = sub_2598439B0();
  OUTLINED_FUNCTION_87();
  v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_268();
  v94 = v12;
  OUTLINED_FUNCTION_17();
  MEMORY[0x270FA5388](v13);
  v15 = (char *)&v85 - v14;
  MEMORY[0x270FA5388](v16);
  v18 = (char *)&v85 - v17;
  sub_2598439F0();
  OUTLINED_FUNCTION_87();
  v91 = v20;
  v92 = v19;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_233();
  v23 = v22 - v21;
  sub_2598439E0();
  v24 = a1;
  sub_2598439A0();
  v95 = v23;
  v25 = sub_2598439D0();
  v26 = sub_259844C80();
  v27 = sub_259844D80();
  v85 = v7;
  v86 = v3;
  if (v27)
  {
    v99 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    LODWORD(v98) = v26;
    v99(v15, v18, v8);
    v28 = (uint8_t *)OUTLINED_FUNCTION_54();
    *(_DWORD *)v28 = 134217984;
    v100 = (void (*)(char *, char *, uint64_t))objc_msgSend(v24, sel_count);
    sub_259844E10();

    v29 = sub_259843990();
    _os_signpost_emit_with_name_impl(&dword_25934C000, v25, (os_signpost_type_t)v98, v29, "AssetContainersByGeoHashForMapDisplay", "Count: %ld", v28, 0xCu);
    OUTLINED_FUNCTION_61_0();

    OUTLINED_FUNCTION_12();
    v30();
    v99(v15, v18, v8);
  }
  else
  {

    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v18, v8);
  }
  sub_259843A30();
  swift_allocObject();
  v93 = sub_259843A20();
  v33 = *(void (**)(void, void))(v10 + 8);
  v32 = v10 + 8;
  v31 = v33;
  v33(v18, v8);
  v34 = (uint64_t)objc_msgSend(v24, sel_count);
  if (v34 >= 1000) {
    v35 = 1000;
  }
  else {
    v35 = v34;
  }
  if (v35 < 0)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    result = sub_2598457D0();
    __break(1u);
    return result;
  }
  v88 = v31;
  v89 = v32;
  v90 = v8;
  if (v35)
  {
    v98 = self;
    v36 = 0;
    v37 = 0;
    v38 = (void (*)(char *, char *, uint64_t))MEMORY[0x263F8EE80];
    v96 = v35;
    v97 = v24;
    while (v35 != v37)
    {
      v39 = objc_msgSend(v24, sel_objectAtIndexedSubscript_, v37);
      objc_msgSend(v39, sel_locationCoordinate);
      v41 = v40;
      objc_msgSend(v39, sel_locationCoordinate);
      v42 = objc_msgSend(v98, sel_poiGeoHashWithGeoHashSize_latitude_longitude_, 6, v41);
      if (v42)
      {
        v43 = v42;
        v44 = sub_2598440A0();
        v46 = v45;

        v47 = objc_msgSend(v39, sel_iconicScoreProperties);
        if (!v47) {
          goto LABEL_40;
        }
        v48 = v47;
        objc_msgSend(v47, sel_iconicScore);
        v50 = v49;

        v51 = objc_msgSend(v39, sel_mediaAnalysisProperties);
        objc_msgSend(v51, sel_wallpaperScore);
        v53 = v52;

        v54 = v39;
        swift_bridgeObjectRetain_n();
        v55 = v54;
        sub_2593980F8((uint64_t)v36);
        swift_isUniquelyReferenced_nonNull_native();
        v100 = v38;
        v56 = sub_25939CE90();
        if (__OFADD__(*((void *)v38 + 2), (v57 & 1) == 0)) {
          goto LABEL_37;
        }
        v58 = v56;
        v59 = v57;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F83D0);
        if (sub_259845350())
        {
          v60 = sub_25939CE90();
          if ((v59 & 1) != (v61 & 1)) {
            goto LABEL_41;
          }
          v58 = v60;
        }
        v62 = v100;
        swift_bridgeObjectRelease();
        if ((v59 & 1) == 0)
        {
          *((void *)v62 + (v58 >> 6) + 8) |= 1 << v58;
          v63 = (uint64_t *)(*((void *)v62 + 6) + 16 * v58);
          *v63 = v44;
          v63[1] = v46;
          *(void *)(*((void *)v62 + 7) + 8 * v58) = MEMORY[0x263F8EE78];
          v64 = *((void *)v62 + 2);
          v65 = v64 + 1;
          v66 = __OFADD__(v64, 1);
          sub_259843F00();
          if (v66) {
            goto LABEL_38;
          }
          *((void *)v62 + 2) = v65;
        }
        sub_259843F00();
        v67 = *((void *)v62 + 7);
        v99 = v62;
        swift_bridgeObjectRelease();
        v68 = *(void *)(v67 + 8 * v58);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v67 + 8 * v58) = v68;
        v70 = v44;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_23_51();
          v68 = v74;
          *(void *)(v67 + 8 * v58) = v74;
        }
        v72 = *(void *)(v68 + 16);
        v71 = *(void *)(v68 + 24);
        if (v72 >= v71 >> 1)
        {
          OUTLINED_FUNCTION_45_1(v71);
          sub_259387938();
          v68 = v75;
          *(void *)(v67 + 8 * v58) = v75;
        }
        *(void *)(v68 + 16) = v72 + 1;
        v73 = v68 + 40 * v72;
        *(void *)(v73 + 32) = v55;
        *(void *)(v73 + 40) = v50;
        *(void *)(v73 + 48) = v70;
        *(void *)(v73 + 56) = v46;
        *(double *)(v73 + 64) = v53;
        swift_bridgeObjectRelease_n();

        v36 = sub_2593939F0;
        v35 = v96;
        v24 = v97;
        v38 = v99;
      }
      ++v37;

      if (v35 == v37) {
        goto LABEL_31;
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v36 = 0;
  v38 = (void (*)(char *, char *, uint64_t))MEMORY[0x263F8EE80];
LABEL_31:
  v76 = (void *)sub_2598439D0();
  sub_259843A10();
  v77 = sub_259844C70();
  if (sub_259844D80())
  {
    swift_retain();
    v78 = v85;
    sub_259843A40();
    swift_release();
    v80 = v86;
    v79 = v87;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v86 + 88))(v78, v87) != *MEMORY[0x263F90238]) {
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v78, v79);
    }
    *(_WORD *)OUTLINED_FUNCTION_41() = 0;
    v81 = sub_259843990();
    OUTLINED_FUNCTION_15_54(&dword_25934C000, v82, v77, v81, "AssetContainersByGeoHashForMapDisplay");
    OUTLINED_FUNCTION_61_0();
  }

  OUTLINED_FUNCTION_12();
  v83();
  (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v95, v92);
  swift_release();
  sub_2593980F8((uint64_t)v36);
  return (uint64_t)v38;
}

uint64_t sub_2597DC9AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    v2 = (double *)(sub_259843F00() + 64);
    uint64_t v3 = MEMORY[0x263F8EE78];
    uint64_t v4 = MEMORY[0x263F8EE78];
    do
    {
      double v5 = *(v2 - 3);
      double v6 = *v2;
      id v7 = *((id *)v2 - 4);
      sub_259843F00();
      if (sub_2597DCC54(v7))
      {
        id v8 = sub_2597DCD8C(v7);
        objc_msgSend(v8, sel_minimumMeaningfulIconicScore);
        double v10 = v9;

        if (v10 <= v5)
        {
          id v11 = v7;
          sub_259843F00();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_23_51();
            uint64_t v4 = v19;
          }
          unint64_t v13 = *(void *)(v4 + 16);
          unint64_t v12 = *(void *)(v4 + 24);
          if (v13 >= v12 >> 1)
          {
            OUTLINED_FUNCTION_16_48(v12);
            sub_259387938();
            uint64_t v4 = v20;
          }
          *(void *)(v4 + 16) = v13 + 1;
          OUTLINED_FUNCTION_26_44((void *)(v4 + 40 * v13));
        }
        sub_2597DCE54(v7);
        if (v14 > 0.0 && v14 <= v6)
        {
          id v16 = v7;
          sub_259843F00();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_230();
            sub_259387938();
            uint64_t v3 = v21;
          }
          unint64_t v18 = *(void *)(v3 + 16);
          unint64_t v17 = *(void *)(v3 + 24);
          if (v18 >= v17 >> 1)
          {
            OUTLINED_FUNCTION_16_48(v17);
            sub_259387938();
            uint64_t v3 = v22;
          }
          *(void *)(v3 + 16) = v18 + 1;
          OUTLINED_FUNCTION_26_44((void *)(v3 + 40 * v18));
        }
      }
      swift_bridgeObjectRelease();

      v2 += 5;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_2597DCF58();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (*(void *)(v3 + 16)) {
      uint64_t v23 = sub_2597DD118();
    }
    else {
      uint64_t v23 = MEMORY[0x263F8EE78];
    }
  }
  swift_bridgeObjectRelease();
  return v23;
}

id sub_2597DCC54(void *a1)
{
  id result = objc_msgSend(a1, sel_sceneAnalysisProperties);
  if (result)
  {
    uint64_t v3 = result;
    signed int v4 = objc_msgSend(result, sel_sceneAnalysisVersion);

    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5E0C8]), sel_initWithSceneAnalysisVersion_, v4);
    objc_msgSend(a1, sel_curationScore);
    if (*MEMORY[0x263F5DAF8] >= v6)
    {

      return 0;
    }
    else
    {
      id v7 = objc_msgSend(a1, sel_mediaAnalysisProperties);
      objc_msgSend(v7, sel_blurrinessScore);
      float v9 = v8;

      double v10 = v9;
      id v11 = objc_msgSend(v5, sel_sharpnessNode);

      objc_msgSend(v11, sel_highRecallOperatingPoint);
      double v13 = v12;

      return (id)(v13 <= v10);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2597DCD8C(void *a1)
{
  id result = objc_msgSend(a1, sel_sceneAnalysisProperties);
  if (result)
  {
    v2 = result;
    signed int v3 = objc_msgSend(result, sel_sceneAnalysisVersion);

    objc_msgSend(self, sel_baseSceneAnalysisVersionWithSceneAnalysisVersion_, v3);
    uint64_t v4 = sub_25976ED58();
    if (v4) {
      return (id)v4;
    }
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5E0B0]), sel_initWithSceneAnalysisVersion_, v3);
    sub_2593A131C();
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2597DCE54(void *a1)
{
  id v1 = objc_msgSend(a1, sel_sceneAnalysisProperties);
  if (v1)
  {
    v2 = v1;
    signed int v3 = objc_msgSend(v1, sel_sceneAnalysisVersion);

    objc_msgSend(self, sel_baseSceneAnalysisVersionWithSceneAnalysisVersion_, v3);
    uint64_t v4 = sub_25976ED58();
    if (v4)
    {
      id v5 = (id)v4;
    }
    else
    {
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5E108]), sel_initWithSceneAnalysisVersion_, v3);
      sub_2593A1344();
    }
    id v6 = objc_msgSend(v5, sel_minimumWallpaperScoreNode);
    objc_msgSend(v6, sel_operatingPoint);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2597DCF58()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C80);
  OUTLINED_FUNCTION_4_84();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_259876900;
  swift_getKeyPath();
  sub_2598424C0();
  swift_getKeyPath();
  sub_2598424C0();
  swift_getKeyPath();
  sub_2598424D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C90);
  sub_25936C308(&qword_26A391C98, &qword_26A391C88);
  sub_25936C308(&qword_26A391CA0, &qword_26A391C90);
  uint64_t v1 = sub_25936C308(&qword_26A391CA8, &qword_26A391C80);
  uint64_t v9 = OUTLINED_FUNCTION_11_69(v1, v2, v3, v4, v5, v6, v7, v8, v0);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2597DD118()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C80);
  OUTLINED_FUNCTION_4_84();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_259876910;
  swift_getKeyPath();
  sub_2598424C0();
  swift_getKeyPath();
  sub_2598424D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391C90);
  sub_25936C308(&qword_26A391C98, &qword_26A391C88);
  sub_25936C308(&qword_26A391CA0, &qword_26A391C90);
  uint64_t v1 = sub_25936C308(&qword_26A391CA8, &qword_26A391C80);
  uint64_t v9 = OUTLINED_FUNCTION_11_69(v1, v2, v3, v4, v5, v6, v7, v8, v0);
  swift_bridgeObjectRelease();
  return v9;
}

#error "2597DD2E0: call analysis failed (funcsize=104)"

uint64_t sub_2597DD450(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (double *)(a1 + 64);
    uint64_t v4 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      uint64_t v31 = v1;
      double v5 = *(v3 - 3);
      uint64_t v6 = *((void *)v3 - 1);
      uint64_t v30 = *((void *)v3 - 2);
      double v7 = *v3;
      id v8 = *((id *)v3 - 4);
      sub_259843F00();
      id v9 = sub_2597DCD8C(v8);
      id v10 = objc_msgSend(v9, sel_bucketForIconicScore_, v5);
      id v11 = v8;
      sub_259843F00();
      sub_2593980F8((uint64_t)v2);
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = sub_25939CF70((uint64_t)v10);
      if (__OFADD__(v4[2], (v13 & 1) == 0)) {
        break;
      }
      unint64_t v14 = v12;
      char v15 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A391CB0);
      if (sub_259845350())
      {
        uint64_t v16 = sub_25939CF70((uint64_t)v10);
        if ((v15 & 1) != (v17 & 1)) {
          goto LABEL_24;
        }
        unint64_t v14 = v16;
      }
      swift_bridgeObjectRelease();
      if (v15)
      {
        sub_259843F00();
      }
      else
      {
        v4[(v14 >> 6) + 8] |= 1 << v14;
        *(void *)(v4[6] + 8 * v14) = v10;
        *(void *)(v4[7] + 8 * v14) = MEMORY[0x263F8EE78];
        uint64_t v18 = v4[2];
        uint64_t v19 = v18 + 1;
        BOOL v20 = __OFADD__(v18, 1);
        sub_259843F00();
        if (v20) {
          goto LABEL_23;
        }
        v4[2] = v19;
      }
      uint64_t v21 = v4[7];
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void *)(v21 + 8 * v14);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v21 + 8 * v14) = v22;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        OUTLINED_FUNCTION_230();
        sub_259387938();
        uint64_t v22 = v27;
        *(void *)(v21 + 8 * v14) = v27;
      }
      unint64_t v25 = *(void *)(v22 + 16);
      unint64_t v24 = *(void *)(v22 + 24);
      if (v25 >= v24 >> 1)
      {
        OUTLINED_FUNCTION_16_48(v24);
        sub_259387938();
        uint64_t v22 = v28;
        *(void *)(v21 + 8 * v14) = v28;
      }
      *(void *)(v22 + 16) = v25 + 1;
      v26 = (double *)(v22 + 40 * v25);
      *((void *)v26 + 4) = v11;
      v26[5] = v5;
      *((void *)v26 + 6) = v30;
      *((void *)v26 + 7) = v6;
      v26[8] = v7;
      swift_bridgeObjectRelease();

      v3 += 5;
      uint64_t v2 = sub_2593939F0;
      uint64_t v1 = v31 - 1;
      if (v31 == 1) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    uint64_t result = sub_2598457D0();
    __break(1u);
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v4 = (void *)MEMORY[0x263F8EE80];
LABEL_21:
    sub_2593980F8((uint64_t)v2);
    return (uint64_t)v4;
  }
  return result;
}

id LocationCuration.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id LocationCuration.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationCuration();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LocationCuration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationCuration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocationCuration()
{
  return self;
}

char *keypath_get_selector_uuid()
{
  return sel_uuid;
}

void sub_2597DD7E4(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_259845710();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_2597DDDE4(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_124;
  }
  uint64_t v5 = v4;
  v91 = a1;
  uint64_t v92 = sub_2594F07BC(v3 / 2);
  v96 = v6;
  uint64_t v94 = v3;
  if (v3 <= 0)
  {
    id v9 = (void *)MEMORY[0x263F8EE78];
    unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_90:
    if (v31 < 2)
    {
LABEL_101:
      swift_bridgeObjectRelease();
      if (v94 >= -1)
      {
        *(void *)(v92 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_129;
    }
    uint64_t v82 = *v91;
    while (1)
    {
      unint64_t v83 = v31 - 2;
      if (v31 < 2) {
        break;
      }
      if (!v82) {
        goto LABEL_133;
      }
      uint64_t v84 = v9[2 * v83 + 4];
      uint64_t v85 = v9[2 * v31 + 3];
      sub_2597DDE50((char *)(v82 + 16 * v84), (char *)(v82 + 16 * v9[2 * v31 + 2]), v82 + 16 * v85, v96);
      if (v1) {
        goto LABEL_86;
      }
      if (v85 < v84) {
        goto LABEL_119;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2596F24C8();
        id v9 = v88;
      }
      if (v83 >= v9[2]) {
        goto LABEL_120;
      }
      v86 = &v9[2 * v83 + 4];
      void *v86 = v84;
      v86[1] = v85;
      unint64_t v87 = v9[2];
      if (v31 > v87) {
        goto LABEL_121;
      }
      memmove(&v9[2 * v31 + 2], &v9[2 * v31 + 4], 16 * (v87 - v31));
      v9[2] = v87 - 1;
      unint64_t v31 = v87 - 1;
      if (v87 <= 2) {
        goto LABEL_101;
      }
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v89 = *a1 - 16;
  uint64_t v90 = *a1 + 32;
  id v9 = (void *)MEMORY[0x263F8EE78];
  uint64_t v93 = v5;
  uint64_t v95 = *a1;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 < v3)
    {
      uint64_t v11 = *(void *)(v8 + 16 * v7);
      uint64_t v12 = 16 * v10;
      uint64_t v13 = *(void *)(v8 + 16 * v10);
      uint64_t v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        unint64_t v14 = (uint64_t *)(v90 + 16 * v10);
        uint64_t v15 = v11;
        while (1)
        {
          uint64_t v17 = *v14;
          v14 += 2;
          uint64_t v16 = v17;
          if (v13 < v11 == v15 >= v17) {
            break;
          }
          ++v7;
          uint64_t v15 = v16;
          if (v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v13 < v11)
      {
        if (v7 < v10) {
          goto LABEL_126;
        }
        if (v10 < v7)
        {
          uint64_t v18 = 16 * v7;
          uint64_t v19 = v7;
          uint64_t v20 = v10;
          do
          {
            if (v20 != --v19)
            {
              if (!v8) {
                goto LABEL_132;
              }
              uint64_t v21 = v8 + v18;
              uint64_t v22 = *(void *)(v8 + v12);
              uint64_t v23 = *(void *)(v8 + v12 + 8);
              *(_OWORD *)(v8 + v12) = *(_OWORD *)(v8 + v18 - 16);
              *(void *)(v21 - 16) = v22;
              *(void *)(v21 - 8) = v23;
            }
            ++v20;
            v18 -= 16;
            v12 += 16;
          }
          while (v20 < v19);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_123;
      }
      if (v7 - v10 < v5)
      {
        uint64_t v24 = v10 + v5;
        if (__OFADD__(v10, v5)) {
          goto LABEL_127;
        }
        if (v24 >= v3) {
          uint64_t v24 = v3;
        }
        if (v24 < v10) {
          goto LABEL_128;
        }
        if (v7 != v24)
        {
          uint64_t v25 = v89 + 16 * v7;
          do
          {
            uint64_t v26 = *(void *)(v8 + 16 * v7);
            uint64_t v27 = v10;
            uint64_t v28 = v25;
            do
            {
              if (*(void *)v28 >= v26) {
                break;
              }
              if (!v8) {
                goto LABEL_130;
              }
              uint64_t v29 = *(void *)(v28 + 24);
              *(_OWORD *)(v28 + 16) = *(_OWORD *)v28;
              *(void *)uint64_t v28 = v26;
              *(void *)(v28 + 8) = v29;
              v28 -= 16;
              ++v27;
            }
            while (v7 != v27);
            ++v7;
            v25 += 16;
          }
          while (v7 != v24);
          uint64_t v7 = v24;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_122;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2596F23F0();
      id v9 = v80;
    }
    unint64_t v30 = v9[2];
    unint64_t v31 = v30 + 1;
    uint64_t v8 = v95;
    if (v30 >= v9[3] >> 1)
    {
      sub_2596F23F0();
      uint64_t v8 = v95;
      id v9 = v81;
    }
    v9[2] = v31;
    v32 = v9 + 4;
    v33 = &v9[2 * v30 + 4];
    uint64_t *v33 = v10;
    v33[1] = v7;
    if (v30) {
      break;
    }
    unint64_t v31 = 1;
LABEL_81:
    uint64_t v5 = v93;
    uint64_t v3 = v94;
    if (v7 >= v94) {
      goto LABEL_90;
    }
  }
  while (1)
  {
    unint64_t v34 = v31 - 1;
    if (v31 >= 4)
    {
      v39 = &v32[2 * v31];
      uint64_t v40 = *(v39 - 8);
      uint64_t v41 = *(v39 - 7);
      BOOL v45 = __OFSUB__(v41, v40);
      uint64_t v42 = v41 - v40;
      if (v45) {
        goto LABEL_107;
      }
      uint64_t v44 = *(v39 - 6);
      uint64_t v43 = *(v39 - 5);
      BOOL v45 = __OFSUB__(v43, v44);
      uint64_t v37 = v43 - v44;
      char v38 = v45;
      if (v45) {
        goto LABEL_108;
      }
      unint64_t v46 = v31 - 2;
      v47 = &v32[2 * v31 - 4];
      uint64_t v49 = *v47;
      uint64_t v48 = v47[1];
      BOOL v45 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      if (v45) {
        goto LABEL_109;
      }
      BOOL v45 = __OFADD__(v37, v50);
      uint64_t v51 = v37 + v50;
      if (v45) {
        goto LABEL_111;
      }
      if (v51 >= v42)
      {
        v69 = &v32[2 * v34];
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v45 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v45) {
          goto LABEL_117;
        }
        BOOL v62 = v37 < v72;
        goto LABEL_70;
      }
    }
    else
    {
      if (v31 != 3)
      {
        uint64_t v63 = v9[4];
        uint64_t v64 = v9[5];
        BOOL v45 = __OFSUB__(v64, v63);
        uint64_t v56 = v64 - v63;
        char v57 = v45;
        goto LABEL_64;
      }
      uint64_t v36 = v9[4];
      uint64_t v35 = v9[5];
      BOOL v45 = __OFSUB__(v35, v36);
      uint64_t v37 = v35 - v36;
      char v38 = v45;
    }
    if (v38) {
      goto LABEL_110;
    }
    unint64_t v46 = v31 - 2;
    v52 = &v32[2 * v31 - 4];
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    BOOL v55 = __OFSUB__(v53, v54);
    uint64_t v56 = v53 - v54;
    char v57 = v55;
    if (v55) {
      goto LABEL_112;
    }
    v58 = &v32[2 * v34];
    uint64_t v60 = *v58;
    uint64_t v59 = v58[1];
    BOOL v45 = __OFSUB__(v59, v60);
    uint64_t v61 = v59 - v60;
    if (v45) {
      goto LABEL_114;
    }
    if (__OFADD__(v56, v61)) {
      goto LABEL_116;
    }
    if (v56 + v61 >= v37)
    {
      BOOL v62 = v37 < v61;
LABEL_70:
      if (v62) {
        unint64_t v34 = v46;
      }
      goto LABEL_72;
    }
LABEL_64:
    if (v57) {
      goto LABEL_113;
    }
    v65 = &v32[2 * v34];
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v45 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v45) {
      goto LABEL_115;
    }
    if (v68 < v56) {
      goto LABEL_81;
    }
LABEL_72:
    v73 = v9;
    unint64_t v74 = v34 - 1;
    if (v34 - 1 >= v31)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v8) {
      goto LABEL_131;
    }
    v75 = &v32[2 * v74];
    uint64_t v76 = *v75;
    v77 = &v32[2 * v34];
    uint64_t v78 = v77[1];
    sub_2597DDE50((char *)(v8 + 16 * *v75), (char *)(v8 + 16 * *v77), v8 + 16 * v78, v96);
    if (v1) {
      break;
    }
    if (v78 < v76) {
      goto LABEL_104;
    }
    if (v34 > v73[2]) {
      goto LABEL_105;
    }
    uint64_t *v75 = v76;
    v32[2 * v74 + 1] = v78;
    unint64_t v79 = v73[2];
    if (v34 >= v79) {
      goto LABEL_106;
    }
    id v9 = v73;
    unint64_t v31 = v79 - 1;
    memmove(&v32[2 * v34], v77 + 2, 16 * (v79 - 1 - v34));
    v73[2] = v79 - 1;
    uint64_t v8 = v95;
    if (v79 <= 2) {
      goto LABEL_81;
    }
  }
LABEL_86:
  swift_bridgeObjectRelease();
  if (v94 < -1) {
    goto LABEL_125;
  }
  *(void *)(v92 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_2597DDDE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 16 * a3 - 16;
    while (2)
    {
      uint64_t v6 = *(void *)(v4 + 16 * a3);
      uint64_t v7 = result;
      uint64_t v8 = v5;
      do
      {
        if (*(void *)v8 >= v6) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        uint64_t v9 = *(void *)(v8 + 24);
        *(_OWORD *)(v8 + 16) = *(_OWORD *)v8;
        *(void *)uint64_t v8 = v6;
        *(void *)(v8 + 8) = v9;
        v8 -= 16;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 16;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2597DDE50(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_2596ED91C(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    uint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_39;
    }
    uint64_t v18 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v19 = v18 + 16;
      uint64_t v20 = v6 - 16;
      if (*((void *)v6 - 2) >= *((void *)v12 - 2))
      {
        BOOL v22 = v19 != v12 || v18 >= v12;
        uint64_t v20 = v12 - 16;
        v12 -= 16;
        if (!v22) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v21 = v19 != v6 || v18 >= v6;
        v6 -= 16;
        if (!v21) {
          goto LABEL_35;
        }
      }
      *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
LABEL_35:
      v18 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_39;
      }
    }
  }
  sub_2596ED91C(a1, (a2 - a1) / 16, a4);
  uint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (*(void *)v4 >= *(void *)v6)
    {
      unint64_t v14 = v4;
      BOOL v15 = v7 == v4;
      v4 += 16;
      if (!v15) {
        goto LABEL_11;
      }
LABEL_12:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_17;
      }
    }
    unint64_t v14 = v6;
    BOOL v15 = v7 == v6;
    v6 += 16;
    if (v15) {
      goto LABEL_12;
    }
LABEL_11:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v14;
    goto LABEL_12;
  }
LABEL_17:
  uint64_t v6 = v7;
LABEL_39:
  sub_2596ED91C(v4, (v12 - v4) / 16, v6);
  return 1;
}

uint64_t destroy for AssetContainer(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AssetContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  id v5 = v3;
  sub_259843F00();
  return a1;
}

uint64_t assignWithCopy for AssetContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_259843F00();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for AssetContainer(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v5 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  return a1;
}

ValueMetadata *type metadata accessor for AssetContainer()
{
  return &type metadata for AssetContainer;
}

void OUTLINED_FUNCTION_23_51()
{
  sub_259387938();
}

void OUTLINED_FUNCTION_26_44(void *a1@<X8>)
{
  a1[4] = v3;
  a1[5] = v4;
  a1[6] = v1;
  a1[7] = v2;
  a1[8] = v5;
}

void OUTLINED_FUNCTION_29_33()
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 40 * v1 + 32) = v0;
}

uint64_t sub_2597DE198(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      unint64_t v17 = v2 & 0xC000000000000001;
      uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8;
      while (v17)
      {
        id v6 = (id)MEMORY[0x25A2DFA20](v4, v2);
LABEL_7:
        uint64_t v7 = v6;
        unint64_t v8 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        unint64_t v9 = v2;
        id v10 = objc_msgSend(v6, sel_localIdentifier);
        uint64_t v11 = sub_2598440A0();
        uint64_t v13 = v12;

        sub_25973CE24(v11, v13, a2);
        LOBYTE(v10) = v14;
        swift_bridgeObjectRelease();
        if (v10)
        {
          sub_259845240();
          sub_259845280();
          sub_259845290();
          sub_259845250();
        }
        else
        {
        }
        unint64_t v2 = v9;
        ++v4;
        if (v8 == v3)
        {
          uint64_t v15 = v19;
          goto LABEL_18;
        }
      }
      if (v4 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = sub_259845460();
      if (!v3) {
        goto LABEL_17;
      }
    }
    id v6 = *(id *)(v2 + 8 * v4 + 32);
    goto LABEL_7;
  }
LABEL_17:
  uint64_t v15 = MEMORY[0x263F8EE78];
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

PhotosIntelligence::AssetCaptionDataSource __swiftcall AssetCaptionDataSource.init(with:)(PhotosIntelligence::AssetCaptionDataSource with)
{
  v1->photoLibrary.super.isa = with.photoLibrary.super.isa;
  return with;
}

uint64_t AssetCaptionDataSource.captions(for:eventRecorder:progressReporter:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_2597DE36C, 0, 0);
}

uint64_t sub_2597DE36C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = objc_msgSend(*(id *)(v0 + 40), sel_librarySpecificFetchOptions);
  *(void *)(v0 + 48) = v2;
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = sub_2593A2960(v1, (uint64_t)v2, v3);
  *(void *)(v0 + 56) = v5;

  if (v5)
  {
    id v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v6;
    *id v6 = v0;
    v6[1] = sub_2597DE4D4;
    return sub_2597DE758();
  }
  else
  {
    sub_2597E1234();
    swift_allocError();
    swift_willThrow();

    unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_2597DE4D4(uint64_t a1)
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *id v6 = v5;
  uint64_t v7 = *v2;
  OUTLINED_FUNCTION_9();
  *unint64_t v8 = v7;
  *(void *)(v5 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v9 = sub_2597DE638;
  }
  else
  {
    *(void *)(v5 + 80) = a1;
    uint64_t v9 = sub_2597DE5D0;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_2597DE5D0()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = *(void **)(v0 + 56);

  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 80);
  return v2(v3);
}

uint64_t sub_2597DE638()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = *(void **)(v0 + 56);

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void static AssetCaptionDataSource.captionsForAssetsEvent.getter()
{
}

void static AssetCaptionDataSource.stillDescriptionsEvent.getter()
{
}

void static AssetCaptionDataSource.movieDescriptionsEvent.getter()
{
}

const char *static AssetCaptionDataSource.chooseCaptionsEvent.getter()
{
  return "AssetCaptionDataSource.chooseCaptions";
}

uint64_t sub_2597DE6D4()
{
  uint64_t v0 = sub_259843A80();
  __swift_allocate_value_buffer(v0, qword_26A391CB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A391CB8);
  return sub_259843A60();
}

uint64_t sub_2597DE758()
{
  OUTLINED_FUNCTION_14();
  v0[23] = v1;
  v0[24] = v2;
  v0[22] = v3;
  type metadata accessor for RootEventRecorder.EventState(0);
  v0[25] = swift_task_alloc();
  v0[26] = swift_task_alloc();
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2597DE810, 0, 0);
}

uint64_t sub_2597DE810()
{
  uint64_t v2 = (void *)v0[23];
  uint64_t v1 = (void *)v0[24];
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  (*(void (**)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 24))("AssetCaptionDataSource.captionsForAssets", 40, 2, v3, v4);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_2598435C0();
  uint64_t v5 = (uint64_t)(v0 + 2);
  id v6 = (void *)v0[22];
  uint64_t v8 = v2[3];
  uint64_t v7 = v2[4];
  __swift_project_boxed_opaque_existential_1((void *)v0[23], v8);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v7 + 16))(0x736E6F6974706143, 0xE800000000000000, v8, v7);
  id v9 = objc_msgSend(v6, sel_fetchedObjects);
  v0[29] = v9;
  if (!v9)
  {
    if (qword_26A388C30 == -1) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
  v0[30] = sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
  unint64_t v10 = sub_259844500();
  uint64_t v5 = v10;
  v0[31] = v10;
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (v10 >> 62)
  {
    sub_259843F00();
    uint64_t v11 = sub_259845460();
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_259843F00();
  }
  v0[32] = v11;
  if (!v11)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x263F8EE78];
    goto LABEL_22;
  }
  if (v11 < 1)
  {
    __break(1u);
LABEL_27:
    swift_once();
LABEL_16:
    uint64_t v16 = sub_259843A80();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A391CB8);
    unint64_t v17 = sub_259843A50();
    os_log_type_t v18 = sub_259844B50();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25934C000, v17, v18, "Unable to fetch asset captions for assets due to fetch error.", v19, 2u);
      OUTLINED_FUNCTION_61_0();
    }

    sub_259843EE0();
    __swift_destroy_boxed_opaque_existential_1(v5);
    uint64_t v20 = v0[28];
    __swift_project_boxed_opaque_existential_1((void *)v0[23], *(void *)(v0[23] + 24));
    OUTLINED_FUNCTION_41_0();
    v21();
    sub_259445924(v20);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_126();
    __asm { BRAA            X2, X16 }
  }
  for (uint64_t i = 0; i != v11; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x25A2DFA20](i, v5);
    }
    else {
      id v13 = *(id *)(v5 + 8 * i + 32);
    }
    char v14 = v13;
    if ((objc_msgSend(v13, sel_mediaSubtypes) & 8) != 0)
    {
      sub_259845240();
      sub_259845280();
      sub_259845290();
      sub_259845250();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = v30;
LABEL_22:
  v0[33] = v15;
  __swift_project_boxed_opaque_existential_1((void *)v0[24], v1[3]);
  sub_259843580();
  v0[34] = type metadata accessor for AssetCaptionGenerator();
  uint64_t v24 = (void *)swift_task_alloc();
  v0[35] = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_2597DED20;
  OUTLINED_FUNCTION_126();
  return static AssetCaptionGenerator.localIdentifiersPreferringVideoCaption(for:eventRecorder:progressReporter:)(v25, v26, v27);
}

uint64_t sub_2597DED20(uint64_t a1)
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *id v6 = v5;
  uint64_t v7 = *v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v8 = v7;
  *(void *)(v5 + 288) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v9 = sub_2597E0258;
  }
  else
  {
    *(void *)(v5 + 296) = a1;
    id v9 = sub_2597DEE1C;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_2597DEE1C()
{
  uint64_t v148 = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v7 = *(void *)(v0 + 256);
  unint64_t v6 = *(void *)(v0 + 264);
  sub_259843F00();
  uint64_t v143 = v4;
  sub_2597DE198(v6, v4);
  uint64_t v8 = MEMORY[0x263F8EE78];
  v147 = (void *)MEMORY[0x263F8EE78];
  if (v7)
  {
    if (*(uint64_t *)(v0 + 256) < 1) {
      goto LABEL_93;
    }
    uint64_t v9 = *(void *)(v0 + 248);
    unint64_t v10 = v9 & 0xC000000000000001;
    uint64_t v11 = v9 + 32;
    sub_259843F00();
    uint64_t v12 = 0;
    do
    {
      if (v10) {
        id v13 = (uint64_t *)MEMORY[0x25A2DFA20](v12, *(void *)(v0 + 248));
      }
      else {
        id v13 = (uint64_t *)*(id *)(v11 + 8 * v12);
      }
      unint64_t v1 = (unint64_t)v13;
      if (objc_msgSend(v13, sel_isVideo))
      {
        sub_259845240();
        sub_259845280();
        sub_259845290();
        sub_259845250();
      }
      else
      {
      }
      ++v12;
    }
    while (v12 != *(void *)(v0 + 256));
    swift_bridgeObjectRelease();
    uint64_t v8 = (uint64_t)v147;
  }
  char v14 = *(void **)(v0 + 232);
  OUTLINED_FUNCTION_41_37(v8);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_17_47();
  v15();
  v144 = self;
  id v16 = objc_msgSend(v144, sel_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets_, 1, v14);

  sub_25935633C(0, &qword_26A38B0E8);
  uint64_t v3 = sub_259843EB0();

  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  OUTLINED_FUNCTION_41_0();
  v17();
  __swift_project_boxed_opaque_existential_1((void *)v1, *(void *)(v1 + 24));
  sub_2598435D0();
  if (v5)
  {
    uint64_t v18 = *(void *)(v0 + 216);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_259445924(v18);
    swift_bridgeObjectRelease();
    uint64_t v19 = OUTLINED_FUNCTION_6_76();
    goto LABEL_62;
  }
  uint64_t v140 = v3;
  OUTLINED_FUNCTION_9_65();
  OUTLINED_FUNCTION_13_61();
  v21();
  sub_259843F00();
  BOOL v22 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v144, sel_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets_, 2, v22);

  uint64_t v24 = sub_259843EB0();
  __swift_project_boxed_opaque_existential_1((void *)v3, *(void *)(v0 + 40));
  OUTLINED_FUNCTION_41_0();
  v25();
  __swift_project_boxed_opaque_existential_1(0, MEMORY[0x18]);
  OUTLINED_FUNCTION_13_2();
  uint64_t v142 = v24;
  unint64_t v1 = v0 + 136;
  uint64_t v26 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)v3, *(void *)(v0 + 40));
  OUTLINED_FUNCTION_11_70();
  v27();
  *(void *)(v0 + 136) = MEMORY[0x263F8EE78];
  uint64_t v28 = v3;
  v139 = (void *)(v0 + 136);
  if (!v26)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
LABEL_59:
    *(void *)(v0 + 304) = v2;
    uint64_t v5 = *(void *)(v0 + 192);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v1 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)v3, *(void *)(v0 + 40));
    OUTLINED_FUNCTION_41_0();
    v94();
    uint64_t v7 = *(void *)(v5 + 32);
    __swift_project_boxed_opaque_existential_1((void *)v5, *(void *)(v5 + 24));
    OUTLINED_FUNCTION_13_2();
    if (v5)
    {
      uint64_t v95 = *(void *)(v0 + 216);
      uint64_t v97 = *(void *)(v0 + 200);
      uint64_t v96 = *(void *)(v0 + 208);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_259445924(v97);
      sub_259445924(v96);
      sub_259445924(v95);
      swift_bridgeObjectRelease();
LABEL_61:
      uint64_t v19 = OUTLINED_FUNCTION_8_75(v3);
LABEL_62:
      v20(v19);
      OUTLINED_FUNCTION_25_48();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_15_1();
      OUTLINED_FUNCTION_15_10();
      __asm { BRAA            X1, X16 }
    }
    if (!(*v139 >> 62))
    {
      uint64_t v100 = *(void *)((*v139 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_67;
    }
LABEL_97:
    OUTLINED_FUNCTION_71_1();
    uint64_t v100 = sub_259845460();
    swift_bridgeObjectRelease();
LABEL_67:
    if (v100 < 1)
    {
      OUTLINED_FUNCTION_34_37();
      sub_259445924(v7);
      sub_259445924(v5);
      sub_259445924(v100);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (objc_msgSend(self, sel_enableOnDemandCaptionGeneration))
      {
        if (qword_26A388C30 != -1) {
          swift_once();
        }
        uint64_t v101 = sub_259843A80();
        __swift_project_value_buffer(v101, (uint64_t)qword_26A391CB8);
        v102 = (void *)sub_259843A50();
        os_log_type_t v103 = sub_259844B70();
        if (OUTLINED_FUNCTION_52(v103))
        {
          v104 = (float *)OUTLINED_FUNCTION_40_38();
          OUTLINED_FUNCTION_20_55(v104, 3.852e-34);
          OUTLINED_FUNCTION_13_0(&dword_25934C000, v105, v106, "Requesting on demand captions for %ld assets.");
          OUTLINED_FUNCTION_61_0();
        }

        OUTLINED_FUNCTION_10_59();
        *(void *)(v0 + 312) = *(void *)(v0 + 136);
        sub_259843F00();
        v107 = (void *)swift_task_alloc();
        *(void *)(v0 + 320) = v107;
        void *v107 = v0;
        v107[1] = sub_2597DFC5C;
        OUTLINED_FUNCTION_15_10();
        return static AssetCaptionGenerator.assetCaptionByLocalIdentifier(for:eventRecorder:progressReporter:)(v108, v109, v110);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26A388C30 != -1) {
        swift_once();
      }
      v113 = *(void **)(v0 + 176);
      uint64_t v114 = sub_259843A80();
      __swift_project_value_buffer(v114, (uint64_t)qword_26A391CB8);
      id v115 = v113;
      v116 = (void *)sub_259843A50();
      os_log_type_t v117 = sub_259844B50();
      BOOL v118 = OUTLINED_FUNCTION_52(v117);
      v119 = *(void **)(v0 + 176);
      if (v118)
      {
        uint64_t v120 = OUTLINED_FUNCTION_32_40();
        OUTLINED_FUNCTION_15_55((float *)v120, 3.8521e-34);
        *(_WORD *)(v120 + 12) = 2048;
        uint64_t v100 = v120 + 14;
        void *v2 = objc_msgSend(v119, sel_count);
        sub_259844E10();

        OUTLINED_FUNCTION_154_3(&dword_25934C000, v121, v122, "%ld / %ld assets are missing captions!");
        OUTLINED_FUNCTION_61_0();
      }
      else
      {
      }
      OUTLINED_FUNCTION_19_47();
      if (v113)
      {
        OUTLINED_FUNCTION_33_37();
        sub_259445924(v1);
        sub_259445924((uint64_t)v119);
        sub_259445924(v100);
        goto LABEL_61;
      }
      uint64_t v123 = *(void *)(v0 + 208);
      uint64_t v124 = *(void *)(v0 + 216);
      sub_259445924(*(void *)(v0 + 200));
      sub_259445924(v123);
      sub_259445924(v124);
    }
    __swift_destroy_boxed_opaque_existential_1(v3);
    uint64_t v125 = *(void *)(v0 + 224);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 184), *(void *)(*(void *)(v0 + 184) + 24));
    OUTLINED_FUNCTION_41_0();
    v126();
    sub_259445924(v125);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_37_31();
    OUTLINED_FUNCTION_15_10();
    __asm { BRAA            X2, X16 }
  }
  OUTLINED_FUNCTION_18_41();
  uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  uint64_t v130 = MEMORY[0x263F8EE58] + 8;
  uint64_t v138 = v3;
  uint64_t v7 = v142;
  while (1)
  {
    if (v141) {
      id v29 = (id)MEMORY[0x25A2DFA20](v5, *(void *)(v0 + 248));
    }
    else {
      id v29 = *(id *)(v131 + 8 * v5);
    }
    uint64_t v30 = v29;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
      goto LABEL_97;
    }
    id v31 = objc_msgSend(v29, sel_localIdentifier);
    uint64_t v145 = sub_2598440A0();
    uint64_t v33 = v32;

    if (*(void *)(v7 + 16)) {
      break;
    }
LABEL_30:
    if (!*(void *)(v28 + 16) || (unint64_t v51 = sub_25939CE90(), (v52 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      id v65 = v30;
      MEMORY[0x25A2DED30]();
      unint64_t v66 = *(void *)((*(void *)v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(void *)((*(void *)v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v66 >> 1)
      {
        OUTLINED_FUNCTION_31_36(v66);
        sub_259844560();
      }
      sub_2598445B0();
      sub_259844530();

      uint64_t v7 = v142;
LABEL_55:
      uint64_t v93 = v5 + 1;
      goto LABEL_56;
    }
    id v53 = *(id *)(*(void *)(v28 + 56) + 8 * v51);
    swift_bridgeObjectRelease();
    id v137 = v30;
    uint64_t result = sub_2593A2A4C(v137);
    if (!v54) {
      goto LABEL_99;
    }
    unint64_t v1 = (unint64_t)v54;
    v135 = v53;
    id v55 = objc_msgSend(v53, sel_descriptionText);
    uint64_t v56 = sub_2598440A0();
    uint64_t v146 = v57;

    swift_isUniquelyReferenced_nonNull_native();
    v147 = v2;
    OUTLINED_FUNCTION_14_56();
    OUTLINED_FUNCTION_31_2();
    if (v60) {
      goto LABEL_94;
    }
    uint64_t v3 = v58;
    uint64_t v7 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389B38);
    char v61 = sub_259845350();
    uint64_t v2 = v147;
    if (v61)
    {
      unint64_t v62 = OUTLINED_FUNCTION_14_56();
      if ((v7 & 1) != (v63 & 1))
      {
LABEL_76:
        OUTLINED_FUNCTION_15_10();
        return sub_2598457D0();
      }
      uint64_t v3 = v62;
    }
    if (v7)
    {
      uint64_t v64 = (uint64_t *)(v2[7] + 16 * v3);
      swift_bridgeObjectRelease();
      *uint64_t v64 = v56;
      v64[1] = v146;
    }
    else
    {
      OUTLINED_FUNCTION_2_84();
      if (v60) {
        goto LABEL_96;
      }
      v2[2] = v92;
      sub_259843F00();
    }
    uint64_t v3 = v138;
    uint64_t v28 = v140;
    uint64_t v7 = v142;
    uint64_t v93 = v5 + 1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    unint64_t v1 = v0 + 136;
LABEL_56:
    ++v5;
    if (v93 == *(void *)(v0 + 256))
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  sub_259843F00();
  unint64_t v34 = sub_25939CE90();
  if ((v35 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  id v36 = *(id *)(*(void *)(v7 + 56) + 8 * v34);
  swift_bridgeObjectRelease();
  id v133 = v30;
  uint64_t result = sub_2593A2A4C(v133);
  if (v38)
  {
    uint64_t v3 = result;
    uint64_t v39 = v38;
    v132 = v36;
    uint64_t v40 = objc_msgSend(v36, sel_descriptionText);
    uint64_t v134 = sub_2598440A0();
    uint64_t v136 = v41;

    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v42 = OUTLINED_FUNCTION_23_52();
    uint64_t v44 = v40[2];
    BOOL v45 = (v43 & 1) == 0;
    uint64_t v7 = v44 + v45;
    if (__OFADD__(v44, v45)) {
      goto LABEL_92;
    }
    unint64_t v1 = v42;
    char v46 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389B38);
    char v47 = sub_259845350();
    uint64_t v2 = v147;
    if (v47)
    {
      unint64_t v48 = sub_25939CE90();
      if ((v46 & 1) != (v49 & 1)) {
        goto LABEL_76;
      }
      unint64_t v1 = v48;
    }
    if (v46)
    {
      uint64_t v50 = (uint64_t *)(v2[7] + 16 * v1);
      swift_bridgeObjectRelease();
      *uint64_t v50 = v134;
      v50[1] = v136;
      uint64_t v7 = v142;
    }
    else
    {
      OUTLINED_FUNCTION_30_35((uint64_t)&v2[v1 >> 6]);
      uint64_t v68 = (uint64_t *)(v67 + 16 * v1);
      *uint64_t v68 = v3;
      v68[1] = v39;
      v69 = (uint64_t *)(v2[7] + 16 * v1);
      uint64_t *v69 = v134;
      v69[1] = v136;
      uint64_t v70 = v2[2];
      BOOL v60 = __OFADD__(v70, 1);
      uint64_t v71 = v70 + 1;
      uint64_t v7 = v142;
      if (v60) {
        goto LABEL_95;
      }
      v2[2] = v71;
      sub_259843F00();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25973CE24(v145, v33, v143);
    char v73 = v72;
    swift_bridgeObjectRelease();
    uint64_t v3 = v138;
    unint64_t v1 = v0 + 136;
    uint64_t v28 = v140;
    if (v73)
    {
      if (qword_26A388C30 != -1) {
        swift_once();
      }
      uint64_t v74 = sub_259843A80();
      __swift_project_value_buffer(v74, (uint64_t)qword_26A391CB8);
      id v75 = v132;
      uint64_t v76 = sub_259843A50();
      os_log_type_t v77 = sub_259844B40();
      if (os_log_type_enabled(v76, v77))
      {
        uint64_t v78 = swift_slowAlloc();
        uint64_t v79 = swift_slowAlloc();
        id v88 = objc_msgSend(v75, sel_descriptionText, OUTLINED_FUNCTION_39_37(v79, v80, v81, v82, v83, v84, v85, v86, v129, v130, v87).n128_f64[0]);
        uint64_t v89 = sub_2598440A0();
        unint64_t v91 = v90;

        uint64_t v28 = v140;
        *(void *)(v78 + 4) = sub_259356D5C(v89, v91, (uint64_t *)&v147);
        uint64_t v3 = v138;
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_25934C000, v76, v77, "Video caption preferred for LP. Using: %s.", (uint8_t *)v78, 0xCu);
        swift_arrayDestroy();
        uint64_t v2 = (void *)v145;
        OUTLINED_FUNCTION_61_0();
        uint64_t v7 = v142;
        OUTLINED_FUNCTION_61_0();
      }
      else
      {
      }
      unint64_t v1 = v0 + 136;
    }
    else
    {
    }
    goto LABEL_55;
  }
  __break(1u);
LABEL_99:
  __break(1u);
  return result;
}

uint64_t sub_2597DFC5C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 328) = v5;
  *(void *)(v3 + 336) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v6 = sub_2597E1130;
  }
  else
  {
    unint64_t v6 = sub_2597DFD6C;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

void sub_2597DFD6C()
{
  uint64_t v1 = v0;
  int64_t v2 = 0;
  uint64_t v53 = v0 + 16;
  uint64_t v54 = v0 + 96;
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v55 = v3 + 64;
  uint64_t v57 = v3;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v57 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & v4;
  int64_t v56 = (unint64_t)(63 - v6) >> 6;
  uint64_t v8 = *(void **)(v0 + 304);
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v58 = (v7 - 1) & v7;
  int64_t v59 = v2;
  for (unint64_t i = __clz(__rbit64(v7)) | (v2 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v12 << 6))
  {
    uint64_t v14 = v1;
    uint64_t v15 = (uint64_t *)(*(void *)(v57 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v57 + 56) + 16 * i);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_259843F00();
    sub_259843F00();
    uint64_t v22 = sub_2595C7FF4(v17, v16, ObjCClassFromMetadata);
    if (!v23) {
      goto LABEL_45;
    }
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = sub_25939CE90();
    if (__OFADD__(v8[2], (v27 & 1) == 0))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    unint64_t v28 = v26;
    char v29 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389B38);
    if (sub_259845350()) {
      break;
    }
LABEL_25:
    if (v29)
    {
      uint64_t v32 = (void *)(v8[7] + 16 * v28);
      swift_bridgeObjectRelease();
      void *v32 = v19;
      v32[1] = v20;
    }
    else
    {
      v8[(v28 >> 6) + 8] |= 1 << v28;
      uint64_t v33 = (uint64_t *)(v8[6] + 16 * v28);
      uint64_t *v33 = v24;
      v33[1] = v25;
      unint64_t v34 = (void *)(v8[7] + 16 * v28);
      *unint64_t v34 = v19;
      v34[1] = v20;
      uint64_t v35 = v8[2];
      BOOL v36 = __OFADD__(v35, 1);
      uint64_t v37 = v35 + 1;
      if (v36) {
        goto LABEL_42;
      }
      v8[2] = v37;
      sub_259843F00();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v1 = v14;
    unint64_t v7 = v58;
    int64_t v2 = v59;
    if (v58) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      goto LABEL_43;
    }
    if (v10 >= v56)
    {
LABEL_31:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v54);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = *(void *)(v1 + 336);
      __swift_project_boxed_opaque_existential_1(*(void **)(v1 + 192), *(void *)(*(void *)(v1 + 192) + 24));
      sub_2598435E0();
      if (v38)
      {
        uint64_t v39 = *(void *)(v1 + 216);
        uint64_t v41 = *(void *)(v1 + 200);
        uint64_t v40 = *(void *)(v1 + 208);
        unint64_t v42 = *(void **)(v1 + 184);
        swift_bridgeObjectRelease();
        sub_259445924(v41);
        sub_259445924(v40);
        sub_259445924(v39);
        __swift_destroy_boxed_opaque_existential_1(v53);
        __swift_project_boxed_opaque_existential_1(v42, v42[3]);
        OUTLINED_FUNCTION_41_0();
        v43();
        sub_259445924(*(void *)(v1 + 224));
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_205();
        __asm { BRAA            X1, X16 }
      }
      uint64_t v47 = *(void *)(v1 + 208);
      uint64_t v48 = *(void *)(v1 + 216);
      sub_259445924(*(void *)(v1 + 200));
      sub_259445924(v47);
      sub_259445924(v48);
      __swift_destroy_boxed_opaque_existential_1(v53);
      uint64_t v49 = *(void *)(v1 + 224);
      __swift_project_boxed_opaque_existential_1(*(void **)(v1 + 184), *(void *)(*(void *)(v1 + 184) + 24));
      OUTLINED_FUNCTION_41_0();
      v50();
      sub_259445924(v49);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_205();
      __asm { BRAA            X2, X16 }
    }
    unint64_t v11 = *(void *)(v55 + 8 * v10);
    int64_t v12 = v2 + 1;
    if (!v11)
    {
      int64_t v12 = v2 + 2;
      if (v2 + 2 >= v56) {
        goto LABEL_31;
      }
      unint64_t v11 = *(void *)(v55 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v2 + 3;
        if (v2 + 3 >= v56) {
          goto LABEL_31;
        }
        unint64_t v11 = *(void *)(v55 + 8 * v12);
        if (!v11)
        {
          uint64_t v13 = v2 + 4;
          if (v2 + 4 >= v56) {
            goto LABEL_31;
          }
          unint64_t v11 = *(void *)(v55 + 8 * v13);
          if (!v11)
          {
            while (1)
            {
              int64_t v12 = v13 + 1;
              if (__OFADD__(v13, 1)) {
                break;
              }
              if (v12 >= v56) {
                goto LABEL_31;
              }
              unint64_t v11 = *(void *)(v55 + 8 * v12);
              ++v13;
              if (v11) {
                goto LABEL_18;
              }
            }
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
            return;
          }
          int64_t v12 = v2 + 4;
        }
      }
    }
LABEL_18:
    uint64_t v58 = (v11 - 1) & v11;
    int64_t v59 = v12;
  }
  sub_25939CE90();
  OUTLINED_FUNCTION_125();
  if (v31)
  {
    unint64_t v28 = v30;
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_205();
  sub_2598457D0();
}

uint64_t sub_2597E0258()
{
  uint64_t v148 = v1;
  __swift_destroy_boxed_opaque_existential_1(v1 + 56);
  if (qword_26A388C30 != -1) {
    goto LABEL_95;
  }
  while (1)
  {
    uint64_t v140 = sub_259843A80();
    __swift_project_value_buffer(v140, (uint64_t)qword_26A391CB8);
    uint64_t v5 = sub_259843A50();
    os_log_type_t v6 = sub_259844B30();
    BOOL v7 = OUTLINED_FUNCTION_52(v6);
    uint64_t v8 = *(void **)(v1 + 288);
    if (v7)
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25934C000, v5, (os_log_type_t)v0, "No preferred video captions from live photos.", v9, 2u);
      OUTLINED_FUNCTION_61_0();
    }

    uint64_t isUniquelyReferenced_nonNull_native = *(void *)(v1 + 256);
    unint64_t v10 = *(void *)(v1 + 264);
    uint64_t v12 = MEMORY[0x263F8EE88];
    sub_259843F00();
    uint64_t v0 = 0;
    sub_2597DE198(v10, v12);
    uint64_t v13 = MEMORY[0x263F8EE78];
    v147 = (void *)MEMORY[0x263F8EE78];
    if (isUniquelyReferenced_nonNull_native)
    {
      if (*(uint64_t *)(v1 + 256) < 1)
      {
LABEL_97:
        __break(1u);
LABEL_98:
        __break(1u);
LABEL_99:
        __break(1u);
LABEL_100:
        __break(1u);
        goto LABEL_101;
      }
      uint64_t v14 = *(void *)(v1 + 248);
      unint64_t v15 = v14 & 0xC000000000000001;
      uint64_t v16 = v14 + 32;
      sub_259843F00();
      uint64_t v17 = 0;
      do
      {
        if (v15) {
          uint64_t v18 = (uint64_t *)MEMORY[0x25A2DFA20](v17, *(void *)(v1 + 248));
        }
        else {
          uint64_t v18 = (uint64_t *)*(id *)(v16 + 8 * v17);
        }
        int64_t v2 = v18;
        if (objc_msgSend(v18, sel_isVideo))
        {
          sub_259845240();
          sub_259845280();
          sub_259845290();
          sub_259845250();
        }
        else
        {
        }
        ++v17;
      }
      while (v17 != *(void *)(v1 + 256));
      swift_bridgeObjectRelease();
      uint64_t v13 = (uint64_t)v147;
    }
    uint64_t v19 = *(void **)(v1 + 232);
    OUTLINED_FUNCTION_41_37(v13);
    __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
    OUTLINED_FUNCTION_17_47();
    v20();
    v144 = self;
    id v21 = objc_msgSend(v144, sel_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets_, 1, v19);

    sub_25935633C(0, &qword_26A38B0E8);
    uint64_t v143 = sub_259843EB0();

    __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
    OUTLINED_FUNCTION_41_0();
    v22();
    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    sub_2598435D0();
    OUTLINED_FUNCTION_9_65();
    OUTLINED_FUNCTION_13_61();
    v23();
    sub_259843F00();
    uint64_t v24 = (void *)sub_2598444E0();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(v144, sel_fetchGeneratedAssetDescriptionsGroupedByAssetLocalIdentifierWithType_forAssets_, 2, v24);

    uint64_t v26 = sub_259843EB0();
    __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
    OUTLINED_FUNCTION_41_0();
    v27();
    __swift_project_boxed_opaque_existential_1(0, MEMORY[0x18]);
    OUTLINED_FUNCTION_13_2();
    uint64_t v4 = (void *)(v1 + 16);
    uint64_t v142 = v26;
    unint64_t v28 = (void *)(v1 + 136);
    uint64_t v29 = *(void *)(v1 + 256);
    uint64_t v0 = *(void *)(v1 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
    OUTLINED_FUNCTION_11_70();
    v30();
    *(void *)(v1 + 136) = MEMORY[0x263F8EE78];
    uint64_t v31 = v143;
    if (!v29)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = (void *)MEMORY[0x263F8EE80];
LABEL_63:
      *(void *)(v1 + 304) = v3;
      uint64_t v0 = *(void *)(v1 + 192);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v2 = *(uint64_t **)(v1 + 48);
      __swift_project_boxed_opaque_existential_1(v4, *(void *)(v1 + 40));
      OUTLINED_FUNCTION_41_0();
      v96();
      uint64_t isUniquelyReferenced_nonNull_native = *(void *)(v0 + 32);
      __swift_project_boxed_opaque_existential_1((void *)v0, *(void *)(v0 + 24));
      OUTLINED_FUNCTION_13_2();
      if (v0)
      {
        uint64_t v97 = *(void *)(v1 + 216);
        uint64_t v99 = *(void *)(v1 + 200);
        uint64_t v98 = *(void *)(v1 + 208);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_259445924(v99);
        sub_259445924(v98);
        sub_259445924(v97);
        swift_bridgeObjectRelease();
        goto LABEL_65;
      }
      if (!(*v28 >> 62))
      {
        uint64_t v104 = *(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_70;
      }
LABEL_101:
      OUTLINED_FUNCTION_71_1();
      uint64_t v104 = sub_259845460();
      swift_bridgeObjectRelease();
LABEL_70:
      if (v104 < 1)
      {
        OUTLINED_FUNCTION_34_37();
        sub_259445924(isUniquelyReferenced_nonNull_native);
        sub_259445924(v0);
        sub_259445924(v104);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (objc_msgSend(self, sel_enableOnDemandCaptionGeneration))
        {
          if (qword_26A388C30 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v140, (uint64_t)qword_26A391CB8);
          uint64_t v105 = (void *)sub_259843A50();
          os_log_type_t v106 = sub_259844B70();
          if (OUTLINED_FUNCTION_52(v106))
          {
            v107 = (float *)OUTLINED_FUNCTION_40_38();
            OUTLINED_FUNCTION_20_55(v107, 3.852e-34);
            OUTLINED_FUNCTION_13_0(&dword_25934C000, v108, v109, "Requesting on demand captions for %ld assets.");
            OUTLINED_FUNCTION_61_0();
          }

          OUTLINED_FUNCTION_10_59();
          *(void *)(v1 + 312) = *(void *)(v1 + 136);
          sub_259843F00();
          uint64_t v110 = (void *)swift_task_alloc();
          *(void *)(v1 + 320) = v110;
          *uint64_t v110 = v1;
          v110[1] = sub_2597DFC5C;
          OUTLINED_FUNCTION_15_10();
          return static AssetCaptionGenerator.assetCaptionByLocalIdentifier(for:eventRecorder:progressReporter:)(v111, v112, v113);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_26A388C30 != -1) {
          swift_once();
        }
        v116 = *(void **)(v1 + 176);
        __swift_project_value_buffer(v140, (uint64_t)qword_26A391CB8);
        id v117 = v116;
        BOOL v118 = (void *)sub_259843A50();
        os_log_type_t v119 = sub_259844B50();
        BOOL v120 = OUTLINED_FUNCTION_52(v119);
        uint64_t v121 = *(void **)(v1 + 176);
        if (v120)
        {
          uint64_t v122 = OUTLINED_FUNCTION_32_40();
          OUTLINED_FUNCTION_15_55((float *)v122, 3.8521e-34);
          *(_WORD *)(v122 + 12) = 2048;
          uint64_t v104 = v122 + 14;
          *uint64_t v3 = objc_msgSend(v121, sel_count);
          sub_259844E10();

          OUTLINED_FUNCTION_154_3(&dword_25934C000, v123, v124, "%ld / %ld assets are missing captions!");
          OUTLINED_FUNCTION_61_0();
        }
        else
        {
        }
        OUTLINED_FUNCTION_19_47();
        if (v116)
        {
          OUTLINED_FUNCTION_33_37();
          sub_259445924((uint64_t)v2);
          sub_259445924((uint64_t)v121);
          sub_259445924(v104);
LABEL_65:
          uint64_t v100 = OUTLINED_FUNCTION_8_75((uint64_t)v4);
          v101(v100);
          OUTLINED_FUNCTION_25_48();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          OUTLINED_FUNCTION_15_1();
          OUTLINED_FUNCTION_15_10();
          __asm { BRAA            X1, X16 }
        }
        uint64_t v125 = *(void *)(v1 + 208);
        uint64_t v126 = *(void *)(v1 + 216);
        sub_259445924(*(void *)(v1 + 200));
        sub_259445924(v125);
        sub_259445924(v126);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
      uint64_t v127 = *(void *)(v1 + 224);
      __swift_project_boxed_opaque_existential_1(*(void **)(v1 + 184), *(void *)(*(void *)(v1 + 184) + 24));
      OUTLINED_FUNCTION_41_0();
      v128();
      sub_259445924(v127);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_37_31();
      OUTLINED_FUNCTION_15_10();
      __asm { BRAA            X2, X16 }
    }
    OUTLINED_FUNCTION_18_41();
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    uint64_t v132 = MEMORY[0x263F8EE58] + 8;
    uint64_t v32 = v142;
LABEL_17:
    uint64_t v33 = v141
        ? (uint64_t *)MEMORY[0x25A2DFA20](v0, *(void *)(v1 + 248))
        : (uint64_t *)*(id *)(v133 + 8 * v0);
    int64_t v2 = v33;
    if (!__OFADD__(v0, 1)) {
      break;
    }
    __break(1u);
LABEL_95:
    swift_once();
  }
  id v34 = objc_msgSend(v33, sel_localIdentifier);
  uint64_t v145 = sub_2598440A0();
  uint64_t isUniquelyReferenced_nonNull_native = v35;

  if (!*(void *)(v32 + 16))
  {
LABEL_32:
    if (!*(void *)(v31 + 16) || (unint64_t v54 = sub_25939CE90(), (v55 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v68 = v2;
      MEMORY[0x25A2DED30]();
      unint64_t v69 = *(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v69 >> 1)
      {
        OUTLINED_FUNCTION_31_36(v69);
        sub_259844560();
      }
      sub_2598445B0();
      sub_259844530();

LABEL_58:
      uint64_t v32 = v142;
      goto LABEL_59;
    }
    id v56 = *(id *)(*(void *)(v31 + 56) + 8 * v54);
    swift_bridgeObjectRelease();
    v139 = v2;
    uint64_t result = sub_2593A2A4C(v139);
    if (!v57) {
      goto LABEL_103;
    }
    int64_t v2 = v57;
    id v137 = v56;
    id v58 = objc_msgSend(v56, sel_descriptionText);
    uint64_t v4 = (void *)sub_2598440A0();
    uint64_t v146 = v59;

    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v147 = v3;
    OUTLINED_FUNCTION_14_56();
    OUTLINED_FUNCTION_31_2();
    if (v62) {
      goto LABEL_98;
    }
    uint64_t v63 = v60;
    char v64 = v61;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389B38);
    char v65 = sub_259845350();
    uint64_t v3 = v147;
    if (v65)
    {
      OUTLINED_FUNCTION_14_56();
      OUTLINED_FUNCTION_125();
      if (!v52)
      {
LABEL_79:
        OUTLINED_FUNCTION_15_10();
        return sub_2598457D0();
      }
      uint64_t v63 = v66;
    }
    if (v64)
    {
      uint64_t v67 = (void *)(v3[7] + 16 * v63);
      swift_bridgeObjectRelease();
      *uint64_t v67 = v4;
      v67[1] = v146;
    }
    else
    {
      OUTLINED_FUNCTION_2_84();
      if (v62) {
        goto LABEL_100;
      }
      v3[2] = v94;
      sub_259843F00();
    }
    uint64_t v4 = (void *)(v1 + 16);
    uint64_t v31 = v143;
    uint64_t v95 = v0 + 1;
    unint64_t v28 = (void *)(v1 + 136);
    uint64_t v32 = v142;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_60:
    ++v0;
    if (v95 == *(void *)(v1 + 256))
    {
      swift_bridgeObjectRelease();
      goto LABEL_63;
    }
    goto LABEL_17;
  }
  sub_259843F00();
  unint64_t v36 = sub_25939CE90();
  if ((v37 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  id v38 = *(id *)(*(void *)(v32 + 56) + 8 * v36);
  swift_bridgeObjectRelease();
  v135 = v2;
  uint64_t result = sub_2593A2A4C(v135);
  if (v40)
  {
    uint64_t v41 = result;
    uint64_t v4 = v40;
    uint64_t v134 = v38;
    unint64_t v42 = objc_msgSend(v38, sel_descriptionText);
    uint64_t v136 = sub_2598440A0();
    uint64_t v138 = v43;

    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v44 = OUTLINED_FUNCTION_23_52();
    uint64_t v46 = v42[2];
    BOOL v47 = (v45 & 1) == 0;
    int64_t v2 = (uint64_t *)(v46 + v47);
    if (__OFADD__(v46, v47))
    {
      __break(1u);
      goto LABEL_97;
    }
    unint64_t v48 = v44;
    char v49 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389B38);
    char v50 = sub_259845350();
    uint64_t v3 = v147;
    if (v50)
    {
      sub_25939CE90();
      OUTLINED_FUNCTION_125();
      if (!v52) {
        goto LABEL_79;
      }
      unint64_t v48 = v51;
    }
    if (v49)
    {
      uint64_t v53 = (uint64_t *)(v3[7] + 16 * v48);
      swift_bridgeObjectRelease();
      *uint64_t v53 = v136;
      v53[1] = v138;
    }
    else
    {
      OUTLINED_FUNCTION_30_35((uint64_t)&v3[v48 >> 6]);
      uint64_t v71 = (uint64_t *)(v70 + 16 * v48);
      *uint64_t v71 = v41;
      v71[1] = (uint64_t)v4;
      char v72 = (uint64_t *)(v3[7] + 16 * v48);
      *char v72 = v136;
      v72[1] = v138;
      uint64_t v73 = v3[2];
      BOOL v62 = __OFADD__(v73, 1);
      uint64_t v74 = v73 + 1;
      if (v62) {
        goto LABEL_99;
      }
      v3[2] = v74;
      sub_259843F00();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25973CE24(v145, isUniquelyReferenced_nonNull_native, MEMORY[0x263F8EE88]);
    char v76 = v75;
    swift_bridgeObjectRelease();
    uint64_t v31 = v143;
    unint64_t v28 = (void *)(v1 + 136);
    uint64_t v32 = v142;
    if (v76)
    {
      if (qword_26A388C30 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v140, (uint64_t)qword_26A391CB8);
      id v77 = v134;
      uint64_t v78 = sub_259843A50();
      os_log_type_t v79 = sub_259844B40();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        id v90 = objc_msgSend(v77, sel_descriptionText, OUTLINED_FUNCTION_39_37(v81, v82, v83, v84, v85, v86, v87, v88, v131, v132, v89).n128_f64[0]);
        uint64_t v91 = sub_2598440A0();
        unint64_t v93 = v92;

        uint64_t v31 = v143;
        *(void *)(v80 + 4) = sub_259356D5C(v91, v93, (uint64_t *)&v147);

        unint64_t v28 = (void *)(v1 + 136);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25934C000, v78, v79, "Video caption preferred for LP. Using: %s.", (uint8_t *)v80, 0xCu);
        swift_arrayDestroy();
        uint64_t v3 = (void *)v145;
        OUTLINED_FUNCTION_61_0();
        OUTLINED_FUNCTION_61_0();
      }
      else
      {
      }
      uint64_t v4 = (void *)(v1 + 16);
      goto LABEL_58;
    }

    uint64_t v4 = (void *)(v1 + 16);
LABEL_59:
    uint64_t v95 = v0 + 1;
    goto LABEL_60;
  }
  __break(1u);
LABEL_103:
  __break(1u);
  return result;
}

uint64_t sub_2597E1130()
{
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = (void *)v0[23];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  sub_259445924(v3);
  sub_259445924(v2);
  sub_259445924(v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  OUTLINED_FUNCTION_41_0();
  v5();
  sub_259445924(v0[28]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

unint64_t sub_2597E1234()
{
  unint64_t result = qword_26A391CD8;
  if (!qword_26A391CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A391CD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetCaptionDataSource()
{
  return &type metadata for AssetCaptionDataSource;
}

unsigned char *storeEnumTagSinglePayload for AssetCaptionDataSource.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2597E132CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetCaptionDataSource.Error()
{
  return &type metadata for AssetCaptionDataSource.Error;
}

unint64_t sub_2597E1368()
{
  unint64_t result = qword_26A391CE8;
  if (!qword_26A391CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391CE8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_20_55(float *a1, float a2)
{
  *a1 = a2;
  *(void *)(v3 + 168) = v2;
  return sub_259844E10();
}

unint64_t OUTLINED_FUNCTION_23_52()
{
  *(void *)(v1 - 88) = v0;
  return sub_25939CE90();
}

void OUTLINED_FUNCTION_30_35(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_34_37()
{
  *(void *)(v1 - 96) = v0;
  return swift_bridgeObjectRelease();
}

__n128 OUTLINED_FUNCTION_39_37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  *(void *)(v13 - 96) = v12;
  *(void *)(v13 - 88) = a1;
  __n128 result = a11;
  *unint64_t v11 = a11.n128_u32[0];
  return result;
}

PhotosIntelligence::AssetCurationCompletion __swiftcall AssetCurationCompletion.init(assetIDs:)(PhotosIntelligence::AssetCurationCompletion assetIDs)
{
  v1->assetIDs._rawValue = assetIDs.assetIDs._rawValue;
  return assetIDs;
}

uint64_t AssetCurationCompletion.assetIDs.getter()
{
  return sub_259843F00();
}

uint64_t AssetCurationCompletion.description.getter()
{
  uint64_t v0 = sub_259843F00();
  MEMORY[0x25A2DED80](v0, MEMORY[0x263F8D310]);
  sub_259844240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x7344497465737361;
}

uint64_t sub_2597E14D8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7344497465737361 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_259845750();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2597E1560()
{
  return 0x7344497465737361;
}

uint64_t sub_2597E157C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2597E14D8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2597E15A8(uint64_t a1)
{
  unint64_t v2 = sub_2597E1794();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2597E15E4(uint64_t a1)
{
  unint64_t v2 = sub_2597E1794();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AssetCurationCompletion.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A391CF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2597E1794();
  sub_259845960();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3001D0);
    sub_2597E17E0();
    sub_2598455D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_2597E1794()
{
  unint64_t result = qword_26A391CF8;
  if (!qword_26A391CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391CF8);
  }
  return result;
}

unint64_t sub_2597E17E0()
{
  unint64_t result = qword_26A38A4C8;
  if (!qword_26A38A4C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3001D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A38A4C8);
  }
  return result;
}

uint64_t sub_2597E1850@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AssetCurationCompletion.init(from:)(a1, a2);
}

ValueMetadata *type metadata accessor for AssetCurationCompletion()
{
  return &type metadata for AssetCurationCompletion;
}

unsigned char *storeEnumTagSinglePayload for AssetCurationCompletion.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2597E1914);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetCurationCompletion.CodingKeys()
{
  return &type metadata for AssetCurationCompletion.CodingKeys;
}

unint64_t sub_2597E1950()
{
  unint64_t result = qword_26A391D00;
  if (!qword_26A391D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D00);
  }
  return result;
}

unint64_t sub_2597E19A0()
{
  unint64_t result = qword_26A391D08;
  if (!qword_26A391D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D08);
  }
  return result;
}

unint64_t sub_2597E19F0()
{
  unint64_t result = qword_26A391D10;
  if (!qword_26A391D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D10);
  }
  return result;
}

void static SafetyControllerDiagnosticsGenerator.save(with:diagnosticReport:)()
{
  if (PFOSVariantHasInternalDiagnostics())
  {
    sub_259842540();
    swift_allocObject();
    sub_259842530();
    sub_259842510();
    sub_2597E1B7C();
    uint64_t v1 = sub_259842520();
    if (v0)
    {
      swift_release();
      sub_2597E1BC8();
      swift_allocError();
      swift_willThrow();
    }
    else
    {
      uint64_t v3 = v1;
      unint64_t v4 = v2;
      sub_2594E7DB8();
      sub_259399374(v3, v4);
      swift_release();
    }
  }
}

unint64_t sub_2597E1B7C()
{
  unint64_t result = qword_26A391D18;
  if (!qword_26A391D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D18);
  }
  return result;
}

unint64_t sub_2597E1BC8()
{
  unint64_t result = qword_26A391D20;
  if (!qword_26A391D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D20);
  }
  return result;
}

unint64_t static SafetyControllerDiagnosticsGenerator.diagnosticsFileName.getter()
{
  return 0xD00000000000001FLL;
}

ValueMetadata *type metadata accessor for SafetyControllerDiagnosticsGenerator()
{
  return &type metadata for SafetyControllerDiagnosticsGenerator;
}

unsigned char *storeEnumTagSinglePayload for SafetyControllerDiagnosticsGenerator.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2597E1CDCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SafetyControllerDiagnosticsGenerator.Error()
{
  return &type metadata for SafetyControllerDiagnosticsGenerator.Error;
}

unint64_t sub_2597E1D18()
{
  unint64_t result = qword_26A391D28;
  if (!qword_26A391D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D28);
  }
  return result;
}

uint64_t dispatch thunk of Trait.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Trait.assetUUIDs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Trait.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t static AssetSampler.sample(assetUUIDs:maxNumberOfAssetsToSample:seed:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (!*(void *)(a1 + 16)) {
    return MEMORY[0x263F8EE78];
  }
  if (a4)
  {
    uint64_t v11 = 0;
    MEMORY[0x25A2E13C0](&v11, 8);
    a3 = v11;
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5DF58]), sel_initWithSeed_, a3);
  uint64_t result = sub_2595C49DC((uint64_t)v8, a1);
  uint64_t v10 = *(void *)(result + 16);
  if (v10 >= a2) {
    uint64_t v10 = a2;
  }
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = sub_259433218(result, result + 32, 0, (2 * v10) | 1);

    return v7;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for AssetSampler()
{
  return &type metadata for AssetSampler;
}

id sub_2597E1E74(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_259440814);
}

id sub_2597E1EA0(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_259440814);
}

id sub_2597E1EB8(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_2594409B8);
}

id sub_2597E1ED0(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_259440D80);
}

id sub_2597E1EE8(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_259440F24);
}

id sub_2597E1F00(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_25944126C);
}

id sub_2597E1F18(uint64_t a1, void (*a2)(void))
{
  a2();
  id v3 = objc_msgSend(self, sel_fetchHighlightsWithOptions_, *(void *)(a1 + 24));
  return v3;
}

uint64_t sub_2597E1F70(void *a1)
{
  return sub_2597E1FA4(a1, (uint64_t)sub_2597E31D4, (uint64_t)&block_descriptor_23);
}

uint64_t sub_2597E1FA4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  uint64_t v7 = (uint64_t *)(v6 + 16);
  v11[4] = a2;
  v11[5] = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_259442AB0;
  v11[3] = a3;
  id v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_enumerateObjectsUsingBlock_, v8);
  _Block_release(v8);
  swift_beginAccess();
  uint64_t v9 = *v7;
  sub_259843F00();
  swift_release();
  return v9;
}

uint64_t static HighlightCollectionFetcher.describe(collections:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a2;
  v7[3] = a3;
  v7[4] = v6;
  v11[4] = sub_2597E3104;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_259442AB0;
  v11[3] = &block_descriptor_39;
  id v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_enumerateObjectsUsingBlock_, v8);
  _Block_release(v8);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v6 + 16);
  sub_259843F00();
  swift_release();
  return v9;
}

id sub_2597E21F8(uint64_t a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.basePredicate(using:)(a1, a2, (uint64_t)&protocol witness table for YearFetcher);
}

id static HighlightCollectionFetcher.basePredicate(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25935633C(0, &qword_26B300508);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_259876910;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 64) = sub_25935626C();
  *(void *)(v6 + 32) = 1684957547;
  *(void *)(v6 + 40) = 0xE400000000000000;
  __int16 v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v8 = MEMORY[0x263F8E8E8];
  *(void *)(v6 + 96) = MEMORY[0x263F8E888];
  *(void *)(v6 + 104) = v8;
  *(_WORD *)(v6 + 72) = v7;
  OUTLINED_FUNCTION_0_23();
  id result = (id)sub_259844AB0();
  id v10 = result;
  if (a1)
  {
    id v11 = static HighlightCollectionFetcher.predicateForVisibilityState(sharingFilter:)((__int16)objc_msgSend(*(id *)(a1 + 24), sel_sharingFilter), a2, a3);
    sub_25935633C(0, (unint64_t *)&unk_26B300530);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B300600);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_25987BF60;
    *(void *)(v12 + 32) = v10;
    *(void *)(v12 + 40) = v11;
    sub_259844530();
    return sub_2593562B8();
  }
  return result;
}

id sub_2597E2390(int a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.predicateForFavorites(_:)(a1, a2, (uint64_t)&protocol witness table for YearFetcher);
}

id static HighlightCollectionFetcher.predicateForFavorites(_:)(int a1, uint64_t a2, uint64_t a3)
{
  LODWORD(v5) = a1;
  uint64_t v6 = sub_259843A80();
  uint64_t v7 = *(void *)(v6 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a3 + 8);
  (*(void (**)(uint64_t, uint64_t, double))(v11 + 16))(a2, v11, v8);
  uint64_t v12 = sub_259843A50();
  os_log_type_t v13 = sub_259844B50();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    int v23 = (int)v5;
    uint64_t v5 = (uint8_t *)v14;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v25 = v15;
    v21[1] = v5 + 4;
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)(v11 + 8) + 16))(a2);
    uint64_t v24 = sub_259356D5C(v16, v17, &v25);
    sub_259844E10();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25934C000, v12, v13, "CollectionFetcher.%s do not supports favorites", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2E13A0](v15, -1, -1);
    uint64_t v18 = v5;
    LOBYTE(v5) = v23;
    MEMORY[0x25A2E13A0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  id v19 = objc_msgSend(self, sel_predicateWithValue_, (v5 & 1) == 0);
  return v19;
}

id sub_2597E2620(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_259440D80);
}

uint64_t sub_2597E264C(void *a1)
{
  return sub_2597E1FA4(a1, (uint64_t)sub_2597E31AC, (uint64_t)&block_descriptor_19_0);
}

id sub_2597E2680(uint64_t a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.basePredicate(using:)(a1, a2, (uint64_t)&protocol witness table for MonthFetcher);
}

id sub_2597E268C(int a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.predicateForFavorites(_:)(a1, a2, (uint64_t)&protocol witness table for MonthFetcher);
}

id static HighlightCollectionFetcher.predicateForVisibilityState(sharingFilter:)(__int16 a1, uint64_t a2, uint64_t a3)
{
  sub_259355C80(a1, v17);
  unsigned __int16 v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  if (v5 > 3u) {
    uint64_t v6 = &unk_270742998;
  }
  else {
    uint64_t v6 = *(&off_26544E848 + (__int16)v5);
  }
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v7 = v6[2];
  if (v7)
  {
    sub_25935633C(0, &qword_26B300508);
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x263F8E888];
    uint64_t v10 = MEMORY[0x263F8E8E8];
    do
    {
      __int16 v11 = *((_WORD *)v6 + v8 + 16);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_259876910;
      sub_259353FF0((uint64_t)v17, v12 + 32);
      *(void *)(v12 + 96) = v9;
      *(void *)(v12 + 104) = v10;
      *(_WORD *)(v12 + 72) = v11;
      OUTLINED_FUNCTION_0_23();
      id v13 = (id)sub_259844AB0();
      MEMORY[0x25A2DED30]();
      if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_259844560();
      }
      ++v8;
      sub_2598445B0();
      sub_259844530();
    }
    while (v7 != v8);
  }
  swift_bridgeObjectRelease();
  sub_25935633C(0, (unint64_t *)&unk_26B300530);
  id v14 = sub_259351BF0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v14;
}

id sub_2597E28A8(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_2594409B8);
}

uint64_t sub_2597E28D4(void *a1)
{
  return sub_2597E1FA4(a1, (uint64_t)sub_2597E3184, (uint64_t)&block_descriptor_15_0);
}

id sub_2597E2908(int a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.predicateForFavorites(_:)(a1, a2, (uint64_t)&protocol witness table for DayFetcher);
}

id sub_2597E2928(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_259440F24);
}

uint64_t sub_2597E2954(void *a1)
{
  return sub_2597E1FA4(a1, (uint64_t)sub_2597E315C, (uint64_t)&block_descriptor_11_0);
}

id sub_2597E2988(int a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.predicateForFavorites(_:)(a1, a2, (uint64_t)&protocol witness table for DayEventsFetcher);
}

id sub_2597E29A8(uint64_t a1)
{
  return sub_2597E1F18(a1, (void (*)(void))sub_25944126C);
}

uint64_t sub_2597E29D4(void *a1)
{
  return sub_2597E1FA4(a1, (uint64_t)sub_2597E3134, (uint64_t)&block_descriptor_7_1);
}

id sub_2597E2A08(int a1, uint64_t a2)
{
  return static HighlightCollectionFetcher.predicateForFavorites(_:)(a1, a2, (uint64_t)&protocol witness table for TripHighlightFetcher);
}

uint64_t sub_2597E2A28()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2597E2A60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_259845110();
  sub_25935633C(0, (unint64_t *)&qword_26A38B2E0);
  uint64_t v6 = sub_2598459F0();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  sub_259844240();
  swift_beginAccess();
  sub_259843F00();
  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v9 = objc_msgSend(a1, sel_uuid);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_2598440A0();
  }
  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v11 = objc_msgSend(a1, sel_title);
  sub_2598440A0();

  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v12 = objc_msgSend(a1, sel_subtitle);
  if (v12)
  {
    id v13 = v12;
    sub_2598440A0();
  }
  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v14 = (id)MEMORY[0x25A2E0600](objc_msgSend(a1, sel_type));
  sub_2598440A0();

  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v15 = (id)MEMORY[0x25A2E05F0](objc_msgSend(a1, sel_kind));
  sub_2598440A0();

  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  swift_beginAccess();
  sub_25938464C();
  uint64_t v16 = *(void *)(*(void *)(a4 + 16) + 16);
  sub_259384DEC();
  uint64_t v17 = *(void *)(a4 + 16);
  *(void *)(v17 + 16) = v16 + 1;
  uint64_t v18 = v17 + 16 * v16;
  *(void *)(v18 + 32) = v6;
  *(void *)(v18 + 40) = v8;
  return swift_endAccess();
}

uint64_t sub_2597E2D98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_259845110();
  sub_25935633C(0, (unint64_t *)&qword_26A38B2E0);
  uint64_t v10 = sub_2598459F0();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  sub_259844240();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(a6 + 8) + 8) + 16))(a5);
  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v13 = objc_msgSend(a1, sel_uuid);
  if (v13)
  {
    id v14 = v13;
    sub_2598440A0();
  }
  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v15 = objc_msgSend(a1, sel_title);
  sub_2598440A0();

  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v16 = objc_msgSend(a1, sel_subtitle);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_2598440A0();
  }
  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v18 = (id)MEMORY[0x25A2E0600](objc_msgSend(a1, sel_type));
  sub_2598440A0();

  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  id v19 = (id)MEMORY[0x25A2E05F0](objc_msgSend(a1, sel_kind));
  sub_2598440A0();

  sub_259844240();
  swift_bridgeObjectRelease();
  sub_259844240();
  swift_beginAccess();
  sub_25938464C();
  uint64_t v20 = *(void *)(*(void *)(a4 + 16) + 16);
  sub_259384DEC();
  uint64_t v21 = *(void *)(a4 + 16);
  *(void *)(v21 + 16) = v20 + 1;
  uint64_t v22 = v21 + 16 * v20;
  *(void *)(v22 + 32) = v10;
  *(void *)(v22 + 40) = v12;
  return swift_endAccess();
}

uint64_t sub_2597E30CC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2597E3104(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2597E2D98(a1, a2, a3, v3[4], v3[2], v3[3]);
}

uint64_t block_copy_helper_32(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t dispatch thunk of static HighlightCollectionFetcher.kind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2597E3134(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2597E2A60(a1, a2, a3, v3);
}

uint64_t sub_2597E315C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2597E2A60(a1, a2, a3, v3);
}

uint64_t sub_2597E3184(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2597E2A60(a1, a2, a3, v3);
}

uint64_t sub_2597E31AC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2597E2A60(a1, a2, a3, v3);
}

uint64_t sub_2597E31D4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2597E2A60(a1, a2, a3, v3);
}

void sub_2597E3224(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1;
    uint64_t v50 = MEMORY[0x263F8EE78];
    sub_2594F2630();
    uint64_t v44 = v50;
    uint64_t v3 = sub_259616408(v2);
    if ((v3 & 0x8000000000000000) == 0)
    {
      unint64_t v5 = v3;
      if (v3 < 1 << *(unsigned char *)(v2 + 32))
      {
        int v6 = v4;
        uint64_t v7 = v2 + 64;
        uint64_t v8 = 1;
        uint64_t v36 = v2 + 64;
        uint64_t v37 = v2;
        uint64_t v35 = v1;
        while ((*(void *)(v7 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
        {
          if (*(_DWORD *)(v2 + 36) != v6) {
            goto LABEL_40;
          }
          uint64_t v41 = 1 << v5;
          unint64_t v42 = v5 >> 6;
          uint64_t v39 = v8;
          uint64_t v9 = *(void *)(v2 + 56);
          uint64_t v10 = (void *)(*(void *)(v2 + 48) + 56 * v5);
          uint64_t v46 = v10[2];
          uint64_t v12 = v10[3];
          uint64_t v11 = (void *)v10[4];
          id v13 = (void *)v10[5];
          unint64_t v14 = *(void *)(v9 + 8 * v5);
          sub_259843F00();
          sub_259843F00();
          id v15 = v11;
          id v16 = v13;
          sub_259843F00();
          sub_259843F00();
          unint64_t v47 = v14;
          if (v14 >> 62)
          {
            sub_259843F00();
            sub_259843F00();
            id v33 = v15;
            id v34 = v16;
            sub_259843F00();
            sub_259843F00();
            uint64_t v17 = sub_259845460();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v17 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
            sub_259843F00();
            sub_259843F00();
            id v18 = v15;
            id v19 = v16;
            sub_259843F00();
          }
          uint64_t v43 = v5;
          int v40 = v6;
          if (v17)
          {
            uint64_t v20 = v17;
            uint64_t v49 = MEMORY[0x263F8EE78];
            sub_2594F2610();
            if (v17 < 0) {
              goto LABEL_45;
            }
            id v38 = v16;
            uint64_t v21 = 0;
            uint64_t v22 = v49;
            unint64_t v23 = v14;
            uint64_t v45 = v20;
            while (v20 != v21)
            {
              if ((v47 & 0xC000000000000001) != 0)
              {
                uint64_t v24 = MEMORY[0x25A2DFA20](v21);
              }
              else
              {
                uint64_t v24 = *(void *)(v23 + 8 * v21 + 32);
                swift_retain();
              }
              uint64_t v25 = *(void *)(v24 + 80);
              uint64_t v48 = *(void *)(v24 + 72);
              swift_beginAccess();
              if (*(unsigned char *)(v24 + 89))
              {
                if (*(unsigned char *)(v24 + 89) == 1)
                {
                  unint64_t v26 = 0xE300000000000000;
                  uint64_t v27 = 7562585;
                }
                else
                {
                  unint64_t v26 = 0xE200000000000000;
                  uint64_t v27 = 28494;
                }
              }
              else
              {
                unint64_t v26 = 0xEA00000000006465;
                uint64_t v27 = 0x726577736E616E55;
              }
              sub_259843F00();
              sub_259843F00();
              swift_release();
              unint64_t v28 = *(void *)(v49 + 16);
              if (v28 >= *(void *)(v49 + 24) >> 1) {
                sub_2594F2610();
              }
              ++v21;
              *(void *)(v49 + 16) = v28 + 1;
              uint64_t v29 = (void *)(v49 + 48 * v28);
              unint64_t v23 = v47;
              v29[4] = v46;
              v29[5] = v12;
              v29[6] = v48;
              v29[7] = v25;
              v29[8] = v27;
              v29[9] = v26;
              uint64_t v20 = v45;
              if (v45 == v21)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();

                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();
                goto LABEL_26;
              }
            }
            __break(1u);
            break;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          uint64_t v22 = MEMORY[0x263F8EE78];
LABEL_26:
          uint64_t v30 = v44;
          unint64_t v31 = *(void *)(v44 + 16);
          if (v31 >= *(void *)(v44 + 24) >> 1)
          {
            sub_2594F2630();
            uint64_t v30 = v44;
          }
          *(void *)(v30 + 16) = v31 + 1;
          *(void *)(v30 + 8 * v31 + 32) = v22;
          uint64_t v2 = v37;
          if (v43 >= -(-1 << *(unsigned char *)(v37 + 32))) {
            goto LABEL_41;
          }
          uint64_t v7 = v36;
          if ((*(void *)(v36 + 8 * v42) & v41) == 0) {
            goto LABEL_42;
          }
          if (*(_DWORD *)(v37 + 36) != v40) {
            goto LABEL_43;
          }
          uint64_t v44 = v30;
          uint64_t v32 = sub_259844F40();
          if (v39 == v35) {
            return;
          }
          unint64_t v5 = v32;
          if ((v32 & 0x8000000000000000) == 0)
          {
            int v6 = *(_DWORD *)(v37 + 36);
            uint64_t v8 = v39 + 1;
            if (v32 < 1 << *(unsigned char *)(v37 + 32)) {
              continue;
            }
          }
          goto LABEL_44;
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
      }
    }
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
  }
}

void sub_2597E36C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1;
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_2594F2610();
    uint64_t v3 = v29;
    uint64_t v4 = sub_259616408(v2);
    if ((v4 & 0x8000000000000000) == 0)
    {
      unint64_t v6 = v4;
      if (v4 < 1 << *(unsigned char *)(v2 + 32))
      {
        uint64_t v7 = v2 + 64;
        uint64_t v19 = v2 + 64;
        uint64_t v20 = v2;
        while ((*(void *)(v7 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
        {
          if (v5 != *(_DWORD *)(v2 + 36)) {
            goto LABEL_23;
          }
          uint64_t v21 = v1;
          int v22 = v5;
          uint64_t v8 = (void *)(*(void *)(v2 + 48) + 56 * v6);
          uint64_t v27 = v8[2];
          uint64_t v28 = v3;
          uint64_t v10 = v8[3];
          uint64_t v9 = (void *)v8[4];
          uint64_t v11 = (void *)v8[5];
          uint64_t v12 = *(void *)(*(void *)(v2 + 56) + 8 * v6);
          swift_retain();
          uint64_t v26 = *(void *)(v12 + 72);
          uint64_t v23 = *(void *)(v12 + 80);
          sub_259843F00();
          sub_259843F00();
          id v13 = v9;
          id v14 = v11;
          sub_259843F00();
          swift_beginAccess();
          if (*(unsigned char *)(v12 + 89))
          {
            if (*(unsigned char *)(v12 + 89) == 1)
            {
              unint64_t v25 = 0xE300000000000000;
              uint64_t v15 = 7562585;
            }
            else
            {
              unint64_t v25 = 0xE200000000000000;
              uint64_t v15 = 28494;
            }
          }
          else
          {
            unint64_t v25 = 0xEA00000000006465;
            uint64_t v15 = 0x726577736E616E55;
          }
          uint64_t v24 = v15;
          sub_259843F00();
          sub_259843F00();
          swift_release();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v3 = v28;
          unint64_t v16 = *(void *)(v28 + 16);
          if (v16 >= *(void *)(v28 + 24) >> 1)
          {
            sub_2594F2610();
            uint64_t v3 = v28;
          }
          *(void *)(v3 + 16) = v16 + 1;
          uint64_t v17 = (void *)(v3 + 48 * v16);
          v17[4] = v27;
          unint64_t v17[5] = v10;
          v17[6] = v26;
          v17[7] = v23;
          v17[8] = v24;
          v17[9] = v25;
          uint64_t v2 = v20;
          if ((uint64_t)v6 >= -(-1 << *(unsigned char *)(v20 + 32))) {
            goto LABEL_24;
          }
          uint64_t v7 = v19;
          if ((*(void *)(v19 + 8 * (v6 >> 6)) & (1 << v6)) == 0) {
            goto LABEL_25;
          }
          if (v22 != *(_DWORD *)(v20 + 36)) {
            goto LABEL_26;
          }
          uint64_t v18 = sub_259844F40();
          uint64_t v1 = v21 - 1;
          if (v21 == 1) {
            return;
          }
          unint64_t v6 = v18;
          if ((v18 & 0x8000000000000000) == 0)
          {
            int v5 = *(_DWORD *)(v20 + 36);
            if (v18 < 1 << *(unsigned char *)(v20 + 32)) {
              continue;
            }
          }
          goto LABEL_27;
        }
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
      }
    }
LABEL_27:
    __break(1u);
  }
}

uint64_t sub_2597E39A8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x736E6F6974636573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_259845750();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2597E3A30()
{
  return 0x736E6F6974636573;
}

uint64_t sub_2597E3A48(void *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391D30);
  OUTLINED_FUNCTION_14_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2597E4AA8();
  sub_259845970();
  v11[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391D40);
  sub_2597E4B8C(&qword_26A391D48, &qword_26A391D40, (void (*)(void))sub_2597E4AF4);
  sub_2598456D0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v2);
}

uint64_t sub_2597E3B90(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_259845750() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697473657571 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_259845750();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2597E3C7C(char a1)
{
  if (a1) {
    return 0x6E6F697473657571;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_2597E3CB0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391D58);
  OUTLINED_FUNCTION_14_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_221();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2597E4B40();
  sub_259845970();
  OUTLINED_FUNCTION_2_85();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A38C640);
    sub_2597E4B8C(&qword_26A391D68, &qword_26A38C640, (void (*)(void))sub_2597E4C04);
    sub_2598456D0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v3, v1);
}

uint64_t sub_2597E3E24(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7551686372616573 && a2 == 0xEB00000000797265;
  if (v2 || (sub_259845750() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6F697473657571 && a2 == 0xE800000000000000;
    if (v6 || (sub_259845750() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x726577736E61 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_259845750();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_2597E3F84(char a1)
{
  if (!a1) {
    return 0x7551686372616573;
  }
  if (a1 == 1) {
    return 0x6E6F697473657571;
  }
  return 0x726577736E61;
}

uint64_t sub_2597E3FE0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391DA8);
  OUTLINED_FUNCTION_14_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_221();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2597E5014();
  sub_259845970();
  sub_259845620();
  if (!v2)
  {
    OUTLINED_FUNCTION_2_85();
    OUTLINED_FUNCTION_2_85();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v3, v1);
}

uint64_t sub_2597E4118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2597E39A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2597E4144(uint64_t a1)
{
  unint64_t v2 = sub_2597E4AA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2597E4180(uint64_t a1)
{
  unint64_t v2 = sub_2597E4AA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2597E41BC(void *a1)
{
  return sub_2597E3A48(a1, *v1);
}

uint64_t sub_2597E41D8()
{
  return sub_2597E3C7C(*v0);
}

uint64_t sub_2597E41E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2597E3B90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2597E4208(uint64_t a1)
{
  unint64_t v2 = sub_2597E4B40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2597E4244(uint64_t a1)
{
  unint64_t v2 = sub_2597E4B40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2597E4280(void *a1)
{
  return sub_2597E3CB0(a1);
}

uint64_t sub_2597E42A0()
{
  return sub_2597E3F84(*v0);
}

uint64_t sub_2597E42A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2597E3E24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2597E42D0(uint64_t a1)
{
  unint64_t v2 = sub_2597E5014();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2597E430C(uint64_t a1)
{
  unint64_t v2 = sub_2597E5014();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2597E4348(void *a1)
{
  return sub_2597E3FE0(a1);
}

void static StoryDiagnosticsUtils.createJsonDataForInternalSurvey(storylineQuestions:imageRetrievalQuestionsByImageQuery:imageQueryQuestionByImageQuery:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a1;
  if (a1 >> 62)
  {
    sub_259843F00();
    uint64_t v6 = sub_259845460();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!v6)
  {
LABEL_23:
    sub_2597E3224(a2);
    uint64_t v20 = sub_2597E47E8(v19);
    swift_bridgeObjectRelease();
    sub_2597E36C8(a3);
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389800);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_259876900;
    *(void *)(v23 + 32) = 0x6E696C79726F7453;
    *(void *)(v23 + 40) = 0xE900000000000065;
    *(void *)(v23 + 48) = v7;
    *(void *)(v23 + 56) = 0x6552206567616D49;
    *(void *)(v23 + 64) = 0xEF6C617665697274;
    *(void *)(v23 + 72) = v20;
    *(void *)(v23 + 80) = 0x736567616D49;
    *(void *)(v23 + 88) = 0xE600000000000000;
    *(void *)(v23 + 96) = v22;
    sub_2598422E0();
    swift_allocObject();
    sub_2598422D0();
    sub_2595A6AAC();
    sub_2598422C0();
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_2594F2610();
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v24 = a2;
    uint64_t v8 = 0;
    uint64_t v7 = v29;
    uint64_t v25 = a3;
    unint64_t v26 = v5 & 0xC000000000000001;
    uint64_t v27 = v6;
    unint64_t v28 = v5;
    do
    {
      if (v26)
      {
        uint64_t v9 = MEMORY[0x25A2DFA20](v8, v5);
      }
      else
      {
        uint64_t v9 = *(void *)(v5 + 8 * v8 + 32);
        swift_retain();
      }
      uint64_t v10 = *(void *)(v9 + 72);
      uint64_t v11 = *(void *)(v9 + 80);
      swift_beginAccess();
      int v12 = *(unsigned __int8 *)(v9 + 89);
      uint64_t v13 = 7562585;
      if (v12 != 1) {
        uint64_t v13 = 28494;
      }
      unint64_t v14 = 0xE300000000000000;
      if (v12 != 1) {
        unint64_t v14 = 0xE200000000000000;
      }
      if (*(unsigned char *)(v9 + 89)) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = 0x726577736E616E55;
      }
      if (*(unsigned char *)(v9 + 89)) {
        unint64_t v16 = v14;
      }
      else {
        unint64_t v16 = 0xEA00000000006465;
      }
      sub_259843F00();
      swift_release();
      unint64_t v17 = *(void *)(v29 + 16);
      if (v17 >= *(void *)(v29 + 24) >> 1) {
        sub_2594F2610();
      }
      ++v8;
      *(void *)(v29 + 16) = v17 + 1;
      uint64_t v18 = (void *)(v29 + 48 * v17);
      v18[4] = 0;
      v18[5] = 0;
      v18[6] = v10;
      v18[7] = v11;
      v18[8] = v15;
      v18[9] = v16;
      unint64_t v5 = v28;
    }
    while (v27 != v8);
    a3 = v25;
    a2 = v24;
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t StoryDiagnosticsUtils.deinit()
{
  return v0;
}

uint64_t StoryDiagnosticsUtils.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2597E467C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  unint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = result;
    uint64_t result = sub_259843F00();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 4;
    while (1)
    {
      int v7 = *(_DWORD *)(v3 + 4 * v5 + 32);
      if (!v4)
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A3898B8);
        uint64_t v11 = (void *)swift_allocObject();
        uint64_t v12 = (uint64_t)(_swift_stdlib_malloc_size_0(v11) - 32) / 4;
        void v11[2] = v10;
        v11[3] = 2 * v12;
        unint64_t v13 = (unint64_t)(v11 + 4);
        unint64_t v14 = v2[3];
        unint64_t v15 = v14 >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= (unint64_t)v2 + 4 * v15 + 32) {
            memmove(v11 + 4, v2 + 4, 4 * v15);
          }
          v2[2] = 0;
        }
        uint64_t v6 = (_DWORD *)(v13 + 4 * v15);
        uint64_t v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - (v14 >> 1);
        uint64_t result = swift_release();
        unint64_t v2 = v11;
      }
      BOOL v17 = __OFSUB__(v4--, 1);
      if (v17) {
        break;
      }
      ++v5;
      *v6++ = v7;
      if (v1 == v5)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v4 = 0;
LABEL_21:
  unint64_t v18 = v2[3];
  if (v18 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v4);
  unint64_t v20 = v19 - v4;
  if (!v17)
  {
    v2[2] = v20;
    return (uint64_t)v2;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2597E47E8(uint64_t a1)
{
  uint64_t result = sub_259843F00();
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  int v7 = (void *)MEMORY[0x263F8EE78];
  uint64_t v8 = MEMORY[0x263F8EE78] + 32;
  while (1)
  {
    while (v4)
    {
      unint64_t v9 = *(void *)(v4 + 16);
      if (v3 == v9) {
        break;
      }
      if (v3 >= v9) {
        goto LABEL_31;
      }
      uint64_t v12 = v4 + 48 * v3;
      uint64_t v13 = *(void *)(v12 + 56);
      uint64_t v27 = *(void *)(v12 + 64);
      uint64_t v28 = *(void *)(v12 + 32);
      uint64_t v14 = *(void *)(v12 + 72);
      long long v29 = *(_OWORD *)(v12 + 40);
      if (v5)
      {
        sub_259843F00();
        sub_259843F00();
        uint64_t result = sub_259843F00();
        unint64_t v15 = v7;
      }
      else
      {
        unint64_t v16 = v7[3];
        if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_34;
        }
        int64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
        if (v17 <= 1) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v17;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A389808);
        unint64_t v15 = (void *)swift_allocObject();
        uint64_t v19 = (uint64_t)(_swift_stdlib_malloc_size_0(v15) - 32) / 48;
        v15[2] = v18;
        v15[3] = 2 * v19;
        unint64_t v20 = v15 + 4;
        uint64_t v21 = v7[3] >> 1;
        uint64_t v8 = (uint64_t)&v15[6 * v21 + 4];
        uint64_t v5 = (v19 & 0x7FFFFFFFFFFFFFFFLL) - v21;
        if (v7[2])
        {
          BOOL v22 = v15 < v7 || v20 >= &v7[6 * v21 + 4];
          if (v22 || v15 != v7) {
            memmove(v20, v7 + 4, 48 * v21);
          }
          sub_259843F00();
          sub_259843F00();
          sub_259843F00();
          v7[2] = 0;
        }
        else
        {
          sub_259843F00();
          sub_259843F00();
          sub_259843F00();
        }
        uint64_t result = swift_release();
      }
      BOOL v23 = __OFSUB__(v5--, 1);
      if (v23) {
        goto LABEL_32;
      }
      ++v3;
      *(void *)uint64_t v8 = v28;
      *(_OWORD *)(v8 + 8) = v29;
      *(void *)(v8 + 24) = v13;
      *(void *)(v8 + 32) = v27;
      *(void *)(v8 + 40) = v14;
      v8 += 48;
      int v7 = v15;
    }
    unint64_t v10 = *(void *)(a1 + 16);
    if (v6 == v10)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v24 = v7[3];
      if (v24 >= 2)
      {
        unint64_t v25 = v24 >> 1;
        BOOL v23 = __OFSUB__(v25, v5);
        uint64_t v26 = v25 - v5;
        if (v23) {
          goto LABEL_33;
        }
        v7[2] = v26;
      }
      return (uint64_t)v7;
    }
    if (v6 >= v10) {
      break;
    }
    uint64_t v11 = *(void *)(a1 + 8 * v6 + 32);
    sub_259843F00();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v3 = 0;
    uint64_t v4 = v11;
    ++v6;
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for StoryDiagnosticsUtils()
{
  return self;
}

uint64_t method lookup function for StoryDiagnosticsUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoryDiagnosticsUtils);
}

void type metadata accessor for SurveyFileSectionRepresentation()
{
}

void type metadata accessor for SurveyFileRepresentation()
{
}

unint64_t sub_2597E4AA8()
{
  unint64_t result = qword_26A391D38;
  if (!qword_26A391D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D38);
  }
  return result;
}

unint64_t sub_2597E4AF4()
{
  unint64_t result = qword_26A391D50;
  if (!qword_26A391D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D50);
  }
  return result;
}

unint64_t sub_2597E4B40()
{
  unint64_t result = qword_26A391D60;
  if (!qword_26A391D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D60);
  }
  return result;
}

uint64_t sub_2597E4B8C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2597E4C04()
{
  unint64_t result = qword_26A391D70;
  if (!qword_26A391D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D70);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SurveyFileSectionRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2597E4D1CLL);
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

ValueMetadata *type metadata accessor for SurveyFileSectionRepresentation.CodingKeys()
{
  return &type metadata for SurveyFileSectionRepresentation.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SurveyFileRepresentation.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2597E4DF0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SurveyFileRepresentation.CodingKeys()
{
  return &type metadata for SurveyFileRepresentation.CodingKeys;
}

void type metadata accessor for SurveyFileQuestionRepresentation()
{
}

unint64_t sub_2597E4E38()
{
  unint64_t result = qword_26A391D78;
  if (!qword_26A391D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D78);
  }
  return result;
}

unint64_t sub_2597E4E88()
{
  unint64_t result = qword_26A391D80;
  if (!qword_26A391D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D80);
  }
  return result;
}

unint64_t sub_2597E4ED8()
{
  unint64_t result = qword_26A391D88;
  if (!qword_26A391D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D88);
  }
  return result;
}

unint64_t sub_2597E4F28()
{
  unint64_t result = qword_26A391D90;
  if (!qword_26A391D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D90);
  }
  return result;
}

unint64_t sub_2597E4F78()
{
  unint64_t result = qword_26A391D98;
  if (!qword_26A391D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391D98);
  }
  return result;
}

unint64_t sub_2597E4FC8()
{
  unint64_t result = qword_26A391DA0;
  if (!qword_26A391DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391DA0);
  }
  return result;
}

unint64_t sub_2597E5014()
{
  unint64_t result = qword_26A391DB0;
  if (!qword_26A391DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391DB0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SurveyFileQuestionRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2597E512CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SurveyFileQuestionRepresentation.CodingKeys()
{
  return &type metadata for SurveyFileQuestionRepresentation.CodingKeys;
}

unint64_t sub_2597E5168()
{
  unint64_t result = qword_26A391DB8;
  if (!qword_26A391DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391DB8);
  }
  return result;
}

unint64_t sub_2597E51B8()
{
  unint64_t result = qword_26A391DC0;
  if (!qword_26A391DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391DC0);
  }
  return result;
}

unint64_t sub_2597E5208()
{
  unint64_t result = qword_26A391DC8[0];
  if (!qword_26A391DC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A391DC8);
  }
  return result;
}

uint64_t sub_2597E5254(uint64_t a1)
{
  return a1;
}

uint64_t SummarizationPlanner.__allocating_init(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  SummarizationPlanner.init(with:)(a1, a2);
  return v4;
}

void SummarizationPlanner.adaptiveElection(with:targetNumberOfItems:eligibleItems:)(const char *a1, const char *a2)
{
  uint64_t v3 = v2;
  v194 = a2;
  OUTLINED_FUNCTION_1_106();
  v189 = v5;
  uint64_t v190 = v6;
  uint64_t v8 = *(const char **)(v7 + 88);
  uint64_t v175 = sub_259844DB0();
  OUTLINED_FUNCTION_87();
  uint64_t v174 = v9;
  MEMORY[0x270FA5388](v10);
  v191 = (char *)&v166 - v11;
  uint64_t v183 = sub_259843A00();
  OUTLINED_FUNCTION_87();
  uint64_t v179 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_268();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v16);
  v171 = (char *)&v166 - v17;
  uint64_t v18 = OUTLINED_FUNCTION_9_66();
  OUTLINED_FUNCTION_192();
  uint64_t v169 = sub_259844DB0();
  OUTLINED_FUNCTION_87();
  uint64_t v168 = v19;
  MEMORY[0x270FA5388](v20);
  v173 = (char *)&v166 - v21;
  uint64_t v195 = v18;
  v176 = *(char **)(v18 - 8);
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (char *)&v166 - v23;
  v196 = v8;
  uint64_t v184 = *((void *)v8 - 1);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_268();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v27);
  v193 = (char *)&v166 - v28;
  uint64_t v29 = sub_2598439B0();
  OUTLINED_FUNCTION_87();
  uint64_t v31 = v30;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_268();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_29();
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v166 - v36;
  MEMORY[0x270FA5388](v38);
  int v40 = (char *)&v166 - v39;
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = (char *)&v166 - v42;
  uint64_t v44 = v3 + qword_26A3D2028;
  v192 = a1;
  sub_259843F00();
  sub_2598439A0();
  uint64_t v185 = v44;
  uint64_t v45 = sub_2598439D0();
  LODWORD(v186) = sub_259844C80();
  char v46 = sub_259844D80();
  uint64_t v187 = v29;
  v170 = v37;
  if (v46)
  {
    uint64_t v188 = v31;
    v182 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v182(v40, v43, v187);
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 134218240;
    v199 = (const char *)MEMORY[0x25A2DEE20](v192, v196);
    sub_259844E10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2048;
    v199 = v194;
    uint64_t v48 = v182;
    unint64_t v49 = (v31 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v29 = v187;
    sub_259844E10();
    os_signpost_id_t v50 = sub_259843990();
    _os_signpost_emit_with_name_impl(&dword_25934C000, v45, (os_signpost_type_t)v186, v50, "Planner", "Starting to plan for %ld clusters, targeting %ld items", (uint8_t *)v47, 0x16u);
    OUTLINED_FUNCTION_61_0();

    uint64_t v51 = v188;
    (*(void (**)(char *, uint64_t))(v188 + 8))(v40, v29);
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v51 = v31;
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    unint64_t v49 = (v31 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  v48(v40, v43, v29);
  sub_259843A30();
  swift_allocObject();
  uint64_t v186 = sub_259843A20();
  char v52 = *(void (**)(char *, uint64_t))(v51 + 8);
  uint64_t v188 = v51 + 8;
  v52(v43, v29);
  uint64_t v53 = MEMORY[0x25A2DEE20](v192, v196);
  if (v53 < 2)
  {
    v199 = v192;
    sub_259844630();
    swift_getWitnessTable();
    uint64_t v88 = (uint64_t)v191;
    sub_259844A20();
    __n128 v89 = v196;
    if (__swift_getEnumTagSinglePayload(v88, 1, (uint64_t)v196) == 1)
    {
      OUTLINED_FUNCTION_11();
      v90();
      uint64_t v91 = sub_259843A50();
      os_log_type_t v92 = sub_259844B50();
      if (os_log_type_enabled(v91, v92))
      {
        *(_WORD *)OUTLINED_FUNCTION_41() = 0;
        OUTLINED_FUNCTION_173(&dword_25934C000, v93, v94, "Planner found no clusters");
        OUTLINED_FUNCTION_61_0();
      }

      uint64_t v95 = (void *)OUTLINED_FUNCTION_18_42();
      OUTLINED_FUNCTION_17_48();
      sub_259843A10();
      os_signpost_type_t v96 = sub_259844C70();
      if (sub_259844D80())
      {
        swift_retain();
        sub_259843A40();
        swift_release();
        uint64_t v97 = OUTLINED_FUNCTION_2_86();
        if (v98(v97) != *MEMORY[0x263F90238])
        {
          uint64_t v146 = OUTLINED_FUNCTION_4_85();
          v147(v146);
        }
        *(_WORD *)OUTLINED_FUNCTION_41() = 0;
        os_signpost_id_t v148 = sub_259843990();
        OUTLINED_FUNCTION_11_71(&dword_25934C000, v149, v96, v148, "Planner");
        OUTLINED_FUNCTION_61_0();
      }

      v52((char *)v49, v29);
      sub_259844570();
      swift_release();
    }
    else
    {
      uint64_t v99 = v29;
      uint64_t v100 = v40;
      (*(void (**)(void (*)(char *, uint64_t), uint64_t, const char *))(v184 + 32))(v180, v88, v89);
      uint64_t v101 = OUTLINED_FUNCTION_18_42();
      v102 = (char *)v178;
      sub_259843A10();
      int v103 = sub_259844C70();
      if (sub_259844D80())
      {
        LODWORD(v193) = v103;
        swift_retain();
        uint64_t v104 = v172;
        sub_259843A40();
        swift_release();
        uint64_t v105 = v179;
        uint64_t v106 = v183;
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v179 + 88))(v104, v183) == *MEMORY[0x263F90238])
        {
          char v107 = 0;
          v192 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v104, v106);
          v192 = "Finished planning, planned for %ld items";
          char v107 = 1;
        }
        uint64_t v150 = v178;
        uint64_t v109 = v99;
        v48(v100, (char *)v178, v99);
        v151 = (uint8_t *)swift_slowAlloc();
        uint8_t *v151 = 0;
        v151[1] = v107;
        OUTLINED_FUNCTION_8_76((uint64_t)v151);
        uint64_t v108 = (uint64_t)v194;
        v199 = v194;
        sub_259844E10();
        os_signpost_id_t v152 = sub_259843990();
        _os_signpost_emit_with_name_impl(&dword_25934C000, v101, (os_signpost_type_t)v193, v152, "Planner", v192, v151, 0xCu);
        OUTLINED_FUNCTION_61_0();

        v52((char *)v150, v109);
      }
      else
      {

        uint64_t v100 = v102;
        uint64_t v108 = (uint64_t)v194;
        uint64_t v109 = v99;
      }
      v52(v100, v109);
      uint64_t v153 = v195;
      sub_259845730();
      swift_allocObject();
      sub_259844540();
      uint64_t v155 = v154;
      OUTLINED_FUNCTION_17_48();
      v157 = v180;
      v158 = v196;
      (*(void (**)(uint64_t, void (*)(char *, uint64_t), const char *))(v156 + 16))(v159, v180, v196);
      (*(void (**)(const char *))(*(void *)(v190 + 104) + 16))(v158);
      uint64_t v160 = MEMORY[0x25A2DEE20]();
      swift_bridgeObjectRelease();
      if (v160 >= v108) {
        uint64_t v161 = v108;
      }
      else {
        uint64_t v161 = v160;
      }
      *(void *)(v155 + *(int *)(v153 + 48)) = v161;
      swift_release();
      sub_259844630();
      (*(void (**)(void, const char *))(v49 + 8))(v157, v158);
    }
    return;
  }
  uint64_t v54 = v53;
  v176 = v40;
  v180 = v52;
  uint64_t v55 = sub_2597E6A24();
  id v56 = (const char *)sub_2597E6D4C();
  double v57 = sub_25939CE50(v54, (uint64_t)v56);
  v192 = v56;
  double v58 = sub_2597E67E4();
  v199 = (const char *)v55;
  uint64_t v59 = v195;
  v191 = (char *)sub_259844630();
  swift_getWitnessTable();
  uint64_t v60 = sub_2598443C0();
  swift_bridgeObjectRelease();
  uint64_t v198 = v60;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_259844010();
  uint64_t v198 = (uint64_t)v199;
  OUTLINED_FUNCTION_192();
  sub_259845450();
  swift_getWitnessTable();
  uint64_t v62 = sub_259844640();
  v199 = (const char *)sub_259843E50();
  uint64_t v198 = v62;
  uint64_t v63 = sub_259843F00();
  uint64_t v64 = MEMORY[0x25A2DEE20](v63, v59);
  v182 = v48;
  unint64_t v166 = v49;
  uint64_t v177 = WitnessTable;
  uint64_t v178 = v62;
  if (v64 < 1)
  {
LABEL_51:
    uint64_t v67 = 0;
LABEL_52:
    v197 = v199;
    swift_getWitnessTable();
    if (sub_259844A40())
    {
      v197 = (const char *)v178;
      uint64_t v110 = (uint64_t)v173;
      sub_259844000();
      swift_bridgeObjectRelease();
      uint64_t v111 = v195;
      if (__swift_getEnumTagSinglePayload(v110, 1, v195) == 1)
      {
        OUTLINED_FUNCTION_11();
        v113(v112);
        uint64_t v114 = sub_259843A50();
        os_log_type_t v115 = sub_259844B50();
        BOOL v116 = os_log_type_enabled(v114, v115);
        id v117 = v180;
        if (v116)
        {
          *(_WORD *)OUTLINED_FUNCTION_41() = 0;
          OUTLINED_FUNCTION_173(&dword_25934C000, v118, v119, "Planner found no eligible clusters");
          OUTLINED_FUNCTION_61_0();
        }

        BOOL v120 = (void *)OUTLINED_FUNCTION_18_42();
        uint64_t v121 = v170;
        sub_259843A10();
        os_signpost_type_t v122 = sub_259844C70();
        char v123 = sub_259844D80();
        uint64_t v124 = v187;
        if (v123)
        {
          swift_retain();
          sub_259843A40();
          swift_release();
          uint64_t v125 = OUTLINED_FUNCTION_2_86();
          if (v126(v125) != *MEMORY[0x263F90238])
          {
            uint64_t v162 = OUTLINED_FUNCTION_4_85();
            v163(v162);
          }
          *(_WORD *)OUTLINED_FUNCTION_41() = 0;
          os_signpost_id_t v164 = sub_259843990();
          OUTLINED_FUNCTION_11_71(&dword_25934C000, v165, v122, v164, "Planner");
          OUTLINED_FUNCTION_61_0();
        }

        v117(v121, v124);
        goto LABEL_82;
      }
      uint64_t v127 = *(void *)(v110 + *(int *)(v111 + 48));
      OUTLINED_FUNCTION_17_48();
      uint64_t v129 = v167;
      uint64_t v130 = v196;
      (*(void (**)(uint64_t, uint64_t, const char *))(v128 + 32))(v167, v110, v196);
      if (v127 >= (uint64_t)v194) {
        uint64_t v67 = v194;
      }
      else {
        uint64_t v67 = (const char *)v127;
      }
      uint64_t v131 = *(int *)(v111 + 48);
      (*(void (**)(char *, uint64_t, const char *))(v49 + 16))(v24, v129, v130);
      *(void *)&v24[v131] = v67;
      sub_2598445E0();
      uint64_t v132 = *(void (**)(uint64_t, const char *))(v49 + 8);
      v49 += 8;
      v132(v129, v130);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v133 = (void (*)(uint64_t, uint64_t))v180;
    uint64_t v134 = OUTLINED_FUNCTION_18_42();
    OUTLINED_FUNCTION_17_48();
    sub_259843A10();
    os_signpost_type_t v135 = sub_259844C70();
    if (sub_259844D80())
    {
      swift_retain();
      sub_259843A40();
      swift_release();
      uint64_t v136 = OUTLINED_FUNCTION_2_86();
      if (v137(v136) == *MEMORY[0x263F90238])
      {
        char v138 = 0;
        v196 = "[Error] Interval already ended";
      }
      else
      {
        uint64_t v139 = OUTLINED_FUNCTION_4_85();
        v140(v139);
        v196 = "Finished planning, planning for %ld items";
        char v138 = 1;
      }
      uint64_t v141 = v176;
      unint64_t v142 = v49;
      uint64_t v143 = v187;
      v182(v176, (char *)v142, v187);
      v144 = (uint8_t *)swift_slowAlloc();
      uint8_t *v144 = 0;
      v144[1] = v138;
      OUTLINED_FUNCTION_8_76((uint64_t)v144);
      v197 = v67;
      sub_259844E10();
      os_signpost_id_t v145 = sub_259843990();
      _os_signpost_emit_with_name_impl(&dword_25934C000, v134, v135, v145, "Planner", v196, v144, 0xCu);
      OUTLINED_FUNCTION_61_0();

      v133(v181, v143);
      swift_release();
      v133((uint64_t)v141, v143);
      goto LABEL_83;
    }

    v133(v49, v187);
LABEL_82:
    swift_release();
LABEL_83:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v65 = v64;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  unint64_t v49 = v184 + 32;
  v189 = (void (**)(char *, char *, const char *))(v184 + 16);
  double v68 = 0.0;
  unint64_t v69 = (void (**)(char *, const char *))(v184 + 8);
  uint64_t v71 = v195;
  uint64_t v70 = v196;
  char v72 = v193;
  while (1)
  {
    sub_259844660();
    uint64_t v73 = *(void *)&v24[*(int *)(v71 + 48)];
    (*(void (**)(char *, char *, const char *))v49)(v72, v24, v70);
    if (*(unsigned char *)(v3 + 48) == 1)
    {
      sub_2597E67A0((double)(uint64_t)v192, v57, (double)v73);
      double v75 = v74;
    }
    else
    {
      double v75 = (double)v73;
    }
    char v76 = v194;
    if (__OFSUB__(v194, v67)) {
      break;
    }
    double v77 = v75 / (v58 - v68) * (double)(v194 - v67);
    if ((~*(void *)&v77 & 0x7FF0000000000000) == 0) {
      goto LABEL_85;
    }
    if (v77 <= -9.22337204e18) {
      goto LABEL_86;
    }
    if (v77 >= 9.22337204e18) {
      goto LABEL_87;
    }
    if (v73 < (uint64_t)v77) {
      double v77 = (double)v73;
    }
    double v78 = v77 + 0.0000001;
    if ((~*(void *)&v78 & 0x7FF0000000000000) == 0) {
      goto LABEL_88;
    }
    if (v78 <= -9.22337204e18) {
      goto LABEL_89;
    }
    if (v78 >= 9.22337204e18) {
      goto LABEL_90;
    }
    uint64_t v79 = *(void *)(v3 + 40);
    if (v79 >= (uint64_t)v78) {
      uint64_t v80 = (uint64_t)v78;
    }
    else {
      uint64_t v80 = *(void *)(v3 + 40);
    }
    if (v79 <= 0) {
      uint64_t v81 = (uint64_t)v78;
    }
    else {
      uint64_t v81 = v80;
    }
    if (v81 >= *(void *)(v3 + 32))
    {
      uint64_t v82 = *(int *)(v195 + 48);
      (*v189)(v24, v193, v196);
      *(void *)&v24[v82] = v81;
      sub_2598445E0();
      BOOL v83 = __OFADD__(v67, v81);
      v67 += v81;
      if (v83) {
        goto LABEL_91;
      }
      char v76 = v194;
    }
    uint64_t v71 = v195;
    if ((uint64_t)v67 <= (uint64_t)v76)
    {
      ++v66;
      double v68 = v68 + v75;
      if (v66 != v65) {
        goto LABEL_38;
      }
      uint64_t v86 = sub_259843F00();
      uint64_t v87 = MEMORY[0x25A2DEE20](v86, v71);
      swift_bridgeObjectRelease();
      if (v87)
      {
        uint64_t v66 = v65;
        goto LABEL_38;
      }
    }
    swift_getWitnessTable();
    sub_259844A70();
    uint64_t v84 = *v69;
    (*v69)(v24, v196);
    sub_259844610();
    if (--v65 < 1)
    {
      v84(v193, v196);
      goto LABEL_51;
    }
    if (*(unsigned char *)(v3 + 48) == 1)
    {
      sub_259843F00();
      uint64_t v85 = (const char *)sub_2597E6D4C();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v3 + 49) == 1) {
        double v57 = sub_25939CE50(v65, (uint64_t)v85);
      }
    }
    else
    {
      uint64_t v85 = v192;
    }
    sub_259843F00();
    v192 = v85;
    double v58 = sub_2597E67E4();
    swift_bridgeObjectRelease();
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    double v68 = 0.0;
LABEL_38:
    uint64_t v70 = v196;
    char v72 = v193;
    (*v69)(v193, v196);
    if (v66 >= v65) {
      goto LABEL_52;
    }
  }
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
}

uint64_t SummarizationPlanner.init(with:)(uint64_t a1, uint64_t a2)
{
  if (qword_26A388AB0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_259843A80();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A3D1DB0);
  OUTLINED_FUNCTION_14_57();
  uint64_t v6 = OUTLINED_FUNCTION_16_50();
  v7(v6);
  if (qword_26A388AB8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2598439F0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A3D1DC8);
  OUTLINED_FUNCTION_14_57();
  uint64_t v9 = OUTLINED_FUNCTION_16_50();
  v10(v9);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  *(_OWORD *)(v2 + 32) = xmmword_259885840;
  *(_WORD *)(v2 + 48) = 257;
  *(_OWORD *)(v2 + 56) = xmmword_259885D90;
  return v2;
}

void sub_2597E67A0(double a1, double a2, double a3)
{
  if (a3 > 0.0) {
    atan(a3 / ((a2 + a2) / 3.14159265));
  }
}

double sub_2597E67E4()
{
  OUTLINED_FUNCTION_1_106();
  uint64_t v12 = v1;
  uint64_t v13 = v2;
  uint64_t v14 = v3;
  OUTLINED_FUNCTION_9_66();
  sub_259844630();
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_10_60(WitnessTable, (uint64_t)sub_2597E7114, v5, v6, MEMORY[0x263F8D538], WitnessTable, v7, v8, v10, v11, v0, v12, v13, v14, v15, 0);
  sub_2598443B0();
  return v16;
}

double sub_2597E68AC@<D0>(double *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, double *a6@<X8>, double a7@<D0>)
{
  v25[3] = a5;
  uint64_t v13 = *(void *)(*(void *)a3 + 88);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v15.n128_f64[0] = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v17 = (char *)v25 - v16;
  double v18 = *a1;
  uint64_t v20 = *(int *)(v19 + 56);
  uint64_t v21 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v21 + 16))((char *)v25 - v16, a2, v13, v15);
  uint64_t v22 = *(void *)(a2 + v20);
  *(void *)&v17[v20] = v22;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v13);
  if (a3[48] == 1) {
    sub_2597E67A0((double)a4, a7, (double)v22);
  }
  else {
    double v23 = (double)v22;
  }
  double result = v18 + v23;
  *a6 = result;
  return result;
}

uint64_t sub_2597E6A24()
{
  OUTLINED_FUNCTION_1_106();
  uint64_t v13 = v0;
  v9[2] = *(void *)(v1 + 80);
  long long v10 = *(_OWORD *)(v2 + 88);
  uint64_t v11 = *(void *)(v1 + 104);
  uint64_t v12 = v3;
  OUTLINED_FUNCTION_192();
  uint64_t v4 = sub_259844630();
  OUTLINED_FUNCTION_192();
  uint64_t v5 = OUTLINED_FUNCTION_9_66();
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_25952B548((void (*)(char *, uint64_t))sub_2597E7158, (uint64_t)v9, v4, v5, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v7);
}

uint64_t sub_2597E6B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v13 = a5;
  if (a2)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
    uint64_t v12 = (uint64_t)&v12;
    uint64_t v14 = 0;
    uint64_t v15 = v7;
    MEMORY[0x270FA5388](v7);
    sub_259844630();
    swift_getWitnessTable();
    sub_2598443B0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v16;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
    uint64_t v8 = MEMORY[0x25A2DEE20]();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(int *)(swift_getTupleTypeMetadata2() + 48);
  uint64_t v10 = v13;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(v13, a1, a3);
  *(void *)(v10 + v9) = v8;
  return result;
}

uint64_t sub_2597E6CF0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = sub_259844980();
  if (__OFADD__(v3, result & 1)) {
    __break(1u);
  }
  else {
    *a2 = v3 + (result & 1);
  }
  return result;
}

uint64_t sub_2597E6D4C()
{
  OUTLINED_FUNCTION_1_106();
  uint64_t v11 = *(void *)(v0 + 80);
  long long v12 = *(_OWORD *)(v1 + 88);
  uint64_t v13 = *(void *)(v0 + 104);
  OUTLINED_FUNCTION_9_66();
  sub_259844630();
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_10_60(WitnessTable, (uint64_t)sub_2597E7138, v3, v4, v5, WitnessTable, v6, v7, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, v14, 0);
  sub_2598443B0();
  return v15;
}

uint64_t sub_2597E6E34@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X5>, uint64_t *a4@<X8>)
{
  uint64_t v5 = *a1;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v6 = MEMORY[0x25A2DEE20]();
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 <= v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  *a4 = v8;
  return result;
}

uint64_t SummarizationPlanner.deinit()
{
  swift_release();
  sub_259843A80();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11();
  v1();
  sub_2598439F0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11();
  v2();
  return v0;
}

uint64_t SummarizationPlanner.__deallocating_deinit()
{
  SummarizationPlanner.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2597E6FA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_2597E6FD4()
{
  uint64_t result = sub_259843A80();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2598439F0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for SummarizationPlanner()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for SummarizationPlanner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SummarizationPlanner);
}

uint64_t dispatch thunk of SummarizationPlanner.__allocating_init(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

double sub_2597E7114@<D0>(double *a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  return sub_2597E68AC(a1, a2, *(unsigned char **)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 40), a3, *(double *)(v3 + 32));
}

uint64_t sub_2597E7138@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2597E6E34(a1, *(void *)(v2 + 24), *(void *)(v2 + 40), a2);
}

uint64_t sub_2597E7158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2597E6B14(a1, v2[6], v2[3], v2[5], a2);
}

uint64_t sub_2597E7180@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_2597E6CF0(a1, a2);
}

id SafeAssetAnalyzer.__allocating_init(photoLibrary:computeIsUtilityForMemories:)(void *a1, char a2)
{
  id v5 = objc_allocWithZone(v2);
  return SafeAssetAnalyzer.init(photoLibrary:computeIsUtilityForMemories:)(a1, a2);
}

uint64_t AssetSafetyFlag.description.getter()
{
  uint64_t result = 0x6F6F626174;
  switch(*v0)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_2_87();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_1_107();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_0_74();
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_3_87();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t AssetSafetyFlag.rawValue.getter()
{
  uint64_t result = 0x6F6F626174;
  switch(*v0)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_2_87();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_1_107();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_0_74();
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_3_87();
      break;
    default:
      return result;
  }
  return result;
}

PhotosIntelligence::AssetSafetyFlag_optional __swiftcall AssetSafetyFlag.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_2598454E0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_2597E731C()
{
  return sub_2594F8C18(*v0);
}

uint64_t sub_2597E7324(uint64_t a1)
{
  return sub_259735BCC(a1, *v1);
}

uint64_t sub_2597E732C()
{
  return sub_259737018();
}

PhotosIntelligence::AssetSafetyFlag_optional sub_2597E7334(Swift::String *a1)
{
  return AssetSafetyFlag.init(rawValue:)(*a1);
}

uint64_t sub_2597E7340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AssetSafetyFlag.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2597E7368(char *a1)
{
  return sub_25936F79C(*a1);
}

uint64_t sub_2597E7378()
{
  return sub_259844470();
}

uint64_t sub_2597E73D8()
{
  return sub_259844410();
}

uint64_t static SafeAssetAnalyzer.minimumRequiredSceneAnalysisVersion.getter()
{
  return 100;
}

BOOL static SafeAssetAnalyzer.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SafeAssetAnalyzer.Error.hash(into:)()
{
  return sub_2598458C0();
}

uint64_t SafeAssetAnalyzer.Error.hashValue.getter()
{
  return sub_259845910();
}

uint64_t sub_2597E74C4()
{
  uint64_t v1 = OBJC_IVAR____PNSafeAssetAnalyzer__hiddenPeopleUUIDs;
  if (*(void *)(v0 + OBJC_IVAR____PNSafeAssetAnalyzer__hiddenPeopleUUIDs))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____PNSafeAssetAnalyzer__hiddenPeopleUUIDs);
  }
  else
  {
    swift_getObjectType();
    uint64_t v2 = sub_2597E7544(*(void **)(v0 + OBJC_IVAR____PNSafeAssetAnalyzer_photoLibrary));
    *(void *)(v0 + v1) = v2;
    sub_259843F00();
    swift_bridgeObjectRelease();
  }
  sub_259843F00();
  return v2;
}

uint64_t sub_2597E7544(void *a1)
{
  id v1 = objc_msgSend(a1, sel_librarySpecificFetchOptions);
  sub_25935633C(0, &qword_26B300508);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_259876910;
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  unint64_t v3 = sub_25935626C();
  uint64_t v4 = MEMORY[0x263F8D6C8];
  uint64_t v5 = MEMORY[0x263F8D750];
  *(void *)(v2 + 32) = 1701869940;
  *(void *)(v2 + 40) = 0xE400000000000000;
  *(void *)(v2 + 96) = v4;
  *(void *)(v2 + 104) = v5;
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 72) = -1;
  uint64_t v6 = (void *)sub_259844AB0();
  objc_msgSend(v1, sel_setPredicate_, v6);

  id v7 = objc_msgSend(self, sel_fetchPersonsWithOptions_, v1);
  id v8 = objc_msgSend(v7, sel_fetchedObjects);
  if (!v8)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_21:
    uint64_t v24 = sub_259737700(v14);

    return v24;
  }
  uint64_t v9 = v8;
  sub_25935633C(0, (unint64_t *)&qword_26B2FFA20);
  unint64_t v10 = sub_259844500();

  if (v10 >> 62)
  {
    sub_259843F00();
    uint64_t result = sub_259845460();
    uint64_t v11 = result;
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = sub_259843F00();
  }
  id v25 = v1;
  if (!v11)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRelease_n();
    id v1 = v25;
    goto LABEL_21;
  }
  if (v11 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = MEMORY[0x263F8EE78];
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x25A2DFA20](v13, v10);
      }
      else {
        id v15 = *(id *)(v10 + 8 * v13 + 32);
      }
      uint64_t v16 = v15;
      uint64_t v17 = sub_25944C4E4(v15);
      uint64_t v19 = v18;

      if (v19)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25938553C();
          uint64_t v14 = v22;
        }
        unint64_t v20 = *(void *)(v14 + 16);
        if (v20 >= *(void *)(v14 + 24) >> 1)
        {
          sub_25938553C();
          uint64_t v14 = v23;
        }
        *(void *)(v14 + 16) = v20 + 1;
        uint64_t v21 = v14 + 16 * v20;
        *(void *)(v21 + 32) = v17;
        *(void *)(v21 + 40) = v19;
      }
      ++v13;
    }
    while (v11 != v13);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_2597E7814()
{
  uint64_t v1 = OBJC_IVAR____PNSafeAssetAnalyzer__personOrPetUUIDsWithAvoidFeedback;
  if (*(void *)(v0 + OBJC_IVAR____PNSafeAssetAnalyzer__personOrPetUUIDsWithAvoidFeedback))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____PNSafeAssetAnalyzer__personOrPetUUIDsWithAvoidFeedback);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14F60]), sel_initWithPhotoLibrary_, *(void *)(v0 + OBJC_IVAR____PNSafeAssetAnalyzer_photoLibrary));
    v7[4] = sub_2597E7960;
    v7[5] = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = sub_2597E796C;
    v7[3] = &block_descriptor_40;
    uint64_t v4 = _Block_copy(v7);
    id v5 = objc_msgSend(v3, sel_personUUIDsWithUserFeedbackFilterBlock_, v4);
    _Block_release(v4);

    uint64_t v2 = sub_259844920();
    *(void *)(v0 + v1) = v2;
    sub_259843F00();
    swift_bridgeObjectRelease();
  }
  sub_259843F00();
  return v2;
}

BOOL sub_2597E7960(uint64_t a1)
{
  return a1 == 3;
}

uint64_t sub_2597E796C(uint64_t a1, uint64_t a2)
{
  id v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a2) = v3(a2);
  swift_release();
  return a2 & 1;
}

uint64_t sub_2597E79BC()
{
  uint64_t v0 = sub_259843A80();
  __swift_allocate_value_buffer(v0, qword_26A391E50);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A391E50);
  return sub_259843A60();
}

id SafeAssetAnalyzer.init(photoLibrary:computeIsUtilityForMemories:)(void *a1, char a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____PNSafeAssetAnalyzer__hiddenPeopleUUIDs] = 0;
  *(void *)&v2[OBJC_IVAR____PNSafeAssetAnalyzer__personOrPetUUIDsWithAvoidFeedback] = 0;
  *(void *)&v2[OBJC_IVAR____PNSafeAssetAnalyzer_photoLibrary] = a1;
  v2[OBJC_IVAR____PNSafeAssetAnalyzer_computeIsUtilityForMemories] = a2;
  uint64_t v6 = v2;
  id v7 = a1;
  *(void *)&v6[OBJC_IVAR____PNSafeAssetAnalyzer_knownUtilityOIDs] = sub_2597E7AF8(v7);

  v10.receiver = v6;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

#error "2597E7B34: call analysis failed (funcsize=34)"

void SafeAssetAnalyzer.analyzeAssets(assetUUIDs:session:storyGenerationCache:eventRecorder:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v12 = type metadata accessor for RootEventRecorder.EventState(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (uint64_t)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = *(os_unfair_lock_s **)(a3 + 16);
  uint64_t v15 = a4[3];
  uint64_t v16 = a4[4];
  __swift_project_boxed_opaque_existential_1(a4, v15);
  (*(void (**)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 24))("SafeAssetAnalyzer.analyzeAssets", 31, 2, v15, v16);
  uint64_t v105 = a1;
  uint64_t v17 = sub_25947930C(a1);
  uint64_t v19 = v18;
  if (!*(void *)(v17 + 16))
  {
    swift_bridgeObjectRelease();
    *a5 = a2;
    a5[1] = v19;
    uint64_t v36 = a4[3];
    uint64_t v37 = a4[4];
    __swift_project_boxed_opaque_existential_1(a4, v36);
    uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
    swift_retain();
    v38(v14, v36, v37);
LABEL_39:
    sub_259445924(v14);
    return;
  }
  v102 = a5;
  int v103 = a4;
  uint64_t v106 = a2;
  id v20 = static StoryGenerationUtilities.assetIdentifiersFetchOptions(for:wantsIncrementalChangeDetails:)(*(void **)(v6 + OBJC_IVAR____PNSafeAssetAnalyzer_photoLibrary), 0);
  sub_25935633C(0, &qword_26B300508);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_25987B8A0;
  uint64_t v109 = v17;
  uint64_t v22 = MEMORY[0x263F8D310];
  *(void *)(v21 + 56) = MEMORY[0x263F8D310];
  unint64_t v23 = sub_25935626C();
  *(void *)(v21 + 64) = v23;
  *(void *)(v21 + 32) = 0xD000000000000028;
  *(void *)(v21 + 40) = 0x80000002598576F0;
  uint64_t v24 = MEMORY[0x263F8E4F0];
  uint64_t v25 = MEMORY[0x263F8E538];
  *(void *)(v21 + 96) = MEMORY[0x263F8E4F0];
  *(void *)(v21 + 104) = v25;
  *(_WORD *)(v21 + 72) = 1;
  *(void *)(v21 + 136) = v22;
  *(void *)(v21 + 144) = v23;
  *(void *)(v21 + 112) = 0xD000000000000028;
  *(void *)(v21 + 120) = 0x80000002598576F0;
  *(void *)(v21 + 176) = v24;
  *(void *)(v21 + 184) = v25;
  *(_WORD *)(v21 + 152) = 2;
  *(void *)(v21 + 216) = v22;
  *(void *)(v21 + 224) = v23;
  uint64_t v26 = v109;
  *(void *)(v21 + 192) = 0xD000000000000028;
  *(void *)(v21 + 200) = 0x80000002598576F0;
  *(void *)(v21 + 256) = v24;
  *(void *)(v21 + 264) = v25;
  *(_WORD *)(v21 + 232) = -1;
  uint64_t v27 = (void *)sub_259844AB0();
  objc_msgSend(v20, sel_setInternalPredicate_, v27);

  uint64_t v28 = self;
  id v29 = v20;
  id v30 = sub_2593A2960(v26, (uint64_t)v20, v28);

  if (!v30)
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = v102;
    if (qword_26A388C38 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_259843A80();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A391E50);
    uint64_t v41 = sub_259843A50();
    os_log_type_t v42 = sub_259844B50();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = v29;
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_25934C000, v41, v42, "Asset fetch result is nil, returning what we have from the cache", v44, 2u);
      uint64_t v45 = v44;
      id v29 = v43;
      MEMORY[0x25A2E13A0](v45, -1, -1);
    }

    uint64_t v46 = v106;
    swift_retain();

    uint64_t *v39 = v46;
    v39[1] = v19;
    uint64_t v47 = v103;
    uint64_t v48 = v103[3];
    uint64_t v49 = v103[4];
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  id v101 = v30;
  id v31 = objc_msgSend(v30, sel_fetchedObjects);
  uint64_t v32 = v107;
  id v99 = v29;
  if (v31)
  {
    uint64_t v33 = v31;
    sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
    unint64_t v34 = sub_259844500();

    uint64_t v35 = sub_259466AB0(v34);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v35 = MEMORY[0x263F8EE78];
  }
  uint64_t v50 = *(void *)(v35 + 16);
  uint64_t v51 = MEMORY[0x263F8EE78];
  uint64_t v100 = v14;
  uint64_t v107 = v32;
  if (v50)
  {
    uint64_t v111 = MEMORY[0x263F8EE78];
    sub_2594F1C70();
    uint64_t v52 = v111;
    uint64_t v108 = (uint8_t *)v35;
    uint64_t v53 = (uint64_t *)(v35 + 40);
    do
    {
      uint64_t v54 = *(v53 - 1);
      uint64_t v55 = *v53;
      uint64_t v111 = v52;
      unint64_t v57 = *(void *)(v52 + 16);
      unint64_t v56 = *(void *)(v52 + 24);
      sub_259843F00();
      if (v57 >= v56 >> 1)
      {
        sub_2594F1C70();
        uint64_t v52 = v111;
      }
      v53 += 2;
      *(void *)(v52 + 16) = v57 + 1;
      uint64_t v58 = v52 + 24 * v57;
      *(void *)(v58 + 32) = v54;
      *(void *)(v58 + 40) = v55;
      *(unsigned char *)(v58 + 48) = 1;
      --v50;
    }
    while (v50);
    uint64_t v14 = v100;
    uint64_t v51 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v52 = MEMORY[0x263F8EE78];
  }
  uint64_t v59 = v106;
  sub_25947951C(v52);
  swift_bridgeObjectRelease();
  sub_259737700(v109);
  sub_2597ED0A4();
  uint64_t v61 = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = *(void *)(v61 + 16);
  if (v62)
  {
    uint64_t v111 = v51;
    uint64_t v98 = v61;
    sub_2594F1C70();
    uint64_t v63 = v98;
    uint64_t v64 = v111;
    uint64_t v14 = sub_25975109C(v98);
    int v66 = v65;
    int v68 = v67 & 1;
    uint64_t v108 = (uint8_t *)(v63 + 56);
    while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(v63 + 32))
    {
      if (((*(void *)&v108[((unint64_t)v14 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v14) & 1) == 0) {
        goto LABEL_41;
      }
      if (*(_DWORD *)(v63 + 36) != v66) {
        goto LABEL_42;
      }
      LODWORD(v109) = v68;
      unint64_t v69 = (uint64_t *)(*(void *)(v63 + 48) + 16 * v14);
      uint64_t v70 = *v69;
      uint64_t v59 = v69[1];
      uint64_t v111 = v64;
      unint64_t v72 = *(void *)(v64 + 16);
      unint64_t v71 = *(void *)(v64 + 24);
      sub_259843F00();
      if (v72 >= v71 >> 1)
      {
        sub_2594F1C70();
        uint64_t v63 = v98;
        uint64_t v64 = v111;
      }
      *(void *)(v64 + 16) = v72 + 1;
      uint64_t v73 = v64 + 24 * v72;
      *(void *)(v73 + 32) = v70;
      *(void *)(v73 + 40) = v59;
      *(unsigned char *)(v73 + 48) = 0;
      uint64_t v74 = sub_259750FB4(v14);
      uint64_t v14 = v74;
      int v66 = v75;
      int v68 = v76 & 1;
      if (!--v62)
      {
        sub_2593980EC(v74, v75, v68);
        swift_release();
        uint64_t v14 = v100;
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  swift_release();
  uint64_t v64 = MEMORY[0x263F8EE78];
LABEL_30:
  sub_25947951C(v64);
  uint64_t v77 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v77);
  *(&v97 - 2) = (uint64_t)v101;
  double v78 = v104 + 4;
  uint64_t v79 = v104 + 6;
  os_unfair_lock_lock(v104 + 6);
  uint64_t v80 = v107;
  sub_259475914(v78);
  if (!v80)
  {
    os_unfair_lock_unlock(v79);
    uint64_t v81 = sub_25947930C(v105);
    uint64_t v59 = v82;
    if (!*(void *)(v81 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_37:
      uint64_t v94 = v102;
      uint64_t v93 = v103;
      uint64_t v95 = v101;
      uint64_t v96 = v106;
      swift_retain();

      *uint64_t v94 = v96;
      v94[1] = v59;
      uint64_t v48 = v93[3];
      uint64_t v49 = v93[4];
      uint64_t v47 = v93;
LABEL_38:
      __swift_project_boxed_opaque_existential_1(v47, v48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v14, v48, v49);
      goto LABEL_39;
    }
    if (qword_26A388C38 == -1)
    {
LABEL_33:
      uint64_t v83 = sub_259843A80();
      __swift_project_value_buffer(v83, (uint64_t)qword_26A391E50);
      sub_259843F00();
      uint64_t v84 = sub_259843A50();
      os_log_type_t v85 = sub_259844B50();
      if (os_log_type_enabled(v84, v85))
      {
        uint64_t v109 = v59;
        uint64_t v86 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        uint64_t v111 = v87;
        *(_DWORD *)uint64_t v86 = 136380675;
        uint64_t v108 = v86 + 4;
        uint64_t v88 = sub_259843F00();
        uint64_t v89 = MEMORY[0x25A2DED80](v88, MEMORY[0x263F8D310]);
        unint64_t v91 = v90;
        swift_bridgeObjectRelease();
        uint64_t v59 = v109;
        uint64_t v110 = sub_259356D5C(v89, v91, &v111);
        sub_259844E10();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25934C000, v84, v85, "Could not verify some assets : %{private}s", v86, 0xCu);
        swift_arrayDestroy();
        uint64_t v92 = v87;
        uint64_t v14 = v100;
        MEMORY[0x25A2E13A0](v92, -1, -1);
        MEMORY[0x25A2E13A0](v86, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      goto LABEL_37;
    }
LABEL_43:
    swift_once();
    goto LABEL_33;
  }
  os_unfair_lock_unlock(v79);
  __break(1u);
}

uint64_t sub_2597E84C4(void *a1, void *a2)
{
  id v5 = objc_msgSend(a1, sel_clsSceneClassifications);
  sub_25935633C(0, (unint64_t *)&unk_26B2F8580);
  sub_2595464BC((unint64_t *)&qword_26B2F8590, (unint64_t *)&unk_26B2F8580);
  uint64_t v6 = sub_259844920();

  if (sub_2597E87A8(a1))
  {
    sub_25938796C();
    uint64_t v8 = v7;
    unint64_t v9 = *(void *)(v7 + 16);
    if (v9 >= *(void *)(v7 + 24) >> 1)
    {
      sub_25938796C();
      uint64_t v8 = v16;
    }
    *(void *)(v8 + 16) = v9 + 1;
    *(unsigned char *)(v8 + v9 + 32) = 1;
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  sub_2597E8800(a1, v6);
  char v11 = v10;
  swift_bridgeObjectRelease();
  if (v11)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25938796C();
      uint64_t v8 = v17;
    }
    unint64_t v12 = *(void *)(v8 + 16);
    if (v12 >= *(void *)(v8 + 24) >> 1)
    {
      sub_25938796C();
      uint64_t v8 = v18;
    }
    *(void *)(v8 + 16) = v12 + 1;
    *(unsigned char *)(v8 + v12 + 32) = 0;
  }
  if (sub_2597E8C00(a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25938796C();
      uint64_t v8 = v19;
    }
    unint64_t v13 = *(void *)(v8 + 16);
    if (v13 >= *(void *)(v8 + 24) >> 1)
    {
      sub_25938796C();
      uint64_t v8 = v20;
    }
    *(void *)(v8 + 16) = v13 + 1;
    *(unsigned char *)(v8 + v13 + 32) = 3;
  }
  else if (*(unsigned char *)(v2 + OBJC_IVAR____PNSafeAssetAnalyzer_computeIsUtilityForMemories) == 1)
  {
    sub_2597E8DAC((uint64_t)a1, a2);
  }
  if (sub_2597E8E58(a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25938796C();
      uint64_t v8 = v21;
    }
    unint64_t v14 = *(void *)(v8 + 16);
    if (v14 >= *(void *)(v8 + 24) >> 1)
    {
      sub_25938796C();
      uint64_t v8 = v22;
    }
    *(void *)(v8 + 16) = v14 + 1;
    *(unsigned char *)(v8 + v14 + 32) = 2;
  }
  return v8;
}

id sub_2597E87A8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_clsProcessedSignals);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_isNSFWExplicit);

  return v3;
}

void sub_2597E8800(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel_sceneAnalysisProperties);
  if (!v3) {
    goto LABEL_42;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_sceneAnalysisVersion);

  id v6 = objc_msgSend(objc_allocWithZone((Class)PNAssetSafeForDisplayModelSet), sel_initWithSceneAnalysisVersion_, v5);
  id v33 = objc_msgSend(v6, sel_tabooEventModel);
  id v30 = v6;
  if ((a2 & 0xC000000000000001) != 0)
  {
    sub_259843F00();
    sub_259844F70();
    sub_25935633C(0, (unint64_t *)&unk_26B2F8580);
    sub_2595464BC((unint64_t *)&qword_26B2F8590, (unint64_t *)&unk_26B2F8580);
    sub_259844970();
    a2 = v35;
    uint64_t v32 = v36;
    uint64_t v7 = v37;
    int64_t v8 = v38;
    unint64_t v9 = v39;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v32 = a2 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v9 = v12 & *(void *)(a2 + 56);
    sub_259843F00();
    int64_t v8 = 0;
  }
  int64_t v31 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    int64_t v13 = v8;
    if (a2 < 0)
    {
      if (!sub_259845010()) {
        goto LABEL_40;
      }
      sub_25935633C(0, (unint64_t *)&unk_26B2F8580);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v16 = v34;
      swift_unknownObjectRelease();
      if (!v34) {
        goto LABEL_40;
      }
      goto LABEL_30;
    }
    if (!v9) {
      break;
    }
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v15 = v14 | (v8 << 6);
LABEL_29:
    id v16 = *(id *)(*(void *)(a2 + 48) + 8 * v15);
    if (!v16) {
      goto LABEL_40;
    }
LABEL_30:
    uint64_t v20 = (char *)objc_msgSend(v16, sel_extendedSceneIdentifier);
    BOOL v21 = (unint64_t)(v20 - 2147482871) > 8 || ((1 << (v20 + 9)) & 0x1B1) == 0;
    if (v21
      || (uint64_t v22 = v20,
          (id v23 = objc_msgSend(v33, sel_nodeForSignalIdentifier_, v20)) == 0))
    {
    }
    else
    {
      uint64_t v24 = v23;
      uint64_t v25 = &selRef_highRecallOperatingPoint;
      if ((unint64_t)(v22 - 2147482871) <= 8) {
        uint64_t v25 = off_26544E890[(void)(v22 - 2147482871)];
      }
      [v23 *v25];
      double v27 = v26;
      objc_msgSend(v16, sel_confidence);
      double v29 = v28;

      if (v27 <= v29) {
        goto LABEL_40;
      }
    }
  }
  int64_t v17 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v17 >= v31) {
      goto LABEL_40;
    }
    unint64_t v18 = *(void *)(v32 + 8 * v17);
    ++v8;
    if (!v18)
    {
      int64_t v8 = v13 + 2;
      if (v13 + 2 >= v31) {
        goto LABEL_40;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v8);
      if (!v18)
      {
        int64_t v8 = v13 + 3;
        if (v13 + 3 >= v31) {
          goto LABEL_40;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v8);
        if (!v18)
        {
          int64_t v8 = v13 + 4;
          if (v13 + 4 >= v31) {
            goto LABEL_40;
          }
          unint64_t v18 = *(void *)(v32 + 8 * v8);
          if (!v18)
          {
            int64_t v19 = v13 + 5;
            while (v19 < v31)
            {
              unint64_t v18 = *(void *)(v32 + 8 * v19++);
              if (v18)
              {
                int64_t v8 = v19 - 1;
                goto LABEL_28;
              }
            }
LABEL_40:
            sub_25940CF64();

            return;
          }
        }
      }
    }
LABEL_28:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v8 << 6);
    goto LABEL_29;
  }
  __break(1u);
LABEL_42:
  __break(1u);
}

id sub_2597E8C00(void *a1)
{
  objc_msgSend(a1, sel_clsContentScoreRecomputingIfNeeded_, 0);
  double v3 = v2;
  id result = objc_msgSend(a1, sel_sceneAnalysisProperties);
  if (result)
  {
    id v5 = result;
    int v6 = objc_msgSend(result, sel_sceneAnalysisVersion);

    if (v6 >= 100 && v3 > 0.25)
    {
      id v9 = objc_msgSend(a1, sel_photosInfoPanelExtendedProperties, 0.25);
      id v10 = objc_msgSend(v9, sel_generativeAIType);

      if (!v10) {
        id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInt_, 0);
      }
      if (objc_msgSend(v10, sel_integerValue) == (id)1
        || (id v11 = objc_msgSend(a1, sel_curationProperties),
            unsigned __int8 v12 = objc_msgSend(v11, sel_isDetectedScreenshot),
            v11,
            (v12 & 1) != 0)
        || !objc_msgSend(self, sel_importedAssetInferredRelevant_, a1))
      {
        char v8 = 1;
      }
      else
      {
        id v13 = objc_msgSend(a1, sel_objectID);
        sub_25973D818();
        char v8 = v14;
      }
    }
    else
    {
      char v8 = 1;
    }
    return (id)(v8 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2597E8DAC(uint64_t a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_curationSession);
  id v5 = objc_msgSend(v4, sel_curationModelForAsset_, a1);

  id v6 = objc_msgSend(a2, sel_userFeedbackCalculator);
  id v7 = objc_msgSend(v5, sel_isUtilityForMemoriesWithAsset_userFeedbackCalculator_, a1, v6);

  return v7;
}

uint64_t sub_2597E8E58(void *a1)
{
  id v1 = objc_msgSend(a1, sel_clsFaceInformationSummary);
  if (!v1) {
    return 0;
  }
  if (!sub_2597E962C(v1)) {
    return 0;
  }
  sub_259738360();
  uint64_t v3 = v2;
  id v4 = self;
  uint64_t result = sub_2597E958C(v3, v4);
  if (!result) {
    return 0;
  }
  uint64_t v6 = result;
  int64_t v7 = 0;
  uint64_t v8 = result + 56;
  uint64_t v9 = 1 << *(unsigned char *)(result + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(result + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      goto LABEL_23;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v15 >= v12) {
      goto LABEL_29;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v12) {
        goto LABEL_29;
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v12) {
          goto LABEL_29;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
LABEL_23:
    unint64_t v18 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_259843F00();
    uint64_t v21 = sub_2597E7814();
    sub_25973CE24(v20, v19, v21);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_bridgeObjectRelease();
LABEL_28:
      uint64_t v27 = 1;
LABEL_30:
      swift_release();
      return v27;
    }
    uint64_t v24 = sub_2597E74C4();
    sub_25973CE24(v20, v19, v24);
    char v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_28;
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v12)
  {
LABEL_29:
    uint64_t v27 = 0;
    goto LABEL_30;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_29;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

void sub_2597E905C(unsigned __int16 a1, id a2)
{
  id v3 = objc_msgSend(a2, sel_librarySpecificFetchOptions);
  id v4 = objc_msgSend(self, sel_queryForAssetsInUtilityCollectionWithType_options_, a1, v3);

  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_executeQuery);
    uint64_t v6 = v5;
    if (v5 && (id v7 = objc_msgSend(v5, sel_fetchedObjectIDsSet)) != 0)
    {
      uint64_t v8 = v7;
      sub_25935633C(0, (unint64_t *)&qword_26B300520);
      sub_2595464BC((unint64_t *)&qword_26B300528, (unint64_t *)&qword_26B300520);
      sub_259844920();
    }
    else if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_259845460())
    {
      sub_2593BBED8(MEMORY[0x263F8EE78]);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26A388C38 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_259843A80();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A391E50);
    uint64_t v10 = sub_259843A50();
    os_log_type_t v11 = sub_259844B50();
    if (os_log_type_enabled(v10, v11))
    {
      int64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)int64_t v12 = 136315138;
      type metadata accessor for PHUtilityCollectionType(0);
      uint64_t v14 = sub_259844120();
      sub_259356D5C(v14, v15, &v16);
      sub_259844E10();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25934C000, v10, v11, "Unable to create query for PHUtilityCollectionType %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2E13A0](v13, -1, -1);
      MEMORY[0x25A2E13A0](v12, -1, -1);
    }

    if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_259845460()) {
      sub_2593BBED8(MEMORY[0x263F8EE78]);
    }
  }
}

uint64_t SafeAssetAnalyzer.eligibilityState(asset:curationContext:)(void *a1, void *a2)
{
  uint64_t v3 = sub_2597E84C4(a1, a2);
  char v5 = v4;
  objc_msgSend(a1, sel_clsContentScoreRecomputingIfNeeded_, 0);
  if (v6 >= 0.5)
  {
    uint64_t v8 = *(void *)(v3 + 16);
    swift_bridgeObjectRelease();
    if (v5) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = 1;
    }
    if (v8) {
      return 0;
    }
    else {
      return v9;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

id SafeAssetAnalyzer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SafeAssetAnalyzer.init()()
{
}

id SafeAssetAnalyzer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2597E9568(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
}

uint64_t sub_2597E958C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)sub_259844910();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(a2, sel_uuidsFromLocalIdentifiers_, v3);

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_259844920();

  return v5;
}

uint64_t sub_2597E962C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_faceInformationByPersonLocalIdentifier);

  if (!v2) {
    return 0;
  }
  sub_25935633C(0, &qword_26B2F83E0);
  uint64_t v3 = sub_259843EB0();

  return v3;
}

unint64_t sub_2597E96B8()
{
  unint64_t result = qword_26A391E90;
  if (!qword_26A391E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391E90);
  }
  return result;
}

unint64_t sub_2597E9708()
{
  unint64_t result = qword_26A391E98;
  if (!qword_26A391E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391E98);
  }
  return result;
}

uint64_t dispatch thunk of SafeAssetAnalyzing.analyzeAssets(assetUUIDs:session:storyGenerationCache:eventRecorder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

unsigned char *storeEnumTagSinglePayload for AssetSafetyFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x2597E9848);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetSafetyFlag()
{
  return &type metadata for AssetSafetyFlag;
}

uint64_t type metadata accessor for SafeAssetAnalyzer()
{
  return self;
}

uint64_t method lookup function for SafeAssetAnalyzer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SafeAssetAnalyzer);
}

uint64_t dispatch thunk of SafeAssetAnalyzer.__allocating_init(photoLibrary:computeIsUtilityForMemories:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unsigned char *storeEnumTagSinglePayload for SafeAssetAnalyzer.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2597E999CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SafeAssetAnalyzer.Error()
{
  return &type metadata for SafeAssetAnalyzer.Error;
}

unint64_t sub_2597E99D4()
{
  unint64_t result = qword_26A391EA0;
  if (!qword_26A391EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391EA0);
  }
  return result;
}

uint64_t block_copy_helper_33(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void static StoryGenerationUtilities.momentUUIDByAssetUUID(with:in:using:)()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  long long v28 = *v4;
  if (qword_26A388938 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_26A3D1CA0;
  type metadata accessor for PerformanceMeasure();
  OUTLINED_FUNCTION_102();
  id v6 = v5;
  uint64_t v7 = PerformanceMeasure.init(name:log:)();
  if (*(void *)(v3 + 16))
  {
    MEMORY[0x270FA5388](v7);
    os_unfair_lock_lock((os_unfair_lock_t)(v28 + 24));
    sub_25958945C(&v29);
    os_unfair_lock_unlock((os_unfair_lock_t)(v28 + 24));
    uint64_t v8 = v29;
    sub_259843F00();
    sub_259843F00();
    sub_2597EDB7C();
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (*(void *)(v10 + 16))
    {
      if (qword_26A388940 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_259843A80();
      __swift_project_value_buffer(v11, (uint64_t)qword_26A3D1CA8);
      sub_259843F00();
      swift_retain();
      int64_t v12 = sub_259843A50();
      os_log_type_t v13 = sub_259844B30();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 134218240;
        uint64_t v29 = *(void *)(v8 + 16);
        sub_259844E10();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 2048;
        uint64_t v29 = *(void *)(v10 + 16);
        sub_259844E10();
        swift_release();
        _os_log_impl(&dword_25934C000, v12, v13, "Fetching moment UUIDs found %ld cached momentUUIDs, will fetch for remaining %ld assets", (uint8_t *)v14, 0x16u);
        OUTLINED_FUNCTION_61_0();
      }
      else
      {

        swift_release();
        swift_bridgeObjectRelease();
      }
      uint64_t v24 = static StoryGenerationUtilities.momentUUIDByAssetUUID(with:in:)(v10, v1);
      uint64_t v25 = swift_release();
      MEMORY[0x270FA5388](v25);
      uint64_t v26 = sub_259843F00();
      sub_2597EA4FC(v26, sub_25947531C);
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v29 = v24;
      sub_2597EF908(v8, (uint64_t)sub_2597EFE8C, 0, isUniquelyReferenced_nonNull_native, &v29);
    }
    else
    {
      swift_release();
      if (qword_26A388940 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_259843A80();
      __swift_project_value_buffer(v20, (uint64_t)qword_26A3D1CA8);
      sub_259843F00();
      uint64_t v21 = sub_259843A50();
      os_log_type_t v22 = sub_259844B30();
      if (OUTLINED_FUNCTION_52(v22))
      {
        char v23 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v23 = 134217984;
        uint64_t v29 = *(void *)(v3 + 16);
        sub_259844E10();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25934C000, v21, OS_LOG_TYPE_DEFAULT, "Fetched moment UUIDs for %ld assets out of the cache", v23, 0xCu);
        OUTLINED_FUNCTION_61_0();

LABEL_22:
        sub_2593563FC();
        swift_release();
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (qword_26A388940 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_259843A80();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A3D1CA8);
  uint64_t v16 = (void *)sub_259843A50();
  os_log_type_t v17 = sub_259844B30();
  if (OUTLINED_FUNCTION_52(v17))
  {
    *(_WORD *)OUTLINED_FUNCTION_41() = 0;
    OUTLINED_FUNCTION_5(&dword_25934C000, v18, v19, "No asset UUIDs provided, will not fetch moments");
    OUTLINED_FUNCTION_61_0();
  }

  sub_2593563FC();
  swift_release();
LABEL_23:
  OUTLINED_FUNCTION_13_1();
}

void static StoryGenerationUtilities.momentLocalStartDateByMomentUUID(for:in:using:)()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_72_26();
  uint64_t v3 = sub_259842800();
  OUTLINED_FUNCTION_87();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_180(v7, v76[0]);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2F8390);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_44();
  uint64_t v11 = v9 - v10;
  MEMORY[0x270FA5388](v12);
  unint64_t v14 = (unint64_t)v76 - v13;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAE0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_19_48(v16, v76[0]);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_45_31(v18, v19, v20, v21, v22, v23, v24, v25, v76[0]);
  MEMORY[0x270FA5388](v26);
  long long v28 = (uint64_t *)((char *)v76 - v27);
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_47_30(v30, v31, v32, v33, v34, v35, v36, v37, v76[0]);
  if (!v38)
  {
    if (qword_26A388940 != -1) {
      goto LABEL_53;
    }
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_17_49();
  sub_2597EFE54(v39, &v90);
  OUTLINED_FUNCTION_9_67();
  uint64_t v81 = (int *)(v5 + 4);
  OUTLINED_FUNCTION_41_38((uint64_t)(v5 + 5));
  uint64_t v40 = MEMORY[0x263F8EE80];
  unint64_t v82 = v14;
  uint64_t v77 = v11;
  uint64_t v80 = v28;
  if (!v0) {
    goto LABEL_4;
  }
LABEL_3:
  OUTLINED_FUNCTION_14_58();
  while (1)
  {
    uint64_t v51 = OUTLINED_FUNCTION_53_29();
    OUTLINED_FUNCTION_51_24(*(void *)(*(void *)(v51 - 8) + 72));
    *uint64_t v0 = isUniquelyReferenced_nonNull_native;
    v0[1] = v14;
    sub_2597EFED0((uint64_t)v0, (uint64_t)v28);
    uint64_t v52 = *((int *)v1 + 12);
    uint64_t v53 = v83;
    uint64_t v54 = (uint64_t)v83 + v52;
    uint64_t v55 = (uint64_t)v28 + v52;
    uint64_t isUniquelyReferenced_nonNull_native = *v28;
    uint64_t v56 = v28[1];
    *uint64_t v83 = *v28;
    v53[1] = v56;
    uint64_t v88 = (uint64_t)v53 + v52;
    sub_2594774BC((uint64_t)v28 + v52, v54);
    uint64_t v57 = *((int *)v1 + 12);
    uint64_t v58 = v84;
    uint64_t v59 = (uint64_t)v84 + v57;
    *uint64_t v84 = isUniquelyReferenced_nonNull_native;
    v58[1] = v56;
    sub_2594774BC(v55, (uint64_t)v58 + v57);
    uint64_t v60 = v82;
    uint64_t v1 = (void (**)(uint64_t, unint64_t, uint64_t))&unk_26B2F8390;
    sub_2597AF8C8(v59, v82, (uint64_t *)&unk_26B2F8390);
    sub_259843F00();
    sub_259843F00();
    sub_259477584(v59);
    if (__swift_getEnumTagSinglePayload(v60, 1, v3) == 1)
    {
      sub_2594320A4(v60, (uint64_t *)&unk_26B2F8390);
      sub_259843F00();
      unint64_t v14 = OUTLINED_FUNCTION_35_46();
      uint64_t isUniquelyReferenced_nonNull_native = v61;
      swift_bridgeObjectRelease();
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v89 = v40;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A38B388);
        OUTLINED_FUNCTION_64_28();
        OUTLINED_FUNCTION_62_25();
        v5[4](v11, *(void *)(v40 + 56) + (void)v5[9] * v14, v3);
        sub_259845370();
        swift_bridgeObjectRelease();
        uint64_t v62 = 0;
      }
      else
      {
        uint64_t v62 = 1;
      }
      long long v28 = v80;
      __swift_storeEnumTagSinglePayload(v11, v62, 1, v3);
      swift_bridgeObjectRelease();
      sub_2594320A4(v11, (uint64_t *)&unk_26B2F8390);
      goto LABEL_41;
    }
    uint64_t v1 = v5;
    uint64_t v63 = OUTLINED_FUNCTION_61_23();
    ((void (*)(uint64_t))v5)(v63);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v89 = v40;
    OUTLINED_FUNCTION_35_46();
    OUTLINED_FUNCTION_59_27();
    if (v44) {
      break;
    }
    unint64_t v14 = v64;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A38B388);
    char v65 = OUTLINED_FUNCTION_63_22();
    long long v28 = v80;
    if (v65)
    {
      OUTLINED_FUNCTION_35_46();
      OUTLINED_FUNCTION_125();
      if (!v66)
      {
        sub_2598457D0();
        __break(1u);
        return;
      }
    }
    uint64_t v67 = v89;
    if (v14)
    {
      OUTLINED_FUNCTION_57_30(*(void *)(v89 + 56));
      OUTLINED_FUNCTION_39_38();
      v68();
    }
    else
    {
      OUTLINED_FUNCTION_4_86();
      OUTLINED_FUNCTION_56_20();
      ((void (*)(void))v5)();
      OUTLINED_FUNCTION_302();
      if (v44) {
        goto LABEL_52;
      }
      *(void *)(v67 + 16) = v69;
      sub_259843F00();
    }
    uint64_t v40 = v89;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = v77;
LABEL_41:
    sub_259477584(v88);
    sub_2594320A4((uint64_t)v28, &qword_26A38BAE0);
    uint64_t v0 = v87;
    if (v87) {
      goto LABEL_3;
    }
LABEL_4:
    if (__OFADD__(v86, 1)) {
      goto LABEL_51;
    }
    if (v86 + 1 >= v79) {
      goto LABEL_43;
    }
    OUTLINED_FUNCTION_22_54();
    if (!v42)
    {
      OUTLINED_FUNCTION_12_59();
      if (v43 == v44) {
        goto LABEL_43;
      }
      OUTLINED_FUNCTION_11_72();
      if (!v45)
      {
        OUTLINED_FUNCTION_12_59();
        if (v43 == v44) {
          goto LABEL_43;
        }
        OUTLINED_FUNCTION_11_72();
        if (!v46)
        {
          OUTLINED_FUNCTION_12_59();
          if (v43 == v44) {
            goto LABEL_43;
          }
          OUTLINED_FUNCTION_11_72();
          if (!v47)
          {
            OUTLINED_FUNCTION_12_59();
            if (v43 == v44) {
              goto LABEL_43;
            }
            OUTLINED_FUNCTION_11_72();
            if (!v48)
            {
              OUTLINED_FUNCTION_81_20();
              if (v43 == v44) {
                goto LABEL_43;
              }
              if (!*(void *)(v78 + 8 * v41))
              {
                while (1)
                {
                  OUTLINED_FUNCTION_81_20();
                  if (v43 == v44) {
                    break;
                  }
                  OUTLINED_FUNCTION_34_38();
                  if (v50)
                  {
                    uint64_t v41 = v49 - 1;
                    goto LABEL_26;
                  }
                }
LABEL_43:
                swift_release();
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_13_1();
                return;
              }
            }
          }
        }
      }
    }
LABEL_26:
    OUTLINED_FUNCTION_33_38(v41);
  }
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  swift_once();
LABEL_45:
  uint64_t v70 = sub_259843A80();
  __swift_project_value_buffer(v70, (uint64_t)qword_26A3D1CA8);
  unint64_t v71 = sub_259843A50();
  os_log_type_t v72 = sub_259844B30();
  if (os_log_type_enabled(v71, v72))
  {
    *(_WORD *)OUTLINED_FUNCTION_41() = 0;
    OUTLINED_FUNCTION_173(&dword_25934C000, v73, v74, "No moment UUIDs provided, will not fetch moment local start dates");
    OUTLINED_FUNCTION_61_0();
  }

  OUTLINED_FUNCTION_13_1();
  sub_259843EE0();
}

uint64_t sub_2597EA4FC(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_2597EFE54(a1, v24);
  uint64_t v3 = v24[0];
  uint64_t v25 = v24[1];
  uint64_t v4 = v24[3];
  unint64_t v5 = v24[4];
  int64_t v6 = (unint64_t)(v24[2] + 64) >> 6;
  uint64_t result = sub_259843F00();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v9);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    sub_259843F00();
    sub_259843F00();
    a2(v19, v20, v22, v23);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v4 + 1 >= v6) {
      return swift_release();
    }
    OUTLINED_FUNCTION_22_54();
    if (!v11)
    {
      if (v10 + 1 >= v6) {
        return swift_release();
      }
      if (!*(void *)(v25 + 8 * (v10 + 1)))
      {
        if (v10 + 2 >= v6) {
          return swift_release();
        }
        if (!*(void *)(v25 + 8 * (v10 + 2)))
        {
          if (v10 + 3 >= v6) {
            return swift_release();
          }
          if (!*(void *)(v25 + 8 * (v10 + 3)))
          {
            if (v10 + 4 >= v6) {
              return swift_release();
            }
            if (!*(void *)(v25 + 8 * (v10 + 4)))
            {
              int64_t v12 = v4 + 6;
              while (v12 < v6)
              {
                OUTLINED_FUNCTION_34_38();
                if (v13) {
                  goto LABEL_17;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_17:
    OUTLINED_FUNCTION_21_47();
    unint64_t v5 = v15 & v14;
    unint64_t v9 = v17 + (v16 << 6);
    uint64_t v4 = v16;
  }
  __break(1u);
  return result;
}

void static StoryGenerationUtilities.assetObjectIDs(with:in:using:)()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  long long v30 = *v4;
  unint64_t v5 = (os_unfair_lock_s *)*((void *)v4 + 2);
  if (qword_26A388938 != -1) {
    swift_once();
  }
  int64_t v6 = (void *)qword_26A3D1CA0;
  type metadata accessor for PerformanceMeasure();
  OUTLINED_FUNCTION_102();
  id v7 = v6;
  uint64_t v8 = PerformanceMeasure.init(name:log:)();
  if (*(void *)(v3 + 16))
  {
    MEMORY[0x270FA5388](v8);
    OUTLINED_FUNCTION_70_20();
    os_unfair_lock_lock(v5 + 6);
    sub_2597EFF38((uint64_t *)&v31);
    os_unfair_lock_unlock(v5 + 6);
    uint64_t v9 = v31;
    sub_259843F00();
    sub_25953D428();
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_259843F00();
    sub_259843F00();
    sub_2597EDB7C();
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    if (*(void *)(v13 + 16))
    {
      if (qword_26A388940 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_259843A80();
      __swift_project_value_buffer(v14, (uint64_t)qword_26A3D1CA8);
      OUTLINED_FUNCTION_65_26();
      swift_retain_n();
      sub_259843F00();
      uint64_t v15 = sub_259843A50();
      os_log_type_t v16 = sub_259844B30();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 134218240;
        uint64_t v18 = v1;
        uint64_t v19 = *(void *)(v9 + 16);
        swift_bridgeObjectRelease();
        *(void *)&long long v31 = v19;
        sub_259844E10();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2048;
        uint64_t v20 = *(void *)(v13 + 16);
        swift_release();
        *(void *)&long long v31 = v20;
        uint64_t v1 = v18;
        sub_259844E10();
        swift_release();
        _os_log_impl(&dword_25934C000, v15, v16, "Fetching objectIDs UUIDs found %ld cached objectIDs, will fetch for remaining %ld assets", (uint8_t *)v17, 0x16u);
        OUTLINED_FUNCTION_61_0();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_65_26();
        swift_release_n();
      }
      long long v31 = v30;
      uint64_t v32 = v5;
      sub_2597EC95C(v13, v1, &v31);
      swift_release();
      *(void *)&long long v31 = v11;
      sub_25973F798();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
      if (qword_26A388940 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_259843A80();
      __swift_project_value_buffer(v26, (uint64_t)qword_26A3D1CA8);
      sub_259843F00();
      uint64_t v27 = sub_259843A50();
      os_log_type_t v28 = sub_259844B30();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 134217984;
        OUTLINED_FUNCTION_26_45();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25934C000, v27, v28, "Fetched objectIDs for %ld assets out of the cache", v29, 0xCu);
        OUTLINED_FUNCTION_61_0();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    sub_2593563FC();
    swift_release();
  }
  else
  {
    if (qword_26A388940 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_259843A80();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A3D1CA8);
    uint64_t v22 = (void *)sub_259843A50();
    os_log_type_t v23 = sub_259844B30();
    if (OUTLINED_FUNCTION_52(v23))
    {
      *(_WORD *)OUTLINED_FUNCTION_41() = 0;
      OUTLINED_FUNCTION_5(&dword_25934C000, v24, v25, "No asset UUIDs provided, will not fetch objectIDs");
      OUTLINED_FUNCTION_61_0();
    }

    sub_2593563FC();
    swift_release();
  }
  OUTLINED_FUNCTION_13_1();
}

uint64_t static StoryGenerationUtilities.assetUUIDsByTripUUID(for:in:)(int a1, id a2)
{
  id v2 = objc_msgSend(a2, sel_librarySpecificFetchOptions);
  uint64_t v3 = self;
  uint64_t v4 = sub_259843F00();
  sub_25953BECC(v4, v5, v6, v7, v8, v9, v10, v11, v55, v56, v58, v60, v62, v64, v66, v67, v68, v69, v70,
    v71,
    v72,
    v73,
    v74,
    v75,
    v76,
    v77);
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_2598444E0();
  swift_release();
  uint64_t v57 = v2;
  id v13 = objc_msgSend(v3, sel_fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs_options_, v12, v2);

  uint64_t v14 = sub_259843EB0();
  sub_2597EFE54(v14, &v67);
  uint64_t v63 = v67;
  uint64_t v65 = v70;
  uint64_t v15 = v71;
  uint64_t v59 = v68;
  int64_t v61 = (unint64_t)(v69 + 64) >> 6;
  sub_259843F00();
  uint64_t v16 = MEMORY[0x263F8EE80];
  if (!v15) {
    goto LABEL_3;
  }
LABEL_2:
  OUTLINED_FUNCTION_168();
  uint64_t v18 = v17 | (v65 << 6);
  while (1)
  {
    long long v30 = (uint64_t *)(*(void *)(v63 + 48) + 16 * v18);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    uint64_t v33 = (uint64_t *)(*(void *)(v63 + 56) + 16 * v18);
    uint64_t v35 = *v33;
    uint64_t v34 = v33[1];
    swift_bridgeObjectRetain_n();
    OUTLINED_FUNCTION_65_26();
    swift_bridgeObjectRetain_n();
    swift_isUniquelyReferenced_nonNull_native();
    sub_25939CE90();
    OUTLINED_FUNCTION_178();
    if (__OFADD__(v38, v39)) {
      break;
    }
    unint64_t v40 = v36;
    char v41 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389AF0);
    if (sub_259845350())
    {
      unint64_t v42 = sub_25939CE90();
      if ((v41 & 1) != (v43 & 1)) {
        goto LABEL_41;
      }
      unint64_t v40 = v42;
    }
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
    {
      OUTLINED_FUNCTION_21_14(v16 + 8 * (v40 >> 6));
      uint64_t v45 = (void *)(v44 + 16 * v40);
      *uint64_t v45 = v35;
      v45[1] = v34;
      *(void *)(*(void *)(v16 + 56) + 8 * v40) = MEMORY[0x263F8EE78];
      OUTLINED_FUNCTION_302();
      if (v21) {
        goto LABEL_39;
      }
      *(void *)(v16 + 16) = v46;
      sub_259843F00();
    }
    uint64_t v47 = *(void *)(v16 + 56);
    uint64_t v48 = *(void *)(v47 + 8 * v40);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v47 + 8 * v40) = v48;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25938553C();
      uint64_t v48 = v52;
      *(void *)(v47 + 8 * v40) = v52;
    }
    unint64_t v50 = *(void *)(v48 + 16);
    if (v50 >= *(void *)(v48 + 24) >> 1)
    {
      sub_25938553C();
      uint64_t v48 = v53;
      *(void *)(v47 + 8 * v40) = v53;
    }
    *(void *)(v48 + 16) = v50 + 1;
    uint64_t v51 = v48 + 16 * v50;
    *(void *)(v51 + 32) = v31;
    *(void *)(v51 + 40) = v32;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_65_26();
    swift_bridgeObjectRelease_n();
    if (v15) {
      goto LABEL_2;
    }
LABEL_3:
    if (__OFADD__(v65, 1)) {
      goto LABEL_40;
    }
    if (v65 + 1 >= v61) {
      goto LABEL_37;
    }
    OUTLINED_FUNCTION_22_54();
    if (!v19)
    {
      OUTLINED_FUNCTION_72();
      if (v20 == v21) {
        goto LABEL_37;
      }
      OUTLINED_FUNCTION_71();
      if (!v22)
      {
        OUTLINED_FUNCTION_72();
        if (v20 == v21) {
          goto LABEL_37;
        }
        OUTLINED_FUNCTION_71();
        if (!v23)
        {
          OUTLINED_FUNCTION_72();
          if (v20 == v21) {
            goto LABEL_37;
          }
          OUTLINED_FUNCTION_71();
          if (!v24)
          {
            OUTLINED_FUNCTION_72();
            if (v20 == v21) {
              goto LABEL_37;
            }
            OUTLINED_FUNCTION_71();
            if (!v26)
            {
              if (v25 + 5 >= v61) {
                goto LABEL_37;
              }
              if (!*(void *)(v59 + 8 * (v25 + 5)))
              {
                int64_t v27 = v65 + 7;
                while (v27 < v61)
                {
                  OUTLINED_FUNCTION_34_38();
                  if (v28) {
                    goto LABEL_23;
                  }
                }
LABEL_37:
                swift_release();
                swift_bridgeObjectRelease();

                return v16;
              }
            }
          }
        }
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_55_25();
    uint64_t v65 = v29;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_2598457D0();
  __break(1u);
  return result;
}

uint64_t static StoryGenerationUtilities.assetUUIDsByMomentUUID(for:in:with:)()
{
  static StoryGenerationUtilities.momentUUIDByAssetUUID(with:in:using:)();
  uint64_t v1 = static StoryGenerationUtilities.assetUUIDsByMomentUUID(for:)(v0);
  swift_bridgeObjectRelease();
  return v1;
}

#error "2597EAFF8: call analysis failed (funcsize=130)"

uint64_t static StoryGenerationUtilities.momentByAssetUUID(for:in:using:)(uint64_t a1, id a2)
{
  if (qword_26A388938 != -1) {
    goto LABEL_50;
  }
  while (1)
  {
    uint64_t v4 = (void *)qword_26A3D1CA0;
    type metadata accessor for PerformanceMeasure();
    OUTLINED_FUNCTION_102();
    id v5 = v4;
    PerformanceMeasure.init(name:log:)();
    uint64_t v6 = sub_259843F00();
    sub_259737700(v6);
    static StoryGenerationUtilities.momentUUIDByAssetUUID(with:in:using:)();
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_259843F00();
    uint64_t v68 = v8;
    sub_259738454(v9);
    uint64_t v11 = v10;
    id v12 = objc_msgSend(a2, sel_librarySpecificFetchOptions);
    sub_25935633C(0, &qword_26B300508);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_259876910;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    unint64_t v14 = sub_25935626C();
    OUTLINED_FUNCTION_54_33(v14);
    *(void *)(v13 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F83F0);
    *(void *)(v13 + 104) = sub_259445880();
    *(void *)(v13 + 72) = v11;
    OUTLINED_FUNCTION_32_41();
    uint64_t v15 = (void *)sub_259844AB0();
    objc_msgSend(v12, sel_setPredicate_, v15);

    sub_25935633C(0, &qword_26A38D4F0);
    uint64_t v67 = v12;
    id v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fetchMomentsWithOptions_, v12);
    id v17 = objc_msgSend(v16, sel_fetchedObjects);

    if (!v17) {
      goto LABEL_56;
    }
    sub_25935633C(0, (unint64_t *)&qword_26B2FFA80);
    sub_259844500();

    sub_259592920();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    if (!v19) {
      goto LABEL_56;
    }
    uint64_t v66 = a1;
    if (v19 >> 62) {
      break;
    }
    uint64_t v71 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v71) {
      goto LABEL_55;
    }
    sub_259843F00();
LABEL_7:
    unint64_t v70 = v19 & 0xC000000000000001;
    char v20 = (void *)MEMORY[0x263F8EE80];
    a1 = 4;
    unint64_t v69 = v19;
    while (1)
    {
      id v21 = v70 ? (id)MEMORY[0x25A2DFA20](a1 - 4, v19) : *(id *)(v19 + 8 * a1);
      a2 = v21;
      uint64_t v22 = a1 - 3;
      if (__OFADD__(a1 - 4, 1)) {
        break;
      }
      uint64_t v23 = sub_25944C4E4(v21);
      if (v24)
      {
        uint64_t v25 = v23;
        uint64_t v26 = v24;
        a2 = a2;
        swift_isUniquelyReferenced_nonNull_native();
        sub_25939CE90();
        OUTLINED_FUNCTION_178();
        if (__OFADD__(v29, v30)) {
          goto LABEL_48;
        }
        unint64_t v31 = v27;
        char v32 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A391EA8);
        if (sub_259845350())
        {
          unint64_t v33 = sub_25939CE90();
          if ((v32 & 1) != (v34 & 1)) {
            goto LABEL_59;
          }
          unint64_t v31 = v33;
        }
        if (v32)
        {
          uint64_t v35 = v20[7];

          *(void *)(v35 + 8 * v31) = a2;
        }
        else
        {
          OUTLINED_FUNCTION_54_1((uint64_t)&v20[v31 >> 6]);
          unint64_t v36 = (uint64_t *)(v20[6] + 16 * v31);
          *unint64_t v36 = v25;
          v36[1] = v26;
          *(void *)(v20[7] + 8 * v31) = a2;
          uint64_t v37 = v20[2];
          BOOL v38 = __OFADD__(v37, 1);
          uint64_t v39 = v37 + 1;
          if (v38) {
            goto LABEL_49;
          }
          v20[2] = v39;
          sub_259843F00();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v19 = v69;
      }
      else
      {
      }
      ++a1;
      if (v22 == v71) {
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    swift_once();
  }
  while (2)
  {
    sub_259843F00();
    uint64_t v63 = sub_259845460();
    swift_bridgeObjectRelease();
    if (v63 <= 0)
    {
LABEL_55:
      swift_bridgeObjectRelease();
LABEL_56:
      swift_bridgeObjectRelease();
      sub_259844B50();
      sub_259843960();
      uint64_t v42 = sub_259843EE0();
LABEL_57:

      sub_2593563FC();
      swift_release();
      return v42;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v64 = sub_259845460();
    swift_bridgeObjectRelease();
    uint64_t v71 = v64;
    if (v64) {
      goto LABEL_7;
    }
    char v20 = (void *)MEMORY[0x263F8EE80];
LABEL_24:
    swift_bridgeObjectRelease_n();
    uint64_t v40 = *(void *)(v66 + 16);
    if (!v40)
    {
      uint64_t v42 = MEMORY[0x263F8EE80];
LABEL_46:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_57;
    }
    sub_259843F00();
    char v41 = (uint64_t *)(v66 + 40);
    uint64_t v42 = MEMORY[0x263F8EE80];
    uint64_t v43 = v68;
    while (!*(void *)(v43 + 16))
    {
LABEL_43:
      v41 += 2;
      if (!--v40)
      {
        swift_bridgeObjectRelease();
        goto LABEL_46;
      }
    }
    uint64_t v45 = *(v41 - 1);
    uint64_t v44 = *v41;
    swift_bridgeObjectRetain_n();
    sub_25939CE90();
    if ((v46 & 1) == 0)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_43;
    }
    sub_259843F00();
    swift_bridgeObjectRelease();
    if (!v20[2] || (unint64_t v47 = sub_25939CE90(), (v48 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      goto LABEL_42;
    }
    id v49 = *(id *)(v20[7] + 8 * v47);
    swift_bridgeObjectRelease();
    sub_259843F00();
    id v72 = v49;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v73 = (void *)v42;
    sub_25939CE90();
    OUTLINED_FUNCTION_178();
    unint64_t v19 = v52 + v53;
    if (__OFADD__(v52, v53))
    {
      __break(1u);
      continue;
    }
    break;
  }
  unint64_t v54 = v50;
  char v55 = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A391EA8);
  if (sub_259845350())
  {
    sub_25939CE90();
    OUTLINED_FUNCTION_125();
    if (!v57) {
      goto LABEL_59;
    }
    unint64_t v54 = v56;
  }
  uint64_t v42 = (uint64_t)v73;
  if (v55)
  {
    uint64_t v58 = v73[7];

    *(void *)(v58 + 8 * v54) = v72;
    uint64_t v59 = v72;
    goto LABEL_41;
  }
  v73[(v54 >> 6) + 8] |= 1 << v54;
  uint64_t v60 = (void *)(v73[6] + 16 * v54);
  *uint64_t v60 = v45;
  v60[1] = v44;
  uint64_t v59 = v72;
  *(void *)(v73[7] + 8 * v54) = v72;
  uint64_t v61 = v73[2];
  BOOL v38 = __OFADD__(v61, 1);
  uint64_t v62 = v61 + 1;
  if (!v38)
  {
    v73[2] = v62;
    sub_259843F00();
LABEL_41:

    swift_bridgeObjectRelease_n();
LABEL_42:
    swift_bridgeObjectRelease();
    uint64_t v43 = v68;
    goto LABEL_43;
  }
  __break(1u);
LABEL_59:
  uint64_t result = sub_2598457D0();
  __break(1u);
  return result;
}

uint64_t static StoryGenerationUtilities.assetUUIDsByMomentUUID(for:)(uint64_t a1)
{
  sub_2597EFE54(a1, v48);
  uint64_t v46 = v48[0];
  uint64_t v47 = v48[3];
  unint64_t v1 = v48[4];
  uint64_t v44 = v48[1];
  int64_t v45 = (unint64_t)(v48[2] + 64) >> 6;
  sub_259843F00();
  uint64_t v2 = MEMORY[0x263F8EE80];
  if (!v1) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v3 = __clz(__rbit64(v1));
  v1 &= v1 - 1;
  unint64_t v4 = v3 | (v47 << 6);
  while (1)
  {
    unint64_t v19 = (uint64_t *)(*(void *)(v46 + 48) + 16 * v4);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = (uint64_t *)(*(void *)(v46 + 56) + 16 * v4);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_isUniquelyReferenced_nonNull_native();
    sub_25939CE90();
    OUTLINED_FUNCTION_178();
    if (__OFADD__(v27, v28)) {
      break;
    }
    unint64_t v29 = v25;
    char v30 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A389AF0);
    if (sub_259845350())
    {
      unint64_t v31 = sub_25939CE90();
      if ((v30 & 1) != (v32 & 1)) {
        goto LABEL_41;
      }
      unint64_t v29 = v31;
    }
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      OUTLINED_FUNCTION_21_14(v2 + 8 * (v29 >> 6));
      char v34 = (void *)(v33 + 16 * v29);
      *char v34 = v24;
      v34[1] = v23;
      *(void *)(*(void *)(v2 + 56) + 8 * v29) = MEMORY[0x263F8EE78];
      OUTLINED_FUNCTION_302();
      if (v7) {
        goto LABEL_39;
      }
      *(void *)(v2 + 16) = v35;
      sub_259843F00();
    }
    uint64_t v36 = *(void *)(v2 + 56);
    uint64_t v37 = *(void *)(v36 + 8 * v29);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v36 + 8 * v29) = v37;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25938553C();
      uint64_t v37 = v41;
      *(void *)(v36 + 8 * v29) = v41;
    }
    unint64_t v39 = *(void *)(v37 + 16);
    if (v39 >= *(void *)(v37 + 24) >> 1)
    {
      sub_25938553C();
      uint64_t v37 = v42;
      *(void *)(v36 + 8 * v29) = v42;
    }
    *(void *)(v37 + 16) = v39 + 1;
    uint64_t v40 = v37 + 16 * v39;
    *(void *)(v40 + 32) = v20;
    *(void *)(v40 + 40) = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if (v1) {
      goto LABEL_2;
    }
LABEL_3:
    if (__OFADD__(v47, 1)) {
      goto LABEL_40;
    }
    if (v47 + 1 >= v45) {
      goto LABEL_37;
    }
    OUTLINED_FUNCTION_22_54();
    if (!v5)
    {
      OUTLINED_FUNCTION_141_9();
      if (v6 == v7) {
        goto LABEL_37;
      }
      OUTLINED_FUNCTION_74_23();
      if (!v8)
      {
        OUTLINED_FUNCTION_141_9();
        if (v6 == v7) {
          goto LABEL_37;
        }
        OUTLINED_FUNCTION_74_23();
        if (!v9)
        {
          OUTLINED_FUNCTION_141_9();
          if (v6 == v7) {
            goto LABEL_37;
          }
          OUTLINED_FUNCTION_74_23();
          if (!v10)
          {
            OUTLINED_FUNCTION_141_9();
            if (v6 == v7) {
              goto LABEL_37;
            }
            OUTLINED_FUNCTION_74_23();
            if (!v12)
            {
              if (v11 + 5 >= v45) {
                goto LABEL_37;
              }
              if (!*(void *)(v44 + 8 * (v11 + 5)))
              {
                int64_t v13 = v47 + 7;
                while (v13 < v45)
                {
                  OUTLINED_FUNCTION_34_38();
                  if (v14) {
                    goto LABEL_23;
                  }
                }
LABEL_37:
                swift_release();
                return v2;
              }
            }
          }
        }
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_21_47();
    unint64_t v1 = v16 & v15;
    unint64_t v4 = v18 + (v17 << 6);
    uint64_t v47 = v17;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_2598457D0();
  __break(1u);
  return result;
}

void static StoryGenerationUtilities.momentUniversalDateIntervalByMomentUUID(for:in:using:)()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_72_26();
  uint64_t v2 = (void (*)(void))sub_2598423F0();
  OUTLINED_FUNCTION_87();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_180(v6, v77[0]);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAA8);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_44();
  unint64_t v10 = v8 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v77 - v12;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAE0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_19_48(v15, v77[0]);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_45_31(v17, v18, v19, v20, v21, v22, v23, v24, v77[0]);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (uint64_t *)((char *)v77 - v26);
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_47_30(v29, v30, v31, v32, v33, v34, v35, v36, v77[0]);
  if (!v37)
  {
    if (qword_26A388940 != -1) {
      goto LABEL_53;
    }
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_17_49();
  sub_2597EFE54(v38, &v91);
  OUTLINED_FUNCTION_9_67();
  uint64_t v82 = v4 + 32;
  OUTLINED_FUNCTION_41_38(v4 + 40);
  uint64_t v39 = MEMORY[0x263F8EE80];
  unint64_t v78 = v10;
  uint64_t v83 = isUniquelyReferenced_nonNull_native;
  uint64_t v81 = v27;
  if (!v0) {
    goto LABEL_4;
  }
LABEL_3:
  OUTLINED_FUNCTION_14_58();
  while (1)
  {
    unint64_t v50 = (int *)(OUTLINED_FUNCTION_53_29() - 8);
    OUTLINED_FUNCTION_51_24(*(void *)(*(void *)v50 + 72));
    *uint64_t v0 = isUniquelyReferenced_nonNull_native;
    v0[1] = v10;
    sub_2597EFED0((uint64_t)v0, (uint64_t)v27);
    uint64_t v51 = *(int *)(v1 + 48);
    uint64_t v52 = v84;
    uint64_t v53 = (uint64_t)v84 + v51;
    uint64_t v54 = (uint64_t)v27 + v51;
    uint64_t isUniquelyReferenced_nonNull_native = *v27;
    uint64_t v55 = v27[1];
    *uint64_t v84 = *v27;
    v52[1] = v55;
    uint64_t v89 = (uint64_t)v52 + v51;
    sub_2594774BC((uint64_t)v27 + v51, v53);
    uint64_t v56 = *(int *)(v1 + 48);
    char v57 = v85;
    uint64_t v58 = (uint64_t)v85 + v56;
    *uint64_t v85 = isUniquelyReferenced_nonNull_native;
    v57[1] = v55;
    sub_2594774BC(v54, (uint64_t)v57 + v56);
    uint64_t v59 = v58 + v50[7];
    uint64_t v60 = v83;
    sub_2597AF8C8(v59, v83, &qword_26A38BAA8);
    sub_259843F00();
    sub_259843F00();
    sub_259477584(v58);
    if (__swift_getEnumTagSinglePayload(v60, 1, (uint64_t)v2) == 1)
    {
      sub_2594320A4(v60, &qword_26A38BAA8);
      sub_259843F00();
      unint64_t v10 = OUTLINED_FUNCTION_35_46();
      uint64_t isUniquelyReferenced_nonNull_native = v61;
      swift_bridgeObjectRelease();
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v90 = v39;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A391EB0);
        OUTLINED_FUNCTION_64_28();
        OUTLINED_FUNCTION_62_25();
        uint64_t v1 = v78;
        (*(void (**)(unint64_t, unint64_t, void (*)(void)))(v4 + 32))(v78, *(void *)(v39 + 56) + *(void *)(v4 + 72) * v10, v2);
        sub_259845370();
        swift_bridgeObjectRelease();
        uint64_t v62 = 0;
      }
      else
      {
        uint64_t v62 = 1;
        uint64_t v1 = v78;
      }
      uint64_t v27 = v81;
      __swift_storeEnumTagSinglePayload(v1, v62, 1, (uint64_t)v2);
      swift_bridgeObjectRelease();
      sub_2594320A4(v1, &qword_26A38BAA8);
      goto LABEL_41;
    }
    uint64_t v1 = v4;
    uint64_t v63 = OUTLINED_FUNCTION_61_23();
    uint64_t v65 = v64;
    ((void (*)(uint64_t))v2)(v63);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = v39;
    OUTLINED_FUNCTION_35_46();
    OUTLINED_FUNCTION_59_27();
    if (v43) {
      break;
    }
    unint64_t v10 = v66;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A391EB0);
    if (OUTLINED_FUNCTION_63_22())
    {
      OUTLINED_FUNCTION_35_46();
      OUTLINED_FUNCTION_125();
      if (!v67)
      {
        sub_2598457D0();
        __break(1u);
        return;
      }
    }
    uint64_t v68 = v90;
    if (v10)
    {
      OUTLINED_FUNCTION_57_30(*(void *)(v90 + 56));
      uint64_t v2 = v65;
      OUTLINED_FUNCTION_39_38();
      v69();
    }
    else
    {
      OUTLINED_FUNCTION_4_86();
      OUTLINED_FUNCTION_56_20();
      v2();
      OUTLINED_FUNCTION_302();
      if (v43) {
        goto LABEL_52;
      }
      *(void *)(v68 + 16) = v70;
      sub_259843F00();
      uint64_t v2 = v65;
    }
    uint64_t v39 = v90;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v1;
    uint64_t v27 = v81;
LABEL_41:
    sub_259477584(v89);
    sub_2594320A4((uint64_t)v27, &qword_26A38BAE0);
    uint64_t v0 = v88;
    if (v88) {
      goto LABEL_3;
    }
LABEL_4:
    if (__OFADD__(v87, 1)) {
      goto LABEL_51;
    }
    if (v87 + 1 >= v80) {
      goto LABEL_43;
    }
    OUTLINED_FUNCTION_22_54();
    if (!v41)
    {
      OUTLINED_FUNCTION_12_59();
      if (v42 == v43) {
        goto LABEL_43;
      }
      OUTLINED_FUNCTION_11_72();
      if (!v44)
      {
        OUTLINED_FUNCTION_12_59();
        if (v42 == v43) {
          goto LABEL_43;
        }
        OUTLINED_FUNCTION_11_72();
        if (!v45)
        {
          OUTLINED_FUNCTION_12_59();
          if (v42 == v43) {
            goto LABEL_43;
          }
          OUTLINED_FUNCTION_11_72();
          if (!v46)
          {
            OUTLINED_FUNCTION_12_59();
            if (v42 == v43) {
              goto LABEL_43;
            }
            OUTLINED_FUNCTION_11_72();
            if (!v47)
            {
              OUTLINED_FUNCTION_81_20();
              if (v42 == v43) {
                goto LABEL_43;
              }
              if (!*(void *)(v79 + 8 * v40))
              {
                while (1)
                {
                  OUTLINED_FUNCTION_81_20();
                  if (v42 == v43) {
                    break;
                  }
                  OUTLINED_FUNCTION_34_38();
                  if (v49)
                  {
                    uint64_t v40 = v48 - 1;
                    goto LABEL_26;
                  }
                }
LABEL_43:
                swift_release();
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_13_1();
                return;
              }
            }
          }
        }
      }
    }
LABEL_26:
    OUTLINED_FUNCTION_33_38(v40);
  }
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  swift_once();
LABEL_45:
  uint64_t v71 = sub_259843A80();
  __swift_project_value_buffer(v71, (uint64_t)qword_26A3D1CA8);
  id v72 = sub_259843A50();
  os_log_type_t v73 = sub_259844B30();
  if (os_log_type_enabled(v72, v73))
  {
    *(_WORD *)OUTLINED_FUNCTION_41() = 0;
    OUTLINED_FUNCTION_173(&dword_25934C000, v74, v75, "No moment UUIDs provided, will not fetch moment date intervals");
    OUTLINED_FUNCTION_61_0();
  }

  OUTLINED_FUNCTION_13_1();
  sub_259843EE0();
}

void sub_2597EC190()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = *(void *)v0;
  long long v18 = *(_OWORD *)(v0 + 8);
  if (qword_26A388938 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26A3D1CA0;
  type metadata accessor for PerformanceMeasure();
  OUTLINED_FUNCTION_102();
  id v3 = v2;
  PerformanceMeasure.init(name:log:)();
  if (qword_26A388940 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_259843A80();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A3D1CA8);
  sub_259843F00();
  uint64_t v5 = sub_259843A50();
  os_log_type_t v6 = sub_259844B30();
  if (OUTLINED_FUNCTION_52(v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    OUTLINED_FUNCTION_26_45();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25934C000, v5, (os_log_type_t)v2, "Fetching moment information for %ld moments", v7, 0xCu);
    OUTLINED_FUNCTION_61_0();
  }
  else
  {

    uint64_t v8 = swift_bridgeObjectRelease();
  }
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_70_20();
  os_unfair_lock_lock((os_unfair_lock_t)(v18 + 24));
  sub_259475590((uint64_t *)(v18 + 16), &v19);
  os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 24));
  uint64_t v9 = v19;
  sub_259843F00();
  sub_259843F00();
  sub_2597EDB7C();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_259843F00();
  swift_retain();
  uint64_t v12 = sub_259843A50();
  os_log_type_t v13 = sub_259844B30();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 134218240;
    uint64_t v19 = *(void *)(v9 + 16);
    sub_259844E10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2048;
    uint64_t v19 = *(void *)(v11 + 16);
    sub_259844E10();
    swift_release();
    _os_log_impl(&dword_25934C000, v12, v13, "Fetching moment local start dates found %ld cached momentUUIDs, will fetch for remaining %ld moments", (uint8_t *)v14, 0x16u);
    OUTLINED_FUNCTION_61_0();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v11 + 16))
  {
    uint64_t v19 = v1;
    long long v20 = v18;
    sub_2597EC520();
    uint64_t v16 = v15;
    swift_release();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = v16;
    sub_2597EFB18(v9, (uint64_t)sub_2594768A0, 0, isUniquelyReferenced_nonNull_native, &v19);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
  sub_2593563FC();
  swift_release();
  OUTLINED_FUNCTION_13_1();
}

void sub_2597EC520()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  id v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for MomentInformation();
  uint64_t v56 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_44();
  uint64_t v9 = v7 - v8;
  double v11 = MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (char *)&v53 - v12;
  uint64_t v14 = *(void *)(v1 + 8);
  id v15 = objc_msgSend(v3, sel_librarySpecificFetchOptions, v11);
  sub_25935633C(0, &qword_26B300508);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_259876910;
  *(void *)(v16 + 56) = MEMORY[0x263F8D310];
  unint64_t v17 = sub_25935626C();
  OUTLINED_FUNCTION_54_33(v17);
  *(void *)(v16 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F83F0);
  *(void *)(v16 + 104) = sub_259445880();
  *(void *)(v16 + 72) = v5;
  sub_259843F00();
  OUTLINED_FUNCTION_32_41();
  long long v18 = (void *)sub_259844AB0();
  objc_msgSend(v15, sel_setPredicate_, v18);

  sub_25935633C(0, &qword_26A38D4F0);
  id v19 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fetchMomentsWithOptions_, v15);
  uint64_t v20 = (uint64_t)objc_msgSend(v19, sel_count);
  if (v20 < 0)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    sub_2598457D0();
    __break(1u);
    return;
  }
  uint64_t v21 = v20;
  uint64_t v53 = v14;
  id v54 = v15;
  if (v20)
  {
    uint64_t v22 = 0;
    uint64_t v23 = MEMORY[0x263F8EE80];
    uint64_t v24 = &selRef_interestingPersonsFromPersons_updateBlock_;
    uint64_t v55 = v20;
    while (v21 != v22)
    {
      id v25 = objc_msgSend(v19, v24[166], v22);
      self;
      uint64_t v26 = swift_dynamicCastObjCClass();
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        id v28 = v25;
        uint64_t v29 = sub_2593A2A4C(v27);
        if (v30)
        {
          uint64_t v31 = v29;
          uint64_t v32 = v30;
          id v57 = v28;
          sub_2594749C0(v27, (uint64_t)v13);
          sub_2594774BC((uint64_t)v13, v9);
          swift_isUniquelyReferenced_nonNull_native();
          uint64_t v58 = v31;
          uint64_t v59 = v23;
          uint64_t v33 = v32;
          sub_25939CE90();
          OUTLINED_FUNCTION_178();
          if (__OFADD__(v36, v37)) {
            goto LABEL_23;
          }
          unint64_t v38 = v34;
          char v39 = v35;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAD8);
          char v40 = sub_259845350();
          uint64_t v21 = v55;
          if (v40)
          {
            unint64_t v41 = sub_25939CE90();
            if ((v39 & 1) != (v42 & 1)) {
              goto LABEL_26;
            }
            unint64_t v38 = v41;
          }
          uint64_t v23 = v59;
          if (v39)
          {
            uint64_t v43 = OUTLINED_FUNCTION_46_32();
            sub_259477520(v43, v44);
          }
          else
          {
            OUTLINED_FUNCTION_54_1(v59 + 8 * (v38 >> 6));
            uint64_t v45 = (uint64_t *)(*(void *)(v23 + 48) + 16 * v38);
            *uint64_t v45 = v58;
            v45[1] = v33;
            uint64_t v46 = OUTLINED_FUNCTION_46_32();
            sub_259477458(v46, v47);
            uint64_t v48 = *(void *)(v23 + 16);
            BOOL v49 = __OFADD__(v48, 1);
            uint64_t v50 = v48 + 1;
            if (v49) {
              goto LABEL_24;
            }
            *(void *)(v23 + 16) = v50;
            sub_259843F00();
          }

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v20 = sub_259477584((uint64_t)v13);
          uint64_t v24 = &selRef_interestingPersonsFromPersons_updateBlock_;
        }
        else
        {
        }
      }
      else
      {
      }
      if (v21 == ++v22) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v23 = MEMORY[0x263F8EE80];
LABEL_21:
  MEMORY[0x270FA5388](v20);
  *(&v53 - 2) = v23;
  uint64_t v51 = (uint64_t *)(v53 + 16);
  uint64_t v52 = (os_unfair_lock_s *)(v53 + 24);
  sub_259843F00();
  os_unfair_lock_lock(v52);
  sub_2594754F0(v51);
  os_unfair_lock_unlock(v52);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_13_1();
}

#error "2597EC9A8: call analysis failed (funcsize=162)"

void sub_2597ECC10()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_60_27(*MEMORY[0x263EF8340]);
  if (!v3)
  {
    swift_release();
    goto LABEL_53;
  }
  uint64_t v4 = v2;
  if ((v2 & 0xC000000000000001) != 0)
  {
    sub_259843F00();
    sub_259844F70();
    sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
    sub_25946F668();
    sub_259844970();
    uint64_t v4 = v46;
    uint64_t v5 = v47;
    uint64_t v7 = v48;
    int64_t v6 = v49;
    unint64_t v8 = v50;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v5 = v2 + 56;
    uint64_t v7 = ~v9;
    uint64_t v10 = -v9;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v8 = v11 & *(void *)(v2 + 56);
    sub_259843F00();
    int64_t v6 = 0;
  }
  uint64_t v41 = v4;
  uint64_t v42 = v5;
  uint64_t v43 = v7;
  int64_t v44 = v6;
  unint64_t v45 = v8;
  uint64_t v12 = (char *)(v1 + 56);
  if (v4 < 0) {
    goto LABEL_15;
  }
LABEL_10:
  if (v8)
  {
    uint64_t v5 = (v8 - 1) & v8;
    unint64_t v13 = __clz(__rbit64(v8)) | (v6 << 6);
LABEL_12:
    uint64_t v7 = *(void *)(*(void *)(v4 + 48) + 8 * v13);
    id v14 = (id)v7;
    goto LABEL_13;
  }
  int64_t v26 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    __break(1u);
  }
  int64_t v27 = (unint64_t)(v7 + 64) >> 6;
  if (v26 >= v27)
  {
    OUTLINED_FUNCTION_77_15();
    goto LABEL_13;
  }
  unint64_t v28 = *(void *)(v42 + 8 * v26);
  if (v28)
  {
LABEL_28:
    uint64_t v5 = (v28 - 1) & v28;
    unint64_t v13 = __clz(__rbit64(v28)) + (v26 << 6);
    int64_t v6 = v26;
    goto LABEL_12;
  }
  int64_t v29 = v6 + 2;
  if (v6 + 2 >= v27) {
    goto LABEL_44;
  }
  unint64_t v28 = *(void *)(v42 + 8 * v29);
  if (v28)
  {
LABEL_32:
    int64_t v26 = v29;
    goto LABEL_28;
  }
  if (v6 + 3 >= v27) {
    goto LABEL_45;
  }
  unint64_t v28 = *(void *)(v42 + 8 * (v6 + 3));
  if (v28)
  {
    int64_t v26 = v6 + 3;
    goto LABEL_28;
  }
  int64_t v29 = v6 + 4;
  if (v6 + 4 < v27)
  {
    unint64_t v28 = *(void *)(v42 + 8 * v29);
    if (v28) {
      goto LABEL_32;
    }
    int64_t v26 = v6 + 5;
    if (v6 + 5 < v27)
    {
      unint64_t v28 = *(void *)(v42 + 8 * v26);
      if (v28) {
        goto LABEL_28;
      }
      int64_t v30 = v6 + 6;
      while (v30 < v27)
      {
        unint64_t v28 = *(void *)(v42 + 8 * v30++);
        if (v28)
        {
          int64_t v26 = v30 - 1;
          goto LABEL_28;
        }
      }
LABEL_44:
      OUTLINED_FUNCTION_77_15();
      int64_t v6 = v31;
      goto LABEL_13;
    }
LABEL_45:
    OUTLINED_FUNCTION_77_15();
    int64_t v6 = v32;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_77_15();
  int64_t v6 = v33;
LABEL_13:
  int64_t v44 = v6;
  unint64_t v45 = v5;
  if (!v7)
  {
LABEL_54:
    sub_25940CF64();
LABEL_53:
    OUTLINED_FUNCTION_36_36();
    OUTLINED_FUNCTION_13_1();
    return;
  }
  while (1)
  {
    uint64_t v5 = v7;
    uint64_t v16 = sub_259844D20();
    uint64_t v17 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v18 = v16 & ~v17;
    OUTLINED_FUNCTION_82_22();
    if (v19) {
      break;
    }
LABEL_23:

    uint64_t v4 = v41;
    uint64_t v7 = v43;
    int64_t v6 = v44;
    unint64_t v8 = v45;
    if ((v41 & 0x8000000000000000) == 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v15 = sub_259845010();
    if (v15)
    {
      uint64_t v39 = v15;
      sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v7 = v40;
      swift_unknownObjectRelease();
      if (v40) {
        continue;
      }
    }
    goto LABEL_54;
  }
  uint64_t v5 = sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
  id v20 = *(id *)(*(void *)(v1 + 48) + 8 * v18);
  char v21 = sub_259844D30();

  if ((v21 & 1) == 0)
  {
    uint64_t v22 = ~v17;
    do
    {
      uint64_t v18 = (v18 + 1) & v22;
      OUTLINED_FUNCTION_82_22();
      if ((v23 & 1) == 0) {
        goto LABEL_23;
      }
      id v24 = *(id *)(*(void *)(v1 + 48) + 8 * v18);
      char v25 = sub_259844D30();
    }
    while ((v25 & 1) == 0);
  }

  OUTLINED_FUNCTION_69_24();
  uint64_t v36 = 8 * (v35 >> 6);
  if (v37 >= 0xE)
  {
    uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
    if (!isStackAllocationSafe)
    {
      unint64_t v38 = (void *)swift_slowAlloc();
      OUTLINED_FUNCTION_67_25(v38);
      OUTLINED_FUNCTION_27_38();
      OUTLINED_FUNCTION_143();
      if (v1 != -56) {
        goto LABEL_57;
      }
      sub_25940CF64();
      OUTLINED_FUNCTION_61_0();
      goto LABEL_53;
    }
  }
  MEMORY[0x270FA5388](isStackAllocationSafe);
  OUTLINED_FUNCTION_67_25((char *)&v39 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_27_38();
  OUTLINED_FUNCTION_6_77();
  if (v1 == -56)
  {
    sub_25940CF64();
    goto LABEL_53;
  }
  uint64_t v12 = (char *)&v39 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0);
  swift_willThrow();

  __break(1u);
LABEL_57:

  OUTLINED_FUNCTION_61_0();
  __break(1u);
}

void sub_2597ED0A4()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_60_27(*MEMORY[0x263EF8340]);
  if (!v3)
  {
    swift_release();
    goto LABEL_28;
  }
  v25[11] = v2;
  uint64_t v4 = *(void *)(v2 + 16);
  if (!v4) {
    goto LABEL_28;
  }
  v25[0] = v2 + 32;
  sub_259843F00();
  uint64_t v5 = 0;
  while (1)
  {
    int64_t v6 = (uint64_t *)(v25[0] + 16 * v5);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    ++v5;
    sub_2598458B0();
    sub_259843F00();
    sub_2598441C0();
    uint64_t v9 = sub_259845910();
    uint64_t v10 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v11 = v9 & ~v10;
    OUTLINED_FUNCTION_3_88();
    if (v12) {
      break;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (v5 == v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
  }
  uint64_t v13 = *(void *)(v1 + 48);
  id v14 = (void *)(v13 + 16 * v11);
  BOOL v15 = *v14 == v8 && v14[1] == v7;
  if (!v15 && (sub_259845750() & 1) == 0)
  {
    uint64_t v16 = ~v10;
    while (1)
    {
      uint64_t v11 = (v11 + 1) & v16;
      OUTLINED_FUNCTION_3_88();
      if ((v17 & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v18 = (void *)(v13 + 16 * v11);
      BOOL v19 = *v18 == v8 && v18[1] == v7;
      if (v19 || (sub_259845750() & 1) != 0)
      {
        uint64_t v26 = v5;
        uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
  }
  uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
  uint64_t v26 = v5;
LABEL_22:
  char v21 = *(unsigned char *)(v1 + 32);
  uint64_t v22 = (void *)((unint64_t)((1 << v21) + 63) >> 6);
  if ((v21 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    char v23 = (void *)OUTLINED_FUNCTION_68_24((uint64_t)v25);
    OUTLINED_FUNCTION_67_25(v23);
    OUTLINED_FUNCTION_23_53();
    OUTLINED_FUNCTION_6_77();
    if (v1 == -56)
    {
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    OUTLINED_FUNCTION_66_25();

    __break(1u);
LABEL_31:

    OUTLINED_FUNCTION_61_0();
    __break(1u);
  }
  else
  {
    id v24 = (void *)swift_slowAlloc();
    OUTLINED_FUNCTION_67_25(v24);
    OUTLINED_FUNCTION_23_53();
    OUTLINED_FUNCTION_143();
    if (v1 != -56) {
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_61_0();
LABEL_28:
    OUTLINED_FUNCTION_36_36();
    OUTLINED_FUNCTION_13_1();
  }
}

void sub_2597ED310()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v2 = v1;
  if (!*(void *)(v1 + 16))
  {
    swift_release();
    goto LABEL_51;
  }
  uint64_t v3 = (void *)v0;
  uint64_t v49 = v0 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(v0 + 32);
  uint64_t v47 = ~v4;
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v0 + 56);
  int64_t v48 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (void *)(v1 + 56);
  sub_259843F00();
  uint64_t v8 = 0;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v25 = *(void *)(v3[6] + 16 * v10 + 8);
    sub_2598458B0();
    sub_259843F00();
    sub_2598441C0();
    uint64_t v26 = sub_259845910();
    uint64_t v27 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v28 = v26 & ~v27;
    OUTLINED_FUNCTION_3_88();
    if (v29) {
      break;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_6;
    }
LABEL_7:
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_55;
    }
    if (v8 + 1 >= v48) {
      goto LABEL_47;
    }
    OUTLINED_FUNCTION_22_54();
    if (!v11)
    {
      OUTLINED_FUNCTION_80_23();
      if (v12 == v13) {
        goto LABEL_47;
      }
      OUTLINED_FUNCTION_78_22();
      if (!v14)
      {
        OUTLINED_FUNCTION_80_23();
        if (v12 == v13) {
          goto LABEL_47;
        }
        OUTLINED_FUNCTION_78_22();
        if (!v15)
        {
          OUTLINED_FUNCTION_80_23();
          if (v12 == v13) {
            goto LABEL_47;
          }
          OUTLINED_FUNCTION_78_22();
          if (!v17)
          {
            int64_t v18 = v16 + 4;
            if (v18 >= v48) {
              goto LABEL_47;
            }
            if (!*(void *)(v49 + 8 * v18))
            {
              while (!__OFADD__(v18, 1))
              {
                OUTLINED_FUNCTION_80_23();
                if (v12 == v13) {
                  goto LABEL_47;
                }
                OUTLINED_FUNCTION_78_22();
                int64_t v18 = v19 + 1;
                if (v20) {
                  goto LABEL_25;
                }
              }
LABEL_55:
              __break(1u);
            }
          }
        }
      }
    }
LABEL_25:
    OUTLINED_FUNCTION_21_47();
    unint64_t v6 = v22 & v21;
    unint64_t v10 = v24 + (v23 << 6);
    uint64_t v8 = v23;
  }
  OUTLINED_FUNCTION_16_51();
  BOOL v31 = v31 && v30 == v25;
  if (v31 || (OUTLINED_FUNCTION_13_62() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_43_25();
  }
  else
  {
    uint64_t v32 = ~v27;
    do
    {
      uint64_t v28 = (v28 + 1) & v32;
      OUTLINED_FUNCTION_3_88();
      if ((v33 & 1) == 0) {
        goto LABEL_40;
      }
      OUTLINED_FUNCTION_16_51();
      BOOL v35 = v31 && v34 == v25;
    }
    while (!v35 && (OUTLINED_FUNCTION_13_62() & 1) == 0);
    OUTLINED_FUNCTION_43_25();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_77();
  if (v37 && (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), !isStackAllocationSafe))
  {
    uint64_t v46 = (void *)swift_slowAlloc();
    memcpy(v46, (const void *)(v2 + 56), v6);
    OUTLINED_FUNCTION_31_37();
    OUTLINED_FUNCTION_143();
    if (v2 == -56)
    {
      sub_25940CF64();
      OUTLINED_FUNCTION_61_0();
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v38 = MEMORY[0x270FA5388](isStackAllocationSafe);
    OUTLINED_FUNCTION_10_61(v38, v39, v40, v41, v42, v43, v44, v45, v47);
    OUTLINED_FUNCTION_31_37();
    OUTLINED_FUNCTION_6_77();
    if (v2 == -56)
    {
LABEL_47:
      sub_25940CF64();
LABEL_51:
      OUTLINED_FUNCTION_36_36();
      OUTLINED_FUNCTION_13_1();
      return;
    }
    OUTLINED_FUNCTION_66_25();

    __break(1u);
  }

  OUTLINED_FUNCTION_61_0();
  __break(1u);
}

void sub_2597ED650()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_60_27(*MEMORY[0x263EF8340]);
  if (!v3)
  {
    swift_release();
    goto LABEL_34;
  }
  uint64_t v4 = v2;
  uint64_t v5 = 0;
  uint64_t v7 = v2 + 56;
  uint64_t v6 = *(void *)(v2 + 56);
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  v29[0] = ~v8;
  if (-v8 < 64) {
    uint64_t v9 = ~(-1 << -(char)v8);
  }
  else {
    uint64_t v9 = -1;
  }
  uint64_t v10 = v9 & v6;
  int64_t v11 = (unint64_t)(63 - v8) >> 6;
  char v12 = (char *)(v1 + 56);
  while (1)
  {
    do
    {
      if (v10)
      {
        OUTLINED_FUNCTION_168();
        uint64_t v14 = v13 | (v5 << 6);
        goto LABEL_23;
      }
      int64_t v15 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_36;
      }
      if (v15 >= v11) {
        goto LABEL_33;
      }
      if (!*(void *)(v7 + 8 * v15))
      {
        if (v5 + 2 >= v11) {
          goto LABEL_33;
        }
        if (!*(void *)(v7 + 8 * (v5 + 2)))
        {
          if (v5 + 3 >= v11) {
            goto LABEL_33;
          }
          if (!*(void *)(v7 + 8 * (v5 + 3)))
          {
            if (v5 + 4 >= v11) {
              goto LABEL_33;
            }
            if (!*(void *)(v7 + 8 * (v5 + 4)))
            {
              uint64_t v16 = v5 + 5;
              if (v5 + 5 < v11)
              {
                if (!*(void *)(v7 + 8 * v16))
                {
                  while (1)
                  {
                    int64_t v17 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      break;
                    }
                    if (v17 >= v11) {
                      goto LABEL_33;
                    }
                    ++v16;
                    if (*(void *)(v7 + 8 * v17)) {
                      goto LABEL_22;
                    }
                  }
LABEL_36:
                  __break(1u);
                }
                goto LABEL_22;
              }
LABEL_33:
              sub_259843F00();
              sub_25940CF64();
LABEL_34:
              OUTLINED_FUNCTION_36_36();
              OUTLINED_FUNCTION_13_1();
              return;
            }
          }
        }
      }
LABEL_22:
      OUTLINED_FUNCTION_55_25();
      uint64_t v5 = v18;
LABEL_23:
      uint64_t v19 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
      uint64_t v20 = sub_2598458A0();
      uint64_t v21 = -1 << *(unsigned char *)(v1 + 32);
      unint64_t v22 = v20 & ~v21;
    }
    while (((*(void *)&v12[(v22 >> 3) & 0xFFFFFFFFFFFFFF8] >> v22) & 1) == 0);
    uint64_t v23 = *(void *)(v1 + 48);
    if (*(void *)(v23 + 8 * v22) == v19) {
      break;
    }
    while (1)
    {
      unint64_t v22 = (v22 + 1) & ~v21;
      if (((*(void *)&v12[(v22 >> 3) & 0xFFFFFFFFFFFFFF8] >> v22) & 1) == 0) {
        break;
      }
      if (*(void *)(v23 + 8 * v22) == v19) {
        goto LABEL_27;
      }
    }
  }
LABEL_27:
  v29[2] = v4;
  v29[3] = v7;
  v29[4] = v29[0];
  v29[5] = v5;
  v29[6] = v10;
  unint64_t v24 = (unint64_t)(63 - v21) >> 6;
  size_t v25 = 8 * v24;
  uint64_t isStackAllocationSafe = sub_259843F00();
  if (v24 < 0x81 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)v29 - v27, (const void *)(v1 + 56), v25);
    OUTLINED_FUNCTION_25_49();
    OUTLINED_FUNCTION_6_77();
    if (!v24)
    {
      sub_25940CF64();
      goto LABEL_34;
    }
    unint64_t v24 = v1 + 56;
    swift_willThrow();

    __break(1u);
  }
  else
  {
    uint64_t v28 = (void *)swift_slowAlloc();
    memcpy(v28, (const void *)(v1 + 56), v25);
    OUTLINED_FUNCTION_25_49();
    swift_release();
  }

  OUTLINED_FUNCTION_61_0();
  __break(1u);
}

void sub_2597ED974()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_60_27(*MEMORY[0x263EF8340]);
  if (!v3)
  {
    swift_release();
    goto LABEL_16;
  }
  uint64_t v19 = v2;
  uint64_t v4 = *(void *)(v2 + 16);
  if (!v4)
  {
LABEL_16:
    OUTLINED_FUNCTION_36_36();
    OUTLINED_FUNCTION_13_1();
    return;
  }
  uint64_t v5 = 0;
  uint64_t v6 = v1 + 56;
  uint64_t v7 = v2 + 32;
  uint64_t v18 = -1 << *(unsigned char *)(v1 + 32);
  uint64_t v8 = ~v18;
  while (1)
  {
    uint64_t v9 = *(void *)(v7 + 8 * v5++);
    uint64_t v10 = sub_2598458A0();
    unint64_t v11 = v10 & v8;
    if ((*(void *)(v6 + (((v10 & (unint64_t)v8) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (v10 & v8))) {
      break;
    }
LABEL_7:
    if (v5 == v4) {
      goto LABEL_16;
    }
  }
  while (*(void *)(*(void *)(v1 + 48) + 8 * v11) != v9)
  {
    unint64_t v11 = (v11 + 1) & v8;
    if (((*(void *)(v6 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
      goto LABEL_7;
    }
  }
  uint64_t v20 = v5;
  unint64_t v12 = (unint64_t)(63 - v18) >> 6;
  uint64_t isStackAllocationSafe = sub_259843F00();
  if (v12 < 0x81 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    int64_t v15 = (char *)&v17 - v14;
    memcpy((char *)&v17 - v14, (const void *)(v1 + 56), 8 * v12);
    OUTLINED_FUNCTION_24_51();
    OUTLINED_FUNCTION_6_77();
    if (!v11)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_66_25();

    __break(1u);
  }
  else
  {
    uint64_t v16 = (void *)swift_slowAlloc();
    memcpy(v16, (const void *)(v1 + 56), 8 * v12);
    OUTLINED_FUNCTION_24_51();
    OUTLINED_FUNCTION_143();
    if (!v11)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_61_0();
      goto LABEL_16;
    }
  }

  OUTLINED_FUNCTION_61_0();
  __break(1u);
}

void sub_2597EDB7C()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v2 = v1;
  v46[10] = *MEMORY[0x263EF8340];
  if (!*(void *)(v1 + 16))
  {
    swift_release();
LABEL_47:
    OUTLINED_FUNCTION_36_36();
    OUTLINED_FUNCTION_13_1();
    return;
  }
  sub_2597EFE54(v0, v46);
  size_t v3 = v46[0];
  uint64_t v45 = v46[1];
  uint64_t v4 = v46[3];
  unint64_t v5 = v46[4];
  int64_t v44 = (unint64_t)(v46[2] + 64) >> 6;
  sub_259843F00();
  if (!v5) {
    goto LABEL_4;
  }
LABEL_3:
  unint64_t v6 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v7 = v6 | (v4 << 6);
  while (1)
  {
    uint64_t v21 = *(void *)(*(void *)(v3 + 48) + 16 * v7 + 8);
    sub_2598458B0();
    sub_259843F00();
    sub_2598441C0();
    uint64_t v22 = sub_259845910();
    uint64_t v23 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v24 = v22 & ~v23;
    OUTLINED_FUNCTION_3_88();
    if ((v25 & 1) == 0) {
      goto LABEL_36;
    }
    OUTLINED_FUNCTION_16_51();
    BOOL v27 = v27 && v26 == v21;
    if (v27 || (OUTLINED_FUNCTION_13_62() & 1) != 0) {
      break;
    }
    uint64_t v28 = ~v23;
    while (1)
    {
      uint64_t v24 = (v24 + 1) & v28;
      OUTLINED_FUNCTION_3_88();
      if ((v29 & 1) == 0) {
        break;
      }
      OUTLINED_FUNCTION_16_51();
      BOOL v31 = v27 && v30 == v21;
      if (v31 || (OUTLINED_FUNCTION_13_62() & 1) != 0)
      {
        OUTLINED_FUNCTION_20_56();
        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
    }
LABEL_36:
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
LABEL_4:
    if (__OFADD__(v4, 1)) {
      __break(1u);
    }
    if (v4 + 1 >= v44) {
      goto LABEL_43;
    }
    OUTLINED_FUNCTION_22_54();
    if (!v8)
    {
      OUTLINED_FUNCTION_50_30();
      if (v9 == v10) {
        goto LABEL_43;
      }
      OUTLINED_FUNCTION_113_7();
      if (!v11)
      {
        OUTLINED_FUNCTION_50_30();
        if (v9 == v10) {
          goto LABEL_43;
        }
        OUTLINED_FUNCTION_113_7();
        if (!v12)
        {
          OUTLINED_FUNCTION_50_30();
          if (v9 == v10) {
            goto LABEL_43;
          }
          OUTLINED_FUNCTION_113_7();
          if (!v14)
          {
            if (v13 + 4 >= v44) {
              goto LABEL_43;
            }
            if (!*(void *)(v45 + 8 * (v13 + 4)))
            {
              int64_t v15 = v4 + 6;
              while (v15 < v44)
              {
                OUTLINED_FUNCTION_34_38();
                if (v16) {
                  goto LABEL_21;
                }
              }
              goto LABEL_43;
            }
          }
        }
      }
    }
LABEL_21:
    OUTLINED_FUNCTION_21_47();
    unint64_t v5 = v18 & v17;
    unint64_t v7 = v20 + (v19 << 6);
    uint64_t v4 = v19;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20_56();
LABEL_39:
  OUTLINED_FUNCTION_8_77();
  if (v33)
  {
    uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
    if (!isStackAllocationSafe)
    {
      uint64_t v42 = (void *)swift_slowAlloc();
      memcpy(v42, (const void *)(v2 + 56), v3);
      OUTLINED_FUNCTION_30_36();
      OUTLINED_FUNCTION_143();
      if (v2 != -56) {
        goto LABEL_52;
      }
      sub_25940CF64();
      OUTLINED_FUNCTION_61_0();
      goto LABEL_47;
    }
  }
  uint64_t v34 = MEMORY[0x270FA5388](isStackAllocationSafe);
  OUTLINED_FUNCTION_10_61(v34, v35, v36, v37, v38, v39, v40, v41, v43);
  OUTLINED_FUNCTION_30_36();
  OUTLINED_FUNCTION_6_77();
  if (v2 == -56)
  {
LABEL_43:
    sub_25940CF64();
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_66_25();

  __break(1u);
LABEL_52:

  OUTLINED_FUNCTION_61_0();
  __break(1u);
}

void sub_2597EDEC4()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v2 = v1;
  v53[23] = *MEMORY[0x263EF8340];
  if (!*(void *)(v1 + 16))
  {
    swift_release();
    goto LABEL_59;
  }
  uint64_t v3 = v0;
  uint64_t v5 = v0 + 56;
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v6 = -1 << *(unsigned char *)(v0 + 32);
  uint64_t v42 = ~v6;
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v4;
  int64_t v45 = (unint64_t)(63 - v6) >> 6;
  uint64_t v51 = (char *)(v1 + 56);
  uint64_t v9 = sub_259843F00();
  int64_t v10 = 0;
  v41[1] = 0;
  unint64_t v52 = (unint64_t)"pe";
  uint64_t v49 = "appleMusicSimpleSearch";
  unint64_t v50 = "appleMusicMaestro";
  unint64_t v48 = (unint64_t)"appleMusicSmartSearch";
  uint64_t v43 = v5;
  uint64_t v44 = v9;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v46 = (v8 - 1) & v8;
  int64_t v47 = v10;
  for (unint64_t i = __clz(__rbit64(v8)) | (v10 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v12 << 6))
  {
    memcpy(v53, (const void *)(*(void *)(v3 + 48) + 144 * i), 0x90uLL);
    sub_2598458B0();
    int v15 = LOBYTE(v53[0]);
    uint64_t v17 = v53[1];
    uint64_t v16 = v53[2];
    sub_259843F00();
    sub_2593C2AE0((uint64_t)v53);
    sub_2598441C0();
    swift_bridgeObjectRelease();
    sub_2598441C0();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_259845910();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = v18 & ~v19;
    if ((*(void *)&v51[(v20 >> 3) & 0xFFFFFFFFFFFFFF8] >> v20)) {
      break;
    }
    sub_2593C2D6C((uint64_t)v53);
LABEL_45:
    unint64_t v8 = v46;
    int64_t v10 = v47;
    if (v46) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v12 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_62;
    }
    if (v12 >= v45) {
      goto LABEL_56;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    if (!v13)
    {
      int64_t v14 = v10 + 2;
      if (v10 + 2 >= v45) {
        goto LABEL_56;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v10 + 3;
        if (v10 + 3 >= v45) {
          goto LABEL_56;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v10 + 4;
          if (v10 + 4 >= v45) {
            goto LABEL_56;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v10 + 5;
            if (v10 + 5 >= v45)
            {
LABEL_56:
              sub_25940CF64();
              goto LABEL_59;
            }
            unint64_t v13 = *(void *)(v5 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                int64_t v12 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  break;
                }
                if (v12 >= v45) {
                  goto LABEL_56;
                }
                unint64_t v13 = *(void *)(v5 + 8 * v12);
                ++v14;
                if (v13) {
                  goto LABEL_19;
                }
              }
LABEL_62:
              __break(1u);
            }
          }
        }
      }
      int64_t v12 = v14;
    }
LABEL_19:
    uint64_t v46 = (v13 - 1) & v13;
    int64_t v47 = v12;
  }
  uint64_t v21 = ~v19;
  while (1)
  {
    uint64_t v22 = (unsigned __int8 *)(*(void *)(v2 + 48) + 144 * v20);
    uint64_t v23 = *v22;
    BOOL v24 = *((void *)v22 + 1) == v17 && *((void *)v22 + 2) == v16;
    if (v24 || (sub_259845750() & 1) != 0) {
      break;
    }
LABEL_42:
    unint64_t v20 = (v20 + 1) & v21;
    if (((*(void *)&v51[(v20 >> 3) & 0xFFFFFFFFFFFFFF8] >> v20) & 1) == 0)
    {
      sub_2593C2D6C((uint64_t)v53);
      uint64_t v5 = v43;
      uint64_t v3 = v44;
      goto LABEL_45;
    }
  }
  uint64_t v25 = v2;
  unint64_t v26 = 0xD000000000000011;
  unint64_t v27 = v52 | 0x8000000000000000;
  switch(v23)
  {
    case 1:
      unint64_t v26 = 0xD000000000000016;
      uint64_t v28 = v50;
      goto LABEL_30;
    case 2:
      unint64_t v26 = 0xD000000000000015;
      uint64_t v28 = v49;
LABEL_30:
      unint64_t v27 = (unint64_t)v28 | 0x8000000000000000;
      break;
    case 3:
      unint64_t v27 = v48 | 0x8000000000000000;
      unint64_t v26 = 0xD000000000000010;
      break;
    default:
      break;
  }
  unint64_t v29 = 0xD000000000000011;
  unint64_t v30 = v52 | 0x8000000000000000;
  switch(v15)
  {
    case 1:
      unint64_t v29 = 0xD000000000000016;
      BOOL v31 = v50;
      goto LABEL_35;
    case 2:
      unint64_t v29 = 0xD000000000000015;
      BOOL v31 = v49;
LABEL_35:
      unint64_t v30 = (unint64_t)v31 | 0x8000000000000000;
      break;
    case 3:
      unint64_t v30 = v48 | 0x8000000000000000;
      unint64_t v29 = 0xD000000000000010;
      break;
    default:
      break;
  }
  if (v26 != v29 || v27 != v30)
  {
    char v33 = sub_259845750();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v25;
    if (v33) {
      goto LABEL_53;
    }
    goto LABEL_42;
  }
  swift_bridgeObjectRelease_n();
LABEL_53:
  sub_2593C2D6C((uint64_t)v53);
  v53[18] = v44;
  v53[19] = v43;
  v53[20] = v42;
  v53[21] = v47;
  v53[22] = v46;
  OUTLINED_FUNCTION_69_24();
  uint64_t v36 = (void *)(v35 >> 6);
  size_t v37 = 8 * (v35 >> 6);
  if (v38 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    uint64_t v39 = (void *)OUTLINED_FUNCTION_68_24((uint64_t)v41);
    memcpy(v39, v51, v37);
    OUTLINED_FUNCTION_29_34();
    swift_release();
    if (!v36) {
      goto LABEL_56;
    }
    swift_willThrow();

    __break(1u);
LABEL_64:

    OUTLINED_FUNCTION_61_0();
    __break(1u);
    JUMPOUT(0x2597EE490);
  }
  uint64_t v40 = (void *)swift_slowAlloc();
  memcpy(v40, v51, v37);
  OUTLINED_FUNCTION_29_34();
  swift_release();
  if (v36) {
    goto LABEL_64;
  }
  sub_25940CF64();
  OUTLINED_FUNCTION_61_0();
LABEL_59:
  OUTLINED_FUNCTION_13_1();
}

void sub_2597EE4C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)(a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  uint64_t v36 = a3 + 56;
  while (2)
  {
    uint64_t v34 = v7;
    do
    {
      while (1)
      {
        if ((*a5 & 0x8000000000000000) == 0)
        {
          int64_t v9 = a5[3];
          unint64_t v8 = a5[4];
          if (v8)
          {
            uint64_t v10 = (v8 - 1) & v8;
            unint64_t v11 = __clz(__rbit64(v8)) | (v9 << 6);
LABEL_6:
            int64_t v12 = *(void **)(*(void *)(*a5 + 48) + 8 * v11);
            id v13 = v12;
            goto LABEL_7;
          }
          int64_t v26 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_49;
          }
          int64_t v27 = (unint64_t)(a5[2] + 64) >> 6;
          if (v26 >= v27)
          {
            int64_t v12 = 0;
            uint64_t v10 = 0;
            goto LABEL_7;
          }
          uint64_t v28 = a5[1];
          unint64_t v29 = *(void *)(v28 + 8 * v26);
          if (v29)
          {
LABEL_22:
            uint64_t v10 = (v29 - 1) & v29;
            unint64_t v11 = __clz(__rbit64(v29)) + (v26 << 6);
            int64_t v9 = v26;
            goto LABEL_6;
          }
          int64_t v31 = v9 + 2;
          if (v9 + 2 >= v27) {
            goto LABEL_41;
          }
          unint64_t v29 = *(void *)(v28 + 8 * v31);
          if (v29)
          {
LABEL_29:
            int64_t v26 = v31;
            goto LABEL_22;
          }
          if (v9 + 3 < v27)
          {
            unint64_t v29 = *(void *)(v28 + 8 * (v9 + 3));
            if (v29)
            {
              int64_t v26 = v9 + 3;
              goto LABEL_22;
            }
            int64_t v31 = v9 + 4;
            if (v9 + 4 >= v27)
            {
              int64_t v12 = 0;
              uint64_t v10 = 0;
              v9 += 3;
LABEL_7:
              a5[3] = v9;
              a5[4] = v10;
              if (!v12) {
                goto LABEL_47;
              }
              goto LABEL_11;
            }
            unint64_t v29 = *(void *)(v28 + 8 * v31);
            if (v29) {
              goto LABEL_29;
            }
            int64_t v26 = v9 + 5;
            if (v9 + 5 < v27)
            {
              unint64_t v29 = *(void *)(v28 + 8 * v26);
              if (v29) {
                goto LABEL_22;
              }
              int64_t v26 = v27 - 1;
              int64_t v32 = v9 + 6;
              while (v32 < v27)
              {
                unint64_t v29 = *(void *)(v28 + 8 * v32++);
                if (v29)
                {
                  int64_t v26 = v32 - 1;
                  goto LABEL_22;
                }
              }
LABEL_41:
              int64_t v12 = 0;
              uint64_t v10 = 0;
              int64_t v9 = v26;
              goto LABEL_7;
            }
          }
          int64_t v12 = 0;
          uint64_t v10 = 0;
          int64_t v9 = v31;
          goto LABEL_7;
        }
        if (!sub_259845010()
          || (sub_25935633C(0, (unint64_t *)&qword_26B2F83C0),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              int64_t v12 = v38,
              swift_unknownObjectRelease(),
              !v38))
        {
LABEL_47:
          swift_retain();
          sub_2595875BC(a1, a2, v34, a3);
          return;
        }
LABEL_11:
        uint64_t v14 = sub_259844D20();
        uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v16 = v14 & ~v15;
        unint64_t v17 = v16 >> 6;
        uint64_t v18 = 1 << v16;
        if (((1 << v16) & *(void *)(v36 + 8 * (v16 >> 6))) == 0) {
          goto LABEL_18;
        }
        sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
        id v19 = *(id *)(*(void *)(a3 + 48) + 8 * v16);
        char v20 = sub_259844D30();

        if (v20) {
          break;
        }
        uint64_t v21 = ~v15;
        for (unint64_t i = v16 + 1; ; unint64_t i = v23 + 1)
        {
          unint64_t v23 = i & v21;
          if (((*(void *)(v36 + (((i & v21) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v21)) & 1) == 0) {
            break;
          }
          id v24 = *(id *)(*(void *)(a3 + 48) + 8 * v23);
          char v25 = sub_259844D30();

          if (v25)
          {

            unint64_t v17 = v23 >> 6;
            uint64_t v18 = 1 << v23;
            goto LABEL_25;
          }
        }
LABEL_18:
      }
LABEL_25:
      uint64_t v30 = *(void *)(a1 + 8 * v17);
      *(void *)(a1 + 8 * v17) = v30 & ~v18;
    }
    while ((v18 & v30) == 0);
    uint64_t v7 = v34 - 1;
    if (__OFSUB__(v34, 1))
    {
LABEL_49:
      __break(1u);
      return;
    }
    if (v34 != 1) {
      continue;
    }
    break;
  }
}

void sub_2597EE84C(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(uint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    sub_25958777C(a1, a2, v31, a3);
    return;
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_30;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_2598458B0();
    sub_259843F00();
    sub_2598441C0();
    uint64_t v14 = sub_259845910();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_25;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    char v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_259845750() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        int64_t v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_259845750() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_13;
        }
      }
LABEL_25:
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v22 = a1[v17];
    a1[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_31;
      }
      --v31;
      if (!v23) {
        return;
      }
    }
LABEL_26:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
}

void sub_2597EEA74(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  *(uint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_15;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_48;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_46;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_46;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_46;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_14;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_46;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_46;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v36 = v9 + 6;
                while (v36 < v14)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_14;
                  }
                }
                int64_t v15 = v14 - 1;
LABEL_46:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                sub_25958777C(a1, a2, v38, a3);
                return;
              }
              goto LABEL_14;
            }
          }
          int64_t v13 = v18;
        }
LABEL_14:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_15:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_2598458B0();
        sub_259843F00();
        sub_2598441C0();
        uint64_t v22 = sub_259845910();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_32;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        BOOL v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_259845750() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_259845750() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_22;
          }
        }
LABEL_32:
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
LABEL_22:
      uint64_t v30 = a1[v25];
      a1[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_48:
      __break(1u);
      return;
    }
    if (v38 != 1) {
      continue;
    }
    break;
  }
}

void sub_2597EED68(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v9 = *(void *)(a3 + 16);
  *(uint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v10 = v9 - 1;
  uint64_t v11 = a3 + 56;
  while (1)
  {
    int64_t v12 = a5[3];
    unint64_t v13 = a5[4];
    if (!v13) {
      break;
    }
    uint64_t v14 = (v13 - 1) & v13;
    unint64_t v15 = __clz(__rbit64(v13)) | (v12 << 6);
LABEL_20:
    uint64_t v22 = *(void *)(*(void *)(*a5 + 48) + 8 * v15);
    a5[3] = v12;
    a5[4] = v14;
    uint64_t v23 = sub_2598458A0();
    uint64_t v24 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v25 = v23 & ~v24;
    unint64_t v26 = v25 >> 6;
    uint64_t v27 = 1 << v25;
    if (((1 << v25) & *(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      uint64_t v28 = *(void *)(a3 + 48);
      if (*(void *)(v28 + 8 * v25) == v22)
      {
LABEL_27:
        uint64_t v31 = a1[v26];
        a1[v26] = v31 & ~v27;
        if ((v27 & v31) != 0)
        {
          if (__OFSUB__(v10--, 1)) {
            goto LABEL_34;
          }
          if (!v10) {
            return;
          }
        }
      }
      else
      {
        for (unint64_t i = v25 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & ~v24;
          if (((*(void *)(v11 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
            break;
          }
          if (*(void *)(v28 + 8 * v30) == v22)
          {
            unint64_t v26 = v30 >> 6;
            uint64_t v27 = 1 << v30;
            goto LABEL_27;
          }
        }
      }
    }
  }
  int64_t v16 = v12 + 1;
  if (!__OFADD__(v12, 1))
  {
    int64_t v17 = (unint64_t)(a5[2] + 64) >> 6;
    int64_t v18 = a5[3];
    if (v16 >= v17) {
      goto LABEL_32;
    }
    uint64_t v19 = a5[1];
    unint64_t v20 = *(void *)(v19 + 8 * v16);
    if (!v20)
    {
      int64_t v18 = v12 + 1;
      if (v12 + 2 >= v17) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v19 + 8 * (v12 + 2));
      if (v20)
      {
        int64_t v16 = v12 + 2;
      }
      else
      {
        int64_t v18 = v12 + 2;
        if (v12 + 3 >= v17) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v19 + 8 * (v12 + 3));
        if (v20)
        {
          int64_t v16 = v12 + 3;
        }
        else
        {
          int64_t v16 = v12 + 4;
          int64_t v18 = v12 + 3;
          if (v12 + 4 >= v17) {
            goto LABEL_32;
          }
          unint64_t v20 = *(void *)(v19 + 8 * v16);
          if (!v20)
          {
            int64_t v21 = v12 + 5;
            while (v21 < v17)
            {
              unint64_t v20 = *(void *)(v19 + 8 * v21++);
              if (v20)
              {
                int64_t v16 = v21 - 1;
                goto LABEL_19;
              }
            }
            int64_t v18 = v17 - 1;
LABEL_32:
            a5[3] = v18;
            a5[4] = 0;
            swift_retain();
            sub_259587CE4(a1, a2, v10, a3);
            return;
          }
        }
      }
    }
LABEL_19:
    uint64_t v14 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v16 << 6);
    int64_t v12 = v16;
    goto LABEL_20;
  }
  __break(1u);
LABEL_34:
  __break(1u);
}

void sub_2597EEFA4(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  *(uint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v10 = *a5;
  unint64_t v9 = a5[1];
  unint64_t v11 = *(void *)(*a5 + 16);
  if (v9 == v11)
  {
LABEL_16:
    swift_retain();
    sub_259587CE4(a1, a2, v8, a3);
  }
  else
  {
    uint64_t v13 = a3 + 56;
    uint64_t v14 = ~(-1 << *(unsigned char *)(a3 + 32));
    while (v9 < v11)
    {
      if (__OFADD__(v9, 1)) {
        goto LABEL_19;
      }
      uint64_t v15 = *(void *)(v10 + 32 + 8 * v9);
      a5[1] = v9 + 1;
      uint64_t v16 = sub_2598458A0();
      uint64_t v17 = v16 & v14;
      unint64_t v18 = (v16 & (unint64_t)v14) >> 6;
      uint64_t v19 = 1 << (v16 & v14);
      if ((v19 & *(void *)(v13 + 8 * v18)) != 0)
      {
        uint64_t v20 = *(void *)(a3 + 48);
        if (*(void *)(v20 + 8 * v17) == v15)
        {
LABEL_12:
          uint64_t v23 = a1[v18];
          a1[v18] = v23 & ~v19;
          if ((v19 & v23) != 0)
          {
            if (__OFSUB__(v8--, 1)) {
              goto LABEL_20;
            }
            if (!v8) {
              return;
            }
          }
        }
        else
        {
          for (uint64_t i = v17 + 1; ; uint64_t i = v22 + 1)
          {
            unint64_t v22 = i & v14;
            if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
              break;
            }
            if (*(void *)(v20 + 8 * v22) == v15)
            {
              unint64_t v18 = v22 >> 6;
              uint64_t v19 = 1 << v22;
              goto LABEL_12;
            }
          }
        }
      }
      unint64_t v9 = a5[1];
      unint64_t v11 = *(void *)(v10 + 16);
      if (v9 == v11) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
  }
}

void sub_2597EF134(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  *(uint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_46;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_44;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_44;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_44;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_44;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v18 = v9 + 5;
                  while (v18 < v14)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_20;
                    }
                  }
                  int64_t v15 = v14 - 1;
LABEL_44:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  sub_25958777C(a1, a2, v37, a3);
                  return;
                }
              }
            }
          }
LABEL_20:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_2598458B0();
        sub_259843F00();
        sub_2598441C0();
        uint64_t v22 = sub_259845910();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_38:
        swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_259845750() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_259845750() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_28;
          }
        }
        goto LABEL_38;
      }
      swift_bridgeObjectRelease();
LABEL_28:
      uint64_t v30 = a1[v25];
      a1[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_46:
      __break(1u);
      return;
    }
    if (v37 != 1) {
      continue;
    }
    break;
  }
}

uint64_t sub_2597EF410(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)(a3 + 16);
  *(uint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  uint64_t v46 = a3;
  uint64_t v44 = a3 + 56;
LABEL_2:
  uint64_t v41 = v7;
  while (1)
  {
    int64_t v9 = v5[3];
    unint64_t v8 = v5[4];
    if (v8)
    {
      uint64_t v10 = (v8 - 1) & v8;
      unint64_t v11 = __clz(__rbit64(v8)) | (v9 << 6);
      goto LABEL_15;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_61:
      __break(1u);
      JUMPOUT(0x2597EF8D8);
    }
    int64_t v13 = (unint64_t)(v5[2] + 64) >> 6;
    if (v12 >= v13) {
      goto LABEL_59;
    }
    uint64_t v14 = v5[1];
    unint64_t v15 = *(void *)(v14 + 8 * v12);
    if (v15) {
      goto LABEL_14;
    }
    int64_t v16 = v9 + 2;
    if (v9 + 2 >= v13)
    {
      ++v9;
      goto LABEL_59;
    }
    unint64_t v15 = *(void *)(v14 + 8 * v16);
    if (v15) {
      goto LABEL_10;
    }
    if (v9 + 3 >= v13) {
      goto LABEL_56;
    }
    unint64_t v15 = *(void *)(v14 + 8 * (v9 + 3));
    if (v15)
    {
      int64_t v12 = v9 + 3;
      goto LABEL_14;
    }
    int64_t v16 = v9 + 4;
    if (v9 + 4 >= v13) {
      break;
    }
    unint64_t v15 = *(void *)(v14 + 8 * v16);
    if (v15)
    {
LABEL_10:
      int64_t v12 = v16;
      goto LABEL_14;
    }
    int64_t v12 = v9 + 5;
    if (v9 + 5 >= v13)
    {
LABEL_56:
      int64_t v9 = v16;
      goto LABEL_59;
    }
    unint64_t v15 = *(void *)(v14 + 8 * v12);
    if (v15) {
      goto LABEL_14;
    }
    int64_t v37 = v9 + 6;
    do
    {
      if (v37 >= v13)
      {
        int64_t v9 = v13 - 1;
        goto LABEL_59;
      }
      unint64_t v15 = *(void *)(v14 + 8 * v37++);
    }
    while (!v15);
    int64_t v12 = v37 - 1;
LABEL_14:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
    int64_t v9 = v12;
LABEL_15:
    memcpy(__dst, (const void *)(*(void *)(*v5 + 48) + 144 * v11), 0x90uLL);
    v5[3] = v9;
    v5[4] = v10;
    sub_2598458B0();
    uint64_t v17 = LOBYTE(__dst[0]);
    uint64_t v18 = __dst[1];
    uint64_t v19 = __dst[2];
    sub_259843F00();
    sub_2593C2AE0((uint64_t)__dst);
    sub_2598441C0();
    swift_bridgeObjectRelease();
    switch(v17)
    {
      case 0:
      case 1:
      case 2:
      case 3:
        sub_2598441C0();
        swift_bridgeObjectRelease();
        uint64_t v20 = sub_259845910();
        uint64_t v21 = -1 << *(unsigned char *)(v46 + 32);
        unint64_t v22 = v20 & ~v21;
        if (((*(void *)(v44 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
        {
          sub_2593C2D6C((uint64_t)__dst);
          continue;
        }
        uint64_t v23 = ~v21;
        break;
      default:
        JUMPOUT(0);
    }
    while (1)
    {
      unint64_t v24 = (unsigned __int8 *)(*(void *)(v46 + 48) + 144 * v22);
      uint64_t v25 = *v24;
      BOOL v26 = *((void *)v24 + 1) == v18 && *((void *)v24 + 2) == v19;
      if (v26 || (sub_259845750() & 1) != 0) {
        break;
      }
LABEL_38:
      unint64_t v22 = (v22 + 1) & v23;
      if (((*(void *)(v44 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
      {
        sub_2593C2D6C((uint64_t)__dst);
        goto LABEL_43;
      }
    }
    unint64_t v27 = 0xD000000000000011;
    unint64_t v28 = 0x800000025984B3C0;
    switch(v25)
    {
      case 1:
        unint64_t v27 = 0xD000000000000016;
        BOOL v29 = "appleMusicMaestro";
        goto LABEL_26;
      case 2:
        unint64_t v27 = 0xD000000000000015;
        BOOL v29 = "appleMusicSimpleSearch";
LABEL_26:
        unint64_t v28 = (unint64_t)v29 | 0x8000000000000000;
        break;
      case 3:
        unint64_t v28 = 0x800000025984B420;
        unint64_t v27 = 0xD000000000000010;
        break;
      default:
        break;
    }
    unint64_t v30 = 0xD000000000000011;
    unint64_t v31 = 0x800000025984B3C0;
    switch((int)v17)
    {
      case 1:
        unint64_t v30 = 0xD000000000000016;
        uint64_t v32 = "appleMusicMaestro";
        goto LABEL_31;
      case 2:
        unint64_t v30 = 0xD000000000000015;
        uint64_t v32 = "appleMusicSimpleSearch";
LABEL_31:
        unint64_t v31 = (unint64_t)v32 | 0x8000000000000000;
        break;
      case 3:
        unint64_t v31 = 0x800000025984B420;
        unint64_t v30 = 0xD000000000000010;
        break;
      default:
        break;
    }
    if (v27 != v30 || v28 != v31)
    {
      char v34 = sub_259845750();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_42;
      }
      goto LABEL_38;
    }
    swift_bridgeObjectRelease_n();
LABEL_42:
    sub_2593C2D6C((uint64_t)__dst);
    uint64_t v35 = (v22 >> 3) & 0x1FFFFFFFFFFFFFF8;
    uint64_t v36 = *(uint64_t *)((char *)a1 + v35);
    *(uint64_t *)((char *)a1 + v35) = v36 & ~(1 << v22);
    if ((v36 & (1 << v22)) != 0)
    {
      uint64_t v7 = v41 - 1;
      uint64_t v5 = a5;
      if (__OFSUB__(v41, 1)) {
        goto LABEL_61;
      }
      if (v41 == 1) {
        return MEMORY[0x263F8EE88];
      }
      goto LABEL_2;
    }
LABEL_43:
    uint64_t v5 = a5;
  }
  v9 += 3;
LABEL_59:
  v5[3] = v9;
  v5[4] = 0;
  uint64_t v39 = v46;
  swift_retain();
  return sub_2595880A4(a1, a2, v41, v39);
}

uint64_t sub_2597EF908(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_259730A2C(&v48);
  long long v46 = v48;
  uint64_t v47 = v49;
  uint64_t v44 = a1;
  sub_259843F00();
  uint64_t v45 = a3;
  swift_retain();
  sub_25967D8BC();
  if (v10)
  {
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    while (1)
    {
      uint64_t v17 = (void *)*a5;
      unint64_t v25 = sub_25939CE90();
      uint64_t v26 = v17[2];
      BOOL v27 = (v18 & 1) == 0;
      uint64_t v28 = v26 + v27;
      if (__OFADD__(v26, v27)) {
        break;
      }
      char v29 = v18;
      if (v17[3] >= v28)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A389B38);
          sub_259845360();
        }
      }
      else
      {
        sub_25972E774(v28, a4 & 1, v19, v20, v21, v22, v23, v24, v44, v45, v46, *((uint64_t *)&v46 + 1), v47, SBYTE4(v47));
        unint64_t v30 = sub_25939CE90();
        if ((v29 & 1) != (v31 & 1)) {
          goto LABEL_17;
        }
        unint64_t v25 = v30;
      }
      uint64_t v32 = (void *)*a5;
      if (v29)
      {
        swift_bridgeObjectRelease();
        unint64_t v33 = (void *)(v32[7] + 16 * v25);
        swift_bridgeObjectRelease();
        void *v33 = v15;
        v33[1] = v16;
      }
      else
      {
        v32[(v25 >> 6) + 8] |= 1 << v25;
        char v34 = (void *)(v32[6] + 16 * v25);
        *char v34 = v13;
        v34[1] = v14;
        uint64_t v35 = (void *)(v32[7] + 16 * v25);
        *uint64_t v35 = v15;
        v35[1] = v16;
        uint64_t v36 = v32[2];
        BOOL v37 = __OFADD__(v36, 1);
        uint64_t v38 = v36 + 1;
        if (v37) {
          goto LABEL_16;
        }
        v32[2] = v38;
      }
      sub_25967D8BC();
      uint64_t v13 = v39;
      uint64_t v14 = v40;
      uint64_t v15 = v41;
      uint64_t v16 = v42;
      a4 = 1;
      if (!v40) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_2598457D0();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_25940CF64();
    return swift_release();
  }
  return result;
}

uint64_t sub_2597EFB18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v9 = type metadata accessor for MomentInformation();
  uint64_t v40 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v38 = (uint64_t)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAF0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (void *)((char *)v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_259730A2C(&v39);
  v37[2] = a1;
  sub_259843F00();
  v37[1] = a3;
  swift_retain();
  sub_25967DE58((uint64_t)v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAE8);
  while (1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      sub_25940CF64();
      return swift_release();
    }
    uint64_t v18 = (uint64_t)v16 + *(int *)(v17 + 48);
    uint64_t v19 = *v16;
    uint64_t v20 = v16[1];
    sub_259477458(v18, (uint64_t)v13);
    uint64_t v21 = *a5;
    unint64_t v23 = sub_25939CE90();
    uint64_t v24 = *(void *)(v21 + 16);
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      break;
    }
    char v27 = v22;
    if (*(void *)(v21 + 24) >= v26)
    {
      if (a4)
      {
        if (v22) {
          goto LABEL_10;
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAD8);
        sub_259845360();
        if (v27) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      sub_25972EE00(v26, a4 & 1);
      unint64_t v28 = sub_25939CE90();
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_18;
      }
      unint64_t v23 = v28;
      if (v27)
      {
LABEL_10:
        uint64_t v30 = v38;
        sub_2594774BC((uint64_t)v13, v38);
        sub_259477584((uint64_t)v13);
        swift_bridgeObjectRelease();
        sub_259477520(v30, *(void *)(*a5 + 56) + *(void *)(v40 + 72) * v23);
        goto LABEL_14;
      }
    }
    char v31 = (void *)*a5;
    *(void *)(*a5 + 8 * (v23 >> 6) + 64) |= 1 << v23;
    uint64_t v32 = (void *)(v31[6] + 16 * v23);
    void *v32 = v19;
    v32[1] = v20;
    sub_259477458((uint64_t)v13, v31[7] + *(void *)(v40 + 72) * v23);
    uint64_t v33 = v31[2];
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_17;
    }
    v31[2] = v35;
LABEL_14:
    sub_25967DE58((uint64_t)v16);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAE8);
    a4 = 1;
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_2598457D0();
  __break(1u);
  return result;
}

uint64_t sub_2597EFE54@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_2597EFE8C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_259588890(v7, *a1, a1[1], a1[2], a1[3]);
  uint64_t v4 = v7[0];
  uint64_t v5 = v7[1];
  *a2 = result;
  a2[1] = v6;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

uint64_t sub_2597EFED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38BAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2597EFF38@<X0>(uint64_t *a1@<X8>)
{
  return sub_259475980(*(void *)(v1 + 16), a1);
}

void OUTLINED_FUNCTION_20_56()
{
  uint64_t v4 = *(void *)(v3 - 264);
  *(void *)(v3 - 136) = v1;
  *(void *)(v3 - 128) = v4;
  *(void *)(v3 - 120) = *(void *)(v3 - 280);
  *(void *)(v3 - 112) = v2;
  *(void *)(v3 - 104) = v0;
}

void OUTLINED_FUNCTION_23_53()
{
  sub_2597EE84C(v3, v2, v0, v1, (void *)(v4 - 104));
}

void OUTLINED_FUNCTION_24_51()
{
  sub_2597EEFA4(v2, v3, v0, v1, (void *)(v4 - 104));
}

uint64_t OUTLINED_FUNCTION_26_45()
{
  *(void *)(v1 - 112) = *(void *)(v0 + 16);
  return sub_259844E10();
}

uint64_t OUTLINED_FUNCTION_29_34()
{
  return sub_2597EF410(v3, v1, v2, v0, (void *)(v4 - 136));
}

void OUTLINED_FUNCTION_30_36()
{
  sub_2597EF134(v3, v2, v0, v1, (void *)(v4 - 136));
}

void OUTLINED_FUNCTION_45_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 192) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_46_32()
{
  return v0;
}

void OUTLINED_FUNCTION_47_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 200) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_51_24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *(void *)(v3 - 200) + *(int *)(*(void *)(v3 - 176) + 48);
  return sub_2594774BC(v2 + a1 * v1, v5);
}

uint64_t OUTLINED_FUNCTION_53_29()
{
  return type metadata accessor for MomentInformation();
}

uint64_t OUTLINED_FUNCTION_54_33(uint64_t result)
{
  v1[8] = result;
  v1[4] = 1684632949;
  v1[5] = 0xE400000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_57_30@<X0>(uint64_t a1@<X8>)
{
  return a1 + *(void *)(v1 + 72) * v2;
}

uint64_t OUTLINED_FUNCTION_61_23()
{
  return *(void *)(v0 - 208);
}

uint64_t OUTLINED_FUNCTION_62_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_63_22()
{
  return sub_259845350();
}

uint64_t OUTLINED_FUNCTION_64_28()
{
  return sub_259845350();
}

uint64_t OUTLINED_FUNCTION_66_25()
{
  return swift_willThrow();
}

void *OUTLINED_FUNCTION_67_25(void *a1)
{
  return memcpy(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_68_24@<X0>(uint64_t a1@<X8>)
{
  return a1 - (v1 & 0x3FFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_72_26()
{
  return 0;
}

uint64_t StoryMusicCurator.__allocating_init(photoLibrary:safetyController:)(uint64_t a1, uint64_t a2)
{
  return sub_2597F2880(a1, a2, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_2597F3998);
}

uint64_t StoryMusicCurator.curateMusic(with:using:eventRecorder:progressReporter:)()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  *(void *)(v1 + 4728) = v0;
  *(void *)(v1 + 4680) = v6;
  *(void *)(v1 + 4632) = v7;
  *(void *)(v1 + 4584) = v8;
  type metadata accessor for RootEventRecorder.EventState(0);
  *(void *)(v1 + 4776) = swift_task_alloc();
  memcpy((void *)(v1 + 3064), v5, 0xE8uLL);
  *(unsigned char *)(v1 + 5496) = *v3;
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2597F0354()
{
  uint64_t v1 = *(void *)(v0 + 4680);
  size_t v2 = *(void **)(v0 + 4632);
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  (*(void (**)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 24))("MusicCurator.curateMusic", 24, 2, v3, v4);
  uint64_t v5 = (void *)OUTLINED_FUNCTION_3_26();
  __swift_project_boxed_opaque_existential_1(v5, v6);
  sub_2598435C0();
  uint64_t v7 = *(void *)(v0 + 4728);
  type metadata accessor for StoryMusicCache();
  id v8 = *(id *)(v7 + 16);
  StoryMusicCache.__allocating_init(photoLibrary:)();
  uint64_t v9 = *(void *)(v0 + 4728);
  unint64_t v23 = *(void **)(v0 + 4680);
  uint64_t v10 = *(void **)(v0 + 4632);
  uint64_t v11 = *(void **)(v9 + 584);
  *(void *)(v9 + 584) = v12;

  uint64_t v13 = v2[3];
  uint64_t v14 = v2[4];
  __swift_project_boxed_opaque_existential_1(v10, v13);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v14 + 16))(0x754D657461727543, 0xEB00000000636973, v13, v14);
  uint64_t v15 = *(void *)(v0 + 4384);
  uint64_t v16 = *(void *)(v0 + 4392);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 4360), v15);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v16 + 8))(0x4B6F72747365614DLL, 0xEF7364726F777965, v15, v16);
  sub_259353FF0(v0 + 4280, v0 + 4200);
  uint64_t v17 = swift_allocObject();
  *(void *)(v0 + 4824) = v17;
  *(void *)(v17 + 16) = v9;
  memcpy((void *)(v17 + 24), (const void *)(v0 + 3064), 0xE8uLL);
  sub_2593A2D00((long long *)(v0 + 4200), v17 + 256);
  swift_retain();
  sub_2595F3FD4((void *)(v0 + 3064));
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A38BB18);
  swift_asyncLet_begin();
  __swift_project_boxed_opaque_existential_1(v23, *(void *)(v1 + 24));
  sub_2598435D0();
  *(void *)(v0 + 4872) = 0;
  memcpy((void *)(v0 + 3608), (const void *)(v0 + 3064), 0xE8uLL);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 4920) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_2597F0764;
  OUTLINED_FUNCTION_23_0();
  return StoryMusicCurator.curateMood(using:eventRecorder:)(v19, v20);
}

uint64_t sub_2597F0764()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 4968) = v4;
  *(void *)(v2 + 5016) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2597F084C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_240();
  uint64_t v15 = *(void *)(v14 + 5016);
  __swift_project_boxed_opaque_existential_1(*(void **)(v14 + 4680), *(void *)(*(void *)(v14 + 4680) + 24));
  sub_2598435D0();
  *(void *)(v14 + 5064) = v15;
  if (v15)
  {
    uint64_t v16 = OUTLINED_FUNCTION_3_26();
    return MEMORY[0x270FA23D8](v16);
  }
  else
  {
    uint64_t v17 = OUTLINED_FUNCTION_3_26();
    return MEMORY[0x270FA23E8](v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_2597F0944()
{
  *(void *)(v1 + 5112) = v0;
  if (v0) {
    return MEMORY[0x270FA23D8](v1 + 1296);
  }
  else {
    return OUTLINED_FUNCTION_145((uint64_t)sub_2597F0984);
  }
}

uint64_t sub_2597F0984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = *(void *)(v14 + 5112);
  uint64_t v16 = *(void *)(v14 + 4440);
  __swift_project_boxed_opaque_existential_1(*(void **)(v14 + 4680), *(void *)(*(void *)(v14 + 4680) + 24));
  sub_259843F00();
  sub_2598435D0();
  *(void *)(v14 + 5160) = v15;
  if (v15)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA23D8](v14 + 1296);
  }
  else
  {
    __src = *(void **)(v14 + 4968);
    char v31 = *(unsigned char *)(v14 + 5496);
    uint64_t v30 = *(void *)(v14 + 4728);
    BOOL v34 = *(void **)(v14 + 4680);
    uint64_t v17 = *(void *)(v14 + 4384);
    uint64_t v18 = *(void *)(v14 + 4392);
    __swift_project_boxed_opaque_existential_1((void *)(v14 + 4360), v17);
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v18 + 8))(0x73754D656C707041, 0xEF73676E6F536369, v17, v18);
    sub_259353FF0(v14 + 3880, v14 + 3960);
    uint64_t v19 = swift_allocObject();
    *(void *)(v14 + 5208) = v19;
    *(void *)(v19 + 16) = v30;
    *(unsigned char *)(v19 + 24) = v31;
    memcpy((void *)(v19 + 32), (const void *)(v14 + 3064), 0xE8uLL);
    *(void *)(v19 + 264) = v16;
    *(void *)(v19 + 272) = __src;
    sub_2593A2D00((long long *)(v14 + 3960), v19 + 280);
    swift_retain();
    sub_2595F3FD4((void *)(v14 + 3064));
    sub_259843F00();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A38A230);
    swift_asyncLet_begin();
    __swift_project_boxed_opaque_existential_1(v34, v34[3]);
    sub_2598435D0();
    *(void *)(v14 + 5256) = 0;
    uint64_t v32 = *(void *)(v14 + 4968);
    LOBYTE(v30) = *(unsigned char *)(v14 + 5496);
    uint64_t v29 = *(void *)(v14 + 4728);
    uint64_t v20 = *(void **)(v14 + 4680);
    uint64_t v21 = *(void *)(v14 + 4384);
    uint64_t v22 = *(void *)(v14 + 4392);
    __swift_project_boxed_opaque_existential_1((void *)(v14 + 4360), v21);
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v22 + 8))(0x6973754D78656C46, 0xEE0073676E6F5363, v21, v22);
    sub_259353FF0(v14 + 4040, v14 + 4120);
    uint64_t v23 = swift_allocObject();
    *(void *)(v14 + 5304) = v23;
    *(void *)(v23 + 16) = v29;
    *(unsigned char *)(v23 + 24) = v30;
    memcpy((void *)(v23 + 32), (const void *)(v14 + 3064), 0xE8uLL);
    *(void *)(v23 + 264) = v16;
    *(void *)(v23 + 272) = v32;
    sub_2593A2D00((long long *)(v14 + 4120), v23 + 280);
    swift_retain();
    sub_2595F3FD4((void *)(v14 + 3064));
    swift_retain();
    swift_asyncLet_begin();
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    sub_2598435D0();
    *(void *)(v14 + 5352) = 0;
    return MEMORY[0x270FA23E8](v14 + 656, v14 + 4536, sub_2597F0E00, v14 + 4592, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_2597F0E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25();
  v15[675] = v14;
  if (v14)
  {
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v16, v17, v18);
  }
  else
  {
    v15[681] = v15[567];
    sub_259843F00();
    return MEMORY[0x270FA23E8](v15 + 2, v15 + 561, sub_2597F0EC8, v15 + 598, v19, v20, v21, v22, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_2597F0EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25();
  v15[682] = v14;
  if (v14)
  {
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v16, v17, v18);
  }
  else
  {
    v15[683] = v15[561];
    sub_259843F00();
    return MEMORY[0x270FA23E8](v15 + 162, v15 + 555, sub_2597F0F90, v15 + 622, v19, v20, v21, v22, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_2597F0F90()
{
  *(void *)(v1 + 5472) = v0;
  if (v0) {
    return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1E28);
  }
  else {
    return OUTLINED_FUNCTION_145((uint64_t)sub_2597F0FBC);
  }
}

uint64_t sub_2597F0FBC()
{
  uint64_t v1 = *(void *)(v0 + 5472);
  uint64_t v2 = *(void *)(v0 + 5464);
  uint64_t v3 = *(void *)(v0 + 5448);
  uint64_t v4 = *(void *)(v0 + 4440);
  memcpy((void *)(v0 + 3336), (const void *)(v0 + 3064), 0xE8uLL);
  sub_259843F00();
  sub_2597F2F8C((void *)(v0 + 3336), v3, v2, v4, (void *)(v0 + 2520));
  *(void *)(v0 + 5480) = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void **)(v0 + 4680);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy((void *)(v0 + 1976), (const void *)(v0 + 2520), 0x220uLL);
    __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    sub_2598435E0();
    *(void *)(v0 + 5488) = 0;
    memcpy(*(void **)(v0 + 4584), (const void *)(v0 + 1976), 0x220uLL);
  }
  uint64_t v6 = OUTLINED_FUNCTION_3_26();
  return MEMORY[0x270FA23D8](v6);
}

uint64_t sub_2597F1170()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1184);
}

uint64_t sub_2597F1184()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F11F0()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1204);
}

uint64_t sub_2597F1204()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  __swift_destroy_boxed_opaque_existential_1(v0);
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1284()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1298);
}

uint64_t sub_2597F1298()
{
  OUTLINED_FUNCTION_240();
  uint64_t v1 = v0[597];
  uint64_t v2 = (void *)v0[579];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 535));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 545));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1, v3, v4);
  sub_259445924(v1);
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2597F139C()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F13B0);
}

uint64_t sub_2597F13B0()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_19_49();
  OUTLINED_FUNCTION_5_80((uint64_t)&unk_26A391ED0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F1434()
{
  return MEMORY[0x270FA23D8](v0 + 1296);
}

uint64_t sub_2597F1458()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F146C);
}

uint64_t sub_2597F146C()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_19_49();
  OUTLINED_FUNCTION_5_80((uint64_t)&unk_26A391ED0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F14F0()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1504);
}

uint64_t sub_2597F1504()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_19_49();
  OUTLINED_FUNCTION_5_80((uint64_t)&unk_26A391ED0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F1588()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F159C);
}

uint64_t sub_2597F159C()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_19_49();
  OUTLINED_FUNCTION_5_80((uint64_t)&unk_26A391ED0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F1620()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1634);
}

uint64_t sub_2597F1634()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_19_49();
  OUTLINED_FUNCTION_5_80((uint64_t)&unk_26A391ED0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F16B8()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F16CC);
}

uint64_t sub_2597F16CC()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1738()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F174C);
}

uint64_t sub_2597F174C()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v1 = OUTLINED_FUNCTION_1_108();
  v2(v1);
  sub_259445924(*(void *)(v0 + 4776));
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  sub_2593980F8(0);
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2597F1814()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1828);
}

uint64_t sub_2597F1828()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1894()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F18A8);
}

uint64_t sub_2597F18A8()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1914()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1928);
}

uint64_t sub_2597F1928()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_9_68();
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  OUTLINED_FUNCTION_18_43((uint64_t)&unk_26A391EF0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F19E4()
{
  return MEMORY[0x270FA23D8](v0 + 16);
}

uint64_t sub_2597F1A0C()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1A20);
}

uint64_t sub_2597F1A20()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1A8C()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1AA0);
}

uint64_t sub_2597F1AA0()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1B0C()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1B20);
}

uint64_t sub_2597F1B20()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_9_68();
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  OUTLINED_FUNCTION_18_43((uint64_t)&unk_26A391EF0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F1BDC()
{
  OUTLINED_FUNCTION_25();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v0);
}

uint64_t sub_2597F1C58()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1C6C);
}

uint64_t sub_2597F1C6C()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1CD8()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1CEC);
}

uint64_t sub_2597F1CEC()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1D58()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1D6C);
}

uint64_t sub_2597F1D6C()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_9_68();
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  OUTLINED_FUNCTION_18_43((uint64_t)&unk_26A391EF0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F1E28()
{
  OUTLINED_FUNCTION_25();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v0);
}

uint64_t sub_2597F1EB0()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1EC4);
}

uint64_t sub_2597F1EC4()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1F30()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1F44);
}

uint64_t sub_2597F1F44()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F1FB0()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F1FC4);
}

uint64_t sub_2597F1FC4()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_9_68();
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  OUTLINED_FUNCTION_18_43((uint64_t)&unk_26A391EF0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F2080()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F2094);
}

uint64_t sub_2597F2094()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F2100()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F2114);
}

uint64_t sub_2597F2114()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F2180()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F2194);
}

uint64_t sub_2597F2194()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_9_68();
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  OUTLINED_FUNCTION_18_43((uint64_t)&unk_26A391EF0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F2250()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F2264);
}

uint64_t sub_2597F2264()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_24_52();
  OUTLINED_FUNCTION_6_78(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F22D0()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F22E4);
}

uint64_t sub_2597F22E4()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = OUTLINED_FUNCTION_22_55();
  OUTLINED_FUNCTION_7_70(v0);
  uint64_t v1 = OUTLINED_FUNCTION_253();
  return MEMORY[0x270FA23D8](v1);
}

uint64_t sub_2597F2350()
{
  return OUTLINED_FUNCTION_145((uint64_t)sub_2597F2364);
}

uint64_t sub_2597F2364()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_2_88();
  uint64_t v0 = OUTLINED_FUNCTION_1_108();
  v1(v0);
  OUTLINED_FUNCTION_9_68();
  sub_2593980F8((uint64_t)&unk_26A391ED0);
  sub_2593980F8((uint64_t)&unk_26A391EE0);
  OUTLINED_FUNCTION_18_43((uint64_t)&unk_26A391EF0);
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v3(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t static StoryMusicCurator.prewarm()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2FFBD0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A388C48 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_259843A80();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A3D2050);
  uint64_t v6 = sub_259843A50();
  os_log_type_t v7 = sub_259844B30();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25934C000, v6, v7, "StoryMusicCurator prewarm", v8, 2u);
    MEMORY[0x25A2E13A0](v8, -1, -1);
  }

  sub_259844720();
  uint64_t v9 = sub_259844740();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = 0;
  v10[3] = 0;
  v10[4] = v1;
  sub_2597F3728((uint64_t)v4, (uint64_t)&unk_26A391F00, (uint64_t)v10);
  swift_release();
  return sub_2597F3F64((uint64_t)v4);
}

BOOL static StoryMusicCurationError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t StoryMusicCurationError.hash(into:)()
{
  return sub_2598458C0();
}

uint64_t StoryMusicCurationError.hashValue.getter()
{
  return sub_259845910();
}

void static StoryMusicCurator.curateMusicEvent.getter()
{
}

void static StoryMusicCurator.moodRankingEvent.getter()
{
}

void static StoryMusicCurator.initEmbeddingEvent.getter()
{
}

void static StoryMusicCurator.packageSpecificationOptionsEvent.getter()
{
}

void static StoryMusicCurator.keywordRankingEvent.getter()
{
}

void static StoryMusicCurator.keywordsForStoryPrompt.getter()
{
}

void static StoryMusicCurator.keywordsForGlobalTraitsEvent.getter()
{
}

void static StoryMusicCurator.keywordsForExtendedTokensEvent.getter()
{
}

void static StoryMusicCurator.checkAppleMusicSubscriptionStatusEvent.getter()
{
}

void static StoryMusicCurator.appleMusicCurationEvent.getter()
{
}

void static StoryMusicCurator.appleMusicMaestroCurationStepEvent.getter()
{
}

void static StoryMusicCurator.appleMusicSearchCurationStepEvent.getter()
{
}

void static StoryMusicCurator.appleMusicSearchKeywordCurationStepEvent.getter()
{
}

void static StoryMusicCurator.appleMusicRequestRecentlyUsedSongsEvent.getter()
{
}

void static StoryMusicCurator.appleMusicRequestAndCacheSongsEvent.getter()
{
}

void static StoryMusicCurator.flexMusicCurationEvent.getter()
{
}

void static StoryMusicCurator.flexMaestroCurationStepEvent.getter()
{
}

void static StoryMusicCurator.flexRequestRecentlyUsedSongsEvent.getter()
{
}

uint64_t sub_2597F2770()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2F8390);
  __swift_allocate_value_buffer(v0, qword_26A3D2038);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A3D2038);
  uint64_t v2 = sub_259842800();
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
}

uint64_t sub_2597F27E4()
{
  uint64_t v0 = sub_259843A80();
  __swift_allocate_value_buffer(v0, qword_26A3D2050);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3D2050);
  return sub_259843A60();
}

uint64_t StoryMusicCurator.init(photoLibrary:safetyController:)(uint64_t a1, uint64_t a2)
{
  return sub_2597F2880(a1, a2, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t))sub_2597F4188);
}

uint64_t sub_2597F2880(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a2, v7);
  double v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v13 + 16))(v12, v10);
  uint64_t v14 = a3(a1, v12, v3, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v14;
}

uint64_t StoryMusicCurator.__allocating_init(photoLibrary:)(void *a1)
{
  type metadata accessor for LiveGenerativeMemorySafetyController(0);
  id v2 = a1;
  uint64_t v3 = LiveGenerativeMemorySafetyController.__allocating_init(photoLibrary:)(v2);
  uint64_t v4 = swift_allocObject();
  return sub_2597F3FC4((uint64_t)v2, v3, v4);
}

uint64_t sub_2597F2A00(uint64_t a1, int a2, void *__src)
{
  v3[31] = a1;
  memcpy(v3 + 2, __src, 0xE8uLL);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[32] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2597F2AC4;
  return StoryMusicCurator.curateMaestroKeywords(in:eventRecorder:)();
}

uint64_t sub_2597F2AC4()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v8 = v7;
  *(void *)(v5 + 264) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 272) = v3;
  }
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2597F2BB4()
{
  **(void **)(v0 + 248) = *(void *)(v0 + 272);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2597F2BDC(uint64_t a1, int a2, char a3, void *__src)
{
  *(void *)(v4 + 248) = a1;
  *(unsigned char *)(v4 + 280) = a3;
  memcpy((void *)(v4 + 16), __src, 0xE8uLL);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 256) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_2597F2CC4;
  return StoryMusicCurator.curateAppleMusic(using:with:maestroKeywords:mood:eventRecorder:)();
}

uint64_t sub_2597F2CC4()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v8 = v7;
  *(void *)(v5 + 264) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 272) = v3;
  }
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2597F2DB4(uint64_t a1, int a2, char a3, void *__src, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 248) = a1;
  *(unsigned char *)(v7 + 280) = a3;
  memcpy((void *)(v7 + 16), __src, 0xE8uLL);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v7 + 256) = v11;
  *uint64_t v11 = v7;
  v11[1] = sub_2597F2E9C;
  return StoryMusicCurator.curateFlexMusic(using:with:maestroKeywords:mood:eventRecorder:)(v7 + 280, (const void *)(v7 + 16), a5, a6, a7);
}

uint64_t sub_2597F2E9C()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v8 = v7;
  *(void *)(v5 + 264) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 272) = v3;
  }
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

void *sub_2597F2F8C@<X0>(void *__src@<X4>, uint64_t a2@<X0>, uint64_t a3@<X1>, uint64_t a4@<X2>, void *a5@<X8>)
{
  memcpy(__dst, __src, 0xE8uLL);
  if (__dst[12]) {
    uint64_t v9 = __dst[11];
  }
  else {
    uint64_t v9 = 0x6D6F7250206F4E3CLL;
  }
  if (__dst[12]) {
    unint64_t v10 = __dst[12];
  }
  else {
    unint64_t v10 = 0xEB000000003E7470;
  }
  uint64_t v11 = v5 + 8;
  swift_beginAccess();
  v5[10] = v9;
  v5[11] = v10;
  sub_259843F00();
  sub_259843F00();
  swift_bridgeObjectRelease();
  memcpy(v37, __dst, sizeof(v37));
  CGRectMake(v37);
  uint64_t v12 = (uint64_t)(v5 + 12);
  sub_2594775E0(v12, (uint64_t)v38, &qword_26A38CA10);
  sub_2594775E0((uint64_t)v37, v12, &qword_26A38CA10);
  sub_2595F3FD4(__dst);
  sub_2595F3E80(v38);
  memcpy(v39, v11, sizeof(v39));
  memcpy(v40, v11, sizeof(v40));
  CGRectMake(v40);
  id v13 = objc_allocWithZone(MEMORY[0x263F08C38]);
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_2597F47CC((uint64_t)v39);
  id v14 = objc_msgSend(v13, sel_init);
  id v15 = objc_msgSend(v14, sel_UUIDString);

  uint64_t v16 = sub_2598440A0();
  uint64_t v18 = v17;

  __srca[0] = v9;
  __srca[1] = v10;
  __srca[2] = MEMORY[0x263F8EE78];
  __srca[3] = a4;
  __srca[4] = a2;
  __srca[5] = a3;
  __srca[6] = v16;
  __srca[7] = v18;
  sub_2594775E0((uint64_t)v40, (uint64_t)&__srca[8], &qword_26A38BFC8);
  if (qword_26A388C48 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_259843A80();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A3D2050);
  sub_25947EEE0((uint64_t)__srca);
  sub_25947EEE0((uint64_t)__srca);
  uint64_t v20 = sub_259843A50();
  os_log_type_t v21 = sub_259844B30();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v43 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    OUTLINED_FUNCTION_32_42(v23, v24, v25);
    Swift::String v26 = StoryMusicCuration.keySongInfo()();
    sub_259356D5C(v26._countAndFlagsBits, (unint64_t)v26._object, &v43);
    sub_259844E10();
    swift_bridgeObjectRelease();
    sub_259488494((uint64_t)__srca);
    sub_259488494((uint64_t)__srca);
    _os_log_impl(&dword_25934C000, v20, v21, "KeySongs curated: %s", v22, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
    sub_259488494((uint64_t)__srca);
    sub_259488494((uint64_t)__srca);
  }

  sub_25947EEE0((uint64_t)__srca);
  sub_25947EEE0((uint64_t)__srca);
  uint64_t v27 = sub_259843A50();
  os_log_type_t v28 = sub_259844B30();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v43 = v30;
    *(_DWORD *)uint64_t v29 = 136642819;
    OUTLINED_FUNCTION_32_42(v30, v31, v32);
    unint64_t v33 = StoryMusicCuration.description.getter();
    sub_259356D5C(v33, v34, &v43);
    sub_259844E10();
    swift_bridgeObjectRelease();
    sub_259488494((uint64_t)__srca);
    sub_259488494((uint64_t)__srca);
    _os_log_impl(&dword_25934C000, v27, v28, "Final %{sensitive}s", v29, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
    sub_259488494((uint64_t)__srca);
    sub_259488494((uint64_t)__srca);
  }

  return memcpy(a5, __srca, 0x220uLL);
}

id *StoryMusicCurator.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v2, v0 + 8, sizeof(v2));
  sub_2597F4374((uint64_t)v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 68));

  return v0;
}

uint64_t StoryMusicCurator.__deallocating_deinit()
{
  StoryMusicCurator.deinit();
  return MEMORY[0x270FA0228](v0, 592, 7);
}

uint64_t sub_2597F34C0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2597F3554;
  return static StoryMusicCurator.isUserEligibleForAppleMusic()();
}

uint64_t sub_2597F3554()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2597F361C()
{
  OUTLINED_FUNCTION_25();
  if (qword_26A388C48 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_259843A80();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3D2050);
  uint64_t v1 = sub_259843A50();
  os_log_type_t v2 = sub_259844B30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25934C000, v1, v2, "StoryMusicCurator prewarm done", v3, 2u);
    MEMORY[0x25A2E13A0](v3, -1, -1);
  }

  OUTLINED_FUNCTION_67();
  return v4();
}

uint64_t sub_2597F3728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2597F3838(a1, 0, 0, 0, 1, 0, 0);
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_259844680();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2597F3838(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2FFBD0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2597F4764(a1, (uint64_t)v16);
  uint64_t v17 = sub_259844740();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_2597F3F64((uint64_t)v16);
    uint64_t result = 0;
    if ((a2 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned __int8 v19 = sub_259844730();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    uint64_t result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if (a3) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if (a3)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if (a5) {
LABEL_6:
  }
    result |= 0x1000uLL;
LABEL_7:
  if (a6) {
    result |= 0x2000uLL;
  }
  if (a7) {
    return result | 0x4000;
  }
  return result;
}

uint64_t sub_2597F3998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a4);
  uint64_t v13 = sub_2597F4188(a1, (uint64_t)v11, v12, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, a4);
  return v13;
}

uint64_t sub_2597F3AB8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0[19])
  {
    if (v0[16])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  if (v0[22])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 296, 7);
}

uint64_t sub_2597F3BAC()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_24(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2593C2EE4;
  uint64_t v3 = OUTLINED_FUNCTION_60_21();
  return sub_2597F2A00(v3, v4, v5);
}

uint64_t sub_2597F3C4C()
{
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_26_46();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_24(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2593C35A0;
  uint64_t v3 = OUTLINED_FUNCTION_21_48();
  return sub_2597F2BDC(v3, v4, v5, v6);
}

uint64_t objectdestroy_10Tm_0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0[20])
  {
    if (v0[17])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  if (v0[23])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 35));
  return MEMORY[0x270FA0238](v0, 320, 7);
}

uint64_t sub_2597F3DF0()
{
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_26_46();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_24(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2593C35A0;
  uint64_t v3 = OUTLINED_FUNCTION_21_48();
  return sub_2597F2DB4(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2597F3E94()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2597F3ECC()
{
  OUTLINED_FUNCTION_25();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_24(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2593C2EE4;
  OUTLINED_FUNCTION_60_21();
  return sub_2597F34C0();
}

uint64_t sub_2597F3F64(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2FFBD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2597F3FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = type metadata accessor for LiveGenerativeMemorySafetyController(0);
  uint64_t v16 = &protocol witness table for LiveGenerativeMemorySafetyController;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init, a2);
  id v7 = objc_msgSend(v6, sel_UUIDString);

  uint64_t v8 = sub_2598440A0();
  uint64_t v10 = v9;

  *(void *)(a3 + 24) = v8;
  *(void *)(a3 + 32) = v10;
  *(_OWORD *)(a3 + 40) = xmmword_259897E40;
  *(void *)(a3 + 56) = 0xED000078694D6576;
  sub_2595F3CA8(v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A38CA48);
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v12 = sub_259843EE0();
  memset(__src, 0, 32);
  sub_2594775E0((uint64_t)v17, (uint64_t)&__src[2], &qword_26A38CA10);
  *(void *)&__src[17] = 0;
  *((void *)&__src[16] + 1) = 0;
  *((void *)&__src[17] + 1) = v12;
  *(void *)&__src[18] = v11;
  *(_OWORD *)((char *)&__src[18] + 8) = 0u;
  *(_OWORD *)((char *)&__src[19] + 8) = 0u;
  BYTE8(__src[20]) = 4;
  *(void *)&__src[21] = v11;
  WORD4(__src[21]) = 1026;
  BYTE10(__src[21]) = 0;
  memset(&__src[22], 0, 32);
  *(void *)&__src[24] = v11;
  *((void *)&__src[24] + 1) = v11;
  *(void *)&__src[25] = v11;
  *((void *)&__src[25] + 1) = v11;
  *(void *)&__src[26] = v11;
  *((void *)&__src[26] + 1) = v11;
  *(void *)&__src[27] = v11;
  *((void *)&__src[27] + 1) = v11;
  *(void *)&__src[28] = v11;
  *((void *)&__src[28] + 1) = v11;
  LOBYTE(__src[29]) = 2;
  *((void *)&__src[29] + 1) = v11;
  memcpy((void *)(a3 + 64), __src, 0x1E0uLL);
  *(void *)(a3 + 584) = 0;
  *(void *)(a3 + 16) = a1;
  sub_2593A2D00(&v14, a3 + 544);
  return a3;
}

uint64_t sub_2597F4188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v11 = objc_msgSend(v10, sel_UUIDString);

  uint64_t v12 = sub_2598440A0();
  uint64_t v14 = v13;

  *(void *)(a3 + 24) = v12;
  *(void *)(a3 + 32) = v14;
  *(_OWORD *)(a3 + 40) = xmmword_259897E40;
  *(void *)(a3 + 56) = 0xED000078694D6576;
  sub_2595F3CA8(v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A38CA48);
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v16 = sub_259843EE0();
  memset(__src, 0, 32);
  sub_2594775E0((uint64_t)v21, (uint64_t)&__src[2], &qword_26A38CA10);
  *(void *)&__src[17] = 0;
  *((void *)&__src[16] + 1) = 0;
  *((void *)&__src[17] + 1) = v16;
  *(void *)&__src[18] = v15;
  *(_OWORD *)((char *)&__src[18] + 8) = 0u;
  *(_OWORD *)((char *)&__src[19] + 8) = 0u;
  BYTE8(__src[20]) = 4;
  *(void *)&__src[21] = v15;
  WORD4(__src[21]) = 1026;
  BYTE10(__src[21]) = 0;
  memset(&__src[22], 0, 32);
  *(void *)&__src[24] = v15;
  *((void *)&__src[24] + 1) = v15;
  *(void *)&__src[25] = v15;
  *((void *)&__src[25] + 1) = v15;
  *(void *)&__src[26] = v15;
  *((void *)&__src[26] + 1) = v15;
  *(void *)&__src[27] = v15;
  *((void *)&__src[27] + 1) = v15;
  *(void *)&__src[28] = v15;
  *((void *)&__src[28] + 1) = v15;
  LOBYTE(__src[29]) = 2;
  *((void *)&__src[29] + 1) = v15;
  memcpy((void *)(a3 + 64), __src, 0x1E0uLL);
  *(void *)(a3 + 584) = 0;
  *(void *)(a3 + 16) = a1;
  sub_2593A2D00(&v18, a3 + 544);
  return a3;
}

uint64_t sub_2597F4374(uint64_t a1)
{
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 88);
  long long v8 = *(_OWORD *)(a1 + 112);
  long long v9 = *(_OWORD *)(a1 + 96);
  long long v6 = *(_OWORD *)(a1 + 144);
  long long v7 = *(_OWORD *)(a1 + 128);
  long long v4 = *(_OWORD *)(a1 + 176);
  long long v5 = *(_OWORD *)(a1 + 160);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25947EC20(v16, v15, v14, v13, v2, v12, v11, v10, v9, *((uint64_t *)&v9 + 1), v8, *((uint64_t *)&v8 + 1), v7, *((uint64_t *)&v7 + 1), v6, *((uint64_t *)&v6 + 1), v5, *((uint64_t *)&v5 + 1), v4,
    *((uint64_t *)&v4 + 1));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_2597F458C()
{
  unint64_t result = qword_26A391F08;
  if (!qword_26A391F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391F08);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StoryMusicCurationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x2597F46A4);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StoryMusicCurationError()
{
  return &type metadata for StoryMusicCurationError;
}

uint64_t type metadata accessor for StoryMusicCurator()
{
  return self;
}

uint64_t method lookup function for StoryMusicCurator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoryMusicCurator);
}

uint64_t dispatch thunk of StoryMusicCurator.__allocating_init(photoLibrary:safetyController:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_2597F472C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2597F4764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2FFBD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2597F47CC(uint64_t a1)
{
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 80);
  long long v9 = *(_OWORD *)(a1 + 112);
  long long v10 = *(_OWORD *)(a1 + 96);
  long long v7 = *(_OWORD *)(a1 + 144);
  long long v8 = *(_OWORD *)(a1 + 128);
  long long v5 = *(_OWORD *)(a1 + 176);
  long long v6 = *(_OWORD *)(a1 + 160);
  sub_259843F00();
  sub_259843F00();
  sub_25947F3D8(v16, v15, v14, v2, v3, v13, v12, v11, v10, *((uint64_t *)&v10 + 1), v9, *((uint64_t *)&v9 + 1), v8, *((uint64_t *)&v8 + 1), v7, *((uint64_t *)&v7 + 1), v6, *((uint64_t *)&v6 + 1), v5,
    *((uint64_t *)&v5 + 1));
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  sub_259843F00();
  return a1;
}

uint64_t OUTLINED_FUNCTION_24_52()
{
  return v0 + 4040;
}

uint64_t sub_2597F4A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
    sub_2594F1CF0();
    uint64_t v4 = a2;
    uint64_t v5 = v33;
    for (unint64_t i = (char *)(a1 + 32); ; i += 88)
    {
      memcpy(__dst, i, 0x58uLL);
      uint64_t v7 = *(void *)(v4 + 16);
      sub_2593A2D18((uint64_t)__dst);
      uint64_t v30 = v2;
      if (!v7) {
        goto LABEL_7;
      }
      sub_2593A2D18((uint64_t)__dst);
      uint64_t v8 = sub_25939D1E0();
      if ((v9 & 1) == 0) {
        break;
      }
      v10._rawValue = *(void **)(*(void *)(v4 + 56) + 8 * v8);
      sub_259843F00();
      sub_25945EA34((uint64_t)__dst);
      memcpy(v31, __dst, sizeof(v31));
      sub_2593A2D18((uint64_t)__dst);
      QueryToken.addRetrievalResults(_:)(v10);
      swift_bridgeObjectRelease();
      sub_25945EA34((uint64_t)__dst);
LABEL_8:
      uint64_t v11 = v5;
      uint64_t v13 = v31[0];
      uint64_t v12 = v31[1];
      char v14 = v31[2];
      long long v15 = *(_OWORD *)&v31[3];
      char v16 = v31[5];
      uint64_t v18 = v31[6];
      uint64_t v17 = v31[7];
      char v19 = v31[8];
      unint64_t v21 = *(void *)(v5 + 16);
      unint64_t v20 = *(void *)(v5 + 24);
      long long v22 = *(_OWORD *)&v31[9];
      uint64_t v33 = v5;
      if (v21 >= v20 >> 1)
      {
        long long v28 = *(_OWORD *)&v31[3];
        uint64_t v27 = v31[1];
        char v26 = v31[8];
        long long v25 = *(_OWORD *)&v31[9];
        sub_2594F1CF0();
        long long v22 = v25;
        char v19 = v26;
        uint64_t v12 = v27;
        long long v15 = v28;
        uint64_t v4 = a2;
        uint64_t v11 = v33;
      }
      *(void *)(v11 + 16) = v21 + 1;
      uint64_t v5 = v11;
      uint64_t v23 = v11 + 88 * v21;
      *(void *)(v23 + 32) = v13;
      *(void *)(v23 + 40) = v12;
      *(unsigned char *)(v23 + 48) = v14;
      *(_OWORD *)(v23 + 56) = v15;
      *(unsigned char *)(v23 + 72) = v16;
      *(void *)(v23 + 80) = v18;
      *(void *)(v23 + 88) = v17;
      *(unsigned char *)(v23 + 96) = v19;
      *(_OWORD *)(v23 + 104) = v22;
      uint64_t v2 = v30 - 1;
      if (v30 == 1)
      {
        swift_bridgeObjectRelease();
        return v5;
      }
    }
    sub_25945EA34((uint64_t)__dst);
LABEL_7:
    memcpy(v31, __dst, sizeof(v31));
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2597F4C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v32 = v2;
  uint64_t v45 = MEMORY[0x263F8EE78];
  sub_2594F1CF0();
  uint64_t v6 = v45;
  uint64_t v7 = a1 + 56;
  uint64_t v34 = a2;
  do
  {
    uint64_t v38 = v6;
    uint64_t v8 = *(void *)(v7 - 16);
    char v35 = *(unsigned char *)(v7 - 8);
    uint64_t v40 = *(void *)v7;
    uint64_t v41 = *(void *)(v7 - 24);
    uint64_t v42 = *(void *)(v7 + 8);
    int v9 = *(unsigned __int8 *)(v7 + 16);
    uint64_t v11 = *(void *)(v7 + 24);
    uint64_t v10 = *(void *)(v7 + 32);
    char v12 = *(unsigned char *)(v7 + 40);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_259843F00();
    sub_259843F00();
    uint64_t v43 = v8;
    HIDWORD(v39) = v9;
    if ((v9 & 1) != 0 || !*(void *)(v34 + 16))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = v40;
LABEL_9:
      char v21 = v12;
      uint64_t v6 = v38;
      char v22 = v35;
      goto LABEL_10;
    }
    uint64_t v13 = v40;
    unint64_t v14 = sub_25939D52C();
    if ((v15 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    id v16 = *(id *)(*(void *)(v34 + 56) + 8 * v14);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25935633C(0, (unint64_t *)&qword_26A38D4C8);
    id v17 = v16;
    id v36 = sub_2596E161C(v17, 0);
    id v18 = objc_msgSend(v36, sel_suggestion);
    if (v18)
    {
      char v19 = v18;
      sub_259632804();
    }
    else
    {
      id v25 = objc_msgSend(v36, sel_QUToken);
      if (!v25)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        uint64_t v11 = 0;
        char v21 = 0;
        char v22 = 1;
        uint64_t v10 = MEMORY[0x263F8EE78];
        goto LABEL_18;
      }
      char v19 = v25;
      sub_25963365C((uint64_t)v25, v41, v43, 0, v26, v27, v28, v29, v32, v33, v34, (uint64_t)v36, v38, v39, v40, v41, v42, v43, v44,
        v45);
    }
    uint64_t v33 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v40;
    swift_bridgeObjectRelease();

    uint64_t v11 = 0;
    char v21 = 0;
    char v22 = 1;
    uint64_t v10 = v33;
LABEL_18:
    uint64_t v6 = v38;
LABEL_10:
    uint64_t v45 = v6;
    unint64_t v23 = *(void *)(v6 + 16);
    if (v23 >= *(void *)(v6 + 24) >> 1)
    {
      char v30 = v21;
      char v37 = v22;
      sub_2594F1CF0();
      char v22 = v37;
      char v21 = v30;
      uint64_t v6 = v45;
    }
    *(void *)(v6 + 16) = v23 + 1;
    uint64_t v24 = v6 + 88 * v23;
    *(void *)(v24 + 32) = v41;
    *(void *)(v24 + 40) = v43;
    *(unsigned char *)(v24 + 48) = v22;
    *(void *)(v24 + 56) = v13;
    *(void *)(v24 + 64) = v42;
    *(unsigned char *)(v24 + 72) = BYTE4(v39);
    *(void *)(v24 + 80) = v11;
    *(void *)(v24 + 88) = v10;
    *(unsigned char *)(v24 + 96) = v21;
    *(void *)(v24 + 104) = 0;
    *(void *)(v24 + 112) = 0;
    v7 += 88;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t QueryGeneratorContext.init(photoLibrary:storyAssetsFetcher:momentGroundingProcessor:momentBasedGroundingAndAssetsFetchingProcessor:queryDisambiguationSuggestionProducer:storyGenerationCache:safetyController:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, long long *a7@<X6>, void *a8@<X8>)
{
  uint64_t v14 = *(void *)(a6 + 16);
  *a8 = a1;
  sub_2593A2D00(a2, (uint64_t)(a8 + 1));
  a8[6] = a3;
  sub_2593A2D00(a4, (uint64_t)(a8 + 7));
  GeneratorContext = (int *)type metadata accessor for QueryGeneratorContext(0);
  sub_2597F50C4(a5, (uint64_t)a8 + GeneratorContext[8]);
  id v16 = (char *)a8 + GeneratorContext[9];
  *(_OWORD *)id v16 = *(_OWORD *)a6;
  *((void *)v16 + 2) = v14;
  uint64_t v17 = (uint64_t)a8 + GeneratorContext[10];
  return sub_2593A2D00(a7, v17);
}

uint64_t type metadata accessor for QueryGeneratorContext(uint64_t a1)
{
  return sub_25938CAE0(a1, (uint64_t *)&unk_26A391F48);
}

uint64_t sub_2597F50C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t QueryGenerator.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_26A388C58 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_259843A80();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26A3D2070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v5, v4);
  uint64_t Generator = type metadata accessor for QueryGenerator(0);
  return sub_2597FD4D8(a1, a2 + *(int *)(Generator + 20), (void (*)(void))type metadata accessor for QueryGeneratorContext);
}

uint64_t QueryGenerator.performQueryUnderstanding(for:previousUserPrompt:previousQueryTokens:userSuggestionByRange:storyGenerationDiagnosticsContext:eventRecorder:progressReporter:)()
{
  OUTLINED_FUNCTION_14();
  v1[50] = v2;
  v1[51] = v0;
  v1[48] = v3;
  v1[49] = v4;
  v1[46] = v5;
  v1[47] = v6;
  v1[44] = v7;
  v1[45] = v8;
  v1[43] = v9;
  type metadata accessor for RootEventRecorder.EventState(0);
  v1[52] = OUTLINED_FUNCTION_78();
  uint64_t v10 = sub_259843A80();
  v1[53] = v10;
  OUTLINED_FUNCTION_1(v10);
  v1[54] = v11;
  v1[55] = OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_2597F52C0()
{
  OUTLINED_FUNCTION_106();
  v1();
  uint64_t v2 = sub_259843A50();
  os_log_type_t v3 = sub_259844B70();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_25934C000, v2, v3, "Perform query understanding", v4, 2u);
    OUTLINED_FUNCTION_61_0();
  }
  uint64_t v6 = *(void *)(v0 + 432);
  uint64_t v5 = *(void *)(v0 + 440);
  uint64_t v7 = *(void *)(v0 + 424);
  uint64_t v8 = *(void **)(v0 + 392);
  uint64_t v9 = *(void **)(v0 + 400);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v10 = v8[3];
  uint64_t v11 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v10);
  (*(void (**)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 24))("QueryGenerator.performQueryUnderstanding", 40, 2, v10, v11);
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  OUTLINED_FUNCTION_182();
  sub_2598435C0();
  if (v11)
  {
    uint64_t v12 = v8[3];
    uint64_t v13 = v8[4];
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 392), v12);
    uint64_t v14 = OUTLINED_FUNCTION_27_5();
    v15(v14, v12, v13);
    sub_2597FFA60(*(void *)(v0 + 416), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    return v16();
  }
  id v18 = *(void **)(v0 + 352);
  uint64_t v19 = *(void *)(v0 + 360);
  uint64_t v21 = v8[3];
  uint64_t v20 = v8[4];
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 392), v21);
  (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v20 + 16))(0xD000000000000012, 0x80000002598666F0, v21, v20);
  id v22 = objc_msgSend(v18, sel_string);
  uint64_t v23 = sub_2598440A0();
  uint64_t v25 = v24;

  *(void *)(v0 + 448) = v23;
  *(void *)(v0 + 456) = v25;
  *(void *)(v0 + 168) = &type metadata for PhotosFeatureFlags;
  *(void *)(v0 + 176) = sub_2596385B8();
  *(unsigned char *)(v0 + 144) = 4;
  *(unsigned char *)(v0 + 81) = sub_259842B80() & 1;
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  if (!v19) {
    goto LABEL_13;
  }
  uint64_t v26 = *(void **)(v0 + 352);
  id v27 = *(id *)(v0 + 360);
  id v28 = objc_msgSend(v26, sel_string);
  uint64_t v29 = sub_2598440A0();
  uint64_t v31 = v30;

  id v32 = objc_msgSend(v27, sel_string);
  uint64_t v33 = sub_2598440A0();
  uint64_t v35 = v34;

  if (v29 == v33 && v31 == v35)
  {

    OUTLINED_FUNCTION_193_0();
  }
  else
  {
    char v37 = sub_259845750();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
LABEL_13:
      uint64_t v38 = *(void *)(v0 + 384);
      if (v38)
      {
        uint64_t v39 = (unsigned char *)(v38 + OBJC_IVAR____TtC18PhotosIntelligence32StoryGenerationDiagnosticContext_generationStage);
        OUTLINED_FUNCTION_57();
        unsigned char *v39 = 3;
      }
      swift_task_alloc();
      OUTLINED_FUNCTION_53_0();
      *(void *)(v0 + 464) = v40;
      *uint64_t v40 = v41;
      v40[1] = sub_2597F58A4;
      return QueryGenerator.llmQUAnnotatedQueryString(of:eventRecorder:)();
    }
  }
  uint64_t v42 = *(void *)(v0 + 376);
  if (*(void *)(v0 + 368)) {
    uint64_t v43 = *(void *)(v0 + 368);
  }
  else {
    uint64_t v43 = MEMORY[0x263F8EE78];
  }
  sub_259843F00();
  sub_259843F00();
  uint64_t v44 = sub_2597F4C20(v43, v42);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 496) = 0;
  *(void *)(v0 + 504) = v44;
  *(void *)(v0 + 480) = 0;
  *(void *)(v0 + 488) = 0;
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 400), *(void *)(*(void *)(v0 + 400) + 24));
  OUTLINED_FUNCTION_42_37();
  sub_2598435D0();
  uint64_t v45 = *(void *)(v0 + 384);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 400), *(void *)(*(void *)(v0 + 400) + 24));
  OUTLINED_FUNCTION_42_37();
  sub_259843580();
  if (v45)
  {
    long long v46 = (unsigned char *)(*(void *)(v0 + 384)
                  + OBJC_IVAR____TtC18PhotosIntelligence32StoryGenerationDiagnosticContext_generationStage);
    OUTLINED_FUNCTION_57();
    *long long v46 = 4;
  }
  *(void *)(v0 + 264) = 0;
  *(void *)(v0 + 272) = 0;
  *(void *)(v0 + 280) = 0;
  uint64_t v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v47;
  void *v47 = v0;
  v47[1] = sub_2597F5C9C;
  OUTLINED_FUNCTION_37_32();
  return QueryGenerator.resolveQueryUnderstanding(with:currentQueryTokens:previousQueryTokens:isModifiedByUser:isLLMQU:promptBindingRecipe:llmQULatency:eventRecorder:progressReporter:storyGenerationDiagnosticsContext:)();
}

uint64_t sub_2597F58A4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  *(void *)(v3 + 472) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597F598C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 224), *(void *)(v0 + 248));
  sub_2597D7978();
  uint64_t v5 = v4;
  sub_25947F554(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25947ED9C(v1);
  uint64_t v6 = *(void *)(v0 + 472);
  *(void *)(v0 + 496) = v3;
  *(void *)(v0 + 504) = v5;
  *(void *)(v0 + 480) = v1;
  *(void *)(v0 + 488) = v2;
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 400), *(void *)(*(void *)(v0 + 400) + 24));
  sub_2598435D0();
  if (v6)
  {
    uint64_t v7 = *(void **)(v0 + 392);
    swift_bridgeObjectRelease();
    sub_25947ED9C(v1);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 224);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    OUTLINED_FUNCTION_14_0();
    v8();
    sub_2597FFA60(*(void *)(v0 + 416), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    return v9();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 384);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 400), *(void *)(*(void *)(v0 + 400) + 24));
    sub_259843580();
    if (v11)
    {
      uint64_t v12 = (unsigned char *)(*(void *)(v0 + 384)
                    + OBJC_IVAR____TtC18PhotosIntelligence32StoryGenerationDiagnosticContext_generationStage);
      OUTLINED_FUNCTION_57();
      *uint64_t v12 = 4;
    }
    *(void *)(v0 + 264) = v1;
    *(void *)(v0 + 272) = v2;
    *(void *)(v0 + 280) = v3;
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 512) = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_2597F5C9C;
    OUTLINED_FUNCTION_37_32();
    return QueryGenerator.resolveQueryUnderstanding(with:currentQueryTokens:previousQueryTokens:isModifiedByUser:isLLMQU:promptBindingRecipe:llmQULatency:eventRecorder:progressReporter:storyGenerationDiagnosticsContext:)();
  }
}

uint64_t sub_2597F5C9C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  *(void *)(v3 + 520) = v0;
  swift_task_dealloc();
  sub_25947ED9C(*(void *)(v3 + 480));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597F5DBC()
{
  uint64_t v17 = v0 + 184;
  uint64_t v18 = v0 + 224;
  uint64_t v1 = *(void *)(v0 + 520);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v4 = *(void **)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v16 = *(void *)(v0 + 128);
  char v15 = *(unsigned char *)(v0 + 136);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 400), *(void *)(*(void *)(v0 + 400) + 24));
  sub_2598435E0();
  if (v1)
  {
    uint64_t v7 = *(void **)(v0 + 392);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v17);
    __swift_destroy_boxed_opaque_existential_1(v18);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    OUTLINED_FUNCTION_14_0();
    v8();
    sub_2597FFA60(*(void *)(v0 + 416), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 416);
    uint64_t v11 = *(void **)(v0 + 392);
    uint64_t v12 = *(void *)(v0 + 344);
    __swift_destroy_boxed_opaque_existential_1(v17);
    __swift_destroy_boxed_opaque_existential_1(v18);
    *(void *)uint64_t v12 = v3;
    *(void *)(v12 + 8) = v2;
    *(void *)(v12 + 16) = v4;
    *(void *)(v12 + 24) = v5;
    *(void *)(v12 + 32) = v6;
    *(void *)(v12 + 40) = v16;
    *(unsigned char *)(v12 + 48) = v15;
    __swift_project_boxed_opaque_existential_1(v11, v11[3]);
    OUTLINED_FUNCTION_14_0();
    v13();
    sub_2597FFA60(v10, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_20_0();
  }
  return v9();
}

uint64_t sub_2597F5FAC()
{
  OUTLINED_FUNCTION_25();
  uint64_t v1 = *(void **)(v0 + 392);
  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  OUTLINED_FUNCTION_27_5();
  OUTLINED_FUNCTION_41_0();
  v2();
  sub_2597FFA60(*(void *)(v0 + 416), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  return v3();
}

uint64_t sub_2597F6070()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  uint64_t v1 = *(void **)(v0 + 392);
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  OUTLINED_FUNCTION_14_0();
  v2();
  sub_2597FFA60(*(void *)(v0 + 416), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_160();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t QueryGenerator.resolveQueryUnderstanding(with:currentQueryTokens:previousQueryTokens:isModifiedByUser:isLLMQU:promptBindingRecipe:llmQULatency:eventRecorder:progressReporter:storyGenerationDiagnosticsContext:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = v2;
  *(void *)(v1 + 544) = v0;
  *(void *)(v1 + 536) = v25;
  *(void *)(v1 + 528) = v24;
  *(void *)(v1 + 520) = v23;
  *(unsigned char *)(v1 + 68) = v22;
  *(unsigned char *)(v1 + 67) = v4;
  *(unsigned char *)(v1 + 66) = v5;
  *(void *)(v1 + 504) = v6;
  *(void *)(v1 + 512) = v21;
  *(void *)(v1 + 488) = v7;
  *(void *)(v1 + 496) = v8;
  *(void *)(v1 + 472) = v9;
  *(void *)(v1 + 480) = v10;
  uint64_t v11 = sub_259843A80();
  *(void *)(v1 + 552) = v11;
  OUTLINED_FUNCTION_1(v11);
  *(void *)(v1 + 560) = v12;
  *(void *)(v1 + 568) = swift_task_alloc();
  *(void *)(v1 + 576) = swift_task_alloc();
  *(void *)(v1 + 584) = swift_task_alloc();
  *(void *)(v1 + 592) = swift_task_alloc();
  *(void *)(v1 + 600) = swift_task_alloc();
  uint64_t Generator = type metadata accessor for QueryGenerator(0);
  OUTLINED_FUNCTION_1(Generator);
  *(void *)(v1 + 608) = v14;
  *(void *)(v1 + 616) = *(void *)(v15 + 64);
  *(void *)(v1 + 624) = OUTLINED_FUNCTION_78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2FFBD0);
  *(void *)(v1 + 632) = OUTLINED_FUNCTION_78();
  type metadata accessor for RootEventRecorder.EventState(0);
  *(void *)(v1 + 640) = OUTLINED_FUNCTION_78();
  *(_OWORD *)(v1 + 648) = *(_OWORD *)v3;
  *(void *)(v1 + 664) = *(void *)(v3 + 16);
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v16, v17, v18);
}

uint64_t sub_2597F62DC()
{
  uint64_t v1 = *(void **)(v0 + 528);
  uint64_t v2 = *(void **)(v0 + 520);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  OUTLINED_FUNCTION_26_0();
  v3();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  OUTLINED_FUNCTION_54_34();
  v4();
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_2598435C0();
  uint64_t v5 = *(void *)(v0 + 632);
  uint64_t v6 = *(void *)(v0 + 624);
  uint64_t v27 = *(void *)(v0 + 616);
  uint64_t v26 = *(void *)(v0 + 608);
  uint64_t v7 = *(void *)(v0 + 544);
  uint64_t v31 = *(void **)(v0 + 528);
  Swift::String v8 = *(Swift::String *)(v0 + 480);
  object = v8._object;
  v29._rawValue = *(void **)(v0 + 496);
  uint64_t countAndFlagsBits = v8._countAndFlagsBits;
  *(NSAttributedString *)(v0 + 672) = QueryGenerator.annotateQueryString(_:with:)(v8, v29);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 72), *(void *)(v0 + 96));
  unint64_t v9 = OUTLINED_FUNCTION_46_33();
  v10(v9);
  uint64_t v11 = sub_259844740();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v11);
  sub_2597FFA00(v7, v6, (void (*)(void))type metadata accessor for QueryGenerator);
  sub_259353FF0(v0 + 112, v0 + 152);
  unint64_t v12 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v13 = (v27 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  sub_2597FD4D8(v6, v15 + v12, (void (*)(void))type metadata accessor for QueryGenerator);
  uint64_t v16 = (uint64_t *)(v15 + v13);
  *uint64_t v16 = countAndFlagsBits;
  v16[1] = (uint64_t)object;
  *(Swift::OpaquePointer *)(v15 + v14) = v29;
  sub_2593A2D00((long long *)(v0 + 152), v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8));
  sub_259843F00();
  sub_259843F00();
  *(void *)(v0 + 680) = sub_25954A1A0(v5, (uint64_t)&unk_26A391F28, v15);
  __swift_project_boxed_opaque_existential_1(v31, v1[3]);
  OUTLINED_FUNCTION_40_22();
  sub_259843580();
  swift_task_alloc();
  OUTLINED_FUNCTION_53_0();
  *(void *)(v0 + 688) = v17;
  *uint64_t v17 = v18;
  v17[1] = sub_2597F6704;
  OUTLINED_FUNCTION_42();
  return sub_2597F9350(v19, v20, v21, v22, v23);
}

uint64_t sub_2597F6704()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v5 = v4;
  *(void *)(v6 + 696) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597F67E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_25();
  *(_OWORD *)(v10 + 704) = *(_OWORD *)(v10 + 320);
  *(void *)(v10 + 720) = *(void *)(v10 + 336);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v10 + 728) = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A389D00);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A38C860);
  *uint64_t v11 = v10;
  v11[1] = sub_2597F68C4;
  uint64_t v17 = *(void *)(v10 + 680);
  uint64_t v18 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB8](v10 + 392, v17, v12, v13, v18, v14, v15, v16, a9, a10);
}

uint64_t sub_2597F68C4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_9();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2597F6990()
{
  uint64_t v86 = v0;
  uint64_t v1 = v0 + 72;
  uint64_t v2 = v0 + 112;
  uint64_t v3 = *(void **)(v0 + 392);
  *(void *)(v0 + 736) = v3;
  uint64_t v84 = v0 + 192;
  if (*(unsigned char *)(v0 + 400) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 600);
    uint64_t v5 = *(void *)(v0 + 560);
    uint64_t v6 = *(void *)(v0 + 552);
    uint64_t v7 = *(void *)(v0 + 544);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    uint64_t v8 = v3;
    uint64_t v9 = v3;
    uint64_t v10 = sub_259843A50();
    os_log_type_t v11 = sub_259844B50();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_54();
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      uint64_t v14 = v3;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 424) = v15;
      sub_259844E10();
      *uint64_t v13 = v15;
      sub_259431E8C(v3, 1);
      sub_259431E8C(v3, 1);
      _os_log_impl(&dword_25934C000, v10, v11, "User prompt did not pass safety validation due to %@!", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F83A0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_61_0();
      OUTLINED_FUNCTION_61_0();
    }
    else
    {
      sub_259431E8C(v3, 1);
      sub_259431E8C(v3, 1);
    }
    uint64_t v31 = *(void **)(v0 + 672);
    uint64_t v32 = *(void *)(v0 + 600);
    uint64_t v33 = *(void *)(v0 + 560);
    uint64_t v34 = *(void *)(v0 + 552);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    swift_willThrow();
    swift_release();

    __swift_destroy_boxed_opaque_existential_1(v84);
    __swift_destroy_boxed_opaque_existential_1(v0 + 112);
LABEL_11:
    __swift_destroy_boxed_opaque_existential_1(v1);
    uint64_t v40 = *(void *)(v0 + 640);
    OUTLINED_FUNCTION_17_50();
    uint64_t v41 = OUTLINED_FUNCTION_2_89(*(void **)(v0 + 520));
    v42(v41);
    sub_2597FFA60(v40, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_42();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v16 = *(void *)(v0 + 592);
  uint64_t v17 = *(void *)(v0 + 560);
  uint64_t v18 = *(void *)(v0 + 552);
  uint64_t v19 = *(void *)(v0 + 544);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  *(void *)(v0 + 744) = v20;
  *(void *)(v0 + 752) = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v20(v16, v19, v18);
  sub_2595E7250(v3, 0);
  sub_2595E7250(v3, 0);
  sub_259843F00();
  uint64_t v21 = sub_259843A50();
  os_log_type_t v22 = sub_259844B70();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v24 = *(void *)(v0 + 592);
  uint64_t v25 = *(void *)(v0 + 560);
  if (v23)
  {
    uint64_t v82 = *(void *)(v0 + 552);
    uint64_t v26 = swift_slowAlloc();
    v85[0] = OUTLINED_FUNCTION_20();
    *(_DWORD *)uint64_t v26 = 134218243;
    *(void *)(v0 + 456) = v3[2];
    sub_259844E10();
    OUTLINED_FUNCTION_60_28();
    *(_WORD *)(v26 + 12) = 2085;
    sub_2595009EC();
    sub_259843F00();
    uint64_t v27 = sub_259844930();
    unint64_t v29 = v28;
    OUTLINED_FUNCTION_60_28();
    *(void *)(v0 + 464) = sub_259356D5C(v27, v29, v85);
    uint64_t v2 = v0 + 112;
    sub_259844E10();
    uint64_t v1 = v0 + 72;
    swift_bridgeObjectRelease();
    sub_259431E8C(v3, 0);
    OUTLINED_FUNCTION_60_28();
    _os_log_impl(&dword_25934C000, v21, v22, "Detected %ld sensitive content types in prompt: %{sensitive}s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();

    uint64_t v30 = *(void (**)(void))(v25 + 8);
    ((void (*)(uint64_t, uint64_t))v30)(v24, v82);
  }
  else
  {
    sub_259431E8C(v3, 0);
    sub_259431E8C(v3, 0);
    swift_bridgeObjectRelease();

    uint64_t v30 = *(void (**)(void))(v25 + 8);
    uint64_t v35 = OUTLINED_FUNCTION_86_0();
    ((void (*)(uint64_t, uint64_t))v30)(v35, v36);
  }
  *(void *)(v0 + 760) = v30;
  uint64_t v37 = *(void *)(v0 + 696);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 528), *(void *)(*(void *)(v0 + 528) + 24));
  OUTLINED_FUNCTION_18_44();
  uint64_t v38 = *(void *)(v0 + 720);
  if (v37)
  {
    uint64_t v39 = *(void **)(v0 + 672);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_60_28();
    __swift_destroy_boxed_opaque_existential_1(v84);
    __swift_destroy_boxed_opaque_existential_1(v2);
    goto LABEL_11;
  }
  sub_259843F00();
  uint64_t v45 = sub_25976EB14(0, v38);
  *(void *)(v0 + 768) = v45;
  OUTLINED_FUNCTION_106();
  v46();
  swift_bridgeObjectRetain_n();
  uint64_t v47 = sub_259843A50();
  os_log_type_t v48 = sub_259844B70();
  uint64_t v83 = v30;
  if (os_log_type_enabled(v47, v48))
  {
    long long v49 = (uint8_t *)OUTLINED_FUNCTION_54();
    v85[0] = OUTLINED_FUNCTION_20();
    *(_DWORD *)long long v49 = 136315138;
    if (v45)
    {
      *(void *)(v0 + 448) = *(void *)(v45 + 16);
      sub_2594070BC();
      uint64_t v50 = sub_259844EE0();
      unint64_t v52 = v51;
    }
    else
    {
      unint64_t v52 = 0xE300000000000000;
      uint64_t v50 = 7104878;
    }
    *(void *)(v0 + 440) = sub_259356D5C(v50, v52, v85);
    sub_259844E10();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_171_0();
    _os_log_impl(&dword_25934C000, v47, v48, "%s person consolidated asset uuids during QU", v49, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();

    uint64_t v30 = v83;
    OUTLINED_FUNCTION_12();
    v83();
  }
  else
  {
    OUTLINED_FUNCTION_171_0();

    OUTLINED_FUNCTION_12();
    v30();
  }
  uint64_t v53 = *(void *)(v0 + 536);
  if (v53)
  {
    char v54 = *(unsigned char *)(v0 + 67);
    char v55 = *(unsigned char *)(v0 + 66);
    uint64_t v56 = *(void *)(v53 + OBJC_IVAR____TtC18PhotosIntelligence32StoryGenerationDiagnosticContext_statistics);
    swift_beginAccess();
    id v57 = *(unsigned char **)(v56 + 16);
    OUTLINED_FUNCTION_57();
    v57[16] = v55;
    v57[34] = v54;
    swift_retain();
  }
  else
  {
    id v57 = 0;
  }
  *(void *)(v0 + 776) = v57;
  sub_259843F00();
  sub_2597CE2FC();
  uint64_t v59 = *(void *)(v58 + 16);
  swift_bridgeObjectRelease();
  if (v59)
  {
    swift_bridgeObjectRelease();
    int v60 = 1;
  }
  else if (*(void *)(v0 + 504))
  {
    sub_2597CE2FC();
    BOOL v62 = *(void *)(v61 + 16) != 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v60 = 2 * v62;
  }
  else
  {
    swift_bridgeObjectRelease();
    int v60 = 0;
  }
  *(unsigned char *)(v0 + 69) = v60;
  if (v57) {
    v57[33] = v60;
  }
  OUTLINED_FUNCTION_106();
  v63();
  uint64_t v64 = sub_259843A50();
  os_log_type_t v65 = sub_259844B70();
  if (!os_log_type_enabled(v64, v65))
  {

    OUTLINED_FUNCTION_12();
    v30();
    goto LABEL_45;
  }
  int v66 = *(unsigned __int8 *)(v0 + 66);
  uint64_t v67 = swift_slowAlloc();
  v85[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v67 = 136315394;
  if (v66) {
    uint64_t v68 = 0x6465696669646F6DLL;
  }
  else {
    uint64_t v68 = 0x69646F6D20746F6ELL;
  }
  if (v66) {
    unint64_t v69 = 0xE800000000000000;
  }
  else {
    unint64_t v69 = 0xEC00000064656966;
  }
  *(void *)(v0 + 408) = sub_259356D5C(v68, v69, v85);
  OUTLINED_FUNCTION_86_0();
  sub_259844E10();
  swift_bridgeObjectRelease();
  *(_WORD *)(v67 + 12) = 2080;
  if (!v60)
  {
    unint64_t v70 = 0xEC00000073756F75;
    unsigned int v72 = 1097756526;
LABEL_43:
    uint64_t v71 = v72 | 0x6769626D00000000;
    goto LABEL_44;
  }
  if (v60 != 1)
  {
    unint64_t v70 = 0xED00006465746175;
    unsigned int v72 = 1634953572;
    goto LABEL_43;
  }
  unint64_t v70 = 0xE900000000000073;
  uint64_t v71 = 0x756F756769626D61;
LABEL_44:
  *(void *)(v0 + 416) = sub_259356D5C(v71, v70, v85);
  sub_259844E10();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25934C000, v64, v65, "The user prompt is %s by the user with prompt ambiguity state = %s", (uint8_t *)v67, 0x16u);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_61_0();
  OUTLINED_FUNCTION_61_0();

  OUTLINED_FUNCTION_12();
  v73();
LABEL_45:
  uint64_t v74 = *(void *)(v0 + 720);
  *(_OWORD *)(v0 + 272) = *(_OWORD *)(v0 + 704);
  *(void *)(v0 + 288) = v74;
  uint64_t v75 = (void *)swift_task_alloc();
  *(void *)(v0 + 784) = v75;
  void *v75 = v0;
  v75[1] = sub_2597F7428;
  OUTLINED_FUNCTION_42();
  return sub_2597FA60C(v76, v77, v78, v79);
}

uint64_t sub_2597F7428()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  v3[99] = v5;
  v3[100] = v6;
  v3[101] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = (void *)v3[92];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_259431E8C(v7, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2597F7560()
{
  uint64_t v98 = v0;
  uint64_t v88 = v0 + 72;
  uint64_t v2 = v0 + 112;
  uint64_t v3 = v0 + 192;
  uint64_t v4 = *(void **)(v0 + 808);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 528), *(void *)(*(void *)(v0 + 528) + 24));
  sub_2598435D0();
  if (v4)
  {
    uint64_t v5 = *(void **)(v0 + 736);
    OUTLINED_FUNCTION_49_33();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_259431E8C(v5, 0);
    uint64_t v6 = v0 + 192;
    goto LABEL_3;
  }
  if (*(unsigned char *)(v0 + 66) != 1)
  {
    unint64_t v28 = *(void **)(v0 + 672);
    sub_259843F00();
    sub_259843F00();
    id v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v30 = OUTLINED_FUNCTION_24_53();
    v31(v30);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v32 = v1;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v33 = v32;
    uint64_t v34 = sub_259843A50();
    os_log_type_t v35 = sub_259844B70();
    log = v34;
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v37 = *(void *)(v0 + 800);
    uint64_t v38 = *(void *)(v0 + 792);
    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 760);
    uint64_t v40 = *(void **)(v0 + 736);
    uint64_t v41 = *(void **)(v0 + 672);
    uint64_t v42 = *(void *)(v0 + 568);
    uint64_t v43 = *(void *)(v0 + 552);
    if (v36)
    {
      char v76 = *(unsigned char *)(v0 + 68);
      uint64_t v44 = *(void *)(v0 + 512);
      os_log_type_t type = v35;
      uint64_t v45 = *(void *)(v0 + 768);
      long long v46 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v89 = OUTLINED_FUNCTION_20();
      *(_DWORD *)long long v46 = 136642819;
      uint64_t v91 = v37;
      uint64_t v92 = v38;
      uint64_t v93 = v41;
      uint64_t v94 = v40;
      uint64_t v95 = v45;
      uint64_t v96 = v44;
      char v97 = v76 & 1;
      uint64_t Understanding = QueryUnderstandingResult.description.getter();
      *(void *)(v0 + 432) = sub_259356D5C(Understanding, v48, (uint64_t *)&v89);
      uint64_t v3 = v0 + 192;
      sub_259844E10();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_193_0();
      OUTLINED_FUNCTION_77();

      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_171_0();
      _os_log_impl(&dword_25934C000, log, type, "Query understanding unint64_t result = \n%{sensitive}s", v46, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_61_0();
      OUTLINED_FUNCTION_61_0();

      OUTLINED_FUNCTION_12();
      v49();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_77();

      OUTLINED_FUNCTION_171_0();
      swift_bridgeObjectRelease_n();
      v39(v42, v43);
    }
    uint64_t v2 = v0 + 112;
    uint64_t v50 = *(void *)(v0 + 776);
    if (v50)
    {
      uint64_t v51 = *(void *)(v0 + 792);
      uint64_t v52 = *(void *)(v0 + 480);
      uint64_t v40 = *(void **)(v0 + 488);
      *(void *)(v50 + 24) = *(void *)(*(void *)(v0 + 800) + 16);
      swift_retain();
      sub_259794FB0(v51);
      swift_release();
      swift_retain();
      sub_2597954BC(v52, (uint64_t)v40);
      swift_release();
    }
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 528), *(void *)(*(void *)(v0 + 528) + 24));
    OUTLINED_FUNCTION_182();
    sub_2598435D0();
    uint64_t v53 = *(void *)(v0 + 800);
    uint64_t v54 = *(void *)(v0 + 792);
    if (!v40)
    {
      uint64_t v55 = OUTLINED_FUNCTION_20_57();
      uint64_t v91 = v53;
      uint64_t v92 = v54;
      uint64_t v93 = v57;
      uint64_t v94 = v56;
      uint64_t v95 = v58;
      uint64_t v96 = v59;
      char v97 = v60 & 1;
      long long v89 = *v61;
      uint64_t v90 = v62;
      sub_2597FC964(v55, v54, v53, v63, v64, (uint64_t)&v91, v65, &v89);
      uint64_t v85 = v3;
      int v66 = *(void **)(v0 + 528);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_project_boxed_opaque_existential_1(v66, v66[3]);
      OUTLINED_FUNCTION_42_37();
      sub_2598435E0();
      uint64_t v67 = *(void *)(v0 + 800);
      uint64_t v68 = *(void *)(v0 + 792);
      uint64_t v69 = *(void *)(v0 + 768);
      uint64_t v70 = *(void *)(v0 + 736);
      uint64_t v71 = *(void **)(v0 + 672);
      uint64_t v72 = *(void *)(v0 + 640);
      os_log_type_t v73 = *(void **)(v0 + 520);
      char v78 = *(unsigned char *)(v0 + 68);
      uint64_t v77 = *(void *)(v0 + 512);
      uint64_t v74 = *(void *)(v0 + 472);
      swift_release();

      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v85);
      __swift_destroy_boxed_opaque_existential_1(v0 + 112);
      *(void *)uint64_t v74 = v67;
      *(void *)(v74 + 8) = v68;
      *(void *)(v74 + 16) = v71;
      *(void *)(v74 + 24) = v70;
      *(void *)(v74 + 32) = v69;
      *(void *)(v74 + 40) = v77;
      *(unsigned char *)(v74 + 48) = v78 & 1;
      __swift_destroy_boxed_opaque_existential_1(v88);
      OUTLINED_FUNCTION_39_1(v73);
      OUTLINED_FUNCTION_41_0();
      v75();
      sub_2597FFA60(v72, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_20_0();
      goto LABEL_4;
    }
    OUTLINED_FUNCTION_49_33();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_77();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v6 = v3;
LABEL_3:
    __swift_destroy_boxed_opaque_existential_1(v6);
    __swift_destroy_boxed_opaque_existential_1(v2);
    __swift_destroy_boxed_opaque_existential_1(v88);
    uint64_t v7 = *(void *)(v0 + 640);
    OUTLINED_FUNCTION_17_50();
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 520), *(void *)(*(void *)(v0 + 520) + 24));
    OUTLINED_FUNCTION_41_0();
    v8();
    sub_2597FFA60(v7, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_67();
LABEL_4:
    return v9();
  }
  uint64_t v11 = *(void *)(v0 + 800);
  uint64_t v12 = *(void *)(v0 + 792);
  char loga = *(unsigned char *)(v0 + 69);
  uint64_t v81 = *(void *)(v0 + 736);
  uint64_t v13 = *(void *)(v0 + 720);
  uint64_t v14 = *(void **)(v0 + 672);
  uint64_t v83 = *(void *)(v0 + 768);
  uint64_t v84 = *(void *)(v0 + 664);
  long long v82 = *(_OWORD *)(v0 + 648);
  char v80 = *(unsigned char *)(v0 + 68);
  uint64_t v15 = *(void *)(v0 + 512);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 528), *(void *)(*(void *)(v0 + 528) + 24));
  sub_259843F00();
  sub_259843F00();
  id v16 = v14;
  sub_259843580();
  sub_25953D2BC(v13);
  swift_bridgeObjectRelease();
  sub_2593F71F8();
  *(void *)(v0 + 816) = v17;
  swift_release();
  *(void *)(v0 + 16) = v11;
  *(void *)(v0 + 24) = v12;
  *(void *)(v0 + 32) = v16;
  *(void *)(v0 + 40) = v81;
  *(void *)(v0 + 48) = v83;
  *(void *)(v0 + 56) = v15;
  *(unsigned char *)(v0 + 64) = v80 & 1;
  *(unsigned char *)(v0 + 65) = loga;
  *(_OWORD *)(v0 + 368) = v82;
  *(void *)(v0 + 384) = v84;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 824) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_2597F7E44;
  uint64_t v101 = v0 + 232;
  uint64_t v100 = v0 + 72;
  OUTLINED_FUNCTION_34();
  return sub_2597FBB2C(v19, v20, v21, v22, v23, v24, v25, v26);
}

uint64_t sub_2597F7E44()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  *(void *)(v3 + 832) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597F7F4C()
{
  uint64_t v70 = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 232);
  uint64_t v2 = *(void **)(v0 + 832);
  uint64_t v3 = OUTLINED_FUNCTION_24_53();
  v4(v3);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v5 = v1;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v6 = v5;
  uint64_t v7 = sub_259843A50();
  os_log_type_t v8 = sub_259844B70();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(v0 + 800);
    uint64_t v10 = *(void *)(v0 + 792);
    uint64_t v11 = *(void *)(v0 + 768);
    log = v7;
    uint64_t v12 = *(void *)(v0 + 736);
    uint64_t v13 = *(void **)(v0 + 672);
    uint64_t v57 = *(void *)(v0 + 568);
    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 760);
    uint64_t v56 = *(void *)(v0 + 552);
    char v52 = *(unsigned char *)(v0 + 68);
    uint64_t v50 = *(void *)(v0 + 512);
    uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_54();
    *(void *)&long long v61 = OUTLINED_FUNCTION_20();
    *(_DWORD *)uint64_t v14 = 136642819;
    uint64_t v63 = v9;
    uint64_t v64 = v10;
    int v65 = v13;
    uint64_t v66 = v12;
    uint64_t v67 = v11;
    uint64_t v68 = v50;
    char v69 = v52 & 1;
    uint64_t Understanding = QueryUnderstandingResult.description.getter();
    *(void *)(v0 + 432) = sub_259356D5C(Understanding, v16, (uint64_t *)&v61);
    sub_259844E10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_193_0();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25934C000, log, v8, "Query understanding unint64_t result = \n%{sensitive}s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v2;
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();

    v58(v57, v56);
  }
  else
  {
    uint64_t v17 = v2;
    uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 760);
    uint64_t v18 = *(void **)(v0 + 672);
    uint64_t v19 = *(void *)(v0 + 568);
    uint64_t v20 = *(void *)(v0 + 552);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_77();
    v59(v19, v20);
  }
  uint64_t v21 = *(void *)(v0 + 776);
  if (v21)
  {
    uint64_t v22 = *(void *)(v0 + 792);
    uint64_t v24 = *(void *)(v0 + 480);
    uint64_t v23 = *(void *)(v0 + 488);
    *(void *)(v21 + 24) = *(void *)(*(void *)(v0 + 800) + 16);
    swift_retain();
    sub_259794FB0(v22);
    swift_release();
    swift_retain();
    sub_2597954BC(v24, v23);
    swift_release();
  }
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 528), *(void *)(*(void *)(v0 + 528) + 24));
  sub_2598435D0();
  uint64_t v25 = *(void *)(v0 + 800);
  uint64_t v26 = *(void *)(v0 + 792);
  if (v17)
  {
    OUTLINED_FUNCTION_49_33();
    OUTLINED_FUNCTION_171_0();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 192);
    __swift_destroy_boxed_opaque_existential_1(v0 + 112);
    __swift_destroy_boxed_opaque_existential_1(v0 + 72);
    uint64_t v38 = *(void *)(v0 + 640);
    OUTLINED_FUNCTION_17_50();
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 520), *(void *)(*(void *)(v0 + 520) + 24));
    OUTLINED_FUNCTION_41_0();
    v39();
    sub_2597FFA60(v38, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_67();
  }
  else
  {
    uint64_t v27 = OUTLINED_FUNCTION_20_57();
    uint64_t v63 = v25;
    uint64_t v64 = v26;
    int v65 = v29;
    uint64_t v66 = v28;
    uint64_t v67 = v30;
    uint64_t v68 = v31;
    char v69 = v32 & 1;
    long long v61 = *v33;
    uint64_t v62 = v34;
    sub_2597FC964(v27, v26, v25, v35, v36, (uint64_t)&v63, v37, &v61);
    uint64_t v42 = *(void **)(v0 + 528);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v42, v42[3]);
    sub_2598435E0();
    uint64_t v43 = *(void *)(v0 + 800);
    uint64_t v44 = *(void *)(v0 + 792);
    uint64_t v60 = *(void *)(v0 + 768);
    uint64_t v45 = *(void **)(v0 + 672);
    uint64_t v54 = *(void *)(v0 + 640);
    long long v46 = *(void **)(v0 + 520);
    char v53 = *(unsigned char *)(v0 + 68);
    uint64_t v49 = *(void *)(v0 + 736);
    uint64_t v51 = *(void *)(v0 + 512);
    uint64_t v47 = *(void *)(v0 + 472);
    swift_release();

    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 192);
    __swift_destroy_boxed_opaque_existential_1(v0 + 112);
    *(void *)uint64_t v47 = v43;
    *(void *)(v47 + 8) = v44;
    *(void *)(v47 + 16) = v45;
    *(void *)(v47 + 24) = v49;
    *(void *)(v47 + 32) = v60;
    *(void *)(v47 + 40) = v51;
    *(unsigned char *)(v47 + 48) = v53 & 1;
    __swift_destroy_boxed_opaque_existential_1(v0 + 72);
    OUTLINED_FUNCTION_39_1(v46);
    OUTLINED_FUNCTION_41_0();
    v48();
    sub_2597FFA60(v54, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_20_0();
  }
  return v40();
}

uint64_t sub_2597F85F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_266();
  uint64_t v15 = *(void **)(v14 + 672);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v14 + 192);
  __swift_destroy_boxed_opaque_existential_1(v14 + 112);
  __swift_destroy_boxed_opaque_existential_1(v14 + 72);
  uint64_t v16 = *(void *)(v14 + 640);
  uint64_t v28 = *(void *)(v14 + 576);
  uint64_t v29 = *(void *)(v14 + 568);
  uint64_t v30 = *(void *)(v14 + 696);
  uint64_t v17 = OUTLINED_FUNCTION_2_89(*(void **)(v14 + 520));
  v18(v17);
  sub_2597FFA60(v16, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_126();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, v28, v29, v30, a12, a13, a14);
}

uint64_t sub_2597F8710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_266();
  uint64_t v15 = *(void **)(v14 + 672);
  swift_release();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v14 + 192);
  __swift_destroy_boxed_opaque_existential_1(v14 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v14 + 72);
  uint64_t v16 = *(void *)(v14 + 640);
  uint64_t v28 = *(void *)(v14 + 576);
  uint64_t v29 = *(void *)(v14 + 568);
  uint64_t v30 = *(void *)(v14 + 808);
  uint64_t v17 = OUTLINED_FUNCTION_2_89(*(void **)(v14 + 520));
  v18(v17);
  sub_2597FFA60(v16, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_126();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, v28, v29, v30, a12, a13, a14);
}

uint64_t sub_2597F8860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_266();
  uint64_t v15 = *(void **)(v14 + 672);
  swift_release();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v14 + 232);
  __swift_destroy_boxed_opaque_existential_1(v14 + 192);
  __swift_destroy_boxed_opaque_existential_1(v14 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v14 + 72);
  uint64_t v16 = *(void *)(v14 + 640);
  uint64_t v28 = *(void *)(v14 + 576);
  uint64_t v29 = *(void *)(v14 + 568);
  uint64_t v30 = *(void *)(v14 + 832);
  uint64_t v17 = OUTLINED_FUNCTION_2_89(*(void **)(v14 + 520));
  v18(v17);
  sub_2597FFA60(v16, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_126();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, v28, v29, v30, a12, a13, a14);
}

void sub_2597F89D0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2596F33D0();
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_25967CD30(v5);
  *a1 = v2;
}

void static QueryGenerator.performQueryUnderstandingEvent.getter()
{
}

void static QueryGenerator.llmQUAnnotatedQueryStringEvent.getter()
{
}

void static QueryGenerator.groundedQueryAnnotationTupleEvent.getter()
{
}

void static QueryGenerator.resolveQueryUnderstandingEvent.getter()
{
}

void static QueryGenerator.performRetrievalEvent.getter()
{
}

void static QueryGenerator.performMetadataRetrievalEvent.getter()
{
}

void static QueryGenerator.updateDateQueryTokensEvent.getter()
{
}

void static QueryGenerator.updateLocationQueryTokensEvent.getter()
{
}

void static QueryGenerator.selectEligibleTripsEvent.getter()
{
}

void static QueryGenerator.addTripTokenWithAssetsEvent.getter()
{
}

void static QueryGenerator.addAssetsToPersonalEventQueryTokensEvent.getter()
{
}

void static QueryGenerator.addAssetsToDisambiguatedPersonalEventQueryTokensEvent.getter()
{
}

void static QueryGenerator.addAssetsToPublicEventQueryTokensEvent.getter()
{
}

void static QueryGenerator.addAssetsToWhatQueryTokensEvent.getter()
{
}

void static QueryGenerator.addDisambiguationSuggestionsToQueryTokensEvent.getter()
{
}

void static QueryGenerator.addAssetsToQueryTokensForEventDisambiguationEvent.getter()
{
}

void static QueryGenerator.fetchNoLocationDataAssetsEvent.getter()
{
}

void static QueryGenerator.resolvedQueryTokenAndRetrievedAssetsEvent.getter()
{
}

void static QueryGenerator.consolidateAssetUUIDsEvent.getter()
{
}

void static QueryGenerator.applyExactSubstringLocationMatchingResultEvent.getter()
{
}

void static QueryGenerator.momentBasedLocationAssetFetcherResultEvent.getter()
{
}

void static QueryGenerator.applySortOrderLeveragingTripsEvent.getter()
{
}

void static QueryGenerator.applySortOrderLeveragingMomentsEvent.getter()
{
}

void static QueryGenerator.performBatchSearchEvent.getter()
{
}

uint64_t sub_2597F8BBC()
{
  sub_25935633C(0, (unint64_t *)&qword_26B300540);
  uint64_t result = sub_259844DA0();
  qword_26A3D2068 = result;
  return result;
}

uint64_t sub_2597F8C38()
{
  uint64_t v0 = sub_259843A80();
  __swift_allocate_value_buffer(v0, qword_26A3D2070);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3D2070);
  if (qword_26A388C50 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A3D2068;
  return sub_259843A90();
}

uint64_t type metadata accessor for QueryGenerator(uint64_t a1)
{
  return sub_25938CAE0(a1, (uint64_t *)&unk_26A391F60);
}

uint64_t sub_2597F8CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[2] = a1;
  v8[3] = a4;
  return MEMORY[0x270FA2498](sub_2597F8D0C, 0, 0);
}

uint64_t sub_2597F8D0C()
{
  OUTLINED_FUNCTION_247();
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(int *)(type metadata accessor for QueryGenerator(0) + 20);
  *(_DWORD *)(v0 + 96) = v2;
  uint64_t v3 = v1 + v2;
  uint64_t v4 = *(int *)(type metadata accessor for QueryGeneratorContext(0) + 40);
  *(_DWORD *)(v0 + 100) = v4;
  __swift_project_boxed_opaque_existential_1((void *)(v3 + v4), *(void *)(v3 + v4 + 24));
  OUTLINED_FUNCTION_40_22();
  id v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *id v5 = v0;
  v5[1] = sub_2597F8E20;
  uint64_t v6 = OUTLINED_FUNCTION_16_52();
  return v7(v6);
}

uint64_t sub_2597F8E20()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_67();
    return v4();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_2597F8F28()
{
  OUTLINED_FUNCTION_247();
  uint64_t v1 = (void *)(*(void *)(v0 + 24) + *(int *)(v0 + 96) + *(int *)(v0 + 100));
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  OUTLINED_FUNCTION_40_22();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  void *v2 = v0;
  v2[1] = sub_2597F9020;
  uint64_t v3 = OUTLINED_FUNCTION_16_52();
  return v4(v3);
}

uint64_t sub_2597F9020()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_67();
    return v4();
  }
  else
  {
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_2597F911C()
{
  OUTLINED_FUNCTION_247();
  uint64_t v1 = (void *)(*(void *)(v0 + 24) + *(int *)(v0 + 96) + *(int *)(v0 + 100));
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  OUTLINED_FUNCTION_40_22();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  void *v2 = v0;
  v2[1] = sub_2597F9214;
  uint64_t v3 = OUTLINED_FUNCTION_16_52();
  return v4(v3);
}

uint64_t sub_2597F9214()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 88) = v3;
    OUTLINED_FUNCTION_13();
    return MEMORY[0x270FA2498](v11, v12, v13);
  }
}

uint64_t sub_2597F932C()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 88);
  OUTLINED_FUNCTION_20_0();
  return v1();
}

uint64_t sub_2597F9350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[12] = a5;
  v6[13] = v5;
  v6[10] = a3;
  v6[11] = a4;
  v6[8] = a1;
  v6[9] = a2;
  type metadata accessor for RootEventRecorder.EventState(0);
  v6[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2597F93E8, 0, 0);
}

uint64_t sub_2597F93E8()
{
  OUTLINED_FUNCTION_240();
  uint64_t v2 = (void *)v0[10];
  uint64_t v1 = (void *)v0[11];
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  OUTLINED_FUNCTION_26_0();
  v3();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  OUTLINED_FUNCTION_54_34();
  unint64_t v4 = OUTLINED_FUNCTION_46_33();
  v5(v4);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  OUTLINED_FUNCTION_86_0();
  sub_2598435C0();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2597F958C;
  OUTLINED_FUNCTION_132_0();
  return sub_25968A310();
}

uint64_t sub_2597F958C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 128) = v4;
  *(void *)(v2 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2597F9670()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  uint64_t v1 = v0[17];
  OUTLINED_FUNCTION_19_50();
  OUTLINED_FUNCTION_18_44();
  v0[18] = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    uint64_t v2 = OUTLINED_FUNCTION_1_109();
    v3(v2);
    sub_2597FFA60((uint64_t)(v0 + 2), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_160();
    return v5(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_2597F979C;
    OUTLINED_FUNCTION_160();
    return sub_25945C730(v14, v15);
  }
}

uint64_t sub_2597F979C()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 160) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_2597F986C()
{
  OUTLINED_FUNCTION_240();
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  sub_259843F00();
  uint64_t v4 = sub_2597F4A0C(v3, v1);
  v0[21] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_292();
  __swift_project_boxed_opaque_existential_1(v5, v6);
  sub_2598435D0();
  v0[22] = v2;
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    uint64_t v7 = OUTLINED_FUNCTION_1_109();
    v8(v7);
    sub_2597FFA60(v4, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_132_0();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v11 = (void *)swift_task_alloc();
  v0[23] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_2597F99EC;
  OUTLINED_FUNCTION_132_0();
  return sub_25969B488();
}

uint64_t sub_2597F99EC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  void *v2 = v1;
  void *v2 = *v0;
  *(void *)(v1 + 192) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_2597F9ABC()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  uint64_t v1 = v0[22];
  OUTLINED_FUNCTION_19_50();
  OUTLINED_FUNCTION_18_44();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    uint64_t v2 = OUTLINED_FUNCTION_1_109();
    v3(v2);
    sub_2597FFA60((uint64_t)(v0 + 2), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_160();
    return v5(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = (void *)swift_task_alloc();
    v0[25] = (uint64_t)v13;
    *uint64_t v13 = v0;
    v13[1] = sub_2597F9BF0;
    OUTLINED_FUNCTION_33_39(v0[21]);
    OUTLINED_FUNCTION_160();
    return sub_259691BA4();
  }
}

uint64_t sub_2597F9BF0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 208) = v5;
  *(void *)(v3 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2597F9CF8()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  uint64_t v1 = v0[27];
  OUTLINED_FUNCTION_19_50();
  OUTLINED_FUNCTION_18_44();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    uint64_t v2 = OUTLINED_FUNCTION_1_109();
    v3(v2);
    sub_2597FFA60((uint64_t)(v0 + 2), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_160();
    return v5(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = (void *)swift_task_alloc();
    v0[28] = (uint64_t)v13;
    *uint64_t v13 = v0;
    v13[1] = sub_2597F9E34;
    OUTLINED_FUNCTION_33_39(v0[26]);
    OUTLINED_FUNCTION_160();
    return sub_259695550();
  }
}

uint64_t sub_2597F9E34()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  *(void *)(v3 + 232) = v7;
  *(void *)(v3 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2597F9F58()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  uint64_t v1 = v0[30];
  OUTLINED_FUNCTION_19_50();
  OUTLINED_FUNCTION_18_44();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    uint64_t v2 = OUTLINED_FUNCTION_1_109();
    v3(v2);
    sub_2597FFA60((uint64_t)(v0 + 2), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_160();
    return v5(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = (void *)swift_task_alloc();
    v0[31] = (uint64_t)v13;
    *uint64_t v13 = v0;
    v13[1] = sub_2597FA094;
    OUTLINED_FUNCTION_33_39(v0[29]);
    OUTLINED_FUNCTION_160();
    return sub_259697CD4();
  }
}

uint64_t sub_2597FA094()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  *(void *)(v3 + 256) = v7;
  *(void *)(v3 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2597FA1B8()
{
  OUTLINED_FUNCTION_240();
  uint64_t v1 = v0[33];
  OUTLINED_FUNCTION_19_50();
  OUTLINED_FUNCTION_18_44();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    uint64_t v5 = OUTLINED_FUNCTION_1_109();
    v6(v5);
    sub_2597FFA60((uint64_t)(v0 + 2), (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    OUTLINED_FUNCTION_19_50();
    OUTLINED_FUNCTION_86_0();
    sub_2598435E0();
    uint64_t v2 = v0[32];
    uint64_t v3 = v0[24];
    uint64_t v4 = v0[20];
    uint64_t v9 = v0[14];
    uint64_t v10 = (void *)v0[10];
    uint64_t v11 = (void *)v0[8];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    *uint64_t v11 = v2;
    v11[1] = v4;
    void v11[2] = v3;
    OUTLINED_FUNCTION_39_1(v10);
    OUTLINED_FUNCTION_41_0();
    v12();
    sub_2597FFA60(v9, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
    swift_task_dealloc();
    OUTLINED_FUNCTION_20_0();
  }
  return v7();
}

uint64_t sub_2597FA33C()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 112);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  OUTLINED_FUNCTION_14_0();
  v2();
  sub_2597FFA60(v1, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  OUTLINED_FUNCTION_146_0();
  OUTLINED_FUNCTION_160();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2597FA3F0()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 112);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  OUTLINED_FUNCTION_14_0();
  v2();
  sub_2597FFA60(v1, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  OUTLINED_FUNCTION_146_0();
  OUTLINED_FUNCTION_160();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2597FA4A4()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 112);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  OUTLINED_FUNCTION_14_0();
  v2();
  sub_2597FFA60(v1, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  OUTLINED_FUNCTION_146_0();
  OUTLINED_FUNCTION_160();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2597FA558()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 112);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  OUTLINED_FUNCTION_14_0();
  v2();
  sub_2597FFA60(v1, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  OUTLINED_FUNCTION_146_0();
  OUTLINED_FUNCTION_160();
  return v4(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2597FA60C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 120) = a4;
  *(void *)(v5 + 128) = v4;
  *(void *)(v5 + 104) = a2;
  *(void *)(v5 + 112) = a3;
  *(void *)(v5 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38AEE0);
  *(void *)(v5 + 144) = swift_task_alloc();
  *(void *)(v5 + 152) = type metadata accessor for QueryTokenCategoryType(0);
  *(void *)(v5 + 160) = swift_task_alloc();
  *(void *)(v5 + 168) = swift_task_alloc();
  *(void *)(v5 + 176) = swift_task_alloc();
  uint64_t v7 = sub_259843A80();
  *(void *)(v5 + 184) = v7;
  *(void *)(v5 + 192) = *(void *)(v7 - 8);
  *(void *)(v5 + 200) = swift_task_alloc();
  *(void *)(v5 + 208) = swift_task_alloc();
  type metadata accessor for RootEventRecorder.EventState(0);
  *(void *)(v5 + 216) = swift_task_alloc();
  *(_OWORD *)(v5 + 224) = *(_OWORD *)a1;
  *(void *)(v5 + 240) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_2597FA7A0, 0, 0);
}

uint64_t sub_2597FA7A0()
{
  OUTLINED_FUNCTION_240();
  uint64_t v1 = v0[28];
  uint64_t v2 = (void *)v0[15];
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v3);
  (*(void (**)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 24))("QueryGenerator.resolvedQueryTokenAndRetrievedAssets", 51, 2, v3, v4);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  OUTLINED_FUNCTION_54_34();
  v5(0xD000000000000024);
  v0[9] = v1;
  swift_bridgeObjectRetain_n();
  sub_259843F00();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[31] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2597FA910;
  return sub_25969ECB0();
}

uint64_t sub_2597FA910()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *(void *)(v6 + 256) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597FA9FC()
{
  OUTLINED_FUNCTION_14();
  type metadata accessor for QueryGenerator(0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2597FAAAC;
  uint64_t v2 = OUTLINED_FUNCTION_33_39(*(void *)(v0 + 256));
  return MomentGroundingProcessor.safeOverlappingMomentGrounding(in:sensitiveContentTypes:eventRecorder:)(v2, v3);
}

uint64_t sub_2597FAAAC()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *(void *)(v6 + 272) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597FAB98()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  v0[10] = v0[34];
  v0[35] = v0[9];
  sub_259843F00();
  swift_task_alloc();
  OUTLINED_FUNCTION_53_0();
  v0[36] = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_2597FAC5C;
  OUTLINED_FUNCTION_160();
  return sub_25945B84C(v3, v4, v5);
}

uint64_t sub_2597FAC5C()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_4_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2597FAD80()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0[7];
  if (v1)
  {
    uint64_t v2 = v0[8];
    if (*(void *)(v2 + 16))
    {
      OUTLINED_FUNCTION_106();
      v3();
      swift_bridgeObjectRetain_n();
      uint64_t v4 = sub_259843A50();
      os_log_type_t v5 = sub_259844B70();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_54();
        *(_DWORD *)uint64_t v6 = 134217984;
        v0[12] = *(void *)(v2 + 16);
        sub_259844E10();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25934C000, v4, v5, "There are %ld location assets to exclude", v6, 0xCu);
        OUTLINED_FUNCTION_61_0();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      OUTLINED_FUNCTION_12();
      v8();
      uint64_t v9 = v0[10];
      uint64_t v10 = sub_259843F00();
      sub_2594456A0(v10, v9);
      uint64_t v12 = v11;
      swift_bridgeObjectRelease_n();
      v0[10] = v12;
    }
    uint64_t v13 = v0[37];
    uint64_t v14 = v0[29];
    uint64_t v15 = sub_259843F00();
    sub_2595D48FC(v15);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = v1;
    sub_25945E348(v14, (uint64_t)sub_2597FD298, 0, isUniquelyReferenced_nonNull_native, &v19);
    if (v13)
    {
      return swift_bridgeObjectRelease();
    }
    uint64_t v7 = v19;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
  }
  v0[38] = v7;
  sub_259843F00();
  uint64_t v18 = (void *)swift_task_alloc();
  v0[39] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_2597FB004;
  return sub_2596A0C10();
}

uint64_t sub_2597FB004()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  *(void *)(v3 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2597FB104()
{
  uint64_t v67 = v0;
  if (qword_26A3887E8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[22];
  uint64_t v2 = __swift_project_value_buffer(v0[19], (uint64_t)qword_26A38AE88);
  sub_2597FFA00(v2, v1, (void (*)(void))type metadata accessor for QueryTokenCategoryType);
  uint64_t v3 = v0[9];
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    goto LABEL_51;
  }
  uint64_t v64 = v0[17];
  uint64_t v5 = v3 + 32;
  uint64_t v59 = v0[9];
  sub_259843F00();
  uint64_t v6 = 0;
  uint64_t v57 = v5;
  uint64_t v58 = v4;
  while (2)
  {
    uint64_t v7 = *(void *)(v5 + 88 * v6 + 56);
    uint64_t v8 = *(void *)(v7 + 16);
    if (!v8) {
      goto LABEL_46;
    }
    uint64_t v60 = v6;
    uint64_t TokenSuggestion = type metadata accessor for QueryTokenSuggestion(0);
    OUTLINED_FUNCTION_1(TokenSuggestion);
    uint64_t v11 = v7 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    uint64_t v13 = *(void *)(v12 + 72);
    sub_259843F00();
    uint64_t v14 = v64;
LABEL_7:
    uint64_t v15 = v0[18] + *(int *)(v14 + 48);
    sub_2597FFA00(v0[22], v0[18], (void (*)(void))type metadata accessor for QueryTokenCategoryType);
    sub_2597FFA00(v11, v15, (void (*)(void))type metadata accessor for QueryTokenCategoryType);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        if (OUTLINED_FUNCTION_13_63() != 1) {
          goto LABEL_44;
        }
        goto LABEL_48;
      case 2u:
        uint64_t v16 = v0[21];
        sub_2597FFA00(v0[18], v16, (void (*)(void))type metadata accessor for QueryTokenCategoryType);
        uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A38AEC0) + 48);
        uint64_t v18 = v16 + v17;
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v20 = v0[21];
        if (EnumCaseMultiPayload != 2)
        {
          sub_2594320A4(v18, &qword_26A38AEB8);
          sub_2594320A4(v20, &qword_26A38AEB8);
LABEL_18:
          uint64_t v14 = v64;
LABEL_44:
          sub_2594320A4(v0[18], &qword_26A38AEE0);
          v11 += v13;
          if (!--v8)
          {
            swift_bridgeObjectRelease();
            uint64_t v5 = v57;
            uint64_t v4 = v58;
            uint64_t v6 = v60;
LABEL_46:
            if (++v6 == v4)
            {
              LOBYTE(v4) = 0;
              goto LABEL_50;
            }
            continue;
          }
          goto LABEL_7;
        }
        sub_2594320A4(v15 + v17, &qword_26A38AEB8);
        sub_2594320A4(v15, &qword_26A38AEB8);
        uint64_t v55 = OUTLINED_FUNCTION_292();
        sub_2594320A4(v55, v56);
        sub_2594320A4(v20, &qword_26A38AEB8);
LABEL_49:
        sub_2597FFA60(v0[18], (void (*)(void))type metadata accessor for QueryTokenCategoryType);
        swift_bridgeObjectRelease();
        LOBYTE(v4) = 1;
LABEL_50:
        swift_bridgeObjectRelease();
LABEL_51:
        sub_2597FFA60(v0[22], (void (*)(void))type metadata accessor for QueryTokenCategoryType);
        sub_259843F00();
        static StoryGenerationUtilities.querySortOrder(in:)();
        swift_bridgeObjectRelease();
        char v24 = v66[0];
        if (v4)
        {
          uint64_t v26 = v0[24];
          uint64_t v25 = v0[25];
          uint64_t v27 = v0[23];
          uint64_t v28 = v0[16];
          sub_259843F00();
          sub_2596999C4();
          unint64_t v30 = v29;
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v25, v28, v27);
          swift_bridgeObjectRetain_n();
          uint64_t v31 = sub_259843A50();
          os_log_type_t v32 = sub_259844B70();
          if (os_log_type_enabled(v31, v32))
          {
            id v33 = (uint8_t *)OUTLINED_FUNCTION_54();
            *(_DWORD *)id v33 = 134217984;
            if (v30 >> 62)
            {
              sub_259843F00();
              uint64_t v34 = sub_259845460();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v34 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            swift_bridgeObjectRelease();
            v0[11] = v34;
            sub_259844E10();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25934C000, v31, v32, "There are %ld eligible trips", v33, 0xCu);
            OUTLINED_FUNCTION_61_0();
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          uint64_t v44 = v0[16];
          OUTLINED_FUNCTION_12();
          v45();
          sub_259843F00();
          OUTLINED_FUNCTION_292();
          sub_2596A1950();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          LOBYTE(v66[0]) = v24;
          sub_2595D1780();
          uint64_t v36 = v46;
          swift_bridgeObjectRelease();
          v0[10] = v36;
          sub_259843F00();
          OUTLINED_FUNCTION_86_0();
          sub_2597D47B0();
          OUTLINED_FUNCTION_40_22();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v0[9] = v44;
        }
        else
        {
          sub_2595D2CE8();
          uint64_t v36 = v35;
          swift_bridgeObjectRelease();
          v0[10] = v36;
        }
        uint64_t v47 = v0[40];
        sub_25953BECC(v36, v37, v38, v39, v40, v41, v42, v43, v57, v58, v59, v60, v61, (uint64_t)(v0 + 2), v64, v66[0], v66[1], v66[2], v66[3],
          v66[4],
          v66[5],
          v66[6],
          v66[7],
          v66[8],
          v66[9],
          (uint64_t)v67);
        uint64_t v49 = v48;
        swift_bridgeObjectRelease();
        v66[0] = v49;
        swift_retain();
        sub_259418628(v66);
        if (v47)
        {
          return swift_release();
        }
        else
        {
          uint64_t v51 = v0[27];
          char v52 = (void *)v0[15];
          swift_release();
          uint64_t v65 = v66[0];
          __swift_destroy_boxed_opaque_existential_1(v62);
          uint64_t v63 = v0[9];
          swift_bridgeObjectRelease();
          __swift_project_boxed_opaque_existential_1(v52, v52[3]);
          OUTLINED_FUNCTION_41_0();
          v53();
          sub_2597FFA60(v51, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v54 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
          return v54(v63, v65);
        }
      case 3u:
        if (OUTLINED_FUNCTION_13_63() == 3) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 4u:
        uint64_t v21 = v7;
        sub_2597FFA00(v0[18], v0[20], (void (*)(void))type metadata accessor for QueryTokenCategoryType);
        LODWORD(v61) = swift_getEnumCaseMultiPayload();
        sub_259843560();
        OUTLINED_FUNCTION_4();
        uint64_t v23 = *(void (**)(void))(v22 + 8);
        if (v61 == 4)
        {
          OUTLINED_FUNCTION_56_21();
          v23();
          OUTLINED_FUNCTION_56_21();
          v23();
          goto LABEL_49;
        }
        OUTLINED_FUNCTION_56_21();
        v23();
        uint64_t v7 = v21;
        goto LABEL_18;
      case 5u:
        if (OUTLINED_FUNCTION_13_63() == 5) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 6u:
        if (OUTLINED_FUNCTION_13_63() == 6) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 7u:
        if (OUTLINED_FUNCTION_13_63() == 7) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 8u:
        if (OUTLINED_FUNCTION_13_63() == 8) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 9u:
        if (OUTLINED_FUNCTION_13_63() == 9) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 0xAu:
        if (OUTLINED_FUNCTION_13_63() == 10) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 0xBu:
        if (OUTLINED_FUNCTION_13_63() == 11) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 0xCu:
        if (OUTLINED_FUNCTION_13_63() == 12) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 0xDu:
        if (OUTLINED_FUNCTION_13_63() == 13) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 0xEu:
        if (OUTLINED_FUNCTION_13_63() == 14) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 0xFu:
        if (OUTLINED_FUNCTION_13_63() == 15) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 0x10u:
        if (OUTLINED_FUNCTION_13_63() == 16) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 0x11u:
        if (OUTLINED_FUNCTION_13_63() != 17) {
          goto LABEL_44;
        }
        goto LABEL_49;
      default:
        if (OUTLINED_FUNCTION_13_63()) {
          goto LABEL_44;
        }
LABEL_48:
        sub_2597FFA60(v15, (void (*)(void))type metadata accessor for QueryTokenCategoryType);
        goto LABEL_49;
    }
  }
}

uint64_t sub_2597FB968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_266();
  __swift_destroy_boxed_opaque_existential_1(v14 + 16);
  uint64_t v15 = *(void *)(v14 + 216);
  uint64_t v27 = *(void *)(v14 + 144);
  uint64_t v28 = *(void *)(v14 + 296);
  uint64_t v16 = OUTLINED_FUNCTION_2_89(*(void **)(v14 + 120));
  v17(v16);
  sub_2597FFA60(v15, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_126();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, v27, v28, a12, a13, a14);
}

uint64_t sub_2597FBA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_266();
  __swift_destroy_boxed_opaque_existential_1(v14 + 16);
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v14 + 216);
  uint64_t v27 = *(void *)(v14 + 144);
  uint64_t v28 = *(void *)(v14 + 320);
  uint64_t v16 = OUTLINED_FUNCTION_2_89(*(void **)(v14 + 120));
  v17(v16);
  sub_2597FFA60(v15, (void (*)(void))type metadata accessor for RootEventRecorder.EventState);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_126();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, v27, v28, a12, a13, a14);
}

uint64_t sub_2597FBB2C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 168) = v19;
  *(void *)(v9 + 176) = v8;
  *(void *)(v9 + 152) = a8;
  *(void *)(v9 + 160) = v18;
  *(unsigned char *)(v9 + 352) = a3;
  *(void *)(v9 + 144) = a2;
  uint64_t v13 = sub_259843A80();
  *(void *)(v9 + 184) = v13;
  *(void *)(v9 + 192) = *(void *)(v13 - 8);
  *(void *)(v9 + 200) = swift_task_alloc();
  uint64_t v14 = swift_task_alloc();
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 216) = *(_OWORD *)a1;
  *(void *)(v9 + 208) = v14;
  *(_OWORD *)(v9 + 232) = v15;
  *(void *)(v9 + 248) = *(void *)(a1 + 32);
  *(unsigned char *)(v9 + 353) = *a5;
  *(_OWORD *)(v9 + 256) = *(_OWORD *)a7;
  *(void *)(v9 + 272) = *(void *)(a7 + 16);
  return MEMORY[0x270FA2498](sub_2597FBC50, 0, 0);
}

uint64_t sub_2597FBC50()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_247();
  if (*(void *)(v0 + 152))
  {
    swift_beginAccess();
    uint64_t v1 = swift_retain();
  }
  else
  {
    uint64_t v1 = 0;
  }
  *(void *)(v0 + 280) = v1;
  uint64_t v2 = *(void **)(v0 + 232);
  *(void *)(v0 + 40) = &type metadata for PhotosFeatureFlags;
  *(void *)(v0 + 48) = sub_2596385B8();
  *(unsigned char *)(v0 + 16) = 6;
  sub_259843F00();
  sub_259843F00();
  id v3 = v2;
  sub_259843F00();
  char v4 = sub_259842B80();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v4)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_2597FBE10;
    OUTLINED_FUNCTION_160();
    return QueryGenerator.addDisambiguationSuggestions(to:retrievedAssetUUIDs:metadataAssetUUIDsToScopeRetrieval:eventRecorder:progressReporter:)();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 224);
    *(void *)(v0 + 312) = 0;
    *(void *)(v0 + 320) = v8;
    static StoryGenerationUtilities.musicRelatedQueryTokens(in:)();
    *(void *)(v0 + 328) = v9;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 336) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_2597FBFC0;
    OUTLINED_FUNCTION_62_26();
    OUTLINED_FUNCTION_160();
    return sub_2597D6910();
  }
}

uint64_t sub_2597FBE10()
{
  OUTLINED_FUNCTION_25();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_9();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  OUTLINED_FUNCTION_9();
  *uint64_t v8 = v7;
  *(void *)(v5 + 296) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(v5 + 304) = v3;
  }
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_2597FBF24()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = v0[38];
  v0[39] = v0[37];
  v0[40] = v1;
  static StoryGenerationUtilities.musicRelatedQueryTokens(in:)();
  v0[41] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[42] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2597FBFC0;
  OUTLINED_FUNCTION_62_26();
  return sub_2597D6910();
}

uint64_t sub_2597FBFC0()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9();
  void *v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_9();
  *uint64_t v4 = v3;
  *(void *)(v6 + 344) = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void sub_2597FC0AC()
{
  uint64_t v161 = v0;
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 176);
  if (*(void *)(v0 + 344)) {
    uint64_t v5 = *(void *)(v0 + 344);
  }
  else {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  uint64_t v6 = *(void *)(v5 + 16);
  sub_2597CE2FC();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 + 16);
  LODWORD(v147) = (v9 | v6) != 0;
  uint64_t v10 = *(void (**)(void))(v3 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v10)(v1, v4, v2);
  uint64_t v11 = sub_259843A50();
  int v12 = sub_259844B70();
  uint64_t v140 = v8;
  if (os_log_type_enabled(v11, (os_log_type_t)v12))
  {
    LODWORD(v109) = v12;
    uint64_t log = (uint64_t)v10;
    int v13 = *(unsigned __int8 *)(v0 + 353);
    uint64_t v14 = swift_slowAlloc();
    uint64_t v114 = swift_slowAlloc();
    uint64_t v155 = v114;
    *(_DWORD *)uint64_t v14 = 136315906;
    if (v9 | v6) {
      uint64_t v22 = 0x646C756F6853;
    }
    else {
      uint64_t v22 = 0x6E20646C756F6853;
    }
    *(void *)(v0 + 112) = OUTLINED_FUNCTION_61_24(v22, v15, v16, v17, v18, v19, v20, v21, v93, v97, v100, v103, v0 + 128, v109, v114, v6, log, log_8, v3 + 16,
                              v136,
                              v140,
                              v5,
                              v147,
                              v153,
                              *((uint64_t *)&v153 + 1),
                              v154,
                              v155);
    sub_259844E10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v30 = 0x6769626D61736964;
    if (v13 == 1) {
      uint64_t v30 = 0x756F756769626D61;
    }
    if (v13) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = 0x6769626D416E6F6ELL;
    }
    *(void *)(v0 + 136) = OUTLINED_FUNCTION_61_24(v31, v23, v24, v25, v26, v27, v28, v29, *(void *)(v0 + 192), *(void *)(v0 + 184), *(void *)(v0 + 208), v0 + 120, v106, v110, v115, v118, loga, log_8a, v132,
                              v137,
                              v141,
                              v144,
                              v148,
                              v153,
                              *((uint64_t *)&v153 + 1),
                              v154,
                              v155);
    sub_259844E10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2080;
    if (v9) {
      uint64_t v39 = 0x756F756769626D61;
    }
    else {
      uint64_t v39 = 0x69626D6120746F6ELL;
    }
    *(void *)(v0 + 120) = OUTLINED_FUNCTION_61_24(v39, v32, v33, v34, v35, v36, v37, v38, v94, v98, v101, v104, v107, v111, v116, v119, logb, log_8b, v133,
                              v138,
                              v142,
                              v145,
                              v149,
                              v153,
                              *((uint64_t *)&v153 + 1),
                              v154,
                              v155);
    sub_259844E10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 32) = 2080;
    if (v120) {
      uint64_t v47 = 0x756F756769626D61;
    }
    else {
      uint64_t v47 = 0x69626D6120746F6ELL;
    }
    *(void *)(v0 + 128) = OUTLINED_FUNCTION_61_24(v47, v40, v41, v42, v43, v44, v45, v46, v95, v99, v102, v105, v108, v112, v117, v120, logc, log_8c, v134,
                              v139,
                              v143,
                              v146,
                              v150,
                              v153,
                              *((uint64_t *)&v153 + 1),
                              v154,
                              v155);
    sub_259844E10();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25934C000, v11, v113, "%s throw any ambiguity error.\nThe prompt ambiguity state is %s and the person/location/date/personal event query tokens are %s.\nThe music related query tokens are %s.", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();

    uint64_t v48 = *(void (**)(void))(v96 + 8);
    OUTLINED_FUNCTION_12();
    v48();
    uint64_t v10 = loge;
  }
  else
  {
    uint64_t v49 = *(void *)(v0 + 208);
    uint64_t v50 = *(void *)(v0 + 184);
    uint64_t v51 = *(void *)(v0 + 192);

    uint64_t v48 = *(void (**)(void))(v51 + 8);
    ((void (*)(uint64_t, uint64_t))v48)(v49, v50);
  }
  char v52 = *(void **)(v0 + 320);
  if (v147)
  {
    char v53 = *(void **)(v0 + 232);
    OUTLINED_FUNCTION_106();
    v10();
    uint64_t v54 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v55 = v53;
    OUTLINED_FUNCTION_40_22();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v56 = v52;
    uint64_t v57 = sub_259843A50();
    os_log_type_t v58 = sub_259844B70();
    logd = v57;
    BOOL v59 = os_log_type_enabled(v57, v58);
    uint64_t v60 = *(void *)(v0 + 320);
    uint64_t v61 = *(void *)(v0 + 240);
    uint64_t v62 = *(void *)(v0 + 248);
    uint64_t v63 = *(void **)(v0 + 232);
    uint64_t v64 = *(void *)(v0 + 200);
    uint64_t v151 = *(void *)(v0 + 184);
    if (v59)
    {
      uint64_t v65 = v54;
      uint64_t v66 = (uint8_t *)OUTLINED_FUNCTION_54();
      *(void *)&long long v153 = OUTLINED_FUNCTION_20();
      *(_DWORD *)uint64_t v66 = 136642819;
      uint64_t v155 = v65;
      uint64_t v156 = v60;
      *(void *)&long long v157 = v63;
      *((void *)&v157 + 1) = v61;
      uint64_t v158 = v62;
      uint64_t v159 = 0;
      char v160 = 1;
      uint64_t Understanding = QueryUnderstandingResult.description.getter();
      *(void *)(v0 + 104) = sub_259356D5C(Understanding, v68, (uint64_t *)&v153);
      sub_259844E10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_171_0();

      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_193_0();
      _os_log_impl(&dword_25934C000, logd, v58, "The user prompt is ambiguous.\nQuery understanding result=\n%{sensitive}s", v66, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_61_0();
      OUTLINED_FUNCTION_61_0();

      OUTLINED_FUNCTION_12();
      v69();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_171_0();

      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_193_0();
      ((void (*)(uint64_t, uint64_t))v48)(v64, v151);
    }
    uint64_t v71 = *(void *)(v0 + 280);
    if (v71)
    {
      uint64_t v72 = *(void *)(v0 + 320);
      OUTLINED_FUNCTION_57();
      *(unsigned char *)(v71 + 32) = 1;
      swift_retain();
      sub_259794FB0(v72);
      swift_release();
    }
    uint64_t v73 = *(void *)(v0 + 320);
    uint64_t v152 = *(void *)(v0 + 312);
    uint64_t v74 = *(void *)(v0 + 272);
    uint64_t v75 = *(void *)(v0 + 248);
    int v76 = *(unsigned __int8 *)(v0 + 352);
    *(_OWORD *)logf = *(_OWORD *)(v0 + 232);
    long long v135 = *(_OWORD *)(v0 + 256);
    id v77 = objc_msgSend(*(id *)(v0 + 232), sel_string);
    uint64_t v78 = sub_2598440A0();
    uint64_t v80 = v79;

    uint64_t v155 = MEMORY[0x263F8EE78];
    uint64_t v156 = v73;
    long long v157 = *(_OWORD *)logf;
    uint64_t v158 = v75;
    uint64_t v159 = 0;
    char v160 = 1;
    long long v153 = v135;
    uint64_t v154 = v74;
    uint64_t v81 = OUTLINED_FUNCTION_292();
    sub_2597FC964(v81, v82, v83, v78, v80, v84, v76, v85);
    if (v152)
    {
      uint64_t v86 = *(void **)(v0 + 232);
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v155 = v140;
      sub_25973FCF8();
      sub_259843F00();
      sub_2597F89D0(&v155);
      uint64_t v89 = *(void *)(v0 + 320);
      uint64_t v90 = *(void **)(v0 + 232);
      swift_bridgeObjectRelease();
      uint64_t v91 = v155;
      sub_2597DA4B4();
      swift_allocError();
      *uint64_t v92 = v90;
      v92[1] = v91;
      v92[2] = v89;
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_67();
  }
  else
  {
    uint64_t v70 = *(void **)(v0 + 232);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_20_0();
  }
  OUTLINED_FUNCTION_34();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_2597FC8EC()
{
  OUTLINED_FUNCTION_14();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_67();
  return v1();
}

void sub_2597FC964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, long long *a8)
{
  int v37 = a7;
  uint64_t v17 = sub_259843A80();
  uint64_t v43 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v38 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v20 = *(_OWORD *)(a6 + 16);
  v41[0] = *(_OWORD *)a6;
  v41[1] = v20;
  void v41[2] = *(_OWORD *)(a6 + 32);
  char v42 = *(unsigned char *)(a6 + 48);
  if (a1)
  {
    uint64_t v33 = v8;
    uint64_t v34 = v18;
    uint64_t v36 = *((void *)a8 + 2);
    long long v35 = *a8;
    *(void *)&long long v39 = 1528845649;
    *((void *)&v39 + 1) = 0xE400000000000000;
    swift_retain();
    sub_259844240();
    sub_259844240();
    id v21 = sub_2594E8980(a3, v39, *((uint64_t *)&v39 + 1), 0xD000000000000010, 0x80000002598667C0);
    swift_bridgeObjectRelease();

    MEMORY[0x270FA5388](v22);
    *(&v33 - 2) = (uint64_t)v41;
    *(&v33 - 1) = a2;
    StoryGenerationDiagnosticContext.addToGenerationSummary(block:)();
    long long v39 = v35;
    uint64_t v40 = v36;
    static QueryUnderstandingDiagnosticsGenerator.save(isLLMQU:promptBindingRecipe:queryString:queryTokens:retrievedAssetUUIDs:in:)(v37 & 1, (uint64_t *)&v39, a4, a5, a2, a3);
    if (v9)
    {
      uint64_t v23 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v38, v33, v34);
      id v24 = v9;
      id v25 = v9;
      uint64_t v26 = sub_259843A50();
      os_log_type_t v27 = sub_259844B50();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 138412290;
        id v30 = v9;
        uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)&long long v39 = v31;
        sub_259844E10();
        *uint64_t v29 = v31;

        _os_log_impl(&dword_25934C000, v26, v27, "Unable to save query generator diagnostics, error=%@", v28, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F83A0);
        swift_arrayDestroy();
        MEMORY[0x25A2E13A0](v29, -1, -1);
        uint64_t v32 = v28;
        uint64_t v23 = v34;
        MEMORY[0x25A2E13A0](v32, -1, -1);

        swift_release();
      }
      else
      {
        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v23);
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_2597FCD10(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t Understanding = QueryUnderstandingResult.description.getter();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  a1[9] = Understanding;
  a1[10] = v6;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = a1[7];
  a1[7] = 0x8000000000000000;
  unint64_t v8 = sub_25939CE90();
  if (__OFADD__(*(void *)(v7 + 16), (v9 & 1) == 0))
  {
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v10 = v8;
  char v11 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A389A28);
  if (sub_259845350())
  {
    unint64_t v12 = sub_25939CE90();
    if ((v11 & 1) != (v13 & 1))
    {
LABEL_33:
      uint64_t result = sub_2598457D0();
      __break(1u);
      return result;
    }
    unint64_t v10 = v12;
  }
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v14 = a1[7];
  if ((v11 & 1) == 0) {
    sub_25939FB40(v10, 21841, 0xE200000000000000, 0, a1[7]);
  }
  uint64_t v15 = *(void *)(v14 + 56);
  uint64_t v16 = *(void *)(v15 + 8 * v10);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  *(void *)(v15 + 8 * v10) = v18;
  uint64_t v19 = a3;
  uint64_t v20 = *(void *)(a3 + 16);
  if (v20)
  {
    uint64_t v80 = a1;
    sub_259843F00();
    uint64_t v21 = 0;
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v88 = v20;
    do
    {
      uint64_t v84 = v21;
      uint64_t v86 = v20;
      uint64_t v83 = v22;
      uint64_t v23 = v19 + v21;
      uint64_t v24 = *(void *)(v23 + 40);
      uint64_t v25 = *(void *)(v23 + 56);
      uint64_t v26 = *(void *)(v23 + 64);
      char v27 = *(unsigned char *)(v23 + 72);
      uint64_t v28 = *(void *)(v23 + 80);
      uint64_t v29 = *(void *)(v23 + 88);
      char v30 = *(unsigned char *)(v23 + 96);
      uint64_t v32 = *(void *)(v23 + 104);
      uint64_t v31 = *(void *)(v23 + 112);
      uint64_t v92 = *(void *)(v23 + 32);
      char v90 = *(unsigned char *)(v23 + 48);
      sub_259843F00();
      sub_259843F00();
      sub_259843F00();
      sub_259843F00();
      sub_259843F00();
      sub_25962DC38();
      if (v33 == 2 || (sub_25962DC38(), v34 == 1))
      {
        char v81 = v30;
        uint64_t v35 = v83;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2594F1CF0();
          uint64_t v35 = v83;
        }
        uint64_t v36 = v92;
        uint64_t v37 = v25;
        uint64_t v38 = v24;
        uint64_t v39 = v28;
        uint64_t v40 = v29;
        char v41 = v90;
        uint64_t v42 = v26;
        uint64_t v43 = v32;
        char v45 = v30;
        char v44 = v27;
        uint64_t v46 = v31;
        unint64_t v47 = *(void *)(v35 + 16);
        if (v47 >= *(void *)(v35 + 24) >> 1)
        {
          sub_2594F1CF0();
          char v45 = v81;
          char v44 = v27;
          uint64_t v46 = v31;
          uint64_t v43 = v32;
          uint64_t v42 = v26;
          char v41 = v90;
          uint64_t v40 = v29;
          uint64_t v39 = v28;
          uint64_t v38 = v24;
          uint64_t v37 = v25;
          uint64_t v36 = v92;
          uint64_t v35 = v83;
        }
        *(void *)(v35 + 16) = v47 + 1;
        unint64_t v48 = v35 + 88 * v47;
        *(void *)(v48 + 32) = v36;
        *(void *)(v48 + 40) = v38;
        *(unsigned char *)(v48 + 48) = v41;
        *(void *)(v48 + 56) = v37;
        *(void *)(v48 + 64) = v42;
        *(unsigned char *)(v48 + 72) = v44;
        *(void *)(v48 + 80) = v39;
        *(void *)(v48 + 88) = v40;
        *(unsigned char *)(v48 + 96) = v45;
        *(void *)(v48 + 104) = v43;
        *(void *)(v48 + 112) = v46;
        uint64_t v19 = a3;
        uint64_t v22 = v35;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v19 = a3;
        uint64_t v22 = v83;
      }
      uint64_t v21 = v84 + 88;
      uint64_t v20 = v86 - 1;
    }
    while (v86 != 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v80[11] = v22;
    sub_259843F00();
    uint64_t v49 = 0;
    uint64_t v85 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v50 = v19 + v49;
      uint64_t v51 = *(void *)(v19 + v49 + 32);
      uint64_t v52 = *(void *)(v19 + v49 + 40);
      char v53 = *(unsigned char *)(v19 + v49 + 48);
      uint64_t v54 = *(void *)(v19 + v49 + 56);
      uint64_t v55 = *(void *)(v19 + v49 + 64);
      char v56 = *(unsigned char *)(v50 + 72);
      uint64_t v57 = *(void *)(v50 + 80);
      uint64_t v58 = *(void *)(v50 + 88);
      char v59 = *(unsigned char *)(v50 + 96);
      uint64_t v60 = *(void *)(v50 + 104);
      uint64_t v61 = *(void *)(v50 + 112);
      uint64_t v91 = v51;
      char v93 = v53;
      uint64_t v87 = v54;
      sub_259843F00();
      sub_259843F00();
      sub_259843F00();
      sub_259843F00();
      sub_259843F00();
      sub_25962DC38();
      if (v62)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v82 = v59;
        uint64_t v63 = v85;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2594F1CF0();
          uint64_t v63 = v85;
        }
        uint64_t v64 = v91;
        uint64_t v65 = v87;
        uint64_t v66 = v61;
        uint64_t v67 = v55;
        char v68 = v56;
        uint64_t v69 = v52;
        uint64_t v70 = v57;
        uint64_t v71 = v58;
        uint64_t v72 = v60;
        char v73 = v93;
        char v74 = v59;
        unint64_t v75 = *(void *)(v63 + 16);
        unint64_t v76 = v75 + 1;
        if (v75 >= *(void *)(v63 + 24) >> 1)
        {
          sub_2594F1CF0();
          uint64_t v67 = v55;
          unint64_t v76 = v75 + 1;
          char v74 = v82;
          uint64_t v66 = v61;
          char v73 = v93;
          uint64_t v72 = v60;
          uint64_t v71 = v58;
          uint64_t v70 = v57;
          uint64_t v69 = v52;
          char v68 = v56;
          uint64_t v65 = v87;
          uint64_t v64 = v91;
          uint64_t v63 = v85;
        }
        *(void *)(v63 + 16) = v76;
        uint64_t v85 = v63;
        unint64_t v77 = v63 + 88 * v75;
        *(void *)(v77 + 32) = v64;
        *(void *)(v77 + 40) = v69;
        *(unsigned char *)(v77 + 48) = v73;
        *(void *)(v77 + 56) = v65;
        *(void *)(v77 + 64) = v67;
        *(unsigned char *)(v77 + 72) = v68;
        *(void *)(v77 + 80) = v70;
        *(void *)(v77 + 88) = v71;
        *(unsigned char *)(v77 + 96) = v74;
        *(void *)(v77 + 104) = v72;
        *(void *)(v77 + 112) = v66;
      }
      uint64_t v19 = a3;
      v49 += 88;
      --v88;
    }
    while (v88);
    swift_bridgeObjectRelease();
    a1 = v80;
    uint64_t v78 = v85;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v78 = MEMORY[0x263F8EE78];
    a1[11] = MEMORY[0x263F8EE78];
  }
  uint64_t result = swift_bridgeObjectRelease();
  a1[12] = v78;
  return result;
}

uint64_t sub_2597FD298@<X0>(void *__src@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, __src, sizeof(__dst));
  uint64_t result = sub_259588998();
  *(void *)(a2 + 88) = result;
  return result;
}

uint64_t sub_2597FD2E8()
{
  uint64_t v1 = (int *)(type metadata accessor for QueryGenerator(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v14 = *(void *)(*(void *)v1 + 64);
  swift_unknownObjectRelease();
  sub_259843A80();
  OUTLINED_FUNCTION_4();
  uint64_t v5 = *(void (**)(uint64_t))(v4 + 8);
  uint64_t v6 = OUTLINED_FUNCTION_63_23();
  v5(v6);
  uint64_t v7 = (id *)(v0 + v3 + v1[7]);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 1));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 7));
  uint64_t GeneratorContext = type metadata accessor for QueryGeneratorContext(0);
  uint64_t v9 = (uint64_t)v7 + *(int *)(GeneratorContext + 32);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (!__swift_getEnumTagSinglePayload(v9, 1, DisambiguationSuggestionProducer))
  {
    uint64_t v11 = OUTLINED_FUNCTION_63_23();
    v5(v11);

    swift_release();
    swift_release();
    swift_release();
  }
  unint64_t v12 = (((((v14 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7 + *(int *)(GeneratorContext + 40));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + v12);
  return MEMORY[0x270FA0238](v0, v12 + 40, v2 | 7);
}

uint64_t sub_2597FD4D8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_2597FD538()
{
  OUTLINED_FUNCTION_240();
  uint64_t v3 = v2;
  uint64_t Generator = type metadata accessor for QueryGenerator(0);
  OUTLINED_FUNCTION_1(Generator);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v10 = (*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = *(void *)(v0 + 16);
  uint64_t v13 = *(void *)(v0 + 24);
  uint64_t v14 = v0 + v9;
  uint64_t v15 = *(void *)(v0 + v10);
  uint64_t v16 = *(void *)(v0 + v10 + 8);
  uint64_t v17 = *(void *)(v0 + v11);
  uint64_t v18 = v0 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  swift_task_alloc();
  OUTLINED_FUNCTION_53_0();
  *(void *)(v1 + 16) = v19;
  *uint64_t v19 = v20;
  v19[1] = sub_259376834;
  return sub_2597F8CE4(v3, v12, v13, v14, v15, v16, v17, v18);
}

char *initializeBufferWithCopyOfBuffer for QueryGeneratorContext(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 1;
    long long v9 = *((_OWORD *)a2 + 2);
    *((_OWORD *)a1 + 2) = v9;
    uint64_t v10 = v9;
    unint64_t v11 = **(void (***)(char *, char **, uint64_t))(v9 - 8);
    uint64_t v12 = v5;
    v11(a1 + 8, v8, v10);
    *((void *)a1 + 6) = a2[6];
    long long v13 = *((_OWORD *)a2 + 5);
    *((_OWORD *)a1 + 5) = v13;
    uint64_t v14 = v13;
    uint64_t v15 = **(void (***)(char *, char **, uint64_t))(v13 - 8);
    swift_retain();
    v15(a1 + 56, a2 + 7, v14);
    uint64_t v16 = a3[8];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = (char *)a2 + v16;
    uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, DisambiguationSuggestionProducer))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
      memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      uint64_t v21 = sub_259843A80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v17, v18, v21);
      uint64_t v22 = *(int *)(DisambiguationSuggestionProducer + 20);
      uint64_t v23 = *(void **)&v18[v22];
      *(void *)&v17[v22] = v23;
      uint64_t v24 = *(int *)(DisambiguationSuggestionProducer + 24);
      uint64_t v25 = &v17[v24];
      uint64_t v26 = &v18[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      *((void *)v25 + 2) = *((void *)v26 + 2);
      id v28 = v23;
      swift_retain();
      swift_retain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, DisambiguationSuggestionProducer);
    }
    uint64_t v29 = a3[9];
    uint64_t v30 = a3[10];
    uint64_t v31 = &a1[v29];
    uint64_t v32 = (char **)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    *(void *)uint64_t v31 = *v32;
    *((void *)v31 + 1) = v33;
    *((void *)v31 + 2) = v32[2];
    uint64_t v34 = &a1[v30];
    uint64_t v35 = (uint64_t)a2 + v30;
    long long v36 = *(_OWORD *)(v35 + 24);
    *(_OWORD *)&a1[v30 + 24] = v36;
    uint64_t v37 = v36;
    uint64_t v38 = **(void (***)(char *, uint64_t, uint64_t))(v36 - 8);
    swift_retain();
    swift_retain();
    swift_retain();
    v38(v34, v35, v37);
  }
  return a1;
}

uint64_t destroy for QueryGeneratorContext(id *a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 1));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 7));
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 32);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (!__swift_getEnumTagSinglePayload(v4, 1, DisambiguationSuggestionProducer))
  {
    uint64_t v6 = sub_259843A80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);

    swift_release();
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = (uint64_t)a1 + *(int *)(a2 + 40);
  return __swift_destroy_boxed_opaque_existential_1(v7);
}

uint64_t initializeWithCopy for QueryGeneratorContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v7 = a1 + 8;
  uint64_t v8 = a2 + 8;
  long long v9 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v9;
  uint64_t v10 = v9;
  unint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  id v12 = v6;
  v11(v7, v8, v10);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  long long v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v13;
  uint64_t v14 = v13;
  uint64_t v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
  swift_retain();
  v15(a1 + 56, a2 + 56, v14);
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)(a1 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, DisambiguationSuggestionProducer))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v21 = sub_259843A80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v17, v18, v21);
    uint64_t v22 = *(int *)(DisambiguationSuggestionProducer + 20);
    uint64_t v23 = *(void **)&v18[v22];
    *(void *)&v17[v22] = v23;
    uint64_t v24 = *(int *)(DisambiguationSuggestionProducer + 24);
    uint64_t v25 = &v17[v24];
    uint64_t v26 = &v18[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *(void *)uint64_t v25 = *(void *)v26;
    *((void *)v25 + 1) = v27;
    *((void *)v25 + 2) = *((void *)v26 + 2);
    id v28 = v23;
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, DisambiguationSuggestionProducer);
  }
  uint64_t v29 = a3[9];
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v29);
  uint64_t v32 = (void *)(a2 + v29);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  v31[2] = v32[2];
  uint64_t v34 = a1 + v30;
  uint64_t v35 = a2 + v30;
  long long v36 = *(_OWORD *)(v35 + 24);
  *(_OWORD *)(a1 + v30 + 24) = v36;
  uint64_t v37 = v36;
  uint64_t v38 = **(void (***)(uint64_t, uint64_t, uint64_t))(v36 - 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v38(v34, v35, v37);
  return a1;
}

uint64_t assignWithCopy for QueryGeneratorContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  uint64_t v9 = a3[8];
  uint64_t v10 = (char *)(a1 + v9);
  unint64_t v11 = (char *)(a2 + v9);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, DisambiguationSuggestionProducer);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, DisambiguationSuggestionProducer);
  if (!EnumTagSinglePayload)
  {
    if (!v14)
    {
      uint64_t v27 = sub_259843A80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 24))(v10, v11, v27);
      uint64_t v28 = *(int *)(DisambiguationSuggestionProducer + 20);
      uint64_t v29 = *(void **)&v11[v28];
      uint64_t v30 = *(void **)&v10[v28];
      *(void *)&v10[v28] = v29;
      id v31 = v29;

      uint64_t v32 = *(int *)(DisambiguationSuggestionProducer + 24);
      uint64_t v33 = &v10[v32];
      uint64_t v34 = &v11[v32];
      *(void *)&v10[v32] = *(void *)v34;
      swift_retain();
      swift_release();
      *((void *)v33 + 1) = *((void *)v34 + 1);
      swift_retain();
      swift_release();
      *((void *)v33 + 2) = *((void *)v34 + 2);
      swift_retain();
      swift_release();
      goto LABEL_7;
    }
    sub_2597FFA60((uint64_t)v10, (void (*)(void))type metadata accessor for QueryDisambiguationSuggestionProducer);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v10, v11, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v15 = sub_259843A80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v11, v15);
  uint64_t v16 = *(int *)(DisambiguationSuggestionProducer + 20);
  uint64_t v17 = *(void **)&v11[v16];
  *(void *)&v10[v16] = v17;
  uint64_t v18 = *(int *)(DisambiguationSuggestionProducer + 24);
  uint64_t v19 = &v10[v18];
  uint64_t v20 = &v11[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  *((void *)v19 + 2) = *((void *)v20 + 2);
  id v21 = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, DisambiguationSuggestionProducer);
LABEL_7:
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  swift_retain();
  swift_release();
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_retain();
  swift_release();
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[10]), (uint64_t *)(a2 + a3[10]));
  return a1;
}

uint64_t initializeWithTake for QueryGeneratorContext(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  long long v7 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = a3[8];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  *(_OWORD *)(a1 + 72) = v7;
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, DisambiguationSuggestionProducer))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_259843A80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v9, v10, v13);
    *(void *)&v9[*(int *)(DisambiguationSuggestionProducer + 20)] = *(void *)&v10[*(int *)(DisambiguationSuggestionProducer
                                                                                             + 20)];
    uint64_t v14 = *(int *)(DisambiguationSuggestionProducer + 24);
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    *((void *)v15 + 2) = *((void *)v16 + 2);
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, DisambiguationSuggestionProducer);
  }
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(void *)(v19 + 16) = *(void *)(v20 + 16);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  long long v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v21 + 32) = *(void *)(v22 + 32);
  return a1;
}

uint64_t assignWithTake for QueryGeneratorContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = a3[8];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, DisambiguationSuggestionProducer);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, DisambiguationSuggestionProducer);
  if (!EnumTagSinglePayload)
  {
    if (!v13)
    {
      uint64_t v27 = sub_259843A80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v9, v10, v27);
      uint64_t v28 = *(int *)(DisambiguationSuggestionProducer + 20);
      uint64_t v29 = *(void **)&v9[v28];
      *(void *)&v9[v28] = *(void *)&v10[v28];

      uint64_t v30 = *(int *)(DisambiguationSuggestionProducer + 24);
      id v31 = &v9[v30];
      uint64_t v32 = &v10[v30];
      *(void *)id v31 = *(void *)v32;
      swift_release();
      *((void *)v31 + 1) = *((void *)v32 + 1);
      swift_release();
      *((void *)v31 + 2) = *((void *)v32 + 2);
      swift_release();
      goto LABEL_7;
    }
    sub_2597FFA60((uint64_t)v9, (void (*)(void))type metadata accessor for QueryDisambiguationSuggestionProducer);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v14 = sub_259843A80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v9, v10, v14);
  *(void *)&v9[*(int *)(DisambiguationSuggestionProducer + 20)] = *(void *)&v10[*(int *)(DisambiguationSuggestionProducer
                                                                                           + 20)];
  uint64_t v15 = *(int *)(DisambiguationSuggestionProducer + 24);
  uint64_t v16 = &v9[v15];
  uint64_t v17 = &v10[v15];
  *((void *)v16 + 2) = *((void *)v17 + 2);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, DisambiguationSuggestionProducer);
LABEL_7:
  uint64_t v19 = a3[9];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  swift_release();
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_release();
  *(void *)(v20 + 16) = *(void *)(v21 + 16);
  swift_release();
  uint64_t v22 = a3[10];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  __swift_destroy_boxed_opaque_existential_1(a1 + v22);
  long long v25 = *(_OWORD *)(v24 + 16);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *(_OWORD *)(v23 + 16) = v25;
  *(void *)(v23 + 32) = *(void *)(v24 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryGeneratorContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2597FE378);
}

uint64_t sub_2597FE378(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 32);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for QueryGeneratorContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2597FE418);
}

void *sub_2597FE418(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 32);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_2597FE49C()
{
  sub_2597FE55C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2597FE55C()
{
  if (!qword_26A391F58)
  {
    type metadata accessor for QueryDisambiguationSuggestionProducer();
    unint64_t v0 = sub_259844DB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A391F58);
    }
  }
}

char *initializeBufferWithCopyOfBuffer for QueryGenerator(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_259843A80();
    uint64_t v8 = (void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    char v45 = *v8;
    (*v8)(a1, (char *)a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = &a1[v9];
    unint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void **)((char *)a2 + v9);
    *(void *)uint64_t v10 = v12;
    long long v13 = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 2) = v13;
    uint64_t v14 = v13;
    uint64_t v15 = **(void (***)(char *, char *, uint64_t))(v13 - 8);
    id v16 = v12;
    v15(v10 + 8, v11 + 8, v14);
    *((void *)v10 + 6) = *((void *)v11 + 6);
    long long v17 = *((_OWORD *)v11 + 5);
    *((_OWORD *)v10 + 5) = v17;
    uint64_t v18 = v17;
    uint64_t v19 = **(void (***)(char *, char *, uint64_t))(v17 - 8);
    swift_retain();
    v19(v10 + 56, v11 + 56, v18);
    uint64_t GeneratorContext = (int *)type metadata accessor for QueryGeneratorContext(0);
    uint64_t v21 = GeneratorContext[8];
    uint64_t v22 = &v10[v21];
    uint64_t v23 = &v11[v21];
    uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
    if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, DisambiguationSuggestionProducer))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
      memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v45(v22, v23, v7);
      uint64_t v27 = *(int *)(DisambiguationSuggestionProducer + 20);
      uint64_t v28 = *(void **)&v23[v27];
      *(void *)&v22[v27] = v28;
      uint64_t v29 = *(int *)(DisambiguationSuggestionProducer + 24);
      uint64_t v30 = &v22[v29];
      id v31 = &v23[v29];
      uint64_t v32 = *((void *)v31 + 1);
      *(void *)uint64_t v30 = *(void *)v31;
      *((void *)v30 + 1) = v32;
      *((void *)v30 + 2) = *((void *)v31 + 2);
      id v33 = v28;
      swift_retain();
      swift_retain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, DisambiguationSuggestionProducer);
    }
    uint64_t v34 = GeneratorContext[9];
    uint64_t v35 = &v10[v34];
    long long v36 = &v11[v34];
    uint64_t v37 = *((void *)v36 + 1);
    *(void *)uint64_t v35 = *(void *)v36;
    *((void *)v35 + 1) = v37;
    *((void *)v35 + 2) = *((void *)v36 + 2);
    uint64_t v38 = GeneratorContext[10];
    uint64_t v39 = &v10[v38];
    uint64_t v40 = &v11[v38];
    long long v41 = *(_OWORD *)&v11[v38 + 24];
    *(_OWORD *)&v10[v38 + 24] = v41;
    uint64_t v42 = v41;
    uint64_t v43 = **(void (***)(char *, char *, uint64_t))(v41 - 8);
    swift_retain();
    swift_retain();
    swift_retain();
    v43(v39, v40, v42);
  }
  return a1;
}

uint64_t destroy for QueryGenerator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_259843A80();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = (id *)(a1 + *(int *)(a2 + 20));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v6 + 1));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v6 + 7));
  uint64_t GeneratorContext = type metadata accessor for QueryGeneratorContext(0);
  uint64_t v8 = (uint64_t)v6 + *(int *)(GeneratorContext + 32);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (!__swift_getEnumTagSinglePayload(v8, 1, DisambiguationSuggestionProducer))
  {
    v5(v8, v4);

    swift_release();
    swift_release();
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = (uint64_t)v6 + *(int *)(GeneratorContext + 40);
  return __swift_destroy_boxed_opaque_existential_1(v10);
}

uint64_t initializeWithCopy for QueryGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259843A80();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v43 = a1;
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  unint64_t v11 = *(void **)(a2 + v8);
  *(void *)uint64_t v9 = v11;
  long long v12 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 32) = v12;
  uint64_t v13 = v12;
  uint64_t v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  id v15 = v11;
  v14(v9 + 8, v10 + 8, v13);
  *(void *)(v9 + 48) = *(void *)(v10 + 48);
  long long v16 = *(_OWORD *)(v10 + 80);
  *(_OWORD *)(v9 + 80) = v16;
  uint64_t v17 = v16;
  uint64_t v18 = **(void (***)(uint64_t, uint64_t, uint64_t))(v16 - 8);
  swift_retain();
  v18(v9 + 56, v10 + 56, v17);
  uint64_t GeneratorContext = (int *)type metadata accessor for QueryGeneratorContext(0);
  uint64_t v20 = GeneratorContext[8];
  uint64_t v21 = (char *)(v9 + v20);
  uint64_t v22 = (char *)(v10 + v20);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, DisambiguationSuggestionProducer))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v21, (uint64_t)v22, v6);
    uint64_t v25 = *(int *)(DisambiguationSuggestionProducer + 20);
    uint64_t v26 = *(void **)&v22[v25];
    *(void *)&v21[v25] = v26;
    uint64_t v27 = *(int *)(DisambiguationSuggestionProducer + 24);
    uint64_t v28 = &v21[v27];
    uint64_t v29 = &v22[v27];
    uint64_t v30 = *((void *)v29 + 1);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    *((void *)v28 + 2) = *((void *)v29 + 2);
    id v31 = v26;
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, DisambiguationSuggestionProducer);
  }
  uint64_t v32 = GeneratorContext[9];
  id v33 = (void *)(v9 + v32);
  uint64_t v34 = (void *)(v10 + v32);
  uint64_t v35 = v34[1];
  void *v33 = *v34;
  v33[1] = v35;
  v33[2] = v34[2];
  uint64_t v36 = GeneratorContext[10];
  uint64_t v37 = v9 + v36;
  uint64_t v38 = v10 + v36;
  long long v39 = *(_OWORD *)(v10 + v36 + 24);
  *(_OWORD *)(v9 + v36 + 24) = v39;
  uint64_t v40 = v39;
  long long v41 = **(void (***)(uint64_t, uint64_t, uint64_t))(v39 - 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v41(v37, v38, v40);
  return v43;
}

uint64_t assignWithCopy for QueryGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259843A80();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v40 = a1;
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (uint64_t *)(a2 + v8);
  unint64_t v11 = *(void **)(a2 + v8);
  long long v12 = *(void **)v9;
  *(void *)uint64_t v9 = v11;
  id v13 = v11;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v9 + 8), v10 + 1);
  *(void *)(v9 + 48) = v10[6];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v9 + 56), v10 + 7);
  uint64_t GeneratorContext = (int *)type metadata accessor for QueryGeneratorContext(0);
  uint64_t v15 = GeneratorContext[8];
  long long v16 = (char *)(v9 + v15);
  uint64_t v17 = (char *)v10 + v15;
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, DisambiguationSuggestionProducer);
  int v20 = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, DisambiguationSuggestionProducer);
  if (!EnumTagSinglePayload)
  {
    if (!v20)
    {
      v7((uint64_t)v16, (uint64_t)v17, v6);
      uint64_t v32 = *(int *)(DisambiguationSuggestionProducer + 20);
      id v33 = *(void **)&v17[v32];
      uint64_t v34 = *(void **)&v16[v32];
      *(void *)&v16[v32] = v33;
      id v35 = v33;

      uint64_t v36 = *(int *)(DisambiguationSuggestionProducer + 24);
      uint64_t v37 = &v16[v36];
      uint64_t v38 = &v17[v36];
      *(void *)&v16[v36] = *(void *)&v17[v36];
      swift_retain();
      swift_release();
      *((void *)v37 + 1) = *((void *)v38 + 1);
      swift_retain();
      swift_release();
      *((void *)v37 + 2) = *((void *)v38 + 2);
      swift_retain();
      swift_release();
      goto LABEL_7;
    }
    sub_2597FFA60((uint64_t)v16, (void (*)(void))type metadata accessor for QueryDisambiguationSuggestionProducer);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v16, v17, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v16, v17, v6);
  uint64_t v21 = *(int *)(DisambiguationSuggestionProducer + 20);
  uint64_t v22 = *(void **)&v17[v21];
  *(void *)&v16[v21] = v22;
  uint64_t v23 = *(int *)(DisambiguationSuggestionProducer + 24);
  uint64_t v24 = &v16[v23];
  uint64_t v25 = &v17[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  *((void *)v24 + 2) = *((void *)v25 + 2);
  id v26 = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, DisambiguationSuggestionProducer);
LABEL_7:
  uint64_t v28 = GeneratorContext[9];
  uint64_t v29 = v9 + v28;
  uint64_t v30 = (char *)v10 + v28;
  *(void *)(v9 + v28) = *(uint64_t *)((char *)v10 + v28);
  swift_retain();
  swift_release();
  *(void *)(v29 + 8) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  *(void *)(v29 + 16) = *((void *)v30 + 2);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(v9 + GeneratorContext[10]), (uint64_t *)((char *)v10 + GeneratorContext[10]));
  return v40;
}

uint64_t initializeWithTake for QueryGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259843A80();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)(a2 + v8);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(a2 + v8 + 8);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)(a2 + v8 + 24);
  uint64_t v11 = *(void *)(a2 + v8 + 48);
  *(void *)(v9 + 40) = *(void *)(a2 + v8 + 40);
  *(void *)(v9 + 48) = v11;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + v8 + 56);
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(a2 + v8 + 72);
  *(void *)(v9 + 88) = *(void *)(a2 + v8 + 88);
  uint64_t GeneratorContext = (int *)type metadata accessor for QueryGeneratorContext(0);
  uint64_t v13 = GeneratorContext[8];
  uint64_t v14 = (char *)(v9 + v13);
  uint64_t v15 = (char *)(v10 + v13);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, DisambiguationSuggestionProducer))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v14, (uint64_t)v15, v6);
    *(void *)&v14[*(int *)(DisambiguationSuggestionProducer + 20)] = *(void *)&v15[*(int *)(DisambiguationSuggestionProducer
                                                                                              + 20)];
    uint64_t v18 = *(int *)(DisambiguationSuggestionProducer + 24);
    uint64_t v19 = &v14[v18];
    int v20 = &v15[v18];
    *((void *)v19 + 2) = *((void *)v20 + 2);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, DisambiguationSuggestionProducer);
  }
  uint64_t v21 = GeneratorContext[9];
  uint64_t v22 = v9 + v21;
  uint64_t v23 = v10 + v21;
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  uint64_t v24 = GeneratorContext[10];
  uint64_t v25 = v9 + v24;
  uint64_t v26 = v10 + v24;
  *(void *)(v25 + 32) = *(void *)(v26 + 32);
  long long v27 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *(_OWORD *)(v25 + 16) = v27;
  return a1;
}

uint64_t assignWithTake for QueryGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259843A80();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v38 = a1;
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  __swift_destroy_boxed_opaque_existential_1(v9 + 8);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)(v10 + 24);
  uint64_t v12 = *(void *)(v10 + 48);
  *(void *)(v9 + 40) = *(void *)(v10 + 40);
  *(void *)(v9 + 48) = v12;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v9 + 56);
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(v10 + 56);
  *(_OWORD *)(v9 + 72) = *(_OWORD *)(v10 + 72);
  *(void *)(v9 + 88) = *(void *)(v10 + 88);
  uint64_t GeneratorContext = (int *)type metadata accessor for QueryGeneratorContext(0);
  uint64_t v14 = GeneratorContext[8];
  uint64_t v15 = (char *)(v9 + v14);
  long long v16 = (char *)(v10 + v14);
  uint64_t DisambiguationSuggestionProducer = type metadata accessor for QueryDisambiguationSuggestionProducer();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, DisambiguationSuggestionProducer);
  int v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, DisambiguationSuggestionProducer);
  if (!EnumTagSinglePayload)
  {
    if (!v19)
    {
      v7((uint64_t)v15, (uint64_t)v16, v6);
      uint64_t v32 = *(int *)(DisambiguationSuggestionProducer + 20);
      id v33 = *(void **)&v15[v32];
      *(void *)&v15[v32] = *(void *)&v16[v32];

      uint64_t v34 = *(int *)(DisambiguationSuggestionProducer + 24);
      id v35 = &v15[v34];
      uint64_t v36 = &v16[v34];
      *(void *)&v15[v34] = *(void *)&v16[v34];
      swift_release();
      *((void *)v35 + 1) = *((void *)v36 + 1);
      swift_release();
      *((void *)v35 + 2) = *((void *)v36 + 2);
      swift_release();
      goto LABEL_7;
    }
    sub_2597FFA60((uint64_t)v15, (void (*)(void))type metadata accessor for QueryDisambiguationSuggestionProducer);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A38D158);
    memcpy(v15, v16, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v15, v16, v6);
  *(void *)&v15[*(int *)(DisambiguationSuggestionProducer + 20)] = *(void *)&v16[*(int *)(DisambiguationSuggestionProducer
                                                                                            + 20)];
  uint64_t v20 = *(int *)(DisambiguationSuggestionProducer + 24);
  uint64_t v21 = &v15[v20];
  uint64_t v22 = &v16[v20];
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, DisambiguationSuggestionProducer);
LABEL_7:
  uint64_t v24 = GeneratorContext[9];
  uint64_t v25 = v9 + v24;
  uint64_t v26 = v10 + v24;
  *(void *)(v9 + v24) = *(void *)(v10 + v24);
  swift_release();
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_release();
  *(void *)(v25 + 16) = *(void *)(v26 + 16);
  swift_release();
  uint64_t v27 = GeneratorContext[10];
  uint64_t v28 = v9 + v27;
  uint64_t v29 = v10 + v27;
  __swift_destroy_boxed_opaque_existential_1(v9 + v27);
  long long v30 = *(_OWORD *)(v29 + 16);
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  *(_OWORD *)(v28 + 16) = v30;
  *(void *)(v28 + 32) = *(void *)(v29 + 32);
  return v38;
}

uint64_t getEnumTagSinglePayload for QueryGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2597FF4F4);
}

uint64_t sub_2597FF4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_259843A80();
  OUTLINED_FUNCTION_46();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t GeneratorContext = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t GeneratorContext = type metadata accessor for QueryGeneratorContext(0);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, GeneratorContext);
}

uint64_t storeEnumTagSinglePayload for QueryGenerator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2597FF584);
}

uint64_t sub_2597FF584(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_259843A80();
  OUTLINED_FUNCTION_46();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t GeneratorContext = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t GeneratorContext = type metadata accessor for QueryGeneratorContext(0);
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v11, a2, a2, GeneratorContext);
}

uint64_t sub_2597FF608()
{
  uint64_t result = sub_259843A80();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for QueryGeneratorContext(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

id *destroy for QueryGenerator.Error(id *result)
{
  if ((unint64_t)*result >= 0xFFFFFFFF)
  {

    swift_bridgeObjectRelease();
    return (id *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18PhotosIntelligence14QueryGeneratorV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v5;
    id v6 = v3;
    sub_259843F00();
    sub_259843F00();
  }
  return a1;
}

uint64_t assignWithCopy for QueryGenerator.Error(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (*(void *)a1 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      id v7 = v5;
      sub_259843F00();
      sub_259843F00();
      return a1;
    }
LABEL_7:
    long long v8 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(void *)a1 = v5;
  id v6 = v5;

  *(void *)(a1 + 8) = *((void *)a2 + 1);
  sub_259843F00();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  sub_259843F00();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for QueryGenerator.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    return a1;
  }
  *(void *)a1 = *(void *)a2;

  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryGenerator.Error(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFA && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 2147483643);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 4;
  if (v4 >= 6) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for QueryGenerator.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 4;
    }
  }
  return result;
}

void *sub_2597FF9C8(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
    result[2] = 0;
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

ValueMetadata *type metadata accessor for QueryGenerator.Error()
{
  return &type metadata for QueryGenerator.Error;
}

uint64_t sub_2597FF9F8(uint64_t *a1)
{
  return sub_2597FCD10(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2597FFA00(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_2597FFA60(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_20_57()
{
  return *(void *)(v0 + 536);
}

uint64_t OUTLINED_FUNCTION_24_53()
{
  return *(void *)(v0 + 568);
}

unint64_t OUTLINED_FUNCTION_46_33()
{
  return 0xD000000000000010;
}

uint64_t OUTLINED_FUNCTION_61_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  return sub_259356D5C(a1, v27, &a27);
}

uint64_t OUTLINED_FUNCTION_62_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63_23()
{
  return v0;
}

uint64_t static FeaturedPhotoFetcher.collectionName.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_26A391F70;
  sub_259843F00();
  return v0;
}

uint64_t static FeaturedPhotoFetcher.collectionName.setter(uint64_t a1, uint64_t a2)
{
  qword_26A391F70 = a1;
  qword_26A391F78 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FeaturedPhotoFetcher.collectionName.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_2597FFC98()
{
  uint64_t v0 = sub_259843A80();
  __swift_allocate_value_buffer(v0, qword_26A391F80);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A391F80);
  sub_259845110();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_259843F00();
  sub_259844240();
  swift_bridgeObjectRelease();
  return sub_259843A60();
}

uint64_t static FeaturedPhotoFetcher.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A388C60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259843A80();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A391F80);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static FeaturedPhotoFetcher.logger.setter(uint64_t a1)
{
  if (qword_26A388C60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259843A80();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A391F80);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static FeaturedPhotoFetcher.logger.modify())()
{
  if (qword_26A388C60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_259843A80();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A391F80);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static FeaturedPhotoFetcher.summaryFetchLimit.getter()
{
  return 10;
}

uint64_t static FeaturedPhotoFetcher.defaultSortDescriptors(ascending:)(char a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300600);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25987C440;
  id v3 = objc_allocWithZone(MEMORY[0x263F08B30]);
  *(void *)(v2 + 32) = sub_259355C14(0x6465727574616566, 0xED00006574617453, a1);
  id v4 = objc_allocWithZone(MEMORY[0x263F08B30]);
  *(void *)(v2 + 40) = sub_259355C14(0x6E6F697461657263, 0xEC00000065746144, a1);
  id v5 = objc_allocWithZone(MEMORY[0x263F08B30]);
  *(void *)(v2 + 48) = sub_259355C14(1684632949, 0xE400000000000000, a1);
  sub_259844530();
  return v2;
}

id static FeaturedPhotoFetcher.basePredicate(using:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300600);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25987BF60;
  *(void *)(v2 + 32) = objc_msgSend(self, sel_predicateForAllFeaturedStateEnabledSuggestionTypesForWidget);
  sub_25935633C(0, &qword_26B300508);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B300570);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_259876910;
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  unint64_t v5 = sub_25935626C();
  *(void *)(v3 + 64) = v5;
  *(void *)(v3 + 32) = 0x6574617473;
  *(void *)(v3 + 40) = 0xE500000000000000;
  uint64_t v6 = MEMORY[0x263F8E888];
  uint64_t v7 = MEMORY[0x263F8E8E8];
  *(void *)(v3 + 96) = MEMORY[0x263F8E888];
  *(void *)(v3 + 104) = v7;
  *(_WORD *)(v3 + 72) = 4;
  *(void *)(v2 + 40) = sub_259844AB0();
  sub_259844530();
  if (a1)
  {
    switch(*(unsigned char *)(a1 + 32))
    {
      case 3:
        swift_retain();
        swift_bridgeObjectRelease();
        goto LABEL_5;
      default:
        char v8 = sub_259845750();
        swift_retain();
        swift_bridgeObjectRelease();
        if (v8)
        {
LABEL_5:
          uint64_t v9 = swift_allocObject();
          *(_OWORD *)(v9 + 16) = xmmword_259876910;
          *(void *)(v9 + 56) = v4;
          *(void *)(v9 + 64) = v5;
          strcpy((char *)(v9 + 32), "featuredState");
          *(_WORD *)(v9 + 46) = -4864;
          *(void *)(v9 + 96) = v6;
          *(void *)(v9 + 104) = v7;
          *(_WORD *)(v9 + 72) = 1;
          sub_259844AB0();
          MEMORY[0x25A2DED30]();
          if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_259844560();
          }
          sub_2598445B0();
          sub_259844530();
          swift_release();
        }
        else
        {
          swift_release();
        }
        break;
    }
  }
  sub_25935633C(0, (unint64_t *)&unk_26B300530);
  return sub_2593562B8();
}

id static FeaturedPhotoFetcher.fetchCollections(using:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  sub_2594410C4();
  id v2 = objc_msgSend(self, sel_fetchSuggestionsWithOptions_, v1);
  return v2;
}

uint64_t FeaturedPhotoFetcher.deinit()
{
  return v0;
}

uint64_t FeaturedPhotoFetcher.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25980048C()
{
  return static FeaturedPhotoFetcher.collectionName.getter();
}

uint64_t sub_2598004A8@<X0>(uint64_t a1@<X8>)
{
  return static FeaturedPhotoFetcher.logger.getter(a1);
}

id sub_2598004C0(uint64_t a1)
{
  return static FeaturedPhotoFetcher.basePredicate(using:)(a1);
}

uint64_t sub_2598004D8(char a1)
{
  return static FeaturedPhotoFetcher.defaultSortDescriptors(ascending:)(a1);
}

uint64_t type metadata accessor for FeaturedPhotoFetcher()
{
  return self;
}

uint64_t method lookup function for FeaturedPhotoFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeaturedPhotoFetcher);
}

uint64_t sub_25980052C()
{
  uint64_t result = sub_259843EE0();
  qword_26B301B68 = result;
  return result;
}

uint64_t sub_25980056C()
{
  uint64_t result = sub_259843EE0();
  qword_26B301B70 = result;
  return result;
}

uint64_t sub_2598005AC()
{
  uint64_t result = sub_259843EE0();
  qword_26B301B78 = result;
  return result;
}

uint64_t sub_2598005EC()
{
  uint64_t result = sub_259843EE0();
  qword_26B301B80 = result;
  return result;
}

uint64_t sub_25980062C()
{
  uint64_t result = sub_259843EE0();
  qword_26B301B58 = result;
  return result;
}

uint64_t sub_25980066C()
{
  uint64_t result = sub_259843EE0();
  qword_26B301B60 = result;
  return result;
}

id SocialGroupAssetElector.__allocating_init(photoLibrary:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return _s18PhotosIntelligence23SocialGroupAssetElectorC12photoLibraryACSo07PHPhotoH0C_tcfc_0(a1);
}

id sub_2598006E0(void *a1, char *a2)
{
  unint64_t v5 = *(void **)(v2 + qword_26A390488);
  type metadata accessor for PerformanceMeasure();
  swift_allocObject();
  id v6 = v5;
  PerformanceMeasure.init(name:log:)();
  id v7 = a1;
  char v8 = sub_259843A50();
  os_log_type_t v9 = sub_259844B30();
  uint64_t v10 = &unk_25987B000;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    id v12 = objc_msgSend(v7, sel_localIdentifier);
    uint64_t v13 = a2;
    uint64_t v14 = sub_2598440A0();
    unint64_t v16 = v15;

    uint64_t v17 = v14;
    a2 = v13;
    sub_259356D5C(v17, v16, &v42);
    OUTLINED_FUNCTION_7();
    uint64_t v10 = (void *)&unk_25987B000;
    sub_259844E10();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25934C000, v8, v9, "Start electing assets for social group %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
  }
  uint64_t v18 = (void *)sub_2594594DC(a2);
  type metadata accessor for PersonCuration();
  id v19 = static PersonCuration.fetchCuratedAssets(for:options:useSummary:includeOthersInSocialGroupAssets:)(v7, v18, 0, 0);
  if (objc_msgSend(v19, sel_count))
  {
    id v20 = sub_259459D44(v19, a2);
    id v21 = objc_allocWithZone((Class)type metadata accessor for AssetElectionResult());
    id v22 = AssetElectionResult.init(fetchResult:)((uint64_t)v20);
  }
  else
  {
    id v23 = v7;
    uint64_t v24 = sub_259843A50();
    os_log_type_t v25 = sub_259844B30();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t type = v25;
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = v10[191];
      id v27 = objc_msgSend(v23, sel_localIdentifier);
      uint64_t v28 = sub_2598440A0();
      unint64_t v30 = v29;

      sub_259356D5C(v28, v30, &v42);
      OUTLINED_FUNCTION_7();
      id v31 = &selRef_interestingPersonsFromPersons_updateBlock_;
      sub_259844E10();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25934C000, v24, type, "Found 0 curated asset for social group %s", v26, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_61_0();
      OUTLINED_FUNCTION_61_0();
    }
    else
    {

      id v31 = &selRef_interestingPersonsFromPersons_updateBlock_;
    }
    id v32 = objc_allocWithZone((Class)type metadata accessor for AssetElectionResult());
    id v33 = v19;
    id v22 = AssetElectionResult.init(fetchResult:)((uint64_t)v33);
    id v34 = [v23 v31[98]];
    uint64_t v35 = sub_2598440A0();
    uint64_t v37 = v36;

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A38B870);
    sub_259800B38();
    uint64_t v38 = (void *)swift_allocError();
    *(void *)uint64_t v39 = 6;
    *(void *)(v39 + 8) = v35;
    *(void *)(v39 + 16) = v37;
    *(unsigned char *)(v39 + 24) = 1;
    sub_25943DC24(v38);
    id v19 = v18;
    uint64_t v18 = v33;
  }

  sub_2593563FC();
  swift_release();
  return v22;
}

unint64_t sub_259800B38()
{
  unint64_t result = qword_26A38B878;
  if (!qword_26A38B878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A38B870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A38B878);
  }
  return result;
}

id SocialGroupAssetElector.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialGroupAssetElector();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SocialGroupAssetElector()
{
  uint64_t result = qword_26A391F98;
  if (!qword_26A391F98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for SocialGroupAssetElector(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SocialGroupAssetElector);
}

uint64_t dispatch thunk of SocialGroupAssetElector.electAssetsFor(socialGroup:options:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t sub_259800C58()
{
  return type metadata accessor for SocialGroupAssetElector();
}

id SafeTokenAnalyzer.__allocating_init(photoLibrary:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SafeTokenAnalyzer.init(photoLibrary:)(a1);
}

uint64_t SafeTokenAnalyzer.personOrPetUUIDsWithNegativeFeedback.getter()
{
  return sub_259843F00();
}

uint64_t sub_259800CE0()
{
  sub_2593C4E3C();
  uint64_t result = sub_259844DA0();
  qword_26A391FA8 = result;
  return result;
}

id SafeTokenAnalyzer.init(photoLibrary:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2FFBD0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC18PhotosIntelligence17SafeTokenAnalyzer_personOrPetUUIDsWithNegativeFeedback] = MEMORY[0x263F8EE88];
  if (qword_26A388C68 != -1) {
    swift_once();
  }
  id v7 = (void *)qword_26A391FA8;
  type metadata accessor for PerformanceMeasure();
  swift_allocObject();
  id v8 = v7;
  PerformanceMeasure.init(name:log:)();
  v16.receiver = v1;
  v16.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v16, sel_init);
  uint64_t v10 = sub_259844740();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v11;
  v12[5] = a1;
  id v13 = v9;
  id v14 = a1;
  sub_2593A9D18((uint64_t)v6, (uint64_t)&unk_26A391FC0, (uint64_t)v12);
  swift_release();
  sub_2593563FC();
  swift_release();

  return v13;
}

uint64_t sub_259800F20()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259800F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[8] = a1;
  return MEMORY[0x270FA2498](sub_259800F7C, 0, 0);
}

uint64_t sub_259800F7C()
{
  uint64_t v1 = *(void *)(v0 + 72) + 16;
  swift_beginAccess();
  objc_super v2 = (char *)MEMORY[0x25A2E14E0](v1);
  if (v2)
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14F60]), sel_initWithPhotoLibrary_, *(void *)(v0 + 80));
    id v4 = objc_msgSend(v3, sel_personUUIDsWithNegativeFeedback);

    uint64_t v5 = sub_259844920();
    id v6 = (uint64_t *)&v2[OBJC_IVAR____TtC18PhotosIntelligence17SafeTokenAnalyzer_personOrPetUUIDsWithNegativeFeedback];
    swift_beginAccess();
    *id v6 = v5;
    swift_bridgeObjectRelease();
  }
  **(unsigned char **)(v0 + 64) = v2 == 0;
  id v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2598010AC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2598010F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *id v8 = v2;
  v8[1] = sub_2594C86CC;
  return sub_259800F58(a1, v4, v5, v7, v6);
}

id SafeTokenAnalyzer.__allocating_init(personOrPetUUIDsWithNegativeFeedback:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return SafeTokenAnalyzer.init(personOrPetUUIDsWithNegativeFeedback:)(a1);
}

id SafeTokenAnalyzer.init(personOrPetUUIDsWithNegativeFeedback:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC18PhotosIntelligence17SafeTokenAnalyzer_personOrPetUUIDsWithNegativeFeedback];
  *(void *)&v1[OBJC_IVAR____TtC18PhotosIntelligence17SafeTokenAnalyzer_personOrPetUUIDsWithNegativeFeedback] = MEMORY[0x263F8EE88];
  swift_beginAccess();
  *(void *)uint64_t v4 = a1;
  swift_bridgeObjectRelease();
  v6.receiver = v1;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_init);
}

BOOL SafeTokenAnalyzer.isSafe(personExtendedToken:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  OUTLINED_FUNCTION_0_75();
  uint64_t v4 = *v1;
  sub_259843F00();
  sub_259843F00();
  sub_25973CE24(v2, v3, v4);
  LOBYTE(v2) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

BOOL SafeTokenAnalyzer.isSafe(petExtendedToken:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  OUTLINED_FUNCTION_0_75();
  uint64_t v4 = *v1;
  sub_259843F00();
  sub_259843F00();
  sub_25973CE24(v2, v3, v4);
  LOBYTE(v2) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v2 & 1) == 0;
}

id SafeTokenAnalyzer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SafeTokenAnalyzer.init()()
{
}

id SafeTokenAnalyzer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_259801424(uint64_t a1)
{
  return SafeTokenAnalyzer.isSafe(personExtendedToken:)(a1);
}

BOOL sub_25980144C(uint64_t a1)
{
  return SafeTokenAnalyzer.isSafe(petExtendedToken:)(a1);
}

uint64_t sub_259801474()
{
  return SafeTokenAnalyzer.personOrPetUUIDsWithNegativeFeedback.getter();
}

uint64_t dispatch thunk of SafeTokenAnalyzing.isSafe(personExtendedToken:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SafeTokenAnalyzing.isSafe(petExtendedToken:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SafeTokenAnalyzing.personOrPetUUIDsWithNegativeFeedback.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for SafeTokenAnalyzer()
{
  return self;
}

uint64_t method lookup function for SafeTokenAnalyzer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SafeTokenAnalyzer);
}

uint64_t dispatch thunk of SafeTokenAnalyzer.__allocating_init(photoLibrary:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SafeTokenAnalyzer.__allocating_init(personOrPetUUIDsWithNegativeFeedback:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_259801538(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_2594F1B70();
    if (v2 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v3 = 0;
    while (v2 != v3)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v4 = (id)MEMORY[0x25A2DFA20](v3, a1);
      }
      else {
        id v4 = *(id *)(a1 + 8 * v3 + 32);
      }
      char v5 = v4;
      objc_msgSend(v4, sel_floatValue);
      int v7 = v6;

      unint64_t v8 = *(void *)(v9 + 16);
      if (v8 >= *(void *)(v9 + 24) >> 1) {
        sub_2594F1B70();
      }
      ++v3;
      *(void *)(v9 + 16) = v8 + 1;
      *(_DWORD *)(v9 + 4 * v8 + 32) = v7;
      if (v2 == v3) {
        return;
      }
    }
    __break(1u);
LABEL_15:
    sub_259843F00();
    uint64_t v2 = sub_259845460();
    swift_bridgeObjectRelease();
  }
}

uint64_t PNTextEmbeddingResult.embeddingFloatValues.getter()
{
  id v1 = objc_msgSend(v0, sel_embedding);
  sub_2593A3F7C();
  unint64_t v2 = sub_259844500();

  sub_259801538(v2);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t PNTextEmbeddingService.encode(_:)(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_259801740, 0, 0);
}

uint64_t sub_259801740()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = sub_2598444E0();
  v0[18] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25980185C;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2594C225C;
  v0[13] = &block_descriptor_6;
  v0[14] = v3;
  objc_msgSend(v1, sel_requestTextEmbeddings_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25980185C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_259801C90;
  }
  else {
    uint64_t v2 = sub_25980196C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_25980196C()
{
  unint64_t v1 = (unint64_t)v0[15];

  if (v1 >> 62)
  {
LABEL_26:
    sub_259843F00();
    uint64_t v2 = sub_259845460();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_3;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_28:
    uint64_t v17 = v0[1];
    ((void (*)(uint64_t))v17)(v4);
    return;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    goto LABEL_27;
  }
LABEL_3:
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_2594F2190();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = 0;
    uint64_t v4 = v24;
    id v21 = (char *)v1;
    unint64_t v22 = v1 & 0xC000000000000001;
    uint64_t v18 = v0;
    id v19 = (char *)(v1 + 32);
    uint64_t v0 = &selRef__mePersonUUIDInPhotoLibrary_;
    uint64_t v20 = v2;
    while (1)
    {
      uint64_t v23 = v4;
      if (v22)
      {
        uint64_t v5 = (void *)MEMORY[0x25A2DFA20](v3, v1);
      }
      else
      {
        uint64_t v5 = *(void **)&v19[8 * v3];
        swift_unknownObjectRetain();
      }
      id v6 = objc_msgSend(v5, sel_embedding);
      sub_2593A3F7C();
      unint64_t v7 = sub_259844500();

      if (v7 >> 62)
      {
        sub_259843F00();
        uint64_t v8 = sub_259845460();
        swift_bridgeObjectRelease();
        if (!v8)
        {
LABEL_20:
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          uint64_t v10 = MEMORY[0x263F8EE78];
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v8) {
          goto LABEL_20;
        }
      }
      uint64_t v25 = MEMORY[0x263F8EE78];
      sub_2594F1B70();
      if (v8 < 0)
      {
        __break(1u);
        goto LABEL_26;
      }
      uint64_t v9 = 0;
      uint64_t v10 = v25;
      do
      {
        if ((v7 & 0xC000000000000001) != 0) {
          id v11 = (id)MEMORY[0x25A2DFA20](v9, v7);
        }
        else {
          id v11 = *(id *)(v7 + 8 * v9 + 32);
        }
        id v12 = v11;
        objc_msgSend(v11, sel_floatValue);
        int v14 = v13;

        unint64_t v15 = *(void *)(v25 + 16);
        if (v15 >= *(void *)(v25 + 24) >> 1) {
          sub_2594F1B70();
        }
        ++v9;
        *(void *)(v25 + 16) = v15 + 1;
        *(_DWORD *)(v25 + 4 * v15 + 32) = v14;
      }
      while (v8 != v9);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v2 = v20;
      unint64_t v1 = (unint64_t)v21;
LABEL_21:
      uint64_t v4 = v23;
      unint64_t v16 = *(void *)(v23 + 16);
      if (v16 >= *(void *)(v23 + 24) >> 1)
      {
        sub_2594F2190();
        uint64_t v4 = v23;
      }
      ++v3;
      *(void *)(v4 + 16) = v16 + 1;
      *(void *)(v4 + 8 * v16 + 32) = v10;
      if (v3 == v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v0 = v18;
        goto LABEL_28;
      }
    }
  }
  __break(1u);
}

uint64_t sub_259801C90()
{
  unint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

float static PNTextEmbeddingService.score(from:relativeTo:)(uint64_t a1, uint64_t a2)
{
  sub_259701F7C(a1, a2);
  float v3 = (float)(v2 + 1.0) * 0.5;
  float result = 0.0;
  if (v3 > 0.0)
  {
    float v5 = (float)(1.0 - v3) / v3;
    BOOL v6 = v5 > 1.0 || v5 < 0.0;
    float result = 1.0 - v5;
    if (v6) {
      return 0.0;
    }
  }
  return result;
}

id static PNTextEmbeddingService.modelVersionIntValue()()
{
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelVersion);
  unint64_t v1 = v0;
  if (!v0) {
    return 0;
  }
  id v2 = objc_msgSend(v0, sel_integerValue);

  return v2;
}

uint64_t sub_259801DBC()
{
  return sub_259801E04((uint64_t (*)(void, uint64_t, uint64_t))sub_2594F1B50);
}

uint64_t sub_259801DD4()
{
  return sub_259801E04((uint64_t (*)(void, uint64_t, uint64_t))sub_2594F1B70);
}

uint64_t sub_259801DEC()
{
  return sub_259801E04((uint64_t (*)(void, uint64_t, uint64_t))sub_2594F1B90);
}

uint64_t sub_259801E04(uint64_t (*a1)(void, uint64_t, uint64_t))
{
  uint64_t v2 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v1 = v2;
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void *)(v2 + 16) + 1;
    return a1(0, v4, 1);
  }
  return result;
}

uint64_t sub_259801E78(uint64_t a1)
{
  return sub_259801EC0(a1, (uint64_t (*)(BOOL))sub_2594F1B50);
}

uint64_t sub_259801E90(uint64_t a1)
{
  return sub_259801EC0(a1, (uint64_t (*)(BOOL))sub_2594F1B70);
}

uint64_t sub_259801EA8(uint64_t a1)
{
  return sub_259801EC0(a1, (uint64_t (*)(BOOL))sub_2594F1B90);
}

uint64_t sub_259801EC0(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1)) {
    return a2(v3 > 1);
  }
  return result;
}

_OWORD *sub_259801EF0(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = a1 + 1;
  return sub_2593A2C40(a2, (_OWORD *)(v3 + 32 * a1 + 32));
}

uint64_t sub_259801F10(uint64_t result, float a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = result + 1;
  *(float *)(v3 + 4 * result + 32) = a2;
  return result;
}

uint64_t sub_259801F28(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = result + 1;
  *(void *)(v3 + 8 * result + 32) = a2;
  return result;
}

void sub_259801F40(void *a1, uint64_t a2)
{
  id v4 = sub_259802598();
  id v5 = objc_msgSend(a1, sel_curationModel);
  id v6 = objc_msgSend(v4, sel_confidenceThresholdBySceneIdentifierWithCurationModel_, v5);

  sub_25935633C(0, (unint64_t *)&qword_26B2FFA10);
  sub_2595464BC(&qword_26B2F8410, (unint64_t *)&qword_26B2FFA10);
  uint64_t v30 = sub_259843EB0();

  if ((a2 & 0xC000000000000001) != 0)
  {
    sub_259843F00();
    sub_259844F70();
    sub_25935633C(0, (unint64_t *)&unk_26B2F8580);
    sub_2595464BC((unint64_t *)&qword_26B2F8590, (unint64_t *)&unk_26B2F8580);
    sub_259844970();
    a2 = v32;
    uint64_t v29 = v33;
    uint64_t v7 = v34;
    int64_t v8 = v35;
    unint64_t v9 = v36;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v29 = a2 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v9 = v12 & *(void *)(a2 + 56);
    sub_259843F00();
    int64_t v8 = 0;
  }
  int64_t v28 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    int64_t v13 = v8;
    if (a2 < 0)
    {
      if (!sub_259845010()) {
        goto LABEL_40;
      }
      sub_25935633C(0, (unint64_t *)&unk_26B2F8580);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v16 = v31;
      swift_unknownObjectRelease();
      if (!v31) {
        goto LABEL_40;
      }
      goto LABEL_29;
    }
    if (!v9) {
      break;
    }
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v15 = v14 | (v8 << 6);
LABEL_28:
    id v16 = *(id *)(*(void *)(a2 + 48) + 8 * v15);
    if (!v16) {
      goto LABEL_40;
    }
LABEL_29:
    objc_msgSend(v16, sel_extendedSceneIdentifier);
    uint64_t v20 = (void *)sub_259845940();
    if ((v30 & 0xC000000000000001) != 0)
    {
      if (sub_2598453C0())
      {
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v21 = v31;
        swift_unknownObjectRelease();
        goto LABEL_35;
      }
LABEL_38:

LABEL_39:
    }
    else
    {
      if (!*(void *)(v30 + 16)) {
        goto LABEL_38;
      }
      sub_25939D1A4();
      if ((v23 & 1) == 0) {
        goto LABEL_38;
      }
      id v21 = *(id *)(*(void *)(v30 + 56) + 8 * v22);
LABEL_35:

      if (!v21) {
        goto LABEL_39;
      }
      objc_msgSend(v16, sel_confidence);
      double v25 = v24;
      objc_msgSend(v21, sel_doubleValue);
      double v27 = v26;

      if (v27 <= v25) {
        goto LABEL_40;
      }
    }
  }
  int64_t v17 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v17 >= v28) {
      goto LABEL_40;
    }
    unint64_t v18 = *(void *)(v29 + 8 * v17);
    ++v8;
    if (!v18)
    {
      int64_t v8 = v13 + 2;
      if (v13 + 2 >= v28) {
        goto LABEL_40;
      }
      unint64_t v18 = *(void *)(v29 + 8 * v8);
      if (!v18)
      {
        int64_t v8 = v13 + 3;
        if (v13 + 3 >= v28) {
          goto LABEL_40;
        }
        unint64_t v18 = *(void *)(v29 + 8 * v8);
        if (!v18)
        {
          int64_t v8 = v13 + 4;
          if (v13 + 4 >= v28) {
            goto LABEL_40;
          }
          unint64_t v18 = *(void *)(v29 + 8 * v8);
          if (!v18)
          {
            int64_t v19 = v13 + 5;
            while (v19 < v28)
            {
              unint64_t v18 = *(void *)(v29 + 8 * v19++);
              if (v18)
              {
                int64_t v8 = v19 - 1;
                goto LABEL_27;
              }
            }
LABEL_40:
            sub_25940CF64();
            swift_bridgeObjectRelease();
            return;
          }
        }
      }
    }
LABEL_27:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v8 << 6);
    goto LABEL_28;
  }
  __break(1u);
}

BOOL sub_2598023B0()
{
  return *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_count) == *(void *)(v0
                                                                                + OBJC_IVAR___PNAssetFetcherLimiter_limit);
}

void sub_2598023D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_count);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_count) = v3;
  }
}

BOOL AssetFetcherTypeLimit.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

id AssetFetcherLimiter.__allocating_init(type:limit:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return AssetFetcherLimiter.init(type:limit:)(a1, a2);
}

BOOL sub_25980245C@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = AssetFetcherTypeLimit.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id AssetFetcherLimiter.init(type:limit:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR___PNAssetFetcherLimiter_type] = a1;
  *(void *)&v2[OBJC_IVAR___PNAssetFetcherLimiter_limit] = a2;
  *(void *)&v2[OBJC_IVAR___PNAssetFetcherLimiter_count] = 0;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t AssetFetcherLimiter.type.getter()
{
  return *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_type);
}

uint64_t AssetFetcherLimiter.limit.getter()
{
  return *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_limit);
}

id sub_259802598()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_type);
  if (!v1)
  {
    BOOL v2 = &unk_27073AA40;
LABEL_5:
    sub_25935633C(0, &qword_26A391FF8);
    return sub_259802634((uint64_t)v2, 4);
  }
  if (v1 == 1)
  {
    BOOL v2 = &unk_27073AA10;
    goto LABEL_5;
  }
  id result = (id)sub_2598457A0();
  __break(1u);
  return result;
}

id sub_259802634(uint64_t a1, uint64_t a2)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  char v4 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithSceneNames_thresholdType_, v4, a2);

  return v5;
}

id AssetFetcherLimiter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AssetFetcherLimiter.init()()
{
}

id AssetFetcherLimiter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t AssetFetcherLimiter.limitType.getter()
{
  unint64_t result = *(void *)(v0 + OBJC_IVAR___PNAssetFetcherLimiter_type);
  if (result >= 2)
  {
    unint64_t result = sub_2598457A0();
    __break(1u);
  }
  return result;
}

unint64_t sub_2598027E8()
{
  unint64_t result = qword_26A391FE8;
  if (!qword_26A391FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A391FE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetFetcherTypeLimit()
{
  return &type metadata for AssetFetcherTypeLimit;
}

uint64_t type metadata accessor for AssetFetcherLimiter()
{
  return self;
}

uint64_t method lookup function for AssetFetcherLimiter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AssetFetcherLimiter);
}

uint64_t dispatch thunk of AssetFetcherLimiter.__allocating_init(type:limit:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

__CFString *PNExternalAssetRelevanceProcessingVersionDescription(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 8) {
      objc_msgSend(NSString, "stringWithFormat:", @"Processed (v.%llu)", 8);
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"Need re-processing (v.%llu)", a1);
    }
    objc_super v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v2 = @"Not processed";
  }
  return v2;
}

void sub_259804268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_259804AC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PNUserDefaultPhotosAppFinishedLaunching()
{
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [MEMORY[0x263EFF910] date];
  [v1 setValue:v0 forKey:@"PNUserDefaultPhotosAppLastLaunchDateKey"];
}

void sub_25980A564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__303(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__304(uint64_t a1)
{
}

void sub_25980B7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

void sub_25980FDCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id getGDViewServiceClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getGDViewServiceClass_softClass;
  uint64_t v7 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getGDViewServiceClass_block_invoke;
    v3[3] = &unk_26544EEC0;
    v3[4] = &v4;
    __getGDViewServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_259812C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getGDAutonamingViewPhotosAutonamingViewName()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr;
  uint64_t v9 = getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr;
  if (!getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr)
  {
    id v1 = IntelligencePlatformLibrary();
    v7[3] = (uint64_t)dlsym(v1, "GDAutonamingViewPhotosAutonamingViewName");
    getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    objc_super v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"NSString *getGDAutonamingViewPhotosAutonamingViewName(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PNPersonSuggester.m", 37, @"%s", dlerror());

    __break(1u);
  }
}

void sub_259812DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_block_invoke(uint64_t a1)
{
  objc_super v2 = IntelligencePlatformLibrary();
  unint64_t result = dlsym(v2, "GDAutonamingViewPhotosAutonamingViewName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *IntelligencePlatformLibrary()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!IntelligencePlatformLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __IntelligencePlatformLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26544EDE8;
    uint64_t v6 = 0;
    IntelligencePlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)IntelligencePlatformLibraryCore_frameworkLibrary;
  if (!IntelligencePlatformLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *IntelligencePlatformLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PNPersonSuggester.m", 25, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __IntelligencePlatformLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntelligencePlatformLibraryCore_frameworkLibrary = result;
  return result;
}

void __getGDViewServiceClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("GDViewService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getGDViewServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_super v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getGDViewServiceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PNPersonSuggester.m", 29, @"Unable to find class %s", "GDViewService");

    __break(1u);
  }
}

void sub_259813330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__562(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__563(uint64_t a1)
{
}

uint64_t PNStandbyModeAvailable()
{
  return PLPhysicalDeviceIsIPad() ^ 1;
}

id getMADTextEmbeddingRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMADTextEmbeddingRequestClass_softClass;
  uint64_t v7 = getMADTextEmbeddingRequestClass_softClass;
  if (!getMADTextEmbeddingRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMADTextEmbeddingRequestClass_block_invoke;
    v3[3] = &unk_26544EEC0;
    v3[4] = &v4;
    __getMADTextEmbeddingRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25981B0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMADServiceClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMADServiceClass_softClass;
  uint64_t v7 = getMADServiceClass_softClass;
  if (!getMADServiceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMADServiceClass_block_invoke;
    v3[3] = &unk_26544EEC0;
    v3[4] = &v4;
    __getMADServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_25981B184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMADServiceClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_super v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMADServiceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PNTextEmbeddingService.m", 29, @"Unable to find class %s", "MADService");

    __break(1u);
  }
}

void MediaAnalysisServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __MediaAnalysisServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26544EEE0;
    uint64_t v5 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x263F08690] currentHandler];
    objc_super v2 = [NSString stringWithUTF8String:"void *MediaAnalysisServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PNTextEmbeddingService.m", 28, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getMADTextEmbeddingRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADTextEmbeddingRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADTextEmbeddingRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_super v2 = [MEMORY[0x263F08690] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getMADTextEmbeddingRequestClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PNTextEmbeddingService.m", 30, @"Unable to find class %s", "MADTextEmbeddingRequest");

    __break(1u);
  }
}

id +[PNSuggestionWallpaperUtilities _blockedImportedByBundleIdentifiers](id a1, SEL a2)
{
  objc_super v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.baidu.baidumobile", @"com.google.chrome.ios", @"com.douban.frodo", @"com.facebook.facebook", @"com.facebook.messenger", @"org.mozilla.ios.firefox", @"com.google.gmail", @"com.burbn.instagram", @"com.iwilab.kakaotalk", @"jp.naver.line", @"com.apple.mobilemail", @"com.microsoft.office.outlook", @"com.tencent.mqq", @"com.reddit.reddit", @"com.apple.mobilesafari", @"com.toyopagroup.picaboo", @"ph.telegra.telegraph",
                 @"com.zhiliaoapp.musically",
                 @"com.atebits.tweetie2",
                 @"com.viber",
                 @"com.vk.vkclient",
                 @"com.vk.vkhd",
                 @"com.tencent.xin",
                 @"com.sina.weibo",
                 @"net.whatsapp.whatsapp",
                 0);
  return v2;
}

void sub_259820670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1352(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1353(uint64_t a1)
{
}

void sub_2598214FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25982B0DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25982B148(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25982B1B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25982B220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25982F8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2593(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2594(uint64_t a1)
{
}

void sub_259830AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_259836330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259836524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259838514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2598386D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AnalysisProgressQueue()
{
  if (_AnalysisProgressQueue_onceToken != -1) {
    dispatch_once(&_AnalysisProgressQueue_onceToken, &__block_literal_global_3275);
  }
  uint64_t v0 = (void *)_AnalysisProgressQueue__serial_queue;
  return v0;
}

void sub_25983C5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3433(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3434(uint64_t a1)
{
}

void sub_25983C804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25983CA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25983CF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_25983D648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25983D824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2598421E0()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_2598421F0()
{
  return MEMORY[0x270EEDBE8]();
}

uint64_t sub_259842200()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_259842210()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_259842220()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_259842230()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_259842240()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_259842250()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_259842260()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_259842270()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_259842280()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_259842290()
{
  return MEMORY[0x270EEDE48]();
}

uint64_t sub_2598422A0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_2598422B0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_2598422C0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2598422D0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2598422E0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2598422F0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_259842300()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_259842310()
{
  return MEMORY[0x270EEE0C8]();
}

uint64_t sub_259842320()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_259842330()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_259842340()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_259842350()
{
  return MEMORY[0x270EEE1C8]();
}

uint64_t sub_259842360()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_259842370()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_259842380()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_259842390()
{
  return MEMORY[0x270EEE298]();
}

uint64_t sub_2598423A0()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_2598423B0()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_2598423C0()
{
  return MEMORY[0x270EEE300]();
}

uint64_t sub_2598423D0()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_2598423E0()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_2598423F0()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_259842400()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_259842410()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_259842420()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_259842430()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_259842440()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_259842450()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_259842460()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_259842470()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_259842480()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_259842490()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2598424A0()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_2598424B0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2598424C0()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_2598424D0()
{
  return MEMORY[0x270EEEEB0]();
}

uint64_t sub_2598424E0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2598424F0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_259842500()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_259842510()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_259842520()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_259842530()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_259842540()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_259842550()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_259842560()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_259842570()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_259842580()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_259842590()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2598425A0()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2598425B0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2598425C0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2598425D0()
{
  return MEMORY[0x270EEFCD0]();
}

uint64_t sub_2598425E0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2598425F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_259842600()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_259842610()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_259842620()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_259842630()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_259842640()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_259842650()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_259842660()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_259842670()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_259842680()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_259842690()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2598426A0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2598426B0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2598426C0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2598426D0()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_2598426E0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2598426F0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_259842700()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_259842710()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_259842720()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_259842730()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_259842740()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_259842750()
{
  return MEMORY[0x270EF07C0]();
}

uint64_t sub_259842760()
{
  return MEMORY[0x270EF07D0]();
}

uint64_t sub_259842770()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_259842780()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_259842790()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2598427A0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2598427B0()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_2598427C0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2598427D0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2598427E0()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_2598427F0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_259842800()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_259842810()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_259842820()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_259842830()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_259842840()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_259842850()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_259842860()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_259842870()
{
  return MEMORY[0x270EF0D40]();
}

uint64_t sub_259842880()
{
  return MEMORY[0x270EF0D58]();
}

uint64_t sub_259842890()
{
  return MEMORY[0x270EF0D60]();
}

uint64_t sub_2598428A0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2598428B0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2598428C0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_2598428D0()
{
  return MEMORY[0x270EF0DC8]();
}

uint64_t sub_2598428E0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_2598428F0()
{
  return MEMORY[0x270EF0DE0]();
}

uint64_t sub_259842900()
{
  return MEMORY[0x270EF0F58]();
}

uint64_t sub_259842910()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_259842920()
{
  return MEMORY[0x270EF0F88]();
}

uint64_t sub_259842940()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_259842950()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_259842960()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_259842970()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_259842980()
{
  return MEMORY[0x270EF1108]();
}

uint64_t sub_259842990()
{
  return MEMORY[0x270EF1118]();
}

uint64_t sub_2598429A0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_2598429B0()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_2598429C0()
{
  return MEMORY[0x270EF1290]();
}

uint64_t sub_2598429D0()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_2598429E0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2598429F0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_259842A00()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_259842A10()
{
  return MEMORY[0x270EF1458]();
}

uint64_t sub_259842A20()
{
  return MEMORY[0x270EF1460]();
}

uint64_t sub_259842A30()
{
  return MEMORY[0x270EF1478]();
}

uint64_t sub_259842A40()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_259842A50()
{
  return MEMORY[0x270EF14A0]();
}

uint64_t sub_259842A60()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_259842A70()
{
  return MEMORY[0x270EF14F0]();
}

uint64_t sub_259842A80()
{
  return MEMORY[0x270EF14F8]();
}

uint64_t sub_259842A90()
{
  return MEMORY[0x270EF1510]();
}

uint64_t sub_259842AA0()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_259842AB0()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_259842AC0()
{
  return MEMORY[0x270EF15A0]();
}

uint64_t sub_259842AD0()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_259842AE0()
{
  return MEMORY[0x270EF15B8]();
}

uint64_t sub_259842AF0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_259842B00()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_259842B10()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_259842B20()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_259842B30()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_259842B40()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_259842B50()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_259842B60()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_259842B70()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_259842B80()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_259842B90()
{
  return MEMORY[0x270F4B8F0]();
}

uint64_t sub_259842BA0()
{
  return MEMORY[0x270F4B8F8]();
}

uint64_t sub_259842BB0()
{
  return MEMORY[0x270F4B900]();
}

uint64_t sub_259842BC0()
{
  return MEMORY[0x270F4BA48]();
}

uint64_t sub_259842BD0()
{
  return MEMORY[0x270F4BA70]();
}

uint64_t sub_259842BE0()
{
  return MEMORY[0x270F4BA80]();
}

uint64_t sub_259842BF0()
{
  return MEMORY[0x270F4BA88]();
}

uint64_t sub_259842C00()
{
  return MEMORY[0x270F4BA90]();
}

uint64_t sub_259842C10()
{
  return MEMORY[0x270F4BAD0]();
}

uint64_t sub_259842C20()
{
  return MEMORY[0x270F4BB18]();
}

uint64_t sub_259842C30()
{
  return MEMORY[0x270F4BB20]();
}

uint64_t sub_259842C40()
{
  return MEMORY[0x270F4BB28]();
}

uint64_t sub_259842C50()
{
  return MEMORY[0x270F4BB30]();
}

uint64_t sub_259842C60()
{
  return MEMORY[0x270F4BCD8]();
}

uint64_t sub_259842C70()
{
  return MEMORY[0x270F4BFC0]();
}

uint64_t sub_259842C80()
{
  return MEMORY[0x270F4BFE0]();
}

uint64_t sub_259842C90()
{
  return MEMORY[0x270F4C160]();
}

uint64_t sub_259842CA0()
{
  return MEMORY[0x270FA12A8]();
}

uint64_t sub_259842CB0()
{
  return MEMORY[0x270FA12B0]();
}

uint64_t sub_259842CC0()
{
  return MEMORY[0x270FA12B8]();
}

uint64_t sub_259842CD0()
{
  return MEMORY[0x270FA12D0]();
}

uint64_t sub_259842CE0()
{
  return MEMORY[0x270FA12D8]();
}

uint64_t sub_259842CF0()
{
  return MEMORY[0x270FA1310]();
}

uint64_t sub_259842D00()
{
  return MEMORY[0x270FA1328]();
}

uint64_t sub_259842D20()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_259842D30()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_259842D50()
{
  return MEMORY[0x270F2F820]();
}

uint64_t sub_259842D60()
{
  return MEMORY[0x270F7EBF0]();
}

uint64_t sub_259842D70()
{
  return MEMORY[0x270F7EC08]();
}

uint64_t sub_259842D80()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_259842D90()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_259842DA0()
{
  return MEMORY[0x270F7EE48]();
}

uint64_t sub_259842DB0()
{
  return MEMORY[0x270F7EE50]();
}

uint64_t sub_259842DC0()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_259842DD0()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_259842DE0()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_259842DF0()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_259842E00()
{
  return MEMORY[0x270F7EF00]();
}

uint64_t sub_259842E10()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_259842E20()
{
  return MEMORY[0x270F7F368]();
}

uint64_t sub_259842E30()
{
  return MEMORY[0x270F7F5E0]();
}

uint64_t sub_259842E40()
{
  return MEMORY[0x270F7F5E8]();
}

uint64_t sub_259842E70()
{
  return MEMORY[0x270F2F840]();
}

uint64_t sub_259842E80()
{
  return MEMORY[0x270F2F848]();
}

uint64_t sub_259842E90()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_259842EA0()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_259842EB0()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_259842EC0()
{
  return MEMORY[0x270F2F8C8]();
}

uint64_t sub_259842ED0()
{
  return MEMORY[0x270F2F900]();
}

uint64_t sub_259842EE0()
{
  return MEMORY[0x270F2F910]();
}

uint64_t sub_259842EF0()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_259842F00()
{
  return MEMORY[0x270F2F960]();
}

uint64_t sub_259842F10()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_259842F20()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_259842F30()
{
  return MEMORY[0x270F2F9C0]();
}

uint64_t sub_259842F40()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_259842F50()
{
  return MEMORY[0x270F2FA90]();
}

uint64_t sub_259842F60()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_259842F70()
{
  return MEMORY[0x270F2FCB0]();
}

uint64_t sub_259842F80()
{
  return MEMORY[0x270F2FCB8]();
}

uint64_t sub_259842F90()
{
  return MEMORY[0x270F2FCD0]();
}

uint64_t sub_259842FA0()
{
  return MEMORY[0x270F2FCD8]();
}

uint64_t sub_259842FB0()
{
  return MEMORY[0x270F2FCE8]();
}

uint64_t sub_259842FC0()
{
  return MEMORY[0x270F2FCF0]();
}

uint64_t sub_259842FD0()
{
  return MEMORY[0x270F2FCF8]();
}

uint64_t sub_259842FE0()
{
  return MEMORY[0x270F2FD00]();
}

uint64_t sub_259842FF0()
{
  return MEMORY[0x270F2FB58]();
}

uint64_t sub_259843010()
{
  return MEMORY[0x270F2FB68]();
}

uint64_t sub_259843020()
{
  return MEMORY[0x270F2FB70]();
}

uint64_t sub_259843030()
{
  return MEMORY[0x270F2FD08]();
}

uint64_t sub_259843040()
{
  return MEMORY[0x270F2FD10]();
}

uint64_t sub_259843060()
{
  return MEMORY[0x270F2FB88]();
}

uint64_t sub_259843070()
{
  return MEMORY[0x270F2FD18]();
}

uint64_t sub_259843080()
{
  return MEMORY[0x270F2FD20]();
}

uint64_t sub_259843090()
{
  return MEMORY[0x270F2FD28]();
}

uint64_t sub_2598430A0()
{
  return MEMORY[0x270F2FD38]();
}

uint64_t sub_2598430B0()
{
  return MEMORY[0x270F2FD40]();
}

uint64_t sub_2598430C0()
{
  return MEMORY[0x270F2FD48]();
}

uint64_t sub_2598430D0()
{
  return MEMORY[0x270F2FD50]();
}

uint64_t sub_2598430E0()
{
  return MEMORY[0x270F2FD58]();
}

uint64_t sub_2598430F0()
{
  return MEMORY[0x270F2FD60]();
}

uint64_t sub_259843100()
{
  return MEMORY[0x270F2FD68]();
}

uint64_t sub_259843110()
{
  return MEMORY[0x270F2FD70]();
}

uint64_t sub_259843120()
{
  return MEMORY[0x270F7F2C0]();
}

uint64_t sub_259843130()
{
  return MEMORY[0x270F2FD88]();
}

uint64_t sub_259843140()
{
  return MEMORY[0x270F2FD98]();
}

uint64_t sub_259843150()
{
  return MEMORY[0x270F2FDA0]();
}

uint64_t sub_259843160()
{
  return MEMORY[0x270F2FB90]();
}

uint64_t sub_259843170()
{
  return MEMORY[0x270F2FB98]();
}

uint64_t sub_259843180()
{
  return MEMORY[0x270F2FDA8]();
}

uint64_t sub_259843190()
{
  return MEMORY[0x270F2FDB0]();
}

uint64_t sub_2598431B0()
{
  return MEMORY[0x270F2FDC0]();
}

uint64_t sub_2598431C0()
{
  return MEMORY[0x270F2FDC8]();
}

uint64_t sub_2598431D0()
{
  return MEMORY[0x270F2FDD8]();
}

uint64_t sub_2598431E0()
{
  return MEMORY[0x270F7F2D0]();
}

uint64_t sub_2598431F0()
{
  return MEMORY[0x270F7F2D8]();
}

uint64_t sub_259843200()
{
  return MEMORY[0x270F7F2E0]();
}

uint64_t sub_259843210()
{
  return MEMORY[0x270F7F2F0]();
}

uint64_t sub_259843220()
{
  return MEMORY[0x270F4C8B8]();
}

uint64_t sub_259843230()
{
  return MEMORY[0x270F4C9D0]();
}

uint64_t sub_259843240()
{
  return MEMORY[0x270F4C9E0]();
}

uint64_t sub_259843250()
{
  return MEMORY[0x270F4CE28]();
}

uint64_t sub_259843260()
{
  return MEMORY[0x270F4CE30]();
}

uint64_t sub_259843270()
{
  return MEMORY[0x270F4CE38]();
}

uint64_t sub_259843290()
{
  return MEMORY[0x270F4CE58]();
}

uint64_t sub_2598432A0()
{
  return MEMORY[0x270F4CE60]();
}

uint64_t sub_2598432B0()
{
  return MEMORY[0x270F4CEC8]();
}

uint64_t sub_2598432C0()
{
  return MEMORY[0x270FA2990]();
}

uint64_t sub_2598432D0()
{
  return MEMORY[0x270FA29D0]();
}

uint64_t sub_2598432E0()
{
  return MEMORY[0x270FA29F8]();
}

uint64_t sub_2598432F0()
{
  return MEMORY[0x270FA2A10]();
}

uint64_t sub_259843300()
{
  return MEMORY[0x270FA2A18]();
}

uint64_t sub_259843310()
{
  return MEMORY[0x270FA2A28]();
}

uint64_t sub_259843320()
{
  return MEMORY[0x270FA1350]();
}

uint64_t sub_259843330()
{
  return MEMORY[0x270FA1360]();
}

uint64_t sub_259843340()
{
  return MEMORY[0x270FA2A60]();
}

uint64_t sub_259843360()
{
  return MEMORY[0x270FA1390]();
}

uint64_t sub_259843370()
{
  return MEMORY[0x270FA2A70]();
}

uint64_t sub_259843380()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_259843390()
{
  return MEMORY[0x270FA2AB8]();
}

uint64_t sub_2598433A0()
{
  return MEMORY[0x270F2EE10]();
}

uint64_t sub_2598433B0()
{
  return MEMORY[0x270F2EE18]();
}

uint64_t sub_2598433C0()
{
  return MEMORY[0x270F2EE20]();
}

uint64_t sub_2598433D0()
{
  return MEMORY[0x270F2EE30]();
}

uint64_t sub_2598433E0()
{
  return MEMORY[0x270F2EE48]();
}

uint64_t sub_2598433F0()
{
  return MEMORY[0x270F2EE60]();
}

uint64_t sub_259843480()
{
  return MEMORY[0x270F843B0]();
}

uint64_t sub_259843490()
{
  return MEMORY[0x270F843C8]();
}

uint64_t sub_2598434A0()
{
  return MEMORY[0x270F843D0]();
}

uint64_t sub_2598434B0()
{
  return MEMORY[0x270F843D8]();
}

uint64_t sub_2598434C0()
{
  return MEMORY[0x270F843E0]();
}

uint64_t sub_2598434D0()
{
  return MEMORY[0x270F843E8]();
}

uint64_t sub_2598434E0()
{
  return MEMORY[0x270F843F0]();
}

uint64_t sub_2598434F0()
{
  return MEMORY[0x270F84418]();
}

uint64_t sub_259843500()
{
  return MEMORY[0x270F84428]();
}

uint64_t sub_259843510()
{
  return MEMORY[0x270F84448]();
}

uint64_t sub_259843520()
{
  return MEMORY[0x270F84458]();
}

uint64_t sub_259843530()
{
  return MEMORY[0x270F53BF8]();
}

uint64_t sub_259843540()
{
  return MEMORY[0x270F53C00]();
}

uint64_t sub_259843550()
{
  return MEMORY[0x270F53C08]();
}

uint64_t sub_259843560()
{
  return MEMORY[0x270F53C10]();
}

uint64_t sub_259843570()
{
  return MEMORY[0x270F53C18]();
}

uint64_t sub_259843580()
{
  return MEMORY[0x270F53C20]();
}

uint64_t sub_259843590()
{
  return MEMORY[0x270F53C28]();
}

uint64_t sub_2598435A0()
{
  return MEMORY[0x270F53C30]();
}

uint64_t sub_2598435B0()
{
  return MEMORY[0x270F53C38]();
}

uint64_t sub_2598435C0()
{
  return MEMORY[0x270F53C40]();
}

uint64_t sub_2598435D0()
{
  return MEMORY[0x270F53C48]();
}

uint64_t sub_2598435E0()
{
  return MEMORY[0x270F53C50]();
}

uint64_t sub_2598435F0()
{
  return MEMORY[0x270F53C58]();
}

uint64_t sub_259843600()
{
  return MEMORY[0x270F53C60]();
}

uint64_t sub_259843610()
{
  return MEMORY[0x270F53C68]();
}

uint64_t sub_259843620()
{
  return MEMORY[0x270F53C70]();
}

uint64_t sub_259843630()
{
  return MEMORY[0x270F53C78]();
}

uint64_t sub_259843640()
{
  return MEMORY[0x270F53C80]();
}

uint64_t sub_259843650()
{
  return MEMORY[0x270F53C88]();
}

uint64_t sub_259843660()
{
  return MEMORY[0x270F2FEE0]();
}

uint64_t sub_259843670()
{
  return MEMORY[0x270F2FEF8]();
}

uint64_t sub_259843680()
{
  return MEMORY[0x270F2EF28]();
}

uint64_t sub_259843690()
{
  return MEMORY[0x270F2EF30]();
}

uint64_t sub_2598436A0()
{
  return MEMORY[0x270F2EF38]();
}

uint64_t sub_2598436B0()
{
  return MEMORY[0x270F2EF40]();
}

uint64_t sub_2598436C0()
{
  return MEMORY[0x270F2EF58]();
}

uint64_t sub_2598436D0()
{
  return MEMORY[0x270F2EF60]();
}

uint64_t sub_2598436E0()
{
  return MEMORY[0x270F2EF70]();
}

uint64_t sub_2598436F0()
{
  return MEMORY[0x270F2EF78]();
}

uint64_t sub_259843700()
{
  return MEMORY[0x270F2EF80]();
}

uint64_t sub_259843710()
{
  return MEMORY[0x270F2EFA0]();
}

uint64_t sub_259843720()
{
  return MEMORY[0x270F2EFA8]();
}

uint64_t sub_259843730()
{
  return MEMORY[0x270F2EFB0]();
}

uint64_t sub_259843740()
{
  return MEMORY[0x270F2EFB8]();
}

uint64_t sub_259843750()
{
  return MEMORY[0x270F2EFF0]();
}

uint64_t sub_259843760()
{
  return MEMORY[0x270F2F018]();
}

uint64_t sub_259843770()
{
  return MEMORY[0x270F2F020]();
}

uint64_t sub_259843780()
{
  return MEMORY[0x270F2F038]();
}

uint64_t sub_259843790()
{
  return MEMORY[0x270F2F058]();
}

uint64_t sub_2598437A0()
{
  return MEMORY[0x270F2F060]();
}

uint64_t sub_2598437B0()
{
  return MEMORY[0x270F2F078]();
}

uint64_t sub_2598437C0()
{
  return MEMORY[0x270F2F080]();
}

uint64_t sub_2598437D0()
{
  return MEMORY[0x270F2F088]();
}

uint64_t sub_2598437E0()
{
  return MEMORY[0x270F2F0D0]();
}

uint64_t sub_2598437F0()
{
  return MEMORY[0x270F2F0D8]();
}

uint64_t sub_259843800()
{
  return MEMORY[0x270F2F0E0]();
}

uint64_t sub_259843810()
{
  return MEMORY[0x270F2F0F0]();
}

uint64_t sub_259843820()
{
  return MEMORY[0x270F2F0F8]();
}

uint64_t sub_259843830()
{
  return MEMORY[0x270F2F100]();
}

uint64_t sub_259843840()
{
  return MEMORY[0x270F2F108]();
}

uint64_t sub_259843850()
{
  return MEMORY[0x270F2F130]();
}

uint64_t sub_259843860()
{
  return MEMORY[0x270F2F138]();
}

uint64_t sub_259843870()
{
  return MEMORY[0x270F2F140]();
}

uint64_t sub_259843880()
{
  return MEMORY[0x270F2F148]();
}

uint64_t sub_259843890()
{
  return MEMORY[0x270F2F150]();
}

uint64_t sub_2598438A0()
{
  return MEMORY[0x270F2F1F0]();
}

uint64_t sub_2598438B0()
{
  return MEMORY[0x270F2F200]();
}

uint64_t sub_2598438F0()
{
  return MEMORY[0x270F2F2D0]();
}

uint64_t sub_259843900()
{
  return MEMORY[0x270F2F2E0]();
}

uint64_t sub_259843910()
{
  return MEMORY[0x270F2F410]();
}

uint64_t sub_259843920()
{
  return MEMORY[0x270F2F440]();
}

uint64_t sub_259843930()
{
  return MEMORY[0x270F2F448]();
}

uint64_t sub_259843940()
{
  return MEMORY[0x270F2F450]();
}

uint64_t sub_259843950()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_259843960()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_259843970()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_259843980()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_259843990()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_2598439A0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2598439B0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2598439C0()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_2598439D0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_2598439E0()
{
  return MEMORY[0x270FA2D68]();
}

uint64_t sub_2598439F0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_259843A00()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_259843A10()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_259843A20()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_259843A30()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_259843A40()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_259843A50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259843A60()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259843A70()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_259843A80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259843A90()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_259843AA0()
{
  return MEMORY[0x270FA08B8]();
}

uint64_t sub_259843AB0()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_259843AC0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_259843AD0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_259843AE0()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_259843AF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_259843B00()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_259843B10()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_259843B20()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_259843B30()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_259843B40()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_259843B50()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_259843B60()
{
  return MEMORY[0x270F4D3B0]();
}

uint64_t sub_259843B70()
{
  return MEMORY[0x270F4D3B8]();
}

uint64_t sub_259843B80()
{
  return MEMORY[0x270F4D3C0]();
}

uint64_t sub_259843B90()
{
  return MEMORY[0x270F4D3C8]();
}

uint64_t sub_259843BB0()
{
  return MEMORY[0x270EF6520]();
}

uint64_t sub_259843BC0()
{
  return MEMORY[0x270EF6528]();
}

uint64_t sub_259843BD0()
{
  return MEMORY[0x270EF6530]();
}

uint64_t sub_259843BE0()
{
  return MEMORY[0x270EF6920]();
}

uint64_t sub_259843BF0()
{
  return MEMORY[0x270EF6AD0]();
}

uint64_t sub_259843C00()
{
  return MEMORY[0x270EF6AD8]();
}

uint64_t sub_259843C10()
{
  return MEMORY[0x270EF6BB0]();
}

uint64_t sub_259843C20()
{
  return MEMORY[0x270EF6BC0]();
}

uint64_t sub_259843C30()
{
  return MEMORY[0x270EF6BF0]();
}

uint64_t sub_259843C40()
{
  return MEMORY[0x270EF6C10]();
}

uint64_t sub_259843C50()
{
  return MEMORY[0x270EF6C18]();
}

uint64_t sub_259843C60()
{
  return MEMORY[0x270EF6C20]();
}

uint64_t sub_259843C70()
{
  return MEMORY[0x270EF6C58]();
}

uint64_t sub_259843C80()
{
  return MEMORY[0x270F58050]();
}

uint64_t sub_259843C90()
{
  return MEMORY[0x270F58060]();
}

uint64_t sub_259843CA0()
{
  return MEMORY[0x270F580E0]();
}

uint64_t sub_259843CB0()
{
  return MEMORY[0x270F580E8]();
}

uint64_t sub_259843CC0()
{
  return MEMORY[0x270F580F0]();
}

uint64_t sub_259843CD0()
{
  return MEMORY[0x270F58100]();
}

uint64_t sub_259843CE0()
{
  return MEMORY[0x270F58108]();
}

uint64_t sub_259843CF0()
{
  return MEMORY[0x270F58128]();
}

uint64_t sub_259843D00()
{
  return MEMORY[0x270F58130]();
}

uint64_t sub_259843D10()
{
  return MEMORY[0x270F58138]();
}

uint64_t sub_259843D20()
{
  return MEMORY[0x270F581D8]();
}

uint64_t sub_259843D30()
{
  return MEMORY[0x270F581E8]();
}

uint64_t sub_259843D40()
{
  return MEMORY[0x270F581F0]();
}

uint64_t sub_259843D50()
{
  return MEMORY[0x270F581F8]();
}

uint64_t sub_259843D60()
{
  return MEMORY[0x270F58200]();
}

uint64_t sub_259843D70()
{
  return MEMORY[0x270F582A0]();
}

uint64_t sub_259843D80()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_259843DB0()
{
  return MEMORY[0x270F2FBC0]();
}

uint64_t sub_259843DC0()
{
  return MEMORY[0x270F2FBC8]();
}

uint64_t sub_259843DD0()
{
  return MEMORY[0x270F7F328]();
}

uint64_t sub_259843DE0()
{
  return MEMORY[0x270F2EF00]();
}

uint64_t sub_259843DF0()
{
  return MEMORY[0x270F583D0]();
}

uint64_t sub_259843E00()
{
  return MEMORY[0x270F58408]();
}

uint64_t sub_259843E10()
{
  return MEMORY[0x270F58410]();
}

uint64_t sub_259843E20()
{
  return MEMORY[0x270F58420]();
}

uint64_t sub_259843E30()
{
  return MEMORY[0x270F58430]();
}

uint64_t sub_259843E40()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_259843E50()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_259843E60()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_259843E70()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_259843E80()
{
  return MEMORY[0x270F9D018]();
}

uint64_t sub_259843E90()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_259843EA0()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_259843EB0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_259843EC0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_259843ED0()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_259843EE0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_259843EF0()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_259843F00()
{
  return MEMORY[0x270F9D0F0]();
}

uint64_t sub_259843F10()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_259843F20()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_259843F30()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_259843F40()
{
  return MEMORY[0x270F9D160]();
}

uint64_t sub_259843F50()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_259843F60()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_259843F70()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_259843F80()
{
  return MEMORY[0x270F9D300]();
}

uint64_t sub_259843F90()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_259843FA0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_259843FB0()
{
  return MEMORY[0x270F9D358]();
}

uint64_t sub_259843FC0()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_259843FD0()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_259843FE0()
{
  return MEMORY[0x270FA2B60]();
}

uint64_t sub_259843FF0()
{
  return MEMORY[0x270FA2B68]();
}

uint64_t sub_259844000()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_259844010()
{
  return MEMORY[0x270F9D458]();
}

uint64_t sub_259844020()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_259844030()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_259844040()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_259844050()
{
  return MEMORY[0x270F9D518]();
}

uint64_t sub_259844060()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_259844070()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_259844080()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_259844090()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2598440A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2598440B0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2598440C0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2598440D0()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t sub_2598440E0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2598440F0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_259844100()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t sub_259844110()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_259844120()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_259844130()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_259844140()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_259844150()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_259844160()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_259844170()
{
  return MEMORY[0x270F9D650]();
}

uint64_t sub_259844180()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_259844190()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_2598441A0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2598441B0()
{
  return MEMORY[0x270F2F540]();
}

uint64_t sub_2598441C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2598441D0()
{
  return MEMORY[0x270F9D718]();
}

uint64_t sub_2598441E0()
{
  return MEMORY[0x270F9D738]();
}

uint64_t sub_2598441F0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_259844200()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_259844210()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_259844220()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_259844230()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_259844240()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259844260()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_259844270()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259844280()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_259844290()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2598442A0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2598442B0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2598442C0()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_2598442D0()
{
  return MEMORY[0x270F9D858]();
}

uint64_t sub_2598442E0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2598442F0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_259844300()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_259844310()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_259844320()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_259844330()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_259844350()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_259844360()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_259844370()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_259844380()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_259844390()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_2598443A0()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_2598443B0()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_2598443C0()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_2598443D0()
{
  return MEMORY[0x270F9D9E8]();
}

uint64_t sub_2598443E0()
{
  return MEMORY[0x270F9DA00]();
}

uint64_t sub_2598443F0()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_259844400()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_259844410()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_259844420()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_259844430()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_259844440()
{
  return MEMORY[0x270F9DAB0]();
}

uint64_t sub_259844450()
{
  return MEMORY[0x270F9DAD0]();
}

uint64_t sub_259844460()
{
  return MEMORY[0x270F9DAE0]();
}

uint64_t sub_259844470()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_259844480()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_259844490()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_2598444A0()
{
  return MEMORY[0x270F9DB30]();
}

uint64_t sub_2598444B0()
{
  return MEMORY[0x270F9DB50]();
}

uint64_t sub_2598444C0()
{
  return MEMORY[0x270F9DB60]();
}

uint64_t sub_2598444D0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2598444E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2598444F0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_259844500()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_259844510()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_259844520()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_259844530()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_259844540()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_259844550()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_259844560()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_259844570()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_259844580()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259844590()
{
  return MEMORY[0x270F2F548]();
}

uint64_t sub_2598445A0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_2598445B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2598445C0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2598445D0()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_2598445E0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_2598445F0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_259844600()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_259844610()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_259844620()
{
  return MEMORY[0x270F9DCD0]();
}

uint64_t sub_259844630()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_259844640()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_259844650()
{
  return MEMORY[0x270F9DD10]();
}

uint64_t sub_259844660()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_259844670()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_259844680()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_259844690()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2598446A0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2598446B0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2598446C0()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_259844700()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_259844710()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_259844720()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_259844730()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_259844740()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_259844750()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_259844760()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_259844770()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2598447A0()
{
  return MEMORY[0x270FA1F80]();
}

uint64_t sub_2598447B0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_2598447D0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2598447F0()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_259844810()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_259844820()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_259844840()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_259844850()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_259844860()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_259844890()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_2598448A0()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_2598448B0()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_2598448C0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2598448D0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_2598448E0()
{
  return MEMORY[0x270F9DD70]();
}

uint64_t sub_2598448F0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_259844900()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_259844910()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_259844920()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_259844930()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_259844940()
{
  return MEMORY[0x270F9DEE0]();
}

uint64_t sub_259844950()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_259844960()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_259844970()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_259844980()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_259844990()
{
  return MEMORY[0x270F9DFB8]();
}

uint64_t sub_2598449A0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_2598449B0()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_2598449C0()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_2598449D0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2598449E0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2598449F0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_259844A00()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_259844A10()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_259844A20()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_259844A40()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_259844A50()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_259844A60()
{
  return MEMORY[0x270FA2BE0]();
}

uint64_t sub_259844A70()
{
  return MEMORY[0x270F9E240]();
}

uint64_t sub_259844A80()
{
  return MEMORY[0x270FA0798]();
}

uint64_t sub_259844A90()
{
  return MEMORY[0x270FA10C8]();
}

uint64_t sub_259844AA0()
{
  return MEMORY[0x270FA10D8]();
}

uint64_t sub_259844AB0()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_259844AC0()
{
  return MEMORY[0x270EE5828]();
}

uint64_t sub_259844AD0()
{
  return MEMORY[0x270EE5860]();
}

uint64_t sub_259844AE0()
{
  return MEMORY[0x270EE5878]();
}

uint64_t sub_259844AF0()
{
  return MEMORY[0x270EE5888]();
}

uint64_t sub_259844B00()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t sub_259844B20()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_259844B30()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_259844B40()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_259844B50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_259844B60()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_259844B70()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_259844B80()
{
  return MEMORY[0x270EFA298]();
}

uint64_t sub_259844B90()
{
  return MEMORY[0x270EFA2A0]();
}

uint64_t sub_259844BA0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_259844BB0()
{
  return MEMORY[0x270EF1F70]();
}

uint64_t sub_259844BC0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_259844BD0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_259844BE0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_259844BF0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_259844C00()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_259844C10()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_259844C20()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_259844C30()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_259844C40()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_259844C50()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_259844C60()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_259844C70()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_259844C80()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_259844C90()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_259844CA0()
{
  return MEMORY[0x270EF2060]();
}

uint64_t sub_259844CB0()
{
  return MEMORY[0x270FA0888]();
}

uint64_t sub_259844CC0()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_259844CD0()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_259844CE0()
{
  return MEMORY[0x270FA1108]();
}

uint64_t sub_259844CF0()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_259844D00()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_259844D10()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_259844D20()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_259844D30()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_259844D40()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_259844D50()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_259844D60()
{
  return MEMORY[0x270EFA2B0]();
}

uint64_t sub_259844D70()
{
  return MEMORY[0x270EF21E8]();
}

uint64_t sub_259844D80()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_259844D90()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_259844DA0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_259844DB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_259844DC0()
{
  return MEMORY[0x270EF23B0]();
}

uint64_t sub_259844DD0()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t sub_259844DE0()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_259844DF0()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_259844E00()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_259844E10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_259844E20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_259844E30()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_259844E40()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_259844E50()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_259844E60()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_259844E70()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_259844E80()
{
  return MEMORY[0x270EF2550]();
}

uint64_t sub_259844E90()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_259844EA0()
{
  return MEMORY[0x270EF2578]();
}

uint64_t sub_259844EB0()
{
  return MEMORY[0x270EF2598]();
}

uint64_t sub_259844EC0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_259844ED0()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_259844EE0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_259844EF0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_259844F00()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_259844F20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_259844F30()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_259844F40()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_259844F50()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_259844F60()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_259844F70()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_259844F80()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_259844F90()
{
  return MEMORY[0x270F9E828]();
}

uint64_t sub_259844FA0()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_259844FB0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_259844FC0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_259844FD0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_259844FE0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_259844FF0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_259845010()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_259845020()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_259845030()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_259845040()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_259845050()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_259845060()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_259845070()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_259845080()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_259845090()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2598450A0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2598450B0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2598450C0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_2598450D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2598450E0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_259845100()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_259845110()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_259845120()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_259845130()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_259845140()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_259845150()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_259845160()
{
  return MEMORY[0x270F9E9F0]();
}

uint64_t sub_259845170()
{
  return MEMORY[0x270F9E9F8]();
}

uint64_t sub_259845180()
{
  return MEMORY[0x270F9EA00]();
}

uint64_t sub_259845190()
{
  return MEMORY[0x270F9EA08]();
}

uint64_t sub_2598451A0()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2598451B0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2598451C0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2598451D0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2598451E0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2598451F0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_259845200()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_259845210()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_259845230()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_259845240()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_259845250()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_259845260()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_259845270()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_259845280()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_259845290()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2598452A0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2598452B0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2598452C0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2598452D0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2598452E0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2598452F0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_259845300()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_259845310()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_259845320()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_259845330()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_259845340()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_259845350()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_259845360()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_259845370()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_259845380()
{
  return MEMORY[0x270F9EF28]();
}

uint64_t sub_259845390()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_2598453A0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2598453B0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_2598453C0()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_2598453D0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2598453E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2598453F0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_259845400()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_259845410()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_259845420()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_259845430()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_259845440()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_259845450()
{
  return MEMORY[0x270F9F078]();
}

uint64_t sub_259845460()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_259845470()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_259845480()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_259845490()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2598454A0()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2598454B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2598454C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2598454E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_259845500()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_259845510()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_259845520()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_259845530()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_259845540()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_259845550()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_259845560()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_259845570()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_259845580()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_259845590()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2598455A0()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_2598455B0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2598455C0()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_2598455D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2598455E0()
{
  return MEMORY[0x270F9F328]();
}

uint64_t sub_2598455F0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_259845600()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_259845610()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_259845620()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_259845630()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_259845640()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_259845650()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_259845660()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_259845670()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_259845680()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_259845690()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2598456A0()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_2598456B0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2598456C0()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_2598456D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2598456E0()
{
  return MEMORY[0x270F9F468]();
}

uint64_t sub_2598456F0()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_259845700()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_259845710()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_259845720()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_259845730()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_259845740()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_259845750()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259845770()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_259845780()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2598457A0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2598457B0()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t sub_2598457C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2598457D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2598457E0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_259845820()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_259845830()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_259845840()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_259845850()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_259845860()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_259845870()
{
  return MEMORY[0x270EF2690]();
}

uint64_t sub_259845880()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_259845890()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2598458A0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2598458B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2598458C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2598458D0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2598458E0()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_2598458F0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_259845900()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_259845910()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_259845920()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_259845930()
{
  return MEMORY[0x270EF2790]();
}

uint64_t sub_259845940()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_259845950()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_259845960()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_259845970()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_259845980()
{
  return MEMORY[0x270F9FDF0]();
}

uint64_t sub_259845990()
{
  return MEMORY[0x270F9FEA0]();
}

uint64_t sub_2598459A0()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_2598459B0()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t sub_2598459C0()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_2598459F0()
{
  return MEMORY[0x270FA0128]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x270F18C68]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x270EE7458]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

uint64_t DCIM_NSValueToCGRect()
{
  return MEMORY[0x270F537C0]();
}

uint64_t LXCreateWordModerationLexicon()
{
  return MEMORY[0x270F46E70]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x270F46EF8]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x270F46F70]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceSupportsGenerativeModelSystems()
{
  return MEMORY[0x270F96120]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A20](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A28](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PFDeviceScreenSize()
{
  return MEMORY[0x270F53AB0]();
}

uint64_t PFMutableArrayShuffleWithRandomNumberGenerator()
{
  return MEMORY[0x270F53AD8]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x270F53688]();
}

uint64_t PFSceneTaxonomyNodeLocalizedLabel()
{
  return MEMORY[0x270F53B30]();
}

uint64_t PFSceneTaxonomyNodeLocalizedSynonyms()
{
  return MEMORY[0x270F53B38]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x270F53B40]();
}

uint64_t PFSceneTaxonomyNodeNetworkId()
{
  return MEMORY[0x270F53B48]();
}

uint64_t PFSceneTaxonomyNodeSearchThreshold()
{
  return MEMORY[0x270F53B50]();
}

uint64_t PFSceneTaxonomyNodeTraverseChildren()
{
  return MEMORY[0x270F53B58]();
}

uint64_t PFSceneTaxonomyNodeTraverseParents()
{
  return MEMORY[0x270F53B60]();
}

uint64_t PFSceneTaxonomyNodeVisitChildren()
{
  return MEMORY[0x270F53B68]();
}

uint64_t PFSceneTaxonomyNodeVisitParents()
{
  return MEMORY[0x270F53B70]();
}

uint64_t PFShuffledArrayWithRandomNumberGenerator()
{
  return MEMORY[0x270F53B80]();
}

uint64_t PFStoryColorGradeCategoryFromValenceArousal()
{
  return MEMORY[0x270F53B88]();
}

uint64_t PFStoryTitleCategoryGenerateWithWrappedIndex()
{
  return MEMORY[0x270F53B90]();
}

uint64_t PFStringVersionOfRunTimeLibrary()
{
  return MEMORY[0x270F536B8]();
}

uint64_t PHDescriptionForPhotosHighlightKind()
{
  return MEMORY[0x270EFA2B8]();
}

uint64_t PHDescriptionForPhotosHighlightType()
{
  return MEMORY[0x270EFA2C0]();
}

uint64_t PHDetectionTypeDescription()
{
  return MEMORY[0x270EFA2C8]();
}

uint64_t PHMemoryCurationLengthForString()
{
  return MEMORY[0x270EFA2D8]();
}

uint64_t PHMemoryMoodForString()
{
  return MEMORY[0x270EFA2E0]();
}

uint64_t PHPersonTypeDescription()
{
  return MEMORY[0x270EFA2E8]();
}

uint64_t PHPersonVerifiedTypeDescription()
{
  return MEMORY[0x270EFA2F0]();
}

uint64_t PHSocialGroupVerifiedTypeDescription()
{
  return MEMORY[0x270EFA2F8]();
}

uint64_t PHStringForMemoryCurationLength()
{
  return MEMORY[0x270EFA300]();
}

uint64_t PHStringForMemoryMood()
{
  return MEMORY[0x270EFA308]();
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x270EFA310]();
}

uint64_t PLAmbientPhotoFrameGetLog()
{
  return MEMORY[0x270F537D0]();
}

uint64_t PLDebugStringForAmbiguityType()
{
  return MEMORY[0x270EFA320]();
}

uint64_t PLDebugStringForSearchIndexCategory()
{
  return MEMORY[0x270F53738]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x270F53840]();
}

uint64_t PLMemoriesGetLog()
{
  return MEMORY[0x270F53858]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x270F53870]();
}

uint64_t PLPhysicalDeviceIsIPad()
{
  return MEMORY[0x270F53890]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x270F538D0]();
}

uint64_t PLStringForSearchEntityCategoryType()
{
  return MEMORY[0x270EFA328]();
}

uint64_t PLWallpaperGetLog()
{
  return MEMORY[0x270F538E0]();
}

uint64_t SimilarityModelVersionFromSceneAnalysisVersion()
{
  return MEMORY[0x270F53C90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void abort(void)
{
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_snrm2_NEWLAPACK()
{
  return MEMORY[0x270EDE480]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double erfc(long double __x)
{
  MEMORY[0x270ED9788](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x270EDBF48]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}